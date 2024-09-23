@implementation SGDCloudKitSync

void __23__SGDCloudKitSync_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "processStateChanges");

}

- (void)processStateChanges
{
  _BOOL4 pendingProcessStateChanges;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[8];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_processingStateChanges)
  {
    self->_processingStateChanges = 1;
    -[SGDCloudKitSync accountInfo](self, "accountInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync shouldRemoveEventsFromEventKit](self, "shouldRemoveEventsFromEventKit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D19830];
    v17[0] = v8;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke;
    v12[3] = &unk_1E7DB5990;
    v12[4] = self;
    v13 = v7;
    v14 = v8;
    v15 = a2;
    v11 = v8;
    v5 = v7;
    objc_msgSend(v9, "waitForFuturesToComplete:withCallback:", v10, v12);

LABEL_6:
    return;
  }
  pendingProcessStateChanges = self->_pendingProcessStateChanges;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (pendingProcessStateChanges)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK Already processing state changes and re-processing once complete already scheduled as well.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK Already processing state changes -- will re-process again once complete.", buf, 2u);
  }

  self->_pendingProcessStateChanges = 1;
}

- (id)shouldRemoveEventsFromEventKit
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[SGAccountsAdapter sharedInstance](SGAccountsAdapter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryICloudCalendarAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK Going to request account info to determine whether events should be removed from EK...", buf, 2u);
    }

    -[SGDCloudKitSync accountInfo](self, "accountInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D19830];
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke;
    v13[3] = &unk_1E7DADBD8;
    v13[4] = self;
    v14 = v7;
    v10 = v7;
    objc_msgSend(v8, "createAfter:onCreate:", v9, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK should remove events from EK because there is no primary iCloud Calendar account", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:error:", MEMORY[0x1E0C9AAB0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)accountInfo
{
  NSObject *v3;
  SGFuture *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  dispatch_time_t v11;
  NSObject *queue;
  id v13;
  SGFuture *accountInfoFuture;
  id v15;
  const __CFString *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_accountInfoFuture)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - returning existing SGFuture", buf, 2u);
    }

    v4 = self->_accountInfoFuture;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setTargetQueue:useAfterCompletion:", self->_queue, 0);
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __30__SGDCloudKitSync_accountInfo__block_invoke;
    v20[3] = &unk_1E7DADB88;
    v20[4] = self;
    v7 = v5;
    v21 = v7;
    v8 = (void *)objc_msgSend(v20, "copy");
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (self->_accountInfoInFlight)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - Scheduling call to CloudKit (already one in flight: %@)", buf, 0xCu);
    }

    if (self->_accountInfoInFlight)
      v10 = 1000000000;
    else
      v10 = 0;
    v11 = dispatch_time(0, v10);
    self->_accountInfoInFlight = 0;
    queue = self->_queue;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __30__SGDCloudKitSync_accountInfo__block_invoke_226;
    v18[3] = &unk_1E7DB7578;
    v18[4] = self;
    v19 = v8;
    v13 = v8;
    dispatch_after(v11, queue, v18);
    accountInfoFuture = self->_accountInfoFuture;
    self->_accountInfoFuture = (SGFuture *)v7;
    v15 = v7;

    v4 = self->_accountInfoFuture;
  }
  return v4;
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  uint8_t v38[8];
  _QWORD v39[5];
  void (**v40)(_QWORD);
  _QWORD *v41;
  _QWORD v42[7];
  _QWORD v43[3];
  char v44;
  _QWORD v45[7];
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LODWORD(v47) = 0;
  v2 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_2;
  v45[3] = &unk_1E7DB5BC8;
  v3 = *(_QWORD *)(a1 + 56);
  v45[5] = buf;
  v45[6] = v3;
  v45[4] = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1C3BD5158](v45);
  v5 = (void (**)(_QWORD))MEMORY[0x1C3BD5158]();

  _Block_object_dispose(buf, 8);
  objc_msgSend(*(id *)(a1 + 40), "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "accountStatus"))
    {
      objc_msgSend(*(id *)(a1 + 40), "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "supportsDeviceToDeviceEncryption");

      if ((v9 & 1) == 0)
      {
        sgLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGCK processStateChanges -- failing salt because !supportsDeviceToDeviceEncryption", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "failSalt");
      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
    goto LABEL_31;
  objc_msgSend(*(id *)(a1 + 48), "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "eventsWereRemovedFromEventKit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v14 == v16)
    goto LABEL_31;
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "eventsWereRemovedFromEventKit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
    v20 = CFSTR("ENABLED");
    if (v19)
      v21 = CFSTR("DISABLED");
    else
      v21 = CFSTR("ENABLED");
    if (v14)
      v20 = CFSTR("DISABLED");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_INFO, "SGCK System State Change: Sync %@ --> %@", buf, 0x16u);

  }
  +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "SGDCloudKitSync.processStateChanges");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasSubscription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if ((v32 & 1) == 0)
    {
      sgLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_INFO, "SGCK Creating subscription in response to state change", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "createSubscriptionWithRetries:", 3);
    }
    sgLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v34, OS_LOG_TYPE_INFO, "SGCK Will fetch new entities in response to state change", buf, 2u);
    }

    v35 = (id)objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesOperation");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setEventsWereRemovedFromEventKit:", MEMORY[0x1E0C9AAA0]);
    sgLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v36, OS_LOG_TYPE_INFO, "SGCK Set new persisted state.", buf, 2u);
    }

LABEL_31:
    v5[2](v5);
    goto LABEL_32;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v47 = __Block_byref_object_copy__220;
  v48 = __Block_byref_object_dispose__221;
  v49 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v42[0] = v2;
  v42[1] = 3221225472;
  v42[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_222;
  v42[3] = &unk_1E7DB46E0;
  v24 = *(_QWORD *)(a1 + 32);
  v23 = (uint64_t *)(a1 + 32);
  v42[4] = v24;
  v42[5] = v43;
  v42[6] = buf;
  v25 = (void *)MEMORY[0x1C3BD5158](v42);
  v39[0] = v2;
  v39[1] = 3221225472;
  v39[2] = __38__SGDCloudKitSync_processStateChanges__block_invoke_223;
  v39[3] = &unk_1E7DADB60;
  v26 = *v23;
  v41 = v43;
  v39[4] = v26;
  v40 = v5;
  v27 = MEMORY[0x1C3BD5158](v39);
  v28 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v27;

  if (*(_BYTE *)(*v23 + 40))
  {
    sgLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_INFO, "SGCK About to hop on to background queue to invoke _deleteAllSyncedItemsCallback", v38, 2u);
    }

    +[SGDCloudKitSync _callbackQueue](SGDCloudKitSync, "_callbackQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v30, v25);

  }
  else
  {
    sgLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1C3607000, v37, OS_LOG_TYPE_INFO, "SGCK Skipping background queue block because _readyForNewEntities is false.", v38, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)&buf[8] + 40) + 16))();
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);

LABEL_32:
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke_2(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v2 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 1354, CFSTR("This block should not be run more than once"));

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 193))
  {
    *(_BYTE *)(v4 + 193) = 0;
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK Re-processing state changes because a request came in while this one was in progress...", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "processStateChanges");
  }
}

- (void)failSalt
{
  -[_SGDCloudKitSyncPersistedState setSalt:](self->_persistedState, "setSalt:", 0);
  -[_SGDCloudKitSyncPersistedState setSaltAtomicReferenceId:](self->_persistedState, "setSaltAtomicReferenceId:", 0);
  -[_SGDCloudKitSyncPersistedState setSaltUsesManatee:](self->_persistedState, "setSaltUsesManatee:", 0);
}

- (void)_coupleOperationTrainWithStart:(id)a3 end:(id)a4
{
  if (a3 != a4)
    objc_setAssociatedObject(a4, sel__coupleOperationTrainWithStart_end_, a3, (void *)1);
}

- (void)_addDependency:(id)a3 toTrain:(id)a4
{
  id v5;
  id v6;
  id object;

  object = a4;
  v5 = a3;
  objc_getAssociatedObject(object, sel__coupleOperationTrainWithStart_end_);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = object;
  objc_msgSend(v6, "addDependency:", v5);

}

- (void)clearErrors
{
  NSError *createZoneError;
  NSError *deleteZoneError;
  NSError *procureSaltError;

  createZoneError = self->_createZoneError;
  self->_createZoneError = 0;

  deleteZoneError = self->_deleteZoneError;
  self->_deleteZoneError = 0;

  procureSaltError = self->_procureSaltError;
  self->_procureSaltError = 0;

}

- (void)disable
{
  NSObject *v3;
  uint8_t v4[16];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGCK Disabling due to incompatible version", v4, 2u);
  }

  self->_disabledBecauseOutOfDateSoftware = 1;
  -[NSOperationQueue cancelAllOperations](self->_opQueue, "cancelAllOperations");
}

- (void)suspend
{
  int64_t suspendCount;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  suspendCount = self->_suspendCount;
  self->_suspendCount = suspendCount + 1;
  if (!suspendCount)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK Operation queue suspended", v5, 2u);
    }

    -[NSOperationQueue setSuspended:](self->_opQueue, "setSuspended:", 1);
  }
}

- (void)suspendAndResumeAfter:(double)a3
{
  NSObject *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];
  uint8_t buf[4];
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGCK Will suspend operation queue for delay: %f", buf, 0xCu);
  }

  -[SGDCloudKitSync suspend](self, "suspend");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SGDCloudKitSync_suspendAndResumeAfter___block_invoke;
  v7[3] = &unk_1E7DB56F0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", queue, v7, a3);
}

- (void)resume
{
  int64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_suspendCount - 1;
  self->_suspendCount = v3;
  if (!v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK Resuming operation queue", v5, 2u);
    }

    -[NSOperationQueue setSuspended:](self->_opQueue, "setSuspended:", 0);
  }
}

- (id)getUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") != 1 && objc_msgSend(v3, "code") != 15
    || (objc_msgSend(v3, "userInfo"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v5 = v3;
  }

  return v5;
}

- (BOOL)pauseIfNeededAndReturnRetryEligibilityForError:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[6];
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SGDCloudKitSync getUnderlyingError:](self, "getUnderlyingError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "code") == 111 || objc_msgSend(v4, "code") == 5008)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGCK Suspending sync due to unsynced keychain: %@", buf, 0xCu);
    }

    -[SGDCloudKitSync suspend](self, "suspend");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy__16121;
    v20 = __Block_byref_object_dispose__16122;
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C94870];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke;
    v17[3] = &unk_1E7DAD8B0;
    v17[4] = self;
    v17[5] = buf;
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, 0, v17);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v8;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_msgSend(v4, "userInfo"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      sgLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGCK Delaying for %@ seconds (error: %@)", buf, 0x16u);
      }

      objc_msgSend(v14, "doubleValue");
      -[SGDCloudKitSync suspendAndResumeAfter:](self, "suspendAndResumeAfter:");

    }
    else
    {
      if (!CKCanRetryForError())
      {
        v10 = 0;
        goto LABEL_7;
      }
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v4;
        _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGCK CloudKit framework recommends retry without delay for error: %@", buf, 0xCu);
      }

    }
  }
  v10 = 1;
