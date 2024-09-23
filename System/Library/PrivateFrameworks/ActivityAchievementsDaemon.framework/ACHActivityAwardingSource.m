@implementation ACHActivityAwardingSource

void __75__ACHActivityAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] received request for progress update.", buf, 2u);
    }

    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_progressUpdateForTemplate:environment:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v5, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            -[NSObject addObject:](v3, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "progressEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject copy](v3, "copy");
    objc_msgSend(v12, "processAchievementProgressUpdates:", v13);

  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] received request for progress update but progressDataProvider isn't ready, skipping...", buf, 2u);
  }

}

- (ACHActivityAwardingDataProvider)progressDataProvider
{
  return self->_progressDataProvider;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__ACHActivityAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = +[ACHActivityTriggerGenerator allPossibleTriggers](ACHActivityTriggerGenerator, "allPossibleTriggers");
  v5 = objc_msgSend(v3, "triggers");

  return (v5 & v4) != 0;
}

- (ACHActivityAwardingSource)initWithHealthStore:(id)a3 dataStore:(id)a4 templateStore:(id)a5 pauseRingsCoordinator:(id)a6 awardingEngine:(id)a7 progressEngine:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ACHActivityAwardingSource *v21;
  ACHActivityAwardingSource *v22;
  ACHActivityAwardingDataProvider *v23;
  ACHActivityAwardingDataProvider *dataProvider;
  ACHActivityAwardingDataProvider *v25;
  ACHActivityAwardingDataProvider *progressDataProvider;
  ACHActivityTriggerGenerator *v27;
  ACHActivityTriggerGenerator *triggerGenerator;
  ACHActivityAwardingEnvironment *v29;
  ACHActivityAwardingEnvironment *environment;
  ACHActivityAwardingEnvironment *v31;
  ACHActivityAwardingEnvironment *progressEnvironment;
  uint64_t v33;
  OS_dispatch_queue *internalQueue;
  uint64_t v35;
  NSCalendar *gregorianUTCCalendar;
  ACHActivitySummaryIterator *v37;
  ACHActivitySummaryIterator *activitySummaryIterator;
  id WeakRetained;
  objc_super v41;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v41.receiver = self;
  v41.super_class = (Class)ACHActivityAwardingSource;
  v21 = -[ACHActivityAwardingSource init](&v41, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_healthStore, a3);
    objc_storeWeak((id *)&v22->_dataStore, v16);
    objc_storeWeak((id *)&v22->_templateStore, v17);
    objc_storeStrong((id *)&v22->_pauseRingsCoordinator, a6);
    objc_storeWeak((id *)&v22->_engine, v19);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    v23 = objc_alloc_init(ACHActivityAwardingDataProvider);
    dataProvider = v22->_dataProvider;
    v22->_dataProvider = v23;

    v25 = objc_alloc_init(ACHActivityAwardingDataProvider);
    progressDataProvider = v22->_progressDataProvider;
    v22->_progressDataProvider = v25;

    v27 = -[ACHActivityTriggerGenerator initWithPauseRingsCoordinator:]([ACHActivityTriggerGenerator alloc], "initWithPauseRingsCoordinator:", v18);
    triggerGenerator = v22->_triggerGenerator;
    v22->_triggerGenerator = v27;

    v29 = -[ACHActivityAwardingEnvironment initWithDataProvider:]([ACHActivityAwardingEnvironment alloc], "initWithDataProvider:", v22->_dataProvider);
    environment = v22->_environment;
    v22->_environment = v29;

    v31 = -[ACHActivityAwardingEnvironment initWithDataProvider:]([ACHActivityAwardingEnvironment alloc], "initWithDataProvider:", v22->_progressDataProvider);
    progressEnvironment = v22->_progressEnvironment;
    v22->_progressEnvironment = v31;

    HKCreateSerialDispatchQueue();
    v33 = objc_claimAutoreleasedReturnValue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v33;

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
    v35 = objc_claimAutoreleasedReturnValue();
    gregorianUTCCalendar = v22->_gregorianUTCCalendar;
    v22->_gregorianUTCCalendar = (NSCalendar *)v35;

    v37 = -[ACHActivitySummaryIterator initWithHealthStore:shouldIncludePrivateProperties:]([ACHActivitySummaryIterator alloc], "initWithHealthStore:shouldIncludePrivateProperties:", v15, 1);
    activitySummaryIterator = v22->_activitySummaryIterator;
    v22->_activitySummaryIterator = v37;

    WeakRetained = objc_loadWeakRetained((id *)&v22->_dataStore);
    objc_msgSend(WeakRetained, "addPropertyProvider:", v22);

    -[ACHActivityAwardingSource startUp](v22, "startUp");
  }

  return v22;
}

