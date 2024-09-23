@implementation HKObserverQuery

- (HKObserverQuery)initWithSampleType:(HKSampleType *)sampleType predicate:(NSPredicate *)predicate updateHandler:(void *)updateHandler
{
  void *v8;
  NSPredicate *v9;
  HKSampleType *v10;
  HKQueryDescriptor *v11;
  void *v12;
  id v13;
  HKObserverQuery *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = updateHandler;
  v9 = predicate;
  v10 = sampleType;
  v11 = -[HKQueryDescriptor initWithSampleType:predicate:]([HKQueryDescriptor alloc], "initWithSampleType:predicate:", v10, v9);

  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__HKObserverQuery_initWithSampleType_predicate_updateHandler___block_invoke;
  v16[3] = &unk_1E37EBE80;
  v17 = v8;
  v13 = v8;
  v14 = -[HKObserverQuery initWithQueryDescriptors:updateHandler:](self, "initWithQueryDescriptors:updateHandler:", v12, v16);

  return v14;
}

void __62__HKObserverQuery_initWithSampleType_predicate_updateHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  v10 = a4;
  _HKInitializeLogging();
  v11 = HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "Returning back the update handler after success for query %{public}@", (uint8_t *)&v12, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKObserverQuery)initWithQueryDescriptors:(NSArray *)queryDescriptors updateHandler:(void *)updateHandler
{
  void *v6;
  NSArray *v7;
  HKObserverQuery *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v6 = updateHandler;
  v7 = queryDescriptors;
  -[HKObserverQuery _validateAndRaiseExceptionIfNeeded:](self, "_validateAndRaiseExceptionIfNeeded:", v7);
  v12.receiver = self;
  v12.super_class = (Class)HKObserverQuery;
  v8 = -[HKQuery initWithQueryDescriptors:](&v12, sel_initWithQueryDescriptors_, v7);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = v8->_updateHandler;
    v8->_updateHandler = (id)v9;

  }
  return v8;
}

- (void)client_dataUpdatedInDatabaseForTypes:(id)a3 withAnchor:(id)a4 query:(id)a5
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
  v15[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke;
  v15[3] = &unk_1E37EBEA8;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  if (v2)
  {
    _HKInitializeLogging();
    v3 = HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "client dataUpdatedInDatabase was fired for query UUID %{public}@", buf, 0xCu);
    }
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_5;
    v9[3] = &unk_1E37EBED0;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v13 = v8;
    v14 = v2;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 0, v9);

  }
}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_2;
  v5[3] = &unk_1E37EBEA8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8 = v2;
  v9 = v3;
  v4 = _Block_copy(v5);
  (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v4);

}

void __73__HKObserverQuery_client_dataUpdatedInDatabaseForTypes_withAnchor_query___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = HKLogBackgroundUpdates;
    if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v3 = *(_QWORD *)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v4;
      v10 = 2114;
      v11 = v3;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "client called completionHandler for query UUID %{public}@, forTypes: %{public}@, anchor: %{public}@", (uint8_t *)&v8, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", time(0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "closeTransactionForTypes:anchor:ackTime:query:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 56));

  }
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
  v6.super_class = (Class)HKObserverQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v6, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setObserveUnfrozenSeries:", self->_observeUnfrozenSeries, v6.receiver, v6.super_class);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryDescriptors:", v5);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3BB7D8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKObserverQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_dataUpdatedInDatabaseForTypes_withAnchor_query_, 0, 0);
  v6 = (id)objc_msgSend(v4, "hk_setSetOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_dataUpdatedInDatabaseForTypes_withAnchor_query_, 1, 0);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKObserverQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)HKObserverQuery;
  -[HKQuery queue_validate](&v20, sel_queue_validate);
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HKQuery queryDescriptors](self, "queryDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "sampleType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
        objc_msgSend(v10, "sampleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = objc_opt_class();
          objc_msgSend(v14, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be of class %@"), v15, objc_opt_class());
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_updateHandler == 0;
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
  v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HKObserverQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __38__HKObserverQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, &__block_literal_global_27, a1[5]);
}

- (void)_validateAndRaiseExceptionIfNeeded:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_77))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = objc_opt_class();
    +[HKObjectType visionPrescriptionType](HKPrescriptionType, "visionPrescriptionType");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ Cannot initialize Observer Query with unsupported type %@."), v4, v5);

  }
}

uint64_t __54__HKObserverQuery__validateAndRaiseExceptionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType visionPrescriptionType](HKPrescriptionType, "visionPrescriptionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)observeUnfrozenSeries
{
  return self->_observeUnfrozenSeries;
}

- (void)setObserveUnfrozenSeries:(BOOL)a3
{
  self->_observeUnfrozenSeries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
