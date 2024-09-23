@implementation ACHCurrentActivitySummaryQuery

- (ACHCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  void *v5;
  ACHCurrentActivitySummaryQuery *v6;
  uint64_t v7;
  id updateHandler;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD3DC0], "activitySummaryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)ACHCurrentActivitySummaryQuery;
  v6 = -[HKQuery _initWithObjectType:predicate:](&v10, sel__initWithObjectType_predicate_, v5, 0);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    updateHandler = v6->_updateHandler;
    v6->_updateHandler = (id)v7;

  }
  return v6;
}

- (void)client_deliverTodaySummary:(id)a3 changedTodayFields:(unint64_t)a4 yesterdaySummary:(id)a5 changedYesterdayFields:(unint64_t)a6 queryUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  -[HKQuery queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke;
  v19[3] = &unk_24D1268C8;
  v19[4] = self;
  v20 = v14;
  v21 = v12;
  v22 = v13;
  v23 = a4;
  v24 = a6;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  dispatch_async(v15, v19);

}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;

  v2 = (void *)MEMORY[0x2199C8598](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2;
    v7[3] = &unk_24D1268A0;
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v12 = *(_OWORD *)(a1 + 64);
    v5 = v2;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    objc_msgSend(v3, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v4, 0, v7);

    v6 = v8;
  }
  else
  {
    ACHLogXPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_cold_1();
  }

}

uint64_t __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_254D64A40;
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHCurrentActivitySummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v6, sel_queue_populateConfiguration_, v4);
  -[ACHCurrentActivitySummaryQuery collectionIntervals](self, "collectionIntervals", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionIntervals:", v5);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACHCurrentActivitySummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACHCurrentActivitySummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD44A0], CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
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
  v5 = (void *)MEMORY[0x2199C8598](self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ACHCurrentActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_24D1268F0;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __53__ACHCurrentActivitySummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, 0, 0, a1[5]);
}

- (void)_setCollectionIntervals:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", sel__setCollectionIntervals_);
  v5 = (id)objc_msgSend(v4, "copy");

  -[ACHCurrentActivitySummaryQuery setCollectionIntervals:](self, "setCollectionIntervals:", v5);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)collectionIntervals
{
  return self->_collectionIntervals;
}

- (void)setCollectionIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIntervals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214029000, v0, v1, "No update handler set! Today: %@; yesterday: %@", v2, v3, v4, v5, v6);
}

void __130__ACHCurrentActivitySummaryQuery_client_deliverTodaySummary_changedTodayFields_yesterdaySummary_changedYesterdayFields_queryUUID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214029000, v0, v1, "Calling update handler with today: %@; yesterday: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end