- (ACHActivityAwardingSource)initWithProfile:(id)a3 dataStore:(id)a4 templateStore:(id)a5 awardingEngine:(id)a6 progressEngine:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ACHActivityAwardingSource *v17;
  ACHActivityAwardingSource *v18;
  ACHActivityAwardingDataProvider *v19;
  ACHActivityAwardingDataProvider *dataProvider;
  ACHActivityAwardingDataProvider *v21;
  ACHActivityAwardingDataProvider *progressDataProvider;
  ACHActivityTriggerGenerator *v23;
  ACHActivityTriggerGenerator *triggerGenerator;
  ACHActivityAwardingEnvironment *v25;
  ACHActivityAwardingEnvironment *environment;
  ACHActivityAwardingEnvironment *v27;
  ACHActivityAwardingEnvironment *progressEnvironment;
  uint64_t v29;
  OS_dispatch_queue *internalQueue;
  uint64_t v31;
  NSCalendar *gregorianUTCCalendar;
  ACHActivitySummaryUtility *v33;
  id WeakRetained;
  uint64_t v35;
  ACHActivitySummaryUtility *activitySummaryUtility;
  id v37;
  id v38;
  void *v39;
  objc_super v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)ACHActivityAwardingSource;
  v17 = -[ACHActivityAwardingSource init](&v41, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeWeak((id *)&v18->_dataStore, v13);
    objc_storeWeak((id *)&v18->_templateStore, v14);
    objc_storeWeak((id *)&v18->_engine, v15);
    objc_storeWeak((id *)&v18->_progressEngine, v16);
    v19 = objc_alloc_init(ACHActivityAwardingDataProvider);
    dataProvider = v18->_dataProvider;
    v18->_dataProvider = v19;

    v21 = objc_alloc_init(ACHActivityAwardingDataProvider);
    progressDataProvider = v18->_progressDataProvider;
    v18->_progressDataProvider = v21;

    v23 = -[ACHActivityTriggerGenerator initWithPauseRingsCoordinator:]([ACHActivityTriggerGenerator alloc], "initWithPauseRingsCoordinator:", 0);
    triggerGenerator = v18->_triggerGenerator;
    v18->_triggerGenerator = v23;

    v25 = -[ACHActivityAwardingEnvironment initWithDataProvider:]([ACHActivityAwardingEnvironment alloc], "initWithDataProvider:", v18->_dataProvider);
    environment = v18->_environment;
    v18->_environment = v25;

    v27 = -[ACHActivityAwardingEnvironment initWithDataProvider:]([ACHActivityAwardingEnvironment alloc], "initWithDataProvider:", v18->_progressDataProvider);
    progressEnvironment = v18->_progressEnvironment;
    v18->_progressEnvironment = v27;

    HKCreateSerialDispatchQueue();
    v29 = objc_claimAutoreleasedReturnValue();
    internalQueue = v18->_internalQueue;
    v18->_internalQueue = (OS_dispatch_queue *)v29;

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
    v31 = objc_claimAutoreleasedReturnValue();
    gregorianUTCCalendar = v18->_gregorianUTCCalendar;
    v18->_gregorianUTCCalendar = (NSCalendar *)v31;

    v33 = [ACHActivitySummaryUtility alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v18->_profile);
    v35 = -[ACHActivitySummaryUtility initWithProfile:shouldIncludePrivateProperties:](v33, "initWithProfile:shouldIncludePrivateProperties:", WeakRetained, 1);
    activitySummaryUtility = v18->_activitySummaryUtility;
    v18->_activitySummaryUtility = (ACHActivitySummaryUtility *)v35;

    v37 = objc_loadWeakRetained((id *)&v18->_dataStore);
    objc_msgSend(v37, "addPropertyProvider:", v18);

    v38 = objc_loadWeakRetained((id *)&v18->_profile);
    objc_msgSend(v38, "daemon");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "registerForDaemonReady:", v18);

  }
  return v18;
}

