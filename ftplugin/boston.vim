function WriteTemporary(fileName)
	execute "w! ~\\Documents\\vimtmp\\".a:fileName
endfunction
function SetUpDiff(ftyp)
	execute "Wt before.".a:ftyp
	execute "normal! \<C-w>\<Right>"
	execute "enew"
	execute "Wt after.".a:ftyp
endfunction
function AutoFormat(ftyp)
	execute "set syn=".a:ftyp
	execute "set filetype=".a:ftyp
	execute "set smartindent"
	if a:ftyp=="Xml"
		execute "%s/>[ \t\r\n]*</>\r</g"
	endif
	normal gg=G
endfunction

command -nargs=1 Wt execute 'call WriteTemporary(<f-args>)'

" Map F1 thru F8 to buffers
map <F1> :b 1<CR>
map <F2> :b 2<CR>
map <F3> :b 3<CR>
map <F4> :b 4<CR>
map <F5> :b 5<CR>
map <F6> :b 6<CR>
map <F7> :b 7<CR>
map <F8> :b 8<CR>
" Set up two files for a comparison
nmap <F11>j <C-w>v:call SetUpDiff("java")<CR>
nmap <F11>s <C-w>v:call SetUpDiff("js")<CR>
nmap <F11>h <C-w>v:call SetUpDiff("html")<CR>
nmap <F11>c <C-w>v:call SetUpDiff("css")<CR>
" Set the colors & indentation for a file type
map <F12>j :call AutoFormat("Java")<CR>
map <F12>s :call AutoFormat("Javascript")<CR>
map <F12>h :call AutoFormat("Html")<CR>
map <F12>c :call AutoFormat("Css")<CR>
map <F12>x :call AutoFormat("Xml")<CR>
map <A-q> :qa!<CR>
