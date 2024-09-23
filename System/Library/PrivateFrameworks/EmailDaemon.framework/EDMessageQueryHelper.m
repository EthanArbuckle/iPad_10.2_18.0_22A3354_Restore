@implementation EDMessageQueryHelper

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDMessageQueryHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_54 != -1)
    dispatch_once(&log_onceToken_54, block);
  return (OS_os_log *)(id)log_log_54;
}

void __27__EDMessageQueryHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_54;
  log_log_54 = (uint64_t)v1;

}

- (EDMessageQueryHelper)initWithQuery:(id)a3 initialBatchSize:(int64_t)a4 maximumBatchSize:(int64_t)a5 messagePersistence:(id)a6 hookRegistry:(id)a7 searchProvider:(id)a8 scheduler:(id)a9 remindMeNotificationController:(id)a10 delegate:(id)a11 shouldReconcileJournal:(BOOL)a12 shouldAddMessagesSynchronously:(BOOL)a13 keepMessagesInListOnBucketChange:(BOOL)a14
{
  EDMessageQueryHelper *v20;
  id *p_isa;
  EDMessageQueryHelper *v22;
  NSMutableSet *v23;
  NSMutableSet *noLongerMatchingMessages;
  NSMutableSet *v25;
  NSMutableSet *ignoredMessages;
  EFCancelationToken *v27;
  EFCancelationToken *cancelationToken;
  uint64_t v29;
  EMQuery *query;
  void *v31;
  void *v32;
  uint64_t v33;
  NSPredicate *ignoreMessagesPredicate;
  unint64_t v35;
  EDMessageQueryEvaluator *v36;
  EDMessageQueryEvaluator *queryEvaluator;
  uint64_t v38;
  EFPromise *initialResultsPromise;
  uint64_t v40;
  NSString *pendingFlagChangesKey;
  uint64_t v42;
  NSString *pendingConversationIDChangesKey;
  uint64_t v44;
  NSString *pendingReadLaterDateChangesKey;
  uint64_t v46;
  NSString *pendingDisplayDateChangesKey;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id obj;
  id v55;
  objc_super v56;

  v55 = a3;
  v53 = a6;
  v52 = a7;
  v51 = a8;
  v50 = a9;
  v49 = a10;
  obj = a11;
  v56.receiver = self;
  v56.super_class = (Class)EDMessageQueryHelper;
  v20 = -[EDMessageQueryHelper init](&v56, sel_init);
  p_isa = (id *)&v20->super.isa;
  v22 = v20;
  if (v20)
  {
    v20->_noLongerMatchingMessagesLock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    noLongerMatchingMessages = v22->_noLongerMatchingMessages;
    v22->_noLongerMatchingMessages = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    ignoredMessages = v22->_ignoredMessages;
    v22->_ignoredMessages = v25;

    v22->_ignoredMessagesLock._os_unfair_lock_opaque = 0;
    v27 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelationToken = v22->_cancelationToken;
    v22->_cancelationToken = v27;

    v29 = objc_msgSend(v55, "copy");
    query = v22->_query;
    v22->_query = (EMQuery *)v29;

    v22->_initialBatchSize = a4;
    v22->_maximumBatchSize = a5;
    objc_storeStrong(p_isa + 9, a6);
    objc_storeStrong(p_isa + 10, a7);
    objc_storeStrong(p_isa + 11, a8);
    objc_storeStrong(p_isa + 13, a9);
    objc_storeWeak(p_isa + 14, obj);
    objc_storeStrong(p_isa + 12, a10);
    -[EMQuery targetClassOptions](v22->_query, "targetClassOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DD00]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    ignoreMessagesPredicate = v22->_ignoreMessagesPredicate;
    v22->_ignoreMessagesPredicate = (NSPredicate *)v33;

    if (a12)
      v35 = ((unint64_t)objc_msgSend(v55, "queryOptions") >> 3) & 1;
    else
      LOBYTE(v35) = 0;
    v22->_shouldReconcileJournal = v35;
    v22->_addMessagesSynchronously = a13;
    v22->_keepMessagesInListOnBucketChange = a14;
    v36 = -[EDMessageQueryEvaluator initWithQuery:messagePersistence:]([EDMessageQueryEvaluator alloc], "initWithQuery:messagePersistence:", v55, p_isa[9]);
    queryEvaluator = v22->_queryEvaluator;
    v22->_queryEvaluator = v36;

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v38 = objc_claimAutoreleasedReturnValue();
    initialResultsPromise = v22->_initialResultsPromise;
    v22->_initialResultsPromise = (EFPromise *)v38;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingFlagChangesKey-%p"), objc_opt_class(), v22);
    v40 = objc_claimAutoreleasedReturnValue();
    pendingFlagChangesKey = v22->_pendingFlagChangesKey;
    v22->_pendingFlagChangesKey = (NSString *)v40;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingConversationIDChangeKey-%p"), objc_opt_class(), v22);
    v42 = objc_claimAutoreleasedReturnValue();
    pendingConversationIDChangesKey = v22->_pendingConversationIDChangesKey;
    v22->_pendingConversationIDChangesKey = (NSString *)v42;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingReadLaterDateChangesKey-%p"), objc_opt_class(), v22);
    v44 = objc_claimAutoreleasedReturnValue();
    pendingReadLaterDateChangesKey = v22->_pendingReadLaterDateChangesKey;
    v22->_pendingReadLaterDateChangesKey = (NSString *)v44;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingDisplayDateChangesKey-%p"), objc_opt_class(), v22);
    v46 = objc_claimAutoreleasedReturnValue();
    pendingDisplayDateChangesKey = v22->_pendingDisplayDateChangesKey;
    v22->_pendingDisplayDateChangesKey = (NSString *)v46;

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;

  -[EDMessageQueryHelper cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EDMessageQueryHelper;
  -[EDMessageQueryHelper dealloc](&v3, sel_dealloc);
}

- (BOOL)updateDisplayDate
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[EDMessageQueryHelper query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetClassOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DEA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)start
{
  atomic_flag *p_didStart;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  p_didStart = &self->_didStart;
  do
    v5 = __ldaxr((unsigned __int8 *)p_didStart);
  while (__stlxr(1u, (unsigned __int8 *)p_didStart));
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageQueryHelper.m"), 116, CFSTR("Trying to start EDMessageQueryHelper %p that was already started."), self);

  }
  -[EDMessageQueryHelper remindMeNotificationController](self, "remindMeNotificationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRemindMeObserver:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper cancelationToken](self, "cancelationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCancelable:", v7);

  -[EDMessageQueryHelper hookRegistry](self, "hookRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v9);
  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__EDMessageQueryHelper_start__block_invoke;
  v12[3] = &unk_1E949E7C8;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "performVoucherPreservingBlock:", v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __29__EDMessageQueryHelper_start__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__EDMessageQueryHelper_start__block_invoke_2;
  v3[3] = &unk_1E949AD60;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v3);

  objc_destroyWeak(&v4);
}

void __29__EDMessageQueryHelper_start__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateDisplayDateForMessagesIfNeeded");
  objc_msgSend(WeakRetained, "registerMessageChangeHookResponder:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerCategoryChangeHookResponder:", *(_QWORD *)(a1 + 32));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__EDMessageQueryHelper_start__block_invoke_3;
  v5[3] = &unk_1E949E7A0;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "addCancelationBlock:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_getInitialResults");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __29__EDMessageQueryHelper_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "unregisterHookResponder:", v4);

    WeakRetained = v4;
  }

}

