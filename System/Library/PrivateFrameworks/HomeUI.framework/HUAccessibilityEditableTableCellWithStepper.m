@implementation HUAccessibilityEditableTableCellWithStepper

- (HUAccessibilityEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUAccessibilityEditableTableCellWithStepper *v4;
  HUAccessibilityEditableTableCellWithStepper *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  v4 = -[AXUISettingsEditableTableCellWithStepper initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUAccessibilityEditableTableCellWithStepper setDisabled:](v4, "setDisabled:", 0);
    -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      -[AXUISettingsEditableTableCellWithStepper setSecondsLabel:](v5, "setSecondsLabel:", v7);

      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v8);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v10);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextColor:", v12);

      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIsAccessibilityElement:", 0);

      -[HUAccessibilityEditableTableCellWithStepper contentView](v5, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsEditableTableCellWithStepper secondsLabel](v5, "secondsLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v17);

    }
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  -[PSTableCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUAccessibilityEditableTableCellWithStepper setDisabled:](self, "setDisabled:", 0);
  -[AXUISettingsEditableTextCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  -[AXUISettingsEditableTableCellWithStepper layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell nameTextField](self, "nameTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (void)setMaximumValue:(id)a3
{
  NSNumber *v4;
  NSNumber *maximumValue;
  id v6;

  v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_maximumValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v6, "copy");
    maximumValue = self->_maximumValue;
    self->_maximumValue = v4;

    -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  }

}

- (void)setMinimumValue:(id)a3
{
  NSNumber *v4;
  NSNumber *minimumValue;
  id v6;

  v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_minimumValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v6, "copy");
    minimumValue = self->_minimumValue;
    self->_minimumValue = v4;

    -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  }

}

- (void)setStepValue:(id)a3
{
  NSNumber *v4;
  NSNumber *stepValue;
  id v6;

  v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_stepValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v6, "copy");
    stepValue = self->_stepValue;
    self->_stepValue = v4;

    -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  }

}

- (void)setStepperValue:(id)a3
{
  NSNumber *v4;
  NSNumber *stepperValue;
  id v6;

  v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_stepperValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v6, "copy");
    stepperValue = self->_stepperValue;
    self->_stepperValue = v4;

    -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  }

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  }
}

- (void)_update
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HUAccessibilityEditableTableCellWithStepper *v16;
  id v17;

  if (-[HUAccessibilityEditableTableCellWithStepper isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTableCellWithStepper secondsLabel](self, "secondsLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = -[HUAccessibilityEditableTableCellWithStepper isDisabled](self, "isDisabled") ^ 1;
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v5);

  v7 = -[HUAccessibilityEditableTableCellWithStepper isDisabled](self, "isDisabled") ^ 1;
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  if (-[HUAccessibilityEditableTableCellWithStepper isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTableCellWithStepper stepper](self, "stepper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

  -[HUAccessibilityEditableTableCellWithStepper stepperValue](self, "stepperValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXUISettingsEditableTextCell updateText](self, "updateText");
    -[HUAccessibilityEditableTableCellWithStepper minimumValue](self, "minimumValue");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v17 = (id)v12;
      -[HUAccessibilityEditableTableCellWithStepper maximumValue](self, "maximumValue");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[HUAccessibilityEditableTableCellWithStepper stepValue](self, "stepValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[AXUISettingsEditableTableCellWithStepper delegate](self, "delegate");
          v16 = (HUAccessibilityEditableTableCellWithStepper *)objc_claimAutoreleasedReturnValue();

          if (v16 != self)
            -[AXUISettingsEditableTableCellWithStepper setDelegate:](self, "setDelegate:", self);
        }
      }
      else
      {

      }
    }
  }
}

- (double)valueForSpecifier:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUAccessibilityEditableTableCellWithStepper stepperValue](self, "stepperValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessibilityEditableTableCellWithStepper setStepperValue:](self, "setStepperValue:", v6);

  -[HUAccessibilityEditableTableCellWithStepper stepperCellDelegate](self, "stepperCellDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stepperCell:steppedToValue:", self, v8);

  -[HUAccessibilityEditableTableCellWithStepper _update](self, "_update");
  -[HUAccessibilityEditableTableCellWithStepper setNeedsLayout](self, "setNeedsLayout");
}

- (double)stepValueForSpecifier:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUAccessibilityEditableTableCellWithStepper stepValue](self, "stepValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)minimumValueForSpecifier:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUAccessibilityEditableTableCellWithStepper minimumValue](self, "minimumValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)maximumValueForSpecifier:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUAccessibilityEditableTableCellWithStepper maximumValue](self, "maximumValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)stringValueForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  -[HUAccessibilityEditableTableCellWithStepper stepperValue](self, "stepperValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatNumberWithOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textFieldValue:(id)a3
{
  return -[HUAccessibilityEditableTableCellWithStepper stringValueForSpecifier:](self, "stringValueForSpecifier:", 0);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepperValue
{
  return self->_stepperValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (HUStepperCellDelegate)stepperCellDelegate
{
  return (HUStepperCellDelegate *)objc_loadWeakRetained((id *)&self->_stepperCellDelegate);
}

- (void)setStepperCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stepperCellDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepperCellDelegate);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_stepperValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
