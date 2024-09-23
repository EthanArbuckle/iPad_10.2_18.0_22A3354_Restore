@implementation WDMedicalRecordDisplayItemProvider

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 ontologyConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11
{
  id v18;
  id v19;
  id v20;
  WDMedicalRecordDisplayItemProvider *v21;
  WDMedicalRecordDisplayItemProvider *v22;
  uint64_t v23;
  NSArray *preloadedRemovedRecords;
  NSArray *v25;
  NSArray *sampleTypes;
  uint64_t v27;
  NSDictionary *additionalPredicates;
  uint64_t v29;
  OS_dispatch_queue *dataQueryQueue;
  NSMutableArray *v31;
  NSMutableArray *medicalRecordGroups;
  NSMutableArray *v33;
  NSMutableArray *dateLessGroups;
  WDMedicalRecordPagingContext *v35;
  WDMedicalRecordPagingContext *pagingContext;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v40 = a4;
  v18 = a5;
  v19 = a8;
  v39 = a9;
  v20 = a10;
  v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)WDMedicalRecordDisplayItemProvider;
  v21 = -[WDMedicalRecordDisplayItemProvider init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_ontologyConcept, a4);
    v23 = objc_msgSend(v18, "copy");
    preloadedRemovedRecords = v22->_preloadedRemovedRecords;
    v22->_preloadedRemovedRecords = (NSArray *)v23;

    v22->_removedRecordsOnly = a6;
    v22->_displayItemOptions = a7;
    if (v19)
    {
      v25 = (NSArray *)v19;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "allSupportedSampleTypes");
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    sampleTypes = v22->_sampleTypes;
    v22->_sampleTypes = v25;

    objc_storeStrong((id *)&v22->_filter, a9);
    v27 = objc_msgSend(v20, "copy");
    additionalPredicates = v22->_additionalPredicates;
    v22->_additionalPredicates = (NSDictionary *)v27;

    objc_storeStrong((id *)&v22->_sortDescriptors, a11);
    HKCreateSerialDispatchQueue();
    v29 = objc_claimAutoreleasedReturnValue();
    dataQueryQueue = v22->_dataQueryQueue;
    v22->_dataQueryQueue = (OS_dispatch_queue *)v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    medicalRecordGroups = v22->_medicalRecordGroups;
    v22->_medicalRecordGroups = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateLessGroups = v22->_dateLessGroups;
    v22->_dateLessGroups = v33;

    v22->_loadingNextPage = 0;
    v35 = objc_alloc_init(WDMedicalRecordPagingContext);
    pagingContext = v22->_pagingContext;
    v22->_pagingContext = v35;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 userDomainConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11
{
  id v18;
  id v19;
  id v20;
  WDMedicalRecordDisplayItemProvider *v21;
  WDMedicalRecordDisplayItemProvider *v22;
  uint64_t v23;
  NSArray *preloadedRemovedRecords;
  NSArray *v25;
  NSArray *sampleTypes;
  uint64_t v27;
  NSDictionary *additionalPredicates;
  uint64_t v29;
  OS_dispatch_queue *dataQueryQueue;
  NSMutableArray *v31;
  NSMutableArray *medicalRecordGroups;
  NSMutableArray *v33;
  NSMutableArray *dateLessGroups;
  WDMedicalRecordPagingContext *v35;
  WDMedicalRecordPagingContext *pagingContext;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v40 = a4;
  v18 = a5;
  v19 = a8;
  v39 = a9;
  v20 = a10;
  v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)WDMedicalRecordDisplayItemProvider;
  v21 = -[WDMedicalRecordDisplayItemProvider init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_userDomainConcept, a4);
    v23 = objc_msgSend(v18, "copy");
    preloadedRemovedRecords = v22->_preloadedRemovedRecords;
    v22->_preloadedRemovedRecords = (NSArray *)v23;

    v22->_removedRecordsOnly = a6;
    v22->_displayItemOptions = a7;
    if (v19)
    {
      v25 = (NSArray *)v19;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "allSupportedSampleTypes");
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    sampleTypes = v22->_sampleTypes;
    v22->_sampleTypes = v25;

    objc_storeStrong((id *)&v22->_filter, a9);
    v27 = objc_msgSend(v20, "copy");
    additionalPredicates = v22->_additionalPredicates;
    v22->_additionalPredicates = (NSDictionary *)v27;

    objc_storeStrong((id *)&v22->_sortDescriptors, a11);
    HKCreateSerialDispatchQueue();
    v29 = objc_claimAutoreleasedReturnValue();
    dataQueryQueue = v22->_dataQueryQueue;
    v22->_dataQueryQueue = (OS_dispatch_queue *)v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    medicalRecordGroups = v22->_medicalRecordGroups;
    v22->_medicalRecordGroups = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateLessGroups = v22->_dateLessGroups;
    v22->_dateLessGroups = v33;

    v35 = objc_alloc_init(WDMedicalRecordPagingContext);
    pagingContext = v22->_pagingContext;
    v22->_pagingContext = v35;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 displayItemOptions:(int64_t)a4 sampleTypes:(id)a5 filter:(id)a6 additionalPredicates:(id)a7 sortDescriptors:(id)a8
{
  return -[WDMedicalRecordDisplayItemProvider initWithProfile:ontologyConcept:preloadedRemovedRecords:removedRecordsOnly:displayItemOptions:sampleTypes:filter:additionalPredicates:sortDescriptors:](self, "initWithProfile:ontologyConcept:preloadedRemovedRecords:removedRecordsOnly:displayItemOptions:sampleTypes:filter:additionalPredicates:sortDescriptors:", a3, 0, 0, 0, a4, a5, a6, a7, a8);
}

