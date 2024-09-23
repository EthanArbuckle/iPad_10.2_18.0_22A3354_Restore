@implementation _WDDateBasedAddDataManualEntryItem

- (_WDDateBasedAddDataManualEntryItem)initWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 datePickerMode:(int64_t)a5 displayName:(id)a6
{
  id v11;
  id v12;
  _WDDateBasedAddDataManualEntryItem *v13;
  uint64_t v14;
  NSString *displayName;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_WDDateBasedAddDataManualEntryItem;
  v13 = -[_WDDateBasedAddDataManualEntryItem init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_maximumDate, a3);
    v13->_highlightWhenEditing = a4;
    v13->_datePickerMode = a5;
  }

  return v13;
}

- (id)tableViewCells
{
  HXUIInlineDatePickerTableViewCell *tableViewCell;
  HXUIInlineDatePickerTableViewCell *v4;
  HXUIInlineDatePickerTableViewCell *v5;
  void *v6;
  HXUIInlineDatePickerTableViewCell *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    -[WDAddDataManualEntryItem _createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:](self, "_createHXUIInlineDatePickerTableViewCellWithTitle:datePickerMode:maxDate:", self->_displayName, self->_datePickerMode, self->_maximumDate);
    v4 = (HXUIInlineDatePickerTableViewCell *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tableViewCell;
    self->_tableViewCell = v4;

    -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__datePickerDidChange_, 4096);

    v7 = self->_tableViewCell;
    HKUIJoinStringsForAutomationIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUIInlineDatePickerTableViewCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v8);

    -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WDDateBasedAddDataManualEntryItem _datePickerDidChange:](self, "_datePickerDidChange:", v9);

    tableViewCell = self->_tableViewCell;
  }
  v11[0] = tableViewCell;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v5[2] = __59___WDDateBasedAddDataManualEntryItem__datePickerDidChange___block_invoke;
  v5[3] = &unk_1E55754C8;
  objc_copyWeak(&v6, &location);
  -[_WDDateBasedAddDataManualEntryItem _generateValue:](self, "_generateValue:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)_saveDisambiguatedDate:(id)a3
{
  id v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *chosenDate;
  id v8;
  id v9;

  v4 = a3;
  if (self->_maximumDate)
  {
    v8 = v4;
    HKUIObjectMin();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v9 = v4;
  objc_msgSend(v4, "hk_dateWithTruncatedSecond");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  chosenDate = self->_chosenDate;
  self->_chosenDate = v6;

  -[HXUIInlineDatePickerTableViewCell updateLabelWithDate:](self->_tableViewCell, "updateLabelWithDate:", self->_chosenDate);
  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");

}

- (id)generateValue
{
  return self->_chosenDate;
}

- (void)_generateValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 126, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAddDataManualEntryItem _disambiguateDateComponents:withCompletion:](self, "_disambiguateDateComponents:withCompletion:", v8, v5);
}

- (void)setValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v6);

    -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WDDateBasedAddDataManualEntryItem _datePickerDidChange:](self, "_datePickerDidChange:", v5);

  }
}

- (void)setDatePickerMode:(int64_t)a3
{
  id v4;

  -[HXUIInlineDatePickerTableViewCell datePicker](self->_tableViewCell, "datePicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatePickerMode:", a3);

}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WDDateBasedAddDataManualEntryItem;
  v4 = a3;
  -[WDAddDataManualEntryItem setTitle:](&v5, sel_setTitle_, v4);
  -[HXUIInlineDatePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);

}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (int64_t)datePickerMode
{
  return self->_datePickerMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_chosenDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end
