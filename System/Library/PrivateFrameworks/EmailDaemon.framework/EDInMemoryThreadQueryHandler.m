@implementation EDInMemoryThreadQueryHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EDInMemoryThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1)
    dispatch_once(&log_onceToken_34, block);
  return (OS_os_log *)(id)log_log_34;
}

void __35__EDInMemoryThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_34;
  log_log_34 = (uint64_t)v1;

}

- (EDInMemoryThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11 helperObserver:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  EDInMemoryThreadQueryHandler *v23;
  EDInMemoryThreadQueryHandler *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *changesWhilePaused;
  void *v27;
  uint64_t v28;
  NSArray *messageSortDescriptors;
  EDUpdateThrottler *v30;
  EDUpdateThrottler *updateThrottler;
  EMThreadReloadSummaryHelper *v32;
  EMThreadReloadSummaryHelper *reloadSummaryHelper;
  void *v34;
  void *v35;
  uint64_t v36;
  EFAssertableScheduler *scheduler;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *contentProtectionQueue;
  NSObject *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *resultQueue;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  EMMailboxScope *mailboxScope;
  int v49;
  _EDMessageQueryHelperDelegateImpl *v50;
  _EDMessageQueryHelperDelegateImpl *v51;
  id v52;
  objc_class *v53;
  void *v54;
  uint64_t v55;
  EMCollectionItemIDStateCapturer *stateCapturer;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  EMInMemoryThreadCollection *threadCollection;
  NSObject *v64;
  EMInMemoryThreadCollection *v65;
  void *v66;
  void *v67;
  uint64_t v69;
  id *obj;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  _QWORD v80[4];
  id v81;
  id location;
  objc_super v83;
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v85;
  __int16 v86;
  EMInMemoryThreadCollection *v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  obj = (id *)a7;
  v73 = a7;
  v74 = a8;
  v21 = a9;
  v22 = a10;
  v78 = a11;
  v76 = v22;
  v77 = a12;
  v83.receiver = self;
  v83.super_class = (Class)EDInMemoryThreadQueryHandler;
  v71 = v19;
  v72 = v20;
  v75 = v21;
  v23 = -[EDMessageRepositoryQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:](&v83, sel_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_observer_observationIdentifier_, v17, v18, v19, v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_vipManager, a7);
    objc_storeStrong((id *)&v24->_searchProvider, a8);
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    changesWhilePaused = v24->_changesWhilePaused;
    v24->_changesWhilePaused = v25;

    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
    v28 = objc_claimAutoreleasedReturnValue();
    messageSortDescriptors = v24->_messageSortDescriptors;
    v24->_messageSortDescriptors = (NSArray *)v28;

    v30 = -[EDUpdateThrottler initWithName:delayInterval:resumable:]([EDUpdateThrottler alloc], "initWithName:delayInterval:resumable:", CFSTR("In-memory threads"), v78, 0.0);
    updateThrottler = v24->_updateThrottler;
    v24->_updateThrottler = v30;

    v32 = (EMThreadReloadSummaryHelper *)objc_alloc_init(MEMORY[0x1E0D1E388]);
    reloadSummaryHelper = v24->_reloadSummaryHelper;
    v24->_reloadSummaryHelper = v32;

    v34 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.%p"), objc_opt_class(), v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "serialDispatchQueueSchedulerWithName:qualityOfService:", v35, 25);
    v36 = objc_claimAutoreleasedReturnValue();
    scheduler = v24->_scheduler;
    v24->_scheduler = (EFAssertableScheduler *)v36;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = dispatch_queue_create("com.apple.mail.EDInMemoryThreadQueryHandler.contentProtection", v38);
    contentProtectionQueue = v24->_contentProtectionQueue;
    v24->_contentProtectionQueue = (OS_dispatch_queue *)v39;

    dispatch_queue_set_specific((dispatch_queue_t)v24->_contentProtectionQueue, &kContentProtectionQueueKey, v24, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = dispatch_queue_create("com.apple.mail.EDInMemoryThreadQueryHandler.result", v41);
    resultQueue = v24->_resultQueue;
    v24->_resultQueue = (OS_dispatch_queue *)v42;

    v44 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v17, "predicate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mailboxPersistence");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "mailboxScopeForPredicate:withMailboxTypeResolver:", v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    mailboxScope = v24->_mailboxScope;
    v24->_mailboxScope = (EMMailboxScope *)v47;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v24);
    v49 = _os_feature_enabled_impl();
    if (v49)
    {
      v50 = [_EDMessageQueryHelperDelegateImpl alloc];
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __200__EDInMemoryThreadQueryHandler_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_vipManager_searchProvider_observer_observationIdentifier_observationResumer_helperObserver___block_invoke;
      v80[3] = &unk_1E949C258;
      obj = &v81;
      objc_copyWeak(&v81, &location);
      v51 = -[_EDMessageQueryHelperDelegateImpl initWithMessageQueryHelperObserver:didFindAllMessagesBlock:](v50, "initWithMessageQueryHelperObserver:didFindAllMessagesBlock:", v77, v80);
    }
    else
    {
      v51 = 0;
    }
    objc_storeStrong((id *)&v24->_messageQueryHelperDelegateImpl, v51);
    if (v49)

    v52 = objc_alloc(MEMORY[0x1E0D1E120]);
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v52, "initWithTitle:delegate:", v54, v24);
    stateCapturer = v24->_stateCapturer;
    v24->_stateCapturer = (EMCollectionItemIDStateCapturer *)v55;

    v57 = objc_alloc(MEMORY[0x1E0D1E1A0]);
    -[EDMessageRepositoryQueryHandler query](v24, "query");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mailboxPersistence");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDInMemoryThreadQueryHandler scheduler](v24, "scheduler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v69) = 1;
    v62 = objc_msgSend(v57, "initWithQuery:mailboxTypeResolver:dataSource:delgate:scheduler:logClient:limitedCache:", v58, v59, v24, v24, v60, v61, v69);
    threadCollection = v24->_threadCollection;
    v24->_threadCollection = (EMInMemoryThreadCollection *)v62;

    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v24->_threadCollection;
      *(_DWORD *)buf = 134218240;
      v85 = v24;
      v86 = 2048;
      v87 = v65;
      _os_log_impl(&dword_1D2F2C000, v64, OS_LOG_TYPE_DEFAULT, "%p: Created EMInMemoryThreadCollection (%p)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v24, sel__blockedSendersDidChange_, *MEMORY[0x1E0D1DBB0], 0);
    -[EDInMemoryThreadQueryHandler vipManager](v24, "vipManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v24, sel__vipsDidChange_, *MEMORY[0x1E0D1E0A8], v67);

    if (v49)
      objc_destroyWeak(obj);
    objc_destroyWeak(&location);
  }

  return v24;
}