- (BOOL)loadingNextPage
{
  WDMedicalRecordDisplayItemProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_loadingNextPage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLoadingNextPage:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_loadingNextPage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)reload
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WDMedicalRecordDisplayItemProvider_reload__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __44__WDMedicalRecordDisplayItemProvider_reload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
}

- (void)setFilter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__WDMedicalRecordDisplayItemProvider_setFilter___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__WDMedicalRecordDisplayItemProvider_setFilter___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqual:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
  }
  return result;
}

- (void)setFilterPredicatesByType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WDMedicalRecordDisplayItemProvider_setFilterPredicatesByType___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__WDMedicalRecordDisplayItemProvider_setFilterPredicatesByType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
}

- (void)setSampleTypes:(id)a3 predicatesPerType:(id)a4 accountsPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__WDMedicalRecordDisplayItemProvider_setSampleTypes_predicatesPerType_accountsPredicate___block_invoke;
  v15[3] = &unk_1E74D1288;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __89__WDMedicalRecordDisplayItemProvider_setSampleTypes_predicatesPerType_accountsPredicate___block_invoke(id *a1)
{
  id v2;
  id *v3;
  void *v4;

  v3 = a1 + 4;
  v2 = a1[4];
  if (v3[1])
  {
    objc_msgSend(v2, "setSampleTypes:");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "allSupportedSampleTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setSampleTypes:", v4);

  }
  objc_storeStrong((id *)a1[4] + 3, a1[6]);
  objc_storeStrong((id *)a1[4] + 18, a1[7]);
  return objc_msgSend(a1[4], "_queue_reload");
}

- (void)startCollectingDataUntilRecordWithUUID:(id)a3 withUpdateHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[WDMedicalRecordDisplayItemProvider setUpdateHandler:](self, "setUpdateHandler:", v7);

  -[WDMedicalRecordDisplayItemProvider setTargetUUID:](self, "setTargetUUID:", v8);
  -[WDMedicalRecordDisplayItemProvider setShouldCancelDataCollection:](self, "setShouldCancelDataCollection:", 0);
  os_unfair_lock_unlock(p_lock);
  if (-[WDMedicalRecordDisplayItemProvider numberOfGroups](self, "numberOfGroups") >= 1)
    -[WDMedicalRecordDisplayItemProvider _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:](self, "_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:", 0);
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WDMedicalRecordDisplayItemProvider_startCollectingDataUntilRecordWithUUID_withUpdateHandler___block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v9, block);

}

uint64_t __95__WDMedicalRecordDisplayItemProvider_startCollectingDataUntilRecordWithUUID_withUpdateHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
}

- (void)stopCollectingData
{
  -[WDMedicalRecordDisplayItemProvider setUpdateHandler:](self, "setUpdateHandler:", 0);
  -[WDMedicalRecordDisplayItemProvider setTargetUUID:](self, "setTargetUUID:", 0);
  -[WDMedicalRecordDisplayItemProvider setShouldCancelDataCollection:](self, "setShouldCancelDataCollection:", 1);
}

- (void)requestDataOfNextPage
{
  NSObject *v3;
  _QWORD block[5];

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WDMedicalRecordDisplayItemProvider_requestDataOfNextPage__block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __59__WDMedicalRecordDisplayItemProvider_requestDataOfNextPage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queryForNextBatchOfData");
}

- (int64_t)numberOfGroups
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int64_t v5;
  void *v6;
  char v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider medicalRecordGroups](self, "medicalRecordGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasMoreData");

  if ((v7 & 1) == 0)
  {
    -[WDMedicalRecordDisplayItemProvider dateLessGroups](self, "dateLessGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(v8, "count");

  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (int64_t)numberOfDisplayItemsForGroupAtIndex:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  int64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfDisplayItems");
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)displayItemForIndexPath:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "displayItemAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)indexPathForRecordId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  unint64_t v15;
  void *v16;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider medicalRecordGroups](self, "medicalRecordGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "numberOfDisplayItems") >= 1)
        break;
LABEL_7:

      ++v7;
      -[WDMedicalRecordDisplayItemProvider medicalRecordGroups](self, "medicalRecordGroups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v7 >= v15)
        goto LABEL_8;
    }
    v9 = 0;
    while (1)
    {
      objc_msgSend(v8, "displayItemAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "medicalRecord");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v4, "isEqual:", v12);

      if ((v13 & 1) != 0)
        break;

      if (++v9 >= objc_msgSend(v8, "numberOfDisplayItems"))
        goto LABEL_7;
    }
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    v16 = 0;
  }

  return v16;
}

