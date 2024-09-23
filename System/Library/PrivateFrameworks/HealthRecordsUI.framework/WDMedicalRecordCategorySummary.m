@implementation WDMedicalRecordCategorySummary

- (WDMedicalRecordCategorySummary)initWithProfile:(id)a3 categoryType:(int64_t)a4 showCategoryTitle:(BOOL)a5 delegate:(id)a6
{
  id v11;
  id v12;
  WDMedicalRecordCategorySummary *v13;
  WDMedicalRecordCategorySummary *v14;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *allRecords;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *panels;
  NSMutableDictionary *v19;
  NSMutableDictionary *panelsToRecords;
  NSMutableArray *v21;
  NSMutableArray *allDisplayItems;
  NSMutableArray *v23;
  NSMutableArray *visibleDisplayItems;
  uint64_t v25;
  OS_dispatch_queue *summaryQueue;
  uint64_t v27;
  OS_dispatch_queue *resourceQueue;
  objc_super v30;

  v11 = a3;
  v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WDMedicalRecordCategorySummary;
  v13 = -[WDMedicalRecordCategorySummary init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_profile, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_categoryType = a4;
    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    allRecords = v14->_allRecords;
    v14->_allRecords = v15;

    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    panels = v14->_panels;
    v14->_panels = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    panelsToRecords = v14->_panelsToRecords;
    v14->_panelsToRecords = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allDisplayItems = v14->_allDisplayItems;
    v14->_allDisplayItems = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visibleDisplayItems = v14->_visibleDisplayItems;
    v14->_visibleDisplayItems = v23;

    v14->_truncationDisplayItemOffset = 0;
    v14->_truncatedMedicalRecordCount = 0;
    v14->_showCategoryTitle = a5;
    *(_WORD *)&v14->_displayingTruncatedRecords = 0;
    HKCreateSerialDispatchQueue();
    v25 = objc_claimAutoreleasedReturnValue();
    summaryQueue = v14->_summaryQueue;
    v14->_summaryQueue = (OS_dispatch_queue *)v25;

    HKCreateSerialDispatchQueue();
    v27 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v14->_resourceQueue;
    v14->_resourceQueue = (OS_dispatch_queue *)v27;

  }
  return v14;
}

- (void)addMedicalRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__WDMedicalRecordCategorySummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__WDMedicalRecordCategorySummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "allRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB4C98]);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v6, "panels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (void)showTruncatedRecords
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WDMedicalRecordCategorySummary_showTruncatedRecords__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __54__WDMedicalRecordCategorySummary_showTruncatedRecords__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "displayingTruncatedRecords");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisplayingTruncatedRecords:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
    return objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  }
  return result;
}

- (void)recomputeIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WDMedicalRecordCategorySummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__WDMedicalRecordCategorySummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
}

- (void)setNeedsRecompute
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WDMedicalRecordCategorySummary_setNeedsRecompute__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__WDMedicalRecordCategorySummary_setNeedsRecompute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (int64_t)additionalDisplayItemCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__WDMedicalRecordCategorySummary_additionalDisplayItemCount__block_invoke;
  v6[3] = &unk_1E74D1AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__WDMedicalRecordCategorySummary_additionalDisplayItemCount__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
    v3 = result - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)additionalRecordCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__WDMedicalRecordCategorySummary_additionalRecordCount__block_invoke;
  v6[3] = &unk_1E74D1AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__WDMedicalRecordCategorySummary_additionalRecordCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  return result;
}

- (NSArray)displayItems
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__WDMedicalRecordCategorySummary_displayItems__block_invoke;
  v6[3] = &unk_1E74D1AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __46__WDMedicalRecordCategorySummary_displayItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 72;
  if (!*(_BYTE *)(v2 + 9))
    v3 = 80;
  v4 = objc_msgSend(*(id *)(v2 + v3), "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (int64_t)categoryType
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__WDMedicalRecordCategorySummary_categoryType__block_invoke;
  v6[3] = &unk_1E74D1DE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__WDMedicalRecordCategorySummary_categoryType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (NSString)summarySortString
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__WDMedicalRecordCategorySummary_summarySortString__block_invoke;
  v6[3] = &unk_1E74D1DE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __51__WDMedicalRecordCategorySummary_summarySortString__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType](WDMedicalRecordDisplayItemProvider, "supportedRecordCategoriesByCategoryType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)_shouldConsiderRecordTruncation:(id)a3
{
  return 0;
}

- (void)_rqueue_setNeedsCompute
{
  NSObject *v3;

  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WDMedicalRecordCategorySummary setDirty:](self, "setDirty:", 1);
}

