@implementation SUUITextBoxTableViewCell

- (SUUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUITextBoxTableViewCell *v4;
  SUUITextBoxTableViewCell *v5;
  void *v6;
  __int128 v7;
  SUUITextBoxView *v8;
  uint64_t v9;
  SUUITextBoxView *textBoxView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUITextBoxTableViewCell;
  v4 = -[SUUITableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUITextBoxTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)&v5->_textBoxInsets.top = *MEMORY[0x24BEBE158];
    *(_OWORD *)&v5->_textBoxInsets.bottom = v7;
    v8 = [SUUITextBoxView alloc];
    objc_msgSend(v6, "bounds");
    v9 = -[SUUITextBoxView initWithFrame:](v8, "initWithFrame:");
    textBoxView = v5->_textBoxView;
    v5->_textBoxView = (SUUITextBoxView *)v9;

    -[SUUITextBoxView setEnabled:](v5->_textBoxView, "setEnabled:", 0);
    objc_msgSend(v6, "addSubview:", v5->_textBoxView);

  }
  return v5;
}

- (void)prepareForReuse
{
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUITextBoxTableViewCell;
  -[SUUITableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *(_OWORD *)&self->_textBoxInsets.top = *MEMORY[0x24BEBE158];
  *(_OWORD *)&self->_textBoxInsets.bottom = v3;
}

- (void)setBackgroundColor:(id)a3
{
  SUUITextBoxView *textBoxView;
  id v5;
  objc_super v6;

  textBoxView = self->_textBoxView;
  v5 = a3;
  -[SUUITextBoxView setBackgroundColor:](textBoxView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxTableViewCell;
  -[SUUITextBoxTableViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)layoutSubviews
{
  SUUITextBoxView *textBoxView;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUITextBoxTableViewCell;
  -[SUUITableViewCell layoutSubviews](&v8, sel_layoutSubviews);
  textBoxView = self->_textBoxView;
  -[SUUITextBoxTableViewCell bounds](self, "bounds");
  -[SUUITextBoxView setFrame:](textBoxView, "setFrame:", v4 + self->_textBoxInsets.left, v5 + self->_textBoxInsets.top, v6 - (self->_textBoxInsets.left + self->_textBoxInsets.right), v7 - (self->_textBoxInsets.top + self->_textBoxInsets.bottom));
}

- (SUUITextBoxView)textBoxView
{
  return self->_textBoxView;
}

- (UIEdgeInsets)textBoxInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textBoxInsets.top;
  left = self->_textBoxInsets.left;
  bottom = self->_textBoxInsets.bottom;
  right = self->_textBoxInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextBoxInsets:(UIEdgeInsets)a3
{
  self->_textBoxInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
}

@end
