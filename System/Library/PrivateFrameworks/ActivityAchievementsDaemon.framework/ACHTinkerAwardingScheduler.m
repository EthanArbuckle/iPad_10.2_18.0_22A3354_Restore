@implementation ACHTinkerAwardingScheduler

- (ACHTinkerAwardingScheduler)initWithHealthStore:(id)a3 assertionClient:(id)a4 dataStore:(id)a5 earnedInstanceStore:(id)a6 templateStore:(id)a7 awardingEngine:(id)a8
{
  id v15;
  id v16;
  id v17;
  ACHTinkerAwardingScheduler *v18;
  ACHTinkerAwardingScheduler *v19;
  uint64_t v20;
  ACHAwardsKeyValueClient *keyValueClient;
  uint64_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  NSCalendar *calendar;
  uint64_t v26;
  OS_dispatch_queue *awardingEvaluationQueue;
  NSMutableArray *v28;
  NSMutableArray *awardEvaluationCompletionBlocks;
  uint64_t v30;
  HKKeyValueDomain *localKeyValueHSDomain;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v15 = a5;
  v33 = a6;
  v16 = a7;
  v17 = a8;
  v36.receiver = self;
  v36.super_class = (Class)ACHTinkerAwardingScheduler;
  v18 = -[ACHTinkerAwardingScheduler init](&v36, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    objc_storeStrong((id *)&v19->_assertionClient, a4);
    objc_msgSend(v15, "keyValueClient");
    v20 = objc_claimAutoreleasedReturnValue();
    keyValueClient = v19->_keyValueClient;
    v19->_keyValueClient = (ACHAwardsKeyValueClient *)v20;

    objc_storeStrong((id *)&v19->_dataStore, a5);
    objc_storeStrong((id *)&v19->_earnedInstanceStore, a6);
    objc_storeStrong((id *)&v19->_templateStore, a7);
    objc_storeStrong((id *)&v19->_awardingEngine, a8);
    *(_WORD *)&v19->_dataStoreIsLoaded = 0;
    HKCreateSerialDispatchQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v24 = objc_claimAutoreleasedReturnValue();
    calendar = v19->_calendar;
    v19->_calendar = (NSCalendar *)v24;

    HKCreateSerialDispatchQueue();
    v26 = objc_claimAutoreleasedReturnValue();
    awardingEvaluationQueue = v19->_awardingEvaluationQueue;
    v19->_awardingEvaluationQueue = (OS_dispatch_queue *)v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    awardEvaluationCompletionBlocks = v19->_awardEvaluationCompletionBlocks;
    v19->_awardEvaluationCompletionBlocks = v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3C98]), "initWithCategory:domainName:healthStore:", 3, CFSTR("com.apple.ActivityAchievements.TinkerAwardingScheduler"), v19->_healthStore);
    localKeyValueHSDomain = v19->_localKeyValueHSDomain;
    v19->_localKeyValueHSDomain = (HKKeyValueDomain *)v30;

  }
  return v19;
}