- (void)startUp
{
  NSObject *v3;
  _QWORD block[5];

  if (!-[ACHActivityAwardingSource isAppleWatch](self, "isAppleWatch"))
  {
    -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ACHActivityAwardingSource_startUp__block_invoke;
    block[3] = &unk_24D13A338;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

uint64_t __36__ACHActivityAwardingSource_startUp__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_queue_startCurrentSummaryQuery");
  else
    return objc_msgSend(v3, "_queue_observeSummaries");
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

  -[ACHActivityAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHActivityAwardingSource overrideIsAppleWatch](self, "overrideIsAppleWatch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[ACHActivityAwardingSource profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ACHActivityAwardingSource profile](self, "profile");
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

- (NSString)watchCountryCode
{
  void *v3;

  -[ACHActivityAwardingSource overrideWatchCountryCode](self, "overrideWatchCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHActivityAwardingSource overrideWatchCountryCode](self, "overrideWatchCountryCode");
  else
    ACHPairedWatchCountryCode();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (id)currentDate
{
  NSDate *currentDateOverride;

  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
    return currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_creatorDevice
{
  if (-[ACHActivityAwardingSource isAppleWatch](self, "isAppleWatch"))
    return 1;
  else
    return 2;
}

- (void)_queue_startCurrentSummaryQuery
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, uint64_t, void *, uint64_t, void *);
  void *v12;
  id v13;
  id location;

  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHActivityAwardingSource currentActivitySummaryQuery](self, "currentActivitySummaryQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x24BE01820]);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __60__ACHActivityAwardingSource__queue_startCurrentSummaryQuery__block_invoke;
    v12 = &unk_24D13A488;
    objc_copyWeak(&v13, &location);
    v6 = (void *)objc_msgSend(v5, "initWithUpdateHandler:", &v9);
    -[ACHActivityAwardingSource setCurrentActivitySummaryQuery:](self, "setCurrentActivitySummaryQuery:", v6, v9, v10, v11, v12);

    -[ACHActivityAwardingSource setIsObservingSummaryUpdates:](self, "setIsObservingSummaryUpdates:", 1);
    -[ACHActivityAwardingSource healthStore](self, "healthStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingSource currentActivitySummaryQuery](self, "currentActivitySummaryQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery:", v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __60__ACHActivityAwardingSource__queue_startCurrentSummaryQuery__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
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
  if (v13 && a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "currentActivitySummaryHelper:didUpdateTodayActivitySummary:changedFields:", 0, v13, a4);

  }
  if (v14 && a6)
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v17, "currentActivitySummaryHelper:didUpdateYesterdayActivitySummary:changedFields:", 0, v14, a6);

  }
}

- (NSString)uniqueName
{
  return (NSString *)CFSTR("ActivityAwardingSource");
}

- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL8 v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  ACHActivityAwardingSource *v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_activitySummaryDateComponentsFromDate:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_activitySummaryDateComponentsFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)v15;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v15, v18);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__29;
  v44[4] = __Block_byref_object_dispose__29;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__29;
  v42 = __Block_byref_object_dispose__29;
  v43 = 0;
  -[ACHActivityAwardingSource activitySummaryIterator](self, "activitySummaryIterator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingSource progressDataProvider](self, "progressDataProvider");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = v21 == v9;
  v23 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke;
  v32[3] = &unk_24D13D1F0;
  v24 = v9;
  v33 = v24;
  v34 = self;
  v36 = v44;
  v37 = 16398;
  v25 = v11;
  v35 = v25;
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_201;
  v31[3] = &unk_24D13AEA8;
  v31[4] = &v38;
  objc_msgSend(v20, "enumerateActivitySummariesForDateComponentInterval:includeNilSummaries:handler:errorHandler:", v19, v22, v32, v31);

  -[ACHActivityAwardingSource dataProvider](self, "dataProvider");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v24)
    -[ACHActivityAwardingSource _queue_updateProgressDataProviderIfNeeded](self, "_queue_updateProgressDataProviderIfNeeded");
  v27 = (id)v39[5];
  v28 = v27;
  if (v27)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v27);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);

}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint8_t v35[16];

  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "storeValuesValidBeforeSummaryIndex");
  v10 = objc_msgSend(v6, "_activitySummaryIndex");

  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD **)(a1 + 40);
  if (v6)
  {
    if (v12 == (void *)v11[14] && v9 >= v10)
      goto LABEL_24;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(id *)(v14 + 40);
  if (v6 && !v15)
  {
    objc_msgSend(v11, "dataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v12 == v16 && v9 >= v10)
    {
      objc_storeStrong(v17, a2);
      ACHLogAwardEngine();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] Yesterday's summary has already been processed for the data provider, ignoring.", v35, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setLastCheckedIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_activitySummaryIndex"));
      goto LABEL_24;
    }
    v15 = *v17;
    v12 = *(void **)(a1 + 32);
    goto LABEL_18;
  }
  if (v6)
  {
LABEL_18:
    objc_msgSend(v12, "setYesterdayActivitySummary:", v15);
    objc_msgSend(*(id *)(a1 + 40), "activitySummaryIterator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "newEmptyActivitySummaryFromSummary:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", v22);

    v23 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v24 = *(_QWORD *)(a1 + 48);
    if (v24)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 16))(v24, v23, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "updatePreviousPropertiesWithCurrentProperties");
    objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", v6);
    v25 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v26 = *(_QWORD *)(a1 + 48);
    if (v26)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v26 + 16))(v26, v25, *(_QWORD *)(a1 + 32));
    v27 = objc_msgSend(v6, "_activitySummaryIndex");
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setStoreValuesValidBeforeSummaryIndex:", v27);

    objc_msgSend(*(id *)(a1 + 32), "updatePreviousPropertiesWithCurrentProperties");
    v29 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v30 = a2;
    goto LABEL_23;
  }
  if (v15)
  {
    v19 = v15;
    v20 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v19;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "yesterdayActivitySummary");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setYesterdayActivitySummary:");
    objc_msgSend(*(id *)(a1 + 40), "activitySummaryIterator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v33, "newEmptyActivitySummaryFromSummary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    objc_msgSend(v6, "_setActivitySummaryIndex:", _HKCacheIndexFromDateComponents());
    objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "updatePreviousPropertiesWithCurrentProperties");
    v29 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v30 = v6;
LABEL_23:
    objc_storeStrong(v29, v30);
    goto LABEL_24;
  }
  ACHLogAwardEngine();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_cold_1(v34);

  v6 = 0;
