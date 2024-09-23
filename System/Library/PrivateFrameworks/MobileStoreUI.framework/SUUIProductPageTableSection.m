@implementation SUUIProductPageTableSection

- (double)heightForTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4 || !objc_msgSend(v5, "requiresTruncation"))
      objc_msgSend(v6, "textSize");
    else
      objc_msgSend(v6, "truncatedSize");
    v8 = v7 + 10.0 + 22.0 + 2.0 + 12.0;
  }
  else
  {
    v8 = 80.0;
  }

  return v8;
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (id)textBoxTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  SUUITextBoxTableViewCell *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("TB"), a4);
  v4 = (SUUITextBoxTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[SUUITextBoxTableViewCell initWithStyle:reuseIdentifier:]([SUUITextBoxTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("TB"));
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUITableViewCell setBottomBorderColor:](v4, "setBottomBorderColor:", v5);

    -[SUUITextBoxTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