LABEL_7:

  return v10;
}

- (id)addDeleteZoneOperation
{
  NSObject *v3;
  void *v4;
  NSOperation *v5;
  NSOperation *inProgressDeleteZoneOperation;
  NSObject *v7;
  _BOOL4 v8;
  void *v10;
  void *v11;
  NSOperation *v12;
  NSOperation *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  if (self->_disabledBecauseOutOfDateSoftware)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addDeleteZoneOperation - Skipping because of out of date software", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_130_16371);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v4);
    v5 = (NSOperation *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v5;
  }
  inProgressDeleteZoneOperation = self->_inProgressDeleteZoneOperation;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!inProgressDeleteZoneOperation)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneOperation - Adding new operation to operation queue", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1C3BD4F6C](-[SGDCloudKitSync clearErrors](self, "clearErrors"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__SGDCloudKitSync_addDeleteZoneOperation__block_invoke_131;
    v15[3] = &unk_1E7DB56F0;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v11);
    v12 = (NSOperation *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    v13 = self->_inProgressDeleteZoneOperation;
    self->_inProgressDeleteZoneOperation = v12;

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addDeleteZoneAttemptOperationWithRetries:](self, "addDeleteZoneAttemptOperationWithRetries:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperation addDependency:](self->_inProgressDeleteZoneOperation, "addDependency:", v14);
    -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v4, v14);
    -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v4, self->_inProgressDeleteZoneOperation);
    -[SGDCloudKitSync failSalt](self, "failSalt");
    self->_noZone = 1;
    v5 = self->_inProgressDeleteZoneOperation;

    goto LABEL_5;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneOperation - Returning operation already in flight", buf, 2u);
  }

  v5 = self->_inProgressDeleteZoneOperation;
  return v5;
}

- (id)addDeleteZoneAttemptOperationWithRetries:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, void *);
  void *v19;
  SGDCloudKitSync *v20;
  id v21[3];
  void *v22;
  _BYTE location[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134217984;
    *(_QWORD *)&location[4] = a3;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK addDeleteZoneAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  -[SGDCloudKitSync addOperation](self, "addOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v7, v8);
  v9 = (void *)objc_opt_new();
  -[SGDCloudKitSync addOperation:](self, "addOperation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addDependency:", v7);
  -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecordZoneIDsToDelete:", v12);

  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, v8);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __60__SGDCloudKitSync_addDeleteZoneAttemptOperationWithRetries___block_invoke;
  v19 = &unk_1E7DAD8F8;
  objc_copyWeak(v21, (id *)location);
  v21[1] = (id)a2;
  v21[2] = (id)a3;
  v20 = self;
  objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", &v16);
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("DeleteZone operation attempt completion [retries: %lu]"), a3, v16, v17, v18, v19);
  objc_msgSend(v8, "setName:", v14);

  objc_msgSend(v8, "addDependency:", v10);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)location);

  return v8;
}

- (id)addCreateZoneOperation
{
  NSObject *v3;
  void *v4;
  NSOperation *v5;
  NSOperation *inProgressCreateZoneOperation;
  NSObject *v7;
  _BOOL4 v8;
  void *v10;
  void *v11;
  NSOperation *v12;
  NSOperation *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  if (self->_disabledBecauseOutOfDateSoftware)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addCreateZoneOperation - Skipping because of out of date software", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_138);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v4);
    v5 = (NSOperation *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v5;
  }
  inProgressCreateZoneOperation = self->_inProgressCreateZoneOperation;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!inProgressCreateZoneOperation)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneOperation - Adding new operation to operation queue", buf, 2u);
    }

    v10 = (void *)MEMORY[0x1C3BD4F6C](-[SGDCloudKitSync clearErrors](self, "clearErrors"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__SGDCloudKitSync_addCreateZoneOperation__block_invoke_139;
    v15[3] = &unk_1E7DB56F0;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v11);
    v12 = (NSOperation *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    v13 = self->_inProgressCreateZoneOperation;
    self->_inProgressCreateZoneOperation = v12;

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addCreateZoneAttemptOperationWithRetries:](self, "addCreateZoneAttemptOperationWithRetries:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v4, v14);
    -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v4, self->_inProgressCreateZoneOperation);
    -[NSOperation addDependency:](self->_inProgressCreateZoneOperation, "addDependency:", v14);
    v5 = self->_inProgressCreateZoneOperation;

    goto LABEL_5;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneOperation - Returning operation already in flight", buf, 2u);
  }

  v5 = self->_inProgressCreateZoneOperation;
  return v5;
}

- (id)addCreateZoneAttemptOperationWithRetries:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  NSError *deleteZoneError;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19[3];
  void *v20;
  _BYTE location[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134217984;
    *(_QWORD *)&location[4] = a3;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  -[SGDCloudKitSync addOperation](self, "addOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v7, v8);
  deleteZoneError = self->_deleteZoneError;
  if (deleteZoneError)
  {
    objc_storeStrong((id *)&self->_createZoneError, deleteZoneError);
    objc_msgSend(v8, "addDependency:", v7);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C95088]);
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithZoneID:", v11);

    v13 = (void *)objc_opt_new();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addDependency:", v7);
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRecordZonesToSave:", v15);

    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, v8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__SGDCloudKitSync_addCreateZoneAttemptOperationWithRetries___block_invoke;
    v18[3] = &unk_1E7DAD8F8;
    objc_copyWeak(v19, (id *)location);
    v19[1] = (id)a2;
    v19[2] = (id)a3;
    v18[4] = self;
    objc_msgSend(v14, "setModifyRecordZonesCompletionBlock:", v18);
    objc_msgSend(v8, "addDependency:", v14);
    objc_destroyWeak(v19);
    objc_destroyWeak((id *)location);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CreateZone operation attempt completion [retries: %lu]"), a3);
  objc_msgSend(v8, "setName:", v16);

  return v8;
}

- (id)addManateeSanityCheckOperation
{
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16[2];
  uint8_t buf[8];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = !self->_disabledBecauseOutOfDateSoftware;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK Creating Manatee health check operation...", buf, 2u);
    }

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation](self, "addOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v8, v9);
    v10 = objc_alloc(MEMORY[0x1E0C94E08]);
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithRecordZoneIDs:", v12);
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addDependency:", v8);
    objc_msgSend(v9, "addDependency:", v14);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__SGDCloudKitSync_addManateeSanityCheckOperation__block_invoke;
    v15[3] = &unk_1E7DAD940;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a2;
    v15[4] = self;
    objc_msgSend(v14, "setFetchRecordZonesCompletionBlock:", v15);
    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);

    return v9;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGCK addManateeSanityCheckOperation - Skipping because of out of date software", buf, 2u);
    }

    -[SGDCloudKitSync addOperation](self, "addOperation");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)addProcureSaltOperation
{
  NSObject *v3;
  NSOperation *v4;
  NSOperation *inProgressProcureSaltOperation;
  NSObject *v6;
  _BOOL4 v7;
  NSOperation *v8;
  void *v10;
  void *v11;
  NSOperation *v12;
  NSOperation *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  if (self->_disabledBecauseOutOfDateSoftware)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addProcureSaltOperation - Skipping because of out of date software", buf, 2u);
    }

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v4 = (NSOperation *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = v4;
    return v8;
  }
  inProgressProcureSaltOperation = self->_inProgressProcureSaltOperation;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (inProgressProcureSaltOperation)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Returning operation already in flight", buf, 2u);
    }

    v4 = self->_inProgressProcureSaltOperation;
    goto LABEL_9;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Adding new operation to operation queue", buf, 2u);
  }

  v10 = (void *)MEMORY[0x1C3BD4F6C](-[SGDCloudKitSync clearErrors](self, "clearErrors"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__SGDCloudKitSync_addProcureSaltOperation__block_invoke;
  v16[3] = &unk_1E7DB56F0;
  v16[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation:](self, "addOperation:", v11);
  v12 = (NSOperation *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  v13 = self->_inProgressProcureSaltOperation;
  self->_inProgressProcureSaltOperation = v12;

  -[SGDCloudKitSync addOperation](self, "addOperation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addProcureSaltAttemptOperationWithRetries:](self, "addProcureSaltAttemptOperationWithRetries:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v14, v15);
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v14, self->_inProgressProcureSaltOperation);
  -[NSOperation addDependency:](self->_inProgressProcureSaltOperation, "addDependency:", v15);
  v8 = self->_inProgressProcureSaltOperation;

  return v8;
}

- (id)_ckErrorForId:(id)a3 inError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "code") == 2)
  {
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "code") == 22)
    {
      v11 = 0;
    }
    else
    {
      -[SGDCloudKitSync getUnderlyingError:](self, "getUnderlyingError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)addProcureSaltAttemptOperationWithRetries:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSError *createZoneError;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *context;
  void *v30;
  _QWORD v32[5];
  id v33;
  id v34[3];
  _QWORD v35[2];
  _BYTE location[12];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134217984;
    *(_QWORD *)&location[4] = a3;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  -[SGDCloudKitSync addOperation](self, "addOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v6, v7);
  createZoneError = self->_createZoneError;
  if (createZoneError)
  {
    objc_storeStrong((id *)&self->_procureSaltError, createZoneError);
    objc_msgSend(v7, "addDependency:", v6);
  }
  else
  {
    context = (void *)MEMORY[0x1C3BD4F6C](v8);
    SGRandomDataOfLength(0x10uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(CFSTR("salt_"), "stringByAppendingString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithRecordName:zoneID:", v13, v14);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("salt_atomic_reference"), v15);
    SGRandomDataOfLength(0x20uLL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0C95070]);
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithRecordName:zoneID:", CFSTR("salt-manatee"), v18);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("salt"), v19);
    objc_msgSend(v20, "encryptedValuesByKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("se"));

    objc_msgSend(v15, "recordName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("a"));

    objc_autoreleasePoolPop(context);
    v23 = (void *)objc_opt_new();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "addDependency:", v6);
    v35[0] = v20;
    v35[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRecordsToSave:", v25);

    objc_msgSend(v24, "setAtomic:", 1);
    objc_msgSend(v24, "setSavePolicy:", 0);
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, v7);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __61__SGDCloudKitSync_addProcureSaltAttemptOperationWithRetries___block_invoke;
    v32[3] = &unk_1E7DAD968;
    objc_copyWeak(v34, (id *)location);
    v34[1] = (id)a2;
    v32[4] = self;
    v26 = v20;
    v33 = v26;
    v34[2] = (id)a3;
    objc_msgSend(v24, "setModifyRecordsCompletionBlock:", v32);
    objc_msgSend(v7, "addDependency:", v24);

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)location);

  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ProcureSalt operation attempt completion [retries: %lu]"), a3);
  objc_msgSend(v7, "setName:", v27);

  return v7;
}

- (id)addFetchNewEntitiesOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSOperation *v7;
  NSOperation *inProgressFetchNewEntitiesOperation;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSOperation *v15;
  NSOperation *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "SGCK addFetchNewEntitiesOperation - Skipping because of out of date software", buf, 2u);
    }

    v4 = (void *)MEMORY[0x1E0CB34C8];
    v5 = &__block_literal_global_163_16308;
