@implementation WDMenstruationAddDataViewController

- (WDMenstruationAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDMenstruationAddDataViewController *v7;
  WDAddDataManualEntrySpinner *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WDAddDataManualEntrySpinner *isStartOfCycleEntryItem;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDMenstruationAddDataViewController;
  v7 = -[WDCategoryAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v14, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  if (v7)
  {
    v8 = [WDAddDataManualEntrySpinner alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", *MEMORY[0x1E0CB5588], &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WDAddDataManualEntrySpinner initWithDisplayName:](v8, "initWithDisplayName:", v10);
    isStartOfCycleEntryItem = v7->_isStartOfCycleEntryItem;
    v7->_isStartOfCycleEntryItem = (WDAddDataManualEntrySpinner *)v11;

    -[WDAddDataManualEntrySpinner setDataSource:](v7->_isStartOfCycleEntryItem, "setDataSource:", v7);
  }
  return v7;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v8;
  WDAddDataManualEntrySpinner *isStartOfCycleEntryItem;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      -[WDCategoryAddDataViewController dateEntryItem](self, "dateEntryItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v3;
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v8;
      goto LABEL_6;
    case 1:
      isStartOfCycleEntryItem = self->_isStartOfCycleEntryItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &isStartOfCycleEntryItem, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    case 0:
      -[WDCategoryAddDataViewController categoryValueEntryItem](self, "categoryValueEntryItem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v3;
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = (void **)v10;
LABEL_6:
      objc_msgSend(v4, "arrayWithObjects:count:", v5, 1, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    default:
      return MEMORY[0x1E0C9AA60];
  }
}

- (int64_t)numberOfSections
{
  return 3;
}

- (id)defaultMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WDMenstruationAddDataViewController;
  -[WDAddDataViewController defaultMetadata](&v10, sel_defaultMetadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WDAddDataManualEntrySpinner generateValue](self->_isStartOfCycleEntryItem, "generateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB5588]);

  return v5;
}

- (BOOL)useSingleStartAndEndDate
{
  return 1;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 2;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  HABundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 == 1)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WDMenstruationAddDataViewController;
    -[WDMenstruationAddDataViewController tableView:titleForHeaderInSection:](&v7, sel_tableView_titleForHeaderInSection_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MENSTRUAL_FLOW"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStartOfCycleEntryItem, 0);
}

@end