- (void)cancel
{
  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
}

- (void)_updateDisplayDateForMessagesIfNeeded
{
  void *v3;
  id v4;

  if (-[EDMessageQueryHelper updateDisplayDate](self, "updateDisplayDate"))
  {
    -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryHelper query](self, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateBeforeDisplayForMessagesMatchingQuery:", v3);

  }
}

- (void)_getInitialResults
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  EDMessageQueryHelper *v44;
  _QWORD v45[5];
  id v46;
  _QWORD aBlock[7];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t v52[4];
  EDMessageQueryHelper *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (-[EDMessageQueryHelper shouldReconcileJournal](self, "shouldReconcileJournal"))
  {
    -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reconcileJournalWithCompletionBlock:", 0);

  }
  +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EDMessageQueryHelper query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%@ Getting initial results for message query %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__18;
  v60 = __Block_byref_object_dispose__18;
  v61 = (id)0xAAAAAAAAAAAAAAAALL;
  v61 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke;
  aBlock[3] = &unk_1E949E818;
  aBlock[4] = self;
  aBlock[5] = buf;
  aBlock[6] = &v48;
  v8 = _Block_copy(aBlock);
  -[EDMessageQueryHelper query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_msgSend(v9, "queryOptions") & 4) == 0;

  if (v10)
  {
    -[EDMessageQueryHelper query](self, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "queryOptions") & 0x20) != 0)
    {
      -[EDMessageQueryHelper searchProvider](self, "searchProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localSearchProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageQueryHelper.m"), 187, CFSTR("Spotlight search query sent to handler without spotlight access"));

      }
      -[EDMessageQueryHelper searchProvider](self, "searchProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localSearchProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "persistenceQueryForSearchableIndexQuery:", v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v17;
    }
    -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[EDMessageQueryHelper maximumBatchSize](self, "maximumBatchSize");
    v20 = -[EDMessageQueryHelper initialBatchSize](self, "initialBatchSize");
    -[EDMessageQueryHelper cancelationToken](self, "cancelationToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iterateMessagesMatchingQuery:batchSize:firstBatchSize:limit:cancelationToken:handler:", v11, v19, v20, 0x7FFFFFFFFFFFFFFFLL, v21, v8);

    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v49[3];
      -[EDMessageQueryHelper query](self, "query");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 138412802;
      v53 = self;
      v54 = 2048;
      v55 = v23;
      v56 = 2112;
      v57 = v24;
      _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "%@ found %lu initial results for message query %@", v52, 0x20u);

    }
  }
  -[EDMessageQueryHelper delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHelper scheduler](self, "scheduler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_28;
  v45[3] = &unk_1E949B6D0;
  v45[4] = self;
  v27 = v25;
  v46 = v27;
  objc_msgSend(v26, "performSyncBlock:", v45);

  -[EDMessageQueryHelper initialResultsPromise](self, "initialResultsPromise");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  -[EDMessageQueryHelper query](self, "query");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (objc_msgSend(v29, "queryOptions") & 2) == 0;

  if (!v30)
  {
    -[EDMessageQueryHelper searchProvider](self, "searchProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "remoteSearchProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageQueryHelper query](self, "query");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "queryOptions");

    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = CFSTR("server-side");
      if ((v34 & 0x10) != 0)
        v36 = CFSTR("locally indexed");
      *(_DWORD *)v52 = 138412290;
      v53 = (EDMessageQueryHelper *)v36;
      _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "Performing %@ remote search", v52, 0xCu);
    }

    -[EDMessageQueryHelper query](self, "query");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fetchRemoteMessagesWithQuery:delegate:useLocalIndex:", v37, self, (v34 >> 4) & 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[EDMessageQueryHelper cancelationToken](self, "cancelationToken");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addCancelable:", v38);
    }
    else
    {
      -[EDMessageQueryHelper scheduler](self, "scheduler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v7;
      v42[1] = 3221225472;
      v42[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_33;
      v42[3] = &unk_1E949B6D0;
      v43 = v27;
      v44 = self;
      objc_msgSend(v40, "performSyncBlock:", v42);

      v39 = v43;
    }

  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(buf, 8);

}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    if (v8 < -5.0)
      EFSaveTailspin();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__EDMessageQueryHelper__getInitialResults__block_invoke_2;
    v18[3] = &unk_1E949E7F0;
    v18[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 48);
    v19 = v12;
    v20 = v13;
    objc_msgSend(v11, "performSyncBlock:", v18);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v12, "count");
  }
  else if (!v5)
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "ef_publicDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_error_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_ERROR, "%p: Received error %{public}@ while performing initial query: %@", buf, 0x20u);

    }
  }

}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelper:didFindMessages:forInitialBatch:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0);

}