void __200__EDInMemoryThreadQueryHandler_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_vipManager_searchProvider_observer_observationIdentifier_observationResumer_helperObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsInitialized:", 1);
    objc_msgSend(WeakRetained, "setHasEverReconciledJournal:", 1);
  }

}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDInMemoryThreadQueryHandler.m"), 138, CFSTR("%s can only be called from unit tests"), "-[EDInMemoryThreadQueryHandler test_tearDown]");

  }
  -[EDInMemoryThreadQueryHandler tearDown](self, "tearDown");
  -[EDInMemoryThreadQueryHandler scheduler](self, "scheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_20);

}

- (void)tearDown
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EDInMemoryThreadQueryHandler cancel](self, "cancel");
  -[EDInMemoryThreadQueryHandler scheduler](self, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EDInMemoryThreadQueryHandler_tearDown__block_invoke;
  v6[3] = &unk_1E949AEB8;
  v6[4] = self;
  objc_msgSend(v4, "performBlock:", v6);

  v5.receiver = self;
  v5.super_class = (Class)EDInMemoryThreadQueryHandler;
  -[EDMessageRepositoryQueryHandler tearDown](&v5, sel_tearDown);
}

- (BOOL)start
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  EFProcessTransaction *v9;
  EFProcessTransaction *processTransaction;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)EDInMemoryThreadQueryHandler;
  v3 = -[EDMessageRepositoryQueryHandler start](&v15, sel_start);
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: Starting with query '%@'", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1E0D1EF58];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EDInMemoryThreadQueryHandler<%p> transaction"), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transactionWithDescription:", v8);
    v9 = (EFProcessTransaction *)objc_claimAutoreleasedReturnValue();
    processTransaction = self->_processTransaction;
    self->_processTransaction = v9;

    -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__EDInMemoryThreadQueryHandler_start__block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(v11, block);

    -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EFRegisterContentProtectionObserver();

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
    }

  }
  return v3;
}

