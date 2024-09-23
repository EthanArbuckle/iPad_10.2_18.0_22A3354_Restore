@implementation HUInlineDatePickerCell

- (HUInlineDatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUInlineDatePickerCell *v4;
  HUInlineDatePickerCell *v5;
  void *v6;
  UIDatePicker *v7;
  UIDatePicker *datePicker;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUInlineDatePickerCell;
  v4 = -[HUInlineDatePickerCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUInlineDatePickerCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0CEA4E8]);
    datePicker = v5->_datePicker;
    v5->_datePicker = v7;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v5->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v5->_datePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v5->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[UIDatePicker addTarget:action:forControlEvents:](v5->_datePicker, "addTarget:action:forControlEvents:", v5, sel__valueChanged_, 4096);
    -[HUInlineDatePickerCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineDatePickerCell datePicker](v5, "datePicker");
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  -[HUInlineDatePickerCell allConstraints](self, "allConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HUInlineDatePickerCell hideTitleLabel](self, "hideTitleLabel"))
    {
      -[HUInlineDatePickerCell datePicker](self, "datePicker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell leftMargin](self, "leftMargin");
      objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);
    }
    else
    {
      -[HUInlineDatePickerCell textLabel](self, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "readableContentGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

      -[HUInlineDatePickerCell textLabel](self, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "readableContentGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v21);

      -[HUInlineDatePickerCell textLabel](self, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell contentView](self, "contentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "readableContentGuide");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell leftMargin](self, "leftMargin");
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

      -[HUInlineDatePickerCell datePicker](self, "datePicker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInlineDatePickerCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "readableContentGuide");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v28);

    }
    -[HUInlineDatePickerCell datePicker](self, "datePicker");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineDatePickerCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "readableContentGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[HUInlineDatePickerCell datePicker](self, "datePicker");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineDatePickerCell contentView](self, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "readableContentGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v40);

    -[HUInlineDatePickerCell datePicker](self, "datePicker");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInlineDatePickerCell textLabel](self, "textLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 10.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
    -[HUInlineDatePickerCell setAllConstraints:](self, "setAllConstraints:", v4);

  }
  v46.receiver = self;
  v46.super_class = (Class)HUInlineDatePickerCell;
  -[HUInlineDatePickerCell updateConstraints](&v46, sel_updateConstraints);
}

- (NSDateComponents)timeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUInlineDatePickerCell datePicker](self, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInlineDatePickerCell datePicker](self, "datePicker");
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
  -[HUInlineDatePickerCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUInlineDatePickerCell datePicker](self, "datePicker");
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
  -[HUInlineDatePickerCell textLabel](self, "textLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setHideTitleLabel:(BOOL)a3
{
  if (self->_hideTitleLabel != a3)
  {
    self->_hideTitleLabel = a3;
    -[HUInlineDatePickerCell setAllConstraints:](self, "setAllConstraints:", 0);
    -[HUInlineDatePickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)_valueChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUInlineDatePickerCell delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUInlineDatePickerCell datePicker](self, "datePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datePickerCell:didSelectDate:", self, v5);

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
    -[HUInlineDatePickerCell datePicker](self, "datePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v4);

    if (v4)
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUInlineDatePickerCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineDatePickerCellDelegate)delegate
{
  return (HUInlineDatePickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