void __42__EDMessageQueryHelper__getInitialResults__block_invoke_28(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCanceled");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "queryHelperDidFindAllMessages:", *(_QWORD *)(a1 + 32));
}

uint64_t __42__EDMessageQueryHelper__getInitialResults__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryHelperDidFinishRemoteSearch:", *(_QWORD *)(a1 + 40));
}

- (id)_predicateWithAdditionalPredicates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_ignoredMessagesLock;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_noLongerMatchingMessagesLock);
  -[NSMutableSet allObjects](self->_noLongerMatchingMessages, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_noLongerMatchingMessagesLock);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E1E8], "predicateForMessagesWithObjectIDs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(v24, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    v27[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v24, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  p_ignoredMessagesLock = &self->_ignoredMessagesLock;
  os_unfair_lock_lock(&self->_ignoredMessagesLock);
  -[NSMutableSet allObjects](self->_ignoredMessages, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ef_mapSelector:", sel_objectID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_ignoredMessagesLock);
  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3528];
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0D1E1E8], "predicateForExcludingMessagesWithObjectIDs:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v17;
  }
  v18 = (void *)MEMORY[0x1E0CB3528];
  v25[0] = v10;
  v25[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ef_flatten");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)messagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[EDMessageQueryHelper _predicateWithAdditionalPredicates:](self, "_predicateWithAdditionalPredicates:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHelper query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryWithPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "queryOptions") & 0x20) != 0)
  {
    -[EDMessageQueryHelper searchProvider](self, "searchProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSearchProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistenceQueryForSearchableIndexQuery:", v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messagesMatchingQuery:limit:", v8, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_filteredMessagesForPredicate:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryWithPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "queryOptions") & 0x20) != 0)
  {
    -[EDMessageQueryHelper searchProvider](self, "searchProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSearchProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistenceQueryForSearchableIndexQuery:", v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messagesMatchingQuery:limit:", v8, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterMessages:unmatchedMessages:", v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)sortableMessagesWithAdditionalPredicates:(id)a3 limit:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[EDMessageQueryHelper _predicateWithAdditionalPredicates:](self, "_predicateWithAdditionalPredicates:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHelper query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryWithTargetClass:predicate:", objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "queryOptions") & 0x20) != 0)
  {
    -[EDMessageQueryHelper searchProvider](self, "searchProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSearchProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistenceQueryForSearchableIndexQuery:", v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortableMessagesMatchingQuery:limit:", v8, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_foundMessages:(id)a3 inRemoteSearch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  EDMessageQueryHelper *v34;
  _QWORD v35[4];
  char v36;
  uint8_t buf[4];
  EDMessageQueryHelper *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ascending");

  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke;
  v35[3] = &__block_descriptor_33_e55_q24__0___EDPersistedMessage__8___EDPersistedMessage__16l;
  v36 = v10;
  objc_msgSend(v6, "sortedArrayWithOptions:usingComparator:", 16, v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EDMessageQueryHelper searchProvider](self, "searchProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteSearchProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageQueryHelper query](self, "query");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "queryOptions");

    if ((v16 & 0x10) != 0 || !v14)
    {
      v20 = v12;
    }
    else
    {
      -[EDMessageQueryHelper searchProvider](self, "searchProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "remoteSearchProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageQueryHelper query](self, "query");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "verifyResults:query:", v12, v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transformMessages:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v12, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v21, "count"))
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v21, "count");
      -[EDMessageQueryHelper query](self, "query");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v38 = self;
      v39 = 1024;
      v40 = v24;
      v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "%p: Adding %u filtered messages: %@", buf, 0x1Cu);

    }
    v28 = v11;
    v29 = 3221225472;
    v30 = __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke_41;
    v31 = &unk_1E949B390;
    v32 = v21;
    v33 = v12;
    v34 = self;
    v26 = _Block_copy(&v28);
    if (-[EDMessageQueryHelper addMessagesSynchronously](self, "addMessagesSynchronously", v28, v29, v30, v31))
    {
      -[EDMessageQueryHelper scheduler](self, "scheduler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "performSyncBlock:", v26);
    }
    else
    {
      -[EDMessageQueryHelper scheduler](self, "scheduler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "performBlock:", v26);
    }

  }
}

uint64_t __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(a2, "persistedMessageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "databaseID");

  objc_msgSend(v5, "persistedMessageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "databaseID");

  if (v7 != v9)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      if (v7 < v9)
      {
LABEL_5:
        v10 = -1;
        goto LABEL_8;
      }
    }
    else if (v7 > v9)
    {
      goto LABEL_5;
    }
    v10 = 1;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

void __54__EDMessageQueryHelper__foundMessages_inRemoteSearch___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  EFFetchSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v10[0] = 67109120;
    v10[1] = v6;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "QueryHelperDidAddMessages Callback", "count=%{signpost.description:attribute}u ", (uint8_t *)v10, 8u);
  }

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryHelper:didAddMessages:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  v8 = v5;
  v9 = v8;
  if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v8))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v9, OS_SIGNPOST_INTERVAL_END, v3, "QueryHelperDidAddMessages Callback", ", (uint8_t *)v10, 2u);
  }

}

