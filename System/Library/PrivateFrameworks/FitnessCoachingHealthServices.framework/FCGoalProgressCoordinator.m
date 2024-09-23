@implementation FCGoalProgressCoordinator

- (FCGoalProgressCoordinator)initWithDateProvider:(id)a3 debouncer:(id)a4 profile:(id)a5 scheduler:(id)a6 serviceQueue:(id)a7 store:(id)a8 typicalDayProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  FCGoalProgressCoordinator *v19;
  FCGoalProgressCoordinator *v20;
  NSArray *progressEvents;
  id WeakRetained;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v16 = a5;
  v25 = a6;
  v24 = a7;
  v17 = a8;
  v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)FCGoalProgressCoordinator;
  v19 = -[FCGoalProgressCoordinator init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dateProvider, a3);
    objc_storeStrong((id *)&v20->_debouncer, a4);
    objc_storeWeak((id *)&v20->_profile, v16);
    objc_storeStrong((id *)&v20->_scheduler, a6);
    objc_storeStrong((id *)&v20->_serviceQueue, a7);
    objc_storeStrong((id *)&v20->_store, a8);
    objc_storeStrong((id *)&v20->_typicalDayProvider, a9);
    progressEvents = v20->_progressEvents;
    v20->_progressEvents = 0;

    WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v20, v20->_serviceQueue, v24, v25, v26, v27);

  }
  return v20;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FCCXPCActivityScheduler *scheduler;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProtectedDataObserver:", self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_progressEvents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        scheduler = self->_scheduler;
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "eventIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCXPCActivityScheduler cancelActivityWithName:](scheduler, "cancelActivityWithName:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)FCGoalProgressCoordinator;
  -[FCGoalProgressCoordinator dealloc](&v12, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *serviceQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addProtectedDataObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__todayActivityChanged_, *MEMORY[0x1E0D21750], 0);

  -[FCGoalProgressStore currentConfiguration](self->_store, "currentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5298];
  v10 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, "Loaded goal progress configuration %@", (uint8_t *)&v19, 0xCu);
  }
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v8, "expirationDate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "hk_isAfterDate:", v11),
        v12,
        (v13 & 1) != 0))
  {
    -[FCGoalProgressCoordinator _onqueue_handleGoalProgressConfiguration:](self, "_onqueue_handleGoalProgressConfiguration:", v8);
    -[FCTypicalDayProvider typicalDayModel](self->_typicalDayProvider, "typicalDayModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      self->_typicalDayModelLoaded = 1;
      -[FCGoalProgressCoordinator _onqueue_rescheduleEvents](self, "_onqueue_rescheduleEvents");
    }
    else
    {
      _HKInitializeLogging();
      v18 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1CC30F000, v18, OS_LOG_TYPE_DEFAULT, "Typical day model has not loaded yet", (uint8_t *)&v19, 2u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v8, "expirationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v8;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CC30F000, v16, OS_LOG_TYPE_DEFAULT, "Invalid loaded configuration %@, expiration %@, now %@", (uint8_t *)&v19, 0x20u);

    }
  }

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *serviceQueue;
  _QWORD block[5];

  if (a4)
  {
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__FCGoalProgressCoordinator_database_protectedDataDidBecomeAvailable___block_invoke;
    block[3] = &unk_1E8800798;
    block[4] = self;
    dispatch_async(serviceQueue, block);
  }
}

uint64_t __70__FCGoalProgressCoordinator_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "debounce");
}

