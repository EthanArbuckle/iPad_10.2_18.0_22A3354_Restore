@implementation EDMessageQueryHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EDMessageQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_53 != -1)
    dispatch_once(&log_onceToken_53, block);
  return (OS_os_log *)(id)log_log_53;
}

void __28__EDMessageQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_53;
  log_log_53 = (uint64_t)v1;

}

- (EDMessageQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 remindMeNotificationController:(id)a6 searchProvider:(id)a7 observer:(id)a8 observationIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  EDMessageQueryHandler *v21;
  EDMessageQueryHandler *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  EFScheduler *scheduler;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *contentProtectionQueue;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *resultQueue;
  id v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  EMCollectionItemIDStateCapturer *stateCapturer;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  objc_super v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v47 = a7;
  v19 = a8;
  v20 = a9;
  v48.receiver = self;
  v48.super_class = (Class)EDMessageQueryHandler;
  v46 = v15;
  v21 = -[EDMessageRepositoryQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:](&v48, sel_initWithQuery_messagePersistence_hookRegistry_remindMeNotificationController_observer_observationIdentifier_, v15, v16, v17, v18, v19, v20);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_searchProvider, a7);
    v23 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.%p"), objc_opt_class(), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serialDispatchQueueSchedulerWithName:qualityOfService:", v24, 25);
    v25 = objc_claimAutoreleasedReturnValue();
    scheduler = v22->_scheduler;
    v22->_scheduler = (EFScheduler *)v25;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("com.apple.email.EDMessageQueryHandler.contentProtection", v27);
    contentProtectionQueue = v22->_contentProtectionQueue;
    v22->_contentProtectionQueue = (OS_dispatch_queue *)v28;

    dispatch_queue_set_specific((dispatch_queue_t)v22->_contentProtectionQueue, &kContentProtectionQueueKey_0, v22, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("com.apple.email.EDMessageQueryHandler.result", v30);
    resultQueue = v22->_resultQueue;
    v22->_resultQueue = (OS_dispatch_queue *)v31;

    v33 = objc_alloc(MEMORY[0x1E0D1E120]);
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v33, "initWithTitle:delegate:", v35, v22);
    stateCapturer = v22->_stateCapturer;
    v22->_stateCapturer = (EMCollectionItemIDStateCapturer *)v36;

    v38 = (void *)MEMORY[0x1E0D1E248];
    -[EDMessageRepositoryQueryHandler query](v22, "query");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "predicate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "predicateFromPredicate:ignoringKeyPaths:", v40, MEMORY[0x1E0C9AA60]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)MEMORY[0x1E0D1E248];
    v49[0] = *MEMORY[0x1E0D1DDB8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "predicateFromPredicate:ignoringKeyPaths:", v41, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v41, "isEqual:", v44) & 1) == 0)
      v22->_hasUrgentPredicate = 1;

  }
  return v22;
}

- (BOOL)start
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  objc_super v11;
  objc_super v12;
  uint8_t buf[4];
  EDMessageQueryHandler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)EDMessageQueryHandler;
  v3 = -[EDMessageRepositoryQueryHandler start](&v12, sel_start);
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: Starting with query '%@'", buf, 0x16u);

    }
    v11.receiver = self;
    v11.super_class = (Class)EDMessageQueryHandler;
    -[EDMessageRepositoryQueryHandler start](&v11, sel_start);
    -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__EDMessageQueryHandler_start__block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(v7, block);

    -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    EFRegisterContentProtectionObserver();

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v14 = self;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: Ignoring subsequent call to -start.", buf, 0xCu);
    }

  }
  return v3;
}

uint64_t __30__EDMessageQueryHandler_start__block_invoke(uint64_t a1)
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
  void *v5;
  _QWORD aBlock[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDMessageQueryHandler;
  -[EDMessageRepositoryQueryHandler cancel](&v7, sel_cancel);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__EDMessageQueryHandler_cancel__block_invoke;
  aBlock[3] = &unk_1E949AEB8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific(&kContentProtectionQueueKey_0))
  {
    v3[2](v3);
  }
  else
  {
    -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, v3);

  }
  EFAtomicObjectRelease();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

}

void __31__EDMessageQueryHandler_cancel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setDidCancel:", 1);
  objc_msgSend(*(id *)(a1 + 32), "currentQueryHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)dealloc
{
  objc_super v3;

  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDMessageQueryHandler;
  -[EDMessageRepositoryQueryHandler dealloc](&v3, sel_dealloc);
}

- (void)_restartHelper
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  EDMessageQueryHandler *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218240;
    v7 = self;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "%p: (Re-)starting the helper (old = %p).", (uint8_t *)&v6, 0x16u);

  }
  -[EDMessageQueryHandler _createHelper](self, "_createHelper");
}

