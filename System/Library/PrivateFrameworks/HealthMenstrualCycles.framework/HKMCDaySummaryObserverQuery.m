@implementation HKMCDaySummaryObserverQuery

- (HKMCDaySummaryObserverQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  HKMCDaySummaryObserverQuery *v5;
  uint64_t v6;
  id updateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCDaySummaryObserverQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updateHandler = v5->_updateHandler;
    v5->_updateHandler = (id)v6;

  }
  return v5;
}

+ (id)clientInterfaceProtocol
{
  return &unk_255006E28;
}

- (void)client_deliverUpdateWithQueryUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKQuery queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke;
  v7[3] = &unk_24D99D8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)MEMORY[0x219A1F070](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  v3 = v2;
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke_2;
    v6[3] = &unk_24D99D8C0;
    v6[4] = v5;
    v7 = v2;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v6);

  }
}

uint64_t __65__HKMCDaySummaryObserverQuery_client_deliverUpdateWithQueryUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_218A9C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering update", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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
    block[2] = __50__HKMCDaySummaryObserverQuery_queue_deliverError___block_invoke;
    block[3] = &unk_24D99D910;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __50__HKMCDaySummaryObserverQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMCDaySummaryObserverQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
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

@end