LABEL_5:
    objc_msgSend(v4, "blockOperationWithBlock:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v6);
    v7 = (NSOperation *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    return v7;
  }
  if (!self->_readyForNewEntities)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGCK addFetchNewEntitiesOperation - Deferring because not ready for new entities.", buf, 2u);
    }

    -[_SGDCloudKitSyncPersistedState setHasDeferredSync:](self->_persistedState, "setHasDeferredSync:", MEMORY[0x1E0C9AAB0]);
    v4 = (void *)MEMORY[0x1E0CB34C8];
    v5 = &__block_literal_global_165_16310;
    goto LABEL_5;
  }
  inProgressFetchNewEntitiesOperation = self->_inProgressFetchNewEntitiesOperation;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!inProgressFetchNewEntitiesOperation)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Adding new operation to operation queue", buf, 2u);
    }

    v13 = (void *)MEMORY[0x1C3BD4F6C](-[SGDCloudKitSync clearErrors](self, "clearErrors"));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__SGDCloudKitSync_addFetchNewEntitiesOperation__block_invoke_170;
    v19[3] = &unk_1E7DB56F0;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addOperation:](self, "addOperation:", v14);
    v15 = (NSOperation *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v13);
    v16 = self->_inProgressFetchNewEntitiesOperation;
    self->_inProgressFetchNewEntitiesOperation = v15;

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync addFetchNewEntitiesAttemptOperationWithRetries:](self, "addFetchNewEntitiesAttemptOperationWithRetries:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v6, v17);
    -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v6, self->_inProgressFetchNewEntitiesOperation);
    -[NSOperation addDependency:](self->_inProgressFetchNewEntitiesOperation, "addDependency:", v17);
    v7 = self->_inProgressFetchNewEntitiesOperation;

    goto LABEL_6;
  }
  if (v11)
  {
    if (self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v21 = v18;
    _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Returning operation already in flight, changing value of _requestedFetchNewEntitiesWhileRequestAlreadyInFlight from %@ to YES", buf, 0xCu);
  }

  self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight = 1;
  return self->_inProgressFetchNewEntitiesOperation;
}

- (id)addFetchNewEntitiesAttemptOperationWithRetries:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31[3];
  _QWORD v32[5];
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _BYTE location[12];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134217984;
    *(_QWORD *)&location[4] = a3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesAttemptOperationWithRetries:%lu", location, 0xCu);
  }

  self->_requestedFetchNewEntitiesWhileRequestAlreadyInFlight = 0;
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v5, v6);
  -[_SGDCloudKitSyncPersistedState syncToken](self->_persistedState, "syncToken");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setPreviousServerChangeToken:", v26);
  v9 = objc_alloc(MEMORY[0x1E0C94DE8]);
  v36 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  v35 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v10, v11);
  -[SGDCloudKitSync addOperation:](self, "addOperation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addDependency:", v5);
  objc_msgSend(v13, "setFetchAllChanges:", 0);
  v14 = (void *)objc_opt_new();
  -[CKDatabase container](self->_database, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContainer:", v15);

  objc_msgSend(v13, "setConfiguration:", v14);
  v16 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke;
  v32[3] = &unk_1E7DAD9D0;
  v32[4] = self;
  v18 = v16;
  v33 = v18;
  objc_msgSend(v13, "setRecordChangedBlock:", v32);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v6, "addDependency:", v19);
  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, v6);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_181;
  v27[3] = &unk_1E7DADA20;
  objc_copyWeak(v31, (id *)location);
  v31[1] = (id)a2;
  v27[4] = self;
  v20 = v19;
  v28 = v20;
  v21 = v18;
  v29 = v21;
  v31[2] = (id)a3;
  v22 = v7;
  v30 = v22;
  objc_msgSend(v13, "setRecordZoneFetchCompletionBlock:", v27);
  objc_msgSend(v6, "addDependency:", v13);

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)location);

  return v6;
}

- (BOOL)shouldRecreateZoneForRecordError:(id)a3 operationError:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[SGDCloudKitSync getUnderlyingError:](self, "getUnderlyingError:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "code");
  if (!v10)
    v10 = objc_msgSend(v9, "code");
  v11 = (unint64_t)(v10 - 5000) < 5 || v10 == 112;

  return v11;
}

- (id)addDeleteAndRecreateZoneOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v3, v4);
  -[SGDCloudKitSync addDeleteZoneOperation](self, "addDeleteZoneOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v3, v5);
  -[SGDCloudKitSync addCreateZoneOperation](self, "addCreateZoneOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v5, v6);
  -[SGDCloudKitSync addProcureSaltOperation](self, "addProcureSaltOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _addDependency:toTrain:](self, "_addDependency:toTrain:", v6, v7);
  objc_msgSend(v4, "addDependency:", v7);

  return v4;
}

- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_disabledBecauseOutOfDateSoftware)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGCK addWriteOperationForRecordGetter - Skipping because of out of date software", v14, 2u);
    }

    -[SGDCloudKitSync addOperation](self, "addOperation");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SGDCloudKitSync addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:](self, "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", v8, v9, a5, 1);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return v12;
}

- (id)addWriteOperationForRecordGetter:(id)a3 deleteGetter:(id)a4 withRetries:(unint64_t)a5 isFirstTry:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t buf[16];
  _QWORD v26[5];
  id v27;
  id v28;
  id v29[3];
  BOOL v30;
  id location;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation](self, "addOperation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync _coupleOperationTrainWithStart:end:](self, "_coupleOperationTrainWithStart:end:", v13, v14);
  location = 0;
  objc_initWeak(&location, v14);
  v15 = (void *)MEMORY[0x1E0CB34C8];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke;
  v26[3] = &unk_1E7DADA70;
  objc_copyWeak(v29, &location);
  v29[1] = (id)a2;
  v26[4] = self;
  v30 = v6;
  v16 = v11;
  v27 = v16;
  v17 = v12;
  v28 = v17;
  v29[2] = (id)a5;
  objc_msgSend(v15, "blockOperationWithBlock:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation:](self, "addOperation:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addDependency:", v13);
  objc_msgSend(v14, "addDependency:", v19);
  if (self->_inProgressProcureSaltOperation)
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "SGCK Will wait for in-progress procure salt operation before writing or deleting an entity", buf, 2u);
    }

    objc_msgSend(v13, "addDependency:", self->_inProgressProcureSaltOperation);
  }
  if (self->_inProgressCreateZoneOperation)
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "SGCK Will wait for in-progress create zone operation before writing or deleting an entity", buf, 2u);
    }

    objc_msgSend(v13, "addDependency:", self->_inProgressCreateZoneOperation);
  }
  if (v6)
  {
    -[SGDCloudKitSync addManateeSanityCheckOperation](self, "addManateeSanityCheckOperation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addDependency:", v22);

  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WriteRecord operation attempt completion [retries: %lu]"), a5);
  objc_msgSend(v14, "setName:", v23);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

  return v14;
}

- (id)addOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "setDatabase:", self->_database);
    objc_msgSend(v5, "setCallbackQueue:", self->_queue);
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK Will add CK operation to queue: %@", buf, 0xCu);
    }

  }
  -[NSMutableArray addObject:](self->_operationsToAddToOpQueue, "addObject:", v4);
  if (-[NSMutableArray count](self->_operationsToAddToOpQueue, "count") == 1)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SGDCloudKitSync_addOperation___block_invoke;
    block[3] = &unk_1E7DB56F0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return v4;
}

- (id)addOperation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_199_16264);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCloudKitSync addOperation:](self, "addOperation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SGDCloudKitSync)init
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  _QWORD v30[4];
  id *v31;
  id v32;
  uint8_t buf[8];
  _QWORD block[4];
  id *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SGDCloudKitSync;
  v2 = -[SGDCloudKitSync init](&v36, sel_init);
  if (!v2)
    return (SGDCloudKitSync *)v2;
  v3 = objc_opt_new();
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  *((_QWORD *)v2 + 25) = ct_green_tea_logger_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.suggestd.aps", v5);
  v7 = (void *)*((_QWORD *)v2 + 7);
  *((_QWORD *)v2 + 7) = v6;

  v8 = objc_opt_new();
  v9 = (void *)*((_QWORD *)v2 + 8);
  *((_QWORD *)v2 + 8) = v8;

  objc_msgSend(*((id *)v2 + 8), "setUnderlyingQueue:", *((_QWORD *)v2 + 7));
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  v11 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = v10;

  v12 = *((_QWORD *)v2 + 7);
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SGDCloudKitSync_init__block_invoke;
  block[3] = &unk_1E7DB56F0;
  v14 = (id *)v2;
  v35 = v14;
  dispatch_sync(v12, block);
  dispatch_suspend(*((dispatch_object_t *)v2 + 7));
  *((_BYTE *)v14 + 40) = 0;
  *((_BYTE *)v14 + 96) = 0;
  objc_msgSend(MEMORY[0x1E0D198F0], "cloudKitPersistedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "SGCK No persisted state exists for this user.", buf, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v14[13];
  v14[13] = (id)v16;

  v18 = v14[13];
  if (!v18)
  {
    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "SGCK Existing persisted state was saved but could not be deserialized.", buf, 2u);
    }
LABEL_9:

    v19 = v14 + 13;
    v18 = v14[13];
    if (!v18)
    {
      sgLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_INFO, "SGCK Creating new persisted state.", buf, 2u);
      }

      v22 = objc_opt_new();
      v23 = *v19;
      *v19 = (id)v22;

      v18 = *v19;
    }
    goto LABEL_13;
  }
  v19 = v14 + 13;
LABEL_13:
  objc_msgSend(v18, "setChangeCallback:", &__block_literal_global_209);
  objc_msgSend(*v19, "salt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*v19, "saltUsesManatee");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if ((v26 & 1) == 0)
    {
      sgLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v27, OS_LOG_TYPE_INFO, "SGCK Discarding non-manatee salt", buf, 2u);
      }

      objc_msgSend(v14, "failSalt");
    }
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v14);
  v28 = (void *)MEMORY[0x1E0D198F0];
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __23__SGDCloudKitSync_init__block_invoke_211;
  v30[3] = &unk_1E7DB10C8;
  v31 = v14;
  objc_copyWeak(&v32, (id *)buf);
  objc_msgSend(v28, "registerBlockOnSuggestionsSettingsChange:", v30);
  objc_destroyWeak(&v32);

  objc_destroyWeak((id *)buf);
  return (SGDCloudKitSync *)v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SGDCloudKitSync;
  -[SGDCloudKitSync dealloc](&v3, sel_dealloc);
}