- (id)_unjournaledMessagesForMessages:(id)a3
{
  objc_msgSend(a3, "ef_filter:", &__block_literal_global_43);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__EDMessageQueryHelper__unjournaledMessagesForMessages___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isJournaled") ^ 1;
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  EDMessageQueryHelper *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryOptions");

  if ((v7 & 4) == 0)
  {
    EFFetchSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      v10 = 134218240;
      v11 = self;
      v12 = 1024;
      v13 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v5, "count"));
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryHelperDidAddMessages", "helper=%p count=%u ", (uint8_t *)&v10, 0x12u);
    }

    -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
    -[EDMessageQueryHelper _foundMessages:inRemoteSearch:](self, "_foundMessages:inRemoteSearch:", v9, 0);
  }

}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[EDMessageQueryHelper persistenceDidDeleteAllMessagesInMailboxesWithURLs:generationWindow:].cold.1((uint64_t)self, objc_msgSend(v5, "count"), buf, v6);

  -[EDMessageQueryHelper scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__EDMessageQueryHelper_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke;
  v8[3] = &unk_1E949AEB8;
  v8[4] = self;
  objc_msgSend(v7, "performBlock:", v8);

}

void __92__EDMessageQueryHelper_persistenceDidDeleteAllMessagesInMailboxesWithURLs_generationWindow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelperNeedsRestart:", *(_QWORD *)(a1 + 32));

}

- (void)persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  EDMessageQueryHelper *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDMessageQueryHelper initialResultsPromise](self, "initialResultsPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resultIfAvailable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "count");
      -[EDMessageQueryHelper query](self, "query");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = self;
      v21 = 1024;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Holding %u reconciled persisted messages until initial results: %@", buf, 0x1Cu);

    }
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__EDMessageQueryHelper_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke;
  v16[3] = &unk_1E949E860;
  v16[4] = self;
  v14 = v6;
  v17 = v14;
  v15 = v7;
  v18 = v15;
  objc_msgSend(v9, "addSuccessBlock:", v16);

}

uint64_t __82__EDMessageQueryHelper_persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistenceDidReconcileJournaledMessages:generationWindow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_persistenceDidReconcileJournaledMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  EDMessageQueryHelper *v19;
  NSObject *v20;
  uint8_t buf[4];
  EDMessageQueryHelper *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryOptions");

  if ((v7 & 0x20) != 0)
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", buf, 2u);
    }
  }
  else
  {
    -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v5, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v8, "count"))
    {
      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[NSObject count](v8, "count");
        -[EDMessageQueryHelper query](self, "query");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = self;
        v23 = 1024;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Reconciled %u filtered messages: %@", buf, 0x1Cu);

      }
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __83__EDMessageQueryHelper__persistenceDidReconcileJournaledMessages_generationWindow___block_invoke;
      v18 = &unk_1E949B6D0;
      v19 = self;
      v12 = v8;
      v20 = v12;
      v13 = _Block_copy(&v15);
      if (-[EDMessageQueryHelper addMessagesSynchronously](self, "addMessagesSynchronously", v15, v16, v17, v18, v19))
      {
        -[EDMessageQueryHelper scheduler](self, "scheduler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "performSyncBlock:", v13);
      }
      else
      {
        -[EDMessageQueryHelper scheduler](self, "scheduler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "performBlock:", v13);
      }

      v8 = v12;
    }
  }

}

void __83__EDMessageQueryHelper__persistenceDidReconcileJournaledMessages_generationWindow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelper:didAddMessages:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[EDMessageQueryHelper query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "queryOptions");

  if ((v8 & 4) == 0 && (!objc_msgSend(v14, "deletedChanged") || (objc_msgSend(v14, "deleted") & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "threadDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transformAndFilterMessages:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageQueryHelper pendingFlagChangesKey](self, "pendingFlagChangesKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v13);

  }
}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v7 = a3;
  v8 = a4;
  -[EDMessageQueryHelper query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "queryOptions");

  if ((a4 & 4) != 0)
  {
    v10 = v8;
  }
  else
  {
    -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "deletedChanged") && objc_msgSend(v7, "deleted"))
    {
      -[EDMessageQueryHelper _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:](self, "_persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:", v10, 1);
    }
    else
    {
      -[EDMessageQueryHelper pendingFlagChangesKey](self, "pendingFlagChangesKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__EDMessageQueryHelper_persistenceDidChangeFlags_messages_generationWindow___block_invoke;
      v12[3] = &unk_1E949E888;
      v12[4] = self;
      -[EDMessageQueryHelper _calculateAndReportChangesForPersistedMessages:withPendingChangesKey:changeBlock:](self, "_calculateAndReportChangesForPersistedMessages:withPendingChangesKey:changeBlock:", v10, v11, v12);

    }
  }

}

void __76__EDMessageQueryHelper_persistenceDidChangeFlags_messages_generationWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryHelper:messageFlagsDidChangeForMessages:previousMessages:", *(_QWORD *)(a1 + 32), v5, v7);

}

