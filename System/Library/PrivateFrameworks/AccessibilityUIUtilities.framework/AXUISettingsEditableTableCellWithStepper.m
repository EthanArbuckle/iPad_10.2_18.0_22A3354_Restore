@implementation AXUISettingsEditableTableCellWithStepper

- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AXUISettingsEditableTableCellWithStepper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  v4 = -[AXUISettingsEditableTableCellWithStepper initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  *(_DWORD *)((char *)&v4->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805D8]) = 1;
  *((_BYTE *)&v4->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805E0]) = 1;
  -[AXUISettingsEditableTableCellWithStepper initializeView](v4, "initializeView");
  return v4;
}

- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  AXUISettingsEditableTableCellWithStepper *v9;
  AXUISettingsEditableTableCellWithStepper *v10;
  void *v11;
  void *v12;
  AXUISettingsEditableTableCellWithStepper *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  v9 = -[AXUISettingsEditableTextCell initWithStyle:reuseIdentifier:specifier:](&v15, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[AXUISettingsEditableTableCellWithStepper initializeView](v9, "initializeView");
    objc_msgSend(v8, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("testingUseNoPreferencesDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsEditableTableCellWithStepper setTestingUseNoPreferencesDelegate:](v10, "setTestingUseNoPreferencesDelegate:", objc_msgSend(v12, "BOOLValue"));

    -[AXUISettingsEditableTableCellWithStepper setDelegate:](v10, "setDelegate:", v11);
    v13 = v10;

  }
  return v10;
}

- (void)initializeView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIStepper *stepper;
  id v17;
  UIStepper *v18;
  UIStepper *v19;
  void *v20;
  UILabel *secondsLabel;
  UILabel *v22;
  UILabel *v23;
  UILabel *v24;
  UILabel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  -[AXUISettingsEditableTextCell initializeView](&v31, sel_initializeView);
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D80808];
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D80808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 1;
  }

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyboardType:", 8);

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReturnKeyType:", 9);

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__textFieldChanged_, 0x20000);

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderStyle:", 3);

  stepper = self->_stepper;
  if (!stepper)
  {
    v17 = objc_alloc(MEMORY[0x1E0DC3CF0]);
    v18 = (UIStepper *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v19 = self->_stepper;
    self->_stepper = v18;

    -[UIStepper setUserInteractionEnabled:](self->_stepper, "setUserInteractionEnabled:", 1);
    -[UIStepper addTarget:action:forControlEvents:](self->_stepper, "addTarget:action:forControlEvents:", self, sel__stepperChanged_, 4096);
    -[UIStepper accessibilitySetIdentification:](self->_stepper, "accessibilitySetIdentification:", CFSTR("AXStepper"));
    -[AXUISettingsEditableTableCellWithStepper contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_stepper);

    stepper = self->_stepper;
  }
  -[UIStepper setEnabled:](stepper, "setEnabled:", v8);
  secondsLabel = self->_secondsLabel;
  if (!secondsLabel)
  {
    -[AXUISettingsEditableTableCellWithStepper detailTextLabel](self, "detailTextLabel");
    v22 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v23 = self->_secondsLabel;
    self->_secondsLabel = v22;

    if (!self->_secondsLabel)
    {
      v24 = (UILabel *)objc_opt_new();
      v25 = self->_secondsLabel;
      self->_secondsLabel = v24;

      -[AXUISettingsEditableTableCellWithStepper contentView](self, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", self->_secondsLabel);

    }
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_secondsLabel, "setFont:", v27);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_secondsLabel, "setBackgroundColor:", v28);

    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_secondsLabel, "setTextColor:", v30);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondsLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setIsAccessibilityElement:](self->_secondsLabel, "setIsAccessibilityElement:", 0);
    secondsLabel = self->_secondsLabel;
  }
  -[UILabel setEnabled:](secondsLabel, "setEnabled:", v8);
  -[AXUISettingsEditableTableCellWithStepper _updateAccessibilityLabelForTextField](self, "_updateAccessibilityLabelForTextField");
}

