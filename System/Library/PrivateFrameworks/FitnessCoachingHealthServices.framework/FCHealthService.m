@implementation FCHealthService

- (FCHealthService)initWithProfile:(id)a3
{
  id v4;
  FCHealthService *v5;
  NSObject *v6;
  uint64_t v7;
  OS_dispatch_queue *serviceQueue;
  FCAppInstallationObserver *v9;
  FCAppInstallationObserver *appInstallationObserver;
  FCPauseRingsSampleObserver *v11;
  FCPauseRingsSampleObserver *pauseRingsSampleObserver;
  id WeakRetained;
  NSObject *v14;
  _QWORD block[4];
  FCHealthService *v17;
  uint8_t buf[16];
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCHealthService;
  v5 = -[FCHealthService init](&v19, sel_init);
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CC30F000, v6, OS_LOG_TYPE_DEFAULT, "Starting FCHealthService...", buf, 2u);
    }
    HDCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    serviceQueue = v5->_serviceQueue;
    v5->_serviceQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_profile, v4);
    v9 = objc_alloc_init(FCAppInstallationObserver);
    appInstallationObserver = v5->_appInstallationObserver;
    v5->_appInstallationObserver = v9;

    v11 = -[FCPauseRingsSampleObserver initWithProfile:]([FCPauseRingsSampleObserver alloc], "initWithProfile:", v4);
    pauseRingsSampleObserver = v5->_pauseRingsSampleObserver;
    v5->_pauseRingsSampleObserver = v11;

    WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v5, v5->_serviceQueue);

    v14 = v5->_serviceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__FCHealthService_initWithProfile___block_invoke;
    block[3] = &unk_1E8800798;
    v17 = v5;
    dispatch_async(v14, block);

  }
  return v5;
}

uint64_t __35__FCHealthService_initWithProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerForStandalonePhoneModeChange");
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerForAppInstallationChange");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateService");
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_sampleNotificationToken))
  {
    notify_cancel(self->_sampleNotificationToken);
    self->_sampleNotificationToken = -1;
  }
  if (notify_is_valid_token(self->_standalonePhoneNotificationToken))
  {
    notify_cancel(self->_standalonePhoneNotificationToken);
    self->_standalonePhoneNotificationToken = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)FCHealthService;
  -[FCHealthService dealloc](&v3, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSObject *serviceQueue;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  if (!notify_is_valid_token(self->_sampleNotificationToken))
  {
    objc_initWeak(&location, self);
    serviceQueue = self->_serviceQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__FCHealthService_profileDidBecomeReady___block_invoke;
    v6[3] = &unk_1E88009E0;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("com.apple.FitnessCoaching.SampleNotification", &self->_sampleNotificationToken, serviceQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __41__FCHealthService_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postSampleNotification");

}

- (void)_postSampleNotification
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D22158]);
  objc_msgSend(v2, "postSampleNotificationWithCompletion:", &__block_literal_global_1);

}

void __42__FCHealthService__postSampleNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5298];
  v4 = *MEMORY[0x1E0CB5298];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__FCHealthService__postSampleNotification__block_invoke_cold_1((uint64_t)v2, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CC30F000, v3, OS_LOG_TYPE_DEFAULT, "Posted notification!", v5, 2u);
  }

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
  block[2] = __64__FCHealthService_registerGoalProgressConfiguration_completion___block_invoke;
  block[3] = &unk_1E88008A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serviceQueue, block);

}

uint64_t __64__FCHealthService_registerGoalProgressConfiguration_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "registerGoalProgressConfiguration:completion:", a1[5], a1[6]);
}

- (void)coordinator:(id)a3 postGoalCompletionNotification:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D22120];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__FCHealthService_coordinator_postGoalCompletionNotification___block_invoke;
  v10[3] = &unk_1E8800A98;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "postGoalCompletionNotification:completion:", v9, v10);
  objc_msgSend(v7, "notificationPosted:", v9);

}

void __62__FCHealthService_coordinator_postGoalCompletionNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Posted goal completion notification: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)coordinator:(id)a3 eventFiredWithContent:(id)a4
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0D22130]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__FCHealthService_coordinator_eventFiredWithContent___block_invoke;
  v7[3] = &unk_1E8800A98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "postGoalProgressNotification:completion:", v6, v7);

}