- (void)persistenceWillChangeReadLaterDate:(id)a3 messages:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transformAndFilterMessages:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper pendingReadLaterDateChangesKey](self, "pendingReadLaterDateChangesKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[EDMessageQueryHelper pendingReadLaterDateChangesKey](self, "pendingReadLaterDateChangesKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0D1DE28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHelper _reportChangesForPersistedMessages:withPendingChangesKey:keyPaths:](self, "_reportChangesForPersistedMessages:withPendingChangesKey:keyPaths:", v7, v8, v9);

}

- (void)persistenceDidChangeConversationNotificationLevel:(int64_t)a3 conversationID:(int64_t)a4 generationWindow:(id)a5
{
  void *v8;
  _QWORD v9[7];

  -[EDMessageQueryHelper scheduler](self, "scheduler", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__EDMessageQueryHelper_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke;
  v9[3] = &unk_1E949E8B0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  objc_msgSend(v8, "performBlock:", v9);

}

void __106__EDMessageQueryHelper_persistenceDidChangeConversationNotificationLevel_conversationID_generationWindow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelper:conversationNotificationLevelDidChangeForConversation:conversationID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:](self, "_persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:");
}

- (void)_persistenceDidDeleteMessages:(id)a3 includeMessagesWithDeletedFlag:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  EDMessageQueryHelper *v34;
  __int16 v35;
  _BYTE v36[18];
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E1E8], "predicateForMessagesWithObjectIDs:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryHelper _filteredMessagesForPredicate:limit:](self, "_filteredMessagesForPredicate:limit:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v32 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v30;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "objectID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v11);
      }

      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[EDMessageQueryHelper query](self, "query");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v34 = self;
        v35 = 2114;
        *(_QWORD *)v36 = v9;
        *(_WORD *)&v36[8] = 2114;
        *(_QWORD *)&v36[10] = v16;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "%p: Not deleting objectIDs with still existent duplicates: %{public}@\n%{public}@", buf, 0x20u);

      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke;
      v27[3] = &unk_1E949B4A0;
      v17 = v9;
      v28 = v17;
      objc_msgSend(v7, "ef_filter:", v27);
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
    }
    if (objc_msgSend(v7, "count"))
    {
      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v7, "count");
        -[EDMessageQueryHelper query](self, "query");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v34 = self;
        v35 = 1024;
        *(_DWORD *)v36 = v20;
        *(_WORD *)&v36[4] = 2112;
        *(_QWORD *)&v36[6] = v21;
        _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "%p: Deleting %u filtered messages: %@", buf, 0x1Cu);

      }
      -[EDMessageQueryHelper scheduler](self, "scheduler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke_48;
      v25[3] = &unk_1E949B6D0;
      v25[4] = self;
      v26 = v7;
      objc_msgSend(v22, "performBlock:", v25);

    }
  }

}

uint64_t __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __85__EDMessageQueryHelper__persistenceDidDeleteMessages_includeMessagesWithDeletedFlag___block_invoke_48(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelper:didDeleteMessages:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)persistenceWillChangeConversationID:(int64_t)a3 messages:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v6 = a4;
  -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v15, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDMessageQueryHelper pendingConversationIDChangesKey](self, "pendingConversationIDChangesKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v12);
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v7, v14, 0);

      -[EDMessageQueryHelper pendingConversationIDChangesKey](self, "pendingConversationIDChangesKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v12);
    }

  }
}

- (void)persistenceIsChangingConversationID:(int64_t)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;
  void *v8;
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
  _QWORD v19[4];
  id v20;
  EDMessageQueryHelper *v21;
  id v22;
  int64_t v23;

  v7 = a4;
  -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper pendingConversationIDChangesKey](self, "pendingConversationIDChangesKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v8, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") || objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v16);

    if (!objc_msgSend(v12, "count"))
    {
      -[EDMessageQueryHelper pendingConversationIDChangesKey](self, "pendingConversationIDChangesKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v17);

    }
    -[EDMessageQueryHelper scheduler](self, "scheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __86__EDMessageQueryHelper_persistenceIsChangingConversationID_messages_generationWindow___block_invoke;
    v19[3] = &unk_1E949BB48;
    v20 = v15;
    v21 = self;
    v23 = a3;
    v22 = v14;
    objc_msgSend(v18, "performBlock:", v19);

  }
}

