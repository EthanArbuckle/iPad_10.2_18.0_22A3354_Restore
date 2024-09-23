@implementation HFAbstractGroupedStatusItem

- (NSSet)items
{
  NSSet *displayedItems;

  displayedItems = self->_displayedItems;
  if (displayedItems)
    return displayedItems;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "statusItemClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(v3, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hidden"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)addItem:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allItems;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_allItems)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    allItems = self->_allItems;
    self->_allItems = v4;

  }
  -[HFAbstractGroupedStatusItem allItems](self, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)removeItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAbstractGroupedStatusItem allItems](self, "allItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAbstractGroupedStatusItem;
  v5 = -[HFStatusItem copyWithZone:](&v9, sel_copyWithZone_);
  -[HFAbstractGroupedStatusItem allItems](self, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAllItems:", v7);

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HFAbstractGroupedStatusItem _hasRequiredStatusItems](self, "_hasRequiredStatusItems");
  v6 = (void *)MEMORY[0x1E0D519C0];
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFAbstractGroupedStatusItem allItems](self, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke;
    v26[3] = &unk_1EA7288F0;
    v27 = v4;
    objc_msgSend(v8, "na_map:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_2;
    v22[3] = &unk_1EA728940;
    objc_copyWeak(&v24, &location);
    v15 = v7;
    v23 = v15;
    v16 = (id)objc_msgSend(v14, "addCompletionBlock:", v22);
    v17 = v23;
    v18 = v15;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    v19 = v27;
    v20 = v18;
  }
  else
  {
    v28 = CFSTR("hidden");
    v29[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

uint64_t __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithOptions:", *(_QWORD *)(a1 + 32));
}

void __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[11];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__10;
    v48 = __Block_byref_object_dispose__10;
    v49 = (id)objc_opt_new();
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = -1;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 4;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__10;
    v34 = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__10;
    v28 = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__10;
    v22 = __Block_byref_object_dispose__10;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_7;
    v17[3] = &unk_1EA731210;
    v17[4] = WeakRetained;
    v17[5] = &v44;
    v17[6] = &v18;
    v17[7] = &v40;
    v17[8] = &v36;
    v17[9] = &v30;
    v17[10] = &v24;
    objc_msgSend(v9, "na_each:", v17);

    objc_msgSend(WeakRetained, "setDisplayedItems:", v45[5]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25[5], CFSTR("dependentHomeKitObjects"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31[5], CFSTR("dependentServiceTypes"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v41[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37[3]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("statusItemCategory"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19[5], CFSTR("representedHomeKitObjects"));
    objc_msgSend((id)objc_opt_class(), "sortKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("sortKey"));

    v13 = *(void **)(a1 + 32);
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithResult:", v14);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v50 = CFSTR("hidden");
    v51[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v16);

  }
}

void __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldEncapsulateItem:", v27);
  v4 = v27;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v27);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v27, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "unionSet:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unionSet:", v8);

    }
    objc_msgSend(v27, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("priority"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(_QWORD *)(v12 + 24);
    if (v13 <= v11)
      v13 = v11;
    *(_QWORD *)(v12 + 24) = v13;
    objc_msgSend(v27, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("statusItemCategory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    v4 = v27;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(_QWORD *)(v17 + 24);
    if (v18 >= v16)
      v18 = v16;
    *(_QWORD *)(v17 + 24) = v18;
  }
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v4, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("dependentServiceTypes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v19, "unionSet:", v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v22);

  }
  v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(v27, "latestResults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v23, "unionSet:", v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unionSet:", v26);

  }
}

- (BOOL)_hasRequiredStatusItems
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend((id)objc_opt_class(), "statusItemClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HFAbstractGroupedStatusItem__hasRequiredStatusItems__block_invoke;
  v5[3] = &unk_1EA731238;
  v5[4] = self;
  LODWORD(self) = objc_msgSend(v3, "na_any:", v5) ^ 1;

  return (char)self;
}

BOOL __54__HFAbstractGroupedStatusItem__hasRequiredStatusItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "_statusItemOfClass:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)_statusItemOfClass:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFAbstractGroupedStatusItem allItems](self, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HFAbstractGroupedStatusItem__statusItemOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e22_B16__0__HFStatusItem_8lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__HFAbstractGroupedStatusItem__statusItemOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)statusItemClasses
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractGroupedStatusItem.m"), 148, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractGroupedStatusItem statusItemClasses]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)sortKey
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractGroupedStatusItem.m"), 154, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractGroupedStatusItem sortKey]", objc_opt_class());

  return 0;
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (NSSet)displayedItems
{
  return self->_displayedItems;
}

- (void)setDisplayedItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