uint64_t __37__EDInMemoryThreadQueryHandler_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = EFProtectedDataAvailable();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_createHelper");
  return result;
}

- (void)cancel
{
  void (**v3)(_QWORD);
  NSObject *v4;
  _QWORD aBlock[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDInMemoryThreadQueryHandler;
  -[EDMessageRepositoryQueryHandler cancel](&v6, sel_cancel);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__EDInMemoryThreadQueryHandler_cancel__block_invoke;
  aBlock[3] = &unk_1E949AEB8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(&kContentProtectionQueueKey))
  {
    v3[2](v3);
  }
  else
  {
    -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, v3);

  }
  -[EFProcessTransaction invalidate](self->_processTransaction, "invalidate");

}

void __38__EDInMemoryThreadQueryHandler_cancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setDidCancel:", 1);
  objc_msgSend(*(id *)(a1 + 32), "messageQueryHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (EMMessageListItemQueryResultsObserver)resultsObserverIfNotPaused
{
  void *v3;

  if (-[EDInMemoryThreadQueryHandler isPaused](self, "isPaused"))
  {
    v3 = 0;
  }
  else
  {
    -[EDMessageRepositoryQueryHandler resultsObserver](self, "resultsObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EMMessageListItemQueryResultsObserver *)v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  EFUnregisterContentProtectionObserver();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EDInMemoryThreadQueryHandler cancel](self, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)EDInMemoryThreadQueryHandler;
  -[EDMessageRepositoryQueryHandler dealloc](&v4, sel_dealloc);
}

- (void)prepareToSendUpdatesInCollection:(id)a3
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[EDInMemoryThreadQueryHandler isInitialized](self, "isInitialized", a3)
    && !-[EDInMemoryThreadQueryHandler isPaused](self, "isPaused"))
  {
    v8 = 0.0;
    -[EDInMemoryThreadQueryHandler updateThrottler](self, "updateThrottler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unacknowledgedUpdatesCountAndTimeSinceLastAcknowledgement:", &v8);

    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v10 = self;
      v11 = 2048;
      v12 = v5;
      v13 = 2048;
      v14 = v8;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "%p: Preparing to update, %llu unacknowledged updates, %f since last acknowledgement", buf, 0x20u);
    }

    if (v5 > 9 || v8 >= 2.0)
    {
      +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v10 = self;
        v11 = 2048;
        v12 = v5;
        v13 = 2048;
        v14 = v8;
        _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%p: Pausing updates, %llu unacknowledged updates, %f since last acknowledgement", buf, 0x20u);
      }

      -[EDInMemoryThreadQueryHandler setIsPaused:](self, "setIsPaused:", 1);
    }
  }
}

- (void)didSendUpdatesInCollection:(id)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  EDInMemoryThreadQueryHandler *v18;
  _QWORD v19[4];
  id v20;
  id location;
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[EDInMemoryThreadQueryHandler isPaused](self, "isPaused", a3))
  {
    -[EDInMemoryThreadQueryHandler setHasChangesWhilePaused:](self, "setHasChangesWhilePaused:", 1);
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = self;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Skipping change while paused", buf, 0xCu);
    }

  }
  else
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDInMemoryThreadQueryHandler updateThrottler](self, "updateThrottler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke;
    v19[3] = &unk_1E949C4A8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v6, "updateWithBlock:unacknowledgedUpdatesCount:", v19, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDInMemoryThreadQueryHandler.m"), 304, CFSTR("Unable to get acknowledgement token for in-memory thread query handler"));

    }
    objc_msgSend(v8, "label");
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_43;
    v16[3] = &unk_1E949B658;
    v18 = self;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    objc_msgSend(v8, "addInvocationBlock:", v16);
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Sending update %{public}@", buf, 0x16u);
    }

    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_44;
    v14[3] = &unk_1E949B6D0;
    v14[4] = self;
    v15 = v8;
    v12 = v8;
    dispatch_sync(v11, v14);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isPaused") & 1) != 0)
  {
    objc_msgSend(v2, "scheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_2;
    v4[3] = &unk_1E949AEB8;
    v4[4] = v2;
    objc_msgSend(v3, "performBlock:", v4);

  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPaused"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsPaused:", 0);
    v2 = objc_msgSend(*(id *)(a1 + 32), "hasChangesWhilePaused");
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 32);
        v7 = 134217984;
        v8 = v5;
        _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Refreshing after unpause", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setHasChangesWhilePaused:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_refreshObserver");
    }
    else
    {
      if (v4)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = 134217984;
        v8 = v6;
        _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Unpausing without changes", (uint8_t *)&v7, 0xCu);
      }

    }
  }
}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 134218242;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "%p: Acknowledged update %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

