@implementation ACHMindfulMinutesAwardingSource

- (BOOL)providesProgressForTemplate:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "triggers") >> 10) & 1;
}

- (ACHMindfulMinutesAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 workoutClient:(id)a5 awardingEngine:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ACHMindfulMinutesAwardingSource *v21;
  ACHMindfulMinutesAwardingSource *v22;
  uint64_t v23;
  NSCalendar *calendar;
  uint64_t v25;
  OS_dispatch_queue *internalQueue;
  objc_super v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)ACHMindfulMinutesAwardingSource;
  v21 = -[ACHMindfulMinutesAwardingSource init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_client, v15);
    objc_storeStrong((id *)&v22->_healthStore, a4);
    objc_storeWeak((id *)&v22->_workoutClient, v17);
    objc_storeWeak((id *)&v22->_engine, v18);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    objc_storeWeak((id *)&v22->_templateStore, v19);
    v22->_creatorDevice = a8;
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v23 = objc_claimAutoreleasedReturnValue();
    calendar = v22->_calendar;
    v22->_calendar = (NSCalendar *)v23;

    HKCreateSerialDispatchQueue();
    v25 = objc_claimAutoreleasedReturnValue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v25;

  }
  return v22;
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
  v8 = __43__ACHMindfulMinutesAwardingSource_activate__block_invoke;
  v9 = &unk_24D13A2C0;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, v4, &v6);

  -[ACHMindfulMinutesAwardingSource _queue_startSampleQueryIfNecessary](self, "_queue_startSampleQueryIfNecessary", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__ACHMindfulMinutesAwardingSource_activate__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Received protected data availabilty change to state: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "_queue_startSampleQueryIfNecessary");

  }
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHMindfulMinutesAwardingSource;
  -[ACHMindfulMinutesAwardingSource dealloc](&v3, sel_dealloc);
}

- (void)_queue_startSampleQueryIfNecessary
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_sampleQuery)
  {
    objc_initWeak(&location, self);
    -[ACHMindfulMinutesAwardingSource internalQueue](self, "internalQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __69__ACHMindfulMinutesAwardingSource__queue_startSampleQueryIfNecessary__block_invoke;
    v4[3] = &unk_24D13A2E8;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __69__ACHMindfulMinutesAwardingSource__queue_startSampleQueryIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startSampleQuery");

}

- (void)_startSampleQuery
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  HKAnchoredObjectQuery *v7;
  HKAnchoredObjectQuery *sampleQuery;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3E90], "latestAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke;
  v11[3] = &unk_24D13A310;
  objc_copyWeak(&v12, &location);
  v7 = (HKAnchoredObjectQuery *)objc_msgSend(v4, "initWithType:predicate:anchor:limit:resultsHandler:", v3, 0, v5, 0, v11);
  sampleQuery = self->_sampleQuery;
  self->_sampleQuery = v7;

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_193;
  v9[3] = &unk_24D13A310;
  objc_copyWeak(&v10, &location);
  -[HKAnchoredObjectQuery setUpdateHandler:](self->_sampleQuery, "setUpdateHandler:", v9);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_sampleQuery);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;

  v7 = a6;
  if (v7)
  {
    ACHLogWorkouts();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_cold_1((uint64_t)v7, v8, v9);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_stopSampleQuery");

  }
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_193(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id WeakRetained;

  v8 = a3;
  v9 = a6;
  if (v9)
  {
    ACHLogAwardEngine();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_193_cold_1((uint64_t)v9, v10, v11);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_stopSampleQuery");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "sessionAdded:", v8);
  }

}

- (void)_stopSampleQuery
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ACHMindfulMinutesAwardingSource__stopSampleQuery__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __51__ACHMindfulMinutesAwardingSource__stopSampleQuery__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stopQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

}

