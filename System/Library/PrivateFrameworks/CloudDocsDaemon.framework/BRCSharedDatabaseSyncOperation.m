@implementation BRCSharedDatabaseSyncOperation

+ (id)queue
{
  if (queue_once != -1)
    dispatch_once(&queue_once, &__block_literal_global_3);
  return (id)queue_queue;
}

void __39__BRCSharedDatabaseSyncOperation_queue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.sharedb", v0);

  v2 = (void *)queue_queue;
  queue_queue = (uint64_t)v1;

}

- (BRCSharedDatabaseSyncOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 changeState:(id)a5
{
  id v9;
  BRCSharedDatabaseSyncOperation *v10;
  BRCSharedDatabaseSyncOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BRCSharedDatabaseSyncOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v13, sel_initWithName_syncContext_sessionContext_, CFSTR("sync/sharedb"), a3, a4);
  v11 = v10;
  if (v10)
  {
    -[BRCSharedDatabaseSyncOperation setQueuePriority:](v10, "setQueuePriority:", 4);
    objc_storeStrong((id *)&v11->_changeState, a5);
  }

  return v11;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/sharedb", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  objc_super v9;

  v6 = a3;
  v7 = a4;
  -[BRCSharedDatabaseSyncOperation hash](self, "hash");
  kdebug_trace();
  -[BRCSharedDatabaseSyncOperation shareDBSyncCompletionBlock](self, "shareDBSyncCompletionBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    ((void (**)(_QWORD, uint64_t, id))v8)[2](v8, objc_msgSend(v6, "BOOLValue"), v7);
    -[BRCSharedDatabaseSyncOperation setShareDBSyncCompletionBlock:](self, "setShareDBSyncCompletionBlock:", 0);
  }

  v9.receiver = self;
  v9.super_class = (Class)BRCSharedDatabaseSyncOperation;
  -[_BRCOperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v6, v7);

}

- (void)_performAfterAddingOwnerKeysForZoneIDs:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BRCSharedDatabaseSyncOperation *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[BRCSyncContext session](self->super._syncContext, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke;
  v14[3] = &unk_1E875DDA0;
  v15 = v9;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v9;
  dispatch_async_with_logs_0(v10, v14);

}

void __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke_2;
  v6[3] = &unk_1E875D918;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "groupInTransaction:", v6);

}

uint64_t __79__BRCSharedDatabaseSyncOperation__performAfterAddingOwnerKeysForZoneIDs_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138412802;
    v17 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "ownerName", v17, (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "session");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userKeyForOwnerName:db:", v10, v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "session");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "createUserKeyForOwnerName:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            v24 = 2112;
            v25 = v10;
            v26 = 2112;
            v27 = v14;
            _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] inserted new ownerKey %@ for %@%@", buf, 0x20u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return 1;
}

- (void)_performAfterRegisteringForPushes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94CB8]), "initWithSubscriptionID:", CFSTR("sharedZoneSubscription"));
  v6 = objc_alloc_init(MEMORY[0x1E0C94F50]);
  objc_msgSend(v6, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v5, "setNotificationInfo:", v6);
  v7 = objc_alloc(MEMORY[0x1E0C94F28]);
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v8, 0);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__BRCSharedDatabaseSyncOperation__performAfterRegisteringForPushes___block_invoke;
  v12[3] = &unk_1E875DDC8;
  v14 = v4;
  v15 = v9;
  v13 = v5;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v9, "setModifySubscriptionsCompletionBlock:", v12);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9);

}

void __68__BRCSharedDatabaseSyncOperation__performAfterRegisteringForPushes___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "brc_cloudKitErrorForSubscriptionID:", CFSTR("sharedZoneSubscription"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString brc_containsCloudKitInternalErrorCode:](v10, "brc_containsCloudKitInternalErrorCode:", 2032))
  {

    v10 = 0;
  }
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCSharedDatabaseSyncOperation _performAfterRegisteringForPushes:]_block_invoke", 119, v18);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = v18[0];
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "operationID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("success");
    *(_DWORD *)buf = 134219010;
    if (v10)
      v17 = v10;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __brc_leave_section(v18);

}