- (void)_createHelper
{
  NSObject *v3;
  void *v4;
  EDMessageQueryHelper *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EDMessageQueryHelper *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSMutableDictionary *oldestMessageIDsByMailboxObjectIDs;
  void *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  id location;
  uint8_t buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [EDMessageQueryHelper alloc];
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler hookRegistry](self, "hookRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHandler searchProvider](self, "searchProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHandler scheduler](self, "scheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler remindMeNotificationController](self, "remindMeNotificationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)((char *)&v22 + 1) = 1;
  LOBYTE(v22) = !-[EDMessageQueryHandler hasEverReconciledJournal](self, "hasEverReconciledJournal");
  v13 = -[EDMessageQueryHelper initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:](v5, "initWithQuery:initialBatchSize:maximumBatchSize:messagePersistence:hookRegistry:searchProvider:scheduler:remindMeNotificationController:delegate:shouldReconcileJournal:shouldAddMessagesSynchronously:keepMessagesInListOnBucketChange:", v7, 100, 15000, v8, v9, v10, v11, v12, self, v22);
  -[EDMessageQueryHandler setCurrentQueryHelper:](self, "setCurrentQueryHelper:", v13);

  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDInMemoryThreadQueryHandler _createHelper].cold.1((uint64_t)self, v15, buf, v14);
  }

  if (v4)
  {
    -[EDMessageQueryHandler setDidFindRequestedItemForInitialBatch:](self, "setDidFindRequestedItemForInitialBatch:", 0);
    -[EDMessageQueryHandler setIsInitialized:](self, "setIsInitialized:", 0);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    -[EDMessageRepositoryQueryHandler resultsObserver](self, "resultsObserver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v16);

    -[EDMessageRepositoryQueryHandler observationIdentifier](self, "observationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__EDMessageQueryHandler__createHelper__block_invoke;
    block[3] = &unk_1E949AD60;
    objc_copyWeak(&v25, &location);
    v24 = v17;
    v19 = v17;
    dispatch_async(v18, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  oldestMessageIDsByMailboxObjectIDs = self->_oldestMessageIDsByMailboxObjectIDs;
  self->_oldestMessageIDsByMailboxObjectIDs = 0;

  -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");

}

void __38__EDMessageQueryHandler__createHelper__block_invoke(uint64_t a1)
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
  EDMessageQueryHandler *v10;
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
  -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EDMessageQueryHandler__queryHelperIsCurrent___block_invoke;
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

void __47__EDMessageQueryHandler__queryHelperIsCurrent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentQueryHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 == v3;

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
      -[EDMessageQueryHandler _contentProtectionChangedToUnlocked](self, "_contentProtectionChangedToUnlocked", 0, a4);
  }
  else
  {
    -[EDMessageQueryHandler _contentProtectionChangedToLocked](self, "_contentProtectionChangedToLocked");
  }
}

- (void)_contentProtectionChangedToLocked
{
  void *v3;
  NSObject *v4;
  id v5;

  -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!-[EDMessageQueryHandler isInitialized](self, "isInitialized"))
  {
    -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryHandler setCurrentQueryHelper:](self, "setCurrentQueryHelper:", 0);
    EFAtomicObjectRelease();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");
    objc_msgSend(v5, "cancel");

  }
}

- (void)_contentProtectionChangedToUnlocked
{
  NSObject *v3;

  -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[EDMessageQueryHandler didCancel](self, "didCancel")
    && !-[EDMessageQueryHandler isInitialized](self, "isInitialized"))
  {
    -[EDMessageQueryHandler _restartHelper](self, "_restartHelper");
  }
}

- (id)_objectIDsAndUnreadObjectIDsFromMessages:(id)a3 unreadObjectIDs:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v16;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v11, "flags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "read");

        if ((v14 & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (id)_requestedItemObjectID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[EDMessageRepositoryQueryHandler query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetClassOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DEB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)_messagesForInitialBatchWithMessagesFromQueryHelper:(id)a3 requestedMessage:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDMessageQueryHandler _requestedItemObjectID](self, "_requestedItemObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __94__EDMessageQueryHandler__messagesForInitialBatchWithMessagesFromQueryHelper_requestedMessage___block_invoke;
    v17[3] = &unk_1E949B4A0;
    v9 = v7;
    v18 = v9;
    objc_msgSend(v6, "ef_firstObjectPassingTest:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[EDMessageQueryHandler setDidFindRequestedItemForInitialBatch:](self, "setDidFindRequestedItemForInitialBatch:", 1);
      v11 = v6;
    }
    else
    {
      -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messagesForMessageObjectIDs:missedMessageObjectIDs:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v11, "addObject:", v10);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v12 = v11;

  }
  else
  {
    -[EDMessageQueryHandler setDidFindRequestedItemForInitialBatch:](self, "setDidFindRequestedItemForInitialBatch:", 1);
    if (a4)
      *a4 = 0;
    v12 = v6;
  }

  return v12;
}

