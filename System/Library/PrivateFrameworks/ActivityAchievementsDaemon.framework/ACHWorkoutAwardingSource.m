@implementation ACHWorkoutAwardingSource

void __74__ACHWorkoutAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "_progressEnvironment");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE01838]);
  v19 = (void *)v3;
  if (v3)
  {
    v18 = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = *(id *)(a1 + 40);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "validateTemplate:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isValid"))
          {
            objc_msgSend(*(id *)(a1 + 32), "_queue_goalQuantityForTemplate:progressEnvironment:", v9, v19);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_queue_progressQuantityForTemplate:progressEnvironment:", v9, v19);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_alloc(MEMORY[0x24BE017B8]);
            objc_msgSend(v9, "uniqueName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v13, "initWithTemplateUniqueName:progressQuantity:goalQuantity:", v14, v12, v11);

            objc_msgSend(v18, "addObject:", v15);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "progressEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v18;
    v17 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v16, "processAchievementProgressUpdates:", v17);

  }
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHWorkoutAwardingSource internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__ACHWorkoutAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (ACHAchievementProgressEngine)progressEngine
{
  return (ACHAchievementProgressEngine *)objc_loadWeakRetained((id *)&self->_progressEngine);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (id)_queue_progressQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char IsAvailableForCalendarAndDate;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource currentDate](self, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsAvailableForCalendarAndDate = ACHTemplateIsAvailableForCalendarAndDate(v6, v8, v9);

  if ((IsAvailableForCalendarAndDate & 1) != 0)
  {
    objc_msgSend(v6, "graceProgressExpression");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v6, "progressExpression");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "expressionValueWithObject:context:", v7, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canonicalUnit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "canonicalUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ACHHKQuantityWithValueAndUnit();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_queue_goalQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "graceGoalExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "goalExpression");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expressionValueWithObject:context:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "canonicalUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ACHHKQuantityWithValueAndUnit();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_progressEnvironment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  ACHWorkoutProgressEvaluationEnvironment *v16;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumRangeOfUnit:", 512);
  v6 = v4 + v5;
  -[ACHWorkoutAwardingSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACHStartOfFitnessWeekBeforeDateInCalendar();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hk_dateByAddingDays:toDate:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v8, v9);
  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = objc_msgSend(v12, "numberOfFirstPartyWorkoutsWithDuration:containedInInterval:error:", v10, &v18, 300.0);
    v14 = v18;

    if (v14)
    {
      ACHLogAwardEngine();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ACHWorkoutAwardingSource _progressEnvironment].cold.1();

    }
  }
  else
  {
    -[ACHWorkoutAwardingSource workoutUtility](self, "workoutUtility");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "numberOfFirstPartyWorkoutsWithDuration:containedInInterval:", v10, 300.0);
  }

  v16 = -[ACHWorkoutProgressEvaluationEnvironment initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:]([ACHWorkoutProgressEvaluationEnvironment alloc], "initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:", v13);
  return v16;
}

- (ACHAwardsWorkoutClient)workoutClient
{
  return (ACHAwardsWorkoutClient *)objc_loadWeakRetained((id *)&self->_workoutClient);
}

- (id)currentDate
{
  void *v3;

  -[ACHWorkoutAwardingSource currentDateOverride](self, "currentDateOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHWorkoutAwardingSource currentDateOverride](self, "currentDateOverride");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (BOOL)_handlesTemplate:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "triggers") >> 1) & 1;
}

- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10
{
  return -[ACHWorkoutAwardingSource initWithClient:healthStore:awardingEngine:dataStore:templateStore:creatorDevice:progressEngine:workoutUtility:initialResultsHandler:](self, "initWithClient:healthStore:awardingEngine:dataStore:templateStore:creatorDevice:progressEngine:workoutUtility:initialResultsHandler:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10 initialResultsHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ACHWorkoutAwardingSource *v24;
  ACHWorkoutAwardingSource *v25;
  uint64_t v26;
  OS_dispatch_queue *internalQueue;
  int64x2_t v28;
  id WeakRetained;
  uint64_t v30;
  id initialResultsHandler;
  id v33;
  objc_super v34;

  v17 = a3;
  v33 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v34.receiver = self;
  v34.super_class = (Class)ACHWorkoutAwardingSource;
  v24 = -[ACHWorkoutAwardingSource init](&v34, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v24->_client, v17);
    objc_storeStrong((id *)&v25->_healthStore, a4);
    HKCreateSerialDispatchQueue();
    v26 = objc_claimAutoreleasedReturnValue();
    internalQueue = v25->_internalQueue;
    v25->_internalQueue = (OS_dispatch_queue *)v26;

    objc_storeWeak((id *)&v25->_engine, v18);
    objc_storeWeak((id *)&v25->_dataStore, v19);
    objc_storeWeak((id *)&v25->_progressEngine, v21);
    objc_storeWeak((id *)&v25->_templateStore, v20);
    v25->_creatorDevice = a8;
    *(_OWORD *)&v25->_bestElevationGainedHiking = xmmword_2140F68A0;
    v28 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v25->_best10KDuration = v28;
    *(int64x2_t *)&v25->_bestWheelchair10KDuration = v28;
    *(int64x2_t *)&v25->_bestMarathonDuration = v28;
    v25->_bestWheelchairMarathonDuration = 1.79769313e308;
    WeakRetained = objc_loadWeakRetained((id *)&v25->_dataStore);
    objc_msgSend(WeakRetained, "addPropertyProvider:", v25);

    objc_storeWeak((id *)&v25->_workoutClient, v22);
    v30 = MEMORY[0x2199C9184](v23);
    initialResultsHandler = v25->_initialResultsHandler;
    v25->_initialResultsHandler = (id)v30;

  }
  return v25;
}

- (void)activate
{
  const char *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __36__ACHWorkoutAwardingSource_activate__block_invoke;
  v9 = &unk_24D13A2C0;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, v4, &v6);

  -[ACHWorkoutAwardingSource _startWorkoutQueryIfNecessary](self, "_startWorkoutQueryIfNecessary", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __36__ACHWorkoutAwardingSource_activate__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  ACHLogWorkouts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Workout awarding source received protected data availabilty change to state: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "_startWorkoutQueryIfNecessary");

  }
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHWorkoutAwardingSource;
  -[ACHWorkoutAwardingSource dealloc](&v3, sel_dealloc);
}

- (void)_startWorkoutQueryIfNecessary
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_workoutQuery)
    -[ACHWorkoutAwardingSource _lock_startWorkoutQueryWithInitialResultsHandler:](self, "_lock_startWorkoutQueryWithInitialResultsHandler:", self->_initialResultsHandler);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startWorkoutQueryWithInitialResultsHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  HKAnchoredObjectQuery *v10;
  HKAnchoredObjectQuery *workoutQuery;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3F08], "workoutType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E90], "latestAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke;
  v17[3] = &unk_24D13D0E8;
  objc_copyWeak(&v19, &location);
  v9 = v4;
  v18 = v9;
  v10 = (HKAnchoredObjectQuery *)objc_msgSend(v5, "initWithType:predicate:anchor:limit:resultsHandler:", v6, 0, v7, 0, v17);
  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = v10;

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_211;
  v15[3] = &unk_24D13A310;
  objc_copyWeak(&v16, &location);
  -[HKAnchoredObjectQuery setUpdateHandler:](self->_workoutQuery, "setUpdateHandler:", v15);
  ACHLogWorkouts();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Starting workout query", v14, 2u);
  }

  -[ACHWorkoutAwardingSource healthStore](self, "healthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeQuery:", self->_workoutQuery);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id WeakRetained;
  uint64_t v18;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    ACHLogWorkouts();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_stopWorkoutQuery");

  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, id, id, id, id, id))(v18 + 16))(v18, v11, v12, v13, v14, v15);

}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_211(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;

  v8 = a3;
  v9 = a6;
  if (v9)
  {
    ACHLogWorkouts();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_211_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_stopWorkoutQuery");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "workoutsAdded:", v8);
  }

}

