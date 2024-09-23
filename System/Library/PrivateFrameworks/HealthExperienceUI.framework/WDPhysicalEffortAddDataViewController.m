@implementation WDPhysicalEffortAddDataViewController

- (WDPhysicalEffortAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDPhysicalEffortAddDataViewController *v7;
  void *v8;
  uint64_t v9;
  WDAddDataManualEntryItem *physicalEffortItem;
  WDAddDataManualEntryItem *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WDAddDataManualEntryItem *dateRangeItem;
  WDPhysicalEffortAddDataViewController *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WDPhysicalEffortAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v19, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  if (v7)
  {
    HKIntegerFormatter();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 1, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    physicalEffortItem = v7->_physicalEffortItem;
    v7->_physicalEffortItem = (WDAddDataManualEntryItem *)v9;

    -[WDAddDataManualEntryItem setDelegate:](v7->_physicalEffortItem, "setDelegate:", v7);
    v11 = v7->_physicalEffortItem;
    HABundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PHYSICAL_EFFORT_UNIT"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem setTitle:](v11, "setTitle:", v13);

    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v7->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dateRangeItem = v7->_dateRangeItem;
    v7->_dateRangeItem = (WDAddDataManualEntryItem *)v15;

    -[WDAddDataManualEntryItem setDelegate:](v7->_dateRangeItem, "setDelegate:", v7);
    v17 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDPhysicalEffortAddDataViewController;
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
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_physicalEffortItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[WDAddDataManualEntryItem generateValue](self->_dateRangeItem, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB6A40];
  v9 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kcal/(kg*hr)"));
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
  WDAddDataManualEntryItem **p_dateRangeItem;
  void *v4;
  WDAddDataManualEntryItem *dateRangeItem;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    dateRangeItem = self->_dateRangeItem;
    p_dateRangeItem = &dateRangeItem;
  }
  else
  {
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return v4;
    }
    v7[0] = self->_physicalEffortItem;
    p_dateRangeItem = (WDAddDataManualEntryItem **)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_dateRangeItem, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)defaultEditingItem
{
  return self->_physicalEffortItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  WDAddDataManualEntryItem *dateRangeItem;
  id v5;
  void *v6;
  void *v7;
  id v8;

  dateRangeItem = self->_dateRangeItem;
  v5 = a3;
  -[WDAddDataManualEntryItem generateValue](dateRangeItem, "generateValue");
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKManualEntryValidationController *validationController;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  HKManualEntryValidationController *v19;
  void *v20;
  uint64_t v21;
  id v22;

  -[WDAddDataManualEntryItem generateValue](self->_physicalEffortItem, "generateValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAddDataManualEntryItem generateValue](self->_dateRangeItem, "generateValue");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType presentation](self->super._displayType, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_physicalEffortItem, "generateValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustedValueForClientValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v13, "quantityWithUnit:doubleValue:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  validationController = self->super._validationController;
  -[HKDisplayType objectType](self->super._displayType, "objectType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKManualEntryValidationController validateQuantity:ofType:](validationController, "validateQuantity:ofType:", v14, v16);

  if (v17 == 2
    || (v18 = v4 != 0,
        v19 = self->super._validationController,
        -[HKDisplayType sampleType](self->super._displayType, "sampleType"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](v19, "validateMinimumAllowedDuration:ofType:", v20, v8), v20, v21 == 2))
  {
    v18 = 0;
  }
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalEffortItem, 0);
  objc_storeStrong((id *)&self->_dateRangeItem, 0);
}

@end
