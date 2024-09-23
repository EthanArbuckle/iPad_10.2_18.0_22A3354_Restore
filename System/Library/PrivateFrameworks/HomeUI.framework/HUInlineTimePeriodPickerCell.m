@implementation HUInlineTimePeriodPickerCell

- (HUInlineTimePeriodPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUInlineTimePeriodPickerCell *v4;
  HUInlineTimePeriodPickerCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIDatePicker *v14;
  UIDatePicker *startTimePicker;
  void *v16;
  void *v17;
  UIDatePicker *v18;
  UIDatePicker *endTimePicker;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUInlineTimePeriodPickerCell;
  v4 = -[HUInlineTimePeriodPickerCell initWithStyle:reuseIdentifier:](&v23, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUInlineTimePeriodPickerCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    -[HUInlineTimePeriodPickerCell setStackView:](v5, "setStackView:", v7);

    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAxis:", 0);

    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlignment:", 3);

    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSpacing:", 8.0);

    -[HUInlineTimePeriodPickerCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v14 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0CEA4E8]);
    startTimePicker = v5->_startTimePicker;
    v5->_startTimePicker = v14;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v5->_startTimePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v5->_startTimePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v5->_startTimePicker, "setPreferredDatePickerStyle:", 2);
    -[UIDatePicker addTarget:action:forControlEvents:](v5->_startTimePicker, "addTarget:action:forControlEvents:", v5, sel__startValueChanged_, 4096);
    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell startTimePicker](v5, "startTimePicker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addArrangedSubview:", v17);

    v18 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0CEA4E8]);
    endTimePicker = v5->_endTimePicker;
    v5->_endTimePicker = v18;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v5->_endTimePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v5->_endTimePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v5->_endTimePicker, "setPreferredDatePickerStyle:", 2);
    -[UIDatePicker addTarget:action:forControlEvents:](v5->_endTimePicker, "addTarget:action:forControlEvents:", v5, sel__endValueChanged_, 4096);
    -[HUInlineTimePeriodPickerCell stackView](v5, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell endTimePicker](v5, "endTimePicker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addArrangedSubview:", v21);

  }
  return v5;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  -[HUInlineTimePeriodPickerCell allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell stackView](self, "stackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    -[HUInlineTimePeriodPickerCell stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    -[HUInlineTimePeriodPickerCell stackView](self, "stackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "readableContentGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    -[HUInlineTimePeriodPickerCell textLabel](self, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "readableContentGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

    -[HUInlineTimePeriodPickerCell textLabel](self, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "readableContentGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v32);

    -[HUInlineTimePeriodPickerCell textLabel](self, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "readableContentGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v38);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUInlineTimePeriodPickerCell setAllConstraints:](self, "setAllConstraints:", v4);

  }
  v39.receiver = self;
  v39.super_class = (Class)HUInlineTimePeriodPickerCell;
  -[HUInlineTimePeriodPickerCell updateConstraints](&v39, sel_updateConstraints);
}

- (id)startTimeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setStartTimeComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDate:", v8);

  }
}

- (id)endTimeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEndTimeComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDate:", v8);

  }
}

- (void)setTitle:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[HUInlineTimePeriodPickerCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HUInlineTimePeriodPickerCell setAllConstraints:](self, "setAllConstraints:", 0);
  -[HUInlineTimePeriodPickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_startValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUInlineTimePeriodPickerCell delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timePickerCell:didSelectStartTime:", self, v6);

}

- (void)_endValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUInlineTimePeriodPickerCell delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timePickerCell:didSelectEndTime:", self, v6);

}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    v4 = !a3;
    -[HUInlineTimePeriodPickerCell startTimePicker](self, "startTimePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v4);

    -[HUInlineTimePeriodPickerCell endTimePicker](self, "endTimePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v4);

    if (v4)
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HUInlineTimePeriodPickerCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineTimePeriodPickerCellDelegate)delegate
{
  return (HUInlineTimePeriodPickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateComponents)timeComponents
{
  return self->_timeComponents;
}

- (void)setTimeComponents:(id)a3
{
  objc_storeStrong((id *)&self->_timeComponents, a3);
}

- (NSString)title
{
  return self->_title;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIDatePicker)startTimePicker
{
  return self->_startTimePicker;
}

- (void)setStartTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_startTimePicker, a3);
}

- (UIDatePicker)endTimePicker
{
  return self->_endTimePicker;
}

- (void)setEndTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_endTimePicker, a3);
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_endTimePicker, 0);
  objc_storeStrong((id *)&self->_startTimePicker, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeComponents, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