- (ACHTinkerAwardingScheduler)initWithProfile:(id)a3 dataStore:(id)a4 earnedInstanceStore:(id)a5 templateStore:(id)a6 awardingEngine:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ACHTinkerAwardingScheduler *v17;
  ACHTinkerAwardingScheduler *v18;
  uint64_t v19;
  OS_dispatch_queue *queue;
  uint64_t v21;
  NSCalendar *calendar;
  uint64_t v23;
  OS_dispatch_queue *awardingEvaluationQueue;
  NSMutableArray *v25;
  NSMutableArray *awardEvaluationCompletionBlocks;
  uint64_t v27;
  HDKeyValueDomain *localKeyValueDomain;
  void *v29;
  id v31;
  objc_super v32;

  v13 = a3;
  v31 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ACHTinkerAwardingScheduler;
  v17 = -[ACHTinkerAwardingScheduler init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_profile, a3);
    objc_storeStrong((id *)&v18->_dataStore, a4);
    objc_storeStrong((id *)&v18->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v18->_templateStore, a6);
    objc_storeStrong((id *)&v18->_awardingEngine, a7);
    HKCreateSerialDispatchQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v21 = objc_claimAutoreleasedReturnValue();
    calendar = v18->_calendar;
    v18->_calendar = (NSCalendar *)v21;

    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    awardingEvaluationQueue = v18->_awardingEvaluationQueue;
    v18->_awardingEvaluationQueue = (OS_dispatch_queue *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    awardEvaluationCompletionBlocks = v18->_awardEvaluationCompletionBlocks;
    v18->_awardEvaluationCompletionBlocks = v25;

    *(_WORD *)&v18->_dataStoreIsLoaded = 0;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BE40AD0]), "initWithCategory:domainName:profile:", 0, CFSTR("com.apple.ActivityAchievements.TinkerAwardingScheduler"), v13);
    localKeyValueDomain = v18->_localKeyValueDomain;
    v18->_localKeyValueDomain = (HDKeyValueDomain *)v27;

    -[HDProfile daemon](v18->_profile, "daemon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerForDaemonReady:", v18);

  }
  return v18;
}

- (void)activate
{
  NSObject *v3;
  uint8_t v4[16];

  ACHLogAwardScheduling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Activating tinker scheduler", v4, 2u);
  }

  -[ACHTinkerAwardingScheduler _startUp](self, "_startUp");
}

- (void)setlastSuccessfulRunDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  uint64_t *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, a3);
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTinkerAwardingScheduler _lastSuccessfulRunDateKey](self, "_lastSuccessfulRunDateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v11 = (id *)&v22;
    v12 = &v22;
  }
  else
  {
    -[ACHTinkerAwardingScheduler localKeyValueHSDomain](self, "localKeyValueHSDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTinkerAwardingScheduler _lastSuccessfulRunDateKey](self, "_lastSuccessfulRunDateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = (id *)&v21;
    v12 = &v21;
  }
  objc_msgSend(v9, "setNumber:forKey:error:", v7, v10, v12, v21, v22);
  v13 = *v11;

  if (v13)
  {
    ACHLogAwardScheduling();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACHCompanionAwardingScheduler setlastSuccessfulRunDate:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
}

- (id)_lastSuccessfulRunDateKey
{
  return NSStringFromSelector(sel_lastSuccessfulRunDate);
}

- (NSDate)lastSuccessfulRunDate
{
  NSDate *lastSuccessfulRunDate;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDate *v18;
  NSDate *v19;
  uint64_t v21;
  uint64_t v22;

  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  if (!lastSuccessfulRunDate)
  {
    -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHTinkerAwardingScheduler _lastSuccessfulRunDateKey](self, "_lastSuccessfulRunDateKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v7 = (id *)&v22;
      v8 = &v22;
    }
    else
    {
      -[ACHTinkerAwardingScheduler localKeyValueHSDomain](self, "localKeyValueHSDomain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHTinkerAwardingScheduler _lastSuccessfulRunDateKey](self, "_lastSuccessfulRunDateKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v7 = (id *)&v21;
      v8 = &v21;
    }
    objc_msgSend(v5, "numberForKey:error:", v6, v8, v21, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *v7;

    if (v10)
    {
      ACHLogAwardScheduling();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ACHCompanionAwardingScheduler lastSuccessfulRunDate].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    }
    v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v19 = self->_lastSuccessfulRunDate;
    self->_lastSuccessfulRunDate = v18;

    lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  }
  return lastSuccessfulRunDate;
}

- (void)clearLastSuccessfulRunDate
{
  NSDate *lastSuccessfulRunDate;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  self->_lastSuccessfulRunDate = 0;

  -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACHTinkerAwardingScheduler localKeyValueDomain](self, "localKeyValueDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCF20];
    NSStringFromSelector(sel_lastSuccessfulRunDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v5, "removeValuesForKeys:error:", v8, &v13);

  }
  else
  {
    -[ACHTinkerAwardingScheduler localKeyValueHSDomain](self, "localKeyValueHSDomain");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    NSStringFromSelector(sel_lastSuccessfulRunDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeValuesForKeys:completion:", v11, &__block_literal_global_21);

  }
}

void __56__ACHTinkerAwardingScheduler_clearLastSuccessfulRunDate__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    ACHLogAwardScheduling();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Error clearning last run date: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)maintenanceTaskScheduled
{
  NSObject *v3;

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_maintenanceTaskScheduled;
}