uint64_t __94__EDMessageQueryHandler__messagesForInitialBatchWithMessagesFromQueryHelper_requestedMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_messagesBeforeMessageWithObjectID:(id)a3 fromMessagesFromQueryHelper:(id)a4 afterRequestedMessage:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __110__EDMessageQueryHandler__messagesBeforeMessageWithObjectID_fromMessagesFromQueryHelper_afterRequestedMessage___block_invoke;
  v14[3] = &unk_1E949E640;
  v9 = v7;
  v15 = v9;
  v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", v14);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
      *a5 = 0;
    v11 = v8;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(v8, "ef_suffix:", objc_msgSend(v8, "count") + ~v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "ef_prefix:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

uint64_t __110__EDMessageQueryHandler__messagesBeforeMessageWithObjectID_fromMessagesFromQueryHelper_afterRequestedMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_extraInfoForMessages:(id)a3 messagesToPrecache:(id)a4 outObjectIDs:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  -[EDMessageQueryHandler _objectIDsAndUnreadObjectIDsFromMessages:unreadObjectIDs:](self, "_objectIDsAndUnreadObjectIDsFromMessages:unreadObjectIDs:", v8, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1DCF0]);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D1DCF8]);
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v13;
}

- (void)queryHelper:(id)a3 didFindMessages:(id)a4 forInitialBatch:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v5 = a5;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v8))
  {
    if (v5)
    {
      v15 = 0;
      -[EDMessageQueryHandler _messagesForInitialBatchWithMessagesFromQueryHelper:requestedMessage:](self, "_messagesForInitialBatchWithMessagesFromQueryHelper:requestedMessage:", v9, &v15);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (v11)
      {
        v16[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      -[EDMessageQueryHandler _reportFoundMessages:before:messagesToPrecache:](self, "_reportFoundMessages:before:messagesToPrecache:", v10, 0, v12);
      v9 = (id)v10;
LABEL_13:

      goto LABEL_14;
    }
    if (!-[EDMessageQueryHandler didFindRequestedItemForInitialBatch](self, "didFindRequestedItemForInitialBatch"))
    {
      -[EDMessageQueryHandler _requestedItemObjectID](self, "_requestedItemObjectID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      -[EDMessageQueryHandler _messagesBeforeMessageWithObjectID:fromMessagesFromQueryHelper:afterRequestedMessage:](self, "_messagesBeforeMessageWithObjectID:fromMessagesFromQueryHelper:afterRequestedMessage:", v11, v9, &v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;

      v9 = v13;
      if (objc_msgSend(v13, "count"))
        -[EDMessageQueryHandler _reportFoundMessages:before:messagesToPrecache:](self, "_reportFoundMessages:before:messagesToPrecache:", v13, v11, 0);
      if (objc_msgSend(v12, "count"))
      {
        -[EDMessageQueryHandler _reportFoundMessages:before:messagesToPrecache:](self, "_reportFoundMessages:before:messagesToPrecache:", v12, 0, 0);
        -[EDMessageQueryHandler setDidFindRequestedItemForInitialBatch:](self, "setDidFindRequestedItemForInitialBatch:", 1);
      }
      goto LABEL_13;
    }
    -[EDMessageQueryHandler _reportFoundMessages:before:messagesToPrecache:](self, "_reportFoundMessages:before:messagesToPrecache:", v9, 0, 0);
  }
LABEL_14:

}

- (void)_reportFoundMessages:(id)a3 before:(id)a4 messagesToPrecache:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  EDMessageQueryHandler *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v24 = v8;
  v25 = a5;
  -[EDMessageQueryHandler _extraInfoForMessages:messagesToPrecache:outObjectIDs:](self, "_extraInfoForMessages:messagesToPrecache:outObjectIDs:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;
  v12 = -[NSObject count](v11, "count");
  if (v12 > 0xA)
  {
    -[NSObject ef_prefix:](v11, "ef_prefix:", 5);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject ef_suffix:](v11, "ef_suffix:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v32 = self;
      v33 = 2048;
      v34 = v12;
      v35 = 2114;
      v36 = v13;
      v37 = 2114;
      v38 = v15;
      v39 = 2114;
      v40 = v17;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Found %lu objectIDs starting with: %{public}@\nending with:\n%{public}@\n%{public}@", buf, 0x34u);

    }
  }
  else
  {
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v32 = self;
      v33 = 2048;
      v34 = v12;
      v35 = 2114;
      v36 = v11;
      v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Found %lu objectIDs: %{public}@\n%{public}@", buf, 0x2Au);

    }
  }

  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler _distinctObjectIDs:queryHandlerLog:](self, "_distinctObjectIDs:queryHandlerLog:", v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageQueryHandler resultQueue](self, "resultQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__EDMessageQueryHandler__reportFoundMessages_before_messagesToPrecache___block_invoke;
  block[3] = &unk_1E949B680;
  block[4] = self;
  v27 = v19;
  v28 = v9;
  v29 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v19;
  dispatch_sync(v20, block);

}