- (id)titleForGroupAtIndex:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)subtitleForGroupAtIndex:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)sourceForGroupAtIndex:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)removedRecords
{
  NSObject *dataQueryQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dataQueryQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dataQueryQueue = self->_dataQueryQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__WDMedicalRecordDisplayItemProvider_removedRecords__block_invoke;
  v6[3] = &unk_1E74D1DE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataQueryQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__WDMedicalRecordDisplayItemProvider_removedRecords__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pagingContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removedRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_queue_reload
{
  NSObject *v3;

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_shouldClearPagingCacheOnNextReload)
  {
    -[WDMedicalRecordDisplayItemProvider _queue_resetPagingCache](self, "_queue_resetPagingCache");
    self->_shouldClearPagingCacheOnNextReload = 0;
  }
  -[WDMedicalRecordDisplayItemProvider _queue_resetPagingInformation](self, "_queue_resetPagingInformation");
  -[WDMedicalRecordDisplayItemProvider _queue_queryForNextBatchOfData](self, "_queue_queryForNextBatchOfData");
}

- (void)_queue_setupIterator
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[WDMedicalRecordDisplayItemProvider sampleTypes](self, "sampleTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    v36 = *MEMORY[0x1E0CB4A38];
    v7 = 0x1E0CB6000uLL;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v8);
        -[WDMedicalRecordDisplayItemProvider ontologyConcept](self, "ontologyConcept");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(void **)(v7 + 2680);
          -[WDMedicalRecordDisplayItemProvider ontologyConcept](self, "ontologyConcept");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "predicateForSamplesWithConceptIdentifier:keyPath:", v13, v36);
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[WDMedicalRecordDisplayItemProvider userDomainConcept](self, "userDomainConcept");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[WDMedicalRecordDisplayItemProvider filterPredicatesByType](self, "filterPredicatesByType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = *(void **)(v7 + 2680);
            -[WDMedicalRecordDisplayItemProvider userDomainConcept](self, "userDomainConcept");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "predicateForMedicalRecordsAssociatedWithMedicalUserDomainConcept:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v21 = v20;
            if (v12)
              objc_msgSend(v20, "addObject:", v12);
            if (v19)
              objc_msgSend(v21, "addObject:", v19);
            if (objc_msgSend(v21, "count"))
            {
              objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }

            v7 = 0x1E0CB6000uLL;
          }
          else
          {
            -[WDMedicalRecordDisplayItemProvider _queue_synthesizedPredicatesForMedicalType:](self, "_queue_synthesizedPredicatesForMedicalType:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }
          }
        }

        if (self->_removedRecordsOnly)
        {
          objc_msgSend(*(id *)(v7 + 2680), "predicateForMedicalRecordWithState:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v14)
          {
            v24 = (void *)MEMORY[0x1E0CB3528];
            v42[0] = v22;
            v42[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
            v26 = objc_claimAutoreleasedReturnValue();

            v7 = 0x1E0CB6000;
            v14 = (id)v26;
          }
          else
          {
            v14 = v22;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB6A88], "queryDescriptorWithSampleType:predicate:", v9, v14);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v27);

        ++v8;
      }
      while (v5 != v8);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v5 = v28;
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB53D8], 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc(MEMORY[0x1E0CB68F0]);
  v41 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItemProvider profile](self, "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "healthStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v30, "initWithQueryDescriptors:sortDescriptors:bufferSize:healthStore:", v3, v31, 16, v33);
  -[WDMedicalRecordDisplayItemProvider setIterator:](self, "setIterator:", v34);

}

- (void)_queue_resetPagingInformation
{
  NSObject *v3;
  void *v4;
  id v5;

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetPagingContext");

  -[WDMedicalRecordDisplayItemProvider _queue_setupIterator](self, "_queue_setupIterator");
  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPagingContextReady:", 1);

}

- (void)_queue_resetPagingCache
{
  NSObject *v3;
  id v4;
  id v5;

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordDisplayItemProvider setMedicalRecordGroups:](self, "setMedicalRecordGroups:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordDisplayItemProvider setDateLessGroups:](self, "setDateLessGroups:", v5);

}