- (void)_stopWorkoutQuery
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HKAnchoredObjectQuery *workoutQuery;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ACHWorkoutAwardingSource healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopQuery:", self->_workoutQuery);

  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = 0;

  os_unfair_lock_unlock(p_lock);
}

- (ACHWorkoutAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 dataStore:(id)a5 templateStore:(id)a6 creatorDevice:(unsigned __int8)a7 progressEngine:(id)a8 workoutUtility:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ACHWorkoutAwardingSource *v21;
  ACHWorkoutAwardingSource *v22;
  uint64_t v23;
  OS_dispatch_queue *internalQueue;
  int64x2_t v25;
  id WeakRetained;
  id v27;
  void *v28;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ACHWorkoutAwardingSource;
  v21 = -[ACHWorkoutAwardingSource init](&v30, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v21->_profile, v15);
    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v22->_engine, v16);
    objc_storeWeak((id *)&v22->_dataStore, v17);
    objc_storeWeak((id *)&v22->_progressEngine, v19);
    objc_storeWeak((id *)&v22->_templateStore, v18);
    v22->_creatorDevice = a7;
    v25 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v22->_bestElevationGainedHiking = xmmword_2140F68A0;
    *(int64x2_t *)&v22->_best10KDuration = v25;
    *(int64x2_t *)&v22->_bestWheelchair10KDuration = v25;
    *(int64x2_t *)&v22->_bestMarathonDuration = v25;
    v22->_bestWheelchairMarathonDuration = 1.79769313e308;
    objc_storeWeak((id *)&v22->_workoutUtility, v20);
    WeakRetained = objc_loadWeakRetained((id *)&v22->_dataStore);
    objc_msgSend(WeakRetained, "addPropertyProvider:", v22);

    v27 = objc_loadWeakRetained((id *)&v22->_profile);
    objc_msgSend(v27, "daemon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerForDaemonReady:", v22);

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

  -[ACHWorkoutAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHWorkoutAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[ACHWorkoutAwardingSource profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ACHWorkoutAwardingSource profile](self, "profile");
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
  void *v4;
  void *v5;
  id v6;

  -[ACHWorkoutAwardingSource profile](self, "profile", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forDataType:", self, v5);

}

- (NSString)uniqueName
{
  return (NSString *)CFSTR("WorkoutAwardingSource");
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v13;

  v6 = a3;
  v13 = 0;
  -[ACHWorkoutAwardingSource _client_earnedInstancesForWorkoutsInDateInterval:error:](self, "_client_earnedInstancesForWorkoutsInDateInterval:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v8)
  {
    ACHLogAwardEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource earnedInstancesForHistoricalInterval:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError();
    v10 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  return v11;
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
  id v15;
  _QWORD v17[5];
  id v18;
  __int128 *p_buf;
  id v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ACHLogWorkouts();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  v25 = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ACHWorkoutAwardingSource profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "copyForReadingProtectedData");
  v20 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  v17[3] = &unk_24D13B7C0;
  v17[4] = self;
  v12 = v6;
  v18 = v12;
  p_buf = &buf;
  objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v11, &v20, v17, 0);
  v13 = v20;

  if (v13)
  {
    ACHLogWorkouts();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource earnedInstancesForHistoricalInterval:databaseContext:].cold.1();

  }
  v15 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v15;
}

uint64_t __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "workoutUtility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutsInDateInterval:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_earnedInstancesForWorkouts:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

uint64_t __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)workoutsAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int IsAppleWatch;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  ACHWorkoutAwardingSource *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHWorkoutAwardingSource progressEngine](self, "progressEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestProgressUpdateForProgressProvider:", self);

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(objc_msgSend(v6, "isAppleWatch"));

  if (IsAppleWatch)
  {
    ACHLogWorkouts();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider found %lu new workout samples, requesting incremental evaluation", buf, 0xCu);
    }

    -[ACHWorkoutAwardingSource engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHWorkoutAwardingSource uniqueName](self, "uniqueName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__ACHWorkoutAwardingSource_workoutsAdded___block_invoke;
    v11[3] = &unk_24D13A3F0;
    v12 = v4;
    v13 = self;
    objc_msgSend(v9, "requestIncrementalEvaluationForSource:evaluationBlock:", v10, v11);

  }
}

id __42__ACHWorkoutAwardingSource_workoutsAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ACHLogWorkouts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 138543618;
    v9 = v3;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider starting incremental evaluation for date range: %{public}@, %lu workout samples", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_earnedInstancesForWorkouts:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  ACHWorkoutAwardingSource *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[ACHWorkoutAwardingSource progressEngine](self, "progressEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestProgressUpdateForProgressProvider:", self);

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(-[ACHWorkoutAwardingSource isAppleWatch](self, "isAppleWatch")))
  {
    ACHLogWorkouts();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider found %lu new workout samples, requesting incremental evaluation", buf, 0xCu);
    }

    -[ACHWorkoutAwardingSource engine](self, "engine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHWorkoutAwardingSource uniqueName](self, "uniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__ACHWorkoutAwardingSource_samplesAdded_anchor___block_invoke;
    v10[3] = &unk_24D13A3F0;
    v11 = v5;
    v12 = self;
    objc_msgSend(v8, "requestIncrementalEvaluationForSource:evaluationBlock:", v9, v10);

  }
}

