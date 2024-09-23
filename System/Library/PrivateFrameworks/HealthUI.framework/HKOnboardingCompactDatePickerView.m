@implementation HKOnboardingCompactDatePickerView

- (HKOnboardingCompactDatePickerView)initWithFrame:(CGRect)a3 initialText:(id)a4 defaultDate:(id)a5 maxYears:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  HKOnboardingCompactDatePickerView *v15;
  HKOnboardingCompactDatePickerView *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HKOnboardingCompactDatePickerView;
  v15 = -[HKOnboardingCompactDatePickerView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    -[HKOnboardingCompactDatePickerView _setUpDatePicker:maxYears:](v15, "_setUpDatePicker:maxYears:", v14, a6);
    if (v13)
    {
      -[HKOnboardingCompactDatePickerView _setUpInitialLabel:](v16, "_setUpInitialLabel:", v13);
      -[UIDatePicker setAccessibilityElementsHidden:](v16->_datePicker, "setAccessibilityElementsHidden:", 1);
    }
  }

  return v16;
}

- (void)setInitialText:(id)a3 alignment:(int64_t)a4
{
  UILabel *initialTextLabel;

  initialTextLabel = self->_initialTextLabel;
  if (initialTextLabel)
  {
    -[UILabel setText:](initialTextLabel, "setText:", a3);
  }
  else
  {
    -[HKOnboardingCompactDatePickerView _setUpInitialLabel:](self, "_setUpInitialLabel:", a3);
    -[UIDatePicker setAccessibilityElementsHidden:](self->_datePicker, "setAccessibilityElementsHidden:", 1);
  }
  -[UILabel setTextAlignment:](self->_initialTextLabel, "setTextAlignment:", a4);
}

- (void)setCurrentDate:(id)a3
{
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", a3);
}

- (void)_showDatePicker
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HKOnboardingCompactDatePickerView__showDatePicker__block_invoke;
  v6[3] = &unk_1E9C40600;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __52__HKOnboardingCompactDatePickerView__showDatePicker__block_invoke_2;
  v4[3] = &unk_1E9C40628;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v6, v4, 0.3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__HKOnboardingCompactDatePickerView__showDatePicker__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "initialTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

void __52__HKOnboardingCompactDatePickerView__showDatePicker__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initialTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setInitialTextLabel:", 0);

}

- (void)_setInitialLabelBGColor
{
  HKOnboardingCompactDatePickerView *v2;
  HKOnboardingCompactDatePickerView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v2 = self;
  v3 = v2;
  if (!v2)
  {
    v4 = 0;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v4 = v2;
  do
  {
    v5 = v4;
    objc_msgSend(v4, "backgroundColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (uint64_t)v7;
  }
  while (!v7 && v4);
  if (!v7)
    goto LABEL_8;
LABEL_9:
  v8 = (id)v6;
  -[UILabel setBackgroundColor:](v3->_initialTextLabel, "setBackgroundColor:", v6);

}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKOnboardingCompactDatePickerView;
  -[HKOnboardingCompactDatePickerView setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[HKOnboardingCompactDatePickerView _setInitialLabelBGColor](self, "_setInitialLabelBGColor");
}

- (void)_setUpInitialLabel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UILabel *v7;
  UILabel *initialTextLabel;
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
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  initialTextLabel = self->_initialTextLabel;
  self->_initialTextLabel = v7;

  HKHealthKeyColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_initialTextLabel, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_initialTextLabel, "setFont:", v10);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_initialTextLabel, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTintColor:](self->_initialTextLabel, "setTintColor:", v11);

  -[UILabel setText:](self->_initialTextLabel, "setText:", v5);
  -[HKOnboardingCompactDatePickerView axidForElementWithString:](self, "axidForElementWithString:", CFSTR("PlaceholderLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_initialTextLabel, "setAccessibilityIdentifier:", v12);

  -[HKOnboardingCompactDatePickerView _setInitialLabelBGColor](self, "_setInitialLabelBGColor");
  -[HKOnboardingCompactDatePickerView addSubview:](self, "addSubview:", self->_initialTextLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_initialTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_initialTextLabel, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView leadingAnchor](self, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  -[UILabel trailingAnchor](self->_initialTextLabel, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v15;
  -[UILabel topAnchor](self->_initialTextLabel, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  -[UILabel bottomAnchor](self->_initialTextLabel, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v22);

}

- (void)_setUpDatePicker:(id)a3 maxYears:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  UIDatePicker *v11;
  UIDatePicker *datePicker;
  UIDatePicker *v13;
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
  double v26;
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
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "hk_gregorianCalendarWithUTCTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "hk_dateOfBirthDateComponentsWithDate:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateFromComponents:", v36);
  v35 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 4, -a4, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0DC36F0]);
  v11 = (UIDatePicker *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  datePicker = self->_datePicker;
  self->_datePicker = v11;

  v13 = self->_datePicker;
  objc_msgSend(v8, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](v13, "setTimeZone:", v14);

  -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", 1);
  -[UIDatePicker setPreferredDatePickerStyle:](self->_datePicker, "setPreferredDatePickerStyle:", 2);
  -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, sel__datePickerValueChanged_, 4096);
  -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, sel__datePickerDidBeginEditing_, 0x10000);
  -[UIDatePicker setDate:](self->_datePicker, "setDate:", v7);

  -[UIDatePicker setMinimumDate:](self->_datePicker, "setMinimumDate:", v34);
  -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", v33);
  -[UIDatePicker setContentHorizontalAlignment:](self->_datePicker, "setContentHorizontalAlignment:", 4);
  -[HKOnboardingCompactDatePickerView axidForElementWithString:](self, "axidForElementWithString:", CFSTR("DatePicker"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setAccessibilityIdentifier:](self->_datePicker, "setAccessibilityIdentifier:", v15);

  -[HKOnboardingCompactDatePickerView addSubview:](self, "addSubview:", self->_datePicker);
  -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](self->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[UIDatePicker leadingAnchor](self->_datePicker, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView leadingAnchor](self, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v30;
  -[UIDatePicker trailingAnchor](self->_datePicker, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView trailingAnchor](self, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v16;
  -[UIDatePicker topAnchor](self->_datePicker, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v19;
  -[UIDatePicker bottomAnchor](self->_datePicker, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingCompactDatePickerView bottomAnchor](self, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v23);

  -[UIDatePicker widthAnchor](self->_datePicker, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v26) = 1132068864;
  objc_msgSend(v25, "setPriority:", v26);
  objc_msgSend(v25, "setActive:", 1);

}

- (void)_datePickerValueChanged:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compactDatePickerView:didChangeValue:", self, v7);

  }
}

- (void)_datePickerDidBeginEditing:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_initialTextLabel)
    -[HKOnboardingCompactDatePickerView _showDatePicker](self, "_showDatePicker");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compactDatePickerView:didChangeValue:", self, v7);

  }
}

- (id)axidForElementWithString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BirthDate.%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "healthAccessibilityIdentifier:suffix:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HKOnboardingCompactDatePickerViewDelegate)delegate
{
  return (HKOnboardingCompactDatePickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)initialTextLabel
{
  return self->_initialTextLabel;
}

- (void)setInitialTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_initialTextLabel, a3);
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_initialTextLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
