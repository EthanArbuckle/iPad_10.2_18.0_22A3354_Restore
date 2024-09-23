@implementation HKStatisticsCollectionQuery

- (HKStatisticsCollectionQuery)initWithQuantityType:(HKQuantityType *)quantityType quantitySamplePredicate:(NSPredicate *)quantitySamplePredicate options:(HKStatisticsOptions)options anchorDate:(NSDate *)anchorDate intervalComponents:(NSDateComponents *)intervalComponents
{
  HKStatisticsCollectionQuery *result;

  result = -[HKStatisticsCollectionQuery initWithSampleType:samplePredicate:options:anchorDate:intervalComponents:](self, "initWithSampleType:samplePredicate:options:anchorDate:intervalComponents:", quantityType, quantitySamplePredicate, options, anchorDate, intervalComponents);
  if (result)
    result->_requireQuantityType = 1;
  return result;
}

- (HKStatisticsCollectionQuery)initWithSampleType:(id)a3 samplePredicate:(id)a4 options:(unint64_t)a5 anchorDate:(id)a6 intervalComponents:(id)a7
{
  id v13;
  id v14;
  HKStatisticsCollectionQuery *v15;
  HKStatisticsCollectionQuery *v16;
  uint64_t v17;
  NSDateComponents *intervalComponents;
  NSMutableArray *v19;
  NSMutableArray *results;
  objc_super v22;

  v13 = a6;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKStatisticsCollectionQuery;
  v15 = -[HKQuery _initWithObjectType:predicate:](&v22, sel__initWithObjectType_predicate_, a3, a4);
  v16 = v15;
  if (v15)
  {
    v15->_options = a5;
    objc_storeStrong((id *)&v15->_anchorDate, a6);
    v17 = objc_msgSend(v14, "copy");
    intervalComponents = v16->_intervalComponents;
    v16->_intervalComponents = (NSDateComponents *)v17;

    v16->_mergeStrategy = 0;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    results = v16->_results;
    v16->_results = v19;

  }
  return v16;
}

- (void)setInitialResultsHandler:(void *)initialResultsHandler
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = initialResultsHandler;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKStatisticsCollectionQuery_setInitialResultsHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __56__HKStatisticsCollectionQuery_setInitialResultsHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = v2;

}

- (void)setStatisticsUpdateHandler:(void *)statisticsUpdateHandler
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = statisticsUpdateHandler;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKStatisticsCollectionQuery_setStatisticsUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __58__HKStatisticsCollectionQuery_setStatisticsUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

- (void)setMergeStrategy:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HKStatisticsCollectionQuery_setMergeStrategy___block_invoke;
  v6[3] = &unk_1E37E8940;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __48__HKStatisticsCollectionQuery_setMergeStrategy___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 248) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setDateInterval:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HKStatisticsCollectionQuery_setDateInterval___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __47__HKStatisticsCollectionQuery_setDateInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 224);
  *(_QWORD *)(v3 + 224) = v2;

}

- (void)setCacheSettings:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKStatisticsCollectionQuery_setCacheSettings___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __48__HKStatisticsCollectionQuery_setCacheSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 232);
  *(_QWORD *)(v3 + 232) = v2;

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3E04F8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKStatisticsCollectionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKStatisticsCollectionQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  objc_msgSend(v4, "setMergeStrategy:", self->_mergeStrategy);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);
  objc_msgSend(v4, "setCacheSettings:", self->_cacheSettings);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  NSNumber *lastAnchor;
  HKStatisticsCollection *statisticsCollection;
  id initialResultsHandler;
  id statisticsUpdateHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKStatisticsCollectionQuery;
  -[HKQuery queue_queryDidDeactivate:](&v8, sel_queue_queryDidDeactivate_, a3);
  lastAnchor = self->_lastAnchor;
  self->_lastAnchor = 0;

  statisticsCollection = self->_statisticsCollection;
  self->_statisticsCollection = 0;

  initialResultsHandler = self->_initialResultsHandler;
  self->_initialResultsHandler = 0;

  statisticsUpdateHandler = self->_statisticsUpdateHandler;
  self->_statisticsUpdateHandler = 0;

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return !self->_statisticsUpdateHandler && self->_unitTest_finishedCachingStatisticsHandler == 0;
}

