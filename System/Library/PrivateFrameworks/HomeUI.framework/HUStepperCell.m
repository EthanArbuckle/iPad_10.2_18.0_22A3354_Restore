@implementation HUStepperCell

- (HUStepperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUStepperCell *v4;
  uint64_t v5;
  UIStepper *stepper;
  void *v7;
  uint64_t v8;
  NSNumber *maximumValue;
  void *v10;
  uint64_t v11;
  NSNumber *minimumValue;
  void *v13;
  uint64_t v14;
  NSNumber *stepValue;
  void *v16;
  uint64_t v17;
  NSNumber *stepperValue;
  uint64_t v19;
  UILabel *valueLabel;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _QWORD v58[5];
  _QWORD v59[2];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)HUStepperCell;
  v4 = -[HUStepperCell initWithStyle:reuseIdentifier:](&v57, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    stepper = v4->_stepper;
    v4->_stepper = (UIStepper *)v5;

    -[UIStepper sizeToFit](v4->_stepper, "sizeToFit");
    -[UIStepper addTarget:action:forControlEvents:](v4->_stepper, "addTarget:action:forControlEvents:", v4, sel__stepperValueDidChange_, 4096);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[UIStepper maximumValue](v4->_stepper, "maximumValue");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
    maximumValue = v4->_maximumValue;
    v4->_maximumValue = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[UIStepper minimumValue](v4->_stepper, "minimumValue");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();
    minimumValue = v4->_minimumValue;
    v4->_minimumValue = (NSNumber *)v11;

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[UIStepper stepValue](v4->_stepper, "stepValue");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = objc_claimAutoreleasedReturnValue();
    stepValue = v4->_stepValue;
    v4->_stepValue = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[UIStepper value](v4->_stepper, "value");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = objc_claimAutoreleasedReturnValue();
    stepperValue = v4->_stepperValue;
    v4->_stepperValue = (NSNumber *)v17;

    v19 = objc_opt_new();
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (UILabel *)v19;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v59[0] = v4->_valueLabel;
    v59[1] = v4->_stepper;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[HUStepperCell contentView](v4, "contentView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addSubview:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v23);
    }

    -[UIStepper centerYAnchor](v4->_stepper, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStepperCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUStepperCell valueLabel](v4, "valueLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStepperCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUStepperCell valueLabel](v4, "valueLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStepperCell stepper](v4, "stepper");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -7.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStepper trailingAnchor](v4->_stepper, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStepperCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "readableContentGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUStepperCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintGreaterThanOrEqualToConstant:", *MEMORY[0x1E0CEBC18]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0CB3718];
    v58[0] = v36;
    v58[1] = v41;
    v58[2] = v46;
    v58[3] = v31;
    v58[4] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v51);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUStepperCell;
  -[HUStepperCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUStepperCell setDisabled:](self, "setDisabled:", 0);
  -[HUStepperCell setSelectionStyle:](self, "setSelectionStyle:", 0);
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

    -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
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

    -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
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

    -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
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

    -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;

  -[HUStepperCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  if (-[HUStepperCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[HUStepperCell _valueDescription](self, "_valueDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperCell valueLabel](self, "valueLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  if (-[HUStepperCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperCell valueLabel](self, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[HUStepperCell valueLabel](self, "valueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

  v15 = -[HUStepperCell isDisabled](self, "isDisabled") ^ 1;
  -[HUStepperCell stepper](self, "stepper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUserInteractionEnabled:", v15);

  v17 = -[HUStepperCell isDisabled](self, "isDisabled") ^ 1;
  -[HUStepperCell stepper](self, "stepper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v17);

  -[HUStepperCell minimumValue](self, "minimumValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  -[HUStepperCell stepper](self, "stepper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMinimumValue:", v21);

  -[HUStepperCell maximumValue](self, "maximumValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;
  -[HUStepperCell stepper](self, "stepper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMaximumValue:", v25);

  -[HUStepperCell stepValue](self, "stepValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  -[HUStepperCell stepper](self, "stepper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStepValue:", v29);

  -[HUStepperCell stepperValue](self, "stepperValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;
  -[HUStepperCell stepper](self, "stepper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setValue:", v33);

  if (-[HUStepperCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[HUStepperCell stepper](self, "stepper");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTintColor:", v36);

}

- (void)_stepperValueDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (!-[HUStepperCell isDisabled](self, "isDisabled", a3))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HUStepperCell stepper](self, "stepper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    objc_msgSend(v4, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[HUStepperCell stepperValue](self, "stepperValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "compare:", v8);

    if (v7)
    {
      -[HUStepperCell setStepperValue:](self, "setStepperValue:", v8);
      -[HUStepperCell _toggleValueChange:](self, "_toggleValueChange:", self);
      -[HUStepperCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
    }

  }
}

- (void)_toggleValueChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUStepperCell stepperCellDelegate](self, "stepperCellDelegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HUStepperCell stepper](self, "stepper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stepperCell:steppedToValue:", self, v6);

}

- (id)_valueDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[HUStepperCell stepperValue](self, "stepperValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37F0];
    -[HUStepperCell stepperValue](self, "stepperValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E6F60E80;
  }
  return v6;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSNumber)stepperValue
{
  return self->_stepperValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
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

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
  objc_storeStrong((id *)&self->_stepper, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_destroyWeak((id *)&self->_stepperCellDelegate);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_stepperValue, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
