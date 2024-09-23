@implementation WDDisplayTypeAddDataViewController

- (id)createValueFieldManualEntryItem
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType chartingRules](self->super._displayType, "chartingRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedDecimalPrecisionRuleForUnit:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maximumDecimalPrecision");

  -[HKDisplayType localization](self->super._displayType, "localization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKDisplayType displayTypeIdentifier](self->super._displayType, "displayTypeIdentifier") == 15)
  {
    -[HKDisplayType localization](self->super._displayType, "localization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = objc_claimAutoreleasedReturnValue();

    -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self->super._unitController, "localizedDisplayNameForDisplayType:", self->super._displayType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10;
  }
  else
  {
    v11 = &stru_1E55A2388;
  }
  if (!objc_msgSend(v8, "length"))
  {
    -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self->super._unitController, "localizedDisplayNameForDisplayType:", self->super._displayType);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  if (v6)
    v13 = 2;
  else
    v13 = 1;
  -[HKDisplayType roundingMode](self->super._displayType, "roundingMode");
  HKDecimalFormatter();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTitle:", v8);
  objc_msgSend(v15, "setSecondaryLabel:", v11);

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  WDAddDataManualEntryItem *v4;
  WDAddDataManualEntryItem *dateTimeEntryItem;
  WDAddDataManualEntryItem *v6;
  WDAddDataManualEntryItem *valueFieldManualEntryItem;
  objc_super v8;

  -[HKDateCache endOfDayMidnight](self->super._dateCache, "endOfDayMidnight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem twoPartDateTimeItemWithMaximumDate:](WDAddDataManualEntryItem, "twoPartDateTimeItemWithMaximumDate:", v3);
  v4 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  dateTimeEntryItem = self->_dateTimeEntryItem;
  self->_dateTimeEntryItem = v4;

  -[WDAddDataManualEntryItem setDelegate:](self->_dateTimeEntryItem, "setDelegate:", self);
  -[WDDisplayTypeAddDataViewController createValueFieldManualEntryItem](self, "createValueFieldManualEntryItem");
  v6 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  valueFieldManualEntryItem = self->_valueFieldManualEntryItem;
  self->_valueFieldManualEntryItem = v6;

  -[WDAddDataManualEntryItem setDelegate:](self->_valueFieldManualEntryItem, "setDelegate:", self);
  v8.receiver = self;
  v8.super_class = (Class)WDDisplayTypeAddDataViewController;
  -[WDAddDataViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", 0);
  -[WDDisplayTypeAddDataViewController _setDefaultValuesIfNecessary](self, "_setDefaultValuesIfNecessary");
}

- (void)validateDataWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKManualEntryValidationController *validationController;
  void *v15;
  uint64_t v16;
  BOOL v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, _BOOL8, void *, uint64_t);

  v27 = (void (**)(id, _BOOL8, void *, uint64_t))a3;
  -[HKManualEntryValidationController supportedQuantityTypes](self->super._validationController, "supportedQuantityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType objectType](self->super._displayType, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType presentation](self->super._displayType, "presentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataManualEntryItem generateValue](self->_valueFieldManualEntryItem, "generateValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjustedValueForClientValue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v12, "quantityWithUnit:doubleValue:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    validationController = self->super._validationController;
    -[HKDisplayType objectType](self->super._displayType, "objectType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKManualEntryValidationController validateQuantity:ofType:](validationController, "validateQuantity:ofType:", v13, v15);

    v17 = v16 == 1;
    v18 = v16 != 1;
    if (v17)
    {
      -[HKDisplayType presentation](self->super._displayType, "presentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "adjustedValueForDaemonValue:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKDisplayType hk_valueFormatterForUnit:](self->super._displayType, "hk_valueFormatterForUnit:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringFromValue:displayType:unitController:", v21, self->super._displayType, self->super._unitController);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3940];
      HABundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v26, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
    v18 = 1;
  }
  v27[2](v27, v18, v19, 1);

}

- (id)generateHKObjects
{
  void *v3;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[WDAddDataManualEntryItem generateValue](self->_dateTimeEntryItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_valueFieldManualEntryItem, "generateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType presentation](self->super._displayType, "presentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedValueForClientValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A40];
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v12, v10, v3, v3, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem *valueFieldManualEntryItem;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  valueFieldManualEntryItem = self->_valueFieldManualEntryItem;
  v5[0] = self->_dateTimeEntryItem;
  v5[1] = valueFieldManualEntryItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultEditingItem
{
  return self->_valueFieldManualEntryItem;
}

- (void)_setDefaultValuesIfNecessary
{
  if (!-[HKDisplayType displayTypeIdentifier](self->super._displayType, "displayTypeIdentifier"))
    -[WDDisplayTypeAddDataViewController _updateManualEntryItemWithCurrentBMI:](self, "_updateManualEntryItemWithCurrentBMI:", self->_valueFieldManualEntryItem);
}

- (void)_updateManualEntryItemWithCurrentBMI:(id)a3
{
  id v4;
  HKHealthStore *healthStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  healthStore = self->super._healthStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke;
  v7[3] = &unk_1E5575800;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore calculateBMIWithCompletion:](healthStore, "calculateBMIWithCompletion:", v7);

}

void __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke_2;
    v4[3] = &unk_1E55757D8;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", *(_QWORD *)(a1 + 40));
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKManualEntryValidationController *validationController;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;

  -[WDAddDataManualEntryItem generateValue](self->_valueFieldManualEntryItem, "generateValue", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_4;
  -[HKManualEntryValidationController supportedQuantityTypes](self->super._validationController, "supportedQuantityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType objectType](self->super._displayType, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", self->super._displayType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType presentation](self->super._displayType, "presentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjustedValueForClientValue:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v11, "quantityWithUnit:doubleValue:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    validationController = self->super._validationController;
    -[HKDisplayType objectType](self->super._displayType, "objectType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKManualEntryValidationController validateQuantity:ofType:](validationController, "validateQuantity:ofType:", v12, v14);

    v16 = v15 != 2;
  }
  else
  {
LABEL_4:
    v16 = 0;
  }
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v16);

}

- (WDAddDataManualEntryItem)valueFieldManualEntryItem
{
  return self->_valueFieldManualEntryItem;
}

- (void)setValueFieldManualEntryItem:(id)a3
{
  objc_storeStrong((id *)&self->_valueFieldManualEntryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFieldManualEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end
