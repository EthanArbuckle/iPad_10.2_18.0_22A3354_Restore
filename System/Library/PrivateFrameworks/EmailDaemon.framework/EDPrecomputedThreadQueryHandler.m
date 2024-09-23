@implementation EDPrecomputedThreadQueryHandler

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_2;
  v4[3] = &unk_1E949B6D0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v4);

}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_updateDisplayDateForMessagesIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "registerThreadChangeHookResponder:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "registerMessageChangeHookResponder:", *(_QWORD *)(a1 + 32));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_3;
  v7[3] = &unk_1E949AD60;
  objc_copyWeak(&v9, &location);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addCancelationBlock:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_getInitialResults");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "backgroundWorkScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke_4;
  v6[3] = &unk_1E949FD30;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_onScheduler:performCancelableBlock:", v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateDisplayDateForMessagesIfNeeded
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[EDPrecomputedThreadQueryHandler updateDisplayDate](self, "updateDisplayDate"))
  {
    -[EDMessageRepositoryQueryHandler query](self, "query");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    v4 = objc_opt_class();
    objc_msgSend(v9, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v4, v5, v6, objc_msgSend(v9, "queryOptions"), 0);

    -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateBeforeDisplayForMessagesMatchingQuery:", v7);

  }
}

- (BOOL)updateDisplayDate
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[EDMessageRepositoryQueryHandler query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetClassOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DEA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadScope");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLastViewedDateForThreadScope:", v2);

}

- (id)messageListItemForObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadForObjectID:originatingQuery:error:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDPrecomputedThreadQueryHandler)initWithQuery:(id)a3 threadScope:(id)a4 messagePersistence:(id)a5 threadPersistence:(id)a6 hookRegistry:(id)a7 remindMeNotificationController:(id)a8 observer:(id)a9 observationIdentifier:(id)a10 observationResumer:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  EDPrecomputedThreadQueryHandler *v23;
  uint64_t v24;
  EFScheduler *changeScheduler;
  uint64_t v26;
  EFScheduler *backgroundWorkScheduler;
  EFCancelationToken *v28;
  EFCancelationToken *cancelationToken;
  NSMutableDictionary *v30;
  NSMutableDictionary *pendingChanges;
  NSMutableArray *v32;
  NSMutableArray *pendingPositionChanges;
  NSMutableSet *v34;
  NSMutableSet *unreportedJournaledObjectIDs;
  NSMutableDictionary *v36;
  NSMutableDictionary *reportedJournaledObjectIDs;
  NSMutableDictionary *v38;
  NSMutableDictionary *oldestThreadObjectIDsByMailbox;
  EDUpdateThrottler *v40;
  EDUpdateThrottler *updateThrottler;
  EMThreadReloadSummaryHelper *v42;
  EMThreadReloadSummaryHelper *reloadSummaryHelper;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  EMMailboxScope *mailboxScope;
  id v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  EMCollectionItemIDStateCapturer *stateCapturer;
  void *v55;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v17 = a3;
  v57 = a4;
  v18 = a5;
  v56 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v58 = a11;
  v59.receiver = self;
  v59.super_class = (Class)EDPrecomputedThreadQueryHandler;
  v55 = v19;
  v23 = -[EDMessageRepositoryQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:](&v59, sel_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_observer_observationIdentifier_, v17, v18, v19, v20, v21, v22);
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDPrecomputedThreadQueryHandler.changeScheduler"), 25);
    v24 = objc_claimAutoreleasedReturnValue();
    changeScheduler = v23->_changeScheduler;
    v23->_changeScheduler = (EFScheduler *)v24;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDPrecomputedThreadQueryHandler.backgroundWorkScheduler"), 9);
    v26 = objc_claimAutoreleasedReturnValue();
    backgroundWorkScheduler = v23->_backgroundWorkScheduler;
    v23->_backgroundWorkScheduler = (EFScheduler *)v26;

    v28 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelationToken = v23->_cancelationToken;
    v23->_cancelationToken = v28;

    objc_storeStrong((id *)&v23->_threadScope, a4);
    objc_storeStrong((id *)&v23->_threadPersistence, a6);
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingChanges = v23->_pendingChanges;
    v23->_pendingChanges = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingPositionChanges = v23->_pendingPositionChanges;
    v23->_pendingPositionChanges = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unreportedJournaledObjectIDs = v23->_unreportedJournaledObjectIDs;
    v23->_unreportedJournaledObjectIDs = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reportedJournaledObjectIDs = v23->_reportedJournaledObjectIDs;
    v23->_reportedJournaledObjectIDs = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oldestThreadObjectIDsByMailbox = v23->_oldestThreadObjectIDsByMailbox;
    v23->_oldestThreadObjectIDsByMailbox = v38;

    v40 = -[EDUpdateThrottler initWithName:delayInterval:resumable:]([EDUpdateThrottler alloc], "initWithName:delayInterval:resumable:", CFSTR("Precomputed Threads"), v58, 1.0);
    updateThrottler = v23->_updateThrottler;
    v23->_updateThrottler = v40;

    v42 = (EMThreadReloadSummaryHelper *)objc_alloc_init(MEMORY[0x1E0D1E388]);
    reloadSummaryHelper = v23->_reloadSummaryHelper;
    v23->_reloadSummaryHelper = v42;

    v44 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v17, "predicate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mailboxPersistence");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "mailboxScopeForPredicate:withMailboxTypeResolver:", v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    mailboxScope = v23->_mailboxScope;
    v23->_mailboxScope = (EMMailboxScope *)v47;

    v49 = objc_alloc(MEMORY[0x1E0D1E120]);
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v49, "initWithTitle:delegate:", v51, v23);
    stateCapturer = v23->_stateCapturer;
    v23->_stateCapturer = (EMCollectionItemIDStateCapturer *)v52;

  }
  return v23;
}