LABEL_24:

}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_201(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_queue_updateDataProvider:(id)a3 forDateInterval:(id)a4 awardingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  ACHActivityAwardingSource *v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_activitySummaryDateComponentsFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_activitySummaryDateComponentsFromDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v14, v17);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__29;
  v37[4] = __Block_byref_object_dispose__29;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__29;
  v35 = __Block_byref_object_dispose__29;
  v36 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  -[ACHActivityAwardingSource activitySummaryUtility](self, "activitySummaryUtility");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __85__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock___block_invoke;
  v24[3] = &unk_24D13D218;
  v28 = &v31;
  v29 = v37;
  v20 = v8;
  v25 = v20;
  v26 = self;
  v30 = 16398;
  v21 = v10;
  v27 = v21;
  objc_msgSend(v19, "enumerateActivitySummariesForDateComponentInterval:handler:", v18, v24);

  ACHLogAwardEngine();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v32[5];
    *(_DWORD *)buf = 138412290;
    v40 = v23;
    _os_log_impl(&dword_21407B000, v22, OS_LOG_TYPE_DEFAULT, "Summaries: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);

}

void __85__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setYesterdayActivitySummary:");
    objc_msgSend(*(id *)(a1 + 40), "activitySummaryUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "newEmptyActivitySummaryFromSummary:", v15);
    objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", v8);

    v9 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, v9, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "updatePreviousPropertiesWithCurrentProperties");
    objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", v15);
    v11 = objc_msgSend(*(id *)(a1 + 40), "_queue_triggersWithChangedSummaryFields:dataProvider:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, v11, *(_QWORD *)(a1 + 32));
    v13 = objc_msgSend(v15, "_activitySummaryIndex");
    objc_msgSend(*(id *)(a1 + 32), "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStoreValuesValidBeforeSummaryIndex:", v13);

    objc_msgSend(*(id *)(a1 + 32), "updatePreviousPropertiesWithCurrentProperties");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  else
  {
    objc_storeStrong(v5, a2);
    objc_msgSend(*(id *)(a1 + 32), "setLastCheckedIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_activitySummaryIndex"));
  }

}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  ACHActivityAwardingSource *v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__29;
  v25 = __Block_byref_object_dispose__29;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke;
  v16 = &unk_24D13A460;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v19 = &v21;
  v20 = a4;
  dispatch_sync(v8, &v13);

  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = (void *)objc_msgSend(v10, "initWithArray:", v22[5], v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "watchCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] running historical for interval: %@", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_205;
  v28[3] = &unk_24D13D240;
  v7 = *(_QWORD *)(a1 + 40);
  v28[4] = *(_QWORD *)(a1 + 32);
  v8 = v2;
  v9 = *(_QWORD *)(a1 + 48);
  v29 = v8;
  v30 = v9;
  v27 = 0;
  objc_msgSend(v5, "_queue_updateDataProvider:forDateInterval:awardingBlock:error:", v6, v7, v28, &v27);
  v10 = v27;

  ACHLogAwardEngine();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] dataprovider properties: %@", buf, 0xCu);

  }
  if (v10)
  {
    ACHLogAwardEngine();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_cold_1((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);

    v22 = *(_QWORD **)(a1 + 56);
    if (v22)
      *v22 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    ACHLogAwardEngine();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Activity source awarded %{public}@ earned instances.", buf, 0xCu);

    }
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") <= 0xA)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "hk_map:", &__block_literal_global_27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ACHLogAwardEngine();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Activity source awarded earned instances with unique names: %@.", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isAppleWatch")
    && (objc_msgSend(*(id *)(a1 + 32), "isObservingSummaryUpdates") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_startCurrentSummaryQuery");
  }

}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_205(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "todayActivitySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gregorianDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "templateStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableTemplatesForDateComponents:countryCode:", v6, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = (void *)MEMORY[0x2199C8FE0]();
  objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", a2, v5, v9, objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v11);

  objc_autoreleasePoolPop(v10);
}

uint64_t __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_208(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "templateUniqueName");
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ACHActivityAwardingSource *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__29;
  v26 = __Block_byref_object_dispose__29;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  v17 = &unk_24D13D2D0;
  v18 = self;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v21 = &v22;
  dispatch_sync(v9, &v14);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v23[5], v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "watchCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyForReadingProtectedData");
  v15 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2;
  v11[3] = &unk_24D13D2A8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v14 = v7;
  v8 = objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v5, &v15, v11, 0);
  v9 = v15;

  if (!v8 || v9)
  {
    ACHLogAwardEngine();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Activity source transaction error: %{public}@", buf, 0xCu);
    }

  }
}

uint64_t __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_3;
  v12[3] = &unk_24D13D240;
  v4 = *(_QWORD *)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v14 = v6;
  objc_msgSend(v2, "_queue_updateDataProvider:forDateInterval:awardingBlock:", v3, v4, v12);

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    ACHLogAwardEngine();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Activity source awarded %{public}@ earned instances.", buf, 0xCu);

    }
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") <= 0xA)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "hk_map:", &__block_literal_global_213_1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ACHLogAwardEngine();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Activity source awarded earned instances with unique names: %@.", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isAppleWatch")
    && (objc_msgSend(*(id *)(a1 + 32), "isObservingSummaryUpdates") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_observeSummaries");
  }

  return 1;
}

void __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "todayActivitySummary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_gregorianDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "templateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableTemplatesForDateComponents:countryCode:", v5, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", a2, v10, v8, objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v9);

}