- (void)setMaintenanceTaskScheduled:(BOOL)a3
{
  NSObject *v5;

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_maintenanceTaskScheduled = a3;
}

- (void)_systemTimeZoneDidChange:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  -[ACHTinkerAwardingScheduler queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ACHTinkerAwardingScheduler__systemTimeZoneDidChange___block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_sync(v5, block);

}

void __55__ACHTinkerAwardingScheduler__systemTimeZoneDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCalendar:", v2);

}

- (void)daemonReady:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE40E10], "sharedDiagnosticManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

}

- (void)_startUp
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__systemTimeZoneDidChange_, *MEMORY[0x24BDBCBC0], 0);

  -[ACHTinkerAwardingScheduler templateStore](self, "templateStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[ACHTinkerAwardingScheduler dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

}

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HDProfile *profile;
  double v9;
  void *v10;
  HDPeriodicActivity *v11;
  HDPeriodicActivity *scheduler;
  ACHXPCScheduler *v13;
  ACHXPCScheduler *v14;
  ACHXPCScheduler *xpcScheduler;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id buf[2];

  v4 = a3;
  -[ACHTinkerAwardingScheduler profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ACHLogAwardScheduling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Templates are loaded, setting up daily periodic activity for awarding.", (uint8_t *)buf, 2u);
    }

    v7 = objc_alloc(MEMORY[0x24BE40B70]);
    profile = self->_profile;
    v9 = (double)(uint64_t)*MEMORY[0x24BDAC600];
    ACHLogAwardScheduling();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (HDPeriodicActivity *)objc_msgSend(v7, "initWithProfile:name:interval:delegate:loggingCategory:", profile, CFSTR("com.apple.activity_achievements.tinker_scheduler"), self, v10, v9);
    scheduler = self->_scheduler;
    self->_scheduler = v11;

  }
  else
  {
    objc_initWeak(buf, self);
    v13 = [ACHXPCScheduler alloc];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __65__ACHTinkerAwardingScheduler_templateStoreDidFinishInitialFetch___block_invoke;
    v22[3] = &unk_24D13C5E0;
    objc_copyWeak(&v23, buf);
    v14 = -[ACHXPCScheduler initWithName:performHandler:](v13, "initWithName:performHandler:", CFSTR("com.apple.activity_achievements.tinker_scheduler"), v22);
    xpcScheduler = self->_xpcScheduler;
    self->_xpcScheduler = v14;

    objc_destroyWeak(&v23);
    objc_destroyWeak(buf);
  }
  objc_msgSend(v4, "allTemplates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v17 = -[ACHTinkerAwardingScheduler _shouldRunImmediatelyOnTemplateLoad](self, "_shouldRunImmediatelyOnTemplateLoad");

    if (v17)
    {
      ACHLogAwardScheduling();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "Templates are loaded and should run immediately on template load is set, requesting evaluation.", (uint8_t *)buf, 2u);
      }

      -[ACHTinkerAwardingScheduler scheduleMaintenanceTaskForAwardingWithCompletion:](self, "scheduleMaintenanceTaskForAwardingWithCompletion:", 0);
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "allTemplates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    ACHLogAwardScheduling();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Initial fetch completed, but no templates exist. Will run when new templates are added.", (uint8_t *)buf, 2u);
    }

  }
LABEL_16:

}

