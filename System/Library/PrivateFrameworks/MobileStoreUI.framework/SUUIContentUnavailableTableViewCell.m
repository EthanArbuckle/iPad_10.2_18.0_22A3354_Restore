@implementation SUUIContentUnavailableTableViewCell

- (SUUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIContentUnavailableTableViewCell *v4;
  SUUIContentUnavailableTableViewCell *v5;
  id v6;
  uint64_t v7;
  _UIContentUnavailableView *view;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIContentUnavailableTableViewCell;
  v4 = -[SUUITableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUIContentUnavailableTableViewCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v6 = objc_alloc(MEMORY[0x24BEBDBB0]);
    v7 = objc_msgSend(v6, "initWithFrame:title:style:", 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    view = v5->_view;
    v5->_view = (_UIContentUnavailableView *)v7;

    -[SUUIContentUnavailableTableViewCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_view);

  }
  return v5;
}

- (NSString)title
{
  return (NSString *)-[_UIContentUnavailableView title](self->_view, "title");
}

- (void)setTitle:(id)a3
{
  -[_UIContentUnavailableView setTitle:](self->_view, "setTitle:", a3);
}

- (NSString)message
{
  return (NSString *)-[_UIContentUnavailableView message](self->_view, "message");
}

- (void)setMessage:(id)a3
{
  -[_UIContentUnavailableView setMessage:](self->_view, "setMessage:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIContentUnavailableTableViewCell;
  -[SUUITableViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SUUIContentUnavailableTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_UIContentUnavailableView setFrame:](self->_view, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
