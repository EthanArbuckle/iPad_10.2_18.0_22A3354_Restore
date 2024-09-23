@implementation WDBloodGlucoseAddDataViewController

- (WDAddDataManualEntrySpinner)mealTimeEntryItem
{
  WDAddDataManualEntrySpinner *mealTimeEntryItem;
  WDAddDataManualEntrySpinner *v4;
  void *v5;
  void *v6;
  WDAddDataManualEntrySpinner *v7;
  WDAddDataManualEntrySpinner *v8;

  mealTimeEntryItem = self->_mealTimeEntryItem;
  if (!mealTimeEntryItem)
  {
    v4 = [WDAddDataManualEntrySpinner alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", *MEMORY[0x1E0CB54C8], &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WDAddDataManualEntrySpinner initWithDisplayName:](v4, "initWithDisplayName:", v6);
    v8 = self->_mealTimeEntryItem;
    self->_mealTimeEntryItem = v7;

    -[WDAddDataManualEntrySpinner setDataSource:](self->_mealTimeEntryItem, "setDataSource:", self);
    mealTimeEntryItem = self->_mealTimeEntryItem;
  }
  return mealTimeEntryItem;
}

- (id)defaultMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WDBloodGlucoseAddDataViewController;
  -[WDAddDataViewController defaultMetadata](&v11, sel_defaultMetadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WDBloodGlucoseAddDataViewController mealTimeEntryItem](self, "mealTimeEntryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 != *MEMORY[0x1E0CB70D0])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB54C8]);

  }
  return v5;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDBloodGlucoseAddDataViewController;
  -[WDDisplayTypeAddDataViewController manualEntryItemsForSection:](&v9, sel_manualEntryItemsForSection_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WDBloodGlucoseAddDataViewController mealTimeEntryItem](self, "mealTimeEntryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 3;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MEAL_TIME_%zd"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMealTimeEntryItem:(id)a3
{
  objc_storeStrong((id *)&self->_mealTimeEntryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mealTimeEntryItem, 0);
}

@end
