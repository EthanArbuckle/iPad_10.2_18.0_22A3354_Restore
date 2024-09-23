@implementation HKCorrelationQuery

+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HKCorrelationQuery)initWithType:(HKCorrelationType *)correlationType predicate:(NSPredicate *)predicate samplePredicates:(NSDictionary *)samplePredicates completion:(void *)completion
{
  NSDictionary *v10;
  void *v11;
  HKCorrelationQuery *v12;
  uint64_t v13;
  NSDictionary *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSDictionary *filterDictionary;
  void *v19;
  id completionHandler;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v10 = samplePredicates;
  v11 = completion;
  v24.receiver = self;
  v24.super_class = (Class)HKCorrelationQuery;
  v12 = -[HKQuery _initWithObjectType:predicate:](&v24, sel__initWithObjectType_predicate_, correlationType, predicate);
  if (v12)
  {
    v13 = -[NSDictionary copy](v10, "copy");
    v14 = v12->_samplePredicates;
    v12->_samplePredicates = (NSDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__HKCorrelationQuery_initWithType_predicate_samplePredicates_completion___block_invoke;
    v22[3] = &unk_1E37F5808;
    v23 = v15;
    v16 = v15;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v22);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    filterDictionary = v12->_filterDictionary;
    v12->_filterDictionary = (NSDictionary *)v17;

    v19 = _Block_copy(v11);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = v19;

  }
  return v12;
}

void __73__HKCorrelationQuery_initWithType_predicate_samplePredicates_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_filterRepresentationForDataTypes:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

- (void)client_deliverCorrelations:(id)a3 clearPendingSamples:(BOOL)a4 isFinalBatch:(BOOL)a5 queryUUID:(id)a6
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
  v15[2] = __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke;
  v15[3] = &unk_1E37EA5D0;
  v15[4] = self;
  v16 = v11;
  v18 = a4;
  v17 = v10;
  v19 = a5;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 168));
  if (v2 && objc_msgSend(*(id *)(a1 + 32), "hasQueryUUID:", *(_QWORD *)(a1 + 40)))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    if (v3 && !*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 160);
      *(_QWORD *)(v5 + 160) = v4;

    }
    if (*(_BYTE *)(a1 + 57))
    {
      v7 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 160);
      *(_QWORD *)(v8 + 160) = 0;

      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2;
      v13[3] = &unk_1E37E6710;
      v14 = v7;
      v15 = v2;
      v13[4] = *(_QWORD *)(a1 + 32);
      v12 = v7;
      objc_msgSend(v10, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v11, 1, v13);

    }
  }

}

uint64_t __92__HKCorrelationQuery_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3E29C0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCorrelationQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverCorrelations_clearPendingSamples_isFinalBatch_queryUUID_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCorrelationQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setFilterDictionary:", self->_filterDictionary, v5.receiver, v5.super_class);

}

- (void)queue_validate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKCorrelationQuery;
  -[HKQuery queue_validate](&v8, sel_queue_validate);
  -[HKQuery objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    -[HKQuery objectType](self, "objectType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ is not an instance of %@"), v7, objc_opt_class());

  }
  if (!self->_completionHandler)
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
  v5 = _Block_copy(self->_completionHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__HKCorrelationQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __41__HKCorrelationQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id completionHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCorrelationQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (NSDictionary)samplePredicates
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSDictionary)filterDictionary
{
  return self->_filterDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDictionary, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_correlationsPendingDelivery, 0);
  objc_storeStrong((id *)&self->_samplePredicates, 0);
}

@end
