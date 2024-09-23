@implementation WDHeightAddDataViewController

- (WDHeightAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  id v12;
  id v13;
  WDHeightAddDataViewController *v14;
  WDHeightAddDataViewController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  WDAddDataManualEntryItem *heightPickerManualEntryItem;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WDHeightAddDataViewController;
  v14 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v21, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, v12, a4, v13, a6, a7);
  v15 = v14;
  if (v14
    && -[WDHeightAddDataViewController _inputUnitIsFeetWithDisplayType:unitController:](v14, "_inputUnitIsFeetWithDisplayType:unitController:", v12, v13))
  {
    -[WDHeightAddDataViewController _feetUnitString](v15, "_feetUnitString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDHeightAddDataViewController _inchUnitString](v15, "_inchUnitString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem heightPickerItemWithFeetUnitString:inchUnitString:](WDAddDataManualEntryItem, "heightPickerItemWithFeetUnitString:inchUnitString:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    heightPickerManualEntryItem = v15->_heightPickerManualEntryItem;
    v15->_heightPickerManualEntryItem = (WDAddDataManualEntryItem *)v18;

  }
  return v15;
}

- (id)createValueFieldManualEntryItem
{
  WDAddDataManualEntryItem *heightPickerManualEntryItem;
  objc_super v4;

  heightPickerManualEntryItem = self->_heightPickerManualEntryItem;
  if (heightPickerManualEntryItem)
    return heightPickerManualEntryItem;
  v4.receiver = self;
  v4.super_class = (Class)WDHeightAddDataViewController;
  -[WDDisplayTypeAddDataViewController createValueFieldManualEntryItem](&v4, sel_createValueFieldManualEntryItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_inputUnitIsFeetWithDisplayType:(id)a3 unitController:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  objc_msgSend(a4, "unitForDisplayType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)_feetUnitString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedDisplayNameForUnit:value:](self->super.super._unitController, "localizedDisplayNameForUnit:value:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_inchUnitString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "inchUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedDisplayNameForUnit:value:](self->super.super._unitController, "localizedDisplayNameForUnit:value:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightPickerManualEntryItem, 0);
}

@end