void __59__EDInMemoryThreadQueryHandler_didSendUpdatesInCollection___block_invoke_44(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:wasUpdated:", v2, *(_QWORD *)(a1 + 40));

}

- (void)_refreshObserver
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  EDInMemoryThreadQueryHandler *v11;

  -[EDMessageRepositoryQueryHandler resultsObserver](self, "resultsObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler observationIdentifier](self, "observationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke;
  block[3] = &unk_1E949B390;
  v7 = v3;
  v9 = v7;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(v5, block);

  -[EMInMemoryThreadCollection notifyObserverOfOldestThreadsByMailboxObjectIDs](self->_threadCollection, "notifyObserverOfOldestThreadsByMailboxObjectIDs");
}

void __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "observerWillRestart:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(v2 + 88);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke_2;
  v7[3] = &unk_1E949C4D0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectIDsInBatchesOfSize:block:", 5000, v7);
  objc_msgSend(*(id *)(a1 + 32), "observerDidFinishInitialLoad:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "copy");
  objc_msgSend(v4, "observer:matchedChangesForObjectIDs:", v5, v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "removeAllObjects");
}

void __48__EDInMemoryThreadQueryHandler__refreshObserver__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_distinctObjectIDs:queryHandlerLog:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "observer:matchedAddedObjectIDs:before:extraInfo:", *(_QWORD *)(a1 + 48), v5, 0, 0);
}

- (void)_restartHelper
{
  NSObject *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  EDInMemoryThreadQueryHandler *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = EFProtectedDataAvailable();
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      -[EDInMemoryThreadQueryHandler messageQueryHelper](self, "messageQueryHelper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218240;
      v9 = self;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "%p: (Re-)starting the helper (old = %p).", (uint8_t *)&v8, 0x16u);

    }
    -[EDInMemoryThreadQueryHandler _createHelper](self, "_createHelper");
  }
  else
  {
    if (v6)
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "%p: Delaying restart of helper because device is locked.", (uint8_t *)&v8, 0xCu);
    }

    -[EDInMemoryThreadQueryHandler setIsInitialized:](self, "setIsInitialized:", 0);
  }
}

- (id)queryHelperDelegate
{
  if (self->_messageQueryHelperDelegateImpl)
    self = (EDInMemoryThreadQueryHandler *)self->_messageQueryHelperDelegateImpl;
  return self;
}

- (void)_createHelper
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "%p: Created helper %p", buf, 0x16u);

}

void __45__EDInMemoryThreadQueryHandler__createHelper__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observerWillRestart:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_queryHelperIsCurrent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  EDInMemoryThreadQueryHandler *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EDInMemoryThreadQueryHandler__queryHelperIsCurrent___block_invoke;
  block[3] = &unk_1E949BE18;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __54__EDInMemoryThreadQueryHandler__queryHelperIsCurrent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "messageQueryHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 == v3;

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
      -[EDInMemoryThreadQueryHandler _contentProtectionChangedToUnlocked](self, "_contentProtectionChangedToUnlocked", 0, a4);
  }
  else
  {
    -[EDInMemoryThreadQueryHandler _contentProtectionChangedToLocked](self, "_contentProtectionChangedToLocked");
  }
}

- (void)_contentProtectionChangedToLocked
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  EDInMemoryThreadQueryHandler *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Content Protection => Locked", (uint8_t *)&v6, 0xCu);
  }

  -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[EDInMemoryThreadQueryHandler isInitialized](self, "isInitialized"))
  {
    -[EDInMemoryThreadQueryHandler messageQueryHelper](self, "messageQueryHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDInMemoryThreadQueryHandler setMessageQueryHelper:](self, "setMessageQueryHelper:", 0);
    objc_msgSend(v5, "cancel");

  }
}