- (void)_getInitialResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  EDPrecomputedThreadQueryHandler *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[EDMessageRepositoryQueryHandler resultsObserver](self, "resultsObserver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler observationIdentifier](self, "observationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 100;
  -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23[3];
  -[EDPrecomputedThreadQueryHandler unreportedJournaledObjectIDs](self, "unreportedJournaledObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__EDPrecomputedThreadQueryHandler__getInitialResults__block_invoke;
  v18[3] = &unk_1E949FDA0;
  v18[4] = self;
  v21 = &v22;
  v10 = v17;
  v19 = v10;
  v11 = v3;
  v20 = v11;
  objc_msgSend(v4, "threadObjectIDsForThreadScope:sortDescriptors:initialBatchSize:journaledObjectIDs:batchBlock:", v5, v7, v8, v9, v18);

  -[EDPrecomputedThreadQueryHandler cancelationToken](self, "cancelationToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v12, "isCanceled");

  if ((_DWORD)v4)
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Canceled initial results\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "%p: Returning initial load did finish\n%{public}@", buf, 0x16u);

    }
    objc_msgSend(v10, "observerDidFinishInitialLoad:", v11);
  }
  -[EDPrecomputedThreadQueryHandler _oldestThreadsNeedUpdate](self, "_oldestThreadsNeedUpdate");

  _Block_object_dispose(&v22, 8);
}

void __53__EDPrecomputedThreadQueryHandler__getInitialResults__block_invoke(uint64_t a1, void *a2, _QWORD *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1D824B334]();
  +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(v7, "count");
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Returning batch of %lu results\n%{public}@", (uint8_t *)&v18, 0x20u);

  }
  v13 = *(void **)(a1 + 32);
  +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_distinctObjectIDs:queryHandlerLog:", v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "_extaInfoPrecachedThreadsForInitialObjectIDs:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "observer:matchedAddedObjectIDs:before:extraInfo:", *(_QWORD *)(a1 + 48), v15, 0, v16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 15000;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v17, "isCanceled");

  objc_autoreleasePoolPop(v8);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDPrecomputedThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_69 != -1)
    dispatch_once(&log_onceToken_69, block);
  return (OS_os_log *)(id)log_log_69;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (NSMutableSet)unreportedJournaledObjectIDs
{
  return self->_unreportedJournaledObjectIDs;
}

- (BOOL)start
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  objc_super v15;
  uint8_t buf[4];
  EDPrecomputedThreadQueryHandler *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)EDPrecomputedThreadQueryHandler;
  v3 = -[EDMessageRepositoryQueryHandler start](&v15, sel_start);
  +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
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
    -[EDMessageRepositoryQueryHandler remindMeNotificationController](self, "remindMeNotificationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addRemindMeObserver:", self);
    v4 = objc_claimAutoreleasedReturnValue();

    -[EDPrecomputedThreadQueryHandler cancelationToken](self, "cancelationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addCancelable:", v4);

    -[EDMessageRepositoryQueryHandler hookRegistry](self, "hookRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__EDPrecomputedThreadQueryHandler_start__block_invoke;
    v13[3] = &unk_1E949FD58;
    v13[4] = self;
    v11 = v9;
    v14 = v11;
    -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v10, v13);

  }
  else if (v5)
  {
    *(_DWORD *)buf = 134217984;
    v17 = self;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
  }

  return v3;
}

- (EFScheduler)changeScheduler
{
  return self->_changeScheduler;
}

- (void)_onScheduler:(id)a3 performCancelableBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[EDPrecomputedThreadQueryHandler cancelationToken](self, "cancelationToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCanceled");

  if ((v8 & 1) == 0)
  {
    -[EDPrecomputedThreadQueryHandler cancelationToken](self, "cancelationToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performCancelableBlock:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addCancelable:", v10);

  }
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void)_oldestThreadsNeedUpdate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[EDMessageRepositoryQueryHandler query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryOptions");

  if ((v4 & 1) != 0)
  {
    -[EDPrecomputedThreadQueryHandler updateOldestThreadsCancelationToken](self, "updateOldestThreadsCancelationToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EDPrecomputedThreadQueryHandler updateOldestThreadsCancelationToken](self, "updateOldestThreadsCancelationToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancel");

    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDPrecomputedThreadQueryHandler backgroundWorkScheduler](self, "backgroundWorkScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke;
    v14 = &unk_1E949C258;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "afterDelay:performBlock:", &v11, 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPrecomputedThreadQueryHandler setUpdateOldestThreadsCancelationToken:](self, "setUpdateOldestThreadsCancelationToken:", v8, v11, v12, v13, v14);

    -[EDPrecomputedThreadQueryHandler cancelationToken](self, "cancelationToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPrecomputedThreadQueryHandler updateOldestThreadsCancelationToken](self, "updateOldestThreadsCancelationToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addCancelable:", v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (EFCancelable)updateOldestThreadsCancelationToken
{
  return self->_updateOldestThreadsCancelationToken;
}

- (EFScheduler)backgroundWorkScheduler
{
  return self->_backgroundWorkScheduler;
}

- (void)setUpdateOldestThreadsCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_updateOldestThreadsCancelationToken, a3);
}

void __38__EDPrecomputedThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_69;
  log_log_69 = (uint64_t)v1;

}

