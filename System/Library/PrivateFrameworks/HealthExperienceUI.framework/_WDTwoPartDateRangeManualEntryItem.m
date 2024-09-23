@implementation _WDTwoPartDateRangeManualEntryItem

- (_WDTwoPartDateRangeManualEntryItem)initWithMaximumEndDate:(id)a3
{
  id v5;
  _WDTwoPartDateRangeManualEntryItem *v6;
  _WDTwoPartDateRangeManualEntryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDTwoPartDateRangeManualEntryItem;
  v6 = -[_WDTwoPartDateRangeManualEntryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumEndDate, a3);
    -[_WDTwoPartDateRangeManualEntryItem _setupEntryItems](v7, "_setupEntryItems");
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
  -[WDAddDataManualEntryItem tableViewCells](self->_endItem, "tableViewCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setupEntryItems
{
  NSDate *maximumEndDate;
  void *v4;
  void *v5;
  WDAddDataManualEntryItem *v6;
  WDAddDataManualEntryItem *startItem;
  NSDate *v8;
  void *v9;
  void *v10;
  WDAddDataManualEntryItem *v11;
  WDAddDataManualEntryItem *endItem;

  maximumEndDate = self->_maximumEndDate;
  HABundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STARTS"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:", maximumEndDate, 1, v5);
  v6 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  startItem = self->_startItem;
  self->_startItem = v6;

  v8 = self->_maximumEndDate;
  HABundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENDS"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:highlightWhenEditing:displayName:", v8, 1, v10);
  v11 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  endItem = self->_endItem;
  self->_endItem = v11;

  -[WDAddDataManualEntryItem setDelegate:](self->_startItem, "setDelegate:", self);
  -[WDAddDataManualEntryItem setDelegate:](self->_endItem, "setDelegate:", self);
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  if (self->_startItem == a3)
    -[_WDTwoPartDateRangeManualEntryItem _startItemDidChange](self, "_startItemDidChange");
  else
    -[_WDTwoPartDateRangeManualEntryItem _endItemDidChange](self, "_endItemDidChange");
  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");
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

- (void)_startItemDidChange
{
  void *v3;
  int IsLarger;
  id v5;

  -[WDAddDataManualEntryItem generateValue](self->_startItem, "generateValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_endItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsLarger = HKUIObjectIsLarger();

  if (IsLarger)
    -[WDAddDataManualEntryItem setValue:](self->_endItem, "setValue:", v5);

}

- (void)_endItemDidChange
{
  void *v3;
  int IsSmaller;
  id v5;

  -[WDAddDataManualEntryItem generateValue](self->_endItem, "generateValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_startItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsSmaller = HKUIObjectIsSmaller();

  if (IsSmaller)
    -[WDAddDataManualEntryItem setValue:](self->_startItem, "setValue:", v5);

}

- (id)generateValue
{
  void *v3;
  void *v4;
  void *v5;

  -[WDAddDataManualEntryItem generateValue](self->_startItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_endItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D2F8E0], "valueRangeWithMinValue:maxValue:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)beginEditing
{
  -[WDAddDataManualEntryItem beginEditing](self->_startItem, "beginEditing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumEndDate, 0);
  objc_storeStrong((id *)&self->_endItem, 0);
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end