- (double)_axStepperMaximumValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "maximumValueForStepperCell:", self);
    v7 = v6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumValueForSpecifier:", v8);
    v7 = v9;

  }
  return v7;
}

- (double)_axStepperMinimumValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "minimumValueForStepperCell:", self);
    v7 = v6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumValueForSpecifier:", v8);
    v7 = v9;

  }
  return v7;
}

- (int64_t)_axStepperKeyboardType
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int64_t v6;
  int v7;
  void *v8;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "keyboardTypeForStepperCell:", self);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return 8;
    -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "keyboardTypeForSpecifier:", v8);

  }
  return v6;
}

- (id)_axStepperUnitString
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "unitsStringForStepperCell:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      v6 = 0;
      return v6;
    }
    -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unitsStringForSpecifier:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)_axStepperValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "valueForStepperCell:", self);
    v7 = v6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForSpecifier:", v8);
    v7 = v9;

  }
  return v7;
}

- (double)_axStepperStepValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "stepValueForStepperCell:", self);
    v7 = v6;
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepValueForSpecifier:", v8);
    v7 = v9;

  }
  return v7;
}

- (void)_axStepperSetValue:(double)a3
{
  _BOOL4 v5;
  void *v6;
  id v7;

  v5 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "stepperCell:setValue:", self, a3);
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifier:setValue:", v6, a3);

  }
}

- (id)_axStepperStringValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[AXUISettingsEditableTableCellWithStepper testingUseNoPreferencesDelegate](self, "testingUseNoPreferencesDelegate");
  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "stringValueForStepperCell:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSTableCell specifier](self, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValueForSpecifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  AXUISettingsEditableTableCellWithStepperDelegate **p_delegate;
  int64_t v5;
  void *v6;
  id v7;

  p_delegate = &self->_delegate;
  v7 = a3;
  objc_storeWeak((id *)p_delegate, v7);
  v5 = -[AXUISettingsEditableTableCellWithStepper _axStepperKeyboardType](self, "_axStepperKeyboardType");
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardType:", v5);

  -[AXUISettingsEditableTableCellWithStepper _axStepperMinimumValue](self, "_axStepperMinimumValue");
  -[UIStepper setMinimumValue:](self->_stepper, "setMinimumValue:");
  -[AXUISettingsEditableTableCellWithStepper _axStepperMaximumValue](self, "_axStepperMaximumValue");
  -[UIStepper setMaximumValue:](self->_stepper, "setMaximumValue:");
  -[AXUISettingsEditableTableCellWithStepper _axStepperValue](self, "_axStepperValue");
  -[UIStepper setValue:](self->_stepper, "setValue:");
  -[AXUISettingsEditableTableCellWithStepper _axStepperStepValue](self, "_axStepperStepValue");
  -[UIStepper setStepValue:](self->_stepper, "setStepValue:");
  -[AXUISettingsEditableTableCellWithStepper _updateSecondsLabelForDelegate:](self, "_updateSecondsLabelForDelegate:", v7);

}

- (void)_updateAccessibilityLabelForTextField
{
  void *v3;
  id v4;

  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_secondsLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (id)_stepperValueFormatString
{
  return CFSTR("%.2f");
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "text");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "decimalSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formUnionWithCharacterSet:", v8);

  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[AXUISettingsEditableTableCellWithStepper _axStepperValue](self, "_axStepperValue");
LABEL_6:
      v16 = v11;
      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "numberFromString:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  -[AXUISettingsEditableTableCellWithStepper _axStepperMinimumValue](self, "_axStepperMinimumValue");
  v16 = v15;
  -[AXUISettingsEditableTableCellWithStepper _axStepperMaximumValue](self, "_axStepperMaximumValue");
  if (v14 >= v16)
  {
    v16 = v14;
    if (v14 > v11)
      goto LABEL_6;
  }