- (void)_rqueue_recomputeIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WDMedicalRecordCategorySummary *v16;
  id v17;
  BOOL v18;

  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[WDMedicalRecordCategorySummary dirty](self, "dirty"))
  {
    -[WDMedicalRecordCategorySummary allRecords](self, "allRecords");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[WDMedicalRecordCategorySummary setDirty:](self, "setDirty:", 0);
      -[WDMedicalRecordCategorySummary _rqueue_determinStandaloneRecords](self, "_rqueue_determinStandaloneRecords");
      v6 = -[WDMedicalRecordCategorySummary showCategoryTitle](self, "showCategoryTitle");
      -[WDMedicalRecordCategorySummary allStandaloneRecords](self, "allStandaloneRecords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

      -[WDMedicalRecordCategorySummary panelsToRecords](self, "panelsToRecords");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      -[WDMedicalRecordCategorySummary summaryQueue](self, "summaryQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke;
      v14[3] = &unk_1E74D1F00;
      v15 = v8;
      v16 = self;
      v17 = v10;
      v18 = v6;
      v12 = v10;
      v13 = v8;
      dispatch_async(v11, v14);

    }
  }
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  dispatch_group_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  char v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__1;
  v35[4] = __Block_byref_object_dispose__1;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__1;
  v33[4] = __Block_byref_object_dispose__1;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__1;
  v31[4] = __Block_byref_object_dispose__1;
  v32 = 0;
  v5 = dispatch_group_create();
  v6 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_2;
  v26[3] = &unk_1E74D1E60;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 40);
  v27 = v8;
  v28 = v9;
  v10 = v4;
  v29 = v10;
  v30 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);
  objc_msgSend(*(id *)(a1 + 40), "summaryQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_5;
  v15[3] = &unk_1E74D1ED8;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v18 = v10;
  v19 = v3;
  v20 = v2;
  v23 = v35;
  v24 = v31;
  v25 = *(_BYTE *)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v33;
  v12 = v2;
  v13 = v3;
  v14 = v10;
  dispatch_group_notify(v8, v11, v15);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v5, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4C98]);

  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_3;
    v17[3] = &unk_1E74D1E10;
    v9 = *(void **)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v9, "_displayItemsForPanel:completion:", v5, v17);

    v10 = v18;
  }
  else
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 56), "count") - 1 == a3)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_4;
    v13[3] = &unk_1E74D1E38;
    v12 = *(void **)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = v5;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v12, "_displayItemsForRecord:previous:next:completion:", v15, v10, v11, v13);

  }
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v2 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_6;
  v19[3] = &unk_1E74D1EB0;
  v3 = *(void **)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 56), "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  +[WDMedicalRecordGroupableCell defaultGap](WDMedicalRecordGroupableCell, "defaultGap");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSeparatorInsets:", 0.0, v7, 0.0, 0.0);
  objc_msgSend(*(id *)(a1 + 64), "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setSeparatorHidden:", 1);
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "displayItemType") == 8)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setExtraTopPadding:", 0);
  if (objc_msgSend(*(id *)(a1 + 64), "count") == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setPlacement:", 2);
  if (*(_BYTE *)(a1 + 104))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "displayItemType") == 18)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setExtraTopPadding:", 0);
    +[WDMedicalRecordDisplayItem timelineSummaryCategoryTitleItemWithCategoryType:](WDMedicalRecordDisplayItem, "timelineSummaryCategoryTitleItemWithCategoryType:", objc_msgSend(*(id *)(a1 + 72), "categoryType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setExtraTopPadding:", 1);
    objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", v14, 0);
    objc_msgSend(*(id *)(a1 + 64), "insertObject:atIndex:", v14, 0);

  }
  objc_msgSend(*(id *)(a1 + 72), "resourceQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_8;
  v16[3] = &unk_1E74D11C8;
  v16[4] = *(_QWORD *)(a1 + 72);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  dispatch_async(v15, v16);

}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_6(id *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a2;
  objc_msgSend(v14, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB4C98]);

  if (v5)
  {
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = a1[6];
    if (v7)
    {
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_7;
      v15[3] = &unk_1E74D1E88;
      v16 = a1[5];
      v17 = a1[6];
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
      v12 = a1[6];
      objc_msgSend(v9, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
    else
    {
      objc_msgSend(a1[6], "addObjectsFromArray:", v8);
    }

  }
  else
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObjectsFromArray:", v6);
  }

}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setVisibleDisplayItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAllDisplayItems:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryDidFinishRecompute:", *(_QWORD *)(a1 + 32));

}

- (void)_rqueue_determinStandaloneRecords
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[WDMedicalRecordCategorySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WDMedicalRecordCategorySummary allRecords](self, "allRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[WDMedicalRecordCategorySummary setAllStandaloneRecords:](self, "setAllStandaloneRecords:", v5);

  -[WDMedicalRecordCategorySummary panels](self, "panels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[WDMedicalRecordCategorySummary panels](self, "panels");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          -[WDMedicalRecordCategorySummary allRecords](self, "allRecords");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v12, "results");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "predicateWithFormat:", CFSTR("FHIRIdentifier IN %@"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "filteredOrderedSetUsingPredicate:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[WDMedicalRecordCategorySummary panelsToRecords](self, "panelsToRecords");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v12);

          -[WDMedicalRecordCategorySummary allStandaloneRecords](self, "allStandaloneRecords");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "minusOrderedSet:", v17);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

  }
}

- (void)_displayItemsForRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  WDMedicalRecordCategorySummary *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WDMedicalRecordCategorySummary summaryQueue](self, "summaryQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WDMedicalRecordCategorySummary__displayItemsForRecord_previous_next_completion___block_invoke;
  block[3] = &unk_1E74D1678;
  v23 = v12;
  v24 = v13;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __82__WDMedicalRecordCategorySummary__displayItemsForRecord_previous_next_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  char isKindOfClass;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4C98]);

  if (v4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "_displayItemsForObservation:previous:next:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  if ((isKindOfClass & 1) != 0)
    return objc_msgSend(v7, "_displayItemsForUnknownRecord:completion:", v8, *(_QWORD *)(a1 + 64));
  else
    return objc_msgSend(v7, "_displayItemsForGenericRecord:previous:next:completion:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HRProfile healthRecordsStore](self->_profile, "healthRecordsStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__WDMedicalRecordCategorySummary__displayItemsForGenericRecord_previous_next_completion___block_invoke;
  v19[3] = &unk_1E74D1F28;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v17, "fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:completion:", v14, v19);

}

void __89__WDMedicalRecordCategorySummary__displayItemsForGenericRecord_previous_next_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "_displayItemsForGenericRecord:previous:next:signedClinicalDataRecord:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 signedClinicalDataRecord:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WDMedicalRecordCategorySummary *v27;
  uint64_t v28;
  id v29;

  v27 = self;
  v9 = a3;
  v29 = a6;
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v12 = a4;
  v13 = objc_alloc_init(v10);
  v14 = _ConceptsOfRecordsAreDefinedAndEqual(v9, v12);

  v15 = _ConceptsOfRecordsAreDefinedAndEqual(v9, v11);
  objc_msgSend(v9, "displayNameForGroupByConcept");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);
  objc_msgSend(v9, "meaningfulDateTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (v18 & 1) == 0 && objc_msgSend(v17, "length") || objc_msgSend(v19, "length", v27) != 0;
  if ((v14 ^ 1 | v18) == 1)
  {
    +[WDMedicalRecordDisplayItem conceptHeaderItemWithCategoryType:title:](WDMedicalRecordDisplayItem, "conceptHeaderItemWithCategoryType:title:", objc_msgSend(v9, "recordCategoryType"), v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSeparatorHidden:", 1);
    objc_msgSend(v21, "setMedicalRecord:", v9);
    objc_msgSend(v21, "setCategorySummary:", v27);
    objc_msgSend(v21, "setExtraTopPadding:", 1);
    if (((v20 | v15) & 1) == 0)
      objc_msgSend(v21, "setPlacement:", 2);
    objc_msgSend(v13, "addObject:", v21, v27);

  }
  if (v20)
  {
    +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem](WDMedicalRecordDisplayItem, "timelineSummaryContentWithSubtitleItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v18)
      v24 = 0;
    else
      v24 = v17;
    objc_msgSend(v22, "setTitle:", v24, v27);
    objc_msgSend(v23, "setSubtitle:", v19);
    objc_msgSend(v29, "attributedMeaningfulDateStringWithDateTitle:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAttributedSubtitle:", v25);

    objc_msgSend(v23, "setRecordCategoryType:", objc_msgSend(v9, "recordCategoryType"));
    objc_msgSend(v23, "setMedicalRecord:", v9);
    objc_msgSend(v23, "setCategorySummary:", v28);
    if (((v15 ^ 1 | v18) & 1) != 0)
    {
      objc_msgSend(v23, "setPlacement:", 5);
    }
    else
    {
      objc_msgSend(v23, "setPlacement:", 4);
      objc_msgSend(v23, "setSeparatorStyle:", 0);
    }
    objc_msgSend(v23, "setSeparatorHidden:", v15 ^ 1 | v18);
    objc_msgSend(v13, "addObject:", v23);

  }
  return v13;
}

- (void)_displayItemsForObservation:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordCategorySummary profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "healthRecordsStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke;
  v22[3] = &unk_1E74D1F78;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v14;
  v27 = v13;
  v17 = v13;
  v18 = v14;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v21, "fetchObservationDetailItemsWithHealthRecordsStore:style:completion:", v16, 1, v22);

}