void __40__EDPrecomputedThreadQueryHandler_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "unregisterHookResponder:", WeakRetained);
    objc_msgSend(v5, "threadPersistence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadScope");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "verifyConsistencyOfThreadScope:", v4);

    WeakRetained = v5;
  }

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPrecomputedThreadQueryHandler;
  -[EDMessageRepositoryQueryHandler cancel](&v3, sel_cancel);
  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
  -[EFCancelable cancel](self->_updateOldestThreadsCancelationToken, "cancel");
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPrecomputedThreadQueryHandler.m"), 143, CFSTR("%s can only be called from unit tests"), "-[EDPrecomputedThreadQueryHandler test_tearDown]");

  }
  v7.receiver = self;
  v7.super_class = (Class)EDPrecomputedThreadQueryHandler;
  -[EDMessageRepositoryQueryHandler test_tearDown](&v7, sel_test_tearDown);
  -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_52);

  -[EDPrecomputedThreadQueryHandler backgroundWorkScheduler](self, "backgroundWorkScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSyncBlock:", &__block_literal_global_28);

}

- (id)_extaInfoPrecachedThreadsForInitialObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetClassOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DEB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "ef_prefix:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__24;
  v21 = __Block_byref_object_dispose__24;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__EDPrecomputedThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke;
  v16[3] = &unk_1E949FDC8;
  v16[4] = self;
  v16[5] = &v17;
  objc_msgSend(v9, "ef_compactMap:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 == objc_msgSend(v9, "count") && !v18[5])
  {
    v23 = *MEMORY[0x1E0D1DCF8];
    v24 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v18[5], "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDPrecomputedThreadQueryHandler _extaInfoPrecachedThreadsForInitialObjectIDs:].cold.1((uint64_t)self, v13, buf, v12);
    }

    v14 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v14;
}

id __80__EDPrecomputedThreadQueryHandler__extaInfoPrecachedThreadsForInitialObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    obj = 0;
    objc_msgSend(v8, "messageListItemForObjectID:error:", v3, &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v5, obj);
  }

  return v7;
}

