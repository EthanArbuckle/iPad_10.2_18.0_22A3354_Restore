@implementation _WDTwoPartDateTimeManualEntryItem

- (_WDTwoPartDateTimeManualEntryItem)initWithMaximumDate:(id)a3
{
  id v5;
  _WDTwoPartDateTimeManualEntryItem *v6;
  _WDTwoPartDateTimeManualEntryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDTwoPartDateTimeManualEntryItem;
  v6 = -[_WDTwoPartDateTimeManualEntryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumDate, a3);
    -[_WDTwoPartDateTimeManualEntryItem _setupTableViewCells](v7, "_setupTableViewCells");
  }

  return v7;
}

- (id)tableViewCells
{
  HXUIInlineDatePickerTableViewCell *timeTableViewCell;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  timeTableViewCell = self->_timeTableViewCell;
  v4[0] = self->_dateTableViewCell;
  v4[1] = timeTableViewCell;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setupTableViewCells
{
  void *v3;
  void *v4;
  HXUIInlineDatePickerTableViewCell *v5;
  HXUIInlineDatePickerTableViewCell *dateTableViewCell;
  void *v7;
  void *v8;
  HXUIInlineDatePickerTableViewCell *v9;
  HXUIInlineDatePickerTableViewCell *timeTableViewCell;
  void *v11;
  void *v12;
  HXUIInlineDatePickerTableViewCell *v13;
  void *v14;
  HXUIInlineDatePickerTableViewCell *v15;
  void *v16;
  void *v17;
  id v18;

  HABundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem _createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:](self, "_createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:", v4, 1, self->_maximumDate);
  v5 = (HXUIInlineDatePickerTableViewCell *)objc_claimAutoreleasedReturnValue();
  dateTableViewCell = self->_dateTableViewCell;
  self->_dateTableViewCell = v5;

  HABundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TIME"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem _createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:](self, "_createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:", v8, 0, self->_maximumDate);
  v9 = (HXUIInlineDatePickerTableViewCell *)objc_claimAutoreleasedReturnValue();
  timeTableViewCell = self->_timeTableViewCell;
  self->_timeTableViewCell = v9;

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_dateTableViewCell, "datePicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__datePickerDidChange_, 4096);

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_timeTableViewCell, "datePicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__timePickerDidChange_, 4096);

  v13 = self->_dateTableViewCell;
  HKUIJoinStringsForAutomationIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HXUIInlineDatePickerTableViewCell setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", v14);

  v15 = self->_timeTableViewCell;
  HKUIJoinStringsForAutomationIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HXUIInlineDatePickerTableViewCell setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v16);

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_timeTableViewCell, "datePicker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WDTwoPartDateTimeManualEntryItem _timePickerDidChange:](self, "_timePickerDidChange:", v17);

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_dateTableViewCell, "datePicker");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[_WDTwoPartDateTimeManualEntryItem _datePickerDidChange:](self, "_datePickerDidChange:", v18);

}

- (void)_datePickerDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58___WDTwoPartDateTimeManualEntryItem__datePickerDidChange___block_invoke;
  v5[3] = &unk_1E55754C8;
  objc_copyWeak(&v6, &location);
  -[_WDTwoPartDateTimeManualEntryItem _generateValue:](self, "_generateValue:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_saveDisambiguatedDate:(id)a3
{
  NSDate *v4;
  uint64_t v5;
  NSDate *chosenDate;
  NSDate *v7;
  NSDate *v8;
  void *v9;

  v4 = (NSDate *)a3;
  if (self->_maximumDate)
  {
    HKUIObjectMin();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (NSDate *)v5;
  }
  chosenDate = self->_chosenDate;
  self->_chosenDate = v4;
  v7 = v4;

  v8 = self->_chosenDate;
  -[HXUIInlineDatePickerTableViewCell datePicker](self->_timeTableViewCell, "datePicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v8);

  -[_WDTwoPartDateTimeManualEntryItem _updateCellLabels](self, "_updateCellLabels");
}

- (void)_timePickerDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58___WDTwoPartDateTimeManualEntryItem__timePickerDidChange___block_invoke;
  v5[3] = &unk_1E55754C8;
  objc_copyWeak(&v6, &location);
  -[_WDTwoPartDateTimeManualEntryItem _generateValue:](self, "_generateValue:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_updateCellLabels
{
  HXUIInlineDatePickerTableViewCell *dateTableViewCell;
  void *v4;
  void *v5;
  HXUIInlineDatePickerTableViewCell *timeTableViewCell;
  void *v7;
  void *v8;

  dateTableViewCell = self->_dateTableViewCell;
  -[HXUIInlineDatePickerTableViewCell datePicker](dateTableViewCell, "datePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HXUIInlineDatePickerTableViewCell updateLabelWithDate:](dateTableViewCell, "updateLabelWithDate:", v5);

  timeTableViewCell = self->_timeTableViewCell;
  -[HXUIInlineDatePickerTableViewCell datePicker](timeTableViewCell, "datePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HXUIInlineDatePickerTableViewCell updateLabelWithDate:](timeTableViewCell, "updateLabelWithDate:", v8);

  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");
}

- (id)generateValue
{
  return self->_chosenDate;
}

- (void)_generateValue:(id)a3
{
  HXUIInlineDatePickerTableViewCell *timeTableViewCell;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  timeTableViewCell = self->_timeTableViewCell;
  v5 = a3;
  -[HXUIInlineDatePickerTableViewCell datePicker](timeTableViewCell, "datePicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_dateTableViewCell, "datePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 30, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 96, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v12, "setEra:", objc_msgSend(v10, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v10, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v10, "month"));
  objc_msgSend(v12, "setDay:", objc_msgSend(v10, "day"));
  objc_msgSend(v12, "setHour:", objc_msgSend(v11, "hour"));
  objc_msgSend(v12, "setMinute:", objc_msgSend(v11, "minute"));
  objc_msgSend(v9, "timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v13);

  -[WDAddDataManualEntryItem _disambiguateDateComponents:withCompletion:](self, "_disambiguateDateComponents:withCompletion:", v12, v5);
}

- (void)setValue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_chosenDate, a3);
    -[HXUIInlineDatePickerTableViewCell datePicker](self->_timeTableViewCell, "datePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDate:", v7);

    -[HXUIInlineDatePickerTableViewCell datePicker](self->_dateTableViewCell, "datePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDate:", v7);

    -[_WDTwoPartDateTimeManualEntryItem _updateCellLabels](self, "_updateCellLabels");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timeTableViewCell, 0);
  objc_storeStrong((id *)&self->_dateTableViewCell, 0);
}

@end
