@implementation _WDDateWithDurationManualEntryItem

- (_WDDateWithDurationManualEntryItem)initWithMaximumDate:(id)a3
{
  id v5;
  _WDDateWithDurationManualEntryItem *v6;
  _WDDateWithDurationManualEntryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDDateWithDurationManualEntryItem;
  v6 = -[_WDDateWithDurationManualEntryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumStartDate, a3);
    -[_WDDateWithDurationManualEntryItem _setupEntryItems](v7, "_setupEntryItems");
  }

  return v7;
}

- (id)tableViewCells
{
  void *v3;
  void *v4;
  void *v5;

  -[WDAddDataManualEntryItem tableViewCells](self->_startItem, "tableViewCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem tableViewCells](self->_durationItem, "tableViewCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setupEntryItems
{
  NSDate *maximumStartDate;
  void *v4;
  void *v5;
  WDAddDataManualEntryItem *v6;
  WDAddDataManualEntryItem *startItem;
  void *v8;
  WDAddDataManualEntryItem *v9;
  WDAddDataManualEntryItem *durationItem;
  WDAddDataManualEntryItem *v11;
  void *v12;
  void *v13;
  WDAddDataManualEntryItem *v14;
  void *v15;
  void *v16;

  maximumStartDate = self->_maximumStartDate;
  HABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STARTS"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:", maximumStartDate, 1, v5);
  v6 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  startItem = self->_startItem;
  self->_startItem = v6;

  HKIntegerFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 1, v8);
  v9 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  durationItem = self->_durationItem;
  self->_durationItem = v9;

  v11 = self->_durationItem;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DURATION"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem setTitle:](v11, "setTitle:", v13);

  v14 = self->_durationItem;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SECONDS_MEDIUM"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem setSecondaryLabel:](v14, "setSecondaryLabel:", v16);

  -[WDAddDataManualEntryItem setDelegate:](self->_startItem, "setDelegate:", self);
  -[WDAddDataManualEntryItem setDelegate:](self->_durationItem, "setDelegate:", self);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[WDAddDataManualEntryItem delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v8);

}

- (id)generateValue
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  -[WDAddDataManualEntryItem generateValue](self->_startItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_durationItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D2F8E0];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v3, "dateByAddingTimeInterval:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueRangeWithMinValue:maxValue:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)beginEditing
{
  -[WDAddDataManualEntryItem beginEditing](self->_durationItem, "beginEditing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumStartDate, 0);
  objc_storeStrong((id *)&self->_durationItem, 0);
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end
