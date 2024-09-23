@implementation WDProfileTableViewCell

+ (double)editingTrailingEdgeMargin
{
  return 15.0;
}

+ (double)notEditingTrailingEdgeMargin
{
  return 5.0;
}

- (WDProfileTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDProfileTableViewCell *v4;
  WDProfileTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDProfileTableViewCell;
  v4 = -[WDProfileTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDProfileTableViewCell _setupUI](v4, "_setupUI");
  return v5;
}

- (void)updateAutomationIdentifiersForProfileDetail:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("HealthDetail");
  v14[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDProfileTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);
  v13[0] = v7;
  v13[1] = CFSTR("Title");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_displayNameLabel, "setAccessibilityIdentifier:", v9);

  v12[0] = v7;
  v12[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setAccessibilityIdentifier:](self->_displayValueTextField, "setAccessibilityIdentifier:", v11);

}

- (void)_setupUI
{
  UIColor *v3;
  UIColor *normalDisplayValueColor;
  UIColor *v5;
  UIColor *selectedDisplayValueColor;
  UILabel *v7;
  UILabel *displayNameLabel;
  UITextField *v9;
  UITextField *displayValueTextField;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *clearButton;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  normalDisplayValueColor = self->_normalDisplayValueColor;
  self->_normalDisplayValueColor = v3;

  HKHealthKeyColor();
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectedDisplayValueColor = self->_selectedDisplayValueColor;
  self->_selectedDisplayValueColor = v5;

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  displayNameLabel = self->_displayNameLabel;
  self->_displayNameLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_displayNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (UITextField *)objc_alloc_init(MEMORY[0x24BDF6EA8]);
  displayValueTextField = self->_displayValueTextField;
  self->_displayValueTextField = v9;

  -[UITextField setDelegate:](self->_displayValueTextField, "setDelegate:", self);
  -[UITextField setTextColor:](self->_displayValueTextField, "setTextColor:", self->_normalDisplayValueColor);
  -[UITextField setUserInteractionEnabled:](self->_displayValueTextField, "setUserInteractionEnabled:", 0);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_displayValueTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)MEMORY[0x24BDF6AC8];
  HKHealthUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("remove_button_minus"), v12);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_flatImageWithColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
  clearButton = self->_clearButton;
  self->_clearButton = v15;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_clearButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setImage:forState:](self->_clearButton, "setImage:forState:", v14, 0);
  -[WDProfileTableViewCell _updateClearButtonState](self, "_updateClearButtonState");
  -[WDProfileTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_clearButton);

  -[WDProfileTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_displayNameLabel);

  -[WDProfileTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_displayValueTextField);

  -[WDProfileTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  -[WDProfileTableViewCell _setupConstraints](self, "_setupConstraints");

}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_displayNameLabel, "setFont:", v5);
  -[UITextField setFont:](self->_displayValueTextField, "setFont:", v5);
  -[UILabel setTextAlignment:](self->_displayNameLabel, "setTextAlignment:", 4);
  v3 = 2 * (objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) != 1);
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
    v4 = 4;
  else
    v4 = v3;
  -[UITextField setTextAlignment:](self->_displayValueTextField, "setTextAlignment:", v4);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_displayNameLabel, "setAdjustsFontSizeToFitWidth:", 0);
  -[UITextField setAdjustsFontSizeToFitWidth:](self->_displayValueTextField, "setAdjustsFontSizeToFitWidth:", HKUIApplicationIsUsingAccessibilityContentSizeCategory());
  -[UILabel setNumberOfLines:](self->_displayNameLabel, "setNumberOfLines:", 0);

}

- (void)_setupNonAccessibilitySizeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *normalSizeConstraints;
  void *v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  -[WDProfileTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_displayNameLabel, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v3, 12.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  -[UIButton leadingAnchor](self->_clearButton, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_displayNameLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  -[UITextField topAnchor](self->_displayValueTextField, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 12.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  normalSizeConstraints = self->_normalSizeConstraints;
  self->_normalSizeConstraints = v12;

}

- (void)_setupAccessibilitySizeConstraintsWithTrailingConstant:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *accessibilitySizeConstraints;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  -[UILabel trailingAnchor](self->_displayNameLabel, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  -[UITextField topAnchor](self->_displayValueTextField, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_displayNameLabel, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 12.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  -[UIButton leadingAnchor](self->_clearButton, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 20.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  -[WDProfileTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField trailingAnchor](self->_displayValueTextField, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  accessibilitySizeConstraints = self->_accessibilitySizeConstraints;
  self->_accessibilitySizeConstraints = v14;

}

- (void)_setupConstraints
{
  int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *displayValueTrailingConstraint;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *clearButtonWidthAnchor;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *displayValueLeadingAnchor;
  NSLayoutConstraint *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[10];

  v40[8] = *MEMORY[0x24BDAC8D0];
  v3 = -[WDProfileTableViewCell isEditing](self, "isEditing");
  v4 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v4, "editingTrailingEdgeMargin");
  else
    objc_msgSend(v4, "notEditingTrailingEdgeMargin");
  v6 = v5;
  -[WDProfileTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField trailingAnchor](self->_displayValueTextField, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v6);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  displayValueTrailingConstraint = self->_displayValueTrailingConstraint;
  self->_displayValueTrailingConstraint = v10;

  -[UIButton widthAnchor](self->_clearButton, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 22.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  clearButtonWidthAnchor = self->_clearButtonWidthAnchor;
  self->_clearButtonWidthAnchor = v13;

  -[UITextField leadingAnchor](self->_displayValueTextField, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_clearButton, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 5.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  displayValueLeadingAnchor = self->_displayValueLeadingAnchor;
  self->_displayValueLeadingAnchor = v17;

  -[WDProfileTableViewCell _setupNonAccessibilitySizeConstraints](self, "_setupNonAccessibilitySizeConstraints");
  -[WDProfileTableViewCell _setupAccessibilitySizeConstraintsWithTrailingConstant:](self, "_setupAccessibilitySizeConstraintsWithTrailingConstant:", v6);
  v32 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_displayNameLabel, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 12.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v36;
  -[UILabel leadingAnchor](self->_displayNameLabel, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 20.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_clearButtonWidthAnchor;
  v40[1] = v31;
  v40[2] = v19;
  -[UIButton heightAnchor](self->_clearButton, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 22.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v20;
  -[UIButton centerYAnchor](self->_clearButton, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField centerYAnchor](self->_displayValueTextField, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_displayValueLeadingAnchor;
  v40[4] = v23;
  v40[5] = v24;
  v40[6] = self->_displayValueTrailingConstraint;
  -[WDProfileTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField bottomAnchor](self->_displayValueTextField, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 12.5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v29);

  -[WDProfileTableViewCell _setupConstraintsForContentSize](self, "_setupConstraintsForContentSize");
}

- (void)_setupConstraintsForContentSize
{
  int IsUsingAccessibilityContentSizeCategory;
  int *v4;
  int *v5;
  double v6;
  double v7;

  IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  if (IsUsingAccessibilityContentSizeCategory)
    v4 = &OBJC_IVAR___WDProfileTableViewCell__normalSizeConstraints;
  else
    v4 = &OBJC_IVAR___WDProfileTableViewCell__accessibilitySizeConstraints;
  if (IsUsingAccessibilityContentSizeCategory)
    v5 = &OBJC_IVAR___WDProfileTableViewCell__accessibilitySizeConstraints;
  else
    v5 = &OBJC_IVAR___WDProfileTableViewCell__normalSizeConstraints;
  if (IsUsingAccessibilityContentSizeCategory)
    v6 = 0.0;
  else
    v6 = 22.0;
  if (IsUsingAccessibilityContentSizeCategory)
    v7 = 0.0;
  else
    v7 = 5.0;
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v4));
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  -[NSLayoutConstraint setConstant:](self->_clearButtonWidthAnchor, "setConstant:", v6);
  -[NSLayoutConstraint setConstant:](self->_displayValueLeadingAnchor, "setConstant:", v7);
}

- (void)setDisplayName:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_displayName, a3);
  -[UILabel text](self->_displayNameLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    -[UILabel setText:](self->_displayNameLabel, "setText:", v7);
    -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setDisplayValue:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_displayValue, a3);
  -[UITextField text](self->_displayValueTextField, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    -[UITextField setText:](self->_displayValueTextField, "setText:", v7);
    -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setPlaceholderValue:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_placeholderValue, a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
  -[UITextField setAttributedPlaceholder:](self->_displayValueTextField, "setAttributedPlaceholder:", v5);

  -[WDProfileTableViewCell displayValue](self, "displayValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)setShouldUseSelectedColorForDisplayValue:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  UIColor *v6;
  UIColor *v7;
  id v8;
  NSString *placeholderValue;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  self->_shouldUseSelectedColorForDisplayValue = a3;
  v5 = &OBJC_IVAR___WDProfileTableViewCell__normalDisplayValueColor;
  if (a3)
    v5 = &OBJC_IVAR___WDProfileTableViewCell__selectedDisplayValueColor;
  -[UITextField setTextColor:](self->_displayValueTextField, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
  if (self->_placeholderValue)
  {
    if (v3)
    {
      v6 = self->_selectedDisplayValueColor;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_alloc(MEMORY[0x24BDD1688]);
    placeholderValue = self->_placeholderValue;
    v12 = *MEMORY[0x24BDF6600];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", placeholderValue, v10);
    -[UITextField setAttributedPlaceholder:](self->_displayValueTextField, "setAttributedPlaceholder:", v11);

  }
}

- (void)setShouldDisplayClearButtonDuringEditing:(BOOL)a3
{
  self->_shouldDisplayClearButtonDuringEditing = a3;
  -[WDProfileTableViewCell _updateClearButtonState](self, "_updateClearButtonState");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WDProfileTableViewCell;
  -[WDProfileTableViewCell setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  v6 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v6, "editingTrailingEdgeMargin");
  else
    objc_msgSend(v6, "notEditingTrailingEdgeMargin");
  -[NSLayoutConstraint setConstant:](self->_displayValueTrailingConstraint, "setConstant:");
  -[WDProfileTableViewCell _updateClearButtonState](self, "_updateClearButtonState");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDProfileTableViewCell;
  -[WDProfileTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDProfileTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[WDProfileTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
      -[WDProfileTableViewCell _setupConstraintsForContentSize](self, "_setupConstraintsForContentSize");
      -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  -[WDProfileTableViewCell inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WDProfileTableViewCell;
    return -[WDProfileTableViewCell becomeFirstResponder](&v7, sel_becomeFirstResponder);
  }
  else
  {
    -[WDProfileTableViewCell displayValueTextField](self, "displayValueTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "becomeFirstResponder");

    return v6;
  }
}

- (void)addClearButtonTarget:(id)a3 action:(SEL)a4
{
  -[UIButton addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)removeClearButtonTarget:(id)a3 action:(SEL)a4
{
  -[UIButton removeTarget:action:forControlEvents:](self->_clearButton, "removeTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)_updateClearButtonState
{
  int v3;
  uint64_t v4;
  int v5;
  double v6;
  int v7;
  double v8;

  v3 = -[UIButton isHidden](self->_clearButton, "isHidden");
  if (-[WDProfileTableViewCell shouldDisplayClearButtonDuringEditing](self, "shouldDisplayClearButtonDuringEditing"))
    v4 = -[WDProfileTableViewCell isEditing](self, "isEditing") ^ 1;
  else
    v4 = 1;
  -[UIButton setHidden:](self->_clearButton, "setHidden:", v4);
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    v5 = -[UIButton isHidden](self->_clearButton, "isHidden");
    v6 = 22.0;
    if (v5)
      v6 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_clearButtonWidthAnchor, "setConstant:", v6);
    v7 = -[UIButton isHidden](self->_clearButton, "isHidden");
    v8 = 5.0;
    if (v7)
      v8 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_displayValueLeadingAnchor, "setConstant:", v8);
  }
  if (v3 != -[UIButton isHidden](self->_clearButton, "isHidden"))
    -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateClearButtonStateForBirthdate
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    -[NSLayoutConstraint setConstant:](self->_clearButtonWidthAnchor, "setConstant:", 22.0);
    -[NSLayoutConstraint setConstant:](self->_displayValueLeadingAnchor, "setConstant:", 5.0);
  }
  -[WDProfileTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSString)placeholderValue
{
  return self->_placeholderValue;
}

- (BOOL)shouldUseSelectedColorForDisplayValue
{
  return self->_shouldUseSelectedColorForDisplayValue;
}

- (BOOL)shouldDisplayClearButtonDuringEditing
{
  return self->_shouldDisplayClearButtonDuringEditing;
}

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (UITextField)displayValueTextField
{
  return self->_displayValueTextField;
}

- (void)setDisplayValueTextField:(id)a3
{
  objc_storeStrong((id *)&self->_displayValueTextField, a3);
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_displayValueTextField, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_placeholderValue, 0);
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accessibilitySizeConstraints, 0);
  objc_storeStrong((id *)&self->_normalSizeConstraints, 0);
  objc_storeStrong((id *)&self->_birthdatePickerLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_displayValueLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_clearButtonWidthAnchor, 0);
  objc_storeStrong((id *)&self->_birthdatePickerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_displayValueTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_selectedDisplayValueColor, 0);
  objc_storeStrong((id *)&self->_normalDisplayValueColor, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end
