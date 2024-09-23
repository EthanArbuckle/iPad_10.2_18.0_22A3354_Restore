@implementation _WDNumberBasedAddDataManualEntryItem

- (id)tableViewCells
{
  WDManualDataEntryTableViewCell *tableViewCell;
  void *v4;
  void *v5;
  WDManualDataEntryTableViewCell *v6;
  WDManualDataEntryTableViewCell *v7;
  WDManualDataEntryTableViewCell *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    -[WDAddDataManualEntryItem title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem secondaryLabel](self, "secondaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem _createWDManualDataEntryTableViewCellWithDisplayName:unitName:entryType:highlightWhenEditing:](self, "_createWDManualDataEntryTableViewCellWithDisplayName:unitName:entryType:highlightWhenEditing:", v4, v5, self->_manualEntryType, 0);
    v6 = (WDManualDataEntryTableViewCell *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tableViewCell;
    self->_tableViewCell = v6;

    v8 = self->_tableViewCell;
    HKUIJoinStringsForAutomationIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDManualDataEntryTableViewCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v9);

    -[WDManualDataEntryTableViewCell setDelegate:](self->_tableViewCell, "setDelegate:", self);
    tableViewCell = self->_tableViewCell;
  }
  v11[0] = tableViewCell;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateValue
{
  NSNumberFormatter *numberFormatter;
  void *v3;
  void *v4;

  numberFormatter = self->_numberFormatter;
  -[WDManualDataEntryTableViewCell value](self->_tableViewCell, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter numberFromString:](numberFormatter, "numberFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValue:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSNumberFormatter stringFromNumber:](self->_numberFormatter, "stringFromNumber:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDManualDataEntryTableViewCell setValue:](self->_tableViewCell, "setValue:", v4);

  }
  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");

}

- (void)beginEditing
{
  -[WDManualDataEntryTableViewCell beginEditing](self->_tableViewCell, "beginEditing");
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WDNumberBasedAddDataManualEntryItem;
  v4 = a3;
  -[WDAddDataManualEntryItem setTitle:](&v5, sel_setTitle_, v4);
  -[WDManualDataEntryTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);

}

- (unint64_t)manualEntryType
{
  return self->_manualEntryType;
}

- (void)setManualEntryType:(unint64_t)a3
{
  self->_manualEntryType = a3;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end