- (id)_queue_synthesizedPredicatesForMedicalType:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[WDMedicalRecordDisplayItemProvider additionalPredicates](self, "additionalPredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  -[WDMedicalRecordDisplayItemProvider filter](self, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WDMedicalRecordDisplayItemProvider filter](self, "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  -[WDMedicalRecordDisplayItemProvider accountsPredicate](self, "accountsPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WDMedicalRecordDisplayItemProvider accountsPredicate](self, "accountsPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  return v6;
}

- (id)_displayItemGroupAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[WDMedicalRecordDisplayItemProvider medicalRecordGroups](self, "medicalRecordGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[WDMedicalRecordDisplayItemProvider medicalRecordGroups](self, "medicalRecordGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= a3)
  {
    a3 -= objc_msgSend(v7, "count");

    -[WDMedicalRecordDisplayItemProvider dateLessGroups](self, "dateLessGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke;
  block[3] = &unk_1E74D2138;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  BOOL v22;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[os_unfair_lock_s pendingMedicalRecordGroups](WeakRetained, "pendingMedicalRecordGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[os_unfair_lock_s pendingDateLessGroups](v3, "pendingDateLessGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[os_unfair_lock_s setPendingMedicalRecordGroups:](v3, "setPendingMedicalRecordGroups:", 0);
    -[os_unfair_lock_s setPendingDateLessGroups:](v3, "setPendingDateLessGroups:", 0);
    -[os_unfair_lock_s pagingContext](v3, "pagingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removedRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    os_unfair_lock_lock(v3 + 2);
    v11 = *(_BYTE *)(a1 + 40) || objc_msgSend(v5, "count") || objc_msgSend(v7, "count") != 0;
    -[os_unfair_lock_s pagingContext](v3, "pagingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldClearDisplayItemGroups");

    if (v13)
    {
      -[os_unfair_lock_s pagingContext](v3, "pagingContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShouldClearDisplayItemGroups:", 0);

      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[os_unfair_lock_s setMedicalRecordGroups:](v3, "setMedicalRecordGroups:", v15);

      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[os_unfair_lock_s setDateLessGroups:](v3, "setDateLessGroups:", v16);

      v11 = 1;
    }
    -[os_unfair_lock_s medicalRecordGroups](v3, "medicalRecordGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v5);

    -[os_unfair_lock_s dateLessGroups](v3, "dateLessGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v7);

    -[os_unfair_lock_s setNumOfRemovedRecords:](v3, "setNumOfRemovedRecords:", v10);
    -[os_unfair_lock_s pagingContext](v3, "pagingContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "hasMoreData") & 1) != 0)
    {

    }
    else
    {
      v20 = -[os_unfair_lock_s numOfRemovedRecords](v3, "numOfRemovedRecords");

      if (v20 > 0)
        v11 = 1;
    }
    os_unfair_lock_unlock(v3 + 2);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke_2;
    v21[3] = &unk_1E74D1808;
    v21[4] = v3;
    v22 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

  }
}

void __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_queue_queryForNextBatchOfData
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD);
  int v47;
  id v48;
  id v49;
  id v50;
  id v51;

  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[WDMedicalRecordDisplayItemProvider shouldCancelDataCollection](self, "shouldCancelDataCollection"))
    return;
  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldQueryForNextBatch");

  if (!v5)
    return;
  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchingCurrentPage:", 1);

  -[WDMedicalRecordDisplayItemProvider preloadedRemovedRecords](self, "preloadedRemovedRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchingCurrentPage:", 0);

    -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHasMoreData:", 0);

    -[WDMedicalRecordDisplayItemProvider preloadedRemovedRecords](self, "preloadedRemovedRecords");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordDisplayItemProvider _queue_processAccumulatedRecordsForPage:](self, "_queue_processAccumulatedRecordsForPage:", v48);

    return;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sample");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = 0;
  }
  else
  {
    -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v15, "advanceWithError:", &v51);
    v14 = v51;

  }
  -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sample");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "meaningfulDateDisplayStringWithPreferredForm:showTime:", 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v17);
  }
  else
  {
    v18 = 0;
  }
  v47 = 0;
  while (1)
  {
    v19 = v14;
    -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v14;
    objc_msgSend(v20, "advanceWithError:", &v50);
    v14 = v50;

    -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sample");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v22)
    {

LABEL_26:
      -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHasMoreData:", 0);
LABEL_28:

      -[WDMedicalRecordDisplayItemProvider errorHandler](self, "errorHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        if (v14)
        {
          -[WDMedicalRecordDisplayItemProvider errorHandler](self, "errorHandler");
          v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v42)[2](v42, v14);

        }
      }
      -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setFetchingCurrentPage:", 0);

      -[WDMedicalRecordDisplayItemProvider _queue_processAccumulatedRecordsForPage:](self, "_queue_processAccumulatedRecordsForPage:", v11);
      goto LABEL_32;
    }
    v23 = (void *)v22;
    -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sample");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_26;
    -[WDMedicalRecordDisplayItemProvider iterator](self, "iterator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sample");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "meaningfulDateDisplayStringWithPreferredForm:showTime:", 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    if ((unint64_t)objc_msgSend(v11, "count") >= 9)
      v29 = objc_msgSend(v28, "isEqual:", v18) ^ 1;
    -[WDMedicalRecordDisplayItemProvider ontologyConcept](self, "ontologyConcept");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
LABEL_23:
      if ((v29 & 1) != 0)
        goto LABEL_27;
      goto LABEL_24;
    }
    v49 = v14;
    v31 = v18;
    v32 = v11;
    -[WDMedicalRecordDisplayItemProvider ontologyConcept](self, "ontologyConcept");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "primaryConcept");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "groupByConcept");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "isEqual:", v35);

    if ((v36 & 1) == 0)
      break;
    -[WDMedicalRecordDisplayItemProvider targetUUID](self, "targetUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v32;
    v18 = v31;
    v14 = v49;
    if (!v37)
      goto LABEL_23;
    objc_msgSend(v27, "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordDisplayItemProvider targetUUID](self, "targetUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (v40)
    {
      -[WDMedicalRecordDisplayItemProvider setTargetUUID:](self, "setTargetUUID:", 0);
      v47 = 1;
    }
    if ((v47 & v29 & 1) != 0)
    {
LABEL_27:
      v17 = v27;
      goto LABEL_28;
    }
LABEL_24:

    objc_msgSend(v11, "addObject:", v27);
    v18 = v28;
    v17 = v27;
  }
  -[WDMedicalRecordDisplayItemProvider errorHandler](self, "errorHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v32;
  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.health.HealthRecordsUI"), 100, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordDisplayItemProvider errorHandler](self, "errorHandler");
    v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v46)[2](v46, v45);

  }
  v17 = v27;
  v18 = v31;
  v14 = v49;
