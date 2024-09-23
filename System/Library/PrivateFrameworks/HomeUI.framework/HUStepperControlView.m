@implementation HUStepperControlView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUStepperControlView)initWithFrame:(CGRect)a3
{
  HUStepperControlView *v3;
  UIStepper *v4;
  UIStepper *stepper;
  void *v6;
  UILabel *v7;
  UILabel *valueLabel;
  uint64_t v9;
  NSFormatter *valueFormatter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUStepperControlView;
  v3 = -[HUStepperControlView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStepper *)objc_alloc_init(MEMORY[0x1E0CEAA20]);
    stepper = v3->_stepper;
    v3->_stepper = v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStepper setTintColor:](v3->_stepper, "setTintColor:", v6);

    -[UIStepper setTranslatesAutoresizingMaskIntoConstraints:](v3->_stepper, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStepper addTarget:action:forControlEvents:](v3->_stepper, "addTarget:action:forControlEvents:", v3, sel__stepperTouchDown_, 1);
    -[UIStepper addTarget:action:forControlEvents:](v3->_stepper, "addTarget:action:forControlEvents:", v3, sel__stepperValueChanged_, 4096);
    -[UIStepper addTarget:action:forControlEvents:](v3->_stepper, "addTarget:action:forControlEvents:", v3, sel__stepperTouchUp_, 448);
    -[HUStepperControlView addSubview:](v3, "addSubview:", v3->_stepper);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUStepperControlView addSubview:](v3, "addSubview:", v3->_valueLabel);
    -[HUStepperControlView _defaultValueFormatter](v3, "_defaultValueFormatter");
    v9 = objc_claimAutoreleasedReturnValue();
    valueFormatter = v3->_valueFormatter;
    v3->_valueFormatter = (NSFormatter *)v9;

    -[HUStepperControlView _updateValueLabel](v3, "_updateValueLabel");
  }
  return v3;
}

- (double)minValue
{
  void *v2;
  double v3;
  double v4;

  -[HUStepperControlView stepper](self, "stepper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumValue");
  v4 = v3;

  return v4;
}

- (void)setMinValue:(double)a3
{
  id v4;

  -[HUStepperControlView stepper](self, "stepper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumValue:", a3);

}

- (double)maxValue
{
  void *v2;
  double v3;
  double v4;

  -[HUStepperControlView stepper](self, "stepper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValue");
  v4 = v3;

  return v4;
}

- (void)setMaxValue:(double)a3
{
  id v4;

  -[HUStepperControlView stepper](self, "stepper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumValue:", a3);

}

- (double)stepValue
{
  void *v2;
  double v3;
  double v4;

  -[HUStepperControlView stepper](self, "stepper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepValue");
  v4 = v3;

  return v4;
}

- (void)setStepValue:(double)a3
{
  id v4;

  -[HUStepperControlView stepper](self, "stepper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStepValue:", a3);

}

- (void)setValueFormatter:(id)a3
{
  NSFormatter *v4;
  NSFormatter *valueFormatter;

  v4 = (NSFormatter *)a3;
  if (!v4)
  {
    -[HUStepperControlView _defaultValueFormatter](self, "_defaultValueFormatter");
    v4 = (NSFormatter *)objc_claimAutoreleasedReturnValue();
  }
  valueFormatter = self->_valueFormatter;
  self->_valueFormatter = v4;

  -[HUStepperControlView _updateValueLabel](self, "_updateValueLabel");
}

- (void)updateConstraints
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView valueLabel](self, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView heightAnchor](self, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HUStepperControlView valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HUStepperControlView valueLabel](self, "valueLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUStepperControlView valueLabel](self, "valueLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView stepper](self, "stepper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 8.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  -[HUStepperControlView stepper](self, "stepper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView centerYAnchor](self, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[HUStepperControlView stepper](self, "stepper");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView leadingAnchor](self, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  -[HUStepperControlView heightAnchor](self, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView stepper](self, "stepper");
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v30, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  -[HUStepperControlView layoutConstraints](self, "layoutConstraints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v3, "isEqualToArray:", v33);

  if ((v30 & 1) == 0)
  {
    -[HUStepperControlView layoutConstraints](self, "layoutConstraints");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)MEMORY[0x1E0CB3718];
      -[HUStepperControlView layoutConstraints](self, "layoutConstraints");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deactivateConstraints:", v36);

    }
    -[HUStepperControlView setLayoutConstraints:](self, "setLayoutConstraints:", v3);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  }
  v37.receiver = self;
  v37.super_class = (Class)HUStepperControlView;
  -[HUStepperControlView updateConstraints](&v37, sel_updateConstraints);

}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)setValue:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;

  objc_storeStrong(&self->_value, a3);
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  -[HUStepperControlView stepper](self, "stepper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", v7);

  -[HUStepperControlView _updateValueLabel](self, "_updateValueLabel");
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUStepperControlView stepper](self, "stepper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = !a3;
  -[HUStepperControlView stepper](self, "stepper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView valueLabel](self, "valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)_updateValueLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUStepperControlView valueFormatter](self, "valueFormatter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForObjectValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)_defaultValueFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v2, "setMaximumFractionDigits:", 0);
  return v2;
}

- (void)_stepperTouchDown:(id)a3
{
  id v4;

  -[HUStepperControlView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidBeginUserInteraction:", self);

}

- (void)_stepperTouchUp:(id)a3
{
  id v4;

  -[HUStepperControlView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidEndUserInteraction:", self);

}

- (void)_stepperValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id value;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HUStepperControlView stepper](self, "stepper", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v6;

  -[HUStepperControlView _updateValueLabel](self, "_updateValueLabel");
  -[HUStepperControlView delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUStepperControlView value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controlView:valueDidChange:", self, v8);

}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (id)value
{
  return self->_value;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (UIStepper)stepper
{
  return self->_stepper;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
