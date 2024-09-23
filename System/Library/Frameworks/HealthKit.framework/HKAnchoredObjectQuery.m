@implementation HKAnchoredObjectQuery

- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(NSUInteger)anchor limit:(NSUInteger)limit completionHandler:(void *)handler
{
  NSPredicate *v12;
  HKSampleType *v13;
  void *v14;
  void *v15;
  id v16;
  HKAnchoredObjectQuery *v17;
  _QWORD v19[4];
  id v20;

  v12 = predicate;
  v13 = type;
  v14 = (void *)objc_msgSend(handler, "copy");
  +[HKQueryAnchor anchorFromValue:](HKQueryAnchor, "anchorFromValue:", anchor);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__HKAnchoredObjectQuery_initWithType_predicate_anchor_limit_completionHandler___block_invoke;
  v19[3] = &unk_1E37EE138;
  v20 = v14;
  v16 = v14;
  v17 = -[HKAnchoredObjectQuery initWithType:predicate:anchor:limit:resultsHandler:](self, "initWithType:predicate:anchor:limit:resultsHandler:", v13, v12, v15, limit, v19);

  if (v17)
    atomic_store(0, (unsigned __int8 *)&v17->_includeDeletedObjects);

  return v17;
}

void __79__HKAnchoredObjectQuery_initWithType_predicate_anchor_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = a6;
    v11 = a3;
    v12 = a2;
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v6 + 16))(v6, v12, v11, objc_msgSend(a5, "_rowid"), v10);

  }
}

- (HKAnchoredObjectQuery)initWithType:(HKSampleType *)type predicate:(NSPredicate *)predicate anchor:(HKQueryAnchor *)anchor limit:(NSUInteger)limit resultsHandler:(void *)handler
{
  void *v12;
  HKQueryAnchor *v13;
  NSPredicate *v14;
  HKSampleType *v15;
  HKQueryDescriptor *v16;
  void *v17;
  HKAnchoredObjectQuery *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = handler;
  v13 = anchor;
  v14 = predicate;
  v15 = type;
  v16 = -[HKQueryDescriptor initWithSampleType:predicate:]([HKQueryDescriptor alloc], "initWithSampleType:predicate:", v15, v14);

  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKAnchoredObjectQuery initWithQueryDescriptors:anchor:limit:resultsHandler:](self, "initWithQueryDescriptors:anchor:limit:resultsHandler:", v17, v13, limit, v12);

  return v18;
}

- (HKAnchoredObjectQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors anchor:(HKQueryAnchor *)anchor limit:(NSInteger)limit resultsHandler:(void *)handler
{
  HKQueryAnchor *v11;
  void *v12;
  HKAnchoredObjectQuery *v13;
  HKAnchoredObjectQuery *v14;
  uint64_t v15;
  id completionHandler;
  HKQueryAnchor *currentAnchor;
  objc_super v19;

  v11 = anchor;
  v12 = handler;
  v19.receiver = self;
  v19.super_class = (Class)HKAnchoredObjectQuery;
  v13 = -[HKQuery initWithQueryDescriptors:](&v19, sel_initWithQueryDescriptors_, queryDescriptors);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_anchor, anchor);
    v14->_limit = limit;
    v15 = objc_msgSend(v12, "copy");
    completionHandler = v14->_completionHandler;
    v14->_completionHandler = (id)v15;

    v14->_initialHandlerCalled = 0;
    currentAnchor = v14->_currentAnchor;
    v14->_currentAnchor = 0;

    atomic_store(1u, (unsigned __int8 *)&v14->_includeDeletedObjects);
  }

  return v14;
}

- (void)setUpdateHandler:(void *)updateHandler
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v5 = updateHandler;
  if (self->_limit)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_opt_class();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@: %@ not callable when query has a limit"), v8, v9);

  }
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HKAnchoredObjectQuery_setUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_sync(v10, block);

}

void __42__HKAnchoredObjectQuery_setUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

- (void)setIgnoreDeletedObjects:(BOOL)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  atomic_store(!a3, (unsigned __int8 *)&self->_includeDeletedObjects);
}

- (BOOL)ignoreDeletedObjects
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_includeDeletedObjects);
  return (v2 & 1) == 0;
}

- (void)client_deliverSampleObjects:(id)a3 deletedObjects:(id)a4 anchor:(id)a5 clearPendingSamples:(BOOL)a6 deliverResults:(BOOL)a7 query:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  -[HKQuery queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke;
  v23[3] = &unk_1E37EE188;
  v28 = a6;
  v23[4] = self;
  v24 = v14;
  v29 = a7;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(v18, v23);

}

