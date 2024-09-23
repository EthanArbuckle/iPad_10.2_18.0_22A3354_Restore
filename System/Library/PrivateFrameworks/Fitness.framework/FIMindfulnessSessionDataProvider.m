@implementation FIMindfulnessSessionDataProvider

_QWORD *__72__FIMindfulnessSessionDataProvider_startMindfulnessSessionQueryIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[4])
    return (_QWORD *)objc_msgSend(result, "_queue_startMindfulnessSessionQueryWithRetryCount:", 0);
  return result;
}

void __73__FIMindfulnessSessionDataProvider_allMindfulnessSessionsWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[3], "allSamples");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    WeakRetained = v4;
  }

}

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2_cold_1(a1, v3, v2);
    objc_msgSend(*(id *)(a1 + 48), "_queue_retryMindfulSessionQueryWithRetryCount:", *(_QWORD *)(a1 + 72) + 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "hk_mapToSet:", &__block_literal_global_1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeSamplesWithUUIDs:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "insertSamples:", *(_QWORD *)(a1 + 64));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("FIMindfulnessSessionDataProviderDidUpdate"), 0);

  }
}

- (void)allMindfulnessSessionsWithCompletion:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__FIMindfulnessSessionDataProvider_allMindfulnessSessionsWithCompletion___block_invoke;
  block[3] = &unk_24CC4E8A8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (FIMindfulnessSessionDataProvider)initWithHealthStore:(id)a3
{
  id v5;
  FIMindfulnessSessionDataProvider *v6;
  FIMindfulnessSessionDataProvider *v7;
  uint64_t v8;
  OS_dispatch_queue *serialQueue;
  HKSortedSampleArray *v10;
  HKSortedSampleArray *mindfulnessSessions;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FIMindfulnessSessionDataProvider;
  v6 = -[FIMindfulnessSessionDataProvider init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = (HKSortedSampleArray *)objc_alloc_init(MEMORY[0x24BDD3FB8]);
    mindfulnessSessions = v7->_mindfulnessSessions;
    v7->_mindfulnessSessions = v10;

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSortedSampleArray setSortDescriptor:](v7->_mindfulnessSessions, "setSortDescriptor:", v12);

    -[FIMindfulnessSessionDataProvider startMindfulnessSessionQueryIfNeeded](v7, "startMindfulnessSessionQueryIfNeeded");
  }

  return v7;
}

- (void)startMindfulnessSessionQueryIfNeeded
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__FIMindfulnessSessionDataProvider_startMindfulnessSessionQueryIfNeeded__block_invoke;
  block[3] = &unk_24CC4E880;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  NSObject **WeakRetained;
  NSObject **v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  NSObject **v20;
  id v21;
  id v22;
  uint64_t v23;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[2];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2;
    v17[3] = &unk_24CC4E808;
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    v23 = *(_QWORD *)(a1 + 48);
    v20 = v13;
    v21 = v10;
    v22 = v9;
    dispatch_async(v14, v17);

  }
}

- (void)_queue_startMindfulnessSessionQueryWithRetryCount:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  HKAnchoredObjectQuery *v9;
  HKAnchoredObjectQuery *mindfulnessSessionsQuery;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_21168F000, v6, OS_LOG_TYPE_DEFAULT, "%@ starting mindfulness sessions query (retry count: %lu)", (uint8_t *)&v11, 0x16u);

  }
  -[FIMindfulnessSessionDataProvider _createMindfulnessSessionsQueryWithRetryCount:](self, "_createMindfulnessSessionsQueryWithRetryCount:", a3);
  v9 = (HKAnchoredObjectQuery *)objc_claimAutoreleasedReturnValue();
  mindfulnessSessionsQuery = self->_mindfulnessSessionsQuery;
  self->_mindfulnessSessionsQuery = v9;

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_mindfulnessSessionsQuery);
}

- (id)_createMindfulnessSessionsQueryWithRetryCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *, void *, uint64_t, void *);
  void *v13;
  FIMindfulnessSessionDataProvider *v14;
  id v15[2];
  id location;

  objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke;
  v13 = &unk_24CC4E830;
  objc_copyWeak(v15, &location);
  v14 = self;
  v15[1] = (id)a3;
  v6 = _Block_copy(&v10);
  v7 = objc_alloc(MEMORY[0x24BDD3920]);
  v8 = (void *)objc_msgSend(v7, "initWithType:predicate:anchor:limit:resultsHandler:", v5, 0, 0, 0, v6, v10, v11, v12, v13);
  objc_msgSend(v8, "setUpdateHandler:", v6);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_mindfulnessSessionsQuery);
  v3.receiver = self;
  v3.super_class = (Class)FIMindfulnessSessionDataProvider;
  -[FIMindfulnessSessionDataProvider dealloc](&v3, sel_dealloc);
}

uint64_t __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_193(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)_queue_stopMindfulSessionQuery
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  HKAnchoredObjectQuery *mindfulnessSessionsQuery;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21168F000, v4, OS_LOG_TYPE_DEFAULT, "%@ stopping mindfulness sessions query", (uint8_t *)&v8, 0xCu);

  }
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_mindfulnessSessionsQuery);
  mindfulnessSessionsQuery = self->_mindfulnessSessionsQuery;
  self->_mindfulnessSessionsQuery = 0;

  -[HKSortedSampleArray removeAllSamples](self->_mindfulnessSessions, "removeAllSamples");
}

- (void)_queue_retryMindfulSessionQueryWithRetryCount:(int64_t)a3
{
  void *v5;
  dispatch_time_t v6;
  NSObject *serialQueue;
  _QWORD v8[6];

  -[FIMindfulnessSessionDataProvider _queue_stopMindfulSessionQuery](self, "_queue_stopMindfulSessionQuery");
  if ((unint64_t)a3 < 6)
  {
    v6 = dispatch_time(0, 1000000000 * a3);
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__FIMindfulnessSessionDataProvider__queue_retryMindfulSessionQueryWithRetryCount___block_invoke;
    v8[3] = &unk_24CC4E858;
    v8[4] = self;
    v8[5] = a3;
    dispatch_after(v6, serialQueue, v8);
  }
  else
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      -[FIMindfulnessSessionDataProvider _queue_retryMindfulSessionQueryWithRetryCount:].cold.1(v5, (uint64_t)self, a3);
  }
}

uint64_t __82__FIMindfulnessSessionDataProvider__queue_retryMindfulSessionQueryWithRetryCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMindfulnessSessionQueryWithRetryCount:", *(_QWORD *)(a1 + 40));
}

- (id)allMindfulnessSessions
{
  return (id)-[HKSortedSampleArray allSamples](self->_mindfulnessSessions, "allSamples");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mindfulnessSessionsQuery, 0);
  objc_storeStrong((id *)&self->_mindfulnessSessions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __82__FIMindfulnessSessionDataProvider__createMindfulnessSessionsQueryWithRetryCount___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  NSObject *v3;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (objc_class *)OUTLINED_FUNCTION_0_1();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_21168F000, v3, OS_LOG_TYPE_ERROR, "%@ failed to query mindfulness sessions: %@", (uint8_t *)&v9, 0x16u);

}

- (void)_queue_retryMindfulSessionQueryWithRetryCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (objc_class *)OUTLINED_FUNCTION_0_1();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v7;
  v10 = 2048;
  v11 = a3;
  v12 = 2048;
  v13 = 5;
  _os_log_error_impl(&dword_21168F000, v3, OS_LOG_TYPE_ERROR, "%@ reached max retry count %lu (max: %lu); not restarting query",
    (uint8_t *)&v8,
    0x20u);

}

@end
