@implementation FIUIModel

+ (id)dailyTotalQueryForDate:(id)a3 dataType:(id)a4 predicate:(id)a5 sendUpdates:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a6;
  v12 = (void *)MEMORY[0x24BDBCE48];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startOfDayForDate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "hk_startOfDateByAddingDays:toDate:", 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dailyTotalsQueryFromDate:toDate:dataType:predicate:sendUpdates:handler:", v18, v19, v15, v14, v7, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_dailyTotalsQueryFromDate:(id)a3 toDate:(id)a4 dataType:(id)a5 predicate:(id)a6 sendUpdates:(BOOL)a7 handler:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[3];

  v9 = a7;
  v32[2] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a8;
  v16 = (objc_class *)MEMORY[0x24BDBCE68];
  v17 = a5;
  v18 = a4;
  v19 = objc_alloc_init(v16);
  objc_msgSend(v19, "setDay:", 1);
  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForSamplesWithStartDate:endDate:options:", v13, v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v21 = (void *)MEMORY[0x24BDD14C0];
    v32[0] = v14;
    v32[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v20;
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4000]), "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v17, v23, 16, v13, v19);

  v25 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke;
  v30[3] = &unk_24CF30510;
  v26 = v15;
  v31 = v26;
  objc_msgSend(v24, "setInitialResultsHandler:", v30);
  if (v9)
  {
    v28[0] = v25;
    v28[1] = 3221225472;
    v28[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_3;
    v28[3] = &unk_24CF30560;
    v29 = v26;
    objc_msgSend(v24, "setStatisticsUpdateHandler:", v28);

  }
  return v24;
}

void __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_2;
  v14[3] = &unk_24CF304E8;
  v10 = *(id *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

uint64_t __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], 0, a1[5], a1[6]);
  return result;
}

void __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_4;
  block[3] = &unk_24CF30538;
  v13 = *(id *)(a1 + 32);
  v22 = v12;
  v23 = v13;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __85__FIUIModel__dailyTotalsQueryFromDate_toDate_dataType_predicate_sendUpdates_handler___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7]);
  return result;
}

- (FIUIModel)init
{
  return -[FIUIModel initWithHealthStore:](self, "initWithHealthStore:", 0);
}

- (FIUIModel)initWithHealthStore:(id)a3
{
  id v5;
  FIUIModel *v6;
  FIUIModel *v7;
  void **p_healthStore;
  id v9;
  void *v10;
  NSDictionary *currentActivitySummaryQueryCollectionIntervalOverrides;
  uint64_t v12;
  NSHashTable *observers;
  uint64_t v14;
  NSMutableDictionary *currentActivitySummaryQueryClients;
  uint64_t v16;
  NSMutableDictionary *currentActivityCacheQueryClients;
  uint64_t v18;
  OS_dispatch_queue *activityQueryClientQueue;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FIUIModel;
  v6 = -[FIUIModel init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    p_healthStore = (void **)&v6->_healthStore;
    objc_storeStrong((id *)&v6->_healthStore, a3);
    if (!v7->_healthStore)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD3C40]);
      v10 = *p_healthStore;
      *p_healthStore = v9;

    }
    currentActivitySummaryQueryCollectionIntervalOverrides = v7->_currentActivitySummaryQueryCollectionIntervalOverrides;
    v7->_currentActivitySummaryQueryCollectionIntervalOverrides = 0;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    currentActivitySummaryQueryClients = v7->_currentActivitySummaryQueryClients;
    v7->_currentActivitySummaryQueryClients = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    currentActivityCacheQueryClients = v7->_currentActivityCacheQueryClients;
    v7->_currentActivityCacheQueryClients = (NSMutableDictionary *)v16;

    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    activityQueryClientQueue = v7->_activityQueryClientQueue;
    v7->_activityQueryClientQueue = (OS_dispatch_queue *)v18;

  }
  return v7;
}

- (FIUIWeeklyGoalModel)weeklyGoalModel
{
  FIUIWeeklyGoalModel *weeklyGoalModel;
  FIUIWeeklyGoalModel *v4;
  FIUIWeeklyGoalModel *v5;

  weeklyGoalModel = self->_weeklyGoalModel;
  if (!weeklyGoalModel)
  {
    v4 = -[FIUIWeeklyGoalModel initWithHealthStore:]([FIUIWeeklyGoalModel alloc], "initWithHealthStore:", self->_healthStore);
    v5 = self->_weeklyGoalModel;
    self->_weeklyGoalModel = v4;

    weeklyGoalModel = self->_weeklyGoalModel;
  }
  return weeklyGoalModel;
}

- (void)_printStatisticsCollection:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x24BDD2FA8];
  v6 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
    -[FIUIModel _printStatisticsCollection:].cold.2(v6, a2);
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v4;
    objc_msgSend(v4, "statistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
          _HKInitializeLogging();
          v13 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
          {
            v14 = v13;
            objc_msgSend(v12, "startDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "sumQuantity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v15;
            v32 = 2112;
            v33 = v16;
            _os_log_debug_impl(&dword_21307C000, v14, OS_LOG_TYPE_DEBUG, "Date:%@ %@", buf, 0x16u);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v9);
    }

    v4 = v25;
  }
  _HKInitializeLogging();
  v17 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    -[FIUIModel _printStatisticsCollection:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

}