uint64_t __82__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_212(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "templateUniqueName");
}

- (id)_progressUpdateForTemplate:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE01838]);
  objc_msgSend(v8, "validateTemplate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isValid"))
  {
    -[ACHActivityAwardingSource _queue_goalQuantityForTemplate:environment:](self, "_queue_goalQuantityForTemplate:environment:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingSource _queue_progressQuantityForTemplate:environment:](self, "_queue_progressQuantityForTemplate:environment:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ACHActivityAwardingSource _isAchievementStillEarnableForTemplate:andProgressEnvironment:](self, "_isAchievementStillEarnableForTemplate:andProgressEnvironment:", v6, v7))
    {
      ACHLogAwardEngine();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v13;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "[ACHActivityAwardingSource] cannot earn %@ anymore, setting progress and goal to 0 (was: %@/%@)", (uint8_t *)&v22, 0x20u);

      }
      objc_msgSend(v6, "canonicalUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ACHHKQuantityWithValueAndUnit();
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "canonicalUnit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ACHHKQuantityWithValueAndUnit();
      v17 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
      v11 = (void *)v17;
    }
    v18 = objc_alloc(MEMORY[0x24BE017B8]);
    objc_msgSend(v6, "uniqueName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTemplateUniqueName:progressQuantity:goalQuantity:", v19, v11, v10);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_queue_progressQuantityForTemplate:(id)a3 environment:(id)a4
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
  -[ACHActivityAwardingSource currentDate](self, "currentDate");
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

- (id)_queue_goalQuantityForTemplate:(id)a3 environment:(id)a4
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

- (BOOL)_isAchievementStillEarnableForTemplate:(id)a3 andProgressEnvironment:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE01838]);
  objc_msgSend(v8, "validateTemplate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isValid"))
  {
    if (v7)
    {
      objc_msgSend(v6, "uniqueName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHActivityAwardingSource progressDataProvider](self, "progressDataProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "todayActivitySummary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "graceProgressExpression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(v6, "progressExpression");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v14;

      v27 = v16;
      objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "expressionValueWithObject:context:", v7, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHActivityAwardingSource currentDate](self, "currentDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "intValue");
      v20 = -v19;
      v28 = v10;
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PerfectWeekMove")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("PerfectWeekExercise")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("PerfectWeekStand")) & 1) != 0
        || objc_msgSend(v10, "isEqualToString:", CFSTR("PerfectWeekAll")))
      {
        if (-[ACHActivityAwardingSource _hasMetGoalForTemplate:andActivitySummary:](self, "_hasMetGoalForTemplate:andActivitySummary:", v6, v29))
        {
          v20 = 1 - v19;
        }
        ACHStartOfFitnessWeekBeforeDateInCalendar();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = objc_msgSend(v10, "hasPrefix:", CFSTR("PerfectMonth_"));
        v15 = 1;
        if (!v25)
          goto LABEL_16;
        if (-[ACHActivityAwardingSource _hasMetGoalForTemplate:andActivitySummary:](self, "_hasMetGoalForTemplate:andActivitySummary:", v6, v29))
        {
          v20 = 1 - v19;
        }
        -[NSCalendar hk_startOfMonthForDate:](self->_gregorianUTCCalendar, "hk_startOfMonthForDate:", v18);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v21;
      -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_gregorianUTCCalendar, "dateByAddingUnit:value:toDate:options:", 16, v20, v18, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NSCalendar isDate:inSameDayAsDate:](self->_gregorianUTCCalendar, "isDate:inSameDayAsDate:", v22, v23);

LABEL_16:
      goto LABEL_17;
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
LABEL_17:

  return v15;
}

- (BOOL)_hasMetGoalForTemplate:(id)a3 andActivitySummary:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  double v21;
  BOOL v22;
  BOOL v23;

  v5 = a3;
  if (a4)
  {
    v6 = a4;
    objc_msgSend(v6, "_activeEnergyCompletionPercentage");
    v8 = v7;
    objc_msgSend(v6, "_moveMinutesCompletionPercentage");
    v10 = v9;
    objc_msgSend(v6, "_exerciseTimeCompletionPercentage");
    v12 = v11;
    objc_msgSend(v6, "_standHoursCompletionPercentage");
    v14 = v13;

    objc_msgSend(v5, "graceProgressExpression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v5, "progressExpression");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v17;

    v20 = objc_msgSend(&unk_24D15B948, "indexOfObject:", v19);
    v21 = v8 + v10;
    switch(v20)
    {
      case 0:
      case 1:
        v22 = v21 < 1.0;
        goto LABEL_11;
      case 2:
        v22 = v12 < 1.0;
        goto LABEL_11;
      case 3:
        v22 = v14 < 1.0;
LABEL_11:
        v18 = !v22;
        break;
      case 4:
        v23 = v21 >= 1.0;
        if (v12 < 1.0)
          v23 = 0;
        v18 = v14 >= 1.0 && v23;
        break;
      default:
        v18 = 1;
        break;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_queue_updateProgressDataProviderIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "[ACHActivityAwardingSource] Error updating progress data provider: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_runIncrementallyForChangedSummaryFields:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[ACHActivityAwardingSource engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHActivityAwardingSource uniqueName](self, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke;
  v7[3] = &unk_24D13D2F8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v5, "requestIncrementalEvaluationForSource:evaluationBlock:", v6, v7);

}

id __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke_2;
  block[3] = &unk_24D13C8A8;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  block[5] = &v11;
  block[6] = v7;
  block[4] = v6;
  dispatch_sync(v5, block);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __70__ACHActivityAwardingSource__runIncrementallyForChangedSummaryFields___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "todayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTodayActivitySummary:", v2);

  objc_msgSend(*(id *)(a1 + 32), "yesterdayActivitySummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setYesterdayActivitySummary:", v4);

  objc_msgSend(*(id *)(a1 + 32), "watchCountryCode");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "dataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_queue_triggersWithChangedSummaryFields:dataProvider:", v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "templateStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "todayActivitySummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_gregorianDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableTemplatesForDateComponents:countryCode:", v13, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 32);
  objc_msgSend(v15, "dataProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "todayActivitySummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_queue_evaluateTriggers:activitySummary:templates:shouldLog:", v9, v17, v14, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updatePreviousPropertiesWithCurrentProperties");

  objc_msgSend(*(id *)(a1 + 32), "_queue_updateProgressDataProviderIfNeeded");
}