- (void)accountChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SGDCloudKitSync *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SGDCloudKitSync_accountChanged___block_invoke;
  v7[3] = &unk_1E7DB6A30;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)createSubscriptionWithRetries:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  CKDatabase *database;
  _QWORD v9[6];
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRecordType:", CFSTR("com_apple_suggestions_ck_event"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setShouldSendContentAvailable:", 1);
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "SGCK Going to create subscription (retries: %lu)", buf, 0xCu);
  }

  database = self->_database;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke;
  v9[3] = &unk_1E7DADC50;
  v9[4] = self;
  v9[5] = a3;
  -[CKDatabase saveSubscription:completionHandler:](database, "saveSubscription:completionHandler:", v5, v9);

}

- (void)setDatabase:(id)a3
{
  id v6;
  CKContainer *v7;
  CKContainer *container;
  NSObject *v9;
  uint64_t v10;
  NSObject *queue;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _PASKVOHandler *kvoHandler;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  CKContainer *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  id location;
  _QWORD block[5];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  CKContainer *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_database)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 1620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_database == nil"));

  }
  if (!self->_callback)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 1621, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_callback"));

  }
  objc_msgSend(v6, "container");
  v7 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  container = self->_container;
  self->_container = v7;

  objc_storeStrong((id *)&self->_database, a3);
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v22 = self->_container;
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    v36 = 2112;
    v37 = v22;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGCK Got database: %@, container: %@", buf, 0x16u);
  }

  dispatch_resume((dispatch_object_t)self->_queue);
  v10 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SGDCloudKitSync_setDatabase___block_invoke;
  block[3] = &unk_1E7DB56F0;
  block[4] = self;
  dispatch_async(queue, block);
  location = 0;
  objc_initWeak(&location, self);
  if (self->_container)
  {
    +[SGDCloudKitSync apsEnvironmentStringForContainer:](SGDCloudKitSync, "apsEnvironmentStringForContainer:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_244;
    v30[3] = &unk_1E7DADCA0;
    v30[4] = self;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v12, "wait:", v30);

    objc_destroyWeak(&v31);
  }
  else
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "CloudKit database %@ has nil container, therefore cannot get APS environment strong and APNS will not work.", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_accountChanged_, *MEMORY[0x1E0C94690], 0);

  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_254;
  v29[3] = &unk_1E7DB56F0;
  v29[4] = self;
  v15 = (void *)objc_msgSend(v29, "copy");
  kvoHandler = self->_kvoHandler;
  NSStringFromSelector(sel_primaryICloudCalendarAccount);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGAccountsAdapter sharedInstance](SGAccountsAdapter, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_255;
  v27[3] = &unk_1E7DADCC8;
  v27[4] = self;
  v19 = v15;
  v28 = v19;
  -[_PASKVOHandler reactAfterChangesToKeyPath:ofObject:usingBlock:](kvoHandler, "reactAfterChangesToKeyPath:ofObject:usingBlock:", v17, v18, v27);

  v20 = self->_queue;
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_2_257;
  v25[3] = &unk_1E7DADAD8;
  v26 = v19;
  v21 = v19;
  dispatch_async(v20, v25);

  objc_destroyWeak(&location);
}

- (void)addEnrichment:(id)a3 withParentEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "groupId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGCK addEntity:%@ %@", buf, 0x16u);
  }

  if (v10)
  {
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "com.apple.suggestions.sgckAddEntity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke;
    v17[3] = &unk_1E7DADD18;
    v17[4] = self;
    v18 = v10;
    v19 = v12;
    v20 = v6;
    v21 = v7;
    v22 = v13;
    v15 = v13;
    v16 = v12;
    dispatch_async(queue, v17);

  }
  else
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "SGCK addEntity: - ignoring because groupId is nil", buf, 2u);
    }
  }

}

- (void)deleteGroupId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK deleteGroupId:%@", buf, 0xCu);
  }

  if (v4)
  {
    -[SGDCloudKitSync recordZoneId](self, "recordZoneId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "com.apple.suggestions.sgckDeleteGroupId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__SGDCloudKitSync_deleteGroupId___block_invoke;
    v11[3] = &unk_1E7DB77B0;
    v11[4] = self;
    v12 = v4;
    v13 = v6;
    v14 = v7;
    v9 = v7;
    v10 = v6;
    dispatch_async(queue, v11);

  }
  else
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGCK deleteGroupId: passed nil groupId...returning...", buf, 2u);
    }
  }

}

- (void)setReadyForNewEntities:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGDCloudKitSync_setReadyForNewEntities___block_invoke;
  v4[3] = &unk_1E7DB1A10;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (void)setNewEntitiesCallback:(id)a3
{
  id v5;
  void *v6;
  OS_dispatch_queue *v7;
  id v8;
  OS_dispatch_queue *v9;
  void *v10;
  id callback;
  void *v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;

  v5 = a3;
  if (self->_callback)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 1805, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_callback == nil"));

  }
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__SGDCloudKitSync_setNewEntitiesCallback___block_invoke;
  v13[3] = &unk_1E7DADD68;
  v14 = v7;
  v15 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_msgSend(v13, "copy");
  callback = self->_callback;
  self->_callback = v10;

}

- (void)setDeleteAllSyncedItemsCallback:(id)a3
{
  id v5;
  void *v6;
  OS_dispatch_queue *v7;
  id v8;
  OS_dispatch_queue *v9;
  void *v10;
  id deleteAllSyncedItemsCallback;
  void *v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;

  v5 = a3;
  if (self->_deleteAllSyncedItemsCallback)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 1816, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_deleteAllSyncedItemsCallback == nil"));

  }
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SGDCloudKitSync_setDeleteAllSyncedItemsCallback___block_invoke;
  v13[3] = &unk_1E7DB6318;
  v14 = v7;
  v15 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_msgSend(v13, "copy");
  deleteAllSyncedItemsCallback = self->_deleteAllSyncedItemsCallback;
  self->_deleteAllSyncedItemsCallback = v10;

}

- (id)invokeNewEntitiesCallbackWithEntity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v14;
  SGDCloudKitSync *v15;
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_SGDCloudKitSyncPersistedState eventsWereRemovedFromEventKit](self->_persistedState, "eventsWereRemovedFromEventKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", MEMORY[0x1E0C9AAB0]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTargetQueue:useAfterCompletion:", self->_queue, 0);
    +[SGDCloudKitSync _callbackQueue](SGDCloudKitSync, "_callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SGDCloudKitSync_invokeNewEntitiesCallbackWithEntity___block_invoke;
    block[3] = &unk_1E7DB7800;
    v10 = v8;
    v14 = v10;
    v15 = self;
    v16 = v4;
    dispatch_async(v9, block);

    v11 = v16;
    v7 = v10;

  }
  return v7;
}

- (id)recordZoneId
{
  if (recordZoneId__pasOnceToken173 != -1)
    dispatch_once(&recordZoneId__pasOnceToken173, &__block_literal_global_274);
  return (id)recordZoneId__pasExprOnceResult;
}

- (void)deleteStorageEvent:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(a3, "opaqueKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SGDCloudKitSync deleteGroupId:](self, "deleteGroupId:", v4);
  }
  else
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGCK deleteStorageEvent failed because no group id", v6, 2u);
    }

  }
}

- (void)deleteZoneWithCompletion:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E7DB7578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)privacySalt
{
  NSObject *v3;
  NSObject *v4;
  NSObject *queue;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  _QWORD block[7];
  uint8_t v13[16];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGCK privacySalt ensuring not already on _queue...", buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "useManateeSaltForHistory") & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__16121;
    v22 = __Block_byref_object_dispose__16122;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK privacySalt about to dispatch_sync to _queue", v13, 2u);
    }

    queue = self->_queue;
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_279;
    block[3] = &unk_1E7DB46E0;
    block[4] = self;
    block[5] = buf;
    block[6] = &v14;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v15 + 24))
    {
      v7 = (void *)*((_QWORD *)v19 + 5);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_283;
      v11[3] = &unk_1E7DADDF8;
      v11[4] = self;
      objc_msgSend(v7, "wait:", v11);
    }
    v8 = *((id *)v19 + 5);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "SGCK privacySalt immediately returning empty NSData because [SGPreferenceStorage useManateeSaltForHistory] is false", buf, 2u);
    }

    if (privacySalt__pasOnceToken177 != -1)
      dispatch_once(&privacySalt__pasOnceToken177, &__block_literal_global_278);
    v8 = (id)privacySalt__pasExprOnceResult;
  }
  return v8;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138413058;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceiveToken:%@ forTopic:%@ identifier:%@", (uint8_t *)&v14, 0x2Au);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
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
  v5 = a3;
  v6 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceivePublicToken:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *queue;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didReceiveIncomingMessage:%@", buf, 0x16u);
  }

  v10 = (void *)MEMORY[0x1E0C94F40];
  objc_msgSend(v8, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationFromRemoteNotificationDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "notificationType") == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDCloudKitSync.m"), 1996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[notification isKindOfClass:[CKDatabaseNotification class]]"));

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SGDCloudKitSync_connection_didReceiveIncomingMessage___block_invoke;
    block[3] = &unk_1E7DB56F0;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
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
  v5 = a3;
  v6 = a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didSendOutgoingMessage:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didFailToSendOutgoingMessage:%@ error:%@", (uint8_t *)&v11, 0x20u);
  }

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  id v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK connection:%@ didChangeConnectedStatus:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)connectionDidReconnect:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK connectionDidReconnect:%@", (uint8_t *)&v5, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySaltFuture, 0);
  objc_storeStrong((id *)&self->_procureSaltError, 0);
  objc_storeStrong((id *)&self->_deleteZoneError, 0);
  objc_storeStrong((id *)&self->_createZoneError, 0);
  objc_storeStrong((id *)&self->_inProgressFetchNewEntitiesOperation, 0);
  objc_storeStrong((id *)&self->_inProgressDeleteZoneOperation, 0);
  objc_storeStrong((id *)&self->_inProgressCreateZoneOperation, 0);
  objc_storeStrong((id *)&self->_inProgressProcureSaltOperation, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_accountInfoFuture, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_operationsToAddToOpQueue, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong(&self->_deleteAllSyncedItemsCallback, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_kvoHandler, 0);
}