void __65__ACHTinkerAwardingScheduler_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_runXPCActivityWithCompletion:", v3);

}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
    -[ACHTinkerAwardingScheduler scheduleMaintenanceTaskForAwardingWithCompletion:](self, "scheduleMaintenanceTaskForAwardingWithCompletion:", 0);
}

- (void)_runXPCActivityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  ACHLogAwardScheduling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Request awarding evaluation for periodic update", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__ACHTinkerAwardingScheduler__runXPCActivityWithCompletion___block_invoke;
  v7[3] = &unk_24D13C608;
  v8 = v4;
  v6 = v4;
  -[ACHTinkerAwardingScheduler scheduleMaintenanceTaskForAwardingWithCompletion:](self, "scheduleMaintenanceTaskForAwardingWithCompletion:", v7);

}

void __60__ACHTinkerAwardingScheduler__runXPCActivityWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ACHLogAwardScheduling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Periodic activity awarding evaluation finished with success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x24BDAC598];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x24BDAC6C0], 1);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  ACHLogAwardScheduling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "XPC requested tinker awarding run", buf, 2u);
  }

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke;
  v9[3] = &unk_24D13BC70;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

void __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  ACHLogAwardScheduling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Request awarding evaluation for periodic update", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke_210;
  v4[3] = &unk_24D13C608;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "scheduleMaintenanceTaskForAwardingWithCompletion:", v4);

}

void __65__ACHTinkerAwardingScheduler_performPeriodicActivity_completion___block_invoke_210(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ACHLogAwardScheduling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Periodic activity awarding evaluation finished with success=%d, error=%{public}@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(3600.0);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (id)diagnosticDescription
{
  return CFSTR("Tinker Awarding Scheduler");
}

- (void)requestAwardingEvaluationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  ACHLogAwardScheduling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Awarding evaluation requested", buf, 2u);
  }

  -[ACHTinkerAwardingScheduler healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ACHTinkerAwardingScheduler _client_scheduleMaintenanceTaskForAwardingWithCompletion:](self, "_client_scheduleMaintenanceTaskForAwardingWithCompletion:", v4);
  }
  else
  {
    -[ACHTinkerAwardingScheduler queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke;
    v8[3] = &unk_24D13BC70;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke_2;
  v3[3] = &unk_24D13C630;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  v2 = (void *)MEMORY[0x2199C9184](v3);
  objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_queue_requestAwardingEvaluation");

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__ACHTinkerAwardingScheduler_requestAwardingEvaluationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastSuccessfulRunDate:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (void)scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ACHTinkerAwardingScheduler healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[ACHTinkerAwardingScheduler _client_scheduleMaintenanceTaskForAwardingWithCompletion:](self, "_client_scheduleMaintenanceTaskForAwardingWithCompletion:", v5);
  else
    -[ACHTinkerAwardingScheduler _daemon_scheduleMaintenanceTaskForAwardingWithCompletion:](self, "_daemon_scheduleMaintenanceTaskForAwardingWithCompletion:", v5);

}

- (void)_client_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id buf[2];

  v4 = a3;
  ACHLogAwardScheduling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Running awarding...", (uint8_t *)buf, 2u);
  }

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  objc_initWeak(buf, self);
  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke;
  block[3] = &unk_24D13C7E0;
  objc_copyWeak(&v11, buf);
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke(id *a1)
{
  id *v2;
  void *v3;
  id WeakRetained;
  char v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2;
  v8[3] = &unk_24D13C630;
  v2 = a1 + 6;
  objc_copyWeak(&v10, a1 + 6);
  v9 = a1[5];
  v3 = (void *)MEMORY[0x2199C9184](v8);
  objc_msgSend(a1[4], "_queue_addAwardingCompletion:", v3);
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "maintenanceTaskScheduled");

  if ((v5 & 1) != 0)
  {
    ACHLogAwardScheduling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Task already running, only adding an awarding completion handler.", v7, 2u);
    }
  }
  else
  {
    v6 = objc_loadWeakRetained(v2);
    -[NSObject _queue_requestAwardingEvaluation](v6, "_queue_requestAwardingEvaluation");
  }

  objc_destroyWeak(&v10);
}