void __72__EDMessageQueryHandler__reportFoundMessages_before_messagesToPrecache___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedAddedObjectIDs:before:extraInfo:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)queryHelperDidFindAllMessages:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  EDMessageQueryHandler *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v4))
  {
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load\n%{public}@", buf, 0x16u);

    }
    -[EDMessageQueryHandler setIsInitialized:](self, "setIsInitialized:", 1);
    -[EDMessageQueryHandler setHasEverReconciledJournal:](self, "setHasEverReconciledJournal:", 1);
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__EDMessageQueryHandler_queryHelperDidFindAllMessages___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_sync(v7, block);

    -[EDMessageQueryHandler _initializeOldestMessagesByMailbox](self, "_initializeOldestMessagesByMailbox");
  }

}

void __55__EDMessageQueryHandler_queryHelperDidFindAllMessages___block_invoke(uint64_t a1)
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
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  EDMessageQueryHandler *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v6))
  {
    -[EDMessageQueryHandler findMessagesByPreviousObjectIDForAddedMessages:helper:](self, "findMessagesByPreviousObjectIDForAddedMessages:helper:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v12 = self;
      v13 = 1024;
      v14 = objc_msgSend(v7, "count");
      v15 = 1024;
      v16 = objc_msgSend(v8, "count");
      _os_log_debug_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEBUG, "%p: Did add %u messages. %u groups.", buf, 0x18u);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke;
    v10[3] = &unk_1E949E668;
    v10[4] = self;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
    -[EDMessageQueryHandler _oldestMessagesNeedUpdate](self, "_oldestMessagesNeedUpdate");

  }
}

void __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v30 = 0;
  v25 = v6;
  objc_msgSend(v7, "_objectIDsAndUnreadObjectIDsFromMessages:unreadObjectIDs:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;
  v10 = v9;
  if (v9)
  {
    v39 = *MEMORY[0x1E0D1DCF0];
    v40[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v32 = v13;
    v33 = 2114;
    v34 = v8;
    v35 = 2114;
    v36 = v5;
    v37 = 2114;
    v38 = v14;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%p: Adding objectIDs: %{public}@ before: %{public}@\n%{public}@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v5)
    v16 = 0;
  else
    v16 = v5;
  v17 = v16;

  v18 = *(void **)(a1 + 32);
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_distinctObjectIDs:queryHandlerLog:", v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "resultQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke_24;
  block[3] = &unk_1E949B680;
  block[4] = *(_QWORD *)(a1 + 32);
  v27 = v20;
  v28 = v17;
  v29 = v11;
  v22 = v11;
  v23 = v17;
  v24 = v20;
  dispatch_sync(v21, block);

}

void __52__EDMessageQueryHandler_queryHelper_didAddMessages___block_invoke_24(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedAddedObjectIDs:before:extraInfo:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)queryHelper:(id)a3 messageFlagsDidChangeForMessages:(id)a4 previousMessages:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  EDMessageQueryHandler *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", a3))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v21;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x1E0D1E240]);
          objc_msgSend(v12, "flags");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setFlags:", v14);

          objc_msgSend(v12, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v9);
    }

    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = self;
      v30 = 2114;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Changing flags for objectIDs: %{public}@\n%{public}@", buf, 0x20u);

    }
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__EDMessageQueryHandler_queryHelper_messageFlagsDidChangeForMessages_previousMessages___block_invoke;
    block[3] = &unk_1E949B6D0;
    block[4] = self;
    v23 = v7;
    v20 = v7;
    dispatch_sync(v19, block);

  }
}

void __87__EDMessageQueryHandler_queryHelper_messageFlagsDidChangeForMessages_previousMessages___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedChangesForObjectIDs:", v2, *(_QWORD *)(a1 + 40));

}

- (void)queryHelper:(id)a3 objectIDDidChangeForMessage:(id)a4 oldObjectID:(id)a5 oldConversationID:(int64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v12))
  {
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__EDMessageQueryHandler_queryHelper_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke;
    block[3] = &unk_1E949B390;
    block[4] = self;
    v14 = v10;
    v15 = v9;
    dispatch_sync(v11, block);

  }
}

void __95__EDMessageQueryHandler_queryHelper_objectIDDidChangeForMessage_oldObjectID_oldConversationID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observer:replacedExistingObjectID:withNewObjectID:", v2, v3, v4);

}

