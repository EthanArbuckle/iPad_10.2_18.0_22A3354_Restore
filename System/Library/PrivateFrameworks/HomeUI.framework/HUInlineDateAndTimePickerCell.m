@implementation HUInlineDateAndTimePickerCell

- (HUInlineDateAndTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUInlineDateAndTimePickerCell *v4;
  HUInlineDateAndTimePickerCell *v5;
  void *v6;
  UIDatePicker *v7;
  UIDatePicker *datePicker;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUInlineDateAndTimePickerCell;
  v4 = -[HUInlineDateAndTimePickerCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUInlineDateAndTimePickerCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0CEA4E8]);
    datePicker = v5->_datePicker;
    v5->_datePicker = v7;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v5->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v5->_datePicker, "setDatePickerMode:", 2);
    -[UIDatePicker setPreferredDatePickerStyle:](v5->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[UIDatePicker addTarget:action:forControlEvents:](v5->_datePicker, "addTarget:action:forControlEvents:", v5, sel__valueChanged_, 4096);
    -[HUInlineDateAndTimePickerCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineDateAndTimePickerCell datePicker](v5, "datePicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

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
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  -[HUInlineDateAndTimePickerCell allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HUInlineDateAndTimePickerCell hideTitleLabel](self, "hideTitleLabel"))
    {
      -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell leftMargin](self, "leftMargin");
      objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);
    }
    else
    {
      -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "readableContentGuide");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

      -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "readableContentGuide");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

      -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "readableContentGuide");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell leftMargin](self, "leftMargin");
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v32);

      -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v37);

      -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "readableContentGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v38);

    }
    -[HUInlineDateAndTimePickerCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", 216.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v41);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUInlineDateAndTimePickerCell setAllConstraints:](self, "setAllConstraints:", v4);

  }
  v42.receiver = self;
  v42.super_class = (Class)HUInlineDateAndTimePickerCell;
  -[HUInlineDateAndTimePickerCell updateConstraints](&v42, sel_updateConstraints);
}

- (void)toggleTimePickerOptionVisibility:(BOOL)a3
{
  uint64_t v3;
  id v4;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatePickerMode:", v3);

}

- (double)datePickerHeight
{
  void *v2;
  double v3;
  double v4;

  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (void)setDateAndTimePickerDate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v4);

  }
}

- (NSDateComponents)timeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v7;
}

- (void)setTimeComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDate:", v8);

  }
}

- (void)setTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setHideTitleLabel:(BOOL)a3
{
  if (self->_hideTitleLabel != a3)
  {
    self->_hideTitleLabel = a3;
    -[HUInlineDateAndTimePickerCell setAllConstraints:](self, "setAllConstraints:", 0);
    -[HUInlineDateAndTimePickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)_valueChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUInlineDateAndTimePickerCell delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateAndTimePickerCell:didSelectDate:", self, v5);

}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    v4 = !a3;
    -[HUInlineDateAndTimePickerCell datePicker](self, "datePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v4);

    if (v4)
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUInlineDateAndTimePickerCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineDateAndTimePickerCellDelegate)delegate
{
  return (HUInlineDateAndTimePickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hideTitleLabel
{
  return self->_hideTitleLabel;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
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
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