- (void)_contentProtectionChangedToUnlocked
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  EDInMemoryThreadQueryHandler *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Content Protection => Unlocked", (uint8_t *)&v5, 0xCu);
  }

  -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[EDInMemoryThreadQueryHandler didCancel](self, "didCancel")
    && !-[EDInMemoryThreadQueryHandler isInitialized](self, "isInitialized"))
  {
    -[EDInMemoryThreadQueryHandler _restartHelper](self, "_restartHelper");
  }
}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  -[EMInMemoryThreadCollection messageListItemForObjectID:error:](self->_threadCollection, "messageListItemForObjectID:error:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)threadsAndMessagesForObjectIDs:(id)a3
{
  -[EMInMemoryThreadCollection threadsAndMessagesForObjectIDs:](self->_threadCollection, "threadsAndMessagesForObjectIDs:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messagesForThread:(id)a3
{
  -[EMInMemoryThreadCollection messagesForThread:](self->_threadCollection, "messagesForThread:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDInMemoryThreadQueryHandler messageQueryHelper](self, "messageQueryHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInMemoryThreadQueryHandler _predicateForMessagesInConversations:](self, "_predicateForMessagesInConversations:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagesWithAdditionalPredicates:limit:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  EDInMemoryThreadQueryHandler *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v7))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = self;
      v12 = 1024;
      v13 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Found %u messages.", (uint8_t *)&v10, 0x12u);
    }

    -[EMInMemoryThreadCollection messagesWereAdded:](self->_threadCollection, "messagesWereAdded:", v8);
  }

}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v4))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load.", buf, 0xCu);
    }

    -[EDInMemoryThreadQueryHandler setIsInitialized:](self, "setIsInitialized:", 1);
    -[EDInMemoryThreadQueryHandler setHasEverReconciledJournal:](self, "setHasEverReconciledJournal:", 1);
    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__EDInMemoryThreadQueryHandler_queryHelperDidFindAllMessages___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_sync(v6, block);

    -[EMInMemoryThreadCollection initializeOldestThreadsByMailbox](self->_threadCollection, "initializeOldestThreadsByMailbox");
    -[EMInMemoryThreadCollection clearInMemoryThreadCache](self->_threadCollection, "clearInMemoryThreadCache");
  }

}

void __62__EDInMemoryThreadQueryHandler_queryHelperDidFindAllMessages___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidFinishInitialLoad:", v2);

}

