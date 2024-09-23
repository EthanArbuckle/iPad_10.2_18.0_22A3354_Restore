@implementation HKHRAFibBurdenHistogramQuery

- (HKHRAFibBurdenHistogramQuery)initWithResultsHandler:(id)a3
{
  id v4;
  void *v5;
  HKHRAFibBurdenHistogramQuery *v6;
  uint64_t v7;
  id resultsHandler;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HKHRAFibBurdenHistogramQuery;
  v6 = -[HKQuery _initWithObjectType:predicate:](&v10, sel__initWithObjectType_predicate_, v5, 0);

  if (v6)
  {
    v7 = MEMORY[0x1D829ADFC](v4);
    resultsHandler = v6->_resultsHandler;
    v6->_resultsHandler = (id)v7;

  }
  return v6;
}

- (void)client_deliverHistogramResult:(id)a3 queryUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke;
  block[3] = &unk_1E9C25D78;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1D829ADFC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke_2;
    v5[3] = &unk_1E9C25D50;
    v5[4] = v3;
    v6 = *(id *)(a1 + 48);
    v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 1, v5);

  }
}

uint64_t __72__HKHRAFibBurdenHistogramQuery_client_deliverHistogramResult_queryUUID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    HKSensitiveLogItem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D7781000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Delivering histogram result: %@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1F0138020;
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
  v5 = (void *)MEMORY[0x1D829ADFC](self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HKHRAFibBurdenHistogramQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E9C25DA0;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __51__HKHRAFibBurdenHistogramQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHRAFibBurdenHistogramQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_resultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB73A8], CFSTR("%@ resultsHandler must not be nil"), objc_opt_class());
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;

  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