void __56__SGDCloudKitSync_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "eventsWereRemovedFromEventKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK Got an APNS notification, but not syncing because sync is currently disabled.", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK Will fetch new entities for incoming message", v7, 2u);
    }

    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesOperation");
  }
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_279(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  __int128 v17;
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK privacySalt is now on _queue", buf, 2u);
  }

  if (*(_QWORD *)(a1[4] + 208))
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGCK privacySalt reusing existing future", buf, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 208));
  }
  else
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v7 = (_BYTE *)a1[4];
    if (v7[121])
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGCK privacySalt is resolving to empty data because CKErrorIncompatibleVersion was previously encountered, indicating that the server no longer supports syncing with this software version", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "succeed:", *MEMORY[0x1E0D81688]);
    }
    else
    {
      objc_msgSend(v7, "accountInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK privacySalt about to wait on accountInfoFuture", buf, 2u);
      }

      v11 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_280;
      v16[3] = &unk_1E7DADDD0;
      v17 = *((_OWORD *)a1 + 2);
      objc_msgSend(v9, "wait:", v16);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isComplete") & 1) == 0)
      {
        sgLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGCK privacySalt future did not complete synchronously; will store future in _privacySaltFuture for reuse",
            buf,
            2u);
        }

        objc_storeStrong((id *)(a1[4] + 208), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));
        v13 = a1[4];
        v14 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_281;
        v15[3] = &unk_1E7DADDF8;
        v15[4] = v13;
        objc_msgSend(v14, "wait:", v15);
      }

    }
  }
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v7 = a2;
  dispatch_assert_queue_not_V2(v6);
  v8 = objc_msgSend(v7, "length");

  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("0-length");
    v11 = CFSTR("nil");
    if (!v7)
      v10 = CFSTR("nil");
    if (v8)
      v10 = CFSTR("successful");
    if (v5)
      v11 = v5;
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGCK privacySalt outcome: %@ result, %@ error", (uint8_t *)&v12, 0x16u);
  }

}

void __30__SGDCloudKitSync_privacySalt__block_invoke_280(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK privacySalt finished waiting on accountInfoFuture", (uint8_t *)&v17, 2u);
  }

  if (v6)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGCK privacySalt error retrieving account info: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "fail:", v6);
    goto LABEL_23;
  }
  if (objc_msgSend(v5, "accountStatus") == 2)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v10 = "SGCK privacySalt resolving to empty data because iCloud account is restricted (parental controls, etc)";
LABEL_21:
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v17, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "accountStatus") == 3)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v10 = "SGCK privacySalt resolving to empty data because there is no iCloud account";
      goto LABEL_21;
    }
LABEL_22:

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "succeed:", *MEMORY[0x1E0D81688]);
    goto LABEL_23;
  }
  if ((objc_msgSend(v5, "supportsDeviceToDeviceEncryption") & 1) == 0)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      v10 = "SGCK privacySalt resolving to empty data because device-to-device encryption is not supported";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "saltUsesManatee");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {

LABEL_25:
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGCK privacySalt resolving to empty data because no salt has been generated yet", (uint8_t *)&v17, 2u);
    }
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "salt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_25;
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "SGCK privacySalt succeeded (using existing known salt)", (uint8_t *)&v17, 2u);
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(v14 + 104), "salt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "succeed:", v16);

LABEL_23:
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_281(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SGDCloudKitSync_privacySalt__block_invoke_2;
  block[3] = &unk_1E7DB56F0;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __30__SGDCloudKitSync_privacySalt__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGCK privacySalt future asynchronously completed, will set _privacySaltFuture to nil", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 208);
  *(_QWORD *)(v3 + 208) = 0;

}

void __30__SGDCloudKitSync_privacySalt__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D19830], "createWithImmediateResult:", *MEMORY[0x1E0D81688]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)privacySalt__pasExprOnceResult;
  privacySalt__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0CB34C8];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_2;
  v11 = &unk_1E7DB7578;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  objc_msgSend(v2, "blockOperationWithBlock:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addDeleteZoneOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDependency:", v7);

}

void __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
    +[SGDCloudKitSync _callbackQueue](SGDCloudKitSync, "_callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_3;
    v6[3] = &unk_1E7DB7578;
    v4 = *(id *)(a1 + 40);
    v7 = v2;
    v8 = v4;
    v5 = v2;
    dispatch_async(v3, v6);

  }
}

uint64_t __44__SGDCloudKitSync_deleteZoneWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __31__SGDCloudKitSync_recordZoneId__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0C95098]);
  v2 = objc_msgSend(v1, "initWithZoneName:ownerName:", CFSTR("events"), *MEMORY[0x1E0C94730]);
  v3 = (void *)recordZoneId__pasExprOnceResult;
  recordZoneId__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

void __55__SGDCloudKitSync_invokeNewEntitiesCallbackWithEntity___block_invoke(_QWORD *a1)
{
  void *v1;
  id v2;

  v1 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1[5] + 24) + 16))(*(_QWORD *)(a1[5] + 24), a1[6]));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "succeed:", v2);

}

uint64_t __51__SGDCloudKitSync_setDeleteAllSyncedItemsCallback___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __42__SGDCloudKitSync_setNewEntitiesCallback___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_assert_queue_not_V2(v3);
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v5;
}

void __42__SGDCloudKitSync_setReadyForNewEntities___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v16 = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGCK setReadyForNewEntities:%@", (uint8_t *)&v16, 0xCu);
  }

  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 == *(unsigned __int8 *)(v5 + 40))
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGCK ignoring because readyForNewEntities == _readyForNewEntities", (uint8_t *)&v16, 2u);
    }

  }
  else
  {
    *(_BYTE *)(v5 + 40) = v4;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasDeferredProcessStateChanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGCK processing deferred state changes...", (uint8_t *)&v16, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setHasDeferredProcessStateChanges:", MEMORY[0x1E0C9AAA0]);
        objc_msgSend(*(id *)(a1 + 32), "processStateChanges");
      }
      else
      {
        if (v10)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGCK no deferred state changes", (uint8_t *)&v16, 2u);
        }

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasDeferredSync");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_INFO, "SGCK processing deferred sync...", (uint8_t *)&v16, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setHasDeferredSync:", MEMORY[0x1E0C9AAA0]);
        v15 = (id)objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesOperation");
      }
      else
      {
        if (v14)
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_INFO, "SGCK no deferred sync", (uint8_t *)&v16, 2u);
        }

      }
    }
  }
}

void __33__SGDCloudKitSync_deleteGroupId___block_invoke(id *a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[16];

  objc_msgSend(*((id *)a1[4] + 13), "eventsWereRemovedFromEventKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK Not deleting entity from CloudKit because current state prohibits syncing", buf, 2u);
    }
  }
  else
  {
    getCTGreenTeaOsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "Begin: Transmitting Confirm/Reject Of Calendar Event", buf, 2u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __33__SGDCloudKitSync_deleteGroupId___block_invoke_266;
    v20[3] = &unk_1E7DADD40;
    v8 = a1[4];
    v21 = a1[5];
    v22 = a1[6];
    objc_msgSend(v8, "addWriteOperationForRecordGetter:deleteGetter:withRetries:", 0, v20, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v14 = v7;
    v15 = 3221225472;
    v16 = __33__SGDCloudKitSync_deleteGroupId___block_invoke_2;
    v17 = &unk_1E7DB6A30;
    v18 = a1[4];
    v19 = a1[7];
    objc_msgSend(v11, "blockOperationWithBlock:", &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v12, "addDependency:", v9, v14, v15, v16, v17, v18);
    v13 = (id)objc_msgSend(a1[4], "addOperation:", v12);

    v4 = v21;
  }

}

id __33__SGDCloudKitSync_deleteGroupId___block_invoke_266(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  SGSha256HMACData(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v8, *(_QWORD *)(a1 + 40));

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __33__SGDCloudKitSync_deleteGroupId___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];

  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "End: Transmitting Confirm/Reject Of Calendar Event", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "done");
}

void __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke(id *a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  objc_msgSend(*((id *)a1[4] + 13), "eventsWereRemovedFromEventKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK Not adding entity to CloudKit because current state prohibits syncing", buf, 2u);
    }
  }
  else
  {
    getCTGreenTeaOsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "Begin: Transmitting Calendar Event", buf, 2u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_260;
    v20[3] = &unk_1E7DADCF0;
    v8 = a1[4];
    v21 = a1[5];
    v22 = a1[6];
    v23 = a1[7];
    v24 = a1[8];
    objc_msgSend(v8, "addWriteOperationForRecordGetter:deleteGetter:withRetries:", v20, 0, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v14 = v7;
    v15 = 3221225472;
    v16 = __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_2;
    v17 = &unk_1E7DB6A30;
    v18 = a1[4];
    v19 = a1[9];
    objc_msgSend(v11, "blockOperationWithBlock:", &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v12, "addDependency:", v9, v14, v15, v16, v17, v18);
    v13 = (id)objc_msgSend(a1[4], "addOperation:", v12);

    v4 = v21;
  }

}

id __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  SGSha256HMACData(v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithRecordName:zoneID:", v11, *(_QWORD *)(a1 + 40));

  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "duplicateKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toCloudKitRecordWithId:parentEntityType:", v12, objc_msgSend(v14, "entityType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0C950C0]);
  v17 = (void *)objc_msgSend(v16, "initWithRecordID:action:", v6, *MEMORY[0x1E0C94A40]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("r"));

  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __50__SGDCloudKitSync_addEnrichment_withParentEntity___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];

  getCTGreenTeaOsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "End: Transmitting Calendar Event", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "done");
}

void __31__SGDCloudKitSync_setDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "resume");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasSubscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK device does not have a subscription. Checking eligibility before creating one...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "shouldRemoveEventsFromEventKit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_243;
    v6[3] = &unk_1E7DADBB0;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "wait:", v6);

  }
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__SGDCloudKitSync_setDatabase___block_invoke_2;
  v11[3] = &unk_1E7DADC78;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v9 = v5;
  v10 = v6;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  dispatch_async(v8, v11);
  objc_destroyWeak(&v15);

}

void __31__SGDCloudKitSync_setDatabase___block_invoke_254(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "primaryICloudCalendarAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGAccountsAdapter sharedInstance](SGAccountsAdapter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryICloudCalendarAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v2 && (objc_msgSend(v4, "isEqualToString:", v2) & 1) == 0)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v2;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGCK Handling primary iCloud Calendar account change (%@ --> %@)", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSyncToken:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setHasSubscription:", MEMORY[0x1E0C9AAA0]);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesOperation");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setPrimaryICloudCalendarAccount:", v4);
    objc_msgSend(*(id *)(a1 + 32), "processStateChanges");
  }

}

void __31__SGDCloudKitSync_setDatabase___block_invoke_255(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56), *(dispatch_block_t *)(a1 + 40));
}

uint64_t __31__SGDCloudKitSync_setDatabase___block_invoke_2_257(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGCK Error getting APS environment string -- APNS will not work!: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK APS (APNS) Environment: %@", buf, 0xCu);
    }

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE148]), "initWithEnvironmentName:namedDelegatePort:queue:", *(_QWORD *)(a1 + 40), CFSTR("com.apple.aps.suggestd"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "setDelegate:", WeakRetained);

    objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.suggestd"));
    v4 = objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "_setEnabledTopics:", v10);

  }
}

void __31__SGDCloudKitSync_setDatabase___block_invoke_243(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  v5 = objc_msgSend(v4, "BOOLValue");

  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK device account (or lack thereof) is not eligible -- not creating subscription", v14, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK Device is eligible. Creating subscription via setDatabase: path...", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "hasSubscription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK setDatabase: not going to create subscription because something else created it...", v16, 2u);
      }

    }
    else
    {
      if (v11)
      {
        *(_WORD *)v17 = 0;
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGCK actually creating subscription via setDatabase path...", v17, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "createSubscriptionWithRetries:", 3);
    }
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGCK backfill via setDatabase: path...", v15, 2u);
    }

    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesOperation");
  }
}