- (void)queryHelper:(id)a3 didUpdateMessages:(id)a4 forKeyPaths:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  EDMessageQueryHandler *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v9))
  {
    if (-[EDMessageQueryHandler hasUrgentPredicate](self, "hasUrgentPredicate")
      && objc_msgSend(v11, "containsObject:", *MEMORY[0x1E0D1DDA0]))
    {
      if ((objc_msgSend(v10, "ef_all:", &__block_literal_global_42) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageQueryHandler.m"), 428, CFSTR("Messages matched the urgent query without the urgent flag being set"));

      }
      -[EDMessageQueryHandler queryHelper:didAddMessages:](self, "queryHelper:didAddMessages:", v9, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1E240], "changesForKeyPaths:ofItems:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageRepositoryQueryHandler query](self, "query");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v25 = self;
        v26 = 2114;
        v27 = v11;
        v28 = 2114;
        v29 = v14;
        v30 = 2114;
        v31 = v15;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Changing key paths: %{public}@ for objectIDs: %{public}@\n%{public}@", buf, 0x2Au);

      }
      if (-[EDMessageRepositoryQueryHandler keyPathsAffectSorting:](self, "keyPathsAffectSorting:", v11))
      {
        -[EDMessageQueryHandler findMessagesByPreviousObjectIDForAddedMessages:helper:](self, "findMessagesByPreviousObjectIDForAddedMessages:helper:", v10, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      -[EDMessageQueryHandler resultQueue](self, "resultQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_32;
      block[3] = &unk_1E949B390;
      block[4] = self;
      v18 = v12;
      v22 = v18;
      v19 = v16;
      v23 = v19;
      dispatch_sync(v17, block);

      if (objc_msgSend(v19, "count"))
        -[EDMessageQueryHandler _oldestMessagesNeedUpdate](self, "_oldestMessagesNeedUpdate");

    }
  }

}

uint64_t __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "generatedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "urgent");

  return v3;
}

uint64_t __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:matchedChangesForObjectIDs:", v3, *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_2;
  v6[3] = &unk_1E949E668;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
}

void __67__EDMessageQueryHandler_queryHelper_didUpdateMessages_forKeyPaths___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218754;
    v17 = v9;
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Adding objectIDs: %{public}@ before: %{public}@\n%{public}@", (uint8_t *)&v16, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v5)
    v12 = 0;
  else
    v12 = v5;
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "observer:matchedMovedObjectIDs:before:extraInfo:", v15, v7, v13, 0);

}

- (void)queryHelper:(id)a3 didDeleteMessages:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  EDMessageQueryHandler *v16;
  id v17;
  uint8_t buf[4];
  EDMessageQueryHandler *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", a3))
  {
    objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v19 = self;
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Deleting objectIDs: %{public}@\n%{public}@", buf, 0x20u);

    }
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __55__EDMessageQueryHandler_queryHelper_didDeleteMessages___block_invoke;
    v15 = &unk_1E949B6D0;
    v16 = self;
    v11 = v7;
    v17 = v11;
    dispatch_sync(v10, &v12);

    -[EDMessageQueryHandler _oldestMessagesNeedUpdate](self, "_oldestMessagesNeedUpdate", v12, v13, v14, v15, v16);
  }

}

void __55__EDMessageQueryHandler_queryHelper_didDeleteMessages___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedDeletedObjectIDs:", v2, *(_QWORD *)(a1 + 40));

}

- (void)queryHelper:(id)a3 conversationIDDidChangeForMessages:(id)a4 fromConversationID:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  EDMessageQueryHandler *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", a3))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v21;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v13 = objc_alloc_init(MEMORY[0x1E0D1E240]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "conversationID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setConversationID:", v14);

          objc_msgSend(v12, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v9);
    }

    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = self;
      v30 = 2114;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "%p: Changing conversationID for objectIDs: %{public}@\n%{public}@", buf, 0x20u);

    }
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__EDMessageQueryHandler_queryHelper_conversationIDDidChangeForMessages_fromConversationID___block_invoke;
    block[3] = &unk_1E949B6D0;
    block[4] = self;
    v23 = v7;
    v20 = v7;
    dispatch_sync(v19, block);

  }
}

void __91__EDMessageQueryHandler_queryHelper_conversationIDDidChangeForMessages_fromConversationID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedChangesForObjectIDs:", v2, *(_QWORD *)(a1 + 40));

}

- (id)_createChangesForMessagesWithConversationID:(int64_t)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInConversation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHandler currentQueryHelper](self, "currentQueryHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesWithAdditionalPredicates:limit:", v9, 0x7FFFFFFFFFFFFFFFLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v6[2](v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectID", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v11;
}

- (void)queryHelper:(id)a3 conversationNotificationLevelDidChangeForConversation:(int64_t)a4 conversationID:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  EDMessageQueryHandler *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", a3))
  {
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke;
    v17[3] = &__block_descriptor_40_e30___EMMessageListItemChange_8__0l;
    v17[4] = a4;
    -[EDMessageQueryHandler _createChangesForMessagesWithConversationID:block:](self, "_createChangesForMessagesWithConversationID:block:", a5, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageRepositoryQueryHandler query](self, "query");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v19 = self;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p: Changing flags for objectIDs: %{public}@\n%{public}@", buf, 0x20u);

    }
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke_38;
    block[3] = &unk_1E949B6D0;
    block[4] = self;
    v16 = v9;
    v14 = v9;
    dispatch_sync(v13, block);

  }
}

