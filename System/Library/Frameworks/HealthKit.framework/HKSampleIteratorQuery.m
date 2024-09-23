@implementation HKSampleIteratorQuery

- (HKSampleIteratorQuery)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSampleIteratorQuery)initWithQueryDescriptors:(id)a3 sortDescriptors:(id)a4 followingAnchor:(id)a5 upToAndIncludingAnchor:(id)a6 distinctByKeyPaths:(id)a7 limit:(unint64_t)a8 resultsHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HKSampleIteratorQueryCursor *v23;
  HKSampleIteratorQuery *v24;
  void *v26;
  void *v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = v21;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleIteratorQuery.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryDescriptors"));

    if (v22)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleIteratorQuery.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"));

    goto LABEL_3;
  }
  if (!v21)
    goto LABEL_5;
LABEL_3:
  v23 = -[HKSampleIteratorQueryCursor initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:]([HKSampleIteratorQueryCursor alloc], "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", v16, v17, v18, v19, v20, 0);
  v24 = -[HKSampleIteratorQuery initWithQueryCursor:limit:resultsHandler:](self, "initWithQueryCursor:limit:resultsHandler:", v23, a8, v22);

  return v24;
}

- (HKSampleIteratorQuery)initWithQueryCursor:(id)a3 limit:(unint64_t)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HKSampleIteratorQuery *v12;
  uint64_t v13;
  HKSampleIteratorQueryCursor *queryCursor;
  uint64_t v15;
  id resultsHandler;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleIteratorQuery.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryCursor"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleIteratorQuery.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)HKSampleIteratorQuery;
  v12 = -[HKQuery _initWithObjectType:predicate:](&v20, sel__initWithObjectType_predicate_, 0, 0);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    queryCursor = v12->_queryCursor;
    v12->_queryCursor = (HKSampleIteratorQueryCursor *)v13;

    v12->_limit = a4;
    v15 = objc_msgSend(v11, "copy");
    resultsHandler = v12->_resultsHandler;
    v12->_resultsHandler = (id)v15;

  }
  return v12;
}

- (void)client_deliverSampleObjects:(id)a3 queryCursor:(id)a4 deliverResults:(BOOL)a5 query:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HKQuery queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke;
  block[3] = &unk_1E37EC130;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v12;
  v20 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_sync(v13, block);

}

void __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (v3)
  {
    objc_msgSend(v3, "addObjectsFromArray:", v2);
  }
  else
  {
    v4 = objc_msgSend(v2, "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v4;

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 176));
    if (*(_BYTE *)(a1 + 64))
    {
      v8 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 152);
      *(_QWORD *)(v9 + 152) = 0;

      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 48);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke_2;
      v14[3] = &unk_1E37F3128;
      v17 = v7;
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v8;
      v16 = *(id *)(a1 + 56);
      v13 = v8;
      objc_msgSend(v11, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v12, 1, v14);

    }
  }
}

uint64_t __86__HKSampleIteratorQuery_client_deliverSampleObjects_queryCursor_deliverResults_query___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3E1B88;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSampleIteratorQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleObjects_queryCursor_deliverResults_query_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSampleIteratorQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setQueryCursor:", self->_queryCursor, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setLimit:", self->_limit);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSampleIteratorQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void)queue_validate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HKSampleIteratorQuery;
  -[HKQuery queue_validate](&v18, sel_queue_validate);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKSampleIteratorQueryCursor queryDescriptors](self->_queryCursor, "queryDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "sampleType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
        objc_msgSend(v8, "sampleType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1E0C99DA0];
          v13 = objc_opt_class();
          objc_msgSend(v12, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be of class %@"), v13, objc_opt_class());
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v5);
  }

  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ completionHandler cannot be nil"), objc_opt_class());
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
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HKSampleIteratorQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __44__HKSampleIteratorQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

- (HKSampleIteratorQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (void)setQueryCursor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_queryCursor, 0);
  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);
}

@end