id __48__ACHWorkoutAwardingSource_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ACHLogWorkouts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v8 = 138543618;
    v9 = v3;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider starting incremental evaluation for date range: %{public}@, %lu workout samples", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_earnedInstancesForWorkouts:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_bestElevationGainedKeyForActivityType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("BestElevationGained"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)dataStorePropertyKeys
{
  void *v2;
  void *v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x24BDAC8D0];
  -[ACHWorkoutAwardingSource _bestElevationGainedKeyForActivityType:](self, "_bestElevationGainedKeyForActivityType:", 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = CFSTR("Best5KDuration");
  v5[2] = CFSTR("Best10KDuration");
  v5[3] = CFSTR("BestWheelchair5KDuration");
  v5[4] = CFSTR("BestWheelchair10KDuration");
  v5[5] = CFSTR("BestHalfMarathonDuration");
  v5[6] = CFSTR("BestMarathonDuration");
  v5[7] = CFSTR("BestWheelchairHalfMarathonDuration");
  v5[8] = CFSTR("BestWheelchairMarathonDuration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)dataStoreProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  os_unfair_lock_t lock;
  _QWORD v16[9];
  _QWORD v17[11];

  v17[9] = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ACHWorkoutAwardingSource _bestElevationGainedKeyForActivityType:](self, "_bestElevationGainedKeyForActivityType:", 24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestElevationGainedHiking);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = CFSTR("Best5KDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_best5KDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = CFSTR("Best10KDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_best10KDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("BestWheelchair5KDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestWheelchair5KDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  v16[4] = CFSTR("BestWheelchair10KDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestWheelchair10KDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  v16[5] = CFSTR("BestHalfMarathonDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestHalfMarathonDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("BestMarathonDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestMarathonDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  v16[7] = CFSTR("BestWheelchairHalfMarathonDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestWheelchairHalfMarathonDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  v16[8] = CFSTR("BestWheelchairMarathonDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_bestWheelchairMarathonDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(lock);
  return (NSDictionary *)v12;
}

- (void)setDataStoreProperties:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  os_unfair_lock_s *lock;
  id v25;

  p_lock = &self->_lock;
  v5 = a3;
  lock = p_lock;
  os_unfair_lock_lock(p_lock);
  -[ACHWorkoutAwardingSource _bestElevationGainedKeyForActivityType:](self, "_bestElevationGainedKeyForActivityType:", 24);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Best5KDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Best10KDuration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestWheelchair5KDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestWheelchair10KDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestHalfMarathonDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestMarathonDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestWheelchairHalfMarathonDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BestWheelchairMarathonDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "doubleValue");
  else
    v14 = 2.22507386e-308;
  self->_bestElevationGainedHiking = v14;
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    v15 = 1.79769313e308;
  self->_best5KDuration = v15;
  if (v23)
    objc_msgSend(v23, "doubleValue");
  else
    v16 = 1.79769313e308;
  self->_best10KDuration = v16;
  if (v8)
    objc_msgSend(v8, "doubleValue");
  else
    v17 = 1.79769313e308;
  self->_bestWheelchair5KDuration = v17;
  if (v9)
    objc_msgSend(v9, "doubleValue");
  else
    v18 = 1.79769313e308;
  self->_bestWheelchair10KDuration = v18;
  if (v10)
    objc_msgSend(v10, "doubleValue");
  else
    v19 = 1.79769313e308;
  self->_bestHalfMarathonDuration = v19;
  if (v11)
    objc_msgSend(v11, "doubleValue");
  else
    v20 = 1.79769313e308;
  self->_bestMarathonDuration = v20;
  if (v12)
    objc_msgSend(v12, "doubleValue");
  else
    v21 = 1.79769313e308;
  self->_bestWheelchairHalfMarathonDuration = v21;
  if (v13)
    objc_msgSend(v13, "doubleValue");
  else
    v22 = 1.79769313e308;
  self->_bestWheelchairMarathonDuration = v22;
  os_unfair_lock_unlock(lock);

}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  os_unfair_lock_s *p_lock;
  int64x2_t v6;
  void (**v7)(id, uint64_t);

  p_lock = &self->_lock;
  v7 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(p_lock);
  *(_OWORD *)&self->_bestElevationGainedHiking = xmmword_2140F68A0;
  v6 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&self->_best10KDuration = v6;
  *(int64x2_t *)&self->_bestWheelchair10KDuration = v6;
  *(int64x2_t *)&self->_bestMarathonDuration = v6;
  self->_bestWheelchairMarathonDuration = 1.79769313e308;
  os_unfair_lock_unlock(p_lock);
  v7[2](v7, 1);

}

- (id)_earnedInstancesForWorkouts:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[ACHWorkoutAwardingSource _client_earnedInstancesForWorkouts:](self, "_client_earnedInstancesForWorkouts:", v4);
  else
    -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:](self, "_daemon_earnedInstancesForWorkouts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stringForDuration:(double)a3
{
  __CFString *v3;

  if (a3 == 1.79769313e308)
  {
    v3 = CFSTR("No Record Set");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lf seconds"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_stringForExperienceType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("UNKNOWN");
  else
    return off_24D13D190[a3];
}

- (id)_stringForDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _stringForDate__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_stringForDate__onceToken, &__block_literal_global_251);
  objc_msgSend((id)_stringForDate__formatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__ACHWorkoutAwardingSource__stringForDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_stringForDate__formatter;
  _stringForDate__formatter = (uint64_t)v0;

  return objc_msgSend((id)_stringForDate__formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
}

- (void)_client_appendEarnedInstancesForWorkout:(id)a3 toSet:(id)a4 templates:(id)a5 calendar:(id)a6 numberOfDaysInWeek:(unint64_t)a7 predicates:(id)a8 firstDayOfFitnessWeek:(int64_t)a9 watchCountryCode:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  double bestElevationGainedHiking;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  ACHWorkoutEvaluationEnvironment *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t i;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double best5KDuration;
  NSObject *v122;
  void *v123;
  id v124;
  void *v125;
  double v126;
  void *v127;
  double v128;
  double v129;
  double best10KDuration;
  NSObject *v131;
  void *v132;
  id v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  double bestWheelchair5KDuration;
  NSObject *v140;
  void *v141;
  id v142;
  void *v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double bestWheelchair10KDuration;
  NSObject *v149;
  void *v150;
  id v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  double bestHalfMarathonDuration;
  NSObject *v158;
  void *v159;
  id v160;
  void *v161;
  double v162;
  void *v163;
  double v164;
  double v165;
  double bestMarathonDuration;
  NSObject *v167;
  void *v168;
  id v169;
  void *v170;
  double v171;
  void *v172;
  double v173;
  double v174;
  double bestWheelchairHalfMarathonDuration;
  NSObject *v176;
  void *v177;
  id v178;
  void *v179;
  double v180;
  void *v181;
  double v182;
  double v183;
  double bestWheelchairMarathonDuration;
  NSObject *v185;
  void *v186;
  id v187;
  void *v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v206;
  id v207;
  id v208;
  void *v209;
  void *v210;
  uint64_t v211;
  _BOOL4 v212;
  void *v213;
  id v214;
  uint64_t v215;
  ACHWorkoutEvaluationEnvironment *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  uint8_t buf[4];
  id v233;
  __int16 v234;
  id v235;
  _BYTE v236[128];
  uint64_t v237;

  v237 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a10;
  ACHLogWorkouts();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v233 = v15;
    _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Evaluating workout %@", buf, 0xCu);
  }
  v214 = v19;

  v22 = *MEMORY[0x24BE012A8];
  objc_msgSend(v15, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = v22;
  objc_msgSend(v18, "components:fromDate:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v197 = v24;
  v198 = v20;
  ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v24, v20, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogWorkouts();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.6(v25, v15, v26);
  v217 = v25;

  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v15, "workoutActivityType");
  objc_msgSend(v15, "endDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = 0;
  v221 = objc_msgSend(v27, "numberOfFirstPartyWorkoutsWithDuration:withType:endingOnOrBeforeDate:error:", v28, v29, &v231, 300.0);
  v30 = v231;

  if (v30)
  {
    ACHLogAwardEngine();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.5();

  }
  objc_msgSend(v15, "endDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar();
  v33 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "hk_dateByAddingDays:toDate:", a7, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = v34;
  objc_msgSend(v34, "earlierDate:", v35);
  v36 = objc_claimAutoreleasedReturnValue();

  v196 = (void *)v33;
  v194 = (void *)v36;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v33, v36);

  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = 0;
  v219 = objc_msgSend(v38, "numberOfFirstPartyWorkoutsWithDuration:containedInInterval:error:", v37, &v230, 300.0);
  v39 = v230;

  if (v39)
  {
    ACHLogAwardEngine();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.4();

  }
  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v15, "workoutActivityType");
  objc_msgSend(v15, "endDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = 0;
  objc_msgSend(v41, "bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:error:", v42, v43, &v229);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v229;

  if (v44)
  {
    ACHLogAwardEngine();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.3();

  }
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "doubleValueForUnit:", v46);
  v48 = v47;

  -[ACHWorkoutAwardingSource workoutClient](self, "workoutClient");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v15, "workoutActivityType");
  objc_msgSend(v15, "endDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v228 = 0;
  objc_msgSend(v49, "bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:error:", v50, v51, &v228);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v228;

  if (v52)
  {
    ACHLogAwardEngine();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.2();

  }
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "doubleValueForUnit:", v54);
  v56 = v55;

  -[ACHWorkoutAwardingSource healthStore](self, "healthStore");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v59 = ACHExperienceTypeForDateWithHealthStore(v57, v18, v58, &v227);
  v60 = v227;

  if (v60)
  {
    ACHLogWorkouts();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.1();

    v59 = 3;
  }
  v212 = -[ACHWorkoutAwardingSource _isMetricLocale](self, "_isMetricLocale");
  os_unfair_lock_lock(&self->_lock);
  v207 = v16;
  v199 = v18;
  v200 = v17;
  v192 = v60;
  if (objc_msgSend(v15, "workoutActivityType") == 24)
    bestElevationGainedHiking = self->_bestElevationGainedHiking;
  else
    bestElevationGainedHiking = 2.22507386e-308;
  v208 = v15;
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = (void *)MEMORY[0x24BDD17C8];
  v215 = v59;
  -[ACHWorkoutAwardingSource _stringForExperienceType:](self, "_stringForExperienceType:", v59);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "startDate");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDate:](self, "_stringForDate:", v210);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v37;
  objc_msgSend(v37, "endDate");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDate:](self, "_stringForDate:", v209);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_best5KDuration);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_best10KDuration);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestWheelchair5KDuration);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestWheelchair10KDuration);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestHalfMarathonDuration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestMarathonDuration);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestWheelchairHalfMarathonDuration);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:", self->_bestWheelchairMarathonDuration);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "stringWithFormat:", CFSTR("Using the following values for evaluation:\nWorkout Type: %@\nExperience Type: %@\nPrevious workouts of type over 5 minutes: %lu\nWorkouts of any type this week over 5 minutes (week is %@ - %@): %lu\nBest Energy Burned value for workout type: %lf kcal\nBest Distance for workout type: %lf km\nBest Elevation Gain: %lf cm\nBest 5K Duration: %@\nBest 10K Duration: %@\nBest Wheelchair 5k Duration: %@\nBest Wheelchair 10k Duration: %@\nBest Half Marathon Duration: %@\nBest Marathon Duration: %@\nBest Wheelchair Half Marathon Duration: %@\nBest Wheelchair Marathon Duration: %@"), v202, v191, v221, v190, v63, v219, *(_QWORD *)&v48, *(_QWORD *)&v56, *(_QWORD *)&bestElevationGainedHiking, v64, v65, v66, v67, v68, v69, v70,
    v71);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  ACHLogWorkouts();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v233 = v201;
    _os_log_impl(&dword_21407B000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v73 = v208;
  v74 = -[ACHWorkoutEvaluationEnvironment initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:]([ACHWorkoutEvaluationEnvironment alloc], "initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:", v208, v221, v219, v215, v212, v48, v56, bestElevationGainedHiking, self->_best5KDuration, self->_best10KDuration, self->_bestWheelchair5KDuration, self->_bestWheelchair10KDuration, self->_bestHalfMarathonDuration, *(_QWORD *)&self->_bestMarathonDuration,
          *(_QWORD *)&self->_bestWheelchairHalfMarathonDuration,
          *(_QWORD *)&self->_bestWheelchairMarathonDuration);
  v220 = objc_alloc_init(MEMORY[0x24BE01838]);
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  v75 = v217;
  v76 = v207;
  v77 = v214;
  v213 = v75;
  v216 = v74;
  v222 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
  if (v222)
  {
    v218 = *(_QWORD *)v224;
    do
    {
      for (i = 0; i != v222; ++i)
      {
        if (*(_QWORD *)v224 != v218)
          objc_enumerationMutation(v75);
        v79 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * i);
        objc_msgSend(v220, "validateTemplate:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v80, "isValid") & 1) != 0)
        {
          objc_msgSend(v79, "uniqueName");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v81);
          v82 = objc_claimAutoreleasedReturnValue();

          if (!v82)
          {
            objc_msgSend(v79, "gracePredicate");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = v83;
            if (v83)
            {
              v85 = v83;
            }
            else
            {
              objc_msgSend(v79, "predicate");
              v85 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v85);
            v82 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "uniqueName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v82, v87);

            v74 = v216;
          }
          if (-[NSObject evaluateWithObject:](v82, "evaluateWithObject:", v74))
          {
            ACHLogWorkouts();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v79, "uniqueName");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v233 = v89;
              v234 = 2112;
              v235 = v73;
              _os_log_impl(&dword_21407B000, v88, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for workout %@", buf, 0x16u);

            }
            ACHLogWorkouts();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v233 = v79;
              _os_log_debug_impl(&dword_21407B000, v90, OS_LOG_TYPE_DEBUG, "full template: %{public}@", buf, 0xCu);
            }

            v91 = objc_alloc_init(MEMORY[0x24BE01830]);
            objc_msgSend(v79, "uniqueName");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setTemplateUniqueName:", v92);

            objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "endDate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "components:fromDate:", v211, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setEarnedDateComponents:", v95);

            objc_msgSend(v73, "UUID");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "UUIDString");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "setExternalIdentifier:", v97);

            objc_msgSend(v79, "graceValueExpression");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if (v98)
            {
              v99 = v98;

              goto LABEL_51;
            }
            objc_msgSend(v79, "valueExpression");
            v99 = (id)objc_claimAutoreleasedReturnValue();

            if (v99)
            {
LABEL_51:
              objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "expressionValueWithObject:context:", v216, 0);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v101, "doubleValue");
                v103 = v102;
                v104 = (void *)MEMORY[0x24BDD3E50];
                objc_msgSend(v79, "canonicalUnit");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "quantityWithUnit:doubleValue:", v105, v103);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "setValue:", v106);

                v73 = v208;
                v76 = v207;
              }

            }
            objc_msgSend(v76, "addObject:", v91);
            ACHLogWorkouts();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v79, "uniqueName");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v233 = v108;
              v234 = 2112;
              v235 = v91;
              _os_log_impl(&dword_21407B000, v107, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);

            }
            v75 = v213;
            v77 = v214;
            v74 = v216;
          }
        }
        else
        {
          ACHLogAwardEngine();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v79, "uniqueName");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v233 = v86;
            _os_log_impl(&dword_21407B000, v82, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);

          }
        }

      }
      v222 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
    }
    while (v222);
  }

  if (objc_msgSend(v73, "workoutActivityType") == 24)
  {
    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "elevationGained");
    v111 = v110;
    v112 = self->_bestElevationGainedHiking;

    if (v111 > v112)
    {
      ACHLogWorkouts();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "elevationGained");
        *(_DWORD *)buf = 134217984;
        v233 = v115;
        _os_log_impl(&dword_21407B000, v113, OS_LOG_TYPE_DEFAULT, "Updated best elevation gain to %lf cm", buf, 0xCu);

      }
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "elevationGained");
      self->_bestElevationGainedHiking = v117;

    }
  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "best5KDuration");
  v120 = v119;
  best5KDuration = self->_best5KDuration;

  if (v120 < best5KDuration)
  {
    ACHLogWorkouts();
    v122 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "best5KDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v124 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v124;
      _os_log_impl(&dword_21407B000, v122, OS_LOG_TYPE_DEFAULT, "Updated best 5K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "best5KDuration");
    self->_best5KDuration = v126;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "best10KDuration");
  v129 = v128;
  best10KDuration = self->_best10KDuration;

  if (v129 < best10KDuration)
  {
    ACHLogWorkouts();
    v131 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "best10KDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v133 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v133;
      _os_log_impl(&dword_21407B000, v131, OS_LOG_TYPE_DEFAULT, "Updated best 10K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "best10KDuration");
    self->_best10KDuration = v135;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "bestWheelchair5KDuration");
  v138 = v137;
  bestWheelchair5KDuration = self->_bestWheelchair5KDuration;

  if (v138 < bestWheelchair5KDuration)
  {
    ACHLogWorkouts();
    v140 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "bestWheelchair5KDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v142 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v142;
      _os_log_impl(&dword_21407B000, v140, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair 5K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "bestWheelchair5KDuration");
    self->_bestWheelchair5KDuration = v144;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "bestWheelchair10KDuration");
  v147 = v146;
  bestWheelchair10KDuration = self->_bestWheelchair10KDuration;

  if (v147 < bestWheelchair10KDuration)
  {
    ACHLogWorkouts();
    v149 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "bestWheelchair10KDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v151 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v151;
      _os_log_impl(&dword_21407B000, v149, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair 10K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "bestWheelchair10KDuration");
    self->_bestWheelchair10KDuration = v153;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "bestHalfMarathonDuration");
  v156 = v155;
  bestHalfMarathonDuration = self->_bestHalfMarathonDuration;

  if (v156 < bestHalfMarathonDuration)
  {
    ACHLogWorkouts();
    v158 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "bestHalfMarathonDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v160 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v160;
      _os_log_impl(&dword_21407B000, v158, OS_LOG_TYPE_DEFAULT, "Updated best Half Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "bestHalfMarathonDuration");
    self->_bestHalfMarathonDuration = v162;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "bestMarathonDuration");
  v165 = v164;
  bestMarathonDuration = self->_bestMarathonDuration;

  if (v165 < bestMarathonDuration)
  {
    ACHLogWorkouts();
    v167 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "bestMarathonDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v169 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v169;
      _os_log_impl(&dword_21407B000, v167, OS_LOG_TYPE_DEFAULT, "Updated best Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "bestMarathonDuration");
    self->_bestMarathonDuration = v171;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "bestWheelchairHalfMarathonDuration");
  v174 = v173;
  bestWheelchairHalfMarathonDuration = self->_bestWheelchairHalfMarathonDuration;

  if (v174 < bestWheelchairHalfMarathonDuration)
  {
    ACHLogWorkouts();
    v176 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "bestWheelchairHalfMarathonDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v178 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v178;
      _os_log_impl(&dword_21407B000, v176, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair Half Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "bestWheelchairHalfMarathonDuration");
    self->_bestWheelchairHalfMarathonDuration = v180;

  }
  -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "bestWheelchairMarathonDuration");
  v183 = v182;
  bestWheelchairMarathonDuration = self->_bestWheelchairMarathonDuration;

  if (v183 < bestWheelchairMarathonDuration)
  {
    ACHLogWorkouts();
    v185 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "bestWheelchairMarathonDuration");
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      v187 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v233 = v187;
      _os_log_impl(&dword_21407B000, v185, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    -[ACHWorkoutEvaluationEnvironment workout](v74, "workout");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "bestWheelchairMarathonDuration");
    self->_bestWheelchairMarathonDuration = v189;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_client_earnedInstancesForWorkoutsInDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ACHWorkoutIterator *v17;
  void *v18;
  ACHWorkoutIterator *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__28;
  v52 = __Block_byref_object_dispose__28;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a4;
  v8 = objc_msgSend(v7, "maximumRangeOfUnit:", 512);
  v31 = v9;
  v10 = v8;
  v30 = v6;
  -[ACHWorkoutAwardingSource templateStore](self, "templateStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allTemplates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke;
  v47[3] = &unk_24D13C120;
  v47[4] = self;
  objc_msgSend(v12, "hk_filter:", v47);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  -[ACHWorkoutAwardingSource watchCountryCode](self, "watchCountryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [ACHWorkoutIterator alloc];
  -[ACHWorkoutAwardingSource healthStore](self, "healthStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ACHWorkoutIterator initWithHealthStore:](v17, "initWithHealthStore:", v18);

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__28;
  v45 = __Block_byref_object_dispose__28;
  v46 = 0;
  v20 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_2;
  v33[3] = &unk_24D13D170;
  v33[4] = self;
  v38 = &v48;
  v21 = v13;
  v34 = v21;
  v22 = v7;
  v35 = v22;
  v39 = v10 + v31;
  v23 = v14;
  v36 = v23;
  v40 = v15;
  v24 = v16;
  v37 = v24;
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_3;
  v32[3] = &unk_24D13AEA8;
  v32[4] = &v41;
  -[ACHWorkoutIterator enumerateWorkoutsForDateInterval:handler:errorHandler:](v19, "enumerateWorkoutsForDateInterval:handler:errorHandler:", v30, v33, v32);
  v25 = (id)v42[5];
  v26 = v25;
  if (v25)
  {
    if (v29)
      *v29 = objc_retainAutorelease(v25);
    else
      _HKLogDroppedError();
  }

  v27 = (id)v49[5];
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v48, 8);
  return v27;
}

uint64_t __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlesTemplate:", a2);
}

void __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x2199C8FE0]();
  objc_msgSend(*(id *)(a1 + 32), "_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v3);

}

void __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_client_earnedInstancesForWorkouts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ACHWorkoutAwardingSource *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id obj;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v26, "maximumRangeOfUnit:", 512);
  v7 = v6;
  -[ACHWorkoutAwardingSource templateStore](self, "templateStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allTemplates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __63__ACHWorkoutAwardingSource__client_earnedInstancesForWorkouts___block_invoke;
  v32[3] = &unk_24D13C120;
  v32[4] = self;
  objc_msgSend(v9, "hk_filter:", v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v10;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  v13 = self;
  -[ACHWorkoutAwardingSource watchCountryCode](self, "watchCountryCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = v5 + v7;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x2199C8FE0]();
        -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:](v13, "_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:", v20, v27, v25, v26, v17, v11, v12, v14);
        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __63__ACHWorkoutAwardingSource__client_earnedInstancesForWorkouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlesTemplate:", a2);
}

- (id)_daemon_earnedInstancesForWorkouts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  NSObject *v50;
  id WeakRetained;
  void *v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  _BOOL8 v56;
  double bestElevationGainedHiking;
  NSObject *v58;
  ACHWorkoutEvaluationEnvironment *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  unint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  NSObject *v98;
  void *v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double best5KDuration;
  NSObject *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double best10KDuration;
  NSObject *v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  double bestWheelchair5KDuration;
  NSObject *v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double bestWheelchair10KDuration;
  NSObject *v126;
  void *v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  double bestHalfMarathonDuration;
  NSObject *v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  double bestMarathonDuration;
  NSObject *v140;
  void *v141;
  double v142;
  void *v143;
  double v144;
  double v145;
  double bestWheelchairHalfMarathonDuration;
  NSObject *v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  double v152;
  double bestWheelchairMarathonDuration;
  NSObject *v154;
  void *v155;
  double v156;
  uint64_t v157;
  void *v158;
  id v159;
  id v160;
  id v161;
  id v162;
  void *v163;
  id obj;
  uint64_t v166;
  id *location;
  uint64_t v168;
  ACHWorkoutAwardingSource *v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *context;
  uint64_t v182;
  os_unfair_lock_t lock;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  id v189;
  void *v190;
  id v191;
  ACHWorkoutEvaluationEnvironment *v192;
  uint64_t v193;
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[5];
  char v205[16];
  char v206[16];
  char v207[16];
  char v208[16];
  char v209[16];
  char v210[16];
  char v211[16];
  char v212[16];
  char v213[16];
  uint8_t v214[128];
  uint8_t buf[4];
  double v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  id v220;
  _BYTE v221[128];
  uint64_t v222;

  v222 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maximumRangeOfUnit:", 512);
  v9 = v8;
  -[ACHWorkoutAwardingSource templateStore](self, "templateStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allTemplates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = MEMORY[0x24BDAC760];
  v204[1] = 3221225472;
  v204[2] = __63__ACHWorkoutAwardingSource__daemon_earnedInstancesForWorkouts___block_invoke;
  v204[3] = &unk_24D13C120;
  v204[4] = self;
  objc_msgSend(v11, "hk_filter:", v204);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = v12;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKFirstDayOfWeekForWeeklyGoalCalculations();
  -[ACHWorkoutAwardingSource watchCountryCode](self, "watchCountryCode");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  obj = v4;
  v173 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v221, 16);
  if (v173)
  {
    v168 = v7 + v9;
    lock = &self->_lock;
    v166 = *(_QWORD *)v201;
    location = (id *)&self->_profile;
    v187 = *MEMORY[0x24BE012A8];
    v186 = v5;
    v169 = self;
    v170 = v6;
    v188 = v13;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v201 != v166)
          objc_enumerationMutation(obj);
        v182 = v14;
        v15 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v14);
        context = (void *)MEMORY[0x2199C8FE0]();
        ACHLogWorkouts();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v216 = *(double *)&v15;
          _os_log_debug_impl(&dword_21407B000, v16, OS_LOG_TYPE_DEBUG, "Evaluating workout %@", buf, 0xCu);
        }

        objc_msgSend(v15, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "components:fromDate:", v187, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v180 = v18;
        ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v18, v171, v172);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ACHLogWorkouts();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v157 = objc_msgSend(v19, "count");
          objc_msgSend(v15, "endDate");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "valueForKey:", CFSTR("uniqueName"));
          v159 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v216 = *(double *)&v157;
          v217 = 2114;
          v218 = (uint64_t)v158;
          v219 = 2114;
          v220 = v159;
          _os_log_debug_impl(&dword_21407B000, v20, OS_LOG_TYPE_DEBUG, "Found %lu templates for date %{public}@: %{public}@", buf, 0x20u);

        }
        -[ACHWorkoutAwardingSource workoutUtility](self, "workoutUtility");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v15, "workoutActivityType");
        objc_msgSend(v15, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "numberOfFirstPartyWorkoutsWithDuration:withType:endingOnOrBeforeDate:", v22, v23, 300.0);

        ACHLogWorkouts();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          v160 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v216 = *(double *)&v24;
          v217 = 2114;
          v218 = (uint64_t)v160;
          _os_log_debug_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEBUG, "Found %lu previous workouts of type %{public}@ over 5 minutes", buf, 0x16u);

        }
        objc_msgSend(v15, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar();
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "hk_dateByAddingDays:toDate:", v168, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v28;
        objc_msgSend(v28, "earlierDate:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v179 = (void *)v27;
        v177 = (void *)v30;
        v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v27, v30);
        -[ACHWorkoutAwardingSource workoutUtility](self, "workoutUtility");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "numberOfFirstPartyWorkoutsWithDuration:containedInInterval:", v31, 300.0);

        ACHLogWorkouts();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v216 = *(double *)&v33;
          v217 = 2114;
          v218 = v31;
          _os_log_debug_impl(&dword_21407B000, v34, OS_LOG_TYPE_DEBUG, "Found %lu workouts this week over 5 minutes (week is %{public}@)", buf, 0x16u);
        }
        v176 = (void *)v31;

        -[ACHWorkoutAwardingSource workoutUtility](self, "workoutUtility");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v15, "workoutActivityType");
        objc_msgSend(v15, "endDate");
        v190 = v15;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:", v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = v38;
        objc_msgSend(v38, "doubleValueForUnit:", v39);
        v41 = v40;

        ACHLogWorkouts();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v216 = v41;
          v217 = 2114;
          v218 = (uint64_t)v161;
          _os_log_debug_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEBUG, "Found %lf kcal as best energy value for workout type %{public}@", buf, 0x16u);

        }
        -[ACHWorkoutAwardingSource workoutUtility](self, "workoutUtility");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v15, "workoutActivityType");
        objc_msgSend(v15, "endDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:", v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = v46;
        objc_msgSend(v46, "doubleValueForUnit:", v47);
        v49 = v48;

        ACHLogWorkouts();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          v162 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v216 = v49;
          v217 = 2114;
          v218 = (uint64_t)v162;
          _os_log_debug_impl(&dword_21407B000, v50, OS_LOG_TYPE_DEBUG, "Found %lf km as best distance for workout type %{public}@", buf, 0x16u);

        }
        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(v15, "endDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = 0;
        v53 = ACHExperienceTypeForDateWithProfile(WeakRetained, v6, v52, &v199);
        v54 = v199;

        v185 = v54;
        if (v54)
        {
          ACHLogWorkouts();
          v55 = objc_claimAutoreleasedReturnValue();
          v13 = v188;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v216 = *(double *)&v54;
            _os_log_impl(&dword_21407B000, v55, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", buf, 0xCu);
          }

          v53 = 3;
        }
        else
        {
          v13 = v188;
        }
        v56 = -[ACHWorkoutAwardingSource _isMetricLocale](self, "_isMetricLocale");
        os_unfair_lock_lock(lock);
        if (objc_msgSend(v190, "workoutActivityType") == 24)
          bestElevationGainedHiking = self->_bestElevationGainedHiking;
        else
          bestElevationGainedHiking = 2.22507386e-308;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Best Elevation Gain: %lf, Best 5K: %lf, Best 10K: %lf, Best Wheelchair 5k: %lf, Best Wheelchair 10k: %lf, Best Half Marathon: %lf, Best Marathon: %lf, Best Wheelchair Half Marathon: %lf, Best Wheelchair Marathon: %lf"), *(_QWORD *)&bestElevationGainedHiking, *(_QWORD *)&self->_best5KDuration, *(_QWORD *)&self->_best10KDuration, *(_QWORD *)&self->_bestWheelchair5KDuration, *(_QWORD *)&self->_bestWheelchair10KDuration, *(_QWORD *)&self->_bestHalfMarathonDuration, *(_QWORD *)&self->_bestMarathonDuration, *(_QWORD *)&self->_bestWheelchairHalfMarathonDuration, *(_QWORD *)&self->_bestWheelchairMarathonDuration);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        ACHLogWorkouts();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v216 = *(double *)&v184;
          _os_log_debug_impl(&dword_21407B000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v59 = -[ACHWorkoutEvaluationEnvironment initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:]([ACHWorkoutEvaluationEnvironment alloc], "initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:", v190, v24, v33, v53, v56, v41, v49, bestElevationGainedHiking, self->_best5KDuration, self->_best10KDuration, self->_bestWheelchair5KDuration, self->_bestWheelchair10KDuration, self->_bestHalfMarathonDuration, *(_QWORD *)&self->_bestMarathonDuration,
                *(_QWORD *)&self->_bestWheelchairHalfMarathonDuration,
                *(_QWORD *)&self->_bestWheelchairMarathonDuration);
        v60 = objc_alloc_init(MEMORY[0x24BE01838]);
        v195 = 0u;
        v196 = 0u;
        v197 = 0u;
        v198 = 0u;
        v61 = v19;
        v62 = v60;
        v63 = v61;
        v64 = 0x24BDBC000uLL;
        v189 = v61;
        v194 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v195, v214, 16);
        if (v194)
        {
          v192 = v59;
          v193 = *(_QWORD *)v196;
          v191 = v60;
          do
          {
            for (i = 0; i != v194; ++i)
            {
              if (*(_QWORD *)v196 != v193)
                objc_enumerationMutation(v63);
              v66 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
              objc_msgSend(v62, "validateTemplate:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v67, "isValid") & 1) != 0)
              {
                objc_msgSend(v66, "uniqueName");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKeyedSubscript:", v68);
                v69 = objc_claimAutoreleasedReturnValue();

                if (!v69)
                {
                  objc_msgSend(v66, "gracePredicate");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = v70;
                  if (v70)
                  {
                    v72 = v70;
                  }
                  else
                  {
                    objc_msgSend(v66, "predicate");
                    v72 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v74 = v72;

                  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v74);
                  v69 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "uniqueName");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", v69, v75);

                  v59 = v192;
                }
                if (-[NSObject evaluateWithObject:](v69, "evaluateWithObject:", v59))
                {
                  ACHLogWorkouts();
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v66, "uniqueName");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v216 = *(double *)&v77;
                    v217 = 2112;
                    v218 = (uint64_t)v190;
                    _os_log_impl(&dword_21407B000, v76, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for workout %@", buf, 0x16u);

                  }
                  ACHLogWorkouts();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v216 = *(double *)&v66;
                    _os_log_debug_impl(&dword_21407B000, v78, OS_LOG_TYPE_DEBUG, "full template: %{public}@", buf, 0xCu);
                  }

                  v79 = objc_alloc_init(MEMORY[0x24BE01830]);
                  objc_msgSend(v66, "uniqueName");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "setTemplateUniqueName:", v80);

                  objc_msgSend(*(id *)(v64 + 3656), "hk_gregorianCalendar");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v190, "endDate");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "components:fromDate:", v187, v82);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "setEarnedDateComponents:", v83);

                  objc_msgSend(v66, "graceValueExpression");
                  v84 = (id)objc_claimAutoreleasedReturnValue();
                  if (v84
                    || (objc_msgSend(v66, "valueExpression"),
                        v84 = (id)objc_claimAutoreleasedReturnValue(),
                        v84,
                        v84))
                  {
                    objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v84);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "expressionValueWithObject:context:", v192, 0);
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v86, "doubleValue");
                      v88 = v87;
                      v89 = (void *)MEMORY[0x24BDD3E50];
                      objc_msgSend(v66, "canonicalUnit");
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v89, "quantityWithUnit:doubleValue:", v90, v88);
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v79, "setValue:", v91);

                      v64 = 0x24BDBC000;
                      v5 = v186;
                    }

                  }
                  objc_msgSend(v5, "addObject:", v79);
                  ACHLogWorkouts();
                  v92 = objc_claimAutoreleasedReturnValue();
                  v13 = v188;
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v66, "uniqueName");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v216 = *(double *)&v93;
                    v217 = 2112;
                    v218 = (uint64_t)v79;
                    _os_log_impl(&dword_21407B000, v92, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);

                  }
                  v63 = v189;
                  v59 = v192;
                }
                v62 = v191;
              }
              else
              {
                ACHLogAwardEngine();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v66, "uniqueName");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v216 = *(double *)&v73;
                  _os_log_impl(&dword_21407B000, v69, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);

                }
              }

            }
            v194 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v195, v214, 16);
          }
          while (v194);
        }

        self = v169;
        if (objc_msgSend(v190, "workoutActivityType") == 24)
        {
          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "elevationGained");
          v96 = v95;
          v97 = v169->_bestElevationGainedHiking;

          if (v96 > v97)
          {
            ACHLogWorkouts();
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.9((uint64_t)v213, (uint64_t)v59);

            -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "elevationGained");
            v169->_bestElevationGainedHiking = v100;

          }
        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "best5KDuration");
        v103 = v102;
        best5KDuration = v169->_best5KDuration;

        if (v103 < best5KDuration)
        {
          ACHLogWorkouts();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.8((uint64_t)v212, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "best5KDuration");
          v169->_best5KDuration = v107;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "best10KDuration");
        v110 = v109;
        best10KDuration = v169->_best10KDuration;

        v6 = v170;
        if (v110 < best10KDuration)
        {
          ACHLogWorkouts();
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.7((uint64_t)v211, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "best10KDuration");
          v169->_best10KDuration = v114;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "bestWheelchair5KDuration");
        v117 = v116;
        bestWheelchair5KDuration = v169->_bestWheelchair5KDuration;

        if (v117 < bestWheelchair5KDuration)
        {
          ACHLogWorkouts();
          v119 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.6((uint64_t)v210, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "bestWheelchair5KDuration");
          v169->_bestWheelchair5KDuration = v121;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "bestWheelchair10KDuration");
        v124 = v123;
        bestWheelchair10KDuration = v169->_bestWheelchair10KDuration;

        if (v124 < bestWheelchair10KDuration)
        {
          ACHLogWorkouts();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.5((uint64_t)v209, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "bestWheelchair10KDuration");
          v169->_bestWheelchair10KDuration = v128;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "bestHalfMarathonDuration");
        v131 = v130;
        bestHalfMarathonDuration = v169->_bestHalfMarathonDuration;

        if (v131 < bestHalfMarathonDuration)
        {
          ACHLogWorkouts();
          v133 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.4((uint64_t)v208, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "bestHalfMarathonDuration");
          v169->_bestHalfMarathonDuration = v135;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "bestMarathonDuration");
        v138 = v137;
        bestMarathonDuration = v169->_bestMarathonDuration;

        if (v138 < bestMarathonDuration)
        {
          ACHLogWorkouts();
          v140 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.3((uint64_t)v207, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "bestMarathonDuration");
          v169->_bestMarathonDuration = v142;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "bestWheelchairHalfMarathonDuration");
        v145 = v144;
        bestWheelchairHalfMarathonDuration = v169->_bestWheelchairHalfMarathonDuration;

        if (v145 < bestWheelchairHalfMarathonDuration)
        {
          ACHLogWorkouts();
          v147 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.2((uint64_t)v206, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "bestWheelchairHalfMarathonDuration");
          v169->_bestWheelchairHalfMarathonDuration = v149;

        }
        -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "bestWheelchairMarathonDuration");
        v152 = v151;
        bestWheelchairMarathonDuration = v169->_bestWheelchairMarathonDuration;

        if (v152 < bestWheelchairMarathonDuration)
        {
          ACHLogWorkouts();
          v154 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.1((uint64_t)v205, (uint64_t)v59);

          -[ACHWorkoutEvaluationEnvironment workout](v59, "workout");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "bestWheelchairMarathonDuration");
          v169->_bestWheelchairMarathonDuration = v156;

        }
        os_unfair_lock_unlock(lock);

        objc_autoreleasePoolPop(context);
        v14 = v182 + 1;
      }
      while (v182 + 1 != v173);
      v173 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v221, 16);
    }
    while (v173);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  return v163;
}

