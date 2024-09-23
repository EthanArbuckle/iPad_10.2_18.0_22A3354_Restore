@implementation HKMCAnalysisQuery

- (void)client_deliverAnalysis:(id)a3 queryUUID:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke;
  block[3] = &unk_24D99DBD8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

+ (id)clientInterfaceProtocol
{
  return &unk_25501AED0;
}

uint64_t __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_218A9C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering updated analysis: %@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x219A1F070](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__HKMCAnalysisQuery_client_deliverAnalysis_queryUUID___block_invoke_2;
    v5[3] = &unk_24D99DBB0;
    v5[4] = v3;
    v6 = *(id *)(a1 + 48);
    v7 = v2;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v5);

  }
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMCAnalysisQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)HKMCAnalysisQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v11, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setForceAnalysis:", self->_forceAnalysis, v11.receiver, v11.super_class);

  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[HKQuery debugIdentifier](self, "debugIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_forceAnalysis);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_218A9C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Configured with forced analysis: %{public}@", buf, 0x20u);

  }
}

- (HKMCAnalysisQuery)initWithUpdateHandler:(id)a3
{
  return -[HKMCAnalysisQuery initWithForceAnalysis:updateHandler:](self, "initWithForceAnalysis:updateHandler:", 0, a3);
}

- (HKMCAnalysisQuery)initWithForceAnalysis:(BOOL)a3 updateHandler:(id)a4
{
  id v6;
  HKMCAnalysisQuery *v7;
  HKMCAnalysisQuery *v8;
  uint64_t v9;
  id updateHandler;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCAnalysisQuery;
  v7 = -[HKQuery _initWithObjectType:predicate:](&v12, sel__initWithObjectType_predicate_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_forceAnalysis = a3;
    v9 = objc_msgSend(v6, "copy");
    updateHandler = v8->_updateHandler;
    v8->_updateHandler = (id)v9;

  }
  return v8;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
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
  v5 = (void *)MEMORY[0x219A1F070](self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HKMCAnalysisQuery_queue_deliverError___block_invoke;
    block[3] = &unk_24D99D910;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __40__HKMCAnalysisQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (BOOL)forceAnalysis
{
  return self->_forceAnalysis;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