- (void)sessionAdded:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__ACHMindfulMinutesAwardingSource_sessionAdded___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __48__ACHMindfulMinutesAwardingSource_sessionAdded___block_invoke(uint64_t a1)
{
  int IsAppleWatch;
  id *v3;
  id WeakRetained;

  IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  v3 = *(id **)(a1 + 32);
  if (IsAppleWatch)
  {
    objc_msgSend(v3, "_runIncrementalEvaluation:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(v3 + 6);
    objc_msgSend(WeakRetained, "requestProgressUpdateForProgressProvider:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)isAppleWatch
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[ACHMindfulMinutesAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHMindfulMinutesAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");
  }
  v6 = v5;

  return v6;
}

- (NSString)watchCountryCode
{
  void *v3;

  -[ACHMindfulMinutesAwardingSource overrideWatchCountryCode](self, "overrideWatchCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHMindfulMinutesAwardingSource overrideWatchCountryCode](self, "overrideWatchCountryCode");
  else
    ACHPairedWatchCountryCode();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)currentDate
{
  void *v3;

  -[ACHMindfulMinutesAwardingSource currentDateOverride](self, "currentDateOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHMindfulMinutesAwardingSource currentDateOverride](self, "currentDateOverride");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_progressEnvironement
{
  ACHMindfulMinutesAwardingEnvironment *v3;
  HKHealthStore *healthStore;
  id WeakRetained;
  NSCalendar *calendar;
  void *v7;
  ACHMindfulMinutesAwardingEnvironment *v8;

  v3 = [ACHMindfulMinutesAwardingEnvironment alloc];
  healthStore = self->_healthStore;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  calendar = self->_calendar;
  -[ACHMindfulMinutesAwardingSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ACHMindfulMinutesAwardingEnvironment initWithHealthStore:workoutClient:calendar:currentDate:](v3, "initWithHealthStore:workoutClient:calendar:currentDate:", healthStore, WeakRetained, calendar, v7);

  return v8;
}

- (id)_relevantTemplatesForMindfulSession:(id)a3
{
  id v4;
  void *v5;
  NSCalendar *calendar;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[ACHMindfulMinutesAwardingSource watchCountryCode](self, "watchCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  objc_msgSend(WeakRetained, "availableTemplatesForDateComponents:countryCode:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

unint64_t __71__ACHMindfulMinutesAwardingSource__relevantTemplatesForMindfulSession___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "triggers") >> 10) & 1;
}

- (id)_queue_evaluateSession:(id)a3 shouldLog:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSCalendar *calendar;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  ACHMindfulMinutesAwardingEnvironment *v15;
  HKHealthStore *healthStore;
  id WeakRetained;
  NSCalendar *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v45;
  _BOOL4 v46;
  id v47;
  void *v48;
  uint64_t v49;
  id obj;
  ACHMindfulMinutesAwardingEnvironment *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v4 = a4;
  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACHMindfulMinutesAwardingSource internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  calendar = self->_calendar;
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](calendar, "components:fromDate:", 28, v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACHMindfulMinutesAwardingSource _relevantTemplatesForMindfulSession:](self, "_relevantTemplatesForMindfulSession:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v4;
  if (v4)
  {
    ACHLogAwardEngine();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      ACHTriggerOptionsToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v58 = v12;
      v59 = 2114;
      v60 = v13;
      v61 = 2114;
      v62 = v48;
      v63 = 2112;
      v64 = v14;
      _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Evaluating triggers %@ for %{public}@ templates using activity summary with date %{public}@, values: %@", buf, 0x2Au);

    }
  }
  v15 = [ACHMindfulMinutesAwardingEnvironment alloc];
  healthStore = self->_healthStore;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  v18 = self->_calendar;
  v45 = v6;
  objc_msgSend(v6, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[ACHMindfulMinutesAwardingEnvironment initWithHealthStore:workoutClient:calendar:currentDate:](v15, "initWithHealthStore:workoutClient:calendar:currentDate:", healthStore, WeakRetained, v18, v19);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v10;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  v21 = v46;
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v53;
    v24 = 0x24BDD1000uLL;
    do
    {
      v25 = 0;
      v49 = v22;
      do
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v25);
        objc_msgSend(v26, "gracePredicate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v29 = v27;
        }
        else
        {
          objc_msgSend(v26, "predicate");
          v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        v30 = v29;

        objc_msgSend(*(id *)(v24 + 1880), "predicateWithFormat:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "allowEvaluation");
        if (objc_msgSend(v31, "evaluateWithObject:", v51))
        {
          v32 = objc_alloc_init(MEMORY[0x24BE01830]);
          objc_msgSend(v26, "uniqueName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTemplateUniqueName:", v33);

          objc_msgSend(v48, "year");
          objc_msgSend(v48, "month");
          objc_msgSend(v48, "day");
          ACHDateComponentsForYearMonthDay();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setEarnedDateComponents:", v34);

          objc_msgSend(v26, "graceValueExpression");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35 || (objc_msgSend(v26, "valueExpression"), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v26, "canonicalUnit");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "expressionValueWithObject:context:", v51, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                v39 = (void *)MEMORY[0x24BDD3E50];
                objc_msgSend(v26, "canonicalUnit");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "doubleValue");
                objc_msgSend(v39, "quantityWithUnit:doubleValue:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setValue:", v41);

                v21 = v46;
              }

            }
          }
          if (v21)
          {
            ACHLogAwardEngine();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v32;
              _os_log_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Created earned instance: %@", buf, 0xCu);
            }

            -[ACHMindfulMinutesAwardingEnvironment logValues](v51, "logValues");
          }
          objc_msgSend(v47, "addObject:", v32);

          v24 = 0x24BDD1000;
          v22 = v49;
        }

        ++v25;
      }
      while (v22 != v25);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v22);
  }

  v43 = (void *)objc_msgSend(v47, "copy");
  return v43;
}