- (void)queryHelper:(id)a3 didAddMessages:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  EDInMemoryThreadQueryHandler *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v6))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = self;
      v11 = 1024;
      v12 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Added %u messages", (uint8_t *)&v9, 0x12u);
    }

    -[EMInMemoryThreadCollection messagesWereAdded:](self->_threadCollection, "messagesWereAdded:", v7);
  }

}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  EMInMemoryThreadCollection *threadCollection;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", a3))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 0xB)
    {
      objc_msgSend(v7, "ef_mapSelector:", sel_flagDescription);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, 10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_mapSelector:", sel_flagDescription);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v16 = self;
      v17 = 1024;
      v18 = objc_msgSend(v7, "count");
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Flags changed for %u messages: %{public}@", buf, 0x1Cu);
    }

    threadCollection = self->_threadCollection;
    v12 = *MEMORY[0x1E0D1DDC8];
    v14[0] = *MEMORY[0x1E0D1DD80];
    v14[1] = v12;
    v14[2] = *MEMORY[0x1E0D1DD78];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThreadCollection messagesWereChanged:forKeyPaths:deleted:](threadCollection, "messagesWereChanged:forKeyPaths:deleted:", v7, v13, 0);

  }
}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  EDInMemoryThreadQueryHandler *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v8))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      v16 = 1024;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Key paths %{public}@ changed for %u messages", (uint8_t *)&v12, 0x1Cu);
    }

    -[EMInMemoryThreadCollection messagesWereChanged:forKeyPaths:deleted:](self->_threadCollection, "messagesWereChanged:forKeyPaths:deleted:", v9, v10, 0);
  }

}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  size_t v18;
  _QWORD __b[81];
  int v20[2];
  int v21;
  pid_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v10))
  {
    objc_msgSend(v11, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionItemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v11, "itemID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(__b[0]) = 134218754;
        *(_QWORD *)((char *)__b + 4) = self;
        WORD2(__b[1]) = 2112;
        *(_QWORD *)((char *)&__b[1] + 6) = v17;
        HIWORD(__b[2]) = 2112;
        __b[3] = v11;
        LOWORD(__b[4]) = 2112;
        *(_QWORD *)((char *)&__b[4] + 2) = v12;
        _os_log_debug_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", (uint8_t *)__b, 0x2Au);

      }
      memset(__b, 170, sizeof(__b));
      LODWORD(__b[4]) = 0;
      *(_QWORD *)v20 = 0xE00000001;
      v21 = 1;
      v22 = getpid();
      v18 = 648;
      if (!sysctl(v20, 4u, __b, &v18, 0, 0) && (__b[4] & 0x800) != 0)
      {
        __debugbreak();
        JUMPOUT(0x1D2FACBF8);
      }
    }
    else
    {
      -[EMInMemoryThreadCollection objectIDDidChangeForMessage:oldObjectID:oldConversationID:](self->_threadCollection, "objectIDDidChangeForMessage:oldObjectID:oldConversationID:", v11, v12, a6);
    }
  }

}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  EDInMemoryThreadQueryHandler *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v6))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = self;
      v11 = 1024;
      v12 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Deleted %u messages", (uint8_t *)&v9, 0x12u);
    }

    -[EMInMemoryThreadCollection messagesWereChanged:forKeyPaths:deleted:](self->_threadCollection, "messagesWereChanged:forKeyPaths:deleted:", v7, 0, 1);
  }

}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  EDInMemoryThreadQueryHandler *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v8))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218496;
      v12 = self;
      v13 = 2048;
      v14 = a5;
      v15 = 1024;
      v16 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p: ConversationIDs changed from %lld for %u messages", (uint8_t *)&v11, 0x1Cu);
    }

    -[EMInMemoryThreadCollection conversationIDDidChangeForMessages:fromConversationID:](self->_threadCollection, "conversationIDDidChangeForMessages:fromConversationID:", v9, a5);
  }

}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  id v8;
  NSObject *v9;

  v8 = a3;
  if (a5)
  {
    if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v8))
      -[EMInMemoryThreadCollection conversationNotificationLevelDidChangeForConversation:conversationID:](self->_threadCollection, "conversationNotificationLevelDidChangeForConversation:conversationID:", a4, a5);
  }
  else
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDInMemoryThreadQueryHandler queryHelper:conversationNotificationLevelDidChangeForConversation:conversationID:].cold.1((uint64_t)self, v9);

  }
}

- (void)_blockedSendersDidChange:(id)a3
{
  -[EMInMemoryThreadCollection clearInMemoryThreadCache](self->_threadCollection, "clearInMemoryThreadCache", a3);
}

- (void)_vipsDidChange:(id)a3
{
  -[EMInMemoryThreadCollection clearInMemoryThreadCache](self->_threadCollection, "clearInMemoryThreadCache", a3);
}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v4))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Helper did finish remote search.", buf, 0xCu);
    }

    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__EDInMemoryThreadQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_sync(v6, block);

  }
}

void __65__EDInMemoryThreadQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observerDidFinishRemoteSearch:", v2);

}

- (void)queryHelperNeedsRestart:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  EDInMemoryThreadQueryHandler *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EDInMemoryThreadQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v4))
  {
    +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Helper needs restart.", buf, 0xCu);
    }

    -[EDInMemoryThreadQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__EDInMemoryThreadQueryHandler_queryHelperNeedsRestart___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

uint64_t __56__EDInMemoryThreadQueryHandler_queryHelperNeedsRestart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartHelper");
}

- (id)mailboxesInCollection:(id)a3
{
  -[EDMessageRepositoryQueryHandler mailboxes](self, "mailboxes", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_predicateForMessagesInConversations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *MEMORY[0x1E0D1DD48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)collection:(id)a3 messagesInConversationIDs:(id)a4 limit:(int64_t)a5
{
  -[EDInMemoryThreadQueryHandler messagesInConversationIDs:limit:](self, "messagesInConversationIDs:limit:", a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)collection:(id)a3 notifyOfOldestThreadsByMailboxObjectIDs:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__EDInMemoryThreadQueryHandler_collection_notifyOfOldestThreadsByMailboxObjectIDs___block_invoke;
  block[3] = &unk_1E949B6D0;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __83__EDInMemoryThreadQueryHandler_collection_notifyOfOldestThreadsByMailboxObjectIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserverIfNotPaused");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedOldestItemsUpdatedForMailboxes:", v2, *(_QWORD *)(a1 + 40));

}

- (void)collection:(id)a3 notifyReplacedExistingObjectID:(id)a4 newObjectID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__EDInMemoryThreadQueryHandler_collection_notifyReplacedExistingObjectID_newObjectID___block_invoke;
  block[3] = &unk_1E949B390;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(v9, block);

}