uint64_t __63__ACHWorkoutAwardingSource__daemon_earnedInstancesForWorkouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlesTemplate:", a2);
}

- (BOOL)_isMetricLocale
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[ACHWorkoutAwardingSource injectedIsMetricLocale](self, "injectedIsMetricLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ACHWorkoutAwardingSource injectedIsMetricLocale](self, "injectedIsMetricLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usesMetricSystem");
  }
  v6 = v5;

  return v6;
}

- (id)watchCountryCode
{
  void *v3;

  -[ACHWorkoutAwardingSource watchCountryCodeOverride](self, "watchCountryCodeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHWorkoutAwardingSource watchCountryCodeOverride](self, "watchCountryCodeOverride");
  else
    ACHPairedWatchCountryCode();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_injectIsMetricLocale:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHWorkoutAwardingSource setInjectedIsMetricLocale:](self, "setInjectedIsMetricLocale:", v4);

}

- (ACHAwardsClient)client
{
  return (ACHAwardsClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
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

- (ACHDataStore)dataStore
{
  return (ACHDataStore *)objc_loadWeakRetained((id *)&self->_dataStore);
}

- (void)setDataStore:(id)a3
{
  objc_storeWeak((id *)&self->_dataStore, a3);
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

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (void)setWorkoutClient:(id)a3
{
  objc_storeWeak((id *)&self->_workoutClient, a3);
}

- (ACHWorkoutUtility)workoutUtility
{
  return (ACHWorkoutUtility *)objc_loadWeakRetained((id *)&self->_workoutUtility);
}

- (void)setWorkoutUtility:(id)a3
{
  objc_storeWeak((id *)&self->_workoutUtility, a3);
}

- (HKAnchoredObjectQuery)workoutQuery
{
  return self->_workoutQuery;
}

- (void)setWorkoutQuery:(id)a3
{
  objc_storeStrong((id *)&self->_workoutQuery, a3);
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

- (double)bestElevationGainedHiking
{
  return self->_bestElevationGainedHiking;
}

- (void)setBestElevationGainedHiking:(double)a3
{
  self->_bestElevationGainedHiking = a3;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (void)setBest5KDuration:(double)a3
{
  self->_best5KDuration = a3;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (void)setBest10KDuration:(double)a3
{
  self->_best10KDuration = a3;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (void)setBestWheelchair5KDuration:(double)a3
{
  self->_bestWheelchair5KDuration = a3;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (void)setBestWheelchair10KDuration:(double)a3
{
  self->_bestWheelchair10KDuration = a3;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (void)setBestHalfMarathonDuration:(double)a3
{
  self->_bestHalfMarathonDuration = a3;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (void)setBestMarathonDuration:(double)a3
{
  self->_bestMarathonDuration = a3;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (void)setBestWheelchairHalfMarathonDuration:(double)a3
{
  self->_bestWheelchairHalfMarathonDuration = a3;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (void)setBestWheelchairMarathonDuration:(double)a3
{
  self->_bestWheelchairMarathonDuration = a3;
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (id)initialResultsHandler
{
  return self->_initialResultsHandler;
}

- (void)setInitialResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (NSString)watchCountryCodeOverride
{
  return self->_watchCountryCodeOverride;
}

- (void)setWatchCountryCodeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_watchCountryCodeOverride, a3);
}

- (NSNumber)injectedIsMetricLocale
{
  return self->_injectedIsMetricLocale;
}

- (void)setInjectedIsMetricLocale:(id)a3
{
  objc_storeStrong((id *)&self->_injectedIsMetricLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedIsMetricLocale, 0);
  objc_storeStrong((id *)&self->_watchCountryCodeOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong(&self->_initialResultsHandler, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_workoutQuery, 0);
  objc_destroyWeak((id *)&self->_workoutUtility);
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error starting workout query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_211_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error from workouts query update: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)earnedInstancesForHistoricalInterval:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_21407B000, v1, OS_LOG_TYPE_ERROR, "Error performing historical run for workouts in date interval %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)earnedInstancesForHistoricalInterval:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "WorkoutAwardingSource error in database transaction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_progressEnvironment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error counting workouts in fitness week: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "WorkoutAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error getting best workout distance: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error getting best workout energy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error counting first party workouts in fitness week: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error counting first party workouts: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_client_appendEarnedInstancesForWorkout:(NSObject *)a3 toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.6(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a1, "count");
  objc_msgSend(a2, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForKey:", CFSTR("uniqueName"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_debug_impl(&dword_21407B000, a3, OS_LOG_TYPE_DEBUG, "Found %lu templates for date %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);

}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestWheelchairMarathonDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Wheelchair Marathon duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestWheelchairHalfMarathonDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Wheelchair Half Marathon duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestMarathonDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Marathon duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestHalfMarathonDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Half Marathon duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.5(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestWheelchair10KDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Wheelchair 10K duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.6(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestWheelchair5KDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best Wheelchair 5K duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.7(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "best10KDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best 10K duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.8(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "best5KDuration");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best 5K duration to %lf");

  OUTLINED_FUNCTION_2_3();
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.9(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elevationGained");
  OUTLINED_FUNCTION_6_0(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v4, v5, "Updated best elevation gain to %lf");

  OUTLINED_FUNCTION_2_3();
}

@end