void __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v5 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_2;
  block[3] = &unk_1E7DB6BB8;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v8 = v4;
  dispatch_async(v7, block);

}

void __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "getUnderlyingError:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "code");
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3 == 2032)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGCK Setting hasSubscription persisted flag because duplicate subscription already exists on server. This should only happen after a suggest_tool reset.", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setHasSubscription:", MEMORY[0x1E0C9AAB0]);
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        v16 = v2;
        _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGCK Error while attempting to create subscription: %@", buf, 0xCu);
      }

      if (objc_msgSend(*(id *)(a1 + 40), "pauseIfNeededAndReturnRetryEligibilityForError:", v2)
        && *(_QWORD *)(a1 + 48))
      {
        sgLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGCK Will re-attempt subscription creation", buf, 2u);
        }

        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_237;
        v12[3] = &unk_1E7DB6368;
        v8 = *(_QWORD *)(a1 + 48);
        v13 = *(void **)(a1 + 40);
        v9 = v13;
        v14 = v8;
        objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v9, "addOperation:", v10);

      }
    }

  }
  else
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGCK Setting hasSubscription persisted flag because new subscription was created successfully", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setHasSubscription:", MEMORY[0x1E0C9AAB0]);
  }
}

uint64_t __49__SGDCloudKitSync_createSubscriptionWithRetries___block_invoke_237(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createSubscriptionWithRetries:", *(_QWORD *)(a1 + 40) - 1);
}

void __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(v3, "setTargetQueue:useAfterCompletion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke_2;
  v8[3] = &unk_1E7DADBB0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "wait:", v8);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fail:", v6);
  }
  else
  {
    objc_msgSend(v5, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsDeviceToDeviceEncryption"))
      v7 = MEMORY[0x1E0C9AAA0];
    else
      v7 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v3, "succeed:", v7);
  }

}

void __49__SGDCloudKitSync_shouldRemoveEventsFromEventKit__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK Received account info, decision on whether to remove events from EK: %@ (error: %@)", (uint8_t *)&v8, 0x16u);
  }

}

void __30__SGDCloudKitSync_accountInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __30__SGDCloudKitSync_accountInfo__block_invoke_2;
  v13[3] = &unk_1E7DB77B0;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v13[1] = 3221225472;
  v14 = v5;
  v15 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

uint64_t __30__SGDCloudKitSync_accountInfo__block_invoke_226(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - Calling CloudKit (-[CKContainer accountInfoWithCompletionHandler:])", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "accountInfoWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __30__SGDCloudKitSync_accountInfo__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 138412546;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - %@, %@", (uint8_t *)&v16, 0x16u);
  }

  if (!*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_error_impl(&dword_1C3607000, v3, OS_LOG_TYPE_ERROR, "SGCK accountInfo - completionHandler - received error and/or failed to get account info: %@, %@", (uint8_t *)&v16, 0x16u);
    }

  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 88);
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - completing future", (uint8_t *)&v16, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 96) = 0;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9 | (unint64_t)v8)
    {
      v6 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], -1, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 88), "completeWithResult:error:", v9, v6);
    if (!*(_QWORD *)(a1 + 32))
    {
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(void **)(v10 + 88);
      *(_QWORD *)(v10 + 88) = 0;

    }
  }
  else if (v7)
  {
    LOWORD(v16) = 0;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK accountInfo - completionHandler - ignoring result because a newer request is in flight", (uint8_t *)&v16, 2u);
  }

}

uint64_t __34__SGDCloudKitSync_accountChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK accountChanged:%@", (uint8_t *)&v14, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 88))
  {
    if (objc_msgSend(*(id *)(v3 + 88), "isComplete"))
    {
      sgLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK accountChanged: - existing future is complete. Setting to nil.", (uint8_t *)&v14, 2u);
      }

      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 88);
      *(_QWORD *)(v5 + 88) = 0;
LABEL_12:

      v3 = *(_QWORD *)(a1 + 40);
      return objc_msgSend((id)v3, "processStateChanges");
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v3 + 96))
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK accountChanged: - existing future is in-flight. Creating a new request...", (uint8_t *)&v14, 2u);
      }

      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 88);
      *(_QWORD *)(v8 + 88) = 0;
      v10 = v9;

      objc_msgSend(*(id *)(a1 + 40), "accountInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "completer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "wait:", v11);
      goto LABEL_12;
    }
  }
  return objc_msgSend((id)v3, "processStateChanges");
}

void __38__SGDCloudKitSync_processStateChanges__block_invoke_222(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGCK About to invoke _deleteAllSyncedItemsCallback from background queue...", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1[4] + 32) + 16))();
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "SGCK Finished invoking _deleteAllSyncedItemsCallback on background queue. Now hopping back onto _queue...", v4, 2u);
  }

  dispatch_async(*(dispatch_queue_t *)(a1[4] + 56), *(dispatch_block_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __38__SGDCloudKitSync_processStateChanges__block_invoke_223(_QWORD *a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGCK Entering sgckQueueBlock.", buf, 2u);
  }

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK deleteAllSyncedItemsSucceeded == YES", v10, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 104), "setSyncToken:", 0);
    objc_msgSend(*(id *)(a1[4] + 104), "setEventsWereRemovedFromEventKit:", MEMORY[0x1E0C9AAB0]);
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGCK Set new persisted state.", v9, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "SGCK deleteAllSyncedItemsSucceeded == NO. Will defer a processStateChanges.", v8, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 104), "setHasDeferredProcessStateChanges:", MEMORY[0x1E0C9AAB0]);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __23__SGDCloudKitSync_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suspend");
}

void __23__SGDCloudKitSync_init__block_invoke_211(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SGDCloudKitSync_init__block_invoke_2;
  block[3] = &unk_1E7DB7010;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __23__SGDCloudKitSync_init__block_invoke_207(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0D198F0];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudKitPersistedState:", v3);

}

uint64_t __32__SGDCloudKitSync_addOperation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addOperations:waitUntilFinished:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 0);
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "operationCount");
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK added %lu operations to queue (pending operation count: %lu)", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

void __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36[3];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 1055, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  if (*(_BYTE *)(a1 + 80))
  {
    *(_QWORD *)(v4 + 168) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 184);
    *(_QWORD *)(v6 + 184) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    goto LABEL_5;
  }
  if (!v5)
  {
    v5 = *(void **)(v4 + 184);
    if (!v5)
    {
LABEL_5:
      if (*(_BYTE *)(v4 + 120))
      {
        sgLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGCK Adding and waiting for zone creation before writing entity.", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "addCreateZoneOperation");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), 0);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_addDependency:toTrain:", v9, v10);
        objc_msgSend(WeakRetained, "addDependency:", v10);
      }
      else
      {
        objc_msgSend(*(id *)(v4 + 104), "salt");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = *(void **)(a1 + 32);
          v13 = (void *)objc_opt_new();
          objc_msgSend(v12, "addOperation:", v13);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (*(_QWORD *)(a1 + 40))
          {
            v14 = (void *)MEMORY[0x1C3BD4F6C]();
            v15 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "salt");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "saltAtomicReferenceId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v14);
          }
          else
          {
            v18 = 0;
          }
          if (*(_QWORD *)(a1 + 48))
          {
            v20 = (void *)MEMORY[0x1C3BD4F6C]();
            v21 = *(_QWORD *)(a1 + 48);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "salt");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v20);
          }
          else
          {
            v23 = 0;
          }
          sgLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            sgMapSelector();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = *(_QWORD *)(a1 + 72);
            *(_DWORD *)buf = 138412802;
            v38 = v28;
            v39 = 2112;
            v40 = v23;
            v41 = 2048;
            v42 = v29;
            _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "SGCK Will write entity records: %@, delete entity records: %@, retries remaining: %lu", buf, 0x20u);

          }
          objc_msgSend(v9, "setRecordsToSave:", v18);
          objc_msgSend(v9, "setRecordIDsToDelete:", v23);
          objc_msgSend(v9, "setAtomic:", 0);
          objc_msgSend(v9, "setSavePolicy:", 2);
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke_191;
          v31[3] = &unk_1E7DADA48;
          objc_copyWeak(v36, v2);
          v25 = *(_QWORD *)(a1 + 32);
          v36[1] = *(id *)(a1 + 64);
          v31[4] = v25;
          v10 = v18;
          v32 = v10;
          v26 = v23;
          v27 = *(void **)(a1 + 72);
          v33 = v26;
          v36[2] = v27;
          v34 = *(id *)(a1 + 40);
          v35 = *(id *)(a1 + 48);
          objc_msgSend(v9, "setModifyRecordsCompletionBlock:", v31);
          objc_msgSend(WeakRetained, "addDependency:", v9);

          objc_destroyWeak(v36);
        }
        else
        {
          sgLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "SGCK Adding and waiting for salt procurement before writing entity.", buf, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "addProcureSaltOperation");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), 0);
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_addDependency:toTrain:", v9, v10);
          objc_msgSend(WeakRetained, "addDependency:", v10);
        }
      }
      goto LABEL_26;
    }
  }
  v9 = v5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v9;
    _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGCK Failing to write entity due to unrecoverable error: %@", buf, 0xCu);
  }
LABEL_26:

}

void __88__SGDCloudKitSync_addWriteOperationForRecordGetter_deleteGetter_withRetries_isFirstTry___block_invoke_191(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  _BOOL4 v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("muscularEndOperation"));

    if (!v5)
      goto LABEL_51;
LABEL_3:
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v39;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v11), "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ckErrorForRecordId:inError:", v13, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v7 = *(id *)(a1 + 48);
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(a1 + 32), "ckErrorForRecordId:inError:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v5);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v14 = (void *)v19;
              goto LABEL_21;
            }
          }
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          if (v16)
            continue;
          break;
        }
      }
      v14 = 0;
    }
LABEL_21:

    if ((objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v14) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v5))
    {
      v20 = *(_QWORD *)(a1 + 88);
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v20 - 1, 0);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addDependency:", v21);
        v22 = v5;
LABEL_49:

        goto LABEL_50;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "getUnderlyingError:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 88)
      && objc_msgSend(*(id *)(a1 + 32), "shouldRecreateZoneForRecordError:operationError:", v14, v22))
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (v14)
          v32 = v14;
        else
          v32 = v22;
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "SGCK Will recreate zone and salt and try to write record again (error: %@)", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) - 1, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 32);
      objc_msgSend(v24, "addDeleteAndRecreateZoneOperation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_addDependency:toTrain:", v25, v21);

      goto LABEL_48;
    }
    v26 = objc_msgSend(v14, "code");
    if (!v26)
      v26 = objc_msgSend(v22, "code");
    if (v26 != 26)
    {
      if (v26 == 31)
      {
        objc_msgSend(*(id *)(a1 + 32), "failSalt");
        sgLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "SGCK Salt atomic reference check failed while trying to write record. Calling failSalt.", buf, 2u);
        }

        if (!*(_QWORD *)(a1 + 88))
          goto LABEL_50;
        sgLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v31, OS_LOG_TYPE_ERROR, "SGCK Retrying after salt missing reference error.", buf, 2u);
        }

