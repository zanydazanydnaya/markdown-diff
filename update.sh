#!/usr/bin/env bash
set -eu

#DocumentUpOptions+=(
#    google_analytics="UA-...."
#)

#insert-nav-extras() {
#    echo '<div class="extra"><a href="http://${GitHubRepo%/*}.github.io/${GitHubRepo#*/}">Home</a></div>'
#}

mirror-master .

# Polish the README a bit for gh-pages, e.g., style fix, and Fork me at GitHub ribbon
cat >>README.md <<EOF
<div><a href="https://github.com/netj/markdown-diff" id="github-ribbon"><img src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub"></a></div>
<style>
#content blockquote { font-style: normal; }
</style>
EOF
compile-markdown . name="${GitHubRepo#*/}"
mv -f preview.html index.html
git add index.html

mirror-master example