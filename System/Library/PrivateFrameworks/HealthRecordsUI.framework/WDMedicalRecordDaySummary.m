@implementation WDMedicalRecordDaySummary

- (WDMedicalRecordDaySummary)initWithProfile:(id)a3 style:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  WDMedicalRecordDaySummary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *categoriesBySourceAlphaOrdered;
  NSMutableDictionary *v14;
  NSMutableDictionary *categoriesBySourceByType;
  NSMutableSet *v16;
  NSMutableSet *inProgressCatogorySummaries;
  uint64_t v18;
  OS_dispatch_queue *resourceQueue;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordDaySummary;
  v11 = -[WDMedicalRecordDaySummary init](&v21, sel_init);
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    categoriesBySourceAlphaOrdered = v11->_categoriesBySourceAlphaOrdered;
    v11->_categoriesBySourceAlphaOrdered = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    categoriesBySourceByType = v11->_categoriesBySourceByType;
    v11->_categoriesBySourceByType = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inProgressCatogorySummaries = v11->_inProgressCatogorySummaries;
    v11->_inProgressCatogorySummaries = v16;

    objc_storeStrong((id *)&v11->_profile, a3);
    objc_storeWeak((id *)&v11->_delegate, v10);
    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    resourceQueue = v11->_resourceQueue;
    v11->_resourceQueue = (OS_dispatch_queue *)v18;

    v11->_style = a4;
  }

  return v11;
}

- (void)addMedicalRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordDaySummary resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WDMedicalRecordDaySummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__WDMedicalRecordDaySummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WDMedicalRecordCategorySummary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  WDMedicalRecordCategorySummary *v15;
  void *v16;
  uint64_t v17;
  WDMedicalRecordConceptSummary *v18;
  uint64_t v19;
  WDMedicalRecordCategorySummary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sourceRevision");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, v7);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "style");
    if (v10 == 2)
    {
      v18 = [WDMedicalRecordConceptSummary alloc];
      objc_msgSend(*(id *)(a1 + 32), "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[WDMedicalRecordConceptSummary initWithProfile:delegate:](v18, "initWithProfile:delegate:", v12, *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v10 == 1)
      {
        v20 = [WDMedicalRecordCategorySummary alloc];
        objc_msgSend(*(id *)(a1 + 32), "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(*(id *)(a1 + 40), "recordCategoryType");
        v14 = *(_QWORD *)(a1 + 32);
        v15 = v20;
        v16 = v12;
        v17 = 0;
      }
      else
      {
        if (v10)
        {
          v9 = 0;
          goto LABEL_13;
        }
        v11 = [WDMedicalRecordCategorySummary alloc];
        objc_msgSend(*(id *)(a1 + 32), "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(*(id *)(a1 + 40), "recordCategoryType");
        v14 = *(_QWORD *)(a1 + 32);
        v15 = v11;
        v16 = v12;
        v17 = 1;
      }
      v19 = -[WDMedicalRecordCategorySummary initWithProfile:categoryType:showCategoryTitle:delegate:](v15, "initWithProfile:categoryType:showCategoryTitle:delegate:", v16, v13, v17, v14);
    }
    v9 = (void *)v19;

LABEL_13:
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, v8);
    objc_msgSend(*(id *)(a1 + 32), "_alphaSortedCategories:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sourceRevision");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v24);

    objc_msgSend(*(id *)(a1 + 32), "inProgressCatogorySummaries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v9);

  }
  objc_msgSend(v9, "addMedicalRecord:", *(_QWORD *)(a1 + 40));

}

- (void)recomputeIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordDaySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__WDMedicalRecordDaySummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__WDMedicalRecordDaySummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "recomputeIfNeeded");
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (int64_t)numberOfDisplayItems
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
  -[WDMedicalRecordDaySummary resourceQueue](self, "resourceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WDMedicalRecordDaySummary_numberOfDisplayItems__block_invoke;
  v6[3] = &unk_1E74D1AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__WDMedicalRecordDaySummary_numberOfDisplayItems__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "displayItems");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v15, "count");

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

}

- (id)displayItemAtIndex:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[WDMedicalRecordDaySummary resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke;
  block[3] = &unk_1E74D1B08;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  if (!a3 && objc_msgSend((id)v10[5], "displayItemType") == 2)
    objc_msgSend((id)v10[5], "setExtraTopPadding:", 0);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[7];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
      objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke_2;
      v11[3] = &unk_1E74D1AE0;
      v10 = *(_QWORD *)(a1 + 48);
      v11[5] = *(_QWORD *)(a1 + 40);
      v11[6] = v10;
      v11[4] = v16;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(v16, 8);
}

void __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "displayItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(a1[4] + 8);
        v12 = *(_QWORD *)(v11 + 24);
        if (v12 == a1[6])
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
          *a4 = 1;
          goto LABEL_11;
        }
        *(_QWORD *)(v11 + 24) = v12 + 1;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)summaryDidFinishRecompute:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordDaySummary resourceQueue](self, "resourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__WDMedicalRecordDaySummary_summaryDidFinishRecompute___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__WDMedicalRecordDaySummary_summaryDidFinishRecompute___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inProgressCatogorySummaries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "inProgressCatogorySummaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "daySummaryHasDisplayItemUpdate:", *(_QWORD *)(a1 + 32));

  }
}

- (id)_alphaSortedKeysForCategories:(id)a3
{
  return (id)objc_msgSend(a3, "keysSortedByValueUsingComparator:", &__block_literal_global_2);
}

uint64_t __59__WDMedicalRecordDaySummary__alphaSortedKeysForCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "summarySortString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summarySortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)_alphaSortedCategories:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordDaySummary _alphaSortedKeysForCategories:](self, "_alphaSortedKeysForCategories:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSMutableDictionary)categoriesBySourceAlphaOrdered
{
  return self->_categoriesBySourceAlphaOrdered;
}

- (void)setCategoriesBySourceAlphaOrdered:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesBySourceAlphaOrdered, a3);
}

- (NSMutableDictionary)categoriesBySourceByType
{
  return self->_categoriesBySourceByType;
}

- (void)setCategoriesBySourceByType:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesBySourceByType, a3);
}

- (NSMutableSet)inProgressCatogorySummaries
{
  return self->_inProgressCatogorySummaries;
}

- (void)setInProgressCatogorySummaries:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressCatogorySummaries, a3);
}

- (WDMedicalRecordDaySummaryDelegate)delegate
{
  return (WDMedicalRecordDaySummaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resourceQueue, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inProgressCatogorySummaries, 0);
  objc_storeStrong((id *)&self->_categoriesBySourceByType, 0);
  objc_storeStrong((id *)&self->_categoriesBySourceAlphaOrdered, 0);
}

@end