- (void)_addChangeToPendingChanges:(id)a3 forThreadObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  EDPrecomputedThreadQueryHandler *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDPrecomputedThreadQueryHandler pendingChanges](self, "pendingChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218754;
      v16 = self;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Adding change to existing change for objectID: %{public}@\n%{public}@\n%{public}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(v9, "addChange:", v6);
  }
  else
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218754;
      v16 = self;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Adding change for objectID: %{public}@\n%{public}@\n%{public}@", (uint8_t *)&v15, 0x2Au);

    }
    -[EDPrecomputedThreadQueryHandler pendingChanges](self, "pendingChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (BOOL)_isAddingOrDeletingObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__EDPrecomputedThreadQueryHandler__isAddingOrDeletingObjectID___block_invoke;
  v9[3] = &unk_1E949FDF0;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

uint64_t __63__EDPrecomputedThreadQueryHandler__isAddingOrDeletingObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isAddingObjectID:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isDeletingObjectID:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_flushUpdatesWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  dispatch_block_t v38;
  dispatch_time_t v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(void);
  EDPrecomputedThreadQueryHandler *val;
  id obj;
  void *v55;
  NSObject *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  NSObject *v67;
  id v68;
  _QWORD v69[4];
  NSObject *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  id location;
  void *v83;
  _QWORD aBlock[4];
  id v85;
  _QWORD *v86;
  _QWORD v87[5];
  id v88;
  uint8_t v89[128];
  uint8_t buf[4];
  EDPrecomputedThreadQueryHandler *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  -[EDPrecomputedThreadQueryHandler pendingChanges](self, "pendingChanges");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count") || objc_msgSend(v49, "count"))
  {
    val = self;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3032000000;
    v87[3] = __Block_byref_object_copy__24;
    v87[4] = __Block_byref_object_dispose__24;
    v88 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke;
    aBlock[3] = &unk_1E949FE18;
    v86 = v87;
    v85 = v48;
    v52 = (void (**)(void))_Block_copy(aBlock);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    v83 = 0;
    objc_initWeak(&location, self);
    -[EDPrecomputedThreadQueryHandler updateThrottler](self, "updateThrottler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2;
    v80[3] = &unk_1E949C4A8;
    objc_copyWeak(&v81, &location);
    objc_msgSend(v4, "updateWithBlock:unacknowledgedUpdatesCount:", v80, &v83);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      -[EDMessageRepositoryQueryHandler resultsObserver](val, "resultsObserver");
      v56 = objc_claimAutoreleasedReturnValue();
      -[EDMessageRepositoryQueryHandler observationIdentifier](val, "observationIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "count"))
      {
        -[EDPrecomputedThreadQueryHandler reloadSummaryHelper](val, "reloadSummaryHelper");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDPrecomputedThreadQueryHandler mailboxScope](val, "mailboxScope");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "summariesToReloadForChanges:mailboxScope:", v50, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v77 != v10)
                objc_enumerationMutation(v8);
              -[EDMessageRepositoryQueryHandler requestSummaryForMessageObjectID:](val, "requestSummaryForMessageObjectID:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
          }
          while (v9);
        }

        +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v52[2]();
          v13 = (id)objc_claimAutoreleasedReturnValue();
          -[EDPrecomputedThreadQueryHandler pendingChanges](val, "pendingChanges");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDPrecomputedThreadQueryHandler threadScope](val, "threadScope");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v91 = val;
          v92 = 2114;
          v93 = v13;
          v94 = 2114;
          v95 = v14;
          v96 = 2114;
          v97 = v15;
          _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Flushing changes%{public}@: %{public}@\n%{public}@", buf, 0x2Au);

        }
        -[NSObject observer:matchedChangesForObjectIDs:](v56, "observer:matchedChangesForObjectIDs:", v55, v50);
        -[EDPrecomputedThreadQueryHandler pendingChanges](val, "pendingChanges");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeAllObjects");

      }
      if (objc_msgSend(v49, "count"))
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v49;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v73 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
              +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v52[2]();
                v22 = (id)objc_claimAutoreleasedReturnValue();
                -[EDPrecomputedThreadQueryHandler threadScope](val, "threadScope");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v91 = val;
                v92 = 2114;
                v93 = v22;
                v94 = 2114;
                v95 = v20;
                v96 = 2114;
                v97 = v23;
                _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "%p: Flushing position changes%{public}@: %{public}@\n%{public}@", buf, 0x2Au);

              }
              objc_msgSend(v20, "objectIDsToAddByBeforeObjectID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v69[0] = MEMORY[0x1E0C809B0];
              v69[1] = 3221225472;
              v69[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_44;
              v69[3] = &unk_1E949FE40;
              v25 = v56;
              v70 = v25;
              v26 = v55;
              v71 = v26;
              objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v69);

              objc_msgSend(v20, "objectIDsToMoveByBeforeObjectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2_47;
              v66[3] = &unk_1E949FE40;
              v28 = v25;
              v67 = v28;
              v29 = v26;
              v68 = v29;
              objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v66);

              objc_msgSend(v20, "objectIDsToDelete");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "allObjects");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v31, "count"))
              {
                objc_msgSend(v20, "objectIDsToDelete");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "allObjects");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject observer:matchedDeletedObjectIDs:](v28, "observer:matchedDeletedObjectIDs:", v29, v33);

              }
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
          }
          while (v17);
        }

        -[EDPrecomputedThreadQueryHandler pendingPositionChanges](val, "pendingPositionChanges");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeAllObjects");

        -[EDPrecomputedThreadQueryHandler _oldestThreadsNeedUpdate](val, "_oldestThreadsNeedUpdate");
      }
      objc_msgSend(v51, "label");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_48;
      block[3] = &unk_1E949E918;
      objc_copyWeak(&v65, &location);
      v36 = v55;
      v63 = v36;
      v37 = v35;
      v64 = v37;
      v38 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      v39 = dispatch_time(0, 5000000000);
      dispatch_get_global_queue(21, 0);
      v40 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v39, v40, v38);

      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_52;
      v57[3] = &unk_1E949FE68;
      objc_copyWeak(&v61, &location);
      v41 = v38;
      v60 = v41;
      v42 = v36;
      v58 = v42;
      v43 = v37;
      v59 = v43;
      objc_msgSend(v51, "addInvocationBlock:", v57);
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v52[2]();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v91 = val;
        v92 = 2114;
        v93 = v45;
        v94 = 2114;
        v95 = v42;
        v96 = 2114;
        v97 = v51;
        _os_log_impl(&dword_1D2F2C000, v44, OS_LOG_TYPE_DEFAULT, "%p: Sending update%{public}@ for %{public}@: %{public}@", buf, 0x2Au);

      }
      -[NSObject observer:wasUpdated:](v56, "observer:wasUpdated:", v42, v51);

      objc_destroyWeak(&v61);
      objc_destroyWeak(&v65);

      v46 = v56;
    }
    else
    {
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v52[2]();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v91 = val;
        v92 = 2114;
        v93 = v47;
        v94 = 2048;
        v95 = v83;
        _os_log_impl(&dword_1D2F2C000, v46, OS_LOG_TYPE_DEFAULT, "%p: Skipping flushing of changes%{public}@ due to %llu unacknowledged updates", buf, 0x20u);

      }
    }

    objc_destroyWeak(&v81);
    objc_destroyWeak(&location);

    _Block_object_dispose(v87, 8);
  }

}

id __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  if (!v3)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" after %@"), *(_QWORD *)(a1 + 32));
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v3 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;
    }
    else
    {
      *(_QWORD *)(v2 + 40) = &stru_1E94A4508;
    }

  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_msgSend(WeakRetained, "changeScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3;
    v6[3] = &unk_1E949FD30;
    v6[4] = v4;
    objc_msgSend(v4, "_onScheduler:performCancelableBlock:", v5, v6);

  }
}

uint64_t __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushUpdatesWithReason:", CFSTR("all updates were acknowledged"));
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {

    v10 = 0;
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observer:matchedAddedObjectIDs:before:extraInfo:", v8, v9, v10, 0);

}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_2_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {

    v10 = 0;
  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observer:matchedMovedObjectIDs:before:extraInfo:", v8, v9, v10, 0);

}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_48(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_48_cold_1((uint64_t)WeakRetained, a1, v3);

    objc_msgSend(MEMORY[0x1E0D1EE70], "sharedReporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportIssueType:description:", v6, CFSTR("Timedout update"));

  }
}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_52(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 48));
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134218498;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Acknowledged update for %{public}@: %{public}@", (uint8_t *)&v6, 0x20u);
    }

  }
}

- (void)persistenceIsAddingThreadWithObjectID:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v7 = a3;
  objc_msgSend(v7, "threadScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__EDPrecomputedThreadQueryHandler_persistenceIsAddingThreadWithObjectID_journaled_generationWindow___block_invoke;
    v12[3] = &unk_1E949FE90;
    v14 = a4;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v11, "performSyncBlock:", v12);

  }
}

