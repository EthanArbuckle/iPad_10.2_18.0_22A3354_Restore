@implementation HKSampleQuery

- (HKSampleQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate limit:(NSUInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler
{
  void *v12;
  NSArray *v13;
  NSPredicate *v14;
  HKSampleType *v15;
  HKQueryDescriptor *v16;
  void *v17;
  HKSampleQuery *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = resultsHandler;
  v13 = sortDescriptors;
  v14 = predicate;
  v15 = sampleType;
  v16 = -[HKQueryDescriptor initWithSampleType:predicate:]([HKQueryDescriptor alloc], "initWithSampleType:predicate:", v15, v14);

  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKSampleQuery initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:](self, "initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:", v17, limit, v13, v12);

  return v18;
}

- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit resultsHandler:(void *)resultsHandler
{
  return -[HKSampleQuery initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:](self, "initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:", queryDescriptors, limit, MEMORY[0x1E0C9AA60], resultsHandler);
}

- (HKSampleQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors limit:(NSInteger)limit sortDescriptors:(NSArray *)sortDescriptors resultsHandler:(void *)resultsHandler
{
  NSArray *v10;
  void *v11;
  HKSampleQuery *v12;
  uint64_t v13;
  NSArray *v14;
  void *v15;
  id resultHandler;
  objc_super v18;

  v10 = sortDescriptors;
  v11 = resultsHandler;
  v18.receiver = self;
  v18.super_class = (Class)HKSampleQuery;
  v12 = -[HKQuery initWithQueryDescriptors:](&v18, sel_initWithQueryDescriptors_, queryDescriptors);
  if (v12)
  {
    v13 = -[NSArray copy](v10, "copy");
    v14 = v12->_sortDescriptors;
    v12->_sortDescriptors = (NSArray *)v13;

    v12->_limit = limit;
    v15 = _Block_copy(v11);
    resultHandler = v12->_resultHandler;
    v12->_resultHandler = v15;

    v12->_includeAutomaticTimeZones = 0;
  }

  return v12;
}

- (NSUInteger)limit
{
  return self->_limit;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)_prepareSamplesForDelivery:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "prepareForDelivery:", a4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)client_deliverSamples:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HKQuery queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E37EA5D0;
  v15[4] = self;
  v16 = v11;
  v17 = v10;
  v18 = a4;
  v19 = a5;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 192));
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "hasQueryUUID:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 48);
      v30 = 0;
      v5 = objc_msgSend(v3, "_prepareSamplesForDelivery:error:", v4, &v30);
      v6 = v30;
      v7 = *(_QWORD **)(a1 + 32);
      if ((v5 & 1) != 0)
      {
        v8 = (void *)v7[22];
        if (v8 && !*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(v8, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
        }
        else
        {
          v9 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(v10 + 176);
          *(_QWORD *)(v10 + 176) = v9;

        }
        if (!*(_BYTE *)(a1 + 57))
          goto LABEL_14;
        v19 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 176);
        *(_QWORD *)(v20 + 176) = 0;

        v22 = *(void **)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2;
        v24[3] = &unk_1E37E6710;
        v25 = v19;
        v26 = v2;
        v24[4] = *(_QWORD *)(a1 + 32);
        v18 = v19;
        objc_msgSend(v22, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v23, 1, v24);

      }
      else
      {
        v15 = *(_QWORD *)(a1 + 40);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_4;
        v27[3] = &unk_1E37E6710;
        v16 = v2;
        v17 = *(_QWORD *)(a1 + 32);
        v29 = v16;
        v27[4] = v17;
        v28 = v6;
        objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v15, 1, v27);

        v18 = v29;
      }

LABEL_14:
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v12 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Not delivering samples, invalid query UUID %{public}@", buf, 0x16u);
    }
  }
LABEL_15:

}

uint64_t __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __82__HKSampleQuery_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSampleQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v6, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors, v6.receiver, v6.super_class);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setIncludeAutomaticTimeZones:", self->_includeAutomaticTimeZones);
  objc_msgSend(v4, "setIncludeContributorInformation:", self->_includeContributorInformation);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryDescriptors:", v5);

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
  v5 = _Block_copy(self->_resultHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__HKSampleQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __36__HKSampleQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  void *v3;
  uint64_t v4;
  id v5;
  HKSampleQuery *v6;
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
  v26.super_class = (Class)HKSampleQuery;
  -[HKQuery queue_validate](&v26, sel_queue_validate);
  if (!self->_resultHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ resultsHandler cannot be nil"), objc_opt_class());
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

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSampleQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultHandler = self->_resultHandler;
  self->_resultHandler = 0;

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B8BF0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSampleQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSamples_clearPendingSamples_isFinalBatch_queryUUID_, 0, 0);

}

+ (id)sortDescriptorsForMostRecentSamples
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("HKObjectSortIdentifierDataID"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resultHandler
{
  return self->_resultHandler;
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
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_samplesPendingDelivery, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