void __87__ACHTinkerAwardingScheduler__client_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastSuccessfulRunDate:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v10);
  if ((_DWORD)a2)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setlastSuccessfulRunDate:", v9);

  }
}

- (void)_daemon_scheduleMaintenanceTaskForAwardingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke;
  v7[3] = &unk_24D13C6F8;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[16];

  objc_msgSend(a1[4], "maintenanceOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[4], "_queue_addAwardingCompletion:", a1[5]);
    ACHLogAwardScheduling();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Maintenance operation already scheduled. Skipping enqueueing another one.", buf, 2u);
    }

  }
  else
  {
    ACHLogAwardScheduling();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Creating maintenance operation for awarding for periodic running", buf, 2u);
    }

    v5 = (void *)MEMORY[0x24BE40AF8];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_216;
    v14 = &unk_24D13C6D0;
    objc_copyWeak(&v16, a1 + 6);
    v15 = a1[5];
    objc_msgSend(v5, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("com.apple.ActivityAchievements.TinkerRun"), &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setMaintenanceOperation:", v6, v11, v12, v13, v14);

    objc_msgSend(a1[4], "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maintenanceWorkCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "maintenanceOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enqueueMaintenanceOperation:", v10);

    objc_destroyWeak(&v16);
  }
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_216(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2;
  v13[3] = &unk_24D13C6A8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v14 = *(id *)(a1 + 32);
  v5 = (void (**)(_QWORD))v3;
  v15 = v5;
  v6 = (void *)MEMORY[0x2199C9184](v13);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_3;
    block[3] = &unk_24D13BC70;
    block[4] = v8;
    v12 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, 0);
    v5[2](v5);
  }

  objc_destroyWeak(&v16);
}

void __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(WeakRetained, "_queue_removeMaintenanceOperation");
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v9);
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setlastSuccessfulRunDate:", v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __87__ACHTinkerAwardingScheduler__daemon_scheduleMaintenanceTaskForAwardingWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestAwardingEvaluation");
}

- (void)_queue_removeMaintenanceOperation
{
  NSObject *v3;

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHTinkerAwardingScheduler setMaintenanceOperation:](self, "setMaintenanceOperation:", 0);
}

- (void)_queue_requestAwardingEvaluation
{
  void *v3;

  -[ACHTinkerAwardingScheduler healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHTinkerAwardingScheduler _queue_client_requestAwardingEvaluation](self, "_queue_client_requestAwardingEvaluation");
  else
    -[ACHTinkerAwardingScheduler _queue_daemon_requestAwardingEvaluation](self, "_queue_daemon_requestAwardingEvaluation");
}

- (void)_queue_client_requestAwardingEvaluation
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ACHTinkerAwardingScheduler awardingEvaluationQueue](self, "awardingEvaluationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  if (-[ACHTinkerAwardingScheduler dataStoreIsLoaded](self, "dataStoreIsLoaded"))
  {
    -[ACHTinkerAwardingScheduler setShouldRunImmediatelyOnDataStoreLoad:](self, "setShouldRunImmediatelyOnDataStoreLoad:", 0);
    -[ACHTinkerAwardingScheduler setMaintenanceTaskScheduled:](self, "setMaintenanceTaskScheduled:", 1);
    -[ACHTinkerAwardingScheduler awardingEvaluationQueue](self, "awardingEvaluationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke;
    block[3] = &unk_24D13A338;
    block[4] = self;
    dispatch_async(v5, block);

  }
  else
  {
    ACHLogAwardScheduling();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation, but data store isn't loaded yet. Waiting on data store", buf, 2u);
    }

    -[ACHTinkerAwardingScheduler setShouldRunImmediatelyOnDataStoreLoad:](self, "setShouldRunImmediatelyOnDataStoreLoad:", 1);
  }
}