void __100__EDPrecomputedThreadQueryHandler_persistenceIsAddingThreadWithObjectID_journaled_generationWindow___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "unreportedJournaledObjectIDs");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v3, "_persistenceIsAddingThreadWithObjectID:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_persistenceIsAddingThreadWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _EDThreadPositionChangeSet *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  EDPrecomputedThreadQueryHandler *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDPrecomputedThreadQueryHandler reportedJournaledObjectIDs](self, "reportedJournaledObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:", v4, v6, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "addObjectIDToAdd:before:", v4, v13);

  if (v16)
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v17 = (_EDThreadPositionChangeSet *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218754;
      v23 = self;
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1D2F2C000, &v17->super, OS_LOG_TYPE_DEFAULT, "%p: Adding add for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v22, 0x2Au);

    }
  }
  else
  {
    v17 = objc_alloc_init(_EDThreadPositionChangeSet);
    -[_EDThreadPositionChangeSet addObjectIDToAdd:before:](v17, "addObjectIDToAdd:before:", v4, v13);
    -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v17);

    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218754;
      v23 = self;
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "%p: Adding add to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v22, 0x2Au);

    }
  }

}

- (void)persistenceIsMarkingThreadAsJournaledWithObjectID:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  objc_msgSend(v5, "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __102__EDPrecomputedThreadQueryHandler_persistenceIsMarkingThreadAsJournaledWithObjectID_generationWindow___block_invoke;
    v10[3] = &unk_1E949FD58;
    v10[4] = self;
    v11 = v5;
    -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v9, v10);

  }
}

void __102__EDPrecomputedThreadQueryHandler_persistenceIsMarkingThreadAsJournaledWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "unreportedJournaledObjectIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v2 & 1) == 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "reportedJournaledObjectIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

  }
}

- (void)persistenceIsReconcilingJournaledThreadsWithObjectIDs:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  EDPrecomputedThreadQueryHandler *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke;
  v15[3] = &unk_1E949FEB8;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v5, "ef_filter:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_2;
    v11[3] = &unk_1E949B390;
    v12 = v9;
    v13 = self;
    v14 = v8;
    objc_msgSend(v10, "performSyncBlock:", v11);

  }
}

uint64_t __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "threadScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_3;
  v33[3] = &unk_1E949FEB8;
  v3 = *(void **)(a1 + 32);
  v33[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "ef_partition:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "unreportedJournaledObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_removeObjectsInArray:", v5);

  objc_msgSend(*(id *)(a1 + 40), "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadObjectIDsByNextExistingForThreadObjectIDs:forSortDescriptors:journaledThreadsToCheck:", v9, v24, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v2;
  v31[1] = 3221225472;
  v31[2] = __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_4;
  v31[3] = &unk_1E949FD08;
  v11 = *(void **)(a1 + 48);
  v31[4] = *(_QWORD *)(a1 + 40);
  v32 = v11;
  v23 = v10;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v26, "second");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v16);

          objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "allObjects");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "changeForThreadWithObjectID:changedKeyPaths:", v16, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "_addChangeToPendingChanges:forThreadObjectID:", v22, v16);
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v13);
  }

}

uint64_t __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unreportedJournaledObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void __106__EDPrecomputedThreadQueryHandler_persistenceIsReconcilingJournaledThreadsWithObjectIDs_generationWindow___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  _EDThreadPositionChangeSet *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v7 = 134218754;
    v21 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "addObjectIDToAdd:before:", v10, v5);

        if (v13)
        {
          +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
          v14 = (_EDThreadPositionChangeSet *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_QWORD *)(a1 + 32);
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v21;
            v28 = v15;
            v29 = 2114;
            v30 = v10;
            v31 = 2114;
            v32 = v5;
            v33 = 2114;
            v34 = v16;
            _os_log_impl(&dword_1D2F2C000, &v14->super, OS_LOG_TYPE_DEFAULT, "%p: Adding add for objectID: %{public}@ -> %{public}@\n%{public}@", buf, 0x2Au);
          }
        }
        else
        {
          v14 = objc_alloc_init(_EDThreadPositionChangeSet);
          -[_EDThreadPositionChangeSet addObjectIDToAdd:before:](v14, "addObjectIDToAdd:before:", v10, v5);
          objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v14);

          +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_QWORD *)(a1 + 32);
            v20 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v21;
            v28 = v19;
            v29 = 2114;
            v30 = v10;
            v31 = 2114;
            v32 = v5;
            v33 = 2114;
            v34 = v20;
            _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "%p: Adding add to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", buf, 0x2Au);
          }

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v6);
  }

}

- (void)persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "threadScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __108__EDPrecomputedThreadQueryHandler_persistenceIsChangingThreadWithObjectID_changedKeyPaths_generationWindow___block_invoke;
    v13[3] = &unk_1E949B390;
    v13[4] = self;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v12, "performSyncBlock:", v13);

  }
}

void __108__EDPrecomputedThreadQueryHandler_persistenceIsChangingThreadWithObjectID_changedKeyPaths_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v1 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "unreportedJournaledObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(v1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(v1 + 32), "reportedJournaledObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(v1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(id *)(v1 + 48);
    if (v5)
    {
      v19 = v6;
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = v1;
      v7 = *(id *)(v1 + 48);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v24;
        v10 = *MEMORY[0x1E0D1DD70];
        v11 = *MEMORY[0x1E0D1DE78];
        v12 = *MEMORY[0x1E0D1DE70];
        v13 = *MEMORY[0x1E0D1DE60];
        v22 = *MEMORY[0x1E0D1DE90];
        v21 = *MEMORY[0x1E0D1DD20];
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v7);
            v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
            if ((objc_msgSend(v15, "isEqualToString:", v10) & 1) != 0
              || (objc_msgSend(v15, "isEqualToString:", v11) & 1) != 0
              || (objc_msgSend(v15, "isEqualToString:", v12) & 1) != 0
              || (objc_msgSend(v15, "isEqualToString:", v13) & 1) != 0
              || (objc_msgSend(v15, "isEqualToString:", v22) & 1) != 0
              || objc_msgSend(v15, "isEqualToString:", v21))
            {
              objc_msgSend(v5, "addObject:", v15);
            }
            else
            {
              objc_msgSend(v20, "addObject:", v15);
            }
            ++v14;
          }
          while (v8 != v14);
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          v8 = v16;
        }
        while (v16);
      }

      v1 = v18;
      v17 = v20;

    }
    else
    {
      v17 = v6;
    }
    objc_msgSend(*(id *)(v1 + 32), "_persistenceIsChangingThreadWithObjectID:changedKeyPaths:", *(_QWORD *)(v1 + 40), v17);

  }
}

- (void)_persistenceIsChangingThreadWithObjectID:(id)a3 changedKeyPaths:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _EDThreadPositionChangeSet *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  EDPrecomputedThreadQueryHandler *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EDPrecomputedThreadQueryHandler _isAddingOrDeletingObjectID:](self, "_isAddingOrDeletingObjectID:", v6))
  {
    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 134218498;
      v30 = self;
      v31 = 2114;
      v32 = v6;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Ignoring change for objectID: %{public}@\n%{public}@", (uint8_t *)&v29, 0x20u);

    }
  }
  else
  {
    -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeForThreadWithObjectID:changedKeyPaths:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDPrecomputedThreadQueryHandler _addChangeToPendingChanges:forThreadObjectID:](self, "_addChangeToPendingChanges:forThreadObjectID:", v11, v6);
  }
  if (-[EDMessageRepositoryQueryHandler keyPathsAffectSorting:](self, "keyPathsAffectSorting:", v7))
  {
    -[EDMessageRepositoryQueryHandler query](self, "query");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDPrecomputedThreadQueryHandler reportedJournaledObjectIDs](self, "reportedJournaledObjectIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nextExistingThreadObjectIDForThreadObjectID:forSortDescriptors:journaledThreadsToCheck:excluding:", v6, v13, v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "addObjectIDToMove:before:", v6, v20);

    if (v23)
    {
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v24 = (_EDThreadPositionChangeSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
      {
        -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 134218754;
        v30 = self;
        v31 = 2114;
        v32 = v6;
        v33 = 2114;
        v34 = v20;
        v35 = 2114;
        v36 = v25;
        _os_log_impl(&dword_1D2F2C000, &v24->super, OS_LOG_TYPE_DEFAULT, "%p: Adding move for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v29, 0x2Au);

      }
    }
    else
    {
      v24 = objc_alloc_init(_EDThreadPositionChangeSet);
      -[_EDThreadPositionChangeSet addObjectIDToMove:before:](v24, "addObjectIDToMove:before:", v6, v20);
      -[EDPrecomputedThreadQueryHandler pendingPositionChanges](self, "pendingPositionChanges");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v24);

      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 134218754;
        v30 = self;
        v31 = 2114;
        v32 = v6;
        v33 = 2114;
        v34 = v20;
        v35 = 2114;
        v36 = v28;
        _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "%p: Adding move to new position change for objectID: %{public}@ -> %{public}@\n%{public}@", (uint8_t *)&v29, 0x2Au);

      }
    }

  }
}

- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = objc_alloc(MEMORY[0x1E0D1E380]);
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithConversationID:threadScope:", a4, v9);

  -[EDPrecomputedThreadQueryHandler messageListItemForObjectID:error:](self, "messageListItemForObjectID:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __117__EDPrecomputedThreadQueryHandler_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke;
    v13[3] = &unk_1E949BCB8;
    v13[4] = self;
    v14 = v10;
    v15 = a3;
    objc_msgSend(v12, "performSyncBlock:", v13);

  }
}

void __117__EDPrecomputedThreadQueryHandler_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "unreportedJournaledObjectIDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v2 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isAddingOrDeletingObjectID:", *(_QWORD *)(a1 + 40)))
    {
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v3 = *(void **)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v3, "threadScope");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v11 = v3;
        v12 = 2114;
        v13 = v4;
        v14 = 2114;
        v15 = v5;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_INFO, "%p: Ignoring Conversation Notification Level change for objectID: %{public}@\n%{public}@", buf, 0x20u);

      }
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D1E240]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setConversationNotificationLevel:", v6);

      objc_msgSend(*(id *)(a1 + 32), "_addChangeToPendingChanges:forThreadObjectID:", v9, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_flushUpdatesWithReason:", CFSTR("conversation flags change"));

    }
  }
}

- (void)persistenceIsDeletingThreadWithObjectID:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  objc_msgSend(v5, "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__EDPrecomputedThreadQueryHandler_persistenceIsDeletingThreadWithObjectID_generationWindow___block_invoke;
    v10[3] = &unk_1E949FD58;
    v10[4] = self;
    v11 = v5;
    -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v9, v10);

  }
}