void __86__EDMessageQueryHelper_persistenceIsChangingConversationID_messages_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryHelper:conversationIDDidChangeForMessages:fromConversationID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 != objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "ef_removeObjectsInArray:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "allObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "queryHelper:didDeleteMessages:", v4, v5);

    }
  }
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int64_t v27;
  size_t v28;
  id v29;
  uint8_t buf[648];
  int v31[2];
  int v32;
  pid_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if ((objc_msgSend(v9, "isJournaled") & 1) == 0)
  {
    v29 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v10, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "globalMessageID");
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = a3;
        *(_WORD *)&buf[32] = 2048;
        *(_QWORD *)&buf[34] = v15;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Updating global message id for message: %{public}@ oldGlobalMessageID %llu newGlobalMessageID %llu", buf, 0x2Au);

      }
      v16 = objc_alloc(MEMORY[0x1E0D1E258]);
      objc_msgSend(v12, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mailboxScope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithGlobalMessageID:mailboxScope:", a3, v18);

      objc_msgSend(v12, "objectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v20, "isEqual:", v19);

      if ((v16 & 1) != 0)
      {
        +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "itemID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v12;
          *(_WORD *)&buf[32] = 2112;
          *(_QWORD *)&buf[34] = v19;
          _os_log_debug_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", buf, 0x2Au);

        }
        memset(buf, 170, sizeof(buf));
        *(_DWORD *)&buf[32] = 0;
        *(_QWORD *)v31 = 0xE00000001;
        v32 = 1;
        v33 = getpid();
        v28 = 648;
        if (!sysctl(v31, 4u, buf, &v28, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
        {
          __debugbreak();
          JUMPOUT(0x1D3004B08);
        }
      }
      else
      {
        -[EDMessageQueryHelper scheduler](self, "scheduler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __102__EDMessageQueryHelper_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke;
        v24[3] = &unk_1E949BB48;
        v24[4] = self;
        v25 = v12;
        v26 = v19;
        v27 = a4;
        objc_msgSend(v22, "performBlock:", v24);

      }
    }

  }
}

void __102__EDMessageQueryHelper_persistenceDidChangeGlobalMessageID_orConversationID_message_generationWindow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelper:objectIDDidChangeForMessage:oldObjectID:oldConversationID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isJournaled") & 1) == 0)
  {
    -[EDMessageQueryHelper query](self, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "queryOptions");

    if ((v10 & 4) == 0)
    {
      v19[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageQueryHelper _transformAndFilterMessages:includeDeleted:removeIgnoredMessages:](self, "_transformAndFilterMessages:includeDeleted:removeIgnoredMessages:", v11, 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        -[EDMessageQueryHelper scheduler](self, "scheduler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke;
        v14[3] = &unk_1E949E918;
        objc_copyWeak(&v17, &location);
        v15 = v7;
        v16 = v12;
        objc_msgSend(v13, "performBlock:", v14);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }

    }
  }

}

void __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCanceled");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_compactMap:", &__block_literal_global_53);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v10 = 134218498;
          v11 = v3;
          v12 = 2112;
          v13 = v9;
          v14 = 2112;
          v15 = v6;
          _os_log_debug_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEBUG, "%p: persistenceDidUpdateProperties %@\nkeyPaths %@", (uint8_t *)&v10, 0x20u);
        }

        objc_msgSend(v3, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "queryHelper:didUpdateMessages:forKeyPaths:", v3, *(_QWORD *)(a1 + 40), v6);

      }
    }
  }

}

id __80__EDMessageQueryHelper_persistenceDidUpdateProperties_message_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id *v3;
  id v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D1E648]) & 1) != 0)
  {
    v3 = (id *)MEMORY[0x1E0D1DE70];
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D1E650]) & 1) != 0)
  {
    v3 = (id *)MEMORY[0x1E0D1DE78];
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("GeneratedSummary")) & 1) != 0)
  {
    v3 = (id *)MEMORY[0x1E0D1DDA0];
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D1E640]))
    {
      v4 = 0;
      goto LABEL_10;
    }
    v3 = (id *)MEMORY[0x1E0D1DDC0];
  }
  v4 = *v3;
LABEL_10:

  return v4;
}

- (void)persistenceWillUpdateDisplayDateForMessages:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transformAndFilterMessages:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper pendingDisplayDateChangesKey](self, "pendingDisplayDateChangesKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDMessageQueryHelper pendingDisplayDateChangesKey](self, "pendingDisplayDateChangesKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x1E0D1DD68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHelper _reportChangesForPersistedMessages:withPendingChangesKey:keyPaths:](self, "_reportChangesForPersistedMessages:withPendingChangesKey:keyPaths:", v6, v7, v8);

}

- (void)_reportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 keyPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDMessageQueryHelper _unjournaledMessagesForMessages:](self, "_unjournaledMessagesForMessages:", v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transformAndFilterMessages:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "threadDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v9);
  -[EDMessageQueryHelper _reportChangesForCurrentlyMatchingMessages:previouslyMatchingMessages:keyPaths:](self, "_reportChangesForCurrentlyMatchingMessages:previouslyMatchingMessages:keyPaths:", v12, v15, v10);

}

- (void)_reportChangesForCurrentlyMatchingMessages:(id)a3 previouslyMatchingMessages:(id)a4 keyPaths:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t aBlock;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  EDMessageQueryHelper *v29;
  id v30;
  id v31;
  NSObject *v32;
  uint8_t buf[4];
  EDMessageQueryHelper *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v9 = a4;
  v10 = a5;
  -[EDMessageQueryHelper query](self, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "queryOptions");

  if ((v12 & 0x20) != 0)
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", buf, 2u);
    }
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v23);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "intersectSet:", v14);
    objc_msgSend(v13, "minusSet:", v15);
    objc_msgSend(v14, "minusSet:", v15);
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v34 = self;
      v35 = 2114;
      v36 = v17;
      v37 = 2114;
      v38 = v10;
      v39 = 2048;
      v40 = objc_msgSend(v14, "count");
      v41 = 2048;
      v42 = objc_msgSend(v13, "count");
      v43 = 2048;
      v44 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ - schedule changes for keyPaths:%{public}@ removed=%lu added=%lu changed=%lu", buf, 0x3Eu);

    }
    aBlock = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __103__EDMessageQueryHelper__reportChangesForCurrentlyMatchingMessages_previouslyMatchingMessages_keyPaths___block_invoke;
    v27 = &unk_1E949C5E8;
    v18 = v14;
    v28 = v18;
    v29 = self;
    v19 = v15;
    v30 = v19;
    v31 = v10;
    v20 = v13;
    v32 = v20;
    v21 = _Block_copy(&aBlock);
    if (-[NSObject count](v20, "count")
      && -[EDMessageQueryHelper addMessagesSynchronously](self, "addMessagesSynchronously"))
    {
      -[EDMessageQueryHelper scheduler](self, "scheduler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performSyncBlock:", v21);
    }
    else
    {
      -[EDMessageQueryHelper scheduler](self, "scheduler", v23, aBlock, v25, v26, v27, v28, v29, v30, v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performBlock:", v21);
    }

  }
}

void __103__EDMessageQueryHelper__reportChangesForCurrentlyMatchingMessages_previouslyMatchingMessages_keyPaths___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryHelper:didDeleteMessages:", v2, v3);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryHelper:didUpdateMessages:forKeyPaths:", v4, v5, *(_QWORD *)(a1 + 56));

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 64), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryHelper:didAddMessages:", v6, v7);

  }
}

- (id)_persistedMessagesFromSendersWithAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageQueryHelper query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesWithSenders:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3528]);
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithType:subpredicates:", 1, v9);

  v11 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v12 = objc_msgSend(v5, "targetClass");
  v13 = objc_msgSend(v5, "queryOptions");
  objc_msgSend(v5, "targetClassOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithTargetClass:predicate:sortDescriptors:limit:queryOptions:targetClassOptions:label:", v12, v10, MEMORY[0x1E0C9AA60], 0, v13, v14, 0);

  -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistedMessagesMatchingQuery:limit:", v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_calculateAndReportChangesForPersistedMessages:(id)a3 withPendingChangesKey:(id)a4 changeBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  int v25;
  int v26;
  char v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(void *, uint64_t, _QWORD, uint64_t);
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  EDMessageQueryHelper *v52;
  void *v53;
  id v54;
  void *v55;
  void (**v56)(void *, uint64_t, _QWORD, uint64_t);
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  EDMessageQueryHelper *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _QWORD aBlock[4];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a4;
  v45 = v8;
  v46 = a5;
  v52 = self;
  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformMessages:", v8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  objc_msgSend(v10, "filterMessages:unmatchedMessages:", v51, &v93);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v93;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "threadDictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "objectForKeyedSubscript:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", 0, v49);
  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v12 = v48;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v90 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v16, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v13);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke;
  aBlock[3] = &unk_1E949E940;
  v44 = v58;
  v88 = v44;
  v56 = (void (**)(void *, uint64_t, _QWORD, uint64_t))_Block_copy(aBlock);
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__18;
  v85 = __Block_byref_object_dispose__18;
  v86 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__18;
  v79 = __Block_byref_object_dispose__18;
  v80 = 0;
  if (objc_msgSend(v12, "count") || objc_msgSend(v57, "count"))
  {
    v55 = (void *)objc_opt_new();
    -[EDMessageQueryHelper ignoreMessagesPredicate](self, "ignoreMessagesPredicate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v72 = 0u;
    v71 = 0u;
    v18 = v51;
    v19 = 0;
    v20 = 0;
    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v72 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
          v25 = objc_msgSend(v12, "containsObject:", v24);
          v26 = objc_msgSend(v57, "containsObject:", v24);
          v27 = v26;
          if (v25)
          {
            v28 = v82[5];
            if (!v28)
            {
              v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v30 = (void *)v82[5];
              v82[5] = (uint64_t)v29;

              v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v32 = (void *)v76[5];
              v76[5] = (uint64_t)v31;

              v28 = v82[5];
            }
            v56[2](v56, v28, v76[5], v24);
            if ((v27 & 1) == 0)
              objc_msgSend(v55, "addObject:", v24);
          }
          else if (v26)
          {
            if (objc_msgSend(v53, "evaluateWithObject:", v24))
            {
              v33 = v20;
              if (!v20)
                v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v20 = v33;
              objc_msgSend(v33, "addObject:", v24);
            }
            else
            {
              v34 = v19;
              if (!v19)
                v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v19 = v34;
              objc_msgSend(v34, "addObject:", v24);
            }
          }
        }
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
      }
      while (v21);
    }

  }
  else
  {
    v19 = 0;
    v55 = 0;
    v20 = 0;
  }
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_58;
  v59[3] = &unk_1E949E990;
  v35 = v12;
  v60 = v35;
  v54 = v57;
  v61 = v54;
  v36 = v55;
  v62 = v36;
  v63 = v52;
  v37 = v19;
  v64 = v37;
  v69 = &v81;
  v70 = &v75;
  v38 = v56;
  v67 = v38;
  v39 = v20;
  v65 = v39;
  v40 = v47;
  v66 = v40;
  v41 = v46;
  v68 = v41;
  v42 = _Block_copy(v59);
  if (objc_msgSend(v37, "count") && -[EDMessageQueryHelper addMessagesSynchronously](v52, "addMessagesSynchronously"))
  {
    -[EDMessageQueryHelper scheduler](v52, "scheduler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "performSyncBlock:", v42);
  }
  else
  {
    -[EDMessageQueryHelper scheduler](v52, "scheduler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "performBlock:", v42);
  }

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "addObject:", v8);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "addObject:", v11);
  }
  else
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_cold_1(v13, v14, v12);
    }

  }
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_58(uint64_t a1)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 56) + 32);
      os_unfair_lock_lock(v2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "unionSet:", *(_QWORD *)(a1 + 48));
      os_unfair_lock_unlock(v2);
    }
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 56) + 32);
      os_unfair_lock_lock(v3);
      v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_2;
      v26[3] = &unk_1E949E968;
      v5 = *(void **)(a1 + 64);
      v26[4] = *(_QWORD *)(a1 + 56);
      v29 = *(_OWORD *)(a1 + 104);
      v28 = *(id *)(a1 + 88);
      v6 = v4;
      v27 = v6;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v26);
      objc_msgSend(*(id *)(a1 + 64), "removeObjectsAtIndexes:", v6);

      os_unfair_lock_unlock(v3);
    }
    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 56) + 36);
      os_unfair_lock_lock(v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "unionSet:", *(_QWORD *)(a1 + 72));
LABEL_9:
      os_unfair_lock_unlock(v7);
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 56) + 32);
    os_unfair_lock_lock(v7);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = *(id *)(a1 + 80);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)))
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v16 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
              v17 = *(void **)(v16 + 40);
              *(_QWORD *)(v16 + 40) = v15;

              v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v19 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
              v20 = *(void **)(v19 + 40);
              *(_QWORD *)(v19 + 40) = v18;

            }
            (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v12);
    }

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 56), "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "queryOptions") & 0x20) == 0;

  if (!v9)
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Skip updating the message list update for a Spotlight query result.", v21, 2u);
    }
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject queryHelper:didAddMessages:](v10, "queryHelper:didAddMessages:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_17:

  }
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }

}

- (void)remoteSearchDidFinish
{
  void *v3;
  _QWORD v4[5];

  -[EDMessageQueryHelper scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__EDMessageQueryHelper_remoteSearchDidFinish__block_invoke;
  v4[3] = &unk_1E949AEB8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __45__EDMessageQueryHelper_remoteSearchDidFinish__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryHelperDidFinishRemoteSearch:", *(_QWORD *)(a1 + 32));

}

- (void)remoteSearchDidFindMessages:(id)a3
{
  -[EDMessageQueryHelper _foundMessages:inRemoteSearch:](self, "_foundMessages:inRemoteSearch:", a3, 1);
}

- (void)controller:(id)a3 messageTimerFired:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[EDMessageQueryHelper updateDisplayDate](self, "updateDisplayDate"))
  {
    -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transformAndFilterMessages:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[EDMessageQueryHelper messagePersistence](self, "messagePersistence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateBeforeDisplayForPersistedMessages:", v11);

    }
  }

}

- (id)_transformAndFilterMessages:(id)a3 includeDeleted:(BOOL)a4 removeIgnoredMessages:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  uint8_t buf[4];
  EDMessageQueryHelper *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a5;
  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[EDMessageQueryHelper queryEvaluator](self, "queryEvaluator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformMessages:includeDeleted:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v9, "filterMessages:unmatchedMessages:", v10, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  if (objc_msgSend(v12, "count"))
  {
    +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v28 = self;
      v29 = 2112;
      v30 = (uint64_t)v8;
      v31 = 2112;
      v32 = (uint64_t)v12;
      _os_log_debug_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEBUG, "%p: messages %@, unmatched %@", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_noLongerMatchingMessagesLock);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke;
    v24[3] = &unk_1E949B4A0;
    v24[4] = self;
    objc_msgSend(v12, "ef_filter:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_noLongerMatchingMessagesLock);
    if (objc_msgSend(v14, "count"))
    {
      v26[0] = v11;
      v26[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ef_flatten");
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }

  }
  if (v5)
  {
    os_unfair_lock_lock(&self->_ignoredMessagesLock);
    if (-[NSMutableSet count](self->_ignoredMessages, "count"))
    {
      v17 = objc_msgSend(v11, "count");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke_2;
      v23[3] = &unk_1E949B4A0;
      v23[4] = self;
      objc_msgSend(v11, "ef_filter:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 134218496;
        v28 = self;
        v29 = 2048;
        v30 = v17;
        v31 = 2048;
        v32 = v20;
        _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "%p: Filtered ignored messages - before=%lu, after=%lu", buf, 0x20u);
      }

      v11 = v18;
    }
    else
    {
      +[EDMessageQueryHelper log](EDMessageQueryHelper, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v28 = self;
        _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_INFO, "%p: No messages to ignore", buf, 0xCu);
      }

    }
    os_unfair_lock_unlock(&self->_ignoredMessagesLock);
  }

  return v11;
}

uint64_t __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", a2);
}

uint64_t __89__EDMessageQueryHelper__transformAndFilterMessages_includeDeleted_removeIgnoredMessages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", a2) ^ 1;
}

- (EMQuery)query
{
  return self->_query;
}

- (int64_t)initialBatchSize
{
  return self->_initialBatchSize;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (EDMessageQueryHelperDelegate)delegate
{
  return (EDMessageQueryHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (EDMessageQueryEvaluator)queryEvaluator
{
  return self->_queryEvaluator;
}

- (BOOL)shouldReconcileJournal
{
  return self->_shouldReconcileJournal;
}

- (BOOL)keepMessagesInListOnBucketChange
{
  return self->_keepMessagesInListOnBucketChange;
}

- (NSPredicate)ignoreMessagesPredicate
{
  return self->_ignoreMessagesPredicate;
}

- (BOOL)addMessagesSynchronously
{
  return self->_addMessagesSynchronously;
}

- (EFPromise)initialResultsPromise
{
  return self->_initialResultsPromise;
}

- (NSString)pendingFlagChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)pendingConversationIDChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)pendingReadLaterDateChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)pendingDisplayDateChangesKey
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (EFCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancelationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_pendingDisplayDateChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingReadLaterDateChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingConversationIDChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingFlagChangesKey, 0);
  objc_storeStrong((id *)&self->_initialResultsPromise, 0);
  objc_storeStrong((id *)&self->_ignoreMessagesPredicate, 0);
  objc_storeStrong((id *)&self->_queryEvaluator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_ignoredMessages, 0);
  objc_storeStrong((id *)&self->_noLongerMatchingMessages, 0);
}

- (void)persistenceDidDeleteAllMessagesInMailboxesWithURLs:(uint8_t *)buf generationWindow:(os_log_t)log .cold.1(uint64_t a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "%p: Did delete all messages in %u mailbox(es). Requesting restart.", buf, 0x12u);
}

void __105__EDMessageQueryHelper__calculateAndReportChangesForPersistedMessages_withPendingChangesKey_changeBlock___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Unable to find previous message: %{public}@", buf, 0xCu);

}

@end
