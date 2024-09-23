@implementation HKHeartRateSummaryQuery

- (HKHeartRateSummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  HKHeartRateSummaryQuery *v5;
  uint64_t v6;
  id updateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRateSummaryQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updateHandler = v5->_updateHandler;
    v5->_updateHandler = (id)v6;

  }
  return v5;
}

- (void)client_deliverSummary:(id)a3 queryUUID:(id)a4
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
  block[2] = __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2;
    v6[3] = &unk_1E37E8738;
    v6[4] = v4;
    v8 = v2;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v6);

  }
}

uint64_t __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)HKLogHeartRate;
  if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_DEBUG))
    __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2_cold_1(a1, v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3AE738;
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
    block[2] = __46__HKHeartRateSummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __46__HKHeartRateSummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHeartRateSummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

void __59__HKHeartRateSummaryQuery_client_deliverSummary_queryUUID___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  const void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(const void **)(a1 + 48);
  v6 = v4;
  v7 = _Block_copy(v5);
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEBUG, "%@ calling update handler: %@", (uint8_t *)&v8, 0x16u);

}

@end
