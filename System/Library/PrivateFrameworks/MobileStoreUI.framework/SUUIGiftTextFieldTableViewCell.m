@implementation SUUIGiftTextFieldTableViewCell

- (SUUIGiftTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIGiftTextFieldTableViewCell *v4;
  SUUIGiftTextFieldTableViewCell *v5;
  void *v6;
  UITextField *v7;
  UITextField *textField;
  UITextField *v9;
  void *v10;
  UITextField *v11;
  void *v12;
  UITextField *v13;
  void *v14;
  UIView *v15;
  UIView *topBorderView;
  UIView *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  v4 = -[SUUIGiftTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SUUIGiftTextFieldTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    textField = v5->_textField;
    v5->_textField = v7;

    v9 = v5->_textField;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = v5->_textField;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v11, "setFont:", v12);

    v13 = v5->_textField;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v13, "setTextColor:", v14);

    -[UITextField sizeToFit](v5->_textField, "sizeToFit");
    objc_msgSend(v6, "addSubview:", v5->_textField);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topBorderView = v5->_topBorderView;
    v5->_topBorderView = v15;

    v17 = v5->_topBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    objc_msgSend(v6, "addSubview:", v5->_topBorderView);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_leftToRight = objc_msgSend(v19, "userInterfaceLayoutDirection") == 0;

  }
  return v5;
}

- (NSAttributedString)attributedPlaceholder
{
  return -[UITextField attributedPlaceholder](self->_textField, "attributedPlaceholder");
}

- (BOOL)isEnabled
{
  return -[UITextField isEnabled](self->_textField, "isEnabled");
}

- (int64_t)keyboardType
{
  return -[UITextField keyboardType](self->_textField, "keyboardType");
}

- (NSString)label
{
  return -[UILabel text](self->_label, "text");
}

- (void)setAttributedPlaceholder:(id)a3
{
  -[UITextField setAttributedPlaceholder:](self->_textField, "setAttributedPlaceholder:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  UITextField *textField;
  void *v6;
  void *v7;
  id v8;

  -[UITextField setEnabled:](self->_textField, "setEnabled:");
  textField = self->_textField;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (a3)
  {
    -[UITextField setTextColor:](textField, "setTextColor:", v6);
  }
  else
  {
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](textField, "setTextColor:", v7);

  }
}

- (void)setKeyboardType:(int64_t)a3
{
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", a3 != 7);
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", a3);
}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[SUUIGiftTextFieldTableViewCell label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    label = self->_label;
    if (v16)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_label;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_label;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SUUIGiftTextFieldTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_label);

        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      -[UILabel sizeToFit](self->_label, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](label, "removeFromSuperview");
      v15 = self->_label;
      self->_label = 0;

    }
    -[SUUIGiftTextFieldTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextFieldDelegate:(id)a3
{
  -[UITextField setDelegate:](self->_textField, "setDelegate:", a3);
}

- (void)setValue:(id)a3
{
  -[UITextField setText:](self->_textField, "setText:", a3);
}

- (UITextFieldDelegate)textFieldDelegate
{
  return (UITextFieldDelegate *)-[UITextField delegate](self->_textField, "delegate");
}

- (NSString)value
{
  return -[UITextField text](self->_textField, "text");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  UITextField *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  -[SUUIGiftTextFieldTableViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    v6 = self->_textField;

    v5 = v6;
  }
  return v5;
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
  UILabel *label;
  double width;
  double height;
  double v14;
  double MaxX;
  float v16;
  double v17;
  BOOL v18;
  UILabel *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  BOOL v30;
  UITextField *textField;
  double v32;
  double v33;
  double v34;
  double v35;
  UIView *topBorderView;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)SUUIGiftTextFieldTableViewCell;
  -[SUUIGiftTextFieldTableViewCell layoutSubviews](&v43, sel_layoutSubviews);
  -[SUUIGiftTextFieldTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v39 = v5;
  v41 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v7 + -15.0;
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    width = v44.size.width;
    height = v44.size.height;
    v14 = 15.0;
    v44.origin.x = 15.0;
    MaxX = CGRectGetMaxX(v44);
    v16 = (v9 - height) * 0.5;
    v17 = floorf(v16);
    -[UILabel setFrame:](self->_label, "setFrame:", 15.0, v17, width, height);
    v18 = -[SUUIGiftTextFieldTableViewCell leftToRight](self, "leftToRight");
    v19 = self->_label;
    if (!v18)
    {
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v17, width, height, v41, v39, v7, v9);
      v14 = v20;
      v17 = v21;
      width = v22;
      height = v23;
    }
    v24 = MaxX + 5.0;
    -[UILabel setFrame:](v19, "setFrame:", v14, v17, width, height, *(_QWORD *)&v39, *(_QWORD *)&v41);
  }
  else
  {
    v24 = 15.0;
  }
  -[UITextField frame](self->_textField, "frame", *(_QWORD *)&v39, *(_QWORD *)&v41);
  v26 = v25;
  v27 = v10 - v24;
  v28 = (v9 - v25) * 0.5;
  v29 = floorf(v28);
  v30 = -[SUUIGiftTextFieldTableViewCell leftToRight](self, "leftToRight");
  textField = self->_textField;
  if (!v30)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v24, v29, v10 - v24, v26, v42, v40, v7, v9);
    v24 = v32;
    v29 = v33;
    v27 = v34;
    v26 = v35;
  }
  -[UITextField setFrame:](textField, "setFrame:", v24, v29, v27, v26);
  topBorderView = self->_topBorderView;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scale");
  -[UIView setFrame:](topBorderView, "setFrame:", 15.0, 0.0, v7 + -15.0, 1.0 / v38);

}

- (UIControl)textField
{
  return &self->_textField->super;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
