@implementation _WDHeightPickerManualEntryItem

- (_WDHeightPickerManualEntryItem)initWithDisplayName:(id)a3
{
  id v4;
  _WDHeightPickerManualEntryItem *v5;
  uint64_t v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDHeightPickerManualEntryItem;
  v5 = -[_WDHeightPickerManualEntryItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

  }
  return v5;
}

- (id)tableViewCells
{
  HXUIInlinePickerTableViewCell *tableViewCell;
  HXUIInlinePickerTableViewCell *v4;
  HXUIInlinePickerTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HXUIInlinePickerTableViewCell *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    -[WDAddDataManualEntryItem _createHXUIInlinePickerTableViewCellWithTitle:](self, "_createHXUIInlinePickerTableViewCellWithTitle:", self->_displayName);
    v4 = (HXUIInlinePickerTableViewCell *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tableViewCell;
    self->_tableViewCell = v4;

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSource:", self);

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectRow:inComponent:animated:", 5, 0, 0);

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectRow:inComponent:animated:", 4, 1, 0);

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectRow:inComponent:animated:", 5, 0, 0);

    v11 = self->_tableViewCell;
    HKUIJoinStringsForAutomationIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUIInlinePickerTableViewCell setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v12);

    -[_WDHeightPickerManualEntryItem _updateTableViewCell](self, "_updateTableViewCell");
    tableViewCell = self->_tableViewCell;
  }
  v14[0] = tableViewCell;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double result;

  objc_msgSend(MEMORY[0x1E0D2F818], "pickerView:maxWidthForComponent:", a3, a4);
  return result;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4;

  v4 = 12;
  if (a4 != 1)
    v4 = 0;
  if (a4)
    return v4;
  else
    return 10;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  HKLocalizedNoDataString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a5 <= 1)
  {
    HKIntegerFormatter();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit();
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  return v7;
}

- (void)_updateTableViewCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRowInComponent:", 1);

  HKIntegerFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  HKIntegerFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FEET_INCH_FORMAT %@ %@"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v16, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HXUIInlinePickerTableViewCell setValue:](self->_tableViewCell, "setValue:", v15);
  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");

}

- (id)generateValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") >= 1)
  {
    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedRowInComponent:", 0);

    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "selectedRowInComponent:", 1);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v9 / 12.0 + (double)v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WDHeightPickerManualEntryItem;
  v4 = a3;
  -[WDAddDataManualEntryItem setTitle:](&v5, sel_setTitle_, v4);
  -[HXUIInlinePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);

}

- (NSString)feetUnitString
{
  return self->_feetUnitString;
}

- (void)setFeetUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_feetUnitString, a3);
}

- (NSString)inchUnitString
{
  return self->_inchUnitString;
}

- (void)setInchUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_inchUnitString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inchUnitString, 0);
  objc_storeStrong((id *)&self->_feetUnitString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end