- (void)_onqueue_runEvaluation
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  void *v8;
  char v9;
  FCCGoalProgressConfiguration *currentConfiguration;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  os_log_t v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB5298];
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Running goal progress evaluation", (uint8_t *)&v35, 2u);
  }
  if (-[FCGoalProgressDebouncer inProgress](self->_debouncer, "inProgress"))
  {
    _HKInitializeLogging();
    v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v35) = 0;
    v6 = "Debounce in progress, not evaluating goal progress";
    goto LABEL_15;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProtectedDataAvailable");

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v35) = 0;
    v6 = "Protected data unavailable, not evaluating goal progress";
    goto LABEL_15;
  }
  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration)
  {
    -[FCCGoalProgressConfiguration expirationDate](currentConfiguration, "expirationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hk_isBeforeOrEqualToDate:", v12);

    if (v13)
    {
      _HKInitializeLogging();
      v5 = *v3;
      if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v35) = 0;
      v6 = "Not evaluating, goal progress configuration has expired";
      goto LABEL_15;
    }
    -[FCTypicalDayProvider typicalDayModel](self->_typicalDayProvider, "typicalDayModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCGoalProgressCoordinator _minimumActiveDaysOverride](self, "_minimumActiveDaysOverride");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "integerValue");
    else
      v17 = -[FCCGoalProgressConfiguration minimumNumberOfActiveDays](self->_currentConfiguration, "minimumNumberOfActiveDays");
    v18 = v17;
    v19 = objc_msgSend(v14, "totalActiveDays");
    if (v19 < v18)
    {
      v20 = v19;
      _HKInitializeLogging();
      v21 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 134218240;
        v36 = v20;
        v37 = 2048;
        v38 = v18;
        _os_log_impl(&dword_1CC30F000, v21, OS_LOG_TYPE_DEFAULT, "User hasn't reached enough active days: %ld vs %ld", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_35;
    }
    +[FCGoalProgressEvaluator evaluateEvents:withModel:evaluationDelegate:](FCGoalProgressEvaluator, "evaluateEvents:withModel:evaluationDelegate:", self->_progressEvents, v14, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      _HKInitializeLogging();
      v32 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_1CC30F000, v32, OS_LOG_TYPE_DEFAULT, "No event to show goal progress evaluation", (uint8_t *)&v35, 2u);
      }
      goto LABEL_34;
    }
    objc_msgSend(v23, "goalProgressContentForModel:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTypicalDayProvider onServiceQueue_currentActivityCacheSummary](self->_typicalDayProvider, "onServiceQueue_currentActivityCacheSummary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isPaused");

    _HKInitializeLogging();
    v28 = *v3;
    v29 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
    if ((v27 & 1) != 0)
    {
      if (!v29)
      {
LABEL_33:
        -[FCGoalProgressCoordinator _onqueue_notificationPosted:](self, "_onqueue_notificationPosted:", v25);

LABEL_34:
LABEL_35:

        return;
      }
      v30 = v28;
      objc_msgSend(v24, "eventIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412546;
      v36 = (uint64_t)v31;
      v37 = 2112;
      v38 = (uint64_t)v22;
      _os_log_impl(&dword_1CC30F000, v30, OS_LOG_TYPE_DEFAULT, "Goal progress not posting event %@ from fired events %@ because we are currently paused", (uint8_t *)&v35, 0x16u);

    }
    else
    {
      if (v29)
      {
        v33 = v28;
        objc_msgSend(v24, "eventIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = (uint64_t)v34;
        v37 = 2112;
        v38 = (uint64_t)v22;
        _os_log_impl(&dword_1CC30F000, v33, OS_LOG_TYPE_DEFAULT, "Goal progress posting event %@ from fired events %@", (uint8_t *)&v35, 0x16u);

      }
      v30 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject coordinator:eventFiredWithContent:](v30, "coordinator:eventFiredWithContent:", self, v25);
    }

    goto LABEL_33;
  }
  _HKInitializeLogging();
  v5 = *v3;
  if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    return;
  LOWORD(v35) = 0;
  v6 = "Not evaluating, goal progress configuration doesn't exist";
LABEL_15:
  _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v35, 2u);
}

- (void)registerGoalProgressConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serviceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__FCGoalProgressCoordinator_registerGoalProgressConfiguration_completion___block_invoke;
  block[3] = &unk_1E88008A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serviceQueue, block);

}

uint64_t __74__FCGoalProgressCoordinator_registerGoalProgressConfiguration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerGoalProgressConfiguration:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_onqueue_registerGoalProgressConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *serviceQueue;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  serviceQueue = self->_serviceQueue;
  v8 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(serviceQueue);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1CC30F000, v9, OS_LOG_TYPE_DEFAULT, "Goal progress registering configuration: %@", (uint8_t *)&v10, 0xCu);
  }
  -[FCGoalProgressStore storeCurrentConfiguration:](self->_store, "storeCurrentConfiguration:", v6);
  -[FCGoalProgressCoordinator _onqueue_handleGoalProgressConfiguration:](self, "_onqueue_handleGoalProgressConfiguration:", v6);
  -[FCGoalProgressCoordinator _onqueue_rescheduleEvents](self, "_onqueue_rescheduleEvents");
  v8[2](v8, 0);

}

