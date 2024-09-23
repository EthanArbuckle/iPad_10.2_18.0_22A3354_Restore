@implementation MFTimeWheelCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFTimeWheelCollectionViewCellIdentifier");
}

- (MFTimeWheelCollectionViewCell)initWithFrame:(CGRect)a3
{
  MFTimeWheelCollectionViewCell *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFTimeWheelCollectionViewCell;
  v3 = -[MFTimeWheelCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimeWheelCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = objc_alloc_init(MEMORY[0x1E0DC36F0]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);
    objc_msgSend(v6, "setPreferredDatePickerStyle:", 1);
    objc_msgSend(v6, "setDatePickerMode:", 0);
    objc_msgSend(v6, "setContentHorizontalAlignment:", 5);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumDate:", v8);

    objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BF0]);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v3, sel_datePickerChanged_, 4096);
    -[MFTimeWheelCollectionViewCell setTimePicker:](v3, "setTimePicker:", v6);
    -[MFTimeWheelCollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimeWheelCollectionViewCell timePicker](v3, "timePicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[MFTimeWheelCollectionViewCell timePicker](v3, "timePicker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimeWheelCollectionViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mf_pinToView:usingLayoutMargins:", v12, 0);

  }
  return v3;
}

- (void)datePickerChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFTimeWheelCollectionViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeCollectionViewCell:didChangeDate:", self, v5);

}

- (void)setMinimumDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFTimeWheelCollectionViewCell timePicker](self, "timePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumDate:", v5);

}

- (NSDate)minimumDate
{
  void *v2;
  void *v3;

  -[MFTimeWheelCollectionViewCell timePicker](self, "timePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFTimeWheelCollectionViewCell timePicker](self, "timePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[MFTimeWheelCollectionViewCell timePicker](self, "timePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (MFTimeWheelCollectionViewCellDelegate)delegate
{
  return (MFTimeWheelCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_timePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
