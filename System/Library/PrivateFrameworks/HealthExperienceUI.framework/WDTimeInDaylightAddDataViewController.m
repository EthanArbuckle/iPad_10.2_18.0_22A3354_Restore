@implementation WDTimeInDaylightAddDataViewController

- (WDTimeInDaylightAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDTimeInDaylightAddDataViewController *v7;
  WDTimeInDaylightAddDataViewController *v8;
  void *v9;
  uint64_t v10;
  WDAddDataManualEntryItem *dateRangeEntryItem;
  WDTimeInDaylightAddDataViewController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDTimeInDaylightAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v14, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v7->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dateRangeEntryItem = v8->_dateRangeEntryItem;
    v8->_dateRangeEntryItem = (WDAddDataManualEntryItem *)v10;

    -[WDAddDataManualEntryItem setDelegate:](v8->_dateRangeEntryItem, "setDelegate:", v8);
    v12 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTimeInDaylightAddDataViewController;
  -[WDAddDataViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", 0);
}

- (id)generateHKObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0CB6A40];
  v10 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v3, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    return MEMORY[0x1E0C9AA60];
  v4[0] = self->_dateRangeEntryItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultEditingItem
{
  return self->_dateRangeEntryItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  WDAddDataManualEntryItem *dateRangeEntryItem;
  id v5;
  void *v6;
  void *v7;
  id v8;

  dateRangeEntryItem = self->_dateRangeEntryItem;
  v5 = a3;
  -[WDAddDataManualEntryItem generateValue](dateRangeEntryItem, "generateValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController validateMaximumAllowedDurationFor:endDate:competion:](self, "validateMaximumAllowedDurationFor:endDate:competion:", v6, v7, v5);

}

- (void)manualEntryItemDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  HKManualEntryValidationController *validationController;
  void *v9;
  _BOOL8 v10;
  id v11;

  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  validationController = self->super._validationController;
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](validationController, "validateMinimumAllowedDuration:ofType:", v9, v7) != 2;

  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeEntryItem, 0);
}

@end
