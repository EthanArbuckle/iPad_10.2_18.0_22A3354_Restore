@implementation ACHMonthlyChallengeAwardingSource

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;

  v3 = a3;
  if (ACHTemplateIsMonthlyChallenge())
  {
    objc_msgSend(v3, "uniqueName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 3)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE012A8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v7 == objc_msgSend(v13, "year") && v9 == objc_msgSend(v13, "month");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ACHMonthlyChallengeAwardingSource)initWithHealthStore:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ACHMonthlyChallengeAwardingSource *v22;
  ACHMonthlyChallengeAwardingSource *v23;
  uint64_t v24;
  OS_dispatch_queue *internalQueue;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ACHMonthlyChallengeAwardingSource;
  v22 = -[ACHMonthlyChallengeAwardingSource init](&v27, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_healthStore, a3);
    objc_storeWeak((id *)&v23->_engine, v17);
    objc_storeWeak((id *)&v23->_progressEngine, v21);
    objc_storeWeak((id *)&v23->_templateStore, v18);
    objc_storeWeak((id *)&v23->_earnedInstanceStore, v19);
    objc_storeWeak((id *)&v23->_monthlyDataSource, v20);
    v23->_creatorDevice = a8;
    HKCreateSerialDispatchQueue();
    v24 = objc_claimAutoreleasedReturnValue();
    internalQueue = v23->_internalQueue;
    v23->_internalQueue = (OS_dispatch_queue *)v24;

    -[ACHMonthlyChallengeAwardingSource _startQueries](v23, "_startQueries");
  }

  return v23;
}

- (void)_startQueries
{
  id v3;
  uint64_t v4;
  ACHCurrentActivitySummaryQuery *v5;
  ACHCurrentActivitySummaryQuery *summaryQuery;
  id v7;
  void *v8;
  void *v9;
  HKAnchoredObjectQuery *v10;
  HKAnchoredObjectQuery *workoutQuery;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BE01820]);
  v4 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke;
  v18[3] = &unk_24D13A488;
  objc_copyWeak(&v19, &location);
  v5 = (ACHCurrentActivitySummaryQuery *)objc_msgSend(v3, "initWithUpdateHandler:", v18);
  summaryQuery = self->_summaryQuery;
  self->_summaryQuery = v5;

  v7 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3F08], "workoutType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E90], "latestAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (HKAnchoredObjectQuery *)objc_msgSend(v7, "initWithType:predicate:anchor:limit:resultsHandler:", v8, 0, v9, 0, &__block_literal_global_0);
  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = v10;

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke_3;
  v16[3] = &unk_24D13A310;
  objc_copyWeak(&v17, &location);
  -[HKAnchoredObjectQuery setUpdateHandler:](self->_workoutQuery, "setUpdateHandler:", v16);
  -[ACHMonthlyChallengeAwardingSource healthStore](self, "healthStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeAwardingSource summaryQuery](self, "summaryQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:", v13);

  -[ACHMonthlyChallengeAwardingSource healthStore](self, "healthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeAwardingSource workoutQuery](self, "workoutQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "executeQuery:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  id v18;

  v18 = a2;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:", 0, v13, a4);

  }
  if (v14)
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v17, "currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:", 0, v14, a6);

  }
}

void __50__ACHMonthlyChallengeAwardingSource__startQueries__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "samplesAdded:anchor:", v4, &unk_24D15B408);

}

- (ACHMonthlyChallengeAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 templateStore:(id)a5 earnedInstanceStore:(id)a6 monthlyDataSource:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ACHMonthlyChallengeAwardingSource *v21;
  ACHMonthlyChallengeAwardingSource *v22;
  id WeakRetained;
  void *v24;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ACHMonthlyChallengeAwardingSource;
  v21 = -[ACHMonthlyChallengeAwardingSource init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_profile, v15);
    objc_storeWeak((id *)&v22->_engine, v16);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    objc_storeWeak((id *)&v22->_templateStore, v17);
    objc_storeWeak((id *)&v22->_earnedInstanceStore, v18);
    objc_storeWeak((id *)&v22->_monthlyDataSource, v19);
    v22->_creatorDevice = a8;
    WeakRetained = objc_loadWeakRetained((id *)&v22->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerForDaemonReady:", v22);

  }
  return v22;
}

