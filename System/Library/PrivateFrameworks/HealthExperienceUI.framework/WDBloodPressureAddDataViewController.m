@implementation WDBloodPressureAddDataViewController

- (WDBloodPressureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  id v12;
  WDBloodPressureAddDataViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  WDAddDataManualEntryItem *dateTimeEntryItem;
  void *v21;
  uint64_t v22;
  WDAddDataManualEntryItem *systolicEntryItem;
  void *v24;
  uint64_t v25;
  WDAddDataManualEntryItem *diastolicEntryItem;
  objc_super v28;

  v12 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WDBloodPressureAddDataViewController;
  v13 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v28, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, v12, a4, a5, a6, a7);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SYSTOLIC"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DIASTOLIC"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v13->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem twoPartDateTimeItemWithMaximumDate:](WDAddDataManualEntryItem, "twoPartDateTimeItemWithMaximumDate:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    dateTimeEntryItem = v13->_dateTimeEntryItem;
    v13->_dateTimeEntryItem = (WDAddDataManualEntryItem *)v19;

    objc_msgSend(v12, "roundingMode");
    HKDecimalFormatter();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 1, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    systolicEntryItem = v13->_systolicEntryItem;
    v13->_systolicEntryItem = (WDAddDataManualEntryItem *)v22;

    objc_msgSend(v12, "roundingMode");
    HKDecimalFormatter();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 1, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    diastolicEntryItem = v13->_diastolicEntryItem;
    v13->_diastolicEntryItem = (WDAddDataManualEntryItem *)v25;

    -[WDAddDataManualEntryItem setTitle:](v13->_systolicEntryItem, "setTitle:", v15);
    -[WDAddDataManualEntryItem setTitle:](v13->_diastolicEntryItem, "setTitle:", v17);
    -[WDAddDataManualEntryItem setDelegate:](v13->_systolicEntryItem, "setDelegate:", v13);
    -[WDAddDataManualEntryItem setDelegate:](v13->_diastolicEntryItem, "setDelegate:", v13);

  }
  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDBloodPressureAddDataViewController;
  -[WDAddDataViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", 0);
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem *systolicEntryItem;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  systolicEntryItem = self->_systolicEntryItem;
  v5[0] = self->_dateTimeEntryItem;
  v5[1] = systolicEntryItem;
  v5[2] = self->_diastolicEntryItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)defaultEditingItem
{
  return self->_systolicEntryItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(id, uint64_t, void *, uint64_t);

  v40 = (void (**)(id, uint64_t, void *, uint64_t))a3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKManualEntryValidationController supportedQuantityTypes](self->super._validationController, "supportedQuantityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "containsObject:", v7))
  {
    v29 = 0;
    v30 = 1;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if (v9)
  {
    -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType presentation](self->super._displayType, "presentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem generateValue](self->_systolicEntryItem, "generateValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adjustedValueForClientValue:", v11);
    v38 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDisplayType presentation](self->super._displayType, "presentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem generateValue](self->_diastolicEntryItem, "generateValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "adjustedValueForClientValue:", v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v15, "quantityWithUnit:doubleValue:", v7);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v39, "doubleValue");
    objc_msgSend(v17, "quantityWithUnit:doubleValue:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v16;
    v19 = -[HKManualEntryValidationController validateQuantity:ofType:](self->super._validationController, "validateQuantity:ofType:", v16, v4);
    v36 = (void *)v18;
    v20 = -[HKManualEntryValidationController validateQuantity:ofType:](self->super._validationController, "validateQuantity:ofType:", v18, v38);
    -[HKDisplayType hk_valueFormatterForUnit:](self->super._displayType, "hk_valueFormatterForUnit:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v12;
    objc_msgSend(v21, "stringFromValue:displayType:unitController:", v12, self->super._displayType, self->super._unitController);
    v22 = objc_claimAutoreleasedReturnValue();

    -[HKDisplayType hk_valueFormatterForUnit:](self->super._displayType, "hk_valueFormatterForUnit:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringFromValue:displayType:unitController:", v39, self->super._displayType, self->super._unitController);
    v24 = objc_claimAutoreleasedReturnValue();

    if (v19 == 1 && v20 == 1)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      HABundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)v24;
      v34 = v24;
    }
    else
    {
      v28 = (void *)v24;
      if (v19 != 1)
      {
        v31 = (void *)v22;
        v32 = v35;
        v5 = v38;
        if (v20 != 1)
        {
          v29 = 0;
          v30 = 1;
          goto LABEL_12;
        }
        v33 = (void *)MEMORY[0x1E0CB3940];
        HABundle();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        v30 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v25 = (void *)MEMORY[0x1E0CB3940];
      HABundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v22;
    objc_msgSend(v25, "stringWithFormat:", v27, v22, v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35;
    v5 = v38;
    goto LABEL_11;
  }
  v29 = 0;
  v30 = 1;
LABEL_14:
  v40[2](v40, v30, v29, 1);

}

- (id)generateHKObjects
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
  v3 = objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_systolicEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_diastolicEntryItem, "generateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType presentation](self->super._displayType, "presentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedValueForClientValue:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDisplayType presentation](self->super._displayType, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedValueForClientValue:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v28, "doubleValue");
  v27 = (void *)v3;
  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_dateTimeEntryItem, "generateValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v15, v9, v12, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v18, v11, v12, v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB6518];
  objc_msgSend(MEMORY[0x1E0CB6978], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AB8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v16, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "correlationWithType:startDate:endDate:objects:metadata:", v21, v12, v12, v22, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v23;
  v29[1] = v16;
  v29[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)_systolicAndDiastolicHaveValues
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WDAddDataManualEntryItem generateValue](self->_systolicEntryItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAddDataManualEntryItem generateValue](self->_diastolicEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKManualEntryValidationController *validationController;
  void *v19;
  uint64_t v20;
  HKManualEntryValidationController *v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v25;
  void *v26;

  if (-[WDBloodPressureAddDataViewController _systolicAndDiastolicHaveValues](self, "_systolicAndDiastolicHaveValues", a3))
  {
    -[HKManualEntryValidationController supportedQuantityTypes](self->super._validationController, "supportedQuantityTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CB5AA8];
    if (!objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CB5AA8]))
    {
      v25 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[HKManualEntryValidationController supportedQuantityTypes](self->super._validationController, "supportedQuantityTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CB5AA0];
    v8 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB5AA0]);

    if (v8)
    {
      -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType presentation](self->super._displayType, "presentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDAddDataManualEntryItem generateValue](self->_systolicEntryItem, "generateValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "adjustedValueForClientValue:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKDisplayType presentation](self->super._displayType, "presentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDAddDataManualEntryItem generateValue](self->_diastolicEntryItem, "generateValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "adjustedValueForClientValue:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v26, "doubleValue");
      objc_msgSend(v14, "quantityWithUnit:doubleValue:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(v16, "quantityWithUnit:doubleValue:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      validationController = self->super._validationController;
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HKManualEntryValidationController validateQuantity:ofType:](validationController, "validateQuantity:ofType:", v15, v19);

      v21 = self->super._validationController;
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HKManualEntryValidationController validateQuantity:ofType:](v21, "validateQuantity:ofType:", v17, v22);

      v25 = v20 != 2 && v23 != 2;
      goto LABEL_13;
    }
  }
  v25 = 0;
LABEL_14:
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v25);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicEntryItem, 0);
  objc_storeStrong((id *)&self->_systolicEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end