- (void)_printUpdatedStatistics:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x24BDD2FA8];
  v6 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
    -[FIUIModel _printStatisticsCollection:].cold.2(v6, a2);
  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    _HKInitializeLogging();
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      -[FIUIModel _printUpdatedStatistics:].cold.2(v7, v4);
  }
  _HKInitializeLogging();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    -[FIUIModel _printStatisticsCollection:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)executeQuery:(id)a3
{
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", a3);
}

- (void)stopQuery:(id)a3
{
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", a3);
}

+ (BOOL)isWheelchairUser
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  objc_msgSend(v2, "wheelchairUseWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FIUIIsWheelchairUserForWheelchairUse(objc_msgSend(v3, "wheelchairUse"));

  return v4;
}

- (id)startCurrentActivitySummaryQueryWithHandler:(id)a3
{
  id v4;
  FIUIClientToken *v5;
  NSObject *activityQueryClientQueue;
  FIUIClientToken *v7;
  id v8;
  FIUIClientToken *v9;
  FIUIClientToken *v10;
  _QWORD block[5];
  FIUIClientToken *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(FIUIClientToken);
  activityQueryClientQueue = self->_activityQueryClientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke;
  block[3] = &unk_24CF305B0;
  block[4] = self;
  v14 = v4;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  dispatch_sync(activityQueryClientQueue, block);
  v9 = v13;
  v10 = v7;

  return v10;
}

void __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  v5 = *(_QWORD **)(a1 + 32);
  if (v4 && !v5[5])
  {
    objc_msgSend(v5, "_createCurrentActivitySummaryQuery");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "executeQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }
  else
  {
    v6 = v5[11];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke_2;
    v11[3] = &unk_24CF30588;
    v7 = *(id *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    dispatch_async(v6, v11);

  }
}

uint64_t __57__FIUIModel_startCurrentActivitySummaryQueryWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)stopCurrentActivitySummaryQueryForClientToken:(id)a3
{
  id v4;
  NSObject *activityQueryClientQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activityQueryClientQueue = self->_activityQueryClientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FIUIModel_stopCurrentActivitySummaryQueryForClientToken___block_invoke;
  block[3] = &unk_24CF305D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(activityQueryClientQueue, block);

}

void __59__FIUIModel_stopCurrentActivitySummaryQueryForClientToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "stopQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
}

- (void)_queue_restartCurrentActivitySummaryQueryAfterError
{
  int64_t queue_activitySummaryQueryRetries;
  dispatch_time_t v4;
  NSObject *activityQueryClientQueue;
  _QWORD block[5];

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_queue_currentActivitySummaryQuery);
  queue_activitySummaryQueryRetries = self->_queue_activitySummaryQueryRetries;
  self->_queue_activitySummaryQueryRetries = queue_activitySummaryQueryRetries + 1;
  if (queue_activitySummaryQueryRetries >= 5)
    queue_activitySummaryQueryRetries = 5;
  v4 = dispatch_time(0, 1000000000 * queue_activitySummaryQueryRetries);
  activityQueryClientQueue = self->_activityQueryClientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__FIUIModel__queue_restartCurrentActivitySummaryQueryAfterError__block_invoke;
  block[3] = &unk_24CF30600;
  block[4] = self;
  dispatch_after(v4, activityQueryClientQueue, block);
}

uint64_t __64__FIUIModel__queue_restartCurrentActivitySummaryQueryAfterError__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_21307C000, v2, OS_LOG_TYPE_DEFAULT, "[FM] Restarting current activity summary query for clients. Retry attempt: %ld", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createCurrentActivitySummaryQuery");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "executeQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)_createCurrentActivitySummaryQuery
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x24BDD41A8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke;
  v6[3] = &unk_24CF30650;
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithUpdateHandler:", v6);
  objc_msgSend(v4, "_setCollectionIntervals:", self->_currentActivitySummaryQueryCollectionIntervalOverrides);
  return v4;
}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 88);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2;
  block[3] = &unk_24CF30628;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2_cold_1(v2, v3);
    objc_msgSend(*(id *)(a1 + 40), "_queue_restartCurrentActivitySummaryQueryAfterError");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), *(id *)(a1 + 48));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSDictionary)currentActivitySummaryQueryCollectionIntervalOverrides
{
  return self->_currentActivitySummaryQueryCollectionIntervalOverrides;
}

- (void)setCurrentActivitySummaryQueryCollectionIntervalOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivitySummaryQueryCollectionIntervalOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivitySummaryQueryCollectionIntervalOverrides, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activityQueryClientQueue, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheForClients, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryForClients, 0);
  objc_storeStrong((id *)&self->_queue_currentActivityCacheQuery, 0);
  objc_storeStrong((id *)&self->_queue_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_currentActivityCacheQueryClients, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryQueryClients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_weeklyGoalModel, 0);
}

- (void)_printStatisticsCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21307C000, a1, a3, "\n", a5, a6, a7, a8, 0);
}

- (void)_printStatisticsCollection:(void *)a1 .cold.2(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21307C000, v5, v6, "%@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_printUpdatedStatistics:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "sumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_21307C000, v3, OS_LOG_TYPE_DEBUG, "Date:%@ %@", (uint8_t *)&v6, 0x16u);

}

void __47__FIUIModel__createCurrentActivitySummaryQuery__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_21307C000, a2, OS_LOG_TYPE_ERROR, "[FM] Error For Current Activity Summary Query: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