LABEL_47:
        objc_msgSend(*(id *)(a1 + 32), "addWriteOperationForRecordGetter:deleteGetter:withRetries:isFirstTry:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) - 1, 0);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_48:
        objc_msgSend(WeakRetained, "addDependency:", v21);
        goto LABEL_49;
      }
      if (v26 != 28)
      {
LABEL_50:

        goto LABEL_51;
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "SGCK Zone missing while trying to write or delete record. Setting _noZone flag.", buf, 2u);
    }

    if (!*(_QWORD *)(a1 + 88))
      goto LABEL_50;
    v28 = objc_msgSend(*(id *)(a1 + 40), "count");
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGCK Not retrying because there is nothing to write.", buf, 2u);
      }
      goto LABEL_49;
    }
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGCK Retrying after zone missing error", buf, 2u);
    }

    goto LABEL_47;
  }
  if (v5)
    goto LABEL_3;
LABEL_51:

}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "eventsWereRemovedFromEventKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK ignoring fetched new entities because we are not in a sync enabled state", v14, 2u);
    }

  }
  else
  {
    objc_msgSend(v3, "recordType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com_apple_suggestions_ck_event"));

    if (v8)
    {
      +[SGPipelineEntity fromCloudKitRecord:](SGPipelineEntity, "fromCloudKitRecord:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enrichments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        v12 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "invokeNewEntitiesCallbackWithEntity:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
    }
  }

}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_181(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[3];
  char v35;
  uint8_t buf[16];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 914, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "eventsWereRemovedFromEventKit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "SGCK ignoring record zone completion block because we are not in a sync enabled state", buf, 2u);
    }

    objc_msgSend(WeakRetained, "removeDependency:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v26 = v13;
    v19 = (void *)MEMORY[0x1E0D19830];
    v20 = *(_QWORD *)(a1 + 48);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_183;
    v27[3] = &unk_1E7DAD9F8;
    objc_copyWeak(v34, (id *)(a1 + 64));
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v34[1] = *(id *)(a1 + 72);
    v27[4] = v21;
    v28 = v22;
    v29 = *(id *)(a1 + 48);
    v23 = v14;
    v24 = *(void **)(a1 + 80);
    v30 = v23;
    v34[2] = v24;
    v31 = *(id *)(a1 + 56);
    v32 = v11;
    v33 = v12;
    v35 = a5;
    objc_msgSend(v19, "waitForFuturesToComplete:withCallback:", v20, v27);

    objc_destroyWeak(v34);
    v13 = v26;
  }

}

void __66__SGDCloudKitSync_addFetchNewEntitiesAttemptOperationWithRetries___block_invoke_183(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("muscularEndOperation"));

  }
  objc_msgSend(WeakRetained, "removeDependency:", *(_QWORD *)(a1 + 40));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v4)
  {
LABEL_11:

    v10 = (id *)(a1 + 56);
    if (*(_QWORD *)(a1 + 56))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:") & 1) != 0)
      {
        v11 = *(_QWORD *)(a1 + 104);
        if (!v11)
        {
          sgLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v26 = (const __CFString *)*v10;
            *(_DWORD *)buf = 138412290;
            v38 = v26;
            _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGCK Giving up on fetching new changes because out of retries for error: %@", buf, 0xCu);
          }
          goto LABEL_39;
        }
        v12 = *(void **)(a1 + 32);
        v13 = v11 - 1;
        goto LABEL_36;
      }
      v15 = *v10;
      v16 = 1;
LABEL_20:
      objc_msgSend(*(id *)(a1 + 32), "ckErrorForRecordZoneId:inError:", *(_QWORD *)(a1 + 64), v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = -[NSObject code](v17, "code");
      if (!v18)
        v18 = objc_msgSend(*v10, "code");
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v18 != 21)
      {
        if (v20)
        {
          v28 = (const __CFString *)v17;
          if (!v17)
            v28 = (const __CFString *)*v10;
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGCK Giving up on fetching changes due to unrecoverable error %@", buf, 0xCu);
        }

        goto LABEL_39;
      }
      if (v20)
      {
        v27 = (const __CFString *)v17;
        if (!v17)
          v27 = (const __CFString *)*v10;
        *(_DWORD *)buf = 138412290;
        v38 = v27;
        _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGCK Change token expired (error: %@)", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSyncToken:", 0);
      if (!v16)
      {
LABEL_39:

        goto LABEL_40;
      }
      if (*(_QWORD *)(a1 + 104))
      {
        sgLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGCK Will try fetching again without change token", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "addFetchNewEntitiesAttemptOperationWithRetries:", *(_QWORD *)(a1 + 104) - 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addDependency:", v22);

      }
      if (*v10)
        goto LABEL_40;
    }
    v23 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "recordZoneId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v23, "isEqual:", v24);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 972, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[recordZoneID isEqual:[self recordZoneId]]"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSyncToken:", *(_QWORD *)(a1 + 80));
    if (!*(_BYTE *)(a1 + 112) && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 160))
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "SGCK Finished requesting more entities from server.", buf, 2u);
      }
      goto LABEL_39;
    }
    sgLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v29 = CFSTR("YES");
      if (*(_BYTE *)(a1 + 112))
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 160))
        v29 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v38 = v30;
      v39 = 2112;
      v40 = v29;
      _os_log_debug_impl(&dword_1C3607000, v25, OS_LOG_TYPE_DEBUG, "SGCK Fetching more entities from server for these reasons: [%@] Server indicated more entities are coming, [%@] Client was asked again to fetch more entities while this request was already in-flight", buf, 0x16u);
    }

    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 104);
LABEL_36:
    objc_msgSend(v12, "addFetchNewEntitiesAttemptOperationWithRetries:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addDependency:", v17);
    goto LABEL_39;
  }
  v5 = v4;
  v6 = *(_QWORD *)v34;
LABEL_5:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v6)
      objc_enumerationMutation(v3);
    objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v7), "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (!v9)
      break;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v5)
        goto LABEL_5;
      goto LABEL_11;
    }
  }

  sgLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "SGCK Storage was not ready. Will sync again when it's purportedly available.", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setHasDeferredSync:", MEMORY[0x1E0C9AAB0]);
  v10 = (id *)(a1 + 56);
  v15 = *(id *)(a1 + 56);
  if (v15)
  {
    v16 = 0;
    goto LABEL_20;
  }
LABEL_40:

}

void __47__SGDCloudKitSync_addFetchNewEntitiesOperation__block_invoke_170(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK addFetchNewEntitiesOperation - Operation completed", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = 0;

}

void __61__SGDCloudKitSync_addProcureSaltAttemptOperationWithRetries___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  BOOL v49;
  id v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const __CFString *v62;
  __int16 v63;
  __CFString *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

    if (v9)
      goto LABEL_3;
LABEL_48:
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v13 = (__CFString *)v7;
    v36 = -[__CFString countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v36)
    {
      v37 = v36;
      v55 = WeakRetained;
      v56 = v8;
      v38 = v7;
      v39 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v58 != v39)
            objc_enumerationMutation(v13);
          v41 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v41, "recordType");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("salt"));

          if (v43)
          {
            v25 = v41;
            v17 = 0;
            v7 = v38;
            WeakRetained = v55;
            v8 = v56;
            goto LABEL_58;
          }
        }
        v37 = -[__CFString countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v37)
          continue;
        break;
      }
      v17 = 0;
      v7 = v38;
      WeakRetained = v55;
      v8 = v56;
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_72;
  }
  if (!v9)
    goto LABEL_48;
LABEL_3:
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ckErrorForRecordId:inError:", v12, v9);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v13) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v9))
  {
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "addProcureSaltAttemptOperationWithRetries:", v14 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "addDependency:", v15);

    }
    else
    {
      if (v13)
        v16 = v13;
      else
        v16 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), v16);
    }
    v17 = v9;
LABEL_72:

    goto LABEL_73;
  }
  objc_msgSend(*(id *)(a1 + 32), "getUnderlyingError:", v9);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 64)
    && objc_msgSend(*(id *)(a1 + 32), "shouldRecreateZoneForRecordError:operationError:", v13, v17))
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (v13)
        v33 = v13;
      else
        v33 = v17;
      *(_DWORD *)buf = 138412290;
      v62 = v33;
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "SGCK Will recreate zone and try to procure salt again (error: %@)", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addProcureSaltAttemptOperationWithRetries:", *(_QWORD *)(a1 + 64) - 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "addDeleteAndRecreateZoneOperation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_addDependency:toTrain:", v21, v19);

    objc_msgSend(WeakRetained, "addDependency:", v19);
    goto LABEL_72;
  }
  v22 = -[__CFString code](v13, "code");
  if (!v22)
    v22 = -[__CFString code](v17, "code");
  if (v22 == 28 || v22 == 26)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
    sgLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v13)
        v32 = v13;
      else
        v32 = v17;
      *(_DWORD *)buf = 138412290;
      v62 = v32;
      _os_log_error_impl(&dword_1C3607000, v26, OS_LOG_TYPE_ERROR, "SGCK Zone missing while procuring salt: %@", buf, 0xCu);
    }

    if (!*(_QWORD *)(a1 + 64))
      goto LABEL_72;
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "SGCK Will attempt to create zone and then try procuring salt again", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addProcureSaltAttemptOperationWithRetries:", *(_QWORD *)(a1 + 64) - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 32);
    objc_msgSend(v28, "addCreateZoneOperation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_addDependency:toTrain:", v29, v24);

    objc_msgSend(WeakRetained, "addDependency:", v24);
    v25 = 0;
  }
  else
  {
    if (v22 != 14)
    {
      sgLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        if (v13)
          v34 = v13;
        else
          v34 = v17;
        *(_DWORD *)buf = 138412290;
        v62 = v34;
        _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "SGCK Unrecoverable error while procuring salt: %@", buf, 0xCu);
      }

      if (v13)
        v31 = v13;
      else
        v31 = v17;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), v31);
      goto LABEL_72;
    }
    sgLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEBUG, "SGCK Using existing salt record found on server", buf, 2u);
    }

    -[__CFString userInfo](v13, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_58:
  if (v25)
  {
    -[__CFString encryptedValuesByKey](v25, "encryptedValuesByKey");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("se"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFString objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("a"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v45)
      v49 = v46 == 0;
    else
      v49 = 1;
    if (v49)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        v54 = CFSTR("non-nil");
        if (!v45)
          v54 = 0;
        *(_DWORD *)buf = 138412546;
        v62 = v54;
        v63 = 2112;
        v64 = v46;
        _os_log_fault_impl(&dword_1C3607000, v48, OS_LOG_TYPE_FAULT, "SGCK procuredSaltRecord missing critical fields (se=%@, a=%@)! This should not be possible and no recovery path is implemented. CloudKit writes will fail.", buf, 0x16u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    else
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v46;
        _os_log_impl(&dword_1C3607000, v48, OS_LOG_TYPE_INFO, "SGCK Successfully procured Manatee salt with atomic reference name %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSalt:", v45);
      v51 = objc_alloc(MEMORY[0x1E0C95070]);
      objc_msgSend(*(id *)(a1 + 32), "recordZoneId");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v51, "initWithRecordName:zoneID:", v46, v52);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSaltAtomicReferenceId:", v53);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setSaltUsesManatee:", MEMORY[0x1E0C9AAB0]);
    }

    v13 = v25;
    goto LABEL_72;
  }
