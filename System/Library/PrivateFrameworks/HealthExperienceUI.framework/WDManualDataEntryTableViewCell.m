@implementation WDManualDataEntryTableViewCell

- (WDManualDataEntryTableViewCell)initWithDisplayName:(id)a3 unitName:(id)a4 dataEntryType:(unint64_t)a5
{
  id v8;
  id v9;
  WDManualDataEntryTableViewCell *v10;
  WDManualDataEntryTableViewCell *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDManualDataEntryTableViewCell;
  v10 = -[WDManualDataEntryTableViewCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_dataEntryType = a5;
    -[WDManualDataEntryTableViewCell _updateDecimalSeparator](v10, "_updateDecimalSeparator");
    -[WDManualDataEntryTableViewCell _setupUIWithDisplayName:unitName:](v11, "_setupUIWithDisplayName:unitName:", v8, v9);
    -[WDManualDataEntryTableViewCell _setupConstraints](v11, "_setupConstraints");
    -[WDManualDataEntryTableViewCell _setupIntegerNumberFormatterIfNeeded](v11, "_setupIntegerNumberFormatterIfNeeded");
    -[WDManualDataEntryTableViewCell _updateForCurrentSizeCategory](v11, "_updateForCurrentSizeCategory");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v11;
}

- (WDManualDataEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (WDManualDataEntryTableViewCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDManualDataEntryTableViewCell;
  return -[WDManualDataEntryTableViewCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDManualDataEntryTableViewCell;
  -[WDManualDataEntryTableViewCell dealloc](&v4, sel_dealloc);
}

- (UIFont)bodyFont
{
  UIFont *bodyFont;
  UIFont *v4;
  UIFont *v5;

  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (void)setDisplayName:(id)a3
{
  -[UILabel setText:](self->_displayNameLabel, "setText:", a3);
  -[WDManualDataEntryTableViewCell _updateDisplayNameLabelConstraints](self, "_updateDisplayNameLabelConstraints");
  -[WDManualDataEntryTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)displayName
{
  return -[UILabel text](self->_displayNameLabel, "text");
}

- (NSString)value
{
  return -[UITextField text](self->_valueField, "text");
}

- (void)setValue:(id)a3
{
  -[UITextField setText:](self->_valueField, "setText:", a3);
}

- (void)_setupConstraints
{
  uint64_t v3;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *regularLayoutConstraints;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *largeTextValueFieldToUnitLabelSpacingConstraint;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *largeTextLayoutConstraints;
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
  void *v40;
  NSArray *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[11];

  v51[9] = *MEMORY[0x1E0C80C00];
  _NSDictionaryOfVariableBindings(CFSTR("_valueField, _displayNameLabel, _unitLabel"), self->_valueField, self->_displayNameLabel, self->_unitLabel, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|-10-[_displayNameLabel]-10-|"), 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);

  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v3;
  objc_msgSend(v7, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|-10-[_valueField]-10-|"), 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v8);

  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_addConstraintsWithFormat:options:views:", CFSTR("V:|-10-[_unitLabel]-10-|"), 0, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v10);

  regularLayoutConstraints = self->_regularLayoutConstraints;
  self->_regularLayoutConstraints = v4;
  v41 = v4;

  -[UITextField trailingAnchor](self->_valueField, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_unitLabel, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  largeTextValueFieldToUnitLabelSpacingConstraint = self->_largeTextValueFieldToUnitLabelSpacingConstraint;
  self->_largeTextValueFieldToUnitLabelSpacingConstraint = v14;

  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_displayNameLabel, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -10.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField bottomAnchor](self->_valueField, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v42;
  -[UILabel leadingAnchor](self->_displayNameLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 15.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v37;
  -[UILabel trailingAnchor](self->_displayNameLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 15.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v33;
  -[UITextField leadingAnchor](self->_valueField, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 15.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v29;
  -[UITextField topAnchor](self->_valueField, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_displayNameLabel, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v16, 3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_largeTextValueFieldToUnitLabelSpacingConstraint;
  v51[5] = v17;
  v51[6] = v18;
  -[UILabel firstBaselineAnchor](self->_unitLabel, "firstBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField firstBaselineAnchor](self->_valueField, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v21;
  -[UILabel trailingAnchor](self->_unitLabel, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 15.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 9);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  largeTextLayoutConstraints = self->_largeTextLayoutConstraints;
  self->_largeTextLayoutConstraints = v26;

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;

  -[WDManualDataEntryTableViewCell _updateFont](self, "_updateFont");
  -[WDManualDataEntryTableViewCell _updateDisplayNameLabelConstraints](self, "_updateDisplayNameLabelConstraints");
  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "characterDirectionForLanguage:", v5);

  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    v7 = 2 * (v6 == 2);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_regularLayoutConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_largeTextLayoutConstraints);
    -[UILabel text](self->_unitLabel, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
      v10 = 3.0;
    else
      v10 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_largeTextValueFieldToUnitLabelSpacingConstraint, "setConstant:", v10);
  }
  else
  {
    v7 = 2 * (v6 != 2);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_largeTextLayoutConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_regularLayoutConstraints);
  }
  -[UITextField setTextAlignment:](self->_valueField, "setTextAlignment:", v7);
}

- (void)_updateFont
{
  UIFont *bodyFont;
  void *v4;
  void *v5;
  void *v6;

  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_valueField, "setFont:", v4);

  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_displayNameLabel, "setFont:", v5);

  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_unitLabel, "setFont:", v6);

  -[WDManualDataEntryTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateDisplayNameLabelConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSArray *v12;
  NSArray *displayNameLabelConstraints;
  void *v14;
  id firstValue;

  if (self->_displayNameLabelConstraints)
  {
    -[WDManualDataEntryTableViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraints:", self->_displayNameLabelConstraints);

  }
  v4 = *MEMORY[0x1E0DC4FF8];
  v5 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  -[UILabel systemLayoutSizeFittingSize:](self->_displayNameLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  firstValue = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_unitLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[UILabel systemLayoutSizeFittingSize:](self->_unitLabel, "systemLayoutSizeFittingSize:", v4, v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("_valueField, _displayNameLabel, _unitLabel"), self->_valueField, self->_displayNameLabel, self->_unitLabel, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("displayNameLabelWidth, unitLabelWidth"), firstValue, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = CFSTR("H:|-15-[_displayNameLabel(displayNameLabelWidth)]-[_valueField]-3-[_unitLabel(unitLabelWidth)]-15-|");
  }
  else
  {
    _NSDictionaryOfVariableBindings(CFSTR("_valueField, _displayNameLabel"), self->_valueField, self->_displayNameLabel, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("displayNameLabelWidth"), firstValue, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("H:|-15-[_displayNameLabel(displayNameLabelWidth)]-[_valueField]-15-|");
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v11, 0, v10, v9);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  displayNameLabelConstraints = self->_displayNameLabelConstraints;
  self->_displayNameLabelConstraints = v12;

  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraints:", self->_displayNameLabelConstraints);

}

- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4
{
  id v6;
  UITextField *v7;
  UITextField *valueField;
  UITextField *v9;
  UITextField *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t dataEntryType;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *displayNameLabel;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *unitLabel;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  if (self->_dataEntryType == 3)
  {
    v7 = (UITextField *)objc_alloc_init(MEMORY[0x1E0D2F5F8]);
    -[UITextField setAllowsSelection:](v7, "setAllowsSelection:", 0);
    valueField = self->_valueField;
    self->_valueField = v7;
    v9 = v7;

    -[UITextField setAdjustsFontSizeToFitWidth:](self->_valueField, "setAdjustsFontSizeToFitWidth:", 1);
  }
  else
  {
    v10 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v9 = self->_valueField;
    self->_valueField = v10;
  }

  -[UITextField setDelegate:](self->_valueField, "setDelegate:", self);
  v11 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "characterDirectionForLanguage:", v13) != 2;

  -[UITextField setTextAlignment:](self->_valueField, "setTextAlignment:", 2 * v11);
  -[UITextField setUserInteractionEnabled:](self->_valueField, "setUserInteractionEnabled:", 0);
  -[UITextField addTarget:action:forControlEvents:](self->_valueField, "addTarget:action:forControlEvents:", self, sel__valueFieldDidChange_, 0x20000);
  dataEntryType = self->_dataEntryType;
  if (dataEntryType == 1)
  {
    v15 = 4;
    goto LABEL_8;
  }
  if (dataEntryType == 2)
  {
    v15 = 8;
LABEL_8:
    -[UITextField setKeyboardType:](self->_valueField, "setKeyboardType:", v15);
  }
  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](self->_valueField, "setFont:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](self->_valueField, "setTextColor:", v17);

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_valueField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_valueField);

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  displayNameLabel = self->_displayNameLabel;
  self->_displayNameLabel = v19;

  -[UILabel setText:](self->_displayNameLabel, "setText:", v29);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_displayNameLabel, "setTextColor:", v21);

  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_displayNameLabel, "setFont:", v22);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_displayNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_displayNameLabel);

  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  unitLabel = self->_unitLabel;
  self->_unitLabel = v24;

  -[UILabel setText:](self->_unitLabel, "setText:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_unitLabel, "setTextColor:", v26);

  -[WDManualDataEntryTableViewCell bodyFont](self, "bodyFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_unitLabel, "setFont:", v27);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_unitLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDManualDataEntryTableViewCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_unitLabel);

  -[WDManualDataEntryTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)_setupIntegerNumberFormatterIfNeeded
{
  NSNumberFormatter *v3;
  NSNumberFormatter *integerNumberFormatter;

  if (self->_dataEntryType - 1 <= 1)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    integerNumberFormatter = self->_integerNumberFormatter;
    self->_integerNumberFormatter = v3;

    -[NSNumberFormatter setMaximumFractionDigits:](self->_integerNumberFormatter, "setMaximumFractionDigits:", 0);
  }
}

- (void)beginEditing
{
  if (self->_dataEntryType - 1 <= 2)
  {
    -[UITextField setUserInteractionEnabled:](self->_valueField, "setUserInteractionEnabled:", 1);
    -[UITextField becomeFirstResponder](self->_valueField, "becomeFirstResponder");
  }
}

- (void)endEditing
{
  if (self->_dataEntryType - 1 <= 2)
  {
    -[UITextField setUserInteractionEnabled:](self->_valueField, "setUserInteractionEnabled:", 0);
    -[UITextField resignFirstResponder](self->_valueField, "resignFirstResponder");
  }
}

- (void)setInputView:(id)a3
{
  -[UITextField setInputView:](self->_valueField, "setInputView:", a3);
}

- (id)inputView
{
  return -[UITextField inputView](self->_valueField, "inputView");
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
  v9.super_class = (Class)WDManualDataEntryTableViewCell;
  -[WDManualDataEntryTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDManualDataEntryTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDManualDataEntryTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)_valueFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCell _sanitizedTextFieldText:](self, "_sanitizedTextFieldText:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setText:", v8);
  -[WDManualDataEntryTableViewCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "manualDataEntryTableViewCell:valueDidChangeToValue:", self, v7);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_dataEntryType != 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3;
  id v4;

  if (self->_shouldHighlightWhenEditing)
  {
    v3 = a3;
    objc_msgSend(v3, "tintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v4);

  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v3;
  id v4;
  id v5;

  if (self->_shouldHighlightWhenEditing)
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    v4 = a3;
    objc_msgSend(v3, "labelColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v5);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[WDManualDataEntryTableViewCell endEditing:](self, "endEditing:", 1);
  return 0;
}

- (void)_localeDidChange:(id)a3
{
  -[UITextField setText:](self->_valueField, "setText:", &stru_1E55A2388);
  -[WDManualDataEntryTableViewCell _updateDecimalSeparator](self, "_updateDecimalSeparator");
}

- (id)_removeDecimalSeparatorsFromText:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", self->_decimalSeparator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqual:](v5, "isEqual:", &stru_1E55A2388))
  {

    v5 = CFSTR("0");
  }
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", self->_decimalSeparator);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSNumberFormatter numberFromString:](self->_integerNumberFormatter, "numberFromString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (self->_dataEntryType == 1)
    {
      -[NSNumberFormatter stringFromNumber:](self->_integerNumberFormatter, "stringFromNumber:", v11);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v11)
      {
        v8 = 0;
        goto LABEL_13;
      }
      v13 = v10;
    }
    v8 = v13;
LABEL_13:

    goto LABEL_14;
  }
  -[NSNumberFormatter numberFromString:](self->_integerNumberFormatter, "numberFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
LABEL_14:

  return v8;
}

- (id)_sanitizedTextFieldText:(id)a3
{
  NSString *lastValidSanitizedText;
  NSString *v6;
  void *v7;
  NSString *v8;

  lastValidSanitizedText = (NSString *)a3;
  v6 = lastValidSanitizedText;
  if (self->_dataEntryType - 1 <= 1)
  {
    if (-[NSString length](lastValidSanitizedText, "length"))
    {
      -[WDManualDataEntryTableViewCell _removeDecimalSeparatorsFromText:](self, "_removeDecimalSeparatorsFromText:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
        objc_storeStrong((id *)&self->_lastValidSanitizedText, v7);

    }
    else
    {
      objc_storeStrong((id *)&self->_lastValidSanitizedText, a3);
    }
    lastValidSanitizedText = self->_lastValidSanitizedText;
  }
  v8 = lastValidSanitizedText;

  return v8;
}

- (void)_updateDecimalSeparator
{
  NSString *v3;
  NSString *decimalSeparator;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v5, "decimalSeparator");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  decimalSeparator = self->_decimalSeparator;
  self->_decimalSeparator = v3;

}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (BOOL)shouldHighlightWhenEditing
{
  return self->_shouldHighlightWhenEditing;
}

- (void)setShouldHighlightWhenEditing:(BOOL)a3
{
  self->_shouldHighlightWhenEditing = a3;
}

- (WDManualDataEntryTableViewCellDelegate)delegate
{
  return (WDManualDataEntryTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setBodyFont:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_largeTextValueFieldToUnitLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_largeTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_lastValidSanitizedText, 0);
  objc_storeStrong((id *)&self->_integerNumberFormatter, 0);
  objc_storeStrong((id *)&self->_displayNameLabelConstraints, 0);
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_valueField, 0);
}

@end