- (void)_onqueue_handleGoalProgressConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  FCTypicalDayProvider *typicalDayProvider;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FCAlmostThereEvent *v16;
  void *v17;
  FCAlmostThereEvent *v18;
  FCAtypicalDayEvent *v19;
  void *v20;
  FCAtypicalDayEvent *v21;
  FCCompletionOffTrackEvent *v22;
  void *v23;
  FCCompletionOffTrackEvent *v24;
  NSArray *v25;
  NSArray *progressEvents;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentConfiguration, a3);
  objc_msgSend(v5, "userStartOfDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTypicalDayProvider setUserStartOfDay:](self->_typicalDayProvider, "setUserStartOfDay:", v6);

  objc_msgSend(v5, "userEndOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTypicalDayProvider setUserEndOfDay:](self->_typicalDayProvider, "setUserEndOfDay:", v7);

  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5298];
  v9 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    typicalDayProvider = self->_typicalDayProvider;
    v11 = v9;
    -[FCTypicalDayProvider typicalDayModel](typicalDayProvider, "typicalDayModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userStartOfDay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTypicalDayProvider typicalDayModel](self->_typicalDayProvider, "typicalDayModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userEndOfDay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v13;
    v39 = 2112;
    v40 = v15;
    _os_log_impl(&dword_1CC30F000, v11, OS_LOG_TYPE_DEFAULT, "Goal progress using user start date: %@, user end date: %@", buf, 0x16u);

  }
  v16 = [FCAlmostThereEvent alloc];
  objc_msgSend(v5, "almostThereConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCAlmostThereEvent initWithConfiguration:](v16, "initWithConfiguration:", v17);

  v19 = [FCAtypicalDayEvent alloc];
  objc_msgSend(v5, "atypicalDayConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[FCAtypicalDayEvent initWithConfiguration:](v19, "initWithConfiguration:", v20);

  v22 = [FCCompletionOffTrackEvent alloc];
  objc_msgSend(v5, "completionOffTrackConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[FCCompletionOffTrackEvent initWithConfiguration:](v22, "initWithConfiguration:", v23);

  v36[0] = v21;
  v36[1] = v24;
  v36[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  progressEvents = self->_progressEvents;
  self->_progressEvents = v25;

  _HKInitializeLogging();
  v27 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    objc_msgSend(v5, "almostThereConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v29;
    _os_log_impl(&dword_1CC30F000, v28, OS_LOG_TYPE_DEFAULT, "Goal progress added almost there configuration %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v30 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    objc_msgSend(v5, "atypicalDayConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v32;
    _os_log_impl(&dword_1CC30F000, v31, OS_LOG_TYPE_DEFAULT, "Goal progress added atypical day configuration %@", buf, 0xCu);

  }
  _HKInitializeLogging();
  v33 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    objc_msgSend(v5, "completionOffTrackConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v35;
    _os_log_impl(&dword_1CC30F000, v34, OS_LOG_TYPE_DEFAULT, "Goal progress added completion off track configuration %@", buf, 0xCu);

  }
}

- (void)_onqueue_rescheduleEvents
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  FCCGoalProgressConfiguration *currentConfiguration;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB5298];
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling goal progress if needed", buf, 2u);
  }
  -[FCGoalProgressStore scheduledEventIdentifiers](self->_store, "scheduledEventIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentConfiguration = self->_currentConfiguration;
  if (!currentConfiguration)
  {
    _HKInitializeLogging();
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not scheduling, goal progress configuration doesn't exist";
      goto LABEL_15;
    }
LABEL_16:
    -[FCGoalProgressCoordinator _onqueue_unscheduleEventIdentifiers:](self, "_onqueue_unscheduleEventIdentifiers:", v5);
    -[FCGoalProgressStore clearScheduledEventIdentifiers](self->_store, "clearScheduledEventIdentifiers");
    goto LABEL_17;
  }
  -[FCCGoalProgressConfiguration expirationDate](currentConfiguration, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8);

  if (v9)
  {
    _HKInitializeLogging();
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not scheduling, goal progress configuration has expired";
LABEL_15:
      _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!self->_progressEvents)
  {
    _HKInitializeLogging();
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not scheduling, goal progress events don't exist";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;
  -[FCTypicalDayProvider typicalDayModel](self->_typicalDayProvider, "typicalDayModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCGoalProgressEvaluator nextScheduledDatesByEventIdentifiersForEvents:model:evaluationDelegate:](FCGoalProgressEvaluator, "nextScheduledDatesByEventIdentifiersForEvents:model:evaluationDelegate:", self->_progressEvents, v15, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v17 = *v3;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v16;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_1CC30F000, v17, OS_LOG_TYPE_DEFAULT, "Goal progress generated scheduled dates %@, for current date %@", buf, 0x16u);
  }
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke;
  v28[3] = &__block_descriptor_40_e29_B24__0__NSString_8__NSDate_16l;
  v28[4] = v14;
  objc_msgSend(v16, "hk_filter:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_2;
  v27[3] = &unk_1E88008E8;
  v27[4] = self;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_199;
  v25[3] = &unk_1E8800910;
  v26 = v19;
  v20 = v19;
  objc_msgSend(v5, "hk_filter:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCGoalProgressCoordinator _onqueue_unscheduleEventIdentifiers:](self, "_onqueue_unscheduleEventIdentifiers:", v21);
  -[FCGoalProgressStore clearScheduledEventIdentifiers](self->_store, "clearScheduledEventIdentifiers");
  v22 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v20, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCGoalProgressStore storeScheduledEventIdentifiers:](self->_store, "storeScheduledEventIdentifiers:", v24);
LABEL_17:

}

BOOL __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return v4 > *(double *)(a1 + 32);
}

void __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "scheduleActivityWithName:scheduledDate:", v5, v6);
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1CC30F000, v7, OS_LOG_TYPE_DEFAULT, "Scheduled date %{public}@ for progress event %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

uint64_t __54__FCGoalProgressCoordinator__onqueue_rescheduleEvents__block_invoke_199(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (void)_onqueue_unscheduleEventIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    v9 = (os_log_t *)MEMORY[0x1E0CB5298];
    *(_QWORD *)&v6 = 138412290;
    v13 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        _HKInitializeLogging();
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v11;
          _os_log_impl(&dword_1CC30F000, v12, OS_LOG_TYPE_DEFAULT, "Canceling scheduled event identifier %@", buf, 0xCu);
        }
        -[FCCXPCActivityScheduler cancelActivityWithName:](self->_scheduler, "cancelActivityWithName:", v11, v13);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void)_onqueue_notificationPosted:(id)a3
{
  NSObject *serviceQueue;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  FCGoalProgressStore *store;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  objc_msgSend(v5, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("ProgressUpdate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CC30F000, v8, OS_LOG_TYPE_DEFAULT, "Storing date for fired event: %@", buf, 0xCu);
  }
  store = self->_store;
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCGoalProgressStore storeFiredEventDate:identifier:](store, "storeFiredEventDate:identifier:", v10, v7);

}

- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5
{
  NSObject *serviceQueue;
  void (**v7)(void);

  serviceQueue = self->_serviceQueue;
  v7 = (void (**)(void))a5;
  dispatch_assert_queue_V2(serviceQueue);
  -[FCGoalProgressCoordinator _onqueue_runEvaluation](self, "_onqueue_runEvaluation");
  v7[2]();

}

- (void)debouncerDidFinishDebounce:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Debounce on protected data change finished for goal progress", v5, 2u);
  }
  -[FCGoalProgressCoordinator _onqueue_runEvaluation](self, "_onqueue_runEvaluation");
}

