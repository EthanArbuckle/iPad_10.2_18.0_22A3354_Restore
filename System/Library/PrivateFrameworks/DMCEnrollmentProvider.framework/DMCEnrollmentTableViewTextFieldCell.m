@implementation DMCEnrollmentTableViewTextFieldCell

- (DMCEnrollmentTableViewTextFieldCell)initWithType:(unint64_t)a3
{
  objc_class *v5;
  void *v6;
  DMCEnrollmentTableViewTextFieldCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)DMCEnrollmentTableViewTextFieldCell;
  v7 = -[DMCEnrollmentTableViewTextFieldCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 1000, v6);

  if (v7)
  {
    -[DMCEnrollmentTableViewTextFieldCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewTextFieldCell setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[DMCEnrollmentTableViewTextFieldCell editableTextField](v7, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewTextFieldCell _placeHolderStringForType:](v7, "_placeHolderStringForType:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaceholder:", v10);

    objc_msgSend(v9, "setAutocorrectionType:", 1);
    objc_msgSend(v9, "setAutocapitalizationType:", 0);
    if (a3)
      objc_msgSend(v9, "setSecureTextEntry:", 1);
    else
      objc_msgSend(v9, "setKeyboardType:", 7);
    objc_msgSend(v9, "setEnablesReturnKeyAutomatically:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v12);

    -[DMCEnrollmentTableViewTextFieldCell setSeparatorStyle:](v7, "setSeparatorStyle:", 1);
  }
  return v7;
}

- (id)_placeHolderStringForType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    DMCLocalizedString();
    self = (DMCEnrollmentTableViewTextFieldCell *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double Width;
  void *v5;
  uint64_t v6;
  double MinX;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)DMCEnrollmentTableViewTextFieldCell;
  -[DMCEnrollmentTableViewTextFieldCell layoutSubviews](&v20, sel_layoutSubviews);
  v3 = -[DMCEnrollmentTableViewTextFieldCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[DMCEnrollmentTableViewTextFieldCell bounds](self, "bounds");
  Width = CGRectGetWidth(v21);
  -[DMCEnrollmentTableViewTextFieldCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  if (v3)
    MinX = CGRectGetMinX(*(CGRect *)&v6);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v6);
  v11 = Width - MinX;

  -[DMCEnrollmentTableViewTextFieldCell textField](self, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[DMCEnrollmentTableViewTextFieldCell bounds](self, "bounds");
  v15 = CGRectGetWidth(v22) + v11 * -2.0;
  -[DMCEnrollmentTableViewTextFieldCell textField](self, "textField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  -[DMCEnrollmentTableViewTextFieldCell textField](self, "textField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v14, v15, v18);

}

- (double)cellHeight
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[DMCEnrollmentTableViewTextFieldCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v4 = v3;

  result = v4 * 1.2 + 15.0;
  if (result < 50.0)
    return 50.0;
  return result;
}

- (double)estimatedCellHeight
{
  return 50.0;
}

@end