void __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[6];
  uint8_t buf[16];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__23;
  v6[4] = __Block_byref_object_dispose__23;
  objc_msgSend(CFSTR("com.apple.activityawardsd.watch.family_setup.full_history_evaluation"), "UTF8String");
  v7 = (id)os_transaction_create();
  ACHLogAwardScheduling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "Requesting historical evaluation from engine", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "awardingEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_220;
  v4[3] = &unk_24D13C748;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v6;
  objc_msgSend(v3, "requestHistoricalEvaluationForAllSourcesWithCompletion:", v4);

  _Block_object_dispose(v6, 8);
}

void __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_220(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ACHLogAwardScheduling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Historical evaluation complete with success: %{public}@, error: %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_225;
  block[3] = &unk_24D13C720;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = a2;
  block[4] = v9;
  v14 = v5;
  v10 = v5;
  dispatch_sync(v8, block);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

uint64_t __69__ACHTinkerAwardingScheduler__queue_client_requestAwardingEvaluation__block_invoke_225(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_queue_daemon_requestAwardingEvaluation
{
  NSObject *v3;
  NSObject *awardingEvaluationQueue;
  _QWORD block[5];

  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  awardingEvaluationQueue = self->_awardingEvaluationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(awardingEvaluationQueue, block);
}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  char v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:timeout:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:timeout:error:", v3, CFSTR("Tinker Awarding Scheduler"), &v36, 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v36;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE40A80], "transactionWithOwner:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ACHDatabaseContextWithAccessibilityAssertion(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCacheScope:", 1);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v33 = v5;
    v9 = objc_msgSend(v8, "clearAllPropertiesWithError:databaseContext:", &v33, v7);
    v10 = v33;

    ACHLogAwardScheduling();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v9 || v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __72__ACHCompanionAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_cold_1((uint64_t)v10, v12, v19, v20, v21, v22, v23, v24);

      objc_msgSend(*(id *)(a1 + 32), "queue");
      v25 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_229;
      v30[3] = &unk_24D13C720;
      v30[4] = *(_QWORD *)(a1 + 32);
      v32 = v9;
      v15 = &v31;
      v31 = v10;
      dispatch_sync(v25, v30);

      objc_msgSend(v4, "invalidate");
      objc_msgSend(v6, "invalidate");
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "DataStore cleared, requesting historical evaluation from engine", buf, 2u);
      }

      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 80);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_230;
      v26[3] = &unk_24D13C798;
      v26[4] = v13;
      v15 = &v27;
      v16 = v7;
      v27 = v16;
      v28 = v4;
      v29 = v6;
      objc_msgSend(v14, "requestHistoricalEvaluationForAllSourcesWithDatabaseContext:completion:", v16, v26);

    }
  }
  else
  {
    ACHLogAwardScheduling();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v5;
      _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion for 60 seconds with error %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_227;
    block[3] = &unk_24D13A360;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v35 = v10;
    dispatch_sync(v18, block);

  }
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_227(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_229(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_230(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v7 = (void *)v6[7];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_2;
    v18[3] = &unk_24D13C770;
    v18[4] = v6;
    v8 = *(_QWORD *)(a1 + 40);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v7, "commitAllPropertiesToDatabaseWithContext:completion:", v8, v18);

    v9 = v19;
  }
  else
  {
    objc_msgSend(v6, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_4;
    v14 = &unk_24D13C720;
    v15 = *(_QWORD *)(a1 + 32);
    v17 = 0;
    v16 = v5;
    dispatch_sync(v10, &v11);

    objc_msgSend(*(id *)(a1 + 48), "invalidate", v11, v12, v13, v14, v15);
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
    v9 = v16;
  }

}

void __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_2(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  objc_msgSend(a1[4], "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_3;
  block[3] = &unk_24D13C720;
  v7 = a1[4];
  v11 = a2;
  block[4] = v7;
  v10 = v5;
  v8 = v5;
  dispatch_sync(v6, block);

  objc_msgSend(a1[5], "invalidate");
  objc_msgSend(a1[6], "invalidate");

}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __69__ACHTinkerAwardingScheduler__queue_daemon_requestAwardingEvaluation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_callAwardingCompletionsWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_queue_performCleanupTasks
{
  void *v3;

  -[ACHTinkerAwardingScheduler healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ACHTinkerAwardingScheduler _queue_client_performCleanupTasks](self, "_queue_client_performCleanupTasks");
  else
    -[ACHTinkerAwardingScheduler _queue_daemon_performCleanupTasks](self, "_queue_daemon_performCleanupTasks");
}

- (void)_queue_client_performCleanupTasks
{
  ACHEarnedInstanceCleanupUtility *v3;
  void *v4;
  void *v5;
  void *v6;
  ACHEarnedInstanceCleanupUtility *v7;

  v3 = [ACHEarnedInstanceCleanupUtility alloc];
  -[ACHTinkerAwardingScheduler healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTinkerAwardingScheduler keyValueClient](self, "keyValueClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTinkerAwardingScheduler earnedInstanceStore](self, "earnedInstanceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACHEarnedInstanceCleanupUtility initWithHealthStore:keyValueClient:earnedInstanceStore:](v3, "initWithHealthStore:keyValueClient:earnedInstanceStore:", v4, v5, v6);

  -[ACHEarnedInstanceCleanupUtility performCleanup](v7, "performCleanup");
}

- (void)_queue_daemon_performCleanupTasks
{
  ACHEarnedInstanceCleanupUtility *v3;
  void *v4;
  void *v5;
  ACHEarnedInstanceCleanupUtility *v6;

  v3 = [ACHEarnedInstanceCleanupUtility alloc];
  -[ACHTinkerAwardingScheduler earnedInstanceStore](self, "earnedInstanceStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTinkerAwardingScheduler profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACHEarnedInstanceCleanupUtility initWithEarnedInstanceStore:profile:](v3, "initWithEarnedInstanceStore:profile:", v4, v5);

  -[ACHEarnedInstanceCleanupUtility performCleanup](v6, "performCleanup");
}

- (BOOL)_didRunToday
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[ACHTinkerAwardingScheduler lastSuccessfulRunDate](self, "lastSuccessfulRunDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v2);
  v5 = v4 < 86400.0;

  return v5;
}

- (BOOL)_shouldRunImmediatelyOnTemplateLoad
{
  return !-[ACHTinkerAwardingScheduler _didRunToday](self, "_didRunToday");
}

- (void)overrideCoalescingDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHTinkerAwardingScheduler setCoalescingDelayOverride:](self, "setCoalescingDelayOverride:", v4);

}

- (void)addAwardingCompletion:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[ACHTinkerAwardingScheduler queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__ACHTinkerAwardingScheduler_addAwardingCompletion___block_invoke;
    block[3] = &unk_24D13BC70;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __52__ACHTinkerAwardingScheduler_addAwardingCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addAwardingCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addAwardingCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  NSMutableArray *awardEvaluationCompletionBlocks;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = v9;
  if (v9)
  {
    awardEvaluationCompletionBlocks = self->_awardEvaluationCompletionBlocks;
    v7 = (void *)objc_msgSend(v9, "copy");
    v8 = (void *)MEMORY[0x2199C9184]();
    -[NSMutableArray addObject:](awardEvaluationCompletionBlocks, "addObject:", v8);

    v5 = v9;
  }

}

- (void)_queue_callAwardingCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[ACHTinkerAwardingScheduler queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[ACHTinkerAwardingScheduler _queue_performCleanupTasks](self, "_queue_performCleanupTasks");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_awardEvaluationCompletionBlocks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  ACHLogAwardScheduling();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Calling run completion handlers", v13, 2u);
  }

  -[ACHTinkerAwardingScheduler setMaintenanceTaskScheduled:](self, "setMaintenanceTaskScheduled:", 0);
  -[NSMutableArray removeAllObjects](self->_awardEvaluationCompletionBlocks, "removeAllObjects");

}