LABEL_7:
  -[AXUISettingsEditableTableCellWithStepper _axStepperSetValue:](self, "_axStepperSetValue:", v16);
  -[AXUISettingsEditableTableCellWithStepper _axStepperStringValue](self, "_axStepperStringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[UIStepper setValue:](self->_stepper, "setValue:", v16);
  -[AXUISettingsEditableTableCellWithStepper _updateSecondsLabel](self, "_updateSecondsLabel");
  -[AXUISettingsEditableTableCellWithStepper _updateAccessibilityLabelForTextField](self, "_updateAccessibilityLabelForTextField");

}

- (void)_stepperChanged:(id)a3
{
  -[UIStepper value](self->_stepper, "value", a3);
  -[AXUISettingsEditableTableCellWithStepper updateWithValue:shouldUpdateTextField:](self, "updateWithValue:shouldUpdateTextField:", 1);
}

- (void)_textFieldChanged:(id)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[AXUISettingsEditableTableCellWithStepper updateWithValue:shouldUpdateTextField:](self, "updateWithValue:shouldUpdateTextField:", 0, v6);
}

- (BOOL)shouldResizeTextFieldOnUpdate
{
  return 1;
}

- (void)updateWithValue:(double)a3 shouldUpdateTextField:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;

  v4 = a4;
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maximumValue");
  v9 = v8;

  if (v9 > a3)
    v9 = a3;
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimumValue");
  v12 = v11;

  if (v9 >= v12)
    v12 = v9;
  -[AXUISettingsEditableTableCellWithStepper _axStepperSetValue:](self, "_axStepperSetValue:", v12);
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:", v12);

  if (v4)
  {
    -[AXUISettingsEditableTextCell updateText](self, "updateText");
    if (-[AXUISettingsEditableTableCellWithStepper shouldResizeTextFieldOnUpdate](self, "shouldResizeTextFieldOnUpdate"))
    {
      -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeThatFits:", 200.0, 100.0);
      v23 = v22;

      objc_msgSend(v14, "setFrame:", v16, v18, v23, v20);
    }
    -[AXUISettingsEditableTableCellWithStepper _updateSecondsLabel](self, "_updateSecondsLabel");
    -[AXUISettingsEditableTableCellWithStepper _updateAccessibilityLabelForTextField](self, "_updateAccessibilityLabelForTextField");
  }
}

- (void)_updateSecondsLabel
{
  id v3;

  -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTableCellWithStepper _updateSecondsLabelForDelegate:](self, "_updateSecondsLabelForDelegate:", v3);

}

- (void)_updateSecondsLabelForDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  double v16;

  -[UILabel text](self->_secondsLabel, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[AXUISettingsEditableTableCellWithStepper _axStepperUnitString](self, "_axStepperUnitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UILabel setText:](self->_secondsLabel, "setText:", v6);
  }
  else
  {
    -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3900], "localizedScannerWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0.0;
    objc_msgSend(v9, "scanDouble:", &v16);
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (fabs(v16 + -1.0) >= 0.001)
      v11 = CFSTR("DELAY_SECONDS_PLURAL");
    else
      v11 = CFSTR("DELAY_SECONDS_SINGULAR");
    AXUILocalizedStringForKey(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, *(_QWORD *)&v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_secondsLabel, "setText:", v13);

  }
  -[UILabel text](self->_secondsLabel, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
    -[AXUISettingsEditableTableCellWithStepper layoutSubviews](self, "layoutSubviews");

}