- (unint64_t)_queue_triggersWithChangedSummaryFields:(unint64_t)a3 dataProvider:(id)a4
{
  __int16 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  v6 = a4;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "todayActivitySummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activityMoveMode");

  if (v9 == 2)
  {
    if ((v4 & 0x4000) != 0)
    {
      -[ACHActivityAwardingSource triggerGenerator](self, "triggerGenerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "triggersForNewMoveTimeDataWithDataProvider:", v6);
      goto LABEL_8;
    }
  }
  else if ((v4 & 2) != 0)
  {
    -[ACHActivityAwardingSource triggerGenerator](self, "triggerGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "triggersForNewMoveDataWithDataProvider:", v6);
LABEL_8:
    v12 = v11;

    if ((v4 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v12 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_9:
    -[ACHActivityAwardingSource triggerGenerator](self, "triggerGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 |= objc_msgSend(v13, "triggersForNewExerciseDataWithDataProvider:", v6);

  }
LABEL_10:
  if ((v4 & 8) != 0)
  {
    -[ACHActivityAwardingSource triggerGenerator](self, "triggerGenerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 |= objc_msgSend(v14, "triggersForNewStandDataWithDataProvider:", v6);

  }
  return v12;
}

- (id)_queue_evaluateTriggers:(unint64_t)a3 activitySummary:(id)a4 templates:(id)a5 shouldLog:(BOOL)a6
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  ACHActivityAwardingSource *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  NSObject *v64;
  id v66;
  id v67;
  ACHActivityAwardingSource *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  _BOOL4 v75;
  id obj;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  void *v83;
  void *v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  __int16 v88;
  NSObject *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v75 = a6;
  v94 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v67 = a5;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (a3)
  {
    objc_msgSend(v9, "_gregorianDateComponents");
    v11 = objc_claimAutoreleasedReturnValue();
    -[ACHActivityAwardingSource environment](self, "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentDateComponents:", v11);

    -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v11;
    objc_msgSend(v13, "dateFromComponents:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHActivityAwardingSource profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[ACHActivityAwardingSource profile](self, "profile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0;
      v18 = ACHExperienceTypeForDateWithProfile(v16, v17, v14, &v84);
      v19 = v84;
    }
    else
    {
      -[ACHActivityAwardingSource healthStore](self, "healthStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHActivityAwardingSource gregorianUTCCalendar](self, "gregorianUTCCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v18 = ACHExperienceTypeForDateWithHealthStore(v16, v17, v14, &v83);
      v19 = v83;
    }
    v21 = v19;
    -[ACHActivityAwardingSource environment](self, "environment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setExperienceType:", v18);

    v23 = v21;
    if (v21)
    {
      -[ACHActivityAwardingSource environment](self, "environment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setExperienceType:", 3);

      ACHLogAwardEngine();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v21;
        _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "ActivityAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", buf, 0xCu);
      }

    }
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __89__ACHActivityAwardingSource__queue_evaluateTriggers_activitySummary_templates_shouldLog___block_invoke;
    v82[3] = &__block_descriptor_40_e38_B24__0__ACHTemplate_8__NSDictionary_16l;
    v82[4] = a3;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v82);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "filteredArrayUsingPredicate:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v75)
    {
      ACHLogAwardEngine();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        ACHTriggerOptionsToString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
        v30 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v87 = v29;
        v88 = 2114;
        v89 = v30;
        v90 = 2114;
        v91 = v72;
        v92 = 2112;
        v93 = v9;
        _os_log_impl(&dword_21407B000, v28, OS_LOG_TYPE_DEFAULT, "Activity source is evaluating triggers %@ for %{public}@ templates using activity summary with date %{public}@, values: %@", buf, 0x2Au);

      }
    }
    v66 = v9;
    v31 = objc_alloc_init(MEMORY[0x24BE01838]);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v27;
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v77)
    {
      v32 = *(_QWORD *)v79;
      v73 = *(_QWORD *)v79;
      v74 = v31;
      v68 = self;
      v69 = v21;
      v70 = v14;
      do
      {
        for (i = 0; i != v77; ++i)
        {
          if (*(_QWORD *)v79 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v31, "validateTemplate:", v34, v66);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v35, "isValid") & 1) != 0)
          {
            objc_msgSend(v34, "gracePredicate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36)
            {
              v38 = v36;
            }
            else
            {
              objc_msgSend(v34, "predicate");
              v38 = objc_claimAutoreleasedReturnValue();
            }
            v39 = v38;

            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "allowEvaluation");
            -[ACHActivityAwardingSource environment](self, "environment");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "evaluateWithObject:", v42);

            if (v43)
            {
              if (v75)
              {
                ACHLogAwardEngine();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v34, "uniqueName");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v87 = v45;
                  v88 = 2112;
                  v89 = v39;
                  _os_log_impl(&dword_21407B000, v44, OS_LOG_TYPE_DEFAULT, "Template predicate is true, creating earned instance. Template: %@, predicate: %@", buf, 0x16u);

                }
                -[ACHActivityAwardingSource environment](self, "environment");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setValueForKeyLoggingEnabled:", 1);

                ACHLogAwardEngine();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21407B000, v47, OS_LOG_TYPE_DEFAULT, "Evaluating predicate with valueForKey logging enabled:", buf, 2u);
                }

                -[ACHActivityAwardingSource environment](self, "environment");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "evaluateWithObject:", v48);

                -[ACHActivityAwardingSource environment](self, "environment");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setValueForKeyLoggingEnabled:", 0);

              }
              v50 = objc_alloc_init(MEMORY[0x24BE01830]);
              objc_msgSend(v34, "uniqueName");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setTemplateUniqueName:", v51);

              objc_msgSend(v72, "year");
              objc_msgSend(v72, "month");
              objc_msgSend(v72, "day");
              ACHDateComponentsForYearMonthDay();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setEarnedDateComponents:", v52);

              objc_msgSend(v34, "graceValueExpression");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v53
                 || (objc_msgSend(v34, "valueExpression"), (v53 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                && (objc_msgSend(v34, "canonicalUnit"),
                    v54 = (void *)objc_claimAutoreleasedReturnValue(),
                    v54,
                    v54))
              {
                objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", v53);
                v55 = objc_claimAutoreleasedReturnValue();
                v56 = self;
                v57 = (void *)v55;
                -[ACHActivityAwardingSource environment](v56, "environment");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "expressionValueWithObject:context:", v58, 0);
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (v59)
                {
                  v60 = (void *)MEMORY[0x24BDD3E50];
                  objc_msgSend(v34, "canonicalUnit");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                  objc_msgSend(v60, "quantityWithUnit:doubleValue:", v61);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "setValue:", v62);

                }
                v63 = v75;
                self = v68;
              }
              else
              {
                v63 = v75;
              }
              v14 = v70;
              if (v63)
              {
                ACHLogAwardEngine();
                v64 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v87 = v50;
                  _os_log_impl(&dword_21407B000, v64, OS_LOG_TYPE_DEFAULT, "Created earned instance: %@", buf, 0xCu);
                }

              }
              objc_msgSend(v71, "addObject:", v50);

              v23 = v69;
            }

            v32 = v73;
            v31 = v74;
          }
          else
          {
            ACHLogAwardEngine();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v34, "uniqueName");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v87 = v40;
              _os_log_impl(&dword_21407B000, v39, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);

            }
          }

        }
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v77);
    }

    v20 = (id)objc_msgSend(v71, "copy");
    v9 = v66;
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  }

  return v20;
}

