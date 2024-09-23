@implementation MFCalendarCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFCalendarCollectionViewCellIdentifier");
}

- (MFCalendarCollectionViewCell)initWithFrame:(CGRect)a3
{
  MFCalendarCollectionViewCell *v3;
  MFCalendarCollectionViewCell *v4;
  void *v5;
  void *v6;
  UIDatePicker *v7;
  UIDatePicker *datePicker;
  double v9;
  void *v10;
  void *v11;
  UIDatePicker *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MFCalendarCollectionViewCell;
  v3 = -[MFCalendarCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFCalendarCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = v4->_datePicker;
    v4->_datePicker = v7;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1148846080;
    -[UIDatePicker setContentHuggingPriority:forAxis:](v4->_datePicker, "setContentHuggingPriority:forAxis:", 0, v9);
    -[UIDatePicker setPreferredDatePickerStyle:](v4->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[UIDatePicker setDatePickerMode:](v4->_datePicker, "setDatePickerMode:", 1);
    -[UIDatePicker setContentHorizontalAlignment:](v4->_datePicker, "setContentHorizontalAlignment:", 5);
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, sel_datePickerChanged_, 4096);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMinimumDate:](v4->_datePicker, "setMinimumDate:", v10);

    -[UIDatePicker setAccessibilityIdentifier:](v4->_datePicker, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B28]);
    -[MFCalendarCollectionViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_datePicker);

    v12 = v4->_datePicker;
    -[MFCalendarCollectionViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker mf_pinToView:usingLayoutMargins:](v12, "mf_pinToView:usingLayoutMargins:", v13, 0);

  }
  return v4;
}

- (void)datePickerChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFCalendarCollectionViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarCollectionViewCell:didChangeDate:", self, v5);

}

- (void)updateCalendarDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFCalendarCollectionViewCell datePicker](self, "datePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

}

- (MFCalendarCollectionViewCellDelegate)delegate
{
  return (MFCalendarCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
