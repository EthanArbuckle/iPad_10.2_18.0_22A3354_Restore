@implementation WDAddDataManualEntrySpinner

- (WDAddDataManualEntrySpinner)initWithDisplayName:(id)a3
{
  id v4;
  WDAddDataManualEntrySpinner *v5;
  uint64_t v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAddDataManualEntrySpinner;
  v5 = -[WDAddDataManualEntrySpinner init](&v9, sel_init);
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
  HXUIInlinePickerTableViewCell *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v8, "selectRow:inComponent:animated:", self->_selectedPickerViewIndex, 0, 0);

    v9 = self->_tableViewCell;
    HKUIJoinStringsForAutomationIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUIInlinePickerTableViewCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v10);

    -[WDAddDataManualEntrySpinner _updateTableViewCellValue](self, "_updateTableViewCellValue");
    tableViewCell = self->_tableViewCell;
  }
  v12[0] = tableViewCell;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateValue
{
  void *v2;
  uint64_t v3;

  -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRowInComponent:", 0);

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_selectedPickerViewIndex = objc_msgSend(v5, "integerValue");
    -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectRow:inComponent:animated:", self->_selectedPickerViewIndex, 0, 0);

    -[WDAddDataManualEntrySpinner _updateTableViewCellValue](self, "_updateTableViewCellValue");
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id WeakRetained;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_msgSend(WeakRetained, "numberOfRowsInManualEntrySpinner:", self);

  return v6;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v8 = a6;
  v9 = v8;
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 23.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "manualEntrySpinner:titleForRow:", self, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v12);

  return v9;
}

- (void)_updateTableViewCellValue
{
  HXUIInlinePickerTableViewCell *tableViewCell;
  id WeakRetained;
  void *v5;
  void *v6;

  tableViewCell = self->_tableViewCell;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  -[HXUIInlinePickerTableViewCell pickerView](self->_tableViewCell, "pickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "manualEntrySpinner:titleForRow:", self, objc_msgSend(v5, "selectedRowInComponent:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HXUIInlinePickerTableViewCell setValue:](tableViewCell, "setValue:", v6);

  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDAddDataManualEntrySpinner;
  v4 = a3;
  -[WDAddDataManualEntryItem setTitle:](&v5, sel_setTitle_, v4);
  -[HXUIInlinePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);

}

- (WDAddDataManualEntrySpinnerDataSource)dataSource
{
  return (WDAddDataManualEntrySpinnerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

- (int64_t)_wd_deliveryReason
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  -[WDAddDataManualEntrySpinner generateValue](self, "generateValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 >= 1)
    v4 = 1;
  else
    v4 = v3;
  return v4 + 1;
}

- (void)set_wd_deliveryReason:(int64_t)a3
{
  int64_t v4;
  id v5;

  v4 = 2;
  if (a3 > 2)
    v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4 - 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntrySpinner setValue:](self, "setValue:", v5);

}

@end