void __86__EDInMemoryThreadQueryHandler_collection_notifyReplacedExistingObjectID_newObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserverIfNotPaused");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:replacedExistingObjectID:withNewObjectID:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)collection:(id)a3 reportChanges:(id)a4
{
  return -[EDInMemoryThreadQueryHandler collection:reportChanges:reloadSummaries:](self, "collection:reportChanges:reloadSummaries:", a3, a4, 1);
}

- (BOOL)collection:(id)a3 reportChanges:(id)a4 reloadSummaries:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[5];
  _QWORD block[4];
  id v22;
  EDInMemoryThreadQueryHandler *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v5)
    {
      -[EDInMemoryThreadQueryHandler reloadSummaryHelper](self, "reloadSummaryHelper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDInMemoryThreadQueryHandler mailboxScope](self, "mailboxScope");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "summariesToReloadForChanges:mailboxScope:", v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v12);
            -[EDMessageRepositoryQueryHandler requestSummaryForMessageObjectID:](self, "requestSummaryForMessageObjectID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v7, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Changing objectIDs"), v16);

    -[EDInMemoryThreadQueryHandler resultsObserverIfNotPaused](self, "resultsObserverIfNotPaused");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke;
      block[3] = &unk_1E949B390;
      v22 = v17;
      v23 = self;
      v24 = v7;
      dispatch_sync(v18, block);

    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke_2;
      v20[3] = &unk_1E949C4F8;
      v20[4] = self;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);
    }

  }
  return v8 != 0;
}

void __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "observationIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "observer:matchedChangesForObjectIDs:");

}

void __73__EDInMemoryThreadQueryHandler_collection_reportChanges_reloadSummaries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "addChange:", v5);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v5, v8);

}

- (BOOL)collection:(id)a3 reportDeletes:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  EDInMemoryThreadQueryHandler *v16;
  id v17;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_map:", &__block_literal_global_55);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Deleting objectIDs"), v8);
    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke_2;
    v15 = &unk_1E949B6D0;
    v16 = self;
    v10 = v8;
    v17 = v10;
    dispatch_sync(v9, &v12);

    -[EMInMemoryThreadCollection removeThreadProxies:forMove:](self->_threadCollection, "removeThreadProxies:forMove:", v5, 0, v12, v13, v14, v15, v16);
  }

  return v6 != 0;
}

id __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__EDInMemoryThreadQueryHandler_collection_reportDeletes___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserverIfNotPaused");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedDeletedObjectIDs:", v2, *(_QWORD *)(a1 + 40));

}

- (void)collection:(id)a3 didMergeInThreadsForMove:(BOOL)a4 newObjectIDs:(id)a5 existingObjectID:(id)a6 hasChanges:(BOOL *)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  BOOL *v27;
  _QWORD block[4];
  void *v29;
  EDInMemoryThreadQueryHandler *v30;
  id v31;
  id v32;
  BOOL *v33;

  v9 = a4;
  v22 = a5;
  v11 = a6;
  -[EDInMemoryThreadQueryHandler resultsObserverIfNotPaused](self, "resultsObserverIfNotPaused");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v11)
      -[EDInMemoryThreadQueryHandler logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:](self, "logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:", CFSTR("Moving objectIDs"), v22, v11);
    else
      -[EDInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Moving objectIDs to end of list:"), v22);
    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke;
    block[3] = &unk_1E949BE68;
    v29 = v12;
    v30 = self;
    v31 = v22;
    v32 = v11;
    v33 = a7;
    v14 = v11;
    v15 = v12;
    v16 = v22;
    dispatch_sync(v13, block);

    v17 = v29;
  }
  else
  {
    if (v11)
      -[EDInMemoryThreadQueryHandler logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:](self, "logThreadObjectIDsChangesWithMessage:newObjectIDs:beforeExistingObjectID:", CFSTR("Adding objectIDs"), v22, v11);
    else
      -[EDInMemoryThreadQueryHandler logThreadObjectIDsWithMessage:objectIDs:](self, "logThreadObjectIDsWithMessage:objectIDs:", CFSTR("Adding objectIDs to end of list"), v22);
    -[EDInMemoryThreadQueryHandler resultQueue](self, "resultQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke_2;
    v23[3] = &unk_1E949BE68;
    v23[4] = self;
    v24 = v22;
    v25 = v12;
    v26 = v11;
    v27 = a7;
    v19 = v11;
    v20 = v12;
    v21 = v22;
    dispatch_sync(v18, v23);

    v17 = v24;
  }

}