BOOL __89__ACHActivityAwardingSource__queue_evaluateTriggers_activitySummary_templates_shouldLog___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return (objc_msgSend(a2, "triggers") & v2) != 0;
}

- (void)_queue_observeSummaries
{
  NSObject *v3;
  void *v4;
  id WeakRetained;

  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHActivityAwardingSource setIsObservingSummaryUpdates:](self, "setIsObservingSummaryUpdates:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "currentActivitySummaryHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v7 = a4;
  if ((objc_msgSend(v7, "_isDataLoading") & 1) == 0)
  {
    -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_24D13AC18;
    block[4] = self;
    v10 = v7;
    v11 = a5;
    dispatch_async(v8, block);

  }
}

uint64_t __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int IsAppleWatch;
  void *v11;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "setTodayActivitySummary:", *(_QWORD *)(a1 + 40));
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  v11 = *(void **)(a1 + 32);
  if (IsAppleWatch)
    return objc_msgSend(v11, "_runIncrementallyForChangedSummaryFields:", *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(v11, "_queue_updateProgressDataProviderIfNeeded");
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateYesterdayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v7 = a4;
  if ((objc_msgSend(v7, "_isDataLoading") & 1) == 0)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke;
    block[3] = &unk_24D13AC18;
    block[4] = self;
    v10 = v7;
    v11 = a5;
    dispatch_async(internalQueue, block);

  }
}