- (BOOL)isAppleWatch
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[ACHMonthlyChallengeAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHMonthlyChallengeAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[ACHMonthlyChallengeAwardingSource profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ACHMonthlyChallengeAwardingSource profile](self, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "daemon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "behavior");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isAppleWatch");

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "currentActivitySummaryHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  -[ACHMonthlyChallengeAwardingSource profile](self, "profile");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:forDataType:", self, v7);

}

- (NSString)uniqueName
{
  return (NSString *)CFSTR("MonthlyChallengeAwardingSource");
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ACHLogMonthlyChallenges();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[ACHMonthlyChallengeAwardingSource _earnedInstancesForInterval:](self, "_earnedInstancesForInterval:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[5];
  id v19;
  __int128 *p_buf;
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ACHLogMonthlyChallenges();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ACHMonthlyChallengeAwardingSource profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "copyForReadingProtectedData");
  v21 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __90__ACHMonthlyChallengeAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  v18[3] = &unk_24D13A4F0;
  p_buf = &buf;
  v18[4] = self;
  v12 = v6;
  v19 = v12;
  objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v21, v18, 0);
  v13 = v21;

  if (v13)
  {
    ACHLogMonthlyChallenges();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACHMonthlyChallengeAwardingSource earnedInstancesForHistoricalInterval:databaseContext:].cold.1((uint64_t)v13, v14, v15);

  }
  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v16;
}

uint64_t __90__ACHMonthlyChallengeAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_earnedInstancesForInterval:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[ACHMonthlyChallengeAwardingSource progressEngine](self, "progressEngine", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProgressUpdateForProgressProvider:", self);

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(-[ACHMonthlyChallengeAwardingSource isAppleWatch](self, "isAppleWatch")))
  {
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found today summary updated, requesting incremental evaluation", v8, 2u);
    }

    -[ACHMonthlyChallengeAwardingSource _requestIncrementalEvaluation](self, "_requestIncrementalEvaluation");
  }
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[ACHMonthlyChallengeAwardingSource progressEngine](self, "progressEngine", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProgressUpdateForProgressProvider:", self);

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(-[ACHMonthlyChallengeAwardingSource isAppleWatch](self, "isAppleWatch")))
  {
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found yesterday summary updated, requesting incremental evaluation", v8, 2u);
    }

    -[ACHMonthlyChallengeAwardingSource _requestIncrementalEvaluation](self, "_requestIncrementalEvaluation");
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[ACHMonthlyChallengeAwardingSource progressEngine](self, "progressEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProgressUpdateForProgressProvider:", self);

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(-[ACHMonthlyChallengeAwardingSource isAppleWatch](self, "isAppleWatch")))
  {
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider found %lu new workout samples, requesting incremental evaluation", (uint8_t *)&v8, 0xCu);
    }

    -[ACHMonthlyChallengeAwardingSource _requestIncrementalEvaluation](self, "_requestIncrementalEvaluation");
  }

}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHMonthlyChallengeAwardingSource *v9;

  v4 = a3;
  -[ACHMonthlyChallengeAwardingSource internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__ACHMonthlyChallengeAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __83__ACHMonthlyChallengeAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2 = objc_alloc_init(MEMORY[0x24BE01838]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v2, "validateTemplate:", v7, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isValid"))
        {
          objc_msgSend(*(id *)(a1 + 40), "_queue_goalQuantityForTemplate:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_queue_progressQuantityForTemplate:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_alloc(MEMORY[0x24BE017B8]);
          objc_msgSend(v7, "uniqueName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithTemplateUniqueName:progressQuantity:goalQuantity:", v12, v10, v9);

          objc_msgSend(v16, "addObject:", v13);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "progressEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v14, "processAchievementProgressUpdates:", v15);

}

- (id)_queue_progressQuantityForTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:](self, "_evaluationEnvironmentForTemplate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "graceProgressExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "progressExpression");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionValueWithObject:context:", v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ACHHKQuantityWithValueAndUnit();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_queue_goalQuantityForTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:](self, "_evaluationEnvironmentForTemplate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "graceGoalExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "goalExpression");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionValueWithObject:context:", v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ACHHKQuantityWithValueAndUnit();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_evaluationEnvironmentForTemplate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BE01828];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "availabilityStart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availabilityEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithStartDateComponents:endDateComponents:", v7, v8);

  -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:andDateComponentInterval:](self, "_evaluationEnvironmentForTemplate:andDateComponentInterval:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_evaluationEnvironmentForTemplate:(id)a3 andDateComponentInterval:(id)a4
{
  id v5;
  ACHMonthlyChallengeEvaluationEnvironment *v6;
  void *v7;
  void *v8;
  ACHMonthlyChallengeEvaluationEnvironment *v9;

  v5 = a4;
  v6 = [ACHMonthlyChallengeEvaluationEnvironment alloc];
  -[ACHMonthlyChallengeAwardingSource monthlyDataSource](self, "monthlyDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACHMonthlyChallengeEvaluationEnvironment initWithMonthlyChallengeDataSource:dateComponentInterval:calendar:](v6, "initWithMonthlyChallengeDataSource:dateComponentInterval:calendar:", v7, v5, v8);

  return v9;
}

- (id)_earnedInstancesForInterval:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t i;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  uint64_t v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeAwardingSource _monthlyChallengeTemplatesForHistoricalInterval:](self, "_monthlyChallengeTemplatesForHistoricalInterval:", v38);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogMonthlyChallenges();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v54 = objc_msgSend(v3, "count");
    v55 = 2114;
    v56 = v38;
    v57 = 2114;
    v58 = v3;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu monthly templates for interval %{public}@: %{public}@", buf, 0x20u);
  }

  v46 = objc_alloc_init(MEMORY[0x24BE01838]);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v3;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v45)
          objc_enumerationMutation(obj);
        v6 = *(NSObject **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v46, "validateTemplate:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isValid") & 1) != 0)
        {
          -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:](self, "_evaluationEnvironmentForTemplate:", v6);
          v8 = objc_claimAutoreleasedReturnValue();
          -[NSObject gracePredicate](v6, "gracePredicate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v11 = v9;
          }
          else
          {
            -[NSObject predicate](v6, "predicate");
            v11 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v11;

          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "evaluateWithObject:", v8);

          if (v15)
          {
            ACHLogMonthlyChallenges();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject uniqueName](v6, "uniqueName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = (uint64_t)v17;
              v55 = 2114;
              v56 = v6;
              _os_log_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for monthly challenge; full template: %{public}@",
                buf,
                0x16u);

            }
            -[ACHMonthlyChallengeAwardingSource _earnedDateComponentsForTemplate:](self, "_earnedDateComponentsForTemplate:", v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = objc_alloc_init(MEMORY[0x24BE01830]);
              -[NSObject uniqueName](v6, "uniqueName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setTemplateUniqueName:](v19, "setTemplateUniqueName:", v20);

              -[NSObject setEarnedDateComponents:](v19, "setEarnedDateComponents:", v18);
              -[NSObject graceValueExpression](v6, "graceValueExpression");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21)
              {
                v43 = v21;
              }
              else
              {
                -[NSObject valueExpression](v6, "valueExpression");
                v43 = (id)objc_claimAutoreleasedReturnValue();
              }

              -[NSObject canonicalUnit](v6, "canonicalUnit");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                v25 = v43 == 0;
              else
                v25 = 1;
              v26 = !v25;

              if (v26)
              {
                v27 = objc_alloc(MEMORY[0x24BE01828]);
                -[NSObject availabilityStart](v6, "availabilityStart");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)objc_msgSend(v27, "initWithStartDateComponents:endDateComponents:", v28, v18);

                -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:andDateComponentInterval:](self, "_evaluationEnvironmentForTemplate:andDateComponentInterval:", v6, v41);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v43);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "expressionValueWithObject:context:", v40, 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                {
                  v31 = (void *)MEMORY[0x24BDD3E50];
                  -[NSObject canonicalUnit](v6, "canonicalUnit");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "doubleValue");
                  objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setValue:](v19, "setValue:", v33);

                }
              }
              objc_msgSend(v39, "addObject:", v19);
              ACHLogMonthlyChallenges();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject uniqueName](v6, "uniqueName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v54 = (uint64_t)v35;
                v55 = 2112;
                v56 = v19;
                _os_log_impl(&dword_21407B000, v34, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);

              }
            }
            else
            {
              ACHLogMonthlyChallenges();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject uniqueName](v6, "uniqueName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v54 = (uint64_t)v23;
                _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Unable to determine earned date components for %@, not creating earned instance.", buf, 0xCu);

              }
            }

          }
        }
        else
        {
          ACHLogAwardEngine();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject uniqueName](v6, "uniqueName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v54 = (uint64_t)v12;
            _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);

          }
        }

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v47);
  }

  v36 = (void *)objc_msgSend(v39, "copy");
  return v36;
}

