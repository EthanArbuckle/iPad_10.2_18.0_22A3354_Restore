@implementation WDUVExposureAddDataViewController

- (WDUVExposureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDUVExposureAddDataViewController *v7;
  void *v8;
  uint64_t v9;
  WDAddDataManualEntryItem *valueEntryItem;
  WDAddDataManualEntryItem *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WDAddDataManualEntryItem *dateRangeEntryItem;
  WDUVExposureAddDataViewController *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WDUVExposureAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v19, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  if (v7)
  {
    HKIntegerFormatter();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    valueEntryItem = v7->_valueEntryItem;
    v7->_valueEntryItem = (WDAddDataManualEntryItem *)v9;

    -[WDAddDataManualEntryItem setDelegate:](v7->_valueEntryItem, "setDelegate:", v7);
    v11 = v7->_valueEntryItem;
    HABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UV_INDEX"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem setTitle:](v11, "setTitle:", v13);

    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v7->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dateRangeEntryItem = v7->_dateRangeEntryItem;
    v7->_dateRangeEntryItem = (WDAddDataManualEntryItem *)v15;

    -[WDAddDataManualEntryItem setDelegate:](v7->_dateRangeEntryItem, "setDelegate:", v7);
    v17 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDUVExposureAddDataViewController;
  -[WDAddDataViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", 0);
}

- (id)generateHKObjects
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_valueEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB6A40];
  v9 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v3, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)numberOfSections
{
  return 2;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem **p_dateRangeEntryItem;
  void *v4;
  WDAddDataManualEntryItem *dateRangeEntryItem;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    dateRangeEntryItem = self->_dateRangeEntryItem;
    p_dateRangeEntryItem = &dateRangeEntryItem;
  }
  else
  {
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return v4;
    }
    v7[0] = self->_valueEntryItem;
    p_dateRangeEntryItem = (WDAddDataManualEntryItem **)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_dateRangeEntryItem, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)defaultEditingItem
{
  return self->_valueEntryItem;
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
  void *v6;
  double v7;
  double v8;
  HKManualEntryValidationController *validationController;
  void *v10;
  uint64_t v11;
  _BOOL8 v13;
  id v14;

  -[WDAddDataManualEntryItem generateValue](self->_valueEntryItem, "generateValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  validationController = self->super._validationController;
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](validationController, "validateMinimumAllowedDuration:ofType:", v10, v8);

  v13 = v11 != 2 && v4 != 0;
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueEntryItem, 0);
  objc_storeStrong((id *)&self->_dateRangeEntryItem, 0);
}

@end