- (void)queue_validate
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_1_13(a1, a2);
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_19A0E6000, v5, v6, "Not using cached results for query with caching identifier %@ due to nil dateInterval", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id *v7;
  id *v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  if (self->_hasReceivedInitialResults)
  {
    v5 = _Block_copy(self->_statisticsUpdateHandler);
    if (v5)
    {
      -[HKQuery clientQueue](self, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke_2;
      v10[3] = &unk_1E37E6710;
      v7 = &v12;
      v5 = v5;
      v12 = v5;
      v10[4] = self;
      v8 = &v11;
      v11 = v4;
      v9 = v10;
LABEL_6:
      dispatch_async(v6, v9);

    }
  }
  else
  {
    v5 = _Block_copy(self->_initialResultsHandler);
    if (v5)
    {
      -[HKQuery clientQueue](self, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke;
      block[3] = &unk_1E37E6710;
      v7 = &v15;
      v5 = v5;
      v15 = v5;
      block[4] = self;
      v8 = &v14;
      v14 = v4;
      v9 = block;
      goto LABEL_6;
    }
  }

}

uint64_t __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __50__HKStatisticsCollectionQuery_queue_deliverError___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (void)client_deliverStatisticsBatch:(id)a3 resetStatistics:(BOOL)a4 isFinal:(BOOL)a5 anchor:(id)a6 query:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[HKQuery queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__HKStatisticsCollectionQuery_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query___block_invoke;
  block[3] = &unk_1E37F52B8;
  v23 = a4;
  block[4] = self;
  v20 = v12;
  v24 = a5;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, block);

}

void __98__HKStatisticsCollectionQuery_client_deliverStatisticsBatch_resetStatistics_isFinal_anchor_query___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 176);
    *(_QWORD *)(v3 + 176) = v2;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "_resetStatistics:", MEMORY[0x1E0C9AA60]);
  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObjectsFromArray:");
  if (*(_BYTE *)(a1 + 65))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 184))
    {
      v8 = *(void **)(v7 + 208);
      *(_QWORD *)(v7 + 208) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_queue_deliverResetStatisticsObjects:forQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(_QWORD *)(a1 + 56));
    }
    else
    {
      objc_msgSend((id)v7, "_queue_deliverInitialStatisticsObjects:anchor:queryUUID:", *(_QWORD *)(v7 + 176), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    v9 = objc_opt_new();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 176);
    *(_QWORD *)(v10 + 176) = v9;

  }
}

- (void)client_deliverUpdatedStatistics:(id)a3 anchor:(id)a4 query:(id)a5
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
  -[HKQuery queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HKStatisticsCollectionQuery_client_deliverUpdatedStatistics_anchor_query___block_invoke;
  v15[3] = &unk_1E37EBEA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __76__HKStatisticsCollectionQuery_client_deliverUpdatedStatistics_anchor_query___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    v3[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_deliverStatisticsObjects:forQuery:", v2, *(_QWORD *)(a1 + 56));

}

- (void)client_finishedCachingStatisticsWithCacheHits:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HKQuery queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HKStatisticsCollectionQuery_client_finishedCachingStatisticsWithCacheHits_error___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __83__HKStatisticsCollectionQuery_client_finishedCachingStatisticsWithCacheHits_error___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(a1[4] + 240));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD, BOOL))v2 + 2))(v2, a1[6], a1[5] == 0);
    v2 = v3;
  }

}

- (void)_queue_deliverInitialStatisticsObjects:(id)a3 anchor:(id)a4 queryUUID:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  HKStatisticsCollection *v11;
  void *v12;
  HKStatisticsCollection *v13;
  NSDate *anchorDate;
  NSDateComponents *intervalComponents;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  _BOOL8 v25;
  _QWORD v26[5];
  HKStatisticsCollection *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HKStatisticsCollectionQuery setLastAnchor:](self, "setLastAnchor:", a4);
  -[HKStatisticsCollectionQuery statisticsCollection](self, "statisticsCollection");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (HKStatisticsCollection *)v10;
    -[HKStatisticsCollectionQuery _queue_deliverResetStatisticsObjects:forQuery:](self, "_queue_deliverResetStatisticsObjects:forQuery:", v8, v9);
  }
  else
  {
    -[HKQuery objectType](self, "objectType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HKStatisticsCollection alloc];
    anchorDate = self->_anchorDate;
    intervalComponents = self->_intervalComponents;
    v16 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke;
    v33[3] = &unk_1E37F52E0;
    v17 = v12;
    v34 = v17;
    v11 = -[HKStatisticsCollection initWithAnchorDate:statisticsInterval:emptyStatisticsConstructor:](v13, "initWithAnchorDate:statisticsInterval:emptyStatisticsConstructor:", anchorDate, intervalComponents, v33);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          -[HKStatisticsCollection _insertStatistics:](v11, "_insertStatistics:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v20);
    }

    -[HKStatisticsCollectionQuery setStatisticsCollection:](self, "setStatisticsCollection:", v11);
    self->_hasReceivedInitialResults = 1;
    v23 = _Block_copy(self->_initialResultsHandler);
    v24 = -[HKStatisticsCollectionQuery queue_shouldDeactivateAfterInitialResults](self, "queue_shouldDeactivateAfterInitialResults");
    if (v23)
    {
      v25 = v24;
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke_2;
      v26[3] = &unk_1E37E6710;
      v28 = v23;
      v26[4] = self;
      v27 = v11;
      -[HKQuery queue_dispatchToClientForUUID:shouldDeactivate:block:](self, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v9, v25, v26);

    }
  }

}

