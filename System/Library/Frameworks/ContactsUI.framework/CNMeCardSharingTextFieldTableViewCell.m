@implementation CNMeCardSharingTextFieldTableViewCell

- (void)setTextField:(id)a3
{
  UITextField *v5;
  UITextField **p_textField;
  UITextField *textField;
  void *v8;
  void *v9;
  void *v10;
  UITextField *v11;

  v5 = (UITextField *)a3;
  p_textField = &self->_textField;
  textField = self->_textField;
  if (textField != v5)
  {
    v11 = v5;
    -[UITextField superview](textField, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingTextFieldTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[UITextField removeFromSuperview](*p_textField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textField, a3);
    -[CNMeCardSharingTextFieldTableViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_textField);

    v5 = v11;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double Width;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingTextFieldTableViewCell;
  -[CNMeCardSharingTextFieldTableViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[CNMeCardSharingTextFieldTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  -[CNMeCardSharingTextFieldTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v13);
  -[CNMeCardSharingTextFieldTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v8 = v7;
  -[CNMeCardSharingTextFieldTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v10 = Width - (v8 + v9);
  -[CNMeCardSharingTextFieldTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[UITextField setFrame:](self->_textField, "setFrame:", v4, 0.0, v10, CGRectGetHeight(v14));

}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNMeCardSharingTextFieldTableViewCell");
}

@end