- (void)didMoveToSuperview
{
  void *v3;

  -[AXUISettingsEditableTableCellWithStepper superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXUISettingsEditableTextCell updateText](self, "updateText");
    -[AXUISettingsEditableTableCellWithStepper _updateAccessibilityLabelForTextField](self, "_updateAccessibilityLabelForTextField");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory())
  {
    -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeThatFits:", 200.0, 3.40282347e38);
    v8 = v7;
    -[UILabel sizeThatFits:](self->_secondsLabel, "sizeThatFits:", 200.0, 3.40282347e38);
    v10 = v8 + v9;
    -[AXUISettingsEditableTableCellWithStepper layoutMargins](self, "layoutMargins");
    v12 = v10 + v11 + 5.0;
    -[AXUISettingsEditableTableCellWithStepper layoutMargins](self, "layoutMargins");
    v14 = v13 + v12;

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
    -[AXUISettingsEditableTableCellWithStepper sizeThatFits:](&v19, sel_sizeThatFits_, width, height);
    width = v15;
    v14 = v16;
  }
  v17 = width;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  UILabel *secondsLabel;
  double v29;
  double v30;
  double v31;
  void *v32;
  double MaxX;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v40.receiver = self;
  v40.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  -[AXUISettingsEditableTextCell layoutSubviews](&v40, sel_layoutSubviews);
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");
  -[UILabel sizeToFit](self->_secondsLabel, "sizeToFit");
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", 200.0, 100.0);
  v10 = v9;

  IsAccessibilityCategory = AXPreferredContentSizeCategoryIsAccessibilityCategory();
  -[AXUISettingsEditableTableCellWithStepper contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v15 = v7;
  if (IsAccessibilityCategory)
  {
    -[UILabel frame](self->_secondsLabel, "frame");
    v15 = v7 + 5.0 + v16;
  }
  v17 = v14 - v15;

  v18 = v17 * 0.5;
  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondsLabel, "setTextColor:", v20);

  v21 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
  {
    -[AXUISettingsEditableTableCellWithStepper bounds](self, "bounds");
    v5 = v22 - v10 + -20.0;
    v41.origin.x = v5;
    v41.origin.y = v18;
    v41.size.width = v10;
    v41.size.height = v7;
    v23 = CGRectGetMinX(v41) + -20.0;
    -[UILabel frame](self->_secondsLabel, "frame");
    v25 = v23 - v24;
  }
  else
  {
    v42.origin.x = v5;
    v42.origin.y = v18;
    v42.size.width = v10;
    v42.size.height = v7;
    v25 = CGRectGetMaxX(v42) + 20.0;
  }
  -[UILabel frame](self->_secondsLabel, "frame");
  v27 = v26;
  objc_msgSend(v3, "setFrame:", v5, v18, v10, v7);
  secondsLabel = self->_secondsLabel;
  v43.origin.x = v25;
  v43.origin.y = v18;
  v43.size.width = v27;
  v43.size.height = v7;
  v44 = CGRectIntegral(v43);
  -[UILabel setFrame:](secondsLabel, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
  -[UIStepper frame](self->_stepper, "frame");
  v30 = v29;
  v31 = 10.0;
  if (!objc_msgSend(*v21, "userInterfaceLayoutDirection"))
  {
    -[AXUISettingsEditableTableCellWithStepper contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    MaxX = CGRectGetMaxX(v45);
    -[UIStepper frame](self->_stepper, "frame");
    v31 = MaxX - (v34 + 10.0);

  }
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory())
  {
    -[UILabel frame](self->_secondsLabel, "frame");
    objc_msgSend(v3, "frame");
    CGRectGetMaxY(v46);
    objc_msgSend(v3, "frame");
    -[UILabel setFrame:](self->_secondsLabel, "setFrame:");
  }
  -[AXUISettingsEditableTableCellWithStepper contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = v36;
  -[UIStepper frame](self->_stepper, "frame");
  v39 = (v37 - v38) * 0.5;

  -[UIStepper setFrame:](self->_stepper, "setFrame:", v31, v39, 50.0, v30);
  -[AXUISettingsEditableTableCellWithStepper _updateAccessibilityLabelForTextField](self, "_updateAccessibilityLabelForTextField");

}

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
  objc_storeStrong((id *)&self->_stepper, a3);
}

- (AXUISettingsEditableTableCellWithStepperDelegate)delegate
{
  return (AXUISettingsEditableTableCellWithStepperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UILabel)secondsLabel
{
  return self->_secondsLabel;
}

- (void)setSecondsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondsLabel, a3);
}

- (BOOL)testingUseNoPreferencesDelegate
{
  return self->_testingUseNoPreferencesDelegate;
}

- (void)setTestingUseNoPreferencesDelegate:(BOOL)a3
{
  self->_testingUseNoPreferencesDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stepper, 0);
}

@end