- (void)dataStoreDidPopulate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ACHTinkerAwardingScheduler queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ACHTinkerAwardingScheduler_dataStoreDidPopulate___block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __51__ACHTinkerAwardingScheduler_dataStoreDidPopulate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  ACHLogAwardScheduling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21407B000, v2, OS_LOG_TYPE_DEFAULT, "[ACHTinkerAwardingScheduler] received data store is loaded", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDataStoreIsLoaded:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldRunImmediatelyOnDataStoreLoad");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_client_requestAwardingEvaluation");
  return result;
}

- (void)setLastSuccessfulRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, a3);
}

- (BOOL)dataStoreIsLoaded
{
  return self->_dataStoreIsLoaded;
}

- (void)setDataStoreIsLoaded:(BOOL)a3
{
  self->_dataStoreIsLoaded = a3;
}

- (BOOL)shouldRunImmediatelyOnDataStoreLoad
{
  return self->_shouldRunImmediatelyOnDataStoreLoad;
}

- (void)setShouldRunImmediatelyOnDataStoreLoad:(BOOL)a3
{
  self->_shouldRunImmediatelyOnDataStoreLoad = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
  objc_storeStrong((id *)&self->_assertionClient, a3);
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueClient, a3);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (ACHDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (ACHEarnedInstanceAwardingEngine)awardingEngine
{
  return self->_awardingEngine;
}

- (void)setAwardingEngine:(id)a3
{
  objc_storeStrong((id *)&self->_awardingEngine, a3);
}

- (HDPeriodicActivity)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (ACHXPCScheduler)xpcScheduler
{
  return self->_xpcScheduler;
}

- (void)setXpcScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_xpcScheduler, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)shouldRetryEarnedInstanceDeletion
{
  return self->_shouldRetryEarnedInstanceDeletion;
}