- (id)_earnedDateComponentsForTemplate:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSObject *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  NSObject *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v35 = objc_alloc_init(MEMORY[0x24BE01838]);
  objc_msgSend(v35, "validateTemplate:", v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isValid") & 1) != 0)
  {
    objc_msgSend(v3, "availabilityStart");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "availabilityEnd");
    v4 = objc_claimAutoreleasedReturnValue();
    ACHLogMonthlyChallenges();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Determining earned instance date", buf, 0xCu);

    }
    __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(v7, v38, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(0, "isEqual:", v8) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v16 = 0;
      do
      {
        v17 = objc_alloc(MEMORY[0x24BE01828]);
        objc_msgSend(v3, "availabilityStart");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "initWithStartDateComponents:endDateComponents:", v18, v8);

        -[ACHMonthlyChallengeAwardingSource _evaluationEnvironmentForTemplate:andDateComponentInterval:](self, "_evaluationEnvironmentForTemplate:andDateComponentInterval:", v3, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ACHLogMonthlyChallenges();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "uniqueName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v22;
          v41 = 2112;
          v42 = v19;
          _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Evaluating for interval: %@", buf, 0x16u);

        }
        objc_msgSend(v3, "gracePredicate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          objc_msgSend(v3, "predicate");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;

        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "evaluateWithObject:", v20);

        if (v28)
        {
          ACHLogMonthlyChallenges();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "uniqueName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v40 = v30;
            v41 = 2112;
            v42 = v8;
            v43 = 2112;
            v44 = v38;
            _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Updating mostRecentEarnedDateComponents to: %@, oldestUnearnedDateComponents = %@", buf, 0x20u);

          }
          v31 = v4;
          v4 = v8;
        }
        else
        {
          ACHLogMonthlyChallenges();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "uniqueName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v40 = v32;
            v41 = 2112;
            v42 = v8;
            v43 = 2112;
            v44 = v4;
            _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Updating oldestUnearnedDateComponents to: %@, mostRecentEarnedDateComponents = %@", buf, 0x20u);

          }
          v31 = v38;
          v38 = v8;
        }

        v33 = v8;
        v9 = v33;

        __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(v34, v38, v4);
        v8 = objc_claimAutoreleasedReturnValue();

        v16 = v9;
      }
      while ((-[NSObject isEqual:](v9, "isEqual:", v8) & 1) == 0);
    }
    ACHLogMonthlyChallenges();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v11;
      v41 = 2112;
      v42 = v4;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "[Earned Instance Date: %@] Determined earned date is: %@", buf, 0x16u);

    }
    v12 = v4;

    v13 = v38;
  }
  else
  {
    ACHLogMonthlyChallenges();
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[ACHMonthlyChallengeAwardingSource _earnedDateComponentsForTemplate:].cold.1(v3, v14);
      v12 = 0;
      v13 = v14;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

id __70__ACHMonthlyChallengeAwardingSource__earnedDateComponentsForTemplate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "day");
  v7 = objc_msgSend(v4, "day");

  v8 = v7 + v6;
  if (v7 + v6 < 0 != __OFADD__(v7, v6))
    ++v8;
  v9 = v8 >> 1;
  v10 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v10, "setDay:", v9);
  return v10;
}