LABEL_32:

}

- (void)_queue_processAccumulatedRecordsForPage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;

  v4 = a3;
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unprocessedRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v6);

  -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unprocessedRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_filter:", &__block_literal_global_257);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") <= 8
    && (-[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hasMoreData"),
        v12,
        (v13 & 1) != 0))
  {
    -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasMoreData");

    if (v15)
      -[WDMedicalRecordDisplayItemProvider _queue_queryForNextBatchOfData](self, "_queue_queryForNextBatchOfData");
    else
      -[WDMedicalRecordDisplayItemProvider _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:](self, "_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:", 0);
  }
  else
  {
    v16 = self->_displayItemOptions & 1;
    -[WDMedicalRecordDisplayItemProvider ontologyConcept](self, "ontologyConcept");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = 2;
    else
      v18 = v16;
    objc_initWeak(&location, self);
    -[WDMedicalRecordDisplayItemProvider pagingContext](self, "pagingContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unprocessedRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_3;
    v21[3] = &unk_1E74D21E0;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    -[WDMedicalRecordDisplayItemProvider _displayItemGroupsForSummaryOfRecords:style:completion:](self, "_displayItemGroupsForSummaryOfRecords:style:completion:", v20, v18, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

uint64_t __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v4;
    v7 = v5;
    objc_msgSend(v7, "sortDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (!v10)
    {
      objc_msgSend(v6, "displayNameForGroupByConcept");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayNameForGroupByConcept");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "localizedStandardCompare:", v12);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isDisplayable") && (objc_msgSend(v2, "isDateLess") & 1) == 0)
    v3 = objc_msgSend(v2, "isRemovedFromRemote") ^ 1;
  else
    v3 = 0;

  return v3;
}

void __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pagingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unprocessedRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    objc_msgSend(v8, "setPendingMedicalRecordGroups:", v5);
    objc_msgSend(v8, "setPendingDateLessGroups:", v6);
    objc_msgSend(v8, "pagingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removedRecords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v8, "medicalRecordGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") || objc_msgSend(v5, "count"))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v8, "dateLessGroups");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
        v15 = 0;
      else
        v15 = objc_msgSend(v6, "count") == 0;

    }
    objc_msgSend(v8, "pagingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasMoreData");

    if (v17 || !v15)
    {
      objc_msgSend(v8, "dataQueryQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_4;
      block[3] = &unk_1E74D1218;
      block[4] = v8;
      dispatch_async(v18, block);

    }
    else
    {
      objc_msgSend(v8, "_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:", 0);
    }
    objc_msgSend(v8, "pagingContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasMoreData");

    if ((v20 & 1) == 0 && v13)
      objc_msgSend(v8, "_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:", 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }

}

void __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pagingContext", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "computingDaySummaries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "recomputeIfNeeded");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_displayItemGroupsForSummaryOfRecords:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  BOOL v18;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = -[WDMedicalRecordDisplayItemProvider removedRecordsOnly](self, "removedRecordsOnly");
  objc_initWeak(&location, self);
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__WDMedicalRecordDisplayItemProvider__displayItemGroupsForSummaryOfRecords_style_completion___block_invoke;
  v14[3] = &unk_1E74D2208;
  objc_copyWeak(v17, &location);
  v18 = v10;
  v17[1] = (id)a4;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __93__WDMedicalRecordDisplayItemProvider__displayItemGroupsForSummaryOfRecords_style_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WDMedicalRecordDaySummary *v16;
  WDMedicalRecordDaySummary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  WDMedicalRecordDaySummary *v25;
  WDMedicalRecordDaySummary *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v1 = a1;
  v65 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_39;
  v50 = WeakRetained;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = *(id *)(v1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  v51 = v4;
  v48 = v1;
  v49 = v5;
  if (!v6)
    goto LABEL_23;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v60 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isDisplayable", v46) & 1) == 0)
        goto LABEL_11;
      if (!*(_BYTE *)(v1 + 64) && objc_msgSend(v11, "isRemovedFromRemote"))
      {
        objc_msgSend(v50, "pagingContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removedRecords");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v11);

LABEL_11:
        ++v8;
        continue;
      }
      if (objc_msgSend(v11, "isDateLess"))
      {
        objc_msgSend(v11, "sourceRevision");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v15);
        v16 = (WDMedicalRecordDaySummary *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v17 = [WDMedicalRecordDaySummary alloc];
          objc_msgSend(v50, "profile");
          v53 = v8;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[WDMedicalRecordDaySummary initWithProfile:style:delegate:](v17, "initWithProfile:style:delegate:", v18, *(_QWORD *)(v1 + 56), v50);

          objc_msgSend(v49, "setObject:forKeyedSubscript:", v16, v15);
          v5 = v49;
          objc_msgSend(v50, "pagingContext");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "computingDaySummaries");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v16);

          v4 = v51;
          v8 = v53;
        }
        -[WDMedicalRecordDaySummary addMedicalRecord:](v16, "addMedicalRecord:", v11);

      }
      else
      {
        v54 = v8;
        objc_msgSend(v11, "meaningfulDateDisplayStringWithPreferredForm:showTime:", 1, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v21);
          objc_msgSend(v47, "addObject:", v21);
        }
        objc_msgSend(v11, "sourceRevision");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "source");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "objectForKeyedSubscript:", v24);
        v25 = (WDMedicalRecordDaySummary *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v26 = [WDMedicalRecordDaySummary alloc];
          objc_msgSend(v50, "profile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[WDMedicalRecordDaySummary initWithProfile:style:delegate:](v26, "initWithProfile:style:delegate:", v27, *(_QWORD *)(v48 + 56), v50);

          objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, v24);
          objc_msgSend(v50, "pagingContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "computingDaySummaries");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v25);

          v1 = v48;
          v5 = v49;
        }
        -[WDMedicalRecordDaySummary addMedicalRecord:](v25, "addMedicalRecord:", v11);

        v4 = v51;
        v8 = v54;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  }
  while (v7);
