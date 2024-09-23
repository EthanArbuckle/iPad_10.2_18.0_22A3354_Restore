@implementation HKQuantitySeriesDataProvider

- (HKQuantitySeriesDataProvider)initWithSample:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  HKQuantitySeriesDataProvider *v8;
  HKQuantitySeriesDataProvider *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Sample type is not an HKQuantitySample"), CFSTR("Must be an HKQuantitySample to use the quantity series data provider"));
  v13.receiver = self;
  v13.super_class = (Class)HKQuantitySeriesDataProvider;
  v8 = -[HKQuantitySeriesDataProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKQuantitySeriesDataProvider setParentSample:](v8, "setParentSample:", v6);
    -[HKQuantitySeriesDataProvider setHealthStore:](v9, "setHealthStore:", v7);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKQuantitySeriesDataProvider setQuantities:](v9, "setQuantities:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A58]), "initWithHealthStore:quantitySample:", v9->_healthStore, v9->_parentSample);
    -[HKQuantitySeriesDataProvider setEditor:](v9, "setEditor:", v11);

    -[HKQuantitySeriesDataProvider setHasSubsamplesToRemove:](v9, "setHasSubsamplesToRemove:", 0);
  }

  return v9;
}

- (id)textForQuantity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  __CFString *v23;
  void *v24;
  int v25;

  v4 = a3;
  -[HKQuantitySeriesDataProvider displayTypeController](self, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesDataProvider parentSample](self, "parentSample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesDataProvider unitController](self, "unitController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unitForDisplayType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "quantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValueForUnit:", v10);
  v13 = v12;

  objc_msgSend(v8, "presentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adjustedValueForDaemonValue:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesDataProvider unitController](self, "unitController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext(v16, v8, v17, 0, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesDataProvider unitController](self, "unitController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HKFormatterIncludesUnitForDisplayTypeInContext(v8, 1, v19);

  if ((v20 & 1) != 0)
  {
    v21 = v18;
  }
  else
  {
    -[HKQuantitySeriesDataProvider unitController](self, "unitController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedDisplayNameForDisplayType:value:", v8, v16);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "displayTypeIdentifier") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v10, "isEqual:", v24);

      if (v25)
      {

        v23 = &stru_1E9C4C428;
      }
    }
    HKFormatValueAndUnit(v18, v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  +[HKQuantitySeriesTableViewCell reuseIdentifier](HKQuantitySeriesTableViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesDataProvider quantities](self, "quantities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantitySeriesDataProvider textForQuantity:](self, "textForQuantity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  HKDateFormatterFromTemplate(32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateInterval");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HKQuantitySeriesDataProvider quantities](self, "quantities", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (a4 == 1)
  {
    v7 = a5;
    v8 = a3;
    -[HKQuantitySeriesDataProvider quantities](self, "quantities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[HKQuantitySeriesDataProvider deleteQuantity:](self, "deleteQuantity:", v12);
    -[HKQuantitySeriesDataProvider quantities](self, "quantities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "row");

    objc_msgSend(v10, "removeObjectAtIndex:", v11);
    objc_msgSend(v8, "reloadData");

  }
}

- (void)queryForSubsamples:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *, void *, int, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v4 = a3;
  -[HKQuantitySeriesDataProvider parentSample](self, "parentSample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Sample type is not an HKQuantitySample"), CFSTR("Must be an HKQuantitySample to use the quantity series data provider"));
  -[HKQuantitySeriesDataProvider parentSample](self, "parentSample");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)MEMORY[0x1E0CB6A78];
  -[HKQuantitySeriesDataProvider parentSample](self, "parentSample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForObjectWithUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0CB6A68]);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __51__HKQuantitySeriesDataProvider_queryForSubsamples___block_invoke;
  v23 = &unk_1E9C41B38;
  v16 = v10;
  v24 = v16;
  objc_copyWeak(&v26, &location);
  v17 = v4;
  v25 = v17;
  v18 = (void *)objc_msgSend(v15, "initWithQuantityType:predicate:quantityHandler:", v9, v14, &v20);
  objc_msgSend(v18, "setIncludeSample:", 0, v20, v21, v22, v23);
  objc_msgSend(v18, "setOrderByQuantitySampleStartDate:", 1);
  -[HKQuantitySeriesDataProvider healthStore](self, "healthStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "executeQuery:", v18);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __51__HKQuantitySeriesDataProvider_queryForSubsamples___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKQuantityWrapper *v17;
  uint64_t v18;
  id WeakRetained;
  id v20;

  v20 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13 && v14)
  {
    v17 = -[HKQuantityWrapper initWithQuantity:dateInterval:]([HKQuantityWrapper alloc], "initWithQuantity:dateInterval:", v13, v14);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);

  }
  if (a6)
  {
    v18 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setQuantities:", v18);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)deleteQuantity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[HKQuantitySeriesDataProvider editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v5, "removeQuantityForDateInterval:error:", v6, &v9);
  v7 = v9;

  -[HKQuantitySeriesDataProvider setHasSubsamplesToRemove:](self, "setHasSubsamplesToRemove:", 1);
  if (v7)
  {
    -[HKQuantitySeriesDataProvider editor](self, "editor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "discard");

    -[HKQuantitySeriesDataProvider setHasSubsamplesToRemove:](self, "setHasSubsamplesToRemove:", 0);
  }
}

- (void)commitDeletionsIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (-[HKQuantitySeriesDataProvider hasSubsamplesToRemove](self, "hasSubsamplesToRemove"))
  {
    -[HKQuantitySeriesDataProvider editor](self, "editor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__HKQuantitySeriesDataProvider_commitDeletionsIfNeeded__block_invoke;
    v4[3] = &unk_1E9C41B60;
    v4[4] = self;
    objc_msgSend(v3, "commitWithCompletion:", v4);

  }
}

void __55__HKQuantitySeriesDataProvider_commitDeletionsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  v15 = v5;
  if (!a3)
  {
    if (objc_msgSend(v5, "count") > 1)
    {
      v10 = *(void **)(a1 + 32);
      if (v15)
      {
        objc_msgSend(v10, "setParentSample:", v15);
        v11 = objc_alloc(MEMORY[0x1E0CB6A58]);
        objc_msgSend(*(id *)(a1 + 32), "healthStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithHealthStore:quantitySample:", v12, v15);
        objc_msgSend(*(id *)(a1 + 32), "setEditor:", v13);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sampleDidChange:", v15);
LABEL_8:

        v6 = (id *)(a1 + 32);
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setParentSample:", v15);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sampleDidChange:", v15);

      v10 = *(void **)(a1 + 32);
    }
    objc_msgSend(v10, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadSampleData");
    goto LABEL_8;
  }
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "editor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "discard");

LABEL_9:
  objc_msgSend(*v6, "setHasSubsamplesToRemove:", 0);

}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (HKQuantitySeriesDataProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKQuantitySample)parentSample
{
  return self->_parentSample;
}

- (void)setParentSample:(id)a3
{
  objc_storeStrong((id *)&self->_parentSample, a3);
}

- (NSMutableArray)quantities
{
  return self->_quantities;
}

- (void)setQuantities:(id)a3
{
  objc_storeStrong((id *)&self->_quantities, a3);
}

- (HKQuantitySeriesSampleEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (BOOL)hasSubsamplesToRemove
{
  return self->_hasSubsamplesToRemove;
}

- (void)setHasSubsamplesToRemove:(BOOL)a3
{
  self->_hasSubsamplesToRemove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_quantities, 0);
  objc_storeStrong((id *)&self->_parentSample, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
}

@end
