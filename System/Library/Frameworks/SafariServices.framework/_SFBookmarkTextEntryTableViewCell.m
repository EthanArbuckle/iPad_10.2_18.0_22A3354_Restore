@implementation _SFBookmarkTextEntryTableViewCell

- (_SFBookmarkTextEntryTableViewCell)initWithText:(id)a3 autocapitalizationType:(int64_t)a4 autocorrectionType:(int64_t)a5
{
  id v8;
  _SFBookmarkTextEntryTableViewCell *v9;
  UITextField *v10;
  UITextField *textField;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *leadingConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _SFBookmarkTextEntryTableViewCell *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SFBookmarkTextEntryTableViewCell;
  v9 = -[_SFBookmarkTextEntryTableViewCell init](&v36, sel_init);
  if (v9)
  {
    v10 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v9->_textField;
    v9->_textField = v10;

    -[UITextField setAdjustsFontForContentSizeCategory:](v9->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setAdjustsFontSizeToFitWidth:](v9->_textField, "setAdjustsFontSizeToFitWidth:", 1);
    -[UITextField setAutocapitalizationType:](v9->_textField, "setAutocapitalizationType:", a4);
    -[UITextField setAutocorrectionType:](v9->_textField, "setAutocorrectionType:", a5);
    -[UITextField setClearButtonMode:](v9->_textField, "setClearButtonMode:", 1);
    -[UITextField setEnablesReturnKeyAutomatically:](v9->_textField, "setEnablesReturnKeyAutomatically:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v9->_textField, "setFont:", v12);

    -[UITextField setReturnKeyType:](v9->_textField, "setReturnKeyType:", 9);
    -[UITextField setText:](v9->_textField, "setText:", v8);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v9->_textField, "setTextColor:", v13);

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v9->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFBookmarkTextEntryTableViewCell contentView](v9, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v9->_textField);

    -[_SFBookmarkTextEntryTableViewCell contentView](v9, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField leadingAnchor](v9->_textField, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v35 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    leadingConstraint = v9->_leadingConstraint;
    v9->_leadingConstraint = (NSLayoutConstraint *)v18;

    v30 = (void *)MEMORY[0x1E0CB3718];
    v37[0] = v9->_leadingConstraint;
    objc_msgSend(v15, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField trailingAnchor](v9->_textField, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v33, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v32;
    -[UITextField topAnchor](v9->_textField, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v21;
    -[UITextField bottomAnchor](v9->_textField, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v24;
    -[UITextField heightAnchor](v9->_textField, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v27);

    v8 = v35;
    v28 = v9;

  }
  return v9;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFBookmarkTextEntryTableViewCell;
  -[_SFBookmarkTextEntryTableViewCell updateConstraints](&v6, sel_updateConstraints);
  -[_SFBookmarkTextEntryTableViewCell separatorInset](self, "separatorInset");
  v4 = v3;
  -[_SFBookmarkTextEntryTableViewCell safeAreaInsets](self, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", v4 - v5);
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFBookmarkTextEntryTableViewCell;
  -[_SFBookmarkTextEntryTableViewCell setSeparatorInset:](&v4, sel_setSeparatorInset_, a3.top, a3.left, a3.bottom, a3.right);
  -[_SFBookmarkTextEntryTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFBookmarkTextEntryTableViewCell;
  -[_SFBookmarkTextEntryTableViewCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[_SFBookmarkTextEntryTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFBookmarkTextEntryTableViewCell;
  -[_SFBookmarkTextEntryTableViewCell safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[_SFBookmarkTextEntryTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UITextField)editableTextField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
}

@end
