@implementation HXUIInlineDatePickerTableViewCell

- (HXUIInlineDatePickerTableViewCell)initWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HXUIInlineDatePickerTableViewCell *v12;
  void *v13;
  HXUIPickerLabelView *v14;
  HXUIPickerLabelView *contentLabel;
  void *v16;
  UIDatePicker *v17;
  UIDatePicker *picker;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27.receiver = self;
  v27.super_class = (Class)HXUIInlineDatePickerTableViewCell;
  v12 = -[HXUIInlineDatePickerTableViewCell initWithStyle:reuseIdentifier:](&v27, sel_initWithStyle_reuseIdentifier_, 0, v11);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUIInlineDatePickerTableViewCell setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[HXUIInlineDatePickerTableViewCell setSelectionStyle:](v12, "setSelectionStyle:", 0);
    v14 = objc_alloc_init(HXUIPickerLabelView);
    contentLabel = v12->_contentLabel;
    v12->_contentLabel = v14;

    -[HXUIPickerLabelView setText:](v12->_contentLabel, "setText:", v8);
    -[HXUIInlineDatePickerTableViewCell contentView](v12, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v12->_contentLabel);

    -[HXUIInlineDatePickerTableViewCell _contentLabelFrame](v12, "_contentLabelFrame");
    -[HXUIPickerLabelView setFrame:](v12->_contentLabel, "setFrame:");
    v17 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    picker = v12->_picker;
    v12->_picker = v17;

    if (a4 == 1)
      v19 = 3;
    else
      v19 = 1;
    -[UIDatePicker setPreferredDatePickerStyle:](v12->_picker, "setPreferredDatePickerStyle:", v19);
    -[UIDatePicker setDatePickerMode:](v12->_picker, "setDatePickerMode:", a4);
    -[UIDatePicker setMaximumDate:](v12->_picker, "setMaximumDate:", v9);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTimeZone:](v12->_picker, "setTimeZone:", v21);

    -[UIDatePicker setAlpha:](v12->_picker, "setAlpha:", 0.0);
    -[HXUIInlineDatePickerTableViewCell contentView](v12, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v12->_picker);

    -[HXUIInlineDatePickerTableViewCell _pickerFrame](v12, "_pickerFrame");
    -[UIDatePicker setFrame:](v12->_picker, "setFrame:");
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)-[HXUIInlineDatePickerTableViewCell registerForTraitChanges:withHandler:](v12, "registerForTraitChanges:withHandler:", v24, &__block_literal_global_4);

  }
  return v12;
}

uint64_t __74__HXUIInlineDatePickerTableViewCell_initWithTitle_datePickerMode_maxDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsLayout");
}

- (CGRect)_contentLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[HXUIInlineDatePickerTableViewCell bounds](self, "bounds");
  v4 = v3 + -30.0;
  -[HXUIInlineDatePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:", v3 + -30.0, 10000.0);
  v6 = v5;
  v7 = 15.0;
  v8 = 4.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_pickerFrame
{
  CGFloat MaxY;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect result;

  -[HXUIInlineDatePickerTableViewCell _contentLabelFrame](self, "_contentLabelFrame");
  MaxY = CGRectGetMaxY(v11);
  -[HXUIInlineDatePickerTableViewCell bounds](self, "bounds");
  v5 = v4;
  -[UIDatePicker sizeThatFits:](self->_picker, "sizeThatFits:", v4, 10000.0);
  v7 = v6;
  v8 = 0.0;
  v9 = MaxY;
  v10 = v5;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HXUIInlineDatePickerTableViewCell;
  -[HXUIInlineDatePickerTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[HXUIInlineDatePickerTableViewCell _contentLabelFrame](self, "_contentLabelFrame");
  -[HXUIPickerLabelView setFrame:](self->_contentLabel, "setFrame:");
  -[HXUIInlineDatePickerTableViewCell _pickerFrame](self, "_pickerFrame");
  -[UIDatePicker setFrame:](self->_picker, "setFrame:");
}

- (UIDatePicker)datePicker
{
  return self->_picker;
}

- (void)updateLabelWithDate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3578];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  if (-[UIDatePicker datePickerMode](self->_picker, "datePickerMode") == UIDatePickerModeDate)
  {
    objc_msgSend(v9, "setDateStyle:", 2);
    objc_msgSend(v9, "setTimeStyle:", 0);
  }
  else if (-[UIDatePicker datePickerMode](self->_picker, "datePickerMode"))
  {
    CPDateFormatStringForFormatType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDateFormat:", v6);

  }
  else
  {
    objc_msgSend(v9, "setTimeStyle:", 1);
    objc_msgSend(v9, "setDateStyle:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v7);

  objc_msgSend(v9, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HXUIPickerLabelView setDetailText:](self->_contentLabel, "setDetailText:", v8);
}

- (void)setExpanded:(BOOL)a3
{
  double v5;
  id v6;

  self->_expanded = a3;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[UIDatePicker setAlpha:](self->_picker, "setAlpha:", v5);
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HXUIPickerLabelView setDetailTextColor:](self->_contentLabel, "setDetailTextColor:", v6);

}

- (void)setDisplayName:(id)a3
{
  -[HXUIPickerLabelView setText:](self->_contentLabel, "setText:", a3);
}

- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3.width + -30.0;
  if (v3 < 0.0)
    v3 = 0.0;
  -[HXUIPickerLabelView sizeThatFits:](self->_contentLabel, "sizeThatFits:", v3, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HXUIInlineDatePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:");
  v7 = v6;
  v9 = v8;
  if (-[HXUIInlineDatePickerTableViewCell expanded](self, "expanded"))
  {
    -[UIDatePicker sizeThatFits:](self->_picker, "sizeThatFits:", width, height);
    v9 = v9 + v10;
    v7 = width;
  }
  v11 = v9 + 8.0;
  v12 = v7;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)expandedHeight
{
  CGRect v3;

  -[HXUIInlineDatePickerTableViewCell _pickerFrame](self, "_pickerFrame");
  return CGRectGetMaxY(v3) + 4.0;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