void __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "observationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:matchedMovedObjectIDs:before:extraInfo:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

  **(_BYTE **)(a1 + 64) = 1;
}

void __109__EDInMemoryThreadQueryHandler_collection_didMergeInThreadsForMove_newObjectIDs_existingObjectID_hasChanges___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_distinctObjectIDs:queryHandlerLog:", v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observer:matchedAddedObjectIDs:before:extraInfo:", v6, v7, *(_QWORD *)(a1 + 56), 0);

  **(_BYTE **)(a1 + 64) = 1;
}

- (id)_messageQueryFromThreadsQuery:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "limit");
  v10 = objc_msgSend(v3, "queryOptions");
  objc_msgSend(v3, "targetClassOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (void)logThreadObjectIDsWithMessage:(id)a3 objectIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  EDInMemoryThreadQueryHandler *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") >= 0xB)
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, 10);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218754;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    v14 = 2048;
    v15 = objc_msgSend(v7, "count");
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu : %{public}@ ", (uint8_t *)&v10, 0x2Au);
  }

}

- (void)logThreadObjectIDsChangesWithMessage:(id)a3 newObjectIDs:(id)a4 beforeExistingObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  EDInMemoryThreadQueryHandler *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") >= 0xB)
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, 10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  +[EDInMemoryThreadQueryHandler log](EDInMemoryThreadQueryHandler, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134219010;
    v14 = self;
    v15 = 2114;
    v16 = v8;
    v17 = 2048;
    v18 = objc_msgSend(v9, "count");
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ : %lu before existing: %{public}@ : %{public}@", (uint8_t *)&v13, 0x34u);
  }

}

- (id)labelForStateCapture
{
  void *v2;
  void *v3;

  -[EDMessageRepositoryQueryHandler query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  if (a3)
    *a3 = 0;
  return (id)-[EMInMemoryThreadCollection itemIDs](self->_threadCollection, "itemIDs");
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDMessageQueryHelper)messageQueryHelper
{
  return self->_messageQueryHelper;
}

- (void)setMessageQueryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_messageQueryHelper, a3);
}

- (_EDMessageQueryHelperDelegateImpl)messageQueryHelperDelegateImpl
{
  return self->_messageQueryHelperDelegateImpl;
}

- (NSArray)messageSortDescriptors
{
  return self->_messageSortDescriptors;
}

- (EDUpdateThrottler)updateThrottler
{
  return self->_updateThrottler;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
}

- (EFAssertableScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (BOOL)hasEverReconciledJournal
{
  return self->_hasEverReconciledJournal;
}

- (void)setHasEverReconciledJournal:(BOOL)a3
{
  self->_hasEverReconciledJournal = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (BOOL)hasChangesWhilePaused
{
  return self->_hasChangesWhilePaused;
}

- (void)setHasChangesWhilePaused:(BOOL)a3
{
  self->_hasChangesWhilePaused = a3;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_messageSortDescriptors, 0);
  objc_storeStrong((id *)&self->_messageQueryHelperDelegateImpl, 0);
  objc_storeStrong((id *)&self->_messageQueryHelper, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_processTransaction, 0);
  objc_storeStrong((id *)&self->_changesWhilePaused, 0);
  objc_storeStrong((id *)&self->_threadCollection, 0);
}

- (void)queryHelper:(uint64_t)a1 conversationNotificationLevelDidChangeForConversation:(NSObject *)a2 conversationID:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 0;
  _os_log_error_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_ERROR, "%p: Received invalid converationID:%lld", (uint8_t *)&v2, 0x16u);
}

@end
