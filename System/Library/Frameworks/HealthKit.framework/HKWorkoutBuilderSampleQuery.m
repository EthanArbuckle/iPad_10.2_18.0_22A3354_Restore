@implementation HKWorkoutBuilderSampleQuery

- (HKWorkoutBuilderSampleQuery)initWithSampleType:(id)a3 workoutBuilder:(id)a4 samplesAddedHandler:(id)a5
{
  id v8;
  id v9;
  HKWorkoutBuilderSampleQuery *v10;
  uint64_t v11;
  id samplesAddedHandler;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutBuilderSampleQuery;
  v10 = -[HKQuery _initWithObjectType:predicate:](&v14, sel__initWithObjectType_predicate_, a3, 0);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    samplesAddedHandler = v10->_samplesAddedHandler;
    v10->_samplesAddedHandler = (id)v11;

    v10->_needsHistoricalFetch = 1;
    objc_storeWeak((id *)&v10->_workoutBuilder, v8);
  }

  return v10;
}

- (HKWorkoutBuilderSampleQuery)initWithQuantityType:(id)a3 workoutBuilder:(id)a4 quantitiesAddedHandler:(id)a5
{
  id v8;
  id v9;
  HKWorkoutBuilderSampleQuery *v10;
  uint64_t v11;
  id quantitiesAddedHandler;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutBuilderSampleQuery;
  v10 = -[HKQuery _initWithObjectType:predicate:](&v14, sel__initWithObjectType_predicate_, a3, 0);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    quantitiesAddedHandler = v10->_quantitiesAddedHandler;
    v10->_quantitiesAddedHandler = (id)v11;

    v10->_needsHistoricalFetch = 1;
    objc_storeWeak((id *)&v10->_workoutBuilder, v8);
  }

  return v10;
}

- (void)client_deliverSamples:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke;
  block[3] = &unk_1E37E8708;
  v16 = a4;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

}

void __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if (*(_BYTE *)(a1 + 56))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);

  }
}

uint64_t __90__HKWorkoutBuilderSampleQuery_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)client_deliverQuantities:(id)a3 hasFinishedHistoricalFetch:(BOOL)a4 queryUUID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HKQuery queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke;
  block[3] = &unk_1E37E8708;
  v16 = a4;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

}

void __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if (*(_BYTE *)(a1 + 56))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 160));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke_2;
    v8[3] = &unk_1E37E6710;
    v6 = v2;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);

  }
}

uint64_t __93__HKWorkoutBuilderSampleQuery_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C64F8;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HKWorkoutBuilderSampleQuery;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSamples_hasFinishedHistoricalFetch_queryUUID_, 0, 0);
  v6 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverQuantities_hasFinishedHistoricalFetch_queryUUID_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutBuilderSampleQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v7, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setNeedsHistoricalData:", self->_needsHistoricalFetch, v7.receiver, v7.super_class);
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutBuilder);
  objc_msgSend(WeakRetained, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWorkoutBuilderIdentifier:", v6);

  objc_msgSend(v4, "setDeliverQuantities:", self->_quantitiesAddedHandler != 0);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id samplesAddedHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutBuilderSampleQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  objc_storeWeak((id *)&self->_workoutBuilder, 0);
  samplesAddedHandler = self->_samplesAddedHandler;
  self->_samplesAddedHandler = 0;

}

- (void)queue_validate
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutBuilderSampleQuery;
  -[HKQuery queue_validate](&v8, sel_queue_validate);
  -[HKQuery objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be non-nil"), objc_opt_class());
  -[HKQuery objectType](self, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = objc_opt_class();
    objc_msgSend(v6, "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ data type must be of class %@"), v7, objc_opt_class());
  }
  if (!self->_samplesAddedHandler && !self->_quantitiesAddedHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ either samplesAddedHandler or quantitiesAddedHandler must be non-nil"), objc_opt_class());
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
  v5 = _Block_copy(self->_samplesAddedHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HKWorkoutBuilderSampleQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __50__HKWorkoutBuilderSampleQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (HKWorkoutBuilder)workoutBuilder
{
  return (HKWorkoutBuilder *)objc_loadWeakRetained((id *)&self->_workoutBuilder);
}

- (void)setWorkoutBuilder:(id)a3
{
  objc_storeWeak((id *)&self->_workoutBuilder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutBuilder);
  objc_storeStrong(&self->_quantitiesAddedHandler, 0);
  objc_storeStrong(&self->_samplesAddedHandler, 0);
}

@end