LABEL_73:

}

void __42__SGDCloudKitSync_addProcureSaltOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGCK addProcureSaltOperation - Operation completed with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK addProcureSaltOperation - Operation completed successfully", (uint8_t *)&v8, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = 0;

}

void __49__SGDCloudKitSync_addManateeSanityCheckOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

  }
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGCK Operation error during Manatee sanity check: %@", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "recordZoneId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ckErrorForRecordZoneId:inError:", v9, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7 && -[NSObject code](v7, "code") == 112)
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGCK Missing Manatee identity detected during sanity check. Deleting-and-then-re-creating zone... (record zone error: %@)", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "addDeleteAndRecreateZoneOperation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "addDependency:", v11);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK Manatee health check returned without errors", buf, 2u);
  }

}

void __60__SGDCloudKitSync_addCreateZoneAttemptOperationWithRetries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

    if (v6)
    {
LABEL_3:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "recordZoneId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ckErrorForRecordZoneId:inError:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "getUnderlyingError:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "code") == 2053)
      {
        sgLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGCK got PCS user identity unknown error while creating zone. Running processStateChanges just to be sure we didn't miss anything.", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "processStateChanges");
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v10) & 1) != 0
        || objc_msgSend(*(id *)(a1 + 32), "pauseIfNeededAndReturnRetryEligibilityForError:", v6))
      {
        v13 = *(_QWORD *)(a1 + 56);
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "addCreateZoneAttemptOperationWithRetries:", v13 - 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "addDependency:", v14);
LABEL_17:

          goto LABEL_18;
        }
        sgLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
LABEL_16:

          v17 = *(_QWORD *)(a1 + 32);
          v18 = v6;
          v14 = *(void **)(v17 + 168);
          *(_QWORD *)(v17 + 168) = v18;
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        v16 = "SGCK aborting create zone because out of retries for retry-able error: %@";
      }
      else
      {
        if (objc_msgSend(v6, "code") == 18)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), a4);
          objc_msgSend(*(id *)(a1 + 32), "disable");
LABEL_18:

          goto LABEL_25;
        }
        sgLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        v16 = "SGCK Unrecoverable error for create zone operation: %@";
      }
      _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_16;
    }
  }
  sgLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v23 = v21;
    _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "SGCK addCreateZoneAttemptOperationWithRetries:%lu - SUCCESS (zone created or already exists)", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
LABEL_25:

}

void __41__SGDCloudKitSync_addCreateZoneOperation__block_invoke_139(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v11 = 138412290;
      v12 = v5;
      v6 = "SGCK addCreateZoneOperation - Operation completed with error: %@";
      v7 = v3;
      v8 = 12;
LABEL_7:
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v4)
  {
    LOWORD(v11) = 0;
    v6 = "SGCK addCreateZoneOperation - Operation completed successfully";
    v7 = v3;
    v8 = 2;
    goto LABEL_7;
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 136);
  *(_QWORD *)(v9 + 136) = 0;

}

void __60__SGDCloudKitSync_addDeleteZoneAttemptOperationWithRetries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SGDCloudKitSync.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("strongEndOperation"));

  }
  v8 = *(id **)(a1 + 32);
  if (v6)
  {
    if (objc_msgSend(v8, "pauseIfNeededAndReturnRetryEligibilityForError:", v6))
    {
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(id **)(a1 + 32);
      if (!v9)
      {
        v11 = v10 + 22;
LABEL_18:
        objc_storeStrong(v11, a4);
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    v12 = objc_msgSend(v6, "code");
    if (v12 == 4)
    {
      v9 = *(_QWORD *)(a1 + 56);
      if (v9)
      {
        v10 = *(id **)(a1 + 32);
LABEL_13:
        objc_msgSend(v10, "addDeleteZoneAttemptOperationWithRetries:", v9 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "addDependency:", v13);

        goto LABEL_19;
      }
      sgLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        v15 = "SGCK Ran out of retries for delete zone operation with network failure: %@";
        goto LABEL_21;
      }
    }
    else
    {
      if (v12 == 18)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), a4);
        objc_msgSend(*(id *)(a1 + 32), "disable");
        goto LABEL_19;
      }
      sgLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        v15 = "SGCK Unrecoverable error for delete zone operation: %@";
LABEL_21:
        _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
      }
    }

    v11 = (id *)(*(_QWORD *)(a1 + 32) + 176);
    goto LABEL_18;
  }
  objc_msgSend(v8[13], "setSyncToken:", 0);
  objc_msgSend(*(id *)(a1 + 32), "failSalt");
LABEL_19:

}

void __41__SGDCloudKitSync_addDeleteZoneOperation__block_invoke_131(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v11 = 138412290;
      v12 = v5;
      v6 = "SGCK addDeleteZoneOperation - Operation completed with error: %@";
      v7 = v3;
      v8 = 12;
LABEL_7:
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v4)
  {
    LOWORD(v11) = 0;
    v6 = "SGCK addDeleteZoneOperation - Operation completed successfully";
    v7 = v3;
    v8 = 2;
    goto LABEL_7;
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = 0;

}

void __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C3607000, v2, OS_LOG_TYPE_ERROR, "SGCK Resuming sync after suspension due to unsynced keychain", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke_127;
  block[3] = &unk_1E7DB56F0;
  block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __66__SGDCloudKitSync_pauseIfNeededAndReturnRetryEligibilityForError___block_invoke_127(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

uint64_t __41__SGDCloudKitSync_suspendAndResumeAfter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

+ (id)_callbackQueue
{
  if (_callbackQueue__pasOnceToken6 != -1)
    dispatch_once(&_callbackQueue__pasOnceToken6, &__block_literal_global_121);
  return (id)_callbackQueue__pasExprOnceResult;
}

+ (id)_sharedInstanceConfigurationQueue
{
  if (_sharedInstanceConfigurationQueue__pasOnceToken87 != -1)
    dispatch_once(&_sharedInstanceConfigurationQueue__pasOnceToken87, &__block_literal_global_194);
  return (id)_sharedInstanceConfigurationQueue__pasExprOnceResult;
}

+ (id)sharedInstance
{
  NSObject *v2;

  objc_msgSend(a1, "_sharedInstanceConfigurationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_196_16400);

  return (id)_SGDCloudKitSyncSharedInstance;
}

+ (void)setSharedInstanceConfigurationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_sharedInstanceConfigurationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SGDCloudKitSync_setSharedInstanceConfigurationBlock___block_invoke;
  block[3] = &unk_1E7DADAD8;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (id)apsEnvironmentStringForContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D19830];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke;
  v9[3] = &unk_1E7DADC28;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureForObject:withKey:onCreate:", v6, a2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_2;
  v12[3] = &unk_1E7DADC00;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v3, "wait:", v12);
  v5 = (void *)xpc_copy_entitlement_for_self();
  if (!v5)
  {
    v7 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGCKAPSEnvironmentDomain"), 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fail:", v9);
    goto LABEL_7;
  }
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "compare:options:", *MEMORY[0x1E0C94968], 1))
    goto LABEL_6;
  v8 = *(void **)(a1 + 32);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_232;
  v10[3] = &unk_1E7DADC00;
  v11 = v3;
  objc_msgSend(v8, "serverPreferredPushEnvironmentWithCompletionHandler:", v10);
  v9 = v11;
LABEL_7:

}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGCK Got APS environment string: %@ (error: %@, container: %@)", (uint8_t *)&v9, 0x20u);
  }

}

void __52__SGDCloudKitSync_apsEnvironmentStringForContainer___block_invoke_232(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGCK Error when getting preferred push env. Defaulting to prod instead. Error: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v8 = *MEMORY[0x1E0CFE130];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = a2;
  }
  objc_msgSend(v7, "succeed:", v8);

}

void __55__SGDCloudKitSync_setSharedInstanceConfigurationBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];
  uint8_t v10[16];
  uint8_t v11[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGCK Setting configuration block...", v11, 2u);
  }

  v3 = _SGDCloudKitSyncSharedInstance;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK The shared instance already exists, so the configuration block will run immediately.", v10, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK Done running the completion block immediately from +[SGCK setSharedInstanceConfigurationBlock:]", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK The shared instance doesn't exist yet, so the configuration block won't run until it's instantiated.", v8, 2u);
    }

    v7 = MEMORY[0x1C3BD5158](*(_QWORD *)(a1 + 32));
    v6 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
    _SGDCloudKitSyncSharedInstanceConfigurationBlock = v7;
  }

}

void __33__SGDCloudKitSync_sharedInstance__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (!_SGDCloudKitSyncSharedInstance)
  {
    sgLogHandle();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v0, OS_LOG_TYPE_DEBUG, "SGCK Instantiating +[SGCK sharedInstance]", buf, 2u);
    }

    v1 = objc_opt_new();
    v2 = (void *)_SGDCloudKitSyncSharedInstance;
    _SGDCloudKitSyncSharedInstance = v1;

    v3 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v9 = 0;
        _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK Running configuration block via +[SGCK sharedInstance] (the configuration block was specified prior to sharedInstance being called for the first time)", v9, 2u);
      }

      (*(void (**)(uint64_t, uint64_t))(_SGDCloudKitSyncSharedInstanceConfigurationBlock + 16))(_SGDCloudKitSyncSharedInstanceConfigurationBlock, _SGDCloudKitSyncSharedInstance);
      sgLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGCK Configuration block has completed from within +[SGCK sharedInstance]'s first invocation. Setting the block to nil.", v8, 2u);
      }

      v4 = _SGDCloudKitSyncSharedInstanceConfigurationBlock;
      _SGDCloudKitSyncSharedInstanceConfigurationBlock = 0;
    }
    else if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGCK No configuration block has been specified before the first invocation of +[SGCK sharedInstance]. If a configuration block is set later on, it will be run immediately.", v7, 2u);
    }

  }
}

void __52__SGDCloudKitSync__sharedInstanceConfigurationQueue__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("SGDCloudKitSync_sharedInstanceConfigurationQueue", v1);
  v3 = (void *)_sharedInstanceConfigurationQueue__pasExprOnceResult;
  _sharedInstanceConfigurationQueue__pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __33__SGDCloudKitSync__callbackQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGDCloudKitSync-callbacks", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_callbackQueue__pasExprOnceResult;
  _callbackQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