uint64_t __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int IsAppleWatch;
  void *v11;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "setYesterdayActivitySummary:", *(_QWORD *)(a1 + 40));
  ACHLogAwardEngine();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(objc_msgSend(*(id *)(a1 + 32), "isAppleWatch"));
  v11 = *(void **)(a1 + 32);
  if (IsAppleWatch)
    return objc_msgSend(v11, "_runIncrementallyForChangedSummaryFields:", *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(v11, "_queue_updateProgressDataProviderIfNeeded");
}

- (NSArray)dataStorePropertyKeys
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__29;
  v12 = __Block_byref_object_dispose__29;
  v13 = 0;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__ACHActivityAwardingSource_dataStorePropertyKeys__block_invoke;
  v7[3] = &unk_24D13AC40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __50__ACHActivityAwardingSource_dataStorePropertyKeys__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSDictionary)dataStoreProperties
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__29;
  v12 = __Block_byref_object_dispose__29;
  v13 = 0;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__ACHActivityAwardingSource_dataStoreProperties__block_invoke;
  v7[3] = &unk_24D13AC40;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __48__ACHActivityAwardingSource_dataStoreProperties__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setDataStoreProperties:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__ACHActivityAwardingSource_setDataStoreProperties___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__ACHActivityAwardingSource_setDataStoreProperties___block_invoke(uint64_t a1)
{
  ACHDataStoreActivityProperties *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ACHDataStoreActivityProperties);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateProgressDataProviderIfNeeded");
}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHActivityAwardingSource internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__ACHActivityAwardingSource_dataStoreDidClearAllProperties_completion___block_invoke;
  v8[3] = &unk_24D13BC70;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __71__ACHActivityAwardingSource_dataStoreDidClearAllProperties_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllProperties");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (NSCalendar)gregorianUTCCalendar
{
  return self->_gregorianUTCCalendar;
}

- (void)setGregorianUTCCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianUTCCalendar, a3);
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

- (ACHDataStore)dataStore
{
  return (ACHDataStore *)objc_loadWeakRetained((id *)&self->_dataStore);
}

- (void)setDataStore:(id)a3
{
  objc_storeWeak((id *)&self->_dataStore, a3);
}

- (ACHTemplateStore)templateStore
{
  return (ACHTemplateStore *)objc_loadWeakRetained((id *)&self->_templateStore);
}

- (void)setTemplateStore:(id)a3
{
  objc_storeWeak((id *)&self->_templateStore, a3);
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (void)setPauseRingsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, a3);
}

- (ACHActivityAwardingDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (ACHActivityTriggerGenerator)triggerGenerator
{
  return self->_triggerGenerator;
}

- (void)setTriggerGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_triggerGenerator, a3);
}

- (ACHActivityAwardingEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setProgressDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_progressDataProvider, a3);
}

- (ACHActivityAwardingEnvironment)progressEnvironment
{
  return self->_progressEnvironment;
}

- (void)setProgressEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_progressEnvironment, a3);
}

- (HKActivitySummary)todayActivitySummary
{
  return self->_todayActivitySummary;
}

- (void)setTodayActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_todayActivitySummary, a3);
}

- (HKActivitySummary)yesterdayActivitySummary
{
  return self->_yesterdayActivitySummary;
}

- (void)setYesterdayActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, a3);
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryIterator, a3);
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  return self->_activitySummaryUtility;
}

- (void)setActivitySummaryUtility:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryUtility, a3);
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

- (BOOL)isObservingSummaryUpdates
{
  return self->_isObservingSummaryUpdates;
}

- (void)setIsObservingSummaryUpdates:(BOOL)a3
{
  self->_isObservingSummaryUpdates = a3;
}

- (ACHCurrentActivitySummaryQuery)currentActivitySummaryQuery
{
  return self->_currentActivitySummaryQuery;
}

- (void)setCurrentActivitySummaryQuery:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivitySummaryQuery, a3);
}

- (ACHDataStoreActivityProperties)latestDataStoreProperties
{
  return self->_latestDataStoreProperties;
}

- (void)setLatestDataStoreProperties:(id)a3
{
  objc_storeStrong((id *)&self->_latestDataStoreProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDataStoreProperties, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryQuery, 0);
  objc_storeStrong((id *)&self->_watchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activitySummaryUtility, 0);
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_yesterdayActivitySummary, 0);
  objc_storeStrong((id *)&self->_todayActivitySummary, 0);
  objc_storeStrong((id *)&self->_progressEnvironment, 0);
  objc_storeStrong((id *)&self->_progressDataProvider, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_triggerGenerator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_gregorianUTCCalendar, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

void __91__ACHActivityAwardingSource__queue_updateDataProvider_forDateInterval_awardingBlock_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "[ACHActivityAwardingSource] Updating progressDataProvider, but unable to determine goals for empty summary, skipping...", v1, 2u);
}

void __72__ACHActivityAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error updating activity data provider: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __102__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21407B000, a2, a3, "Today summary changed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __106__ACHActivityAwardingSource_currentActivitySummaryHelper_didUpdateYesterdayActivitySummary_changedFields___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21407B000, a2, a3, "Yesterday summary changed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
