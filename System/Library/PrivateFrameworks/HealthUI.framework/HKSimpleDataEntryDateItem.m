@implementation HKSimpleDataEntryDateItem

- (HKSimpleDataEntryDateItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 date:(id)a5 defaultDate:(id)a6 dateRange:(id)a7 exportFormatter:(id)a8
{
  id v15;
  id v16;
  id v17;
  HKSimpleDataEntryDateItem *v18;
  HKSimpleDataEntryDateItem *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HKSimpleDataEntryDateItem;
  v18 = -[HKSimpleDataEntryDateItem init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_registrantModelKey, a4);
    objc_storeStrong((id *)&v19->_date, a5);
    objc_storeStrong((id *)&v19->_defaultDate, a6);
    objc_storeStrong((id *)&v19->_dateRange, a7);
    objc_storeStrong((id *)&v19->_exportFormatter, a8);
  }

  return v19;
}

- (id)formattedKeyAndValue
{
  NSDateFormatter *exportFormatter;
  void *v4;
  void *v5;
  void **v6;
  NSString **p_registrantModelKey;
  void *v8;
  NSString *v10;
  void *v11;
  NSString *registrantModelKey;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  exportFormatter = self->_exportFormatter;
  if (exportFormatter)
  {
    registrantModelKey = self->_registrantModelKey;
    -[NSDateFormatter stringFromDate:](exportFormatter, "stringFromDate:", self->_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v13;
    p_registrantModelKey = &registrantModelKey;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_canonicalDateOfBirthDateComponentsWithDate:", self->_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_registrantModelKey;
    v11 = v4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v11;
    p_registrantModelKey = &v10;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, p_registrantModelKey, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cell
{
  HKSimpleDataEntryPlainTextCell *cell;
  HKSimpleDataEntryPlainTextCell *v4;
  HKSimpleDataEntryPlainTextCell *v5;
  void *v6;
  UIDatePicker *v7;
  UIDatePicker *datePicker;
  UIDatePicker *v9;
  void *v10;
  void *v11;
  UIDatePicker *v12;
  void *v13;
  UIDatePicker *v14;
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

  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKSimpleDataEntryPlainTextCell initWithIntention:reuseIdentifier:]([HKSimpleDataEntryPlainTextCell alloc], "initWithIntention:reuseIdentifier:", 9, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKSimpleDataEntryPlainTextCell titleLabel](self->_cell, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_title);

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = self->_datePicker;
    self->_datePicker = v7;

    -[UIDatePicker setPreferredDatePickerStyle:](self->_datePicker, "setPreferredDatePickerStyle:", 1);
    v9 = self->_datePicker;
    objc_msgSend((id)objc_opt_class(), "gregorianGMTCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTimeZone:](v9, "setTimeZone:", v11);

    -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", 1);
    if (self->_date || self->_defaultDate)
      -[UIDatePicker setDate:](self->_datePicker, "setDate:");
    v12 = self->_datePicker;
    -[HKValueRange minValue](self->_dateRange, "minValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMinimumDate:](v12, "setMinimumDate:", v13);

    v14 = self->_datePicker;
    -[HKValueRange maxValue](self->_dateRange, "maxValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMaximumDate:](v14, "setMaximumDate:", v15);

    -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, sel_datePickerValueChanged_, 4096);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_datePicker);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInputView:", v16);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryItem accessoryToolbar](self, "accessoryToolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInputAccessoryView:", v19);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v21);

    if (!-[HKSimpleDataEntryItem placeholderType](self, "placeholderType"))
    {
      -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_OPTIONAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPlaceholder:", v24);

    }
    -[HKSimpleDataEntryDateItem _setTextForInputTextField:](self, "_setTextForInputTextField:", 0);
    -[HKSimpleDataEntryDateItem updateCellDisplay](self, "updateCellDisplay");
    cell = self->_cell;
  }
  return cell;
}

- (void)updateCellDisplay
{
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", self->_date);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSimpleDataEntryDateItem _setTextForInputTextField:](self, "_setTextForInputTextField:", v4);
}

- (void)beginEditing
{
  NSDate *v3;
  NSDate *date;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSimpleDataEntryDateItem;
  -[HKSimpleDataEntryItem beginEditing](&v6, sel_beginEditing);
  if (!self->_date)
  {
    -[UIDatePicker date](self->_datePicker, "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v3;

    -[HKSimpleDataEntryDateItem updateCellDisplay](self, "updateCellDisplay");
    -[HKSimpleDataEntryItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataEntryItemDidUpdateValue:", self);

  }
}

- (void)_setTextForInputTextField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[HKSimpleDataEntryItem placeholderType](self, "placeholderType") == 1 && !objc_msgSend(v9, "length"))
  {
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OD_PICKER_CHOOSE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v7);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthKeyColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v8);

  }
  else
  {
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v9);
  }

}

+ (id)_dateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)_dateFormatter___dateFormatter;
  if (!_dateFormatter___dateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_dateFormatter___dateFormatter;
    _dateFormatter___dateFormatter = (uint64_t)v3;

    v5 = (void *)_dateFormatter___dateFormatter;
    objc_msgSend((id)objc_opt_class(), "gregorianGMTCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v7);

    objc_msgSend((id)_dateFormatter___dateFormatter, "setDateStyle:", 2);
    v2 = (void *)_dateFormatter___dateFormatter;
  }
  return v2;
}

+ (id)gregorianGMTCalendar
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)gregorianGMTCalendar___calendar;
  if (!gregorianGMTCalendar___calendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)gregorianGMTCalendar___calendar;
    gregorianGMTCalendar___calendar = v3;

    v2 = (void *)gregorianGMTCalendar___calendar;
  }
  return v2;
}

- (void)datePickerValueChanged:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  objc_msgSend(a3, "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v4;

  -[HKSimpleDataEntryDateItem updateCellDisplay](self, "updateCellDisplay");
  -[HKSimpleDataEntryItem delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataEntryItemDidUpdateValue:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportFormatter, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_defaultDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
