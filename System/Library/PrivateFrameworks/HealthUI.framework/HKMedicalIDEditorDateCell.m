@implementation HKMedicalIDEditorDateCell

- (id)formattedValue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)formattedValue___dateFormatter;
  if (!formattedValue___dateFormatter)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = (void *)formattedValue___dateFormatter;
    formattedValue___dateFormatter = (uint64_t)v4;

    objc_msgSend((id)formattedValue___dateFormatter, "setDateStyle:", 2);
    v3 = (void *)formattedValue___dateFormatter;
  }
  -[HKMedicalIDEditorDateCell dateValue](self, "dateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (void)_configureDatePicker
{
  UIDatePicker *v3;
  UIDatePicker *picker;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_picker)
  {
    v3 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    picker = self->_picker;
    self->_picker = v3;

    -[UIDatePicker setPreferredDatePickerStyle:](self->_picker, "setPreferredDatePickerStyle:", 1);
    -[UIDatePicker setDatePickerMode:](self->_picker, "setDatePickerMode:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMaximumDate:](self->_picker, "setMaximumDate:", v5);

    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_minimumDateForBirthDateWithCalendar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMinimumDate:](self->_picker, "setMinimumDate:", v8);

    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputView:", v9);

    -[UIDatePicker addTarget:action:forControlEvents:](self->_picker, "addTarget:action:forControlEvents:", self, sel__dateChanged_, 4096);
  }
  if (self->_dateValue)
  {
    -[UIDatePicker setDate:](self->_picker, "setDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setDate:](self->_picker, "setDate:", v11);

  }
  -[HKMedicalIDEditorDateCell reloadInputViews](self, "reloadInputViews");
}

- (void)_showDatePicker
{
  NSDate *v3;
  NSDate *dateValue;
  id v5;

  -[HKMedicalIDEditorDateCell _configureDatePicker](self, "_configureDatePicker");
  if (!self->_dateValue)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateValue = self->_dateValue;
    self->_dateValue = v3;

    -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
  }
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

}

- (void)_hideDatePicker
{
  id v2;

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)_dateChanged:(id)a3
{
  NSDate *v4;
  NSDate *dateValue;

  -[UIDatePicker date](self->_picker, "date", a3);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateValue = self->_dateValue;
  self->_dateValue = v4;

  -[HKMedicalIDEditorCell valueDidChange](self, "valueDidChange");
}

- (void)beginEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorDateCell;
  -[HKMedicalIDEditorCell beginEditing](&v3, sel_beginEditing);
  -[HKMedicalIDEditorDateCell _showDatePicker](self, "_showDatePicker");
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