id __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D1E240]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConversationNotificationLevel:", v3);

  return v2;
}

void __106__EDMessageQueryHandler_queryHelper_conversationNotificationLevelDidChangeForConversation_conversationID___block_invoke_38(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observer:matchedChangesForObjectIDs:", v2, *(_QWORD *)(a1 + 40));

}

- (void)queryHelperDidFinishRemoteSearch:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];

  v5 = a3;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:"))
  {
    -[EDMessageQueryHandler resultQueue](self, "resultQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__EDMessageQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_sync(v4, block);

  }
}

void __58__EDMessageQueryHandler_queryHelperDidFinishRemoteSearch___block_invoke(uint64_t a1)
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
  _QWORD block[5];

  v4 = a3;
  if (-[EDMessageQueryHandler _queryHelperIsCurrent:](self, "_queryHelperIsCurrent:", v4))
  {
    -[EDMessageQueryHandler contentProtectionQueue](self, "contentProtectionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__EDMessageQueryHandler_queryHelperNeedsRestart___block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

uint64_t __49__EDMessageQueryHandler_queryHelperNeedsRestart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartHelper");
}

- (void)_initializeOldestMessagesByMailbox
{
  void *v4;
  char v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *oldestMessageIDsByMailboxObjectIDs;
  void *v8;

  -[EDMessageRepositoryQueryHandler query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queryOptions");

  if ((v5 & 1) != 0)
  {
    if (self->_oldestMessageIDsByMailboxObjectIDs)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageQueryHandler.m"), 540, CFSTR("_oldestMessageIDsByMailboxObjectIDs should be only initialized once"));

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    oldestMessageIDsByMailboxObjectIDs = self->_oldestMessageIDsByMailboxObjectIDs;
    self->_oldestMessageIDsByMailboxObjectIDs = v6;

    -[EDMessageQueryHandler _oldestMessagesNeedUpdate](self, "_oldestMessagesNeedUpdate");
  }
}

- (void)_oldestMessagesNeedUpdate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  if (self->_oldestMessageIDsByMailboxObjectIDs)
  {
    EFAtomicObjectLoad();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");
    v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    EFAtomicObjectSetIfIdentical();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDMessageQueryHandler scheduler](self, "scheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__EDMessageQueryHandler__oldestMessagesNeedUpdate__block_invoke;
    v9[3] = &unk_1E949AD60;
    objc_copyWeak(&v11, &location);
    v7 = v5;
    v10 = v7;
    objc_msgSend(v6, "afterDelay:performBlock:", v9, 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCancelable:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __50__EDMessageQueryHandler__oldestMessagesNeedUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218240;
    v8 = WeakRetained;
    v9 = 1024;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "%p: Updating oldest messages for %u mailboxes", (uint8_t *)&v7, 0x12u);

  }
  objc_msgSend(WeakRetained, "mailboxes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateOldestMessagesForMailboxes:cancelationToken:", v5, *(_QWORD *)(a1 + 32));

  v6 = (id)EFAtomicObjectReleaseIfIdentical();
}

- (void)_updateOldestMessagesForMailboxes:(id)a3 cancelationToken:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  EDMessageQueryHandler *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v19 = 0;
    v21 = v7;
    v22 = *(_QWORD *)v25;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v22)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x1D824B334]();
      -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageQueryHandler _oldestItemQueryForMailbox:](self, "_oldestItemQueryForMailbox:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messagesMatchingQuery:limit:cancelationToken:", v12, 1, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v23, "isCanceled");
      if ((v15 & 1) == 0)
      {
        objc_msgSend(v14, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_oldestMessageIDsByMailboxObjectIDs, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 != v17 && (objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
        {
          +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v29 = self;
            v30 = 2112;
            v31 = v9;
            _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "%p: Updated oldest message for mailbox ID %@", buf, 0x16u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oldestMessageIDsByMailboxObjectIDs, "setObject:forKeyedSubscript:", v16, v9);
          v19 = 1;
        }

      }
      objc_autoreleasePoolPop(v10);
      if ((v15 & 1) != 0)
        break;
      if (v21 == ++v8)
      {
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v21)
          goto LABEL_3;
        break;
      }
    }

    if ((v19 & 1) != 0)
      -[EDMessageQueryHandler _oldestMessagesByMailboxObjectIDsWasUpdated](self, "_oldestMessagesByMailboxObjectIDsWasUpdated");
  }
  else
  {

  }
}

- (id)_oldestItemQueryForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithObjectID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "targetClass");
  v13 = (void *)MEMORY[0x1E0CB3528];
  v20[0] = v7;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v10, "initWithTargetClass:predicate:sortDescriptors:", v12, v15, v16);

  return v17;
}