void __53__FCHealthService_coordinator_eventFiredWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1CC30F000, v4, OS_LOG_TYPE_DEFAULT, "Posted goal progress notification: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)coordinator:(id)a3 postMoveModeNotification:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D22148]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__FCHealthService_coordinator_postMoveModeNotification___block_invoke;
  v10[3] = &unk_1E8800AC0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "postMoveModeNotification:completion:", v8, v10);

}

uint64_t __56__FCHealthService_coordinator_postMoveModeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationPosted:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_onqueue_registerForStandalonePhoneModeChange
{
  const char *v3;
  NSObject *serviceQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x1E0CB5F68];
  serviceQueue = self->_serviceQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__FCHealthService__onqueue_registerForStandalonePhoneModeChange__block_invoke;
  v5[3] = &unk_1E88009E0;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_standalonePhoneNotificationToken, serviceQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__FCHealthService__onqueue_registerForStandalonePhoneModeChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onqueue_updateService");

}

- (void)_onqueue_registerForAppInstallationChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__appInstallationChanged_, CFSTR("FCFitnessInstallStateChangedNotification"), 0);

}

- (void)_appInstallationChanged:(id)a3
{
  NSObject *serviceQueue;
  _QWORD block[5];

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FCHealthService__appInstallationChanged___block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __43__FCHealthService__appInstallationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateService");
}