- (void)_performFetchChangedZones
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[7];
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;

  -[BRCServerChangeState changeToken](self->_changeState, "changeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", v3);
  objc_msgSend(v4, "setFetchAllChanges:", 0);
  +[BRCSharedDatabaseSyncOperation queue](BRCSharedDatabaseSyncOperation, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallbackQueue:", v5);

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultsLimit:", objc_msgSend(v6, "sharedDBSyncDownBatchRecordsCount"));

  objc_initWeak(&location, v4);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__1;
  v14[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke;
  v12[3] = &unk_1E875DDF0;
  objc_copyWeak(&v13, &location);
  v12[4] = v16;
  objc_msgSend(v4, "setRecordZoneWithIDChangedBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_19;
  v10[3] = &unk_1E875DDF0;
  objc_copyWeak(&v11, &location);
  v10[4] = v14;
  objc_msgSend(v4, "setRecordZoneWithIDWasDeletedBlock:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_20;
  v8[3] = &unk_1E875DE68;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v8[5] = v16;
  v8[6] = v14;
  objc_msgSend(v4, "setFetchDatabaseChangesCompletionBlock:", v8);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
  objc_destroyWeak(&location);

}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412802;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ zone %@ changed%@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412802;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ zone %@ changed%@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_20(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  char v23;
  uint64_t v24[3];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BYTE v30[10];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v26 = (uint64_t)WeakRetained;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      *(_QWORD *)v30 = v10;
      _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %@ failed: %@%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v8);
  }
  else
  {
    memset(v24, 0, sizeof(v24));
    __brc_create_section(0, (uint64_t)"-[BRCSharedDatabaseSyncOperation _performFetchChangedZones]_block_invoke", 155, v24);
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = v24[0];
      v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
      v19 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
      *(_DWORD *)buf = 134219010;
      v26 = v17;
      v27 = 2112;
      v28 = WeakRetained;
      v29 = 1024;
      *(_DWORD *)v30 = v18;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v19;
      v31 = 2112;
      v32 = v12;
      _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ done: %u zones were changed and %u deleted%@", buf, 0x2Cu);
    }

    v15 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(*(_QWORD *)(v14 + 8) + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_21;
    v20[3] = &unk_1E875DE40;
    v22 = v14;
    v20[4] = v15;
    v21 = v7;
    v23 = a3;
    objc_msgSend(v15, "_performAfterAddingOwnerKeysForZoneIDs:block:", v16, v20);

    __brc_leave_section(v24);
  }

}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  v3 = a2;
  +[BRCSharedDatabaseSyncOperation queue](BRCSharedDatabaseSyncOperation, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2;
  v9[3] = &unk_1E875DE18;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v12 = v8;
  v13 = *(_BYTE *)(a1 + 56);
  v7 = v3;
  dispatch_async_with_logs_0(v4, v9);

}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = 0;
    v3 = *(void **)(a1 + 40);
    v4 = (void *)MEMORY[0x1E0CB37E8];
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v27;
      *(_QWORD *)&v7 = 138412290;
      v23 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithRecordZoneID:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "session");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "getOrCreateSharedZones:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v13;
            v32 = 2112;
            v33 = v14;
            _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling sync for %@%@", buf, 0x16u);
          }

          if (v13)
          {
            objc_msgSend(v13, "db");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "serialQueue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_23;
            v24[3] = &unk_1E875D500;
            v25 = v13;
            dispatch_async_with_logs_0(v17, v24);

            v18 = v25;
          }
          else
          {
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v23;
              v31 = v18;
              _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should be a container%@", buf, 0xCu);
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v8);
    }

    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2_cold_1(a1, (uint64_t)v20, v21);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "updateWithServerChangeToken:clientRequestID:caughtUp:", *(_QWORD *)(a1 + 48), 0, *(_BYTE *)(a1 + 64) == 0);
    v3 = *(void **)(a1 + 40);
    v4 = (void *)MEMORY[0x1E0CB37E8];
    if (*(_QWORD *)(a1 + 32))
      v2 = 0;
    else
      v2 = *(unsigned __int8 *)(a1 + 64);
  }
  objc_msgSend(v4, "numberWithInt:", v2, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completedWithResult:error:", v22, *(_QWORD *)(a1 + 32));

}

uint64_t __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleSyncDown");
}

- (void)main
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: fetching changed zones in the shared-database%@", (uint8_t *)&v4, 0x16u);
}

uint64_t __38__BRCSharedDatabaseSyncOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "completedWithResult:error:", 0, a2);
  else
    return objc_msgSend(v2, "_performFetchChangedZones");
}

- (id)shareDBSyncCompletionBlock
{
  return self->_shareDBSyncCompletionBlock;
}

- (void)setShareDBSyncCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareDBSyncCompletionBlock, 0);
  objc_storeStrong((id *)&self->_changeState, 0);
}

void __59__BRCSharedDatabaseSyncOperation__performFetchChangedZones__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 504);
  prettyPrintServerChangeToken(*(void **)(a1 + 48), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = *(unsigned __int8 *)(a1 + 64);
  v11 = 138413058;
  v12 = v6;
  if (v9)
    v10 = "NO";
  else
    v10 = "YES";
  v13 = 2112;
  v14 = v7;
  v15 = 2080;
  v16 = v10;
  v17 = 2112;
  v18 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] updating shared-database from %@ with token:%@ caught-up:%s%@", (uint8_t *)&v11, 0x2Au);

}

@end