- (void)_oldestMessagesByMailboxObjectIDsWasUpdated
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_DEBUG, "%p: Oldest messages updated", (uint8_t *)&v2, 0xCu);
}

void __68__EDMessageQueryHandler__oldestMessagesByMailboxObjectIDsWasUpdated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "resultsObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "oldestMessageIDsByMailboxObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observer:matchedOldestItemsUpdatedForMailboxes:", v2, v3);

}

- (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 helper:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  EFFetchSignpostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v15[0] = 67109120;
    v15[1] = objc_msgSend(v5, "count");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "QueryHelper FindMessagesByPreviousID", "count=%{signpost.description:attribute}u ", (uint8_t *)v15, 8u);
  }

  +[EDMessageQueryHandler findMessagesByPreviousObjectIDForAddedMessages:messageSource:](EDMessageQueryHandler, "findMessagesByPreviousObjectIDForAddedMessages:messageSource:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v12;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    LOWORD(v15[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v13, OS_SIGNPOST_INTERVAL_END, v8, "QueryHelper FindMessagesByPreviousID", ", (uint8_t *)v15, 2u);
  }

  return v11;
}

+ (id)findMessagesByPreviousObjectIDForAddedMessages:(id)a3 messageSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  int v39;
  int v40;
  id v41;
  void (**v42)(void *, void *, uint64_t);
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void (**v48)(void *, void *, uint64_t);
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v55)(void *, void *);
  void (**v56)(void *, void *);
  id v57;
  id obj;
  void (**v59)(void *, void *);
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  void (**v69)(void *, void *, uint64_t);
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[6];
  id v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  _QWORD v84[6];
  _QWORD v85[5];
  id v86;
  id v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  int v92;
  _QWORD aBlock[6];
  uint8_t buf[4];
  id v95;
  __int16 v96;
  _BYTE v97[30];
  _BYTE v98[128];
  void *v99;
  void *v100;
  _QWORD v101[4];

  v101[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v53 = v5;
  if (!objc_msgSend(v5, "count"))
  {
    v36 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_33;
  }
  v52 = v6;
  objc_msgSend(v6, "query");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sortDescriptors");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v60, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v37;
    v101[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  EFComparatorFromSortDescriptors();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sortedArrayWithOptions:usingComparator:", 16, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v8;
  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "key");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke;
  aBlock[3] = &unk_1E949E6B0;
  aBlock[4] = v47;
  v46 = (void *)v9;
  aBlock[5] = v9;
  v48 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  v11 = objc_msgSend(v8, "count");
  if (v11 >= 290)
    v12 = 290;
  else
    v12 = v11;
  objc_msgSend(v8, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2](v48, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sortableMessagesWithAdditionalPredicates:limit:", v15, v12 + 10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v51, "count"));
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85[0] = v10;
  v85[1] = 3221225472;
  v85[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_2;
  v85[3] = &unk_1E949E700;
  v85[4] = v51;
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v86 = v43;
  v16 = v45;
  v87 = v16;
  v88 = &v89;
  v59 = (void (**)(void *, void *))_Block_copy(v85);
  v84[0] = v10;
  v84[1] = 3221225472;
  v84[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_4;
  v84[3] = &unk_1E949E728;
  v84[4] = v46;
  v84[5] = v47;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v77[0] = v10;
  v77[1] = 3221225472;
  v77[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_5;
  v77[3] = &unk_1E949E750;
  v77[4] = v57;
  v44 = _Block_copy(v84);
  v77[5] = v61;
  v78 = v44;
  v79 = &v80;
  v56 = (void (**)(void *, void *))_Block_copy(v77);
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__17;
  v75 = __Block_byref_object_dispose__17;
  v76 = 0;
  v66[0] = v10;
  v66[1] = 3221225472;
  v66[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_51;
  v66[3] = &unk_1E949E778;
  v70 = &v71;
  v41 = v16;
  v67 = v41;
  v42 = v48;
  v69 = v42;
  v68 = v52;
  v55 = (void (**)(void *, void *))_Block_copy(v66);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v49;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
  if (!v17)
    goto LABEL_27;
  v18 = *(_QWORD *)v63;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v63 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      v59[2](v59, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v56[2](v56, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v55[2](v55, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {

LABEL_22:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      objc_msgSend(v21, "objectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
        goto LABEL_22;
      objc_msgSend(v21, "objectID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObject:", v21);
      objc_msgSend(v20, "itemID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "collectionItemID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqual:", v27))
      {
        +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v30 = v72[5];
          *(_DWORD *)buf = 134218754;
          v95 = a1;
          v96 = 2114;
          *(_QWORD *)v97 = v20;
          *(_WORD *)&v97[8] = 2114;
          *(_QWORD *)&v97[10] = v21;
          *(_WORD *)&v97[18] = 2114;
          *(_QWORD *)&v97[20] = v30;
          _os_log_error_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_ERROR, "%p: Previous message is message itself -- message: %{public}@\nprevious message: %{public}@\nexclude predicate: %{public}@", buf, 0x2Au);
        }

      }
LABEL_23:
      objc_msgSend(v61, "objectForKeyedSubscript:", v25);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v29, v25);
      }
      objc_msgSend(v29, "ef_insertObject:usingSortDescriptors:", v20, v60);

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
  }
  while (v17);
LABEL_27:

  v31 = *((_DWORD *)v90 + 6);
  v32 = objc_msgSend(obj, "count");
  v33 = *((_DWORD *)v81 + 6);
  v34 = objc_msgSend(obj, "count");
  +[EDMessageQueryHandler log](EDMessageQueryHandler, "log");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v39 = objc_msgSend(v51, "count");
    v40 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134219008;
    v95 = a1;
    v96 = 1024;
    *(_DWORD *)v97 = v39;
    *(_WORD *)&v97[4] = 2048;
    *(double *)&v97[6] = (float)((float)((float)v31 * 100.0) / (float)v32);
    *(_WORD *)&v97[14] = 2048;
    *(double *)&v97[16] = (float)((float)((float)v33 * 100.0) / (float)v34);
    *(_WORD *)&v97[24] = 1024;
    *(_DWORD *)&v97[26] = v40;
    _os_log_debug_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEBUG, "%p: Used head-list-lookup (%u entries) for %.3g%%, faster previous-message-lookup for %.3g%% of %u messages.", buf, 0x2Cu);
  }

  v36 = v61;
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v89, 8);

  v37 = v57;
LABEL_32:

  v6 = v52;
LABEL_33:

  return v36;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "ascending");
  v7 = 2;
  if (a3)
    v7 = 3;
  if (v6)
    v8 = v7;
  else
    v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v5, "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionForConstantValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v9, v12, 0, v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t i;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_3;
  v15[3] = &unk_1E949E6D8;
  v7 = v4;
  v16 = v7;
  v8 = objc_msgSend(v5, "indexOfObjectAtIndexes:options:passingTest:", v6, 0, v15);
  v9 = *(void **)(a1 + 40);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "removeAllIndexes");
  }
  else
  {
    objc_msgSend(v9, "removeIndexesInRange:", 0, v8);
    for (i = v8 + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      objc_msgSend(v10, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v13);

      if ((v12 & 1) == 0)
      {
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        goto LABEL_9;
      }

    }
  }
  v10 = 0;
LABEL_9:

  return v10;
}

