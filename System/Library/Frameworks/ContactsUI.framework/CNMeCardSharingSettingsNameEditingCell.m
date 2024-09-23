@implementation CNMeCardSharingSettingsNameEditingCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CNMeCardSharingSettingsNameEditingCell;
  -[CNMeCardSharingSettingsNameEditingCell layoutSubviews](&v15, sel_layoutSubviews);
  -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v16);
  -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMargins");
  v13 = Width - (v10 + v12);
  -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[UITextField setFrame:](self->_textField, "setFrame:", v5, 0.0, v13, CGRectGetHeight(v17));

}

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
  v11 = v5;
  if (textField != v5)
  {
    -[UITextField superview](textField, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UITextField removeFromSuperview](*p_textField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textField, a3);
    -[CNMeCardSharingSettingsNameEditingCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_textField);

  }
  -[CNMeCardSharingSettingsNameEditingCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)prepareForReuse
{
  UITextField *textField;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsNameEditingCell;
  -[CNMeCardSharingSettingsNameEditingCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UITextField removeFromSuperview](self->_textField, "removeFromSuperview");
  textField = self->_textField;
  self->_textField = 0;

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
  return CFSTR("CNMeCardSharingSettingsNameEditingCell");
}

@end