- (void)setShouldRetryEarnedInstanceDeletion:(BOOL)a3
{
  self->_shouldRetryEarnedInstanceDeletion = a3;
}

- (NSNumber)forceActivityAppInstalled
{
  return self->_forceActivityAppInstalled;
}

- (void)setForceActivityAppInstalled:(id)a3
{
  objc_storeStrong((id *)&self->_forceActivityAppInstalled, a3);
}

- (_HKDelayedOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (NSMutableArray)awardEvaluationCompletionBlocks
{
  return self->_awardEvaluationCompletionBlocks;
}

- (void)setAwardEvaluationCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_awardEvaluationCompletionBlocks, a3);
}

- (OS_dispatch_queue)awardingEvaluationQueue
{
  return self->_awardingEvaluationQueue;
}

- (void)setAwardingEvaluationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_awardingEvaluationQueue, a3);
}

- (NSNumber)coalescingDelayOverride
{
  return self->_coalescingDelayOverride;
}

- (void)setCoalescingDelayOverride:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingDelayOverride, a3);
}

- (HKKeyValueDomain)localKeyValueHSDomain
{
  return self->_localKeyValueHSDomain;
}

- (void)setLocalKeyValueHSDomain:(id)a3
{
  objc_storeStrong((id *)&self->_localKeyValueHSDomain, a3);
}

- (HDKeyValueDomain)localKeyValueDomain
{
  return self->_localKeyValueDomain;
}

- (void)setLocalKeyValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_localKeyValueDomain, a3);
}

- (HDMaintenanceOperation)maintenanceOperation
{
  return self->_maintenanceOperation;
}

- (void)setMaintenanceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_maintenanceOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maintenanceOperation, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_localKeyValueHSDomain, 0);
  objc_storeStrong((id *)&self->_coalescingDelayOverride, 0);
  objc_storeStrong((id *)&self->_awardingEvaluationQueue, 0);
  objc_storeStrong((id *)&self->_awardEvaluationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_forceActivityAppInstalled, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_xpcScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_awardingEngine, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, 0);
}

@end