- (void)_runIncrementalEvaluation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogAwardEngine();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Running incremental evaluation for %lu sessions", buf, 0xCu);
  }

  -[ACHMindfulMinutesAwardingSource engine](self, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMindfulMinutesAwardingSource uniqueName](self, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke;
  v9[3] = &unk_24D13A3F0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "requestIncrementalEvaluationForSource:evaluationBlock:", v7, v9);

}

id __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke_204;
  block[3] = &unk_24D13A3C8;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v14 = &v15;
  dispatch_sync(v5, block);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v16[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "progressEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestProgressUpdateForProgressProvider:", *(_QWORD *)(a1 + 32));

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke_204(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_queue_evaluateSession:shouldLog:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), 1, (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSString)uniqueName
{
  return (NSString *)CFSTR("MindfulMinutesSource");
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  void *v17;
  ACHMindfulMinutesAwardingSource *v18;
  id v19;
  __int128 *p_buf;
  id *v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACHMindfulMinutesAwardingSource internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  ACHLogAwardEngine();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Running historical evaluation for date interval %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  internalQueue = self->_internalQueue;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke;
  v17 = &unk_24D13A460;
  v18 = self;
  v11 = v6;
  v19 = v11;
  p_buf = &buf;
  v21 = a4;
  dispatch_sync(internalQueue, &v14);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke(_QWORD *a1)
{
  ACHMindfulSessionIterator *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v2 = -[ACHMindfulSessionIterator initWithHealthStore:]([ACHMindfulSessionIterator alloc], "initWithHealthStore:", *(_QWORD *)(a1[4] + 24));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_2;
  v7[3] = &unk_24D13A418;
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v7[4] = a1[4];
  v7[5] = v4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v6[4] = v5;
  -[ACHMindfulSessionIterator enumerateMindfulSessionsForDateInterval:handler:errorHandler:](v2, "enumerateMindfulSessionsForDateInterval:handler:errorHandler:", v3, v7, v6);

}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x2199C8FE0]();
  objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateSession:shouldLog:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v4);

  objc_autoreleasePoolPop(v3);
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  id v6;

  v3 = a2;
  ACHLogAwardEngine();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3_cold_1(v3, v4);

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v3;
  if (v6)
  {
    if (v5)
      *v5 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  return objc_alloc_init(MEMORY[0x24BDBCF20]);
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHMindfulMinutesAwardingSource internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__ACHMindfulMinutesAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __81__ACHMindfulMinutesAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "_progressEnvironement");
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
  void *v15;

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
  objc_msgSend(v11, "allowEvaluation");
  objc_msgSend(v11, "expressionValueWithObject:context:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(v5, "canonicalUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMindfulMinutesAwardingSource currentDate](self, "currentDate");
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
    objc_msgSend(v16, "allowEvaluation");
    objc_msgSend(v16, "expressionValueWithObject:context:", v7, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(v6, "canonicalUnit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

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

- (NSArray)dataStorePropertyKeys
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSDictionary)dataStoreProperties
{
  return (NSDictionary *)MEMORY[0x24BDBD1B8];
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

- (ACHAwardsWorkoutClient)workoutClient
{
  return (ACHAwardsWorkoutClient *)objc_loadWeakRetained((id *)&self->_workoutClient);
}

- (void)setWorkoutClient:(id)a3
{
  objc_storeWeak((id *)&self->_workoutClient, a3);
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

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSString)overrideWatchCountryCode
{
  return self->_overrideWatchCountryCode;
}

- (void)setOverrideWatchCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_overrideWatchCountryCode, a3);
}

- (void)setWatchCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_watchCountryCode, a3);
}

- (NSNumber)overrideIsAppleWatch
{
  return self->_overrideIsAppleWatch;
}

- (void)setOverrideIsAppleWatch:(id)a3
{
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, a3);
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (BOOL)isObservingSummaryUpdates
{
  return self->_isObservingSummaryUpdates;
}

- (void)setIsObservingSummaryUpdates:(BOOL)a3
{
  self->_isObservingSummaryUpdates = a3;
}

- (HKAnchoredObjectQuery)sampleQuery
{
  return self->_sampleQuery;
}

- (void)setSampleQuery:(id)a3
{
  objc_storeStrong((id *)&self->_sampleQuery, a3);
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleQuery, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_watchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, a3, "[ACHMindfulMinutesAwardingSource] Error starting sample query: %@", (uint8_t *)&v3);
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_193_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, a3, "[ACHMindfulMinutesAwardingSource] Error from sample query update: %@", (uint8_t *)&v3);
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, v4, "[ACHMindfulMinutesAwardingSource] Failed to query all mindfulness sessions: %@", (uint8_t *)&v5);

}

@end