- (void)_todayActivityChanged:(id)a3
{
  NSObject *serviceQueue;
  _QWORD block[5];

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FCGoalProgressCoordinator__todayActivityChanged___block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __51__FCGoalProgressCoordinator__todayActivityChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 72))
  {
    objc_msgSend(*(id *)(v2 + 80), "typicalDayModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      *(_BYTE *)(v2 + 72) = 1;
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling now that typical day model has loaded", v6, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_onqueue_rescheduleEvents");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  return objc_msgSend((id)v2, "_onqueue_runEvaluation");
}

- (id)currentDate
{
  return (id)-[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
}

- (id)currentCalendar
{
  return (id)-[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
}

- (id)lastFiredDateForProgressEventIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("ProgressUpdate"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCGoalProgressStore lastFiredEventDateForIdentifier:](self->_store, "lastFiredEventDateForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)currentExperienceType
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;

  if (v6)
  {
    -[FCGoalProgressCoordinator currentCalendar](self, "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCGoalProgressCoordinator currentDate](self, "currentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();

  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
        -[FCGoalProgressCoordinator currentExperienceType].cold.1((uint64_t)v7, v11);
    }
    v10 = 1;
  }

  return v10;
}

- (id)_minimumActiveDaysOverride
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D22010]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D22018]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FCGoalProgressCoordinatorDelegate)delegate
{
  return (FCGoalProgressCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_progressEvents, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

- (void)currentExperienceType
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CC30F000, a2, OS_LOG_TYPE_ERROR, "FCGoalProgressCoordinator failed to get date of birth: %@", (uint8_t *)&v2, 0xCu);
}

@end