LABEL_23:

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v30 = v47;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  v3 = v50;
  v32 = v46;
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v56 != v34)
          objc_enumerationMutation(v30);
        v36 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v36, v46);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_sortedDisplayItemGroupWithDateDisplay:sourceDaySummaryMapping:", v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "addObjectsFromArray:", v38);
      }
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x1E0CB6CE0], "unknownRecordType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sampleTypes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count") == 1)
  {
    objc_msgSend(v50, "sampleTypes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 == v39)
    {
      v43 = 0;
      goto LABEL_35;
    }
  }
  else
  {

  }
  HKHealthKitFrameworkBundle();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("MEDICAL_RECORD_SUMMARY_NO_DATE_SECTION_TITLE"), &stru_1E74EA150, CFSTR("Localizable-Clinical-Health-Records"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
  if (objc_msgSend(v49, "count", v46))
  {
    objc_msgSend(v50, "_sortedDisplayItemGroupWithDateDisplay:sourceDaySummaryMapping:", v43, v49);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(v48 + 40) + 16))();

LABEL_39:
}

- (id)_sortedDisplayItemGroupWithDateDisplay:(id)a3 sourceDaySummaryMapping:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_270);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordDisplayItemGroup displayItemGroupWithDaySummary:](WDMedicalRecordDisplayItemGroup, "displayItemGroupWithDaySummary:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSource:", v14);
        if (v5)
        {
          objc_msgSend(v16, "setTitle:", v5);
          objc_msgSend(v14, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setSubtitle:", v17);

        }
        else
        {
          objc_msgSend(v14, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTitle:", v18);

          objc_msgSend(v16, "setSubtitle:", 0);
        }
        objc_msgSend(v7, "addObject:", v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v7;
}

uint64_t __101__WDMedicalRecordDisplayItemProvider__sortedDisplayItemGroupWithDateDisplay_sourceDaySummaryMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)daySummaryHasDisplayItemUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WDMedicalRecordDisplayItemProvider dataQueryQueue](self, "dataQueryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__WDMedicalRecordDisplayItemProvider_daySummaryHasDisplayItemUpdate___block_invoke;
  v7[3] = &unk_1E74D1A90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__WDMedicalRecordDisplayItemProvider_daySummaryHasDisplayItemUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "pagingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "computingDaySummaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "pagingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "computingDaySummaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:", 1);
}

+ (id)allSupportedRecordCategories
{
  if (allSupportedRecordCategories_onceToken != -1)
    dispatch_once(&allSupportedRecordCategories_onceToken, &__block_literal_global_272);
  return (id)allSupportedRecordCategories_categories;
}