- (id)_monthlyChallengeTemplatesForHistoricalInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  -[ACHMonthlyChallengeAwardingSource templateStore](self, "templateStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startOfDayForDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(v4, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v9, v11);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__ACHMonthlyChallengeAwardingSource__monthlyChallengeTemplatesForHistoricalInterval___block_invoke;
  v17[3] = &unk_24D13A518;
  v18 = v7;
  v19 = v12;
  v13 = v12;
  v14 = v7;
  objc_msgSend(v6, "hk_filter:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __85__ACHMonthlyChallengeAwardingSource__monthlyChallengeTemplatesForHistoricalInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  if (ACHTemplateIsMonthlyChallenge()
    && (objc_msgSend(v3, "availabilityStart"), (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4,
        objc_msgSend(v3, "availabilityEnd"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "availabilityStart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "availabilityEnd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (v9 && v12)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v12);
      v13 = objc_msgSend(*(id *)(a1 + 40), "intersectsDateInterval:", v14);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_requestIncrementalEvaluation
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[ACHMonthlyChallengeAwardingSource engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeAwardingSource uniqueName](self, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__ACHMonthlyChallengeAwardingSource__requestIncrementalEvaluation__block_invoke;
  v5[3] = &unk_24D13A540;
  v5[4] = self;
  objc_msgSend(v3, "requestIncrementalEvaluationForSource:evaluationBlock:", v4, v5);

}

id __66__ACHMonthlyChallengeAwardingSource__requestIncrementalEvaluation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ACHLogMonthlyChallenges();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeAwardingProvider starting incremental evaluation for date range: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_earnedInstancesForInterval:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)dataStorePropertyKeys
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSDictionary)dataStoreProperties
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHEarnedInstanceAwardingEngine)engine
{
  return (ACHEarnedInstanceAwardingEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (ACHAchievementProgressEngine)progressEngine
{
  return (ACHAchievementProgressEngine *)objc_loadWeakRetained((id *)&self->_progressEngine);
}

- (void)setProgressEngine:(id)a3
{
  objc_storeWeak((id *)&self->_progressEngine, a3);
}

- (ACHTemplateStore)templateStore
{
  return (ACHTemplateStore *)objc_loadWeakRetained((id *)&self->_templateStore);
}

- (void)setTemplateStore:(id)a3
{
  objc_storeWeak((id *)&self->_templateStore, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return (ACHEarnedInstanceStore *)objc_loadWeakRetained((id *)&self->_earnedInstanceStore);
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeWeak((id *)&self->_earnedInstanceStore, a3);
}

- (ACHMonthlyChallengeDataSource)monthlyDataSource
{
  return (ACHMonthlyChallengeDataSource *)objc_loadWeakRetained((id *)&self->_monthlyDataSource);
}

- (void)setMonthlyDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_monthlyDataSource, a3);
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSNumber)overrideIsAppleWatch
{
  return self->_overrideIsAppleWatch;
}

- (void)setOverrideIsAppleWatch:(id)a3
{
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, a3);
}

- (ACHCurrentActivitySummaryQuery)summaryQuery
{
  return self->_summaryQuery;
}

- (void)setSummaryQuery:(id)a3
{
  objc_storeStrong((id *)&self->_summaryQuery, a3);
}

- (HKAnchoredObjectQuery)workoutQuery
{
  return self->_workoutQuery;
}

- (void)setWorkoutQuery:(id)a3
{
  objc_storeStrong((id *)&self->_workoutQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutQuery, 0);
  objc_storeStrong((id *)&self->_summaryQuery, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_monthlyDataSource);
  objc_destroyWeak((id *)&self->_earnedInstanceStore);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)earnedInstancesForHistoricalInterval:(uint64_t)a3 databaseContext:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, a3, "MonthlyChallengeAwardingSource historical evaluation transaction error: %{public}@", (uint8_t *)&v3);
}

- (void)_earnedDateComponentsForTemplate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, v4, "[Earned Instance Date: %@] Template is invalid, skipping search.", (uint8_t *)&v5);

}

@end