- (void)_onqueue_updateService
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  FCGoalCompletionStore *v13;
  id WeakRetained;
  FCGoalCompletionStore *v15;
  FCGoalCompletionStore *goalCompletionStore;
  FCGoalCompletionCoordinator *v17;
  id v18;
  FCGoalCompletionCoordinator *v19;
  FCGoalCompletionCoordinator *goalCompletionCoordinator;
  FCGoalCompletionActivitySummaryObserver *v21;
  id v22;
  FCGoalCompletionActivitySummaryObserver *v23;
  FCGoalCompletionActivitySummaryObserver *goalCompletionActivitySummaryObserver;
  FCCDateProvider *v25;
  FCCDateProvider *dateProvider;
  FCGoalProgressStore *v27;
  id v28;
  FCGoalProgressStore *v29;
  FCGoalProgressStore *goalProgressStore;
  FCCXPCActivityScheduler *v31;
  FCCXPCActivityScheduler *goalProgressScheduler;
  FCTypicalDayProvider *v33;
  FCCDateProvider *v34;
  id v35;
  FCTypicalDayProvider *v36;
  FCTypicalDayProvider *typicalDayProvider;
  FCGoalProgressDebouncer *v38;
  FCGoalProgressDebouncer *goalProgressDebouncer;
  FCGoalProgressCoordinator *v40;
  FCCDateProvider *v41;
  FCGoalProgressDebouncer *v42;
  id v43;
  FCGoalProgressCoordinator *v44;
  FCGoalProgressCoordinator *goalProgressCoordinator;
  FCMoveModeCoordinator *v46;
  FCCDateProvider *v47;
  id v48;
  FCMoveModeCoordinator *v49;
  FCMoveModeCoordinator *moveModeCoordinator;
  NSObject *v51;
  const char *v52;
  FCCDateProvider *v53;
  FCGoalCompletionStore *v54;
  FCGoalCompletionCoordinator *v55;
  FCGoalCompletionActivitySummaryObserver *v56;
  FCGoalProgressDebouncer *v57;
  FCGoalProgressStore *v58;
  FCCXPCActivityScheduler *v59;
  FCTypicalDayProvider *v60;
  FCGoalProgressCoordinator *v61;
  FCMoveModeCoordinator *v62;
  uint8_t buf[4];
  int v64;
  __int16 v65;
  _BOOL4 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB5298];
  v4 = (void *)*MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB6F18];
    v6 = v4;
    objc_msgSend(v5, "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStandalonePhoneFitnessMode");
    v9 = -[FCAppInstallationObserver fitnessAppInstalled](self->_appInstallationObserver, "fitnessAppInstalled");
    *(_DWORD *)buf = 67109376;
    v64 = v8;
    v65 = 1024;
    v66 = v9;
    _os_log_impl(&dword_1CC30F000, v6, OS_LOG_TYPE_DEFAULT, "FCHealthService updating with standalone %{BOOL}d, app installed %{BOOL}d", buf, 0xEu);

  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isStandalonePhoneFitnessMode") & 1) != 0)
  {
    v11 = -[FCAppInstallationObserver fitnessAppInstalled](self->_appInstallationObserver, "fitnessAppInstalled");

    v12 = !self->_serviceEnabled;
    if (!self->_serviceEnabled && v11)
    {
      v13 = [FCGoalCompletionStore alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v15 = -[FCGoalCompletionStore initWithProfile:](v13, "initWithProfile:", WeakRetained);
      goalCompletionStore = self->_goalCompletionStore;
      self->_goalCompletionStore = v15;

      v17 = [FCGoalCompletionCoordinator alloc];
      v18 = objc_loadWeakRetained((id *)&self->_profile);
      v19 = -[FCGoalCompletionCoordinator initWithProfile:goalCompletionStore:serviceQueue:](v17, "initWithProfile:goalCompletionStore:serviceQueue:", v18, self->_goalCompletionStore, self->_serviceQueue);
      goalCompletionCoordinator = self->_goalCompletionCoordinator;
      self->_goalCompletionCoordinator = v19;

      -[FCGoalCompletionCoordinator setDelegate:](self->_goalCompletionCoordinator, "setDelegate:", self);
      v21 = [FCGoalCompletionActivitySummaryObserver alloc];
      v22 = objc_loadWeakRetained((id *)&self->_profile);
      v23 = -[FCGoalCompletionActivitySummaryObserver initWithProfile:serviceQueue:](v21, "initWithProfile:serviceQueue:", v22, self->_serviceQueue);
      goalCompletionActivitySummaryObserver = self->_goalCompletionActivitySummaryObserver;
      self->_goalCompletionActivitySummaryObserver = v23;

      -[FCGoalCompletionActivitySummaryObserver setDelegate:](self->_goalCompletionActivitySummaryObserver, "setDelegate:", self->_goalCompletionCoordinator);
      v25 = (FCCDateProvider *)objc_alloc_init(MEMORY[0x1E0D22108]);
      dateProvider = self->_dateProvider;
      self->_dateProvider = v25;

      v27 = [FCGoalProgressStore alloc];
      v28 = objc_loadWeakRetained((id *)&self->_profile);
      v29 = -[FCGoalProgressStore initWithProfile:](v27, "initWithProfile:", v28);
      goalProgressStore = self->_goalProgressStore;
      self->_goalProgressStore = v29;

      v31 = (FCCXPCActivityScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D221A8]), "initWithDateProvider:dispatchQueue:", self->_dateProvider, self->_serviceQueue);
      goalProgressScheduler = self->_goalProgressScheduler;
      self->_goalProgressScheduler = v31;

      v33 = [FCTypicalDayProvider alloc];
      v34 = self->_dateProvider;
      v35 = objc_loadWeakRetained((id *)&self->_profile);
      v36 = -[FCTypicalDayProvider initWithDateProvider:profile:serviceQueue:](v33, "initWithDateProvider:profile:serviceQueue:", v34, v35, self->_serviceQueue);
      typicalDayProvider = self->_typicalDayProvider;
      self->_typicalDayProvider = v36;

      v38 = -[FCGoalProgressDebouncer initWithServiceQueue:]([FCGoalProgressDebouncer alloc], "initWithServiceQueue:", self->_serviceQueue);
      goalProgressDebouncer = self->_goalProgressDebouncer;
      self->_goalProgressDebouncer = v38;

      v40 = [FCGoalProgressCoordinator alloc];
      v41 = self->_dateProvider;
      v42 = self->_goalProgressDebouncer;
      v43 = objc_loadWeakRetained((id *)&self->_profile);
      v44 = -[FCGoalProgressCoordinator initWithDateProvider:debouncer:profile:scheduler:serviceQueue:store:typicalDayProvider:](v40, "initWithDateProvider:debouncer:profile:scheduler:serviceQueue:store:typicalDayProvider:", v41, v42, v43, self->_goalProgressScheduler, self->_serviceQueue, self->_goalProgressStore, self->_typicalDayProvider);
      goalProgressCoordinator = self->_goalProgressCoordinator;
      self->_goalProgressCoordinator = v44;

      -[FCGoalProgressDebouncer setDelegate:](self->_goalProgressDebouncer, "setDelegate:", self->_goalProgressCoordinator);
      -[FCCXPCActivityScheduler setDelegate:](self->_goalProgressScheduler, "setDelegate:", self->_goalProgressCoordinator);
      -[FCGoalProgressCoordinator setDelegate:](self->_goalProgressCoordinator, "setDelegate:", self);
      v46 = [FCMoveModeCoordinator alloc];
      v47 = self->_dateProvider;
      v48 = objc_loadWeakRetained((id *)&self->_profile);
      v49 = -[FCMoveModeCoordinator initWithDateProvider:profile:serviceQueue:](v46, "initWithDateProvider:profile:serviceQueue:", v47, v48, self->_serviceQueue);
      moveModeCoordinator = self->_moveModeCoordinator;
      self->_moveModeCoordinator = v49;

      -[FCMoveModeCoordinator setDelegate:](self->_moveModeCoordinator, "setDelegate:", self);
      self->_serviceEnabled = 1;
      _HKInitializeLogging();
      v51 = *v3;
      if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)buf = 0;
      v52 = "FCHealthService enabled";
      goto LABEL_13;
    }
  }
  else
  {

    LOBYTE(v11) = 0;
    v12 = !self->_serviceEnabled;
  }
  if (!v12 && !v11)
  {
    v53 = self->_dateProvider;
    self->_dateProvider = 0;

    v54 = self->_goalCompletionStore;
    self->_goalCompletionStore = 0;

    -[FCGoalCompletionCoordinator setDelegate:](self->_goalCompletionCoordinator, "setDelegate:", 0);
    v55 = self->_goalCompletionCoordinator;
    self->_goalCompletionCoordinator = 0;

    -[FCGoalCompletionActivitySummaryObserver setDelegate:](self->_goalCompletionActivitySummaryObserver, "setDelegate:", 0);
    v56 = self->_goalCompletionActivitySummaryObserver;
    self->_goalCompletionActivitySummaryObserver = 0;

    -[FCGoalProgressDebouncer setDelegate:](self->_goalProgressDebouncer, "setDelegate:", 0);
    v57 = self->_goalProgressDebouncer;
    self->_goalProgressDebouncer = 0;

    v58 = self->_goalProgressStore;
    self->_goalProgressStore = 0;

    -[FCCXPCActivityScheduler setDelegate:](self->_goalProgressScheduler, "setDelegate:", 0);
    v59 = self->_goalProgressScheduler;
    self->_goalProgressScheduler = 0;

    v60 = self->_typicalDayProvider;
    self->_typicalDayProvider = 0;

    -[FCGoalProgressCoordinator setDelegate:](self->_goalProgressCoordinator, "setDelegate:", 0);
    v61 = self->_goalProgressCoordinator;
    self->_goalProgressCoordinator = 0;

    -[FCMoveModeCoordinator setDelegate:](self->_moveModeCoordinator, "setDelegate:", 0);
    v62 = self->_moveModeCoordinator;
    self->_moveModeCoordinator = 0;

    self->_serviceEnabled = 0;
    _HKInitializeLogging();
    v51 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "FCHealthService disabled";
LABEL_13:
      _os_log_impl(&dword_1CC30F000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pauseRingsSampleObserver, 0);
  objc_storeStrong((id *)&self->_moveModeCoordinator, 0);
  objc_storeStrong((id *)&self->_goalProgressStore, 0);
  objc_storeStrong((id *)&self->_goalProgressScheduler, 0);
  objc_storeStrong((id *)&self->_goalProgressDebouncer, 0);
  objc_storeStrong((id *)&self->_goalProgressCoordinator, 0);
  objc_storeStrong((id *)&self->_goalCompletionStore, 0);
  objc_storeStrong((id *)&self->_goalCompletionCoordinator, 0);
  objc_storeStrong((id *)&self->_goalCompletionActivitySummaryObserver, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_appInstallationObserver, 0);
}

void __42__FCHealthService__postSampleNotification__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CC30F000, a2, OS_LOG_TYPE_ERROR, "Failed to post notification: %@", (uint8_t *)&v2, 0xCu);
}

@end