void __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char v42;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 168);
    *(_QWORD *)(v2 + 168) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = 0;

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v6)
  {
    objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 160);
    *(_QWORD *)(v8 + 160) = v7;

  }
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (v10)
  {
    objc_msgSend(v10, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 168);
    *(_QWORD *)(v12 + 168) = v11;

  }
  if (*(_BYTE *)(a1 + 73))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 184);
    if (v15)
    {
      if (objc_msgSend(v15, "compare:", *(_QWORD *)(a1 + 56)) != -1)
        return;
      v14 = *(_QWORD *)(a1 + 32);
    }
    v16 = *(unsigned __int8 *)(v14 + 152);
    v17 = _Block_copy(*(const void **)(v14 + 216));
    v18 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 200));
    if (*(_BYTE *)(a1 + 73))
    {
      v19 = *(_QWORD *)(a1 + 32);
      if (v16)
        v20 = 200;
      else
        v20 = 216;
      if (*(_QWORD *)(v19 + v20))
      {
        v21 = *(id *)(v19 + 160);
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 160);
        *(_QWORD *)(v22 + 160) = 0;

        v24 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 168);
        *(_QWORD *)(v25 + 168) = 0;

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
        v27 = objc_msgSend(*(id *)(a1 + 56), "copy");
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(v28 + 184);
        *(_QWORD *)(v28 + 184) = v27;

        v30 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
        v31 = *(void **)(a1 + 32);
        v32 = *(_QWORD *)(a1 + 64);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke_2;
        v36[3] = &unk_1E37EE160;
        v42 = v16;
        v33 = v18;
        v36[4] = *(_QWORD *)(a1 + 32);
        v37 = v21;
        v40 = v33;
        v38 = v24;
        v39 = *(id *)(a1 + 56);
        v41 = v17;
        v34 = v24;
        v35 = v21;
        objc_msgSend(v31, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v32, v30, v36);

      }
    }

  }
}

uint64_t __116__HKAnchoredObjectQuery_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = 64;
  if (!*(_BYTE *)(a1 + 80))
    v1 = 72;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + v1) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C4820;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKAnchoredObjectQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query_, 0, 0);
  v6 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_deletedObjects_anchor_clearPendingSamples_deliverResults_query_, 1, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  HKQueryAnchor *currentAnchor;
  unsigned __int8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKAnchoredObjectQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v8, sel_queue_populateConfiguration_, v4);
  currentAnchor = self->_currentAnchor;
  if (!currentAnchor)
    currentAnchor = self->_anchor;
  objc_msgSend(v4, "setAnchor:", currentAnchor, v8.receiver, v8.super_class);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setCollectionInterval:", self->_collectionInterval);
  v6 = atomic_load((unsigned __int8 *)&self->_includeDeletedObjects);
  objc_msgSend(v4, "setIncludeDeletedObjects:", v6 & 1);
  objc_msgSend(v4, "setIncludeAutomaticTimeZones:", self->_includeAutomaticTimeZones);
  objc_msgSend(v4, "setIncludeContributorInformation:", self->_includeContributorInformation);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryDescriptors:", v7);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  id updateHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKAnchoredObjectQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

  self->_initialHandlerCalled = 0;
}

- (void)queue_validate
{
  void *v3;
  uint64_t v4;
  id v5;
  HKAnchoredObjectQuery *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HKAnchoredObjectQuery;
  -[HKQuery queue_validate](&v26, sel_queue_validate);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self;
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "sampleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
        objc_msgSend(v11, "sampleType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v15 = (void *)MEMORY[0x1E0C99DA0];
          v16 = objc_opt_class();
          objc_msgSend(v15, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be of class %@"), v16, objc_opt_class());
        }
        objc_msgSend(v11, "sampleType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v18 = objc_msgSend(v5, "count");
  -[HKQuery queryDescriptors](v6, "queryDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v18 != v20)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ cannot provide the same sample type in more than one HKQueryDescriptor"), objc_opt_class());
  if (!v6->_completionHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
  if (v6->_updateHandler && v6->_includeAutomaticTimeZones)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@.includeAutomaticTimeZones is incompatible with a non-nil updateHandler"), objc_opt_class());

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HKAnchoredObjectQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __44__HKAnchoredObjectQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
}

- (void)updateHandler
{
  return self->_updateHandler;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (BOOL)includeAutomaticTimeZones
{
  return self->_includeAutomaticTimeZones;
}

- (void)setIncludeAutomaticTimeZones:(BOOL)a3
{
  self->_includeAutomaticTimeZones = a3;
}

- (BOOL)includeContributorInformation
{
  return self->_includeContributorInformation;
}

- (void)setIncludeContributorInformation:(BOOL)a3
{
  self->_includeContributorInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_currentAnchor, 0);
  objc_storeStrong((id *)&self->_deletedObjectsPendingDelivery, 0);
  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);
}

@end