void __92__EDPrecomputedThreadQueryHandler_persistenceIsDeletingThreadWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _EDThreadPositionChangeSet *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "unreportedJournaledObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "unreportedJournaledObjectIDs");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v4, "reportedJournaledObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "threadScope");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "%p: Adding objectID to delete: %{public}@\n%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges");
      v12 = (_EDThreadPositionChangeSet *)objc_claimAutoreleasedReturnValue();
      -[_EDThreadPositionChangeSet lastObject](v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectIDToDelete:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v12 = objc_alloc_init(_EDThreadPositionChangeSet);
      -[_EDThreadPositionChangeSet addObjectIDToDelete:](v12, "addObjectIDToDelete:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "pendingPositionChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);
    }

  }
}

- (void)persistenceDidFinishThreadUpdates
{
  void *v3;
  _QWORD v4[5];

  -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__EDPrecomputedThreadQueryHandler_persistenceDidFinishThreadUpdates__block_invoke;
  v4[3] = &unk_1E949FD30;
  v4[4] = self;
  -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v3, v4);

}

uint64_t __68__EDPrecomputedThreadQueryHandler_persistenceDidFinishThreadUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushUpdatesWithReason:", 0);
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  EDPrecomputedThreadQueryHandler *v12;

  v7 = a5;
  -[EDPrecomputedThreadQueryHandler _messageForPersistedMessage:](self, "_messageForPersistedMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__EDPrecomputedThreadQueryHandler_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
    v10[3] = &unk_1E949FD58;
    v11 = v8;
    v12 = self;
    -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v9, v10);

  }
}

void __113__EDPrecomputedThreadQueryHandler_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1E380]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conversationID");
  objc_msgSend(*(id *)(a1 + 40), "threadScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithConversationID:threadScope:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "unreportedJournaledObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "containsObject:", v5);

  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_isAddingOrDeletingObjectID:", v5))
    {
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v8, "threadScope");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v17 = v8;
        v18 = 2114;
        v19 = v5;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "%p: Ignoring messageID change for objectID: %{public}@\n%{public}@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D1DD70];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changeForThreadWithObjectID:changedKeyPaths:", v5, v11);
      v7 = objc_claimAutoreleasedReturnValue();

      -[NSObject displayMessageItemID](v7, "displayMessageItemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "_addChangeToPendingChanges:forThreadObjectID:", v7, v5);
        objc_msgSend(*(id *)(a1 + 40), "_flushUpdatesWithReason:", CFSTR("messageID change"));
      }
    }

  }
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  EDPrecomputedThreadQueryHandler *v18;
  char v19;
  char v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D1E648]);
  v10 = objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0D1E650]);
  v11 = objc_msgSend(v7, "containsObject:", CFSTR("GeneratedSummary"));
  v12 = v11;
  if ((v9 | v10 | v11) == 1)
  {
    -[EDPrecomputedThreadQueryHandler _messageForPersistedMessage:](self, "_messageForPersistedMessage:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[EDPrecomputedThreadQueryHandler changeScheduler](self, "changeScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__EDPrecomputedThreadQueryHandler_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
      v16[3] = &unk_1E949FEE0;
      v15 = v13;
      v17 = v15;
      v18 = self;
      v19 = v9;
      v20 = v10;
      v21 = v12;
      -[EDPrecomputedThreadQueryHandler _onScheduler:performCancelableBlock:](self, "_onScheduler:performCancelableBlock:", v14, v16);

    }
  }

}

void __91__EDPrecomputedThreadQueryHandler_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1E380]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conversationID");
  objc_msgSend(*(id *)(a1 + 40), "threadScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithConversationID:threadScope:", v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "unreportedJournaledObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "containsObject:", v5);

  if ((v3 & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 49))
      v7 = CFSTR("subject and summary change");
    else
      v7 = CFSTR("subject change");
    v8 = CFSTR("summary change");
    if (!*(_BYTE *)(a1 + 49))
      v8 = CFSTR("unknown change");
    if (*(_BYTE *)(a1 + 48))
      v9 = v7;
    else
      v9 = v8;
    if (objc_msgSend(*(id *)(a1 + 40), "_isAddingOrDeletingObjectID:", v5))
    {
      +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(void **)(a1 + 40);
        objc_msgSend(v11, "threadScope");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v33 = v11;
        v34 = 2114;
        v35 = v9;
        v36 = 2114;
        v37 = v5;
        v38 = 2114;
        v39 = v12;
        _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_INFO, "%p: Ignoring %{public}@ for objectID: %{public}@\n%{public}@", buf, 0x2Au);

      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
      {
        v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v14 = *MEMORY[0x1E0D1DD70];
        v15 = (void *)objc_msgSend(v13, "initWithObjects:", *MEMORY[0x1E0D1DD70], 0);
        v16 = v15;
        if (*(_BYTE *)(a1 + 48))
          objc_msgSend(v15, "addObject:", *MEMORY[0x1E0D1DE70]);
        if (*(_BYTE *)(a1 + 49))
          objc_msgSend(v16, "addObject:", *MEMORY[0x1E0D1DE78]);
        objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "changeForThreadWithObjectID:changedKeyPaths:", v5, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "displayMessageItemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "itemID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v16, "removeObject:", v14);
            objc_msgSend(v23, "addObjectsFromArray:", v16);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "_addChangeToPendingChanges:forThreadObjectID:", v18, v5);
            objc_msgSend(*(id *)(a1 + 40), "_flushUpdatesWithReason:", v9);
          }

        }
      }
      if (*(_BYTE *)(a1 + 50))
      {
        objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "newestMessageItemIDForThreadWithObjectID:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "itemID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if (v27)
        {
          v28 = objc_alloc_init(MEMORY[0x1E0D1E240]);
          objc_msgSend(*(id *)(a1 + 32), "generatedSummary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setGeneratedSummary:", v29);

          objc_msgSend(*(id *)(a1 + 40), "reportedJournaledObjectIDs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v5);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v31, "addObject:", *MEMORY[0x1E0D1DDA0]);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "_addChangeToPendingChanges:forThreadObjectID:", v28, v5);
            objc_msgSend(*(id *)(a1 + 40), "_flushUpdatesWithReason:", v9);
          }

        }
      }
    }
  }

}

- (id)_messageForPersistedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messagesForPersistedMessages:mailboxScope:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "filterPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "evaluateWithObject:", v10);

    if ((v13 & 1) == 0)
    {

      v10 = 0;
    }
  }

  return v10;
}

void __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  __int128 v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  id obj;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(WeakRetained, "mailboxes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v3)
    {
      v5 = 0;
      v6 = *(_QWORD *)v23;
      *(_QWORD *)&v4 = 134218242;
      v19 = v4;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1D824B334]();
          objc_msgSend(v2, "threadPersistence");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "threadScope");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "oldestThreadObjectIDForMailbox:threadScope:", v8, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "oldestThreadObjectIDsByMailbox");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 != v14 && (objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
          {
            objc_msgSend(v2, "oldestThreadObjectIDsByMailbox");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v8);

            +[EDPrecomputedThreadQueryHandler log](EDPrecomputedThreadQueryHandler, "log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v8, "ef_publicDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v27 = v2;
              v28 = 2114;
              v29 = v17;
              _os_log_debug_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEBUG, "%p: Oldest thread updated for mailbox: %{public}@", buf, 0x16u);

            }
            v5 = 1;
          }

          objc_autoreleasePoolPop(v9);
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v3);

      if ((v5 & 1) != 0)
      {
        objc_msgSend(v2, "changeScheduler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke_72;
        v21[3] = &unk_1E949FD30;
        v21[4] = v2;
        objc_msgSend(v2, "_onScheduler:performCancelableBlock:", v18, v21);

      }
    }
    else
    {

    }
    objc_msgSend(v2, "setUpdateOldestThreadsCancelationToken:", 0, v19);
  }

}

void __59__EDPrecomputedThreadQueryHandler__oldestThreadsNeedUpdate__block_invoke_72(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "oldestThreadObjectIDsByMailbox");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observer:matchedOldestItemsUpdatedForMailboxes:", v2, v3);

}

- (void)controller:(id)a3 messageTimerFired:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[EDPrecomputedThreadQueryHandler updateDisplayDate](self, "updateDisplayDate"))
  {
    -[EDPrecomputedThreadQueryHandler _messageForPersistedMessage:](self, "_messageForPersistedMessage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateBeforeDisplayForPersistedMessages:", v8);

    }
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
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDPrecomputedThreadQueryHandler threadPersistence](self, "threadPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPrecomputedThreadQueryHandler threadScope](self, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__EDPrecomputedThreadQueryHandler_itemIDsForStateCaptureWithErrorString___block_invoke;
  v12[3] = &unk_1E949FF08;
  v10 = v5;
  v13 = v10;
  objc_msgSend(v6, "threadObjectIDsForThreadScope:sortDescriptors:initialBatchSize:journaledObjectIDs:batchBlock:", v7, v9, 15000, 0, v12);

  if (a3)
    *a3 = 0;

  return v10;
}

void __73__EDPrecomputedThreadQueryHandler_itemIDsForStateCaptureWithErrorString___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ef_compactMapSelector:", sel_collectionItemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  *a3 = 15000;
}

- (void)setCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancelationToken, a3);
}

- (NSMutableDictionary)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChanges, a3);
}

- (NSMutableArray)pendingPositionChanges
{
  return self->_pendingPositionChanges;
}

- (void)setPendingPositionChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPositionChanges, a3);
}

- (void)setUnreportedJournaledObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unreportedJournaledObjectIDs, a3);
}

- (NSMutableDictionary)reportedJournaledObjectIDs
{
  return self->_reportedJournaledObjectIDs;
}

- (void)setReportedJournaledObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_reportedJournaledObjectIDs, a3);
}

- (NSMutableDictionary)oldestThreadObjectIDsByMailbox
{
  return self->_oldestThreadObjectIDsByMailbox;
}

- (void)setOldestThreadObjectIDsByMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_oldestThreadObjectIDsByMailbox, a3);
}

- (EDUpdateThrottler)updateThrottler
{
  return self->_updateThrottler;
}

- (EMThreadReloadSummaryHelper)reloadSummaryHelper
{
  return self->_reloadSummaryHelper;
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
  objc_storeStrong((id *)&self->_reloadSummaryHelper, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_updateOldestThreadsCancelationToken, 0);
  objc_storeStrong((id *)&self->_oldestThreadObjectIDsByMailbox, 0);
  objc_storeStrong((id *)&self->_reportedJournaledObjectIDs, 0);
  objc_storeStrong((id *)&self->_unreportedJournaledObjectIDs, 0);
  objc_storeStrong((id *)&self->_pendingPositionChanges, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_backgroundWorkScheduler, 0);
  objc_storeStrong((id *)&self->_changeScheduler, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
}

- (void)_extaInfoPrecachedThreadsForInitialObjectIDs:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "%p: Failed to prefetch threads with error:%{public}@", buf, 0x16u);

}

void __59__EDPrecomputedThreadQueryHandler__flushUpdatesWithReason___block_invoke_3_48_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 134218498;
  v6 = a1;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "%p: Timedout update for %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