uint64_t __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);
  v9 = objc_msgSend(*(id *)(a1 + 40), "ascending");
  if (v8 == -1)
    v10 = v9;
  else
    v10 = 0;
  if ((v10 & 1) != 0)
    v11 = 1;
  else
    v11 = (v8 == 1) & ~objc_msgSend(*(id *)(a1 + 40), "ascending");

  return v11;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(v8, "objectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
          {
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v18 = v8;

            goto LABEL_23;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v5)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v4);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v15)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_23:

  return v18;
}

id __86__EDMessageQueryHandler_findMessagesByPreviousObjectIDForAddedMessages_messageSource___block_invoke_51(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D1E1E8], "predicateForExcludingMessagesWithObjectIDs:", a1[4]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  (*(void (**)(void))(a1[6] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v14[0] = v7;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesWithAdditionalPredicates:limit:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  _EDMessageItemIDCollector *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(_EDMessageItemIDCollector);
  -[EDMessageRepositoryQueryHandler query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepositoryQueryHandler remindMeNotificationController](self, "remindMeNotificationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageQueryHandler searchProvider](self, "searchProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EDMessageItemIDCollector collectItemIDsWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:searchProvider:errorString:](v5, "collectItemIDsWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:searchProvider:errorString:", v6, v7, v8, v9, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDMessageQueryHelper)currentQueryHelper
{
  return self->_currentQueryHelper;
}

- (void)setCurrentQueryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_currentQueryHelper, a3);
}

- (EFScheduler)scheduler
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

- (BOOL)didFindRequestedItemForInitialBatch
{
  return self->_didFindRequestedItemForInitialBatch;
}

- (void)setDidFindRequestedItemForInitialBatch:(BOOL)a3
{
  self->_didFindRequestedItemForInitialBatch = a3;
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

- (NSMutableDictionary)oldestMessageIDsByMailboxObjectIDs
{
  return self->_oldestMessageIDsByMailboxObjectIDs;
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (BOOL)hasUrgentPredicate
{
  return self->_hasUrgentPredicate;
}

- (void)setHasUrgentPredicate:(BOOL)a3
{
  self->_hasUrgentPredicate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_oldestMessageIDsByMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_currentQueryHelper, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
}

@end