void __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(a1[4], "summaryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke_2;
  block[3] = &unk_1E74D1F50;
  v9 = a1[5];
  v10 = a1[6];
  v5 = a1[7];
  v6 = a1[4];
  v11 = v5;
  v12 = v6;
  v13 = a1[8];
  v14 = v3;
  v15 = a1[9];
  v7 = v3;
  dispatch_async(v4, block);

}

void __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke_2(uint64_t a1)
{
  char v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "displayNameForGroupByConcept");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _ConceptsOfRecordsAreDefinedAndEqual(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = _ConceptsOfRecordsAreDefinedAndEqual(*(void **)(a1 + 32), *(void **)(a1 + 48));
  if ((v2 & 1) == 0)
  {
    +[WDMedicalRecordDisplayItem conceptHeaderItemWithCategoryType:title:](WDMedicalRecordDisplayItem, "conceptHeaderItemWithCategoryType:title:", objc_msgSend(*(id *)(a1 + 32), "recordCategoryType"), v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeparatorHidden:", 1);
    objc_msgSend(v4, "setMedicalRecord:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setCategorySummary:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v4, "setExtraTopPadding:", 1);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);

  }
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 64), "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setPlacement:", 4);

    objc_msgSend(*(id *)(a1 + 64), "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "setPlacement:", 5);

    objc_msgSend(*(id *)(a1 + 64), "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setSeparatorHidden:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (void)_displayItemsForPanel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WDMedicalRecordCategorySummary *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WDMedicalRecordCategorySummary summaryQueue](self, "summaryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke;
  block[3] = &unk_1E74D2040;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  int8x16_t v9;
  _QWORD block[4];
  int8x16_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend(a1[4], "preferredDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  v17 = 0;
  objc_msgSend(a1[5], "resourceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_2;
  block[3] = &unk_1E74D2018;
  v15 = v16;
  v9 = *((int8x16_t *)a1 + 2);
  v5 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  v12 = v3;
  v6 = a1[6];
  v13 = v2;
  v14 = v6;
  v7 = v2;
  v8 = v3;
  dispatch_async(v4, block);

  _Block_object_dispose(v16, 8);
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  dispatch_group_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  dispatch_group_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  objc_msgSend(*(id *)(a1 + 32), "panelsToRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
  {
    v7 = dispatch_group_create();
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(void **)(*(_QWORD *)(v8 + 8) + 40);
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_5;
    v21[3] = &unk_1E74D1FF0;
    v25 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v22 = v7;
    v23 = v11;
    v24 = *(id *)(a1 + 48);
    v12 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(*(id *)(a1 + 32), "summaryQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_7;
    v16[3] = &unk_1E74D1FA0;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 64);
    dispatch_group_notify(v12, v13, v16);

  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_3;
    v26[3] = &unk_1E74D1FC8;
    v26[4] = v14;
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 64);
    objc_msgSend(v14, "_displayItemsForGenericRecord:previous:next:completion:", v15, 0, 0, v26);

  }
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(a1[4], "summaryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_4;
  v6[3] = &unk_1E74D1FA0;
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v10 = a1[7];
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") - 1 == a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a3 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_6;
  v10[3] = &unk_1E74D1E38;
  v8 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v8, "_displayItemsForRecord:previous:next:completion:", v9, v6, v7, v10);

}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[WDMedicalRecordDisplayItem timelineSummaryPanelTitleItem](WDMedicalRecordDisplayItem, "timelineSummaryPanelTitleItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(CFSTR("LAB_RESULTS_PANEL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  objc_msgSend(v2, "setSubtitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setExtraTopPadding:", 1);
  objc_msgSend(v2, "setMedicalRecord:", *(_QWORD *)(a1 + 40));
  +[WDMedicalRecordDisplayItem timelineSummaryAppendixItem](WDMedicalRecordDisplayItem, "timelineSummaryAppendixItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(CFSTR("ADDITIONAL_PANEL_INFORMATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setPlacement:", 2);
  objc_msgSend(v4, "setExtraTopPadding:", 1);
  objc_msgSend(v4, "setMedicalRecord:", *(_QWORD *)(a1 + 40));
  v7[0] = v2;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_displayItemsForUnknownRecord:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  +[WDMedicalRecordDisplayItem standaloneItem](WDMedicalRecordDisplayItem, "standaloneItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlacement:", 2);
  objc_msgSend(v7, "setExtraTopPadding:", 1);
  objc_msgSend(v6, "preferredDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v7, "setMedicalRecord:", v6);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

}

- (id)_appendixItemForCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[WDMedicalRecordDisplayItem timelineSummaryAppendixItem](WDMedicalRecordDisplayItem, "timelineSummaryAppendixItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  HRLocalizedString(CFSTR("SHOW %d MORE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v8);

  objc_msgSend(v5, "setPlacement:", 2);
  objc_msgSend(v5, "setExtraTopPadding:", 1);
  objc_msgSend(v5, "setCategorySummary:", self);
  return v5;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WDMedicalRecordSummaryDelegate)delegate
{
  return (WDMedicalRecordSummaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableOrderedSet)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
{
  objc_storeStrong((id *)&self->_allRecords, a3);
}

- (NSMutableOrderedSet)allStandaloneRecords
{
  return self->_allStandaloneRecords;
}

- (void)setAllStandaloneRecords:(id)a3
{
  objc_storeStrong((id *)&self->_allStandaloneRecords, a3);
}

- (NSMutableOrderedSet)panels
{
  return self->_panels;
}

- (void)setPanels:(id)a3
{
  objc_storeStrong((id *)&self->_panels, a3);
}

- (NSMutableDictionary)panelsToRecords
{
  return self->_panelsToRecords;
}

- (void)setPanelsToRecords:(id)a3
{
  objc_storeStrong((id *)&self->_panelsToRecords, a3);
}

- (NSMutableArray)allDisplayItems
{
  return self->_allDisplayItems;
}

- (void)setAllDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_allDisplayItems, a3);
}

- (NSMutableArray)visibleDisplayItems
{
  return self->_visibleDisplayItems;
}

- (void)setVisibleDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_visibleDisplayItems, a3);
}

- (NSMutableArray)truncatedDisplayItems
{
  return self->_truncatedDisplayItems;
}

- (void)setTruncatedDisplayItems:(id)a3
{
  objc_storeStrong((id *)&self->_truncatedDisplayItems, a3);
}

- (unint64_t)truncationDisplayItemOffset
{
  return self->_truncationDisplayItemOffset;
}

- (void)setTruncationDisplayItemOffset:(unint64_t)a3
{
  self->_truncationDisplayItemOffset = a3;
}

- (int64_t)truncatedMedicalRecordCount
{
  return self->_truncatedMedicalRecordCount;
}

- (void)setTruncatedMedicalRecordCount:(int64_t)a3
{
  self->_truncatedMedicalRecordCount = a3;
}

- (BOOL)showCategoryTitle
{
  return self->_showCategoryTitle;
}

- (void)setShowCategoryTitle:(BOOL)a3
{
  self->_showCategoryTitle = a3;
}

- (BOOL)displayingTruncatedRecords
{
  return self->_displayingTruncatedRecords;
}

- (void)setDisplayingTruncatedRecords:(BOOL)a3
{
  self->_displayingTruncatedRecords = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (OS_dispatch_queue)summaryQueue
{
  return self->_summaryQueue;
}

- (void)setSummaryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_summaryQueue, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_summaryQueue, 0);
  objc_storeStrong((id *)&self->_truncatedDisplayItems, 0);
  objc_storeStrong((id *)&self->_visibleDisplayItems, 0);
  objc_storeStrong((id *)&self->_allDisplayItems, 0);
  objc_storeStrong((id *)&self->_panelsToRecords, 0);
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_allStandaloneRecords, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
