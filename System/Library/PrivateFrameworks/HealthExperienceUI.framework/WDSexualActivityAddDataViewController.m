@implementation WDSexualActivityAddDataViewController

- (WDSexualActivityAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDSexualActivityAddDataViewController *v7;
  WDSexualActivityAddDataViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WDAddDataManualEntryItem *dateEntryItem;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  WDAddDataManualEntryItem *protectionUsedEntryItem;
  objc_super v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)WDSexualActivityAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v24, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v7->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HABundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:displayName:", v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dateEntryItem = v8->_dateEntryItem;
    v8->_dateEntryItem = (WDAddDataManualEntryItem *)v12;

    -[WDAddDataManualEntryItem setDelegate:](v8->_dateEntryItem, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PROTECTION_UNSPECIFIED"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PROTECTION_USED"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PROTECTION_NOT_USED"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[WDAddDataManualEntryItem multiSelectItemWithEntries:selectedIndex:](WDAddDataManualEntryItem, "multiSelectItemWithEntries:selectedIndex:", v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    protectionUsedEntryItem = v8->_protectionUsedEntryItem;
    v8->_protectionUsedEntryItem = (WDAddDataManualEntryItem *)v21;

  }
  return v8;
}

- (int64_t)numberOfSections
{
  return 2;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem **p_protectionUsedEntryItem;
  void *v4;
  WDAddDataManualEntryItem *protectionUsedEntryItem;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return v4;
    }
    v7[0] = self->_dateEntryItem;
    p_protectionUsedEntryItem = (WDAddDataManualEntryItem **)v7;
  }
  else
  {
    protectionUsedEntryItem = self->_protectionUsedEntryItem;
    p_protectionUsedEntryItem = &protectionUsedEntryItem;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_protectionUsedEntryItem, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)generateHKObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[WDAddDataManualEntryItem generateValue](self->_dateEntryItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WDAddDataManualEntryItem generateValue](self->_protectionUsedEntryItem, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 1)
  {
    v9 = MEMORY[0x1E0C9AAB0];
    goto LABEL_7;
  }
  if (v8 == 2)
  {
    v9 = MEMORY[0x1E0C9AAA0];
LABEL_7:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB55B8]);
  }
  v10 = (void *)MEMORY[0x1E0CB6378];
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categorySampleWithType:value:startDate:endDate:metadata:", v11, 0, v3, v3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionUsedEntryItem, 0);
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
}

@end
