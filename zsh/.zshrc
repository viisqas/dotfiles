export ZSH="/Users/visqas/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git colored-man colorize pip python brew osx zsh-syntax-highlighting copyfile vscode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias v=vim

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

function top_commands {
  cat ~/.zsh_history | format_history | head -n20
}
alias tc=top_commands

function top_recent_commands {
  tail -n1000 ~/.zsh_history | format_history | head -n20
}
alias trc=top_recent_commands

function format_history {
  cut -d ';' -f 2- 2>/dev/null |
    awk '{a[$1]++ } END{for(i in a){print a[i] " " i}}'|
    sort -rn
}