void __66__WDMedicalRecordDisplayItemProvider_allSupportedRecordCategories__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WDMedicalRecordCategory *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  void *v87;
  _QWORD v88[5];
  _QWORD v89[5];
  void *v90;
  _QWORD v91[5];
  _QWORD v92[5];
  void *v93;
  _QWORD v94[4];
  _QWORD v95[4];
  void *v96;
  _QWORD v97[5];
  _QWORD v98[5];
  void *v99;
  _QWORD v100[5];
  _QWORD v101[5];
  void *v102;
  _QWORD v103[5];
  _QWORD v104[5];
  void *v105;
  _QWORD v106[5];
  _QWORD v107[5];
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[6];
  _QWORD v112[6];
  void *v113;
  void *v114;
  _QWORD v115[2];
  _QWORD v116[6];
  _QWORD v117[6];
  _QWORD v118[3];
  _QWORD v119[5];
  _QWORD v120[5];
  _QWORD v121[12];

  v121[10] = *MEMORY[0x1E0C80C00];
  v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v120[0] = &unk_1E7513170;
  v119[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v119[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "medicationsClinicalColors");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v80;
  v119[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("MEDICATIONS_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v78;
  v120[3] = CFSTR("health_records_medications");
  v119[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v119[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB68D0], "medicationOrderType");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v77;
  objc_msgSend(MEMORY[0x1E0CB6890], "medicationDispenseRecordType");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v76;
  objc_msgSend(MEMORY[0x1E0CB68E0], "medicationRecordType");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v74;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v73;
  v117[0] = &unk_1E7513188;
  v116[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v116[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "labResultsClinicalColors");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v72;
  v116[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("LAB_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v70;
  v117[3] = CFSTR("health_records_lab_results");
  v116[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v116[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6618], "diagnosticTestReportType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v69;
  objc_msgSend(MEMORY[0x1E0CB6628], "diagnosticTestResultType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v67;
  v116[5] = CFSTR("WDMedicalRecordCategoryAdditionalPredicates");
  objc_msgSend(MEMORY[0x1E0CB6628], "diagnosticTestResultType");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v66;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForDiagnosticTestResultCategory:", *MEMORY[0x1E0CB4CB0]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v65;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v117[5] = v64;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v63;
  v112[0] = &unk_1E75131A0;
  v111[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v111[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "vitalsClinicalColors");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v62;
  v111[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("CLINICAL_VITALS_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v60;
  v112[3] = CFSTR("health_records_vitals");
  v111[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v111[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6628], "diagnosticTestResultType");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v112[4] = v58;
  v111[5] = CFSTR("WDMedicalRecordCategoryAdditionalPredicates");
  objc_msgSend(MEMORY[0x1E0CB6628], "diagnosticTestResultType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v57;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForDiagnosticTestResultCategory:", *MEMORY[0x1E0CB4CB8]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v112[5] = v55;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v54;
  v107[0] = &unk_1E75131B8;
  v106[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v106[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "conditionsClinicalColors");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v53;
  v106[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("CONDITION_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v51;
  v107[3] = CFSTR("health_records_conditions");
  v106[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v106[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB64F0], "conditionRecordType");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v121[3] = v48;
  v104[0] = &unk_1E75131D0;
  v103[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v103[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "proceduresClinicalColors");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v47;
  v103[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("PROCEDURE_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v45;
  v104[3] = CFSTR("health_records_procedures");
  v103[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v103[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6A00], "procedureRecordType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v121[4] = v42;
  v101[0] = &unk_1E75131E8;
  v100[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v100[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "immunizationsClinicalColors");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v41;
  v100[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("IMMUNIZATION_CATEGORY"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v39;
  v101[3] = CFSTR("health_records_immunizations");
  v100[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v100[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6D70], "vaccinationRecordType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v121[5] = v36;
  v98[0] = &unk_1E7513200;
  v97[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v97[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "allergiesClinicalColors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v35;
  v97[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("ALLERGY_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v33;
  v98[3] = CFSTR("health_records_allergies");
  v97[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v97[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB62A0], "allergyRecordType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v121[6] = v30;
  v95[0] = &unk_1E7513158;
  v94[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v94[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "unknownCategoryClinicalColors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v29;
  v94[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_RECORDS"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v27;
  v94[3] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6CE0], "unknownRecordType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v121[7] = v24;
  v92[0] = &unk_1E7513218;
  v91[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v91[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "insuranceClinicalColors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v23;
  v91[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("INSURANCE_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v21;
  v92[3] = CFSTR("health_records_insurance");
  v91[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v91[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB6550], "coverageRecordType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v121[8] = v2;
  v89[0] = &unk_1E7513230;
  v88[0] = CFSTR("HKMedicalRecordCategoryTypeIdentifer");
  v88[1] = CFSTR("WDMedicalRecordCategoryMetricColors");
  objc_msgSend(MEMORY[0x1E0D2F8D0], "clinicalNotesClinicalColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v3;
  v88[2] = CFSTR("WDMedicalRecordCategoryDisplayName");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CLINICAL_NOTES_CATEGORY"), &stru_1E74EA150, CFSTR("HealthUI-Localizable-Clinical-Notes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v5;
  v89[3] = CFSTR("health_records_clinical_notes");
  v88[3] = CFSTR("WDMedicalRecordCategoryDisplayImageName");
  v88[4] = CFSTR("WDMedicalRecordCategorySampleTypes");
  objc_msgSend(MEMORY[0x1E0CB63C8], "clinicalNoteRecordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v121[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v83;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v83 != v13)
          objc_enumerationMutation(v10);
        v15 = -[WDMedicalRecordCategory initWithDictionary:]([WDMedicalRecordCategory alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v14));
        switch(-[WDMedicalRecordCategory categoryType](v15, "categoryType"))
        {
          case 0:
          case 8:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_unreadable");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 1:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_medications");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 2:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_labResults");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 3:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_clinicalVitals");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 4:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_conditions");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 5:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_procedures");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 6:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_immunizations");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 7:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_allergies");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 9:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_insurance");
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          case 10:
            objc_msgSend(MEMORY[0x1E0DC3658], "hrui_clinicalNotes");
            v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
            v17 = (void *)v16;
            -[WDMedicalRecordCategory categoryMetricColors](v15, "categoryMetricColors");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setKeyColor:", v17);

            break;
          default:
            break;
        }
        objc_msgSend(v81, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    }
    while (v12);
  }

  v19 = objc_msgSend(v81, "copy");
  v20 = (void *)allSupportedRecordCategories_categories;
  allSupportedRecordCategories_categories = v19;

}

+ (id)supportedRecordCategoriesByCategoryType
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WDMedicalRecordDisplayItemProvider_supportedRecordCategoriesByCategoryType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedRecordCategoriesByCategoryType_onceToken[0] != -1)
    dispatch_once(supportedRecordCategoriesByCategoryType_onceToken, block);
  return (id)supportedRecordCategoriesByCategoryType_categoryDictionary;
}

void __77__WDMedicalRecordDisplayItemProvider_supportedRecordCategoriesByCategoryType__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "allSupportedRecordCategories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "categoryType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  v8 = objc_msgSend(v0, "copy");
  v9 = (void *)supportedRecordCategoriesByCategoryType_categoryDictionary;
  supportedRecordCategoriesByCategoryType_categoryDictionary = v8;

}

+ (id)allSupportedSampleTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WDMedicalRecordDisplayItemProvider_allSupportedSampleTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = 1;
  if (allSupportedSampleTypes_onceToken[0] != -1)
    dispatch_once(allSupportedSampleTypes_onceToken, block);
  return (id)allSupportedSampleTypes_sampleTypes;
}

void __61__WDMedicalRecordDisplayItemProvider_allSupportedSampleTypes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB6B00], "medicalRecordTypesWithOptions:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)allSupportedSampleTypes_sampleTypes;
  allSupportedSampleTypes_sampleTypes = v1;

}

+ (id)unknownRecordCategory
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "supportedRecordCategoriesByCategoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E7513158);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)displayItemOptions
{
  return self->_displayItemOptions;
}

- (void)setDisplayItemOptions:(int64_t)a3
{
  self->_displayItemOptions = a3;
}

- (NSDictionary)additionalPredicates
{
  return self->_additionalPredicates;
}

- (NSPredicate)filter
{
  return self->_filter;
}

- (NSDictionary)filterPredicatesByType
{
  return self->_filterPredicatesByType;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)numOfRemovedRecords
{
  return self->_numOfRemovedRecords;
}

- (void)setNumOfRemovedRecords:(int64_t)a3
{
  self->_numOfRemovedRecords = a3;
}

- (BOOL)shouldClearPagingCacheOnNextReload
{
  return self->_shouldClearPagingCacheOnNextReload;
}

- (void)setShouldClearPagingCacheOnNextReload:(BOOL)a3
{
  self->_shouldClearPagingCacheOnNextReload = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyConcept, a3);
}

- (HKMedicalUserDomainConcept)userDomainConcept
{
  return self->_userDomainConcept;
}

- (void)setUserDomainConcept:(id)a3
{
  objc_storeStrong((id *)&self->_userDomainConcept, a3);
}

- (NSArray)preloadedRemovedRecords
{
  return self->_preloadedRemovedRecords;
}

- (void)setPreloadedRemovedRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)removedRecordsOnly
{
  return self->_removedRecordsOnly;
}

- (void)setRemovedRecordsOnly:(BOOL)a3
{
  self->_removedRecordsOnly = a3;
}

- (NSMutableArray)medicalRecordGroups
{
  return self->_medicalRecordGroups;
}

- (void)setMedicalRecordGroups:(id)a3
{
  objc_storeStrong((id *)&self->_medicalRecordGroups, a3);
}

- (NSMutableArray)dateLessGroups
{
  return self->_dateLessGroups;
}

- (void)setDateLessGroups:(id)a3
{
  objc_storeStrong((id *)&self->_dateLessGroups, a3);
}

- (NSArray)pendingMedicalRecordGroups
{
  return self->_pendingMedicalRecordGroups;
}

- (void)setPendingMedicalRecordGroups:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMedicalRecordGroups, a3);
}

- (NSArray)pendingDateLessGroups
{
  return self->_pendingDateLessGroups;
}

- (void)setPendingDateLessGroups:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDateLessGroups, a3);
}

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (void)setSampleTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (NSPredicate)accountsPredicate
{
  return self->_accountsPredicate;
}

- (void)setAccountsPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_accountsPredicate, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSUUID)targetUUID
{
  return self->_targetUUID;
}

- (void)setTargetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (OS_dispatch_queue)dataQueryQueue
{
  return self->_dataQueryQueue;
}

- (void)setDataQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueryQueue, a3);
}

- (WDMedicalRecordPagingContext)pagingContext
{
  return self->_pagingContext;
}

- (void)setPagingContext:(id)a3
{
  objc_storeStrong((id *)&self->_pagingContext, a3);
}

- (HKMultiTypeSampleIterator)iterator
{
  return self->_iterator;
}

- (void)setIterator:(id)a3
{
  objc_storeStrong((id *)&self->_iterator, a3);
}

- (BOOL)shouldCancelDataCollection
{
  return self->_shouldCancelDataCollection;
}

- (void)setShouldCancelDataCollection:(BOOL)a3
{
  self->_shouldCancelDataCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterator, 0);
  objc_storeStrong((id *)&self->_pagingContext, 0);
  objc_storeStrong((id *)&self->_dataQueryQueue, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_accountsPredicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong((id *)&self->_pendingDateLessGroups, 0);
  objc_storeStrong((id *)&self->_pendingMedicalRecordGroups, 0);
  objc_storeStrong((id *)&self->_dateLessGroups, 0);
  objc_storeStrong((id *)&self->_medicalRecordGroups, 0);
  objc_storeStrong((id *)&self->_preloadedRemovedRecords, 0);
  objc_storeStrong((id *)&self->_userDomainConcept, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_filterPredicatesByType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_additionalPredicates, 0);
}

@end