HKStatistics *__87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HKStatistics *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[HKStatistics initWithDataType:startDate:endDate:]([HKStatistics alloc], "initWithDataType:startDate:endDate:", *(_QWORD *)(a1 + 32), v6, v5);

  return v7;
}

uint64_t __87__HKStatisticsCollectionQuery__queue_deliverInitialStatisticsObjects_anchor_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)_queue_deliverResetStatisticsObjects:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HKStatisticsCollection *v10;
  _QWORD v11[5];
  HKStatisticsCollection *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = _Block_copy(self->_statisticsUpdateHandler);
  v10 = self->_statisticsCollection;
  -[HKStatisticsCollection _resetStatistics:](v10, "_resetStatistics:", v7);

  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__HKStatisticsCollectionQuery__queue_deliverResetStatisticsObjects_forQuery___block_invoke;
    v11[3] = &unk_1E37E6710;
    v13 = v9;
    v11[4] = self;
    v12 = v10;
    -[HKQuery queue_dispatchToClientForUUID:shouldDeactivate:block:](self, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 0, v11);

  }
}

uint64_t __77__HKStatisticsCollectionQuery__queue_deliverResetStatisticsObjects_forQuery___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5], 0);
}

- (void)_queue_deliverStatisticsObjects:(id)a3 forQuery:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  HKStatisticsCollection *v15;
  id v16;
  _QWORD v17[6];
  HKStatisticsCollection *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = a4;
  -[HKQuery queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[HKStatisticsCollection _insertStatistics:](self->_statisticsCollection, "_insertStatistics:", v13))
        {
          v14 = _Block_copy(self->_statisticsUpdateHandler);
          v15 = self->_statisticsCollection;
          if (v14)
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __72__HKStatisticsCollectionQuery__queue_deliverStatisticsObjects_forQuery___block_invoke;
            v17[3] = &unk_1E37F3128;
            v19 = v14;
            v17[4] = self;
            v17[5] = v13;
            v18 = v15;
            -[HKQuery queue_dispatchToClientForUUID:shouldDeactivate:block:](self, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v16, 0, v17);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

uint64_t __72__HKStatisticsCollectionQuery__queue_deliverStatisticsObjects_forQuery___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (BOOL)_predicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "subpredicates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          v8 |= -[HKStatisticsCollectionQuery _predicateContainsStrictStartOrEndDateComparisonPredicate:](self, "_predicateContainsStrictStartOrEndDateComparisonPredicate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    objc_opt_class();
    LOBYTE(v8) = (objc_opt_isKindOfClass() & 1) != 0
              && -[HKStatisticsCollectionQuery _comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:](self, "_comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:", v4);
  }

  return v8 & 1;
}

- (BOOL)_comparisonPredicateContainsStrictStartOrEndDateComparisonPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "leftExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "expressionType") == 3)
  {
    objc_msgSend(v4, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "predicateOperatorType");
    v7 = objc_msgSend(v5, "isEqual:", CFSTR("startDate"));
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v8 = v7;
    else
      v8 = 0;
    v9 = objc_msgSend(v5, "isEqual:", CFSTR("endDate"));
    if (v6 < 2)
      v10 = v9;
    else
      v10 = 0;
    v11 = v8 | v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDate)anchorDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (HKStatisticsOptions)options
{
  return self->_options;
}

- (NSDateComponents)intervalComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 168, 1);
}

- (void)initialResultsHandler
{
  return self->_initialResultsHandler;
}

- (void)statisticsUpdateHandler
{
  return self->_statisticsUpdateHandler;
}

- (NSNumber)lastAnchor
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastAnchor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (HKStatisticsCollection)statisticsCollection
{
  return (HKStatisticsCollection *)objc_getProperty(self, a2, 216, 1);
}

- (void)setStatisticsCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (HKStatisticsCollectionCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (id)unitTest_finishedCachingStatisticsHandler
{
  return self->_unitTest_finishedCachingStatisticsHandler;
}

- (void)setUnitTest_finishedCachingStatisticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_finishedCachingStatisticsHandler, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_statisticsCollection, 0);
  objc_storeStrong((id *)&self->_lastAnchor, 0);
  objc_storeStrong(&self->_statisticsUpdateHandler, 0);
  objc_storeStrong(&self->_initialResultsHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
