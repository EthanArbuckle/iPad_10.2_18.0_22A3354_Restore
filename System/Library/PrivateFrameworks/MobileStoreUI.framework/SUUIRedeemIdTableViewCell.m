@implementation SUUIRedeemIdTableViewCell

- (SUUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIRedeemIdTableViewCell *v4;
  SUUIRedeemIdTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemIdTableViewCell;
  v4 = -[SUUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUIRedeemIdTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[SUUIRedeemIdTableViewCell _initializeTextField](v5, "_initializeTextField");
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  -[SUUIRedeemIdTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUIRedeemIdTableViewCell separatorInset](self, "separatorInset");
  v13 = v12;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v21 = CGRectInset(v20, v13, 0.0);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19.receiver = self;
  v19.super_class = (Class)SUUIRedeemIdTableViewCell;
  -[SUUIRedeemIdTableViewCell layoutSubviews](&v19, sel_layoutSubviews);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

  return 1;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  return 1;
}

- (void)setPlaceholderText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (void)setKeyboardType:(int64_t)a3
{
  id v4;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", a3);

}

- (void)setReturnKeyType:(int64_t)a3
{
  id v4;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", a3);

}

- (void)setAutoCapitalizationType:(int64_t)a3
{
  id v4;

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", a3);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUUIRedeemIdTableViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "redeemIdCell:didReturnWithText:", self, v6);
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUUIRedeemIdTableViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "redeemIdCell:didChangeToText:", self, v5);
}

- (void)_initializeTextField
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x24BEBDA48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SUUIRedeemIdTableViewCell setTextField:](self, "setTextField:", v4);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClearButtonMode:", 1);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);

  -[SUUIRedeemIdTableViewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemIdTableViewCell textField](self, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

}

- (SUUIRedeemIdTableViewCellDelegate)delegate
{
  return (SUUIRedeemIdTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
