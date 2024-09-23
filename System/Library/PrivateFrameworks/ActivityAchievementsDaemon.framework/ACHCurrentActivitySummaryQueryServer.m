@implementation ACHCurrentActivitySummaryQueryServer

- (ACHCurrentActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  ACHCurrentActivitySummaryQueryServer *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *collectionIntervals;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "collectionIntervals");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    collectionIntervals = v11->_collectionIntervals;
    v11->_collectionIntervals = (NSDictionary *)v13;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  ACHCurrentActivitySummaryQueryServer *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[ACHCurrentActivitySummaryQueryServer initWithUUID:configuration:client:delegate:]([ACHCurrentActivitySummaryQueryServer alloc], "initWithUUID:configuration:client:delegate:", v13, v12, v11, v10);

  return v14;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  -[HDQueryServer _queue_start](&v12, sel__queue_start);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataCollectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allKeys](self->_collectionIntervals, "allKeys");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v6, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__ACHCurrentActivitySummaryQueryServer__queue_start__block_invoke;
  v11[3] = &unk_24D13A610;
  v11[4] = self;
  objc_msgSend(v4, "requestAggregationThroughDate:types:mode:options:completion:", v5, v10, 0, 1, v11);

}

void __52__ACHCurrentActivitySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentActivitySummaryHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_stop
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  -[HDQueryServer _queue_stop](&v5, sel__queue_stop);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentActivitySummaryHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_queue_startDataCollection
{
  void *v3;
  void *v4;
  NSDictionary *collectionIntervals;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  ACHCurrentActivitySummaryQueryServer *v16;

  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataCollectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  collectionIntervals = self->_collectionIntervals;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__ACHCurrentActivitySummaryQueryServer__queue_startDataCollection__block_invoke;
  v14[3] = &unk_24D13BCF8;
  v15 = v4;
  v16 = self;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](collectionIntervals, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allKeys](self->_collectionIntervals, "allKeys");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestAggregationThroughDate:types:mode:options:completion:", v7, v12, 1, 1, &__block_literal_global_15);

  v13.receiver = self;
  v13.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  -[HDQueryServer _queue_startDataCollection](&v13, sel__queue_startDataCollection);

}

void __66__ACHCurrentActivitySummaryQueryServer__queue_startDataCollection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "startDataCollectionForType:observer:collectionInterval:", v6, v5);

}

- (void)_queue_stopDataCollection
{
  void *v3;
  void *v4;
  NSDictionary *collectionIntervals;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHCurrentActivitySummaryQueryServer *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACHCurrentActivitySummaryQueryServer;
  -[HDQueryServer _queue_stopDataCollection](&v10, sel__queue_stopDataCollection);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataCollectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  collectionIntervals = self->_collectionIntervals;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__ACHCurrentActivitySummaryQueryServer__queue_stopDataCollection__block_invoke;
  v7[3] = &unk_24D13BCF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](collectionIntervals, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __65__ACHCurrentActivitySummaryQueryServer__queue_stopDataCollection__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopDataCollectionForType:observer:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HKActivitySummary *v11;
  NSObject *p_super;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[HDQueryServer clientProxy](self, "clientProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((-[HKActivitySummary _allFieldsAreEqual:](self->_lastTodaySummary, "_allFieldsAreEqual:", v7) & 1) == 0)
    {
      ACHLogXPC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:].cold.2();

      -[HDQueryServer queryUUID](self, "queryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client_deliverTodaySummary:changedTodayFields:yesterdaySummary:changedYesterdayFields:queryUUID:", v7, a5, 0, 0, v10);

      v11 = (HKActivitySummary *)objc_msgSend(v7, "copy");
      p_super = &self->_lastTodaySummary->super;
      self->_lastTodaySummary = v11;
      goto LABEL_11;
    }
  }
  else
  {
    ACHLogXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:].cold.1();

  }
  ACHLogXPC();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_21407B000, p_super, OS_LOG_TYPE_DEFAULT, "Not calling query client with todayActivitySummary: %@, same as lastTodaySummary.", (uint8_t *)&v14, 0xCu);
  }
LABEL_11:

}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HKActivitySummary *v11;
  NSObject *p_super;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[HDQueryServer clientProxy](self, "clientProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((-[HKActivitySummary _allFieldsAreEqual:](self->_lastYesterdaySummary, "_allFieldsAreEqual:", v7) & 1) == 0)
    {
      ACHLogXPC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:].cold.2();

      -[HDQueryServer queryUUID](self, "queryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "client_deliverTodaySummary:changedTodayFields:yesterdaySummary:changedYesterdayFields:queryUUID:", 0, 0, v7, a5, v10);

      v11 = (HKActivitySummary *)objc_msgSend(v7, "copy");
      p_super = &self->_lastYesterdaySummary->super;
      self->_lastYesterdaySummary = v11;
      goto LABEL_11;
    }
  }
  else
  {
    ACHLogXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACHCurrentActivitySummaryQueryServer currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:].cold.1();

  }
  ACHLogXPC();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_21407B000, p_super, OS_LOG_TYPE_DEFAULT, "Not calling query client with yesterdayActivitySummary: %@, same as lastYesterdaySummary.", (uint8_t *)&v14, 0xCu);
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
  objc_storeStrong((id *)&self->_lastYesterdaySummary, 0);
  objc_storeStrong((id *)&self->_lastTodaySummary, 0);
  objc_storeStrong((id *)&self->_currentSummaryHelper, 0);
}

- (void)currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Missing query client for server %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21407B000, v0, v1, "Calling query client with today summary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4(&dword_21407B000, v0, v1, "Calling query client with yesterday summary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
