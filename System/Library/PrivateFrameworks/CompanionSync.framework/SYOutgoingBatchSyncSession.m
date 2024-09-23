@implementation SYOutgoingBatchSyncSession

- (SYOutgoingBatchSyncSession)initWithService:(id)a3
{
  id v4;
  SYOutgoingBatchSyncSession *v5;
  SYOutgoingBatchSyncSession *v6;
  uint64_t v7;
  NSMutableIndexSet *ackedBatchIndices;
  NSObject *v9;
  os_activity_t v10;
  OS_os_activity *sessionActivity;
  _SYMessageTimerTable *v12;
  void *v13;
  uint64_t v14;
  _SYMessageTimerTable *timers;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *changeFetcherQueue;
  void *v22;
  void *v23;
  SYOutgoingBatchSyncSession *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SYOutgoingBatchSyncSession;
  v5 = -[SYSession initWithService:](&v32, sel_initWithService_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    v7 = objc_opt_new();
    ackedBatchIndices = v6->_ackedBatchIndices;
    v6->_ackedBatchIndices = (NSMutableIndexSet *)v7;

    objc_msgSend(v4, "serviceActivity");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _os_activity_create(&dword_211704000, "SYSession (v1 Outgoing Batched)", v9, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v10;

    objc_initWeak(&location, v6);
    v12 = [_SYMessageTimerTable alloc];
    -[SYSession queue](v6, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __46__SYOutgoingBatchSyncSession_initWithService___block_invoke;
    v29 = &unk_24CC65698;
    objc_copyWeak(&v30, &location);
    v14 = -[_SYMessageTimerTable initWithQueue:timerCallback:](v12, "initWithQueue:timerCallback:", v13, &v26);
    timers = v6->_timers;
    v6->_timers = (_SYMessageTimerTable *)v14;

    objc_msgSend(v4, "name", v26, v27, v28, v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR(" Change Enqueuer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    v20 = dispatch_queue_create((const char *)objc_msgSend(v19, "UTF8String"), 0);
    changeFetcherQueue = v6->_changeFetcherQueue;
    v6->_changeFetcherQueue = (OS_dispatch_queue *)v20;

    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v6, "setIdentifier:", v23);

    v24 = v6;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __46__SYOutgoingBatchSyncSession_initWithService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  os_activity_t *WeakRetained;
  os_activity_t *v7;
  os_activity_scope_state_s v8;

  v5 = a3;
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(WeakRetained[33], &v8);
    -[os_activity_t _messageExpiredWithSeqno:identifier:](v7, "_messageExpiredWithSeqno:identifier:", a2, v5);
    os_activity_scope_leave(&v8);
  }

}

- (unsigned)state
{
  SYOutgoingBatchSyncSession *v2;
  unsigned int state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)setState:(unsigned int)a3
{
  SYOutgoingBatchSyncSession *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 1024;
    v11 = a3;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state to %{companionsync:SYSessionState}d", (uint8_t *)&v8, 0x12u);

  }
  v4->_state = a3;
  dispatch_source_merge_data((dispatch_source_t)v4->_stateUpdateSource, 1uLL);
  objc_sync_exit(v4);

}

- (void)_setStateQuietly:(unsigned int)a3
{
  SYOutgoingBatchSyncSession *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 1024;
    v11 = a3;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) to %{companionsync:SYSessionState}d", (uint8_t *)&v8, 0x12u);

  }
  v4->_state = a3;
  objc_sync_exit(v4);

}

- (BOOL)isResetSync
{
  return 1;
}

- (BOOL)isSending
{
  return 1;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (double)remainingSessionTime
{
  double v3;
  double sessionStartTime;

  -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
  if (v3 == 0.0)
    return 1.79769313e308;
  sessionStartTime = self->_sessionStartTime;
  if (sessionStartTime > 0.0)
    return v3 + sessionStartTime - CFAbsoluteTimeGetCurrent();
  return 60.0;
}

- (void)_setupChangeConcurrency
{
  NSObject *v3;
  _SYCountedSemaphore *v4;
  _SYCountedSemaphore *changeConcurrencySemaphore;
  OS_os_activity *v6;
  OS_os_activity *changeWaitActivity;

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"))
  {
    if ((-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages") & 0x8000000000000000) == 0)
    {
      v4 = -[_SYCountedSemaphore initWithCount:]([_SYCountedSemaphore alloc], "initWithCount:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
      changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
      self->_changeConcurrencySemaphore = v4;

      v6 = (OS_os_activity *)_os_activity_create(&dword_211704000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
      changeWaitActivity = self->_changeWaitActivity;
      self->_changeWaitActivity = v6;

    }
  }
}

- (void)_waitForMessageWindow
{
  NSObject *v3;
  NSObject *changeFetcherQueue;
  _QWORD block[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_changeConcurrencySemaphore)
  {
    changeFetcherQueue = self->_changeFetcherQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    -[SYOutgoingBatchSyncSession _fetchNextBatch](self, "_fetchNextBatch");
  }
}

void __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  NSObject *v6;
  _QWORD block[5];
  os_activity_scope_state_s v8;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 256), &state);
  objc_msgSend(*(id *)(a1 + 32), "perMessageTimeout");
  v3 = v2;
  if (v2 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultMessageTimeout");
    v3 = v5;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "waitWithTimeout:", v3 + v3))
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v8);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke_2;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

    os_activity_scope_leave(&v8);
  }
  os_activity_scope_leave(&state);
}

uint64_t __51__SYOutgoingBatchSyncSession__waitForMessageWindow__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNextBatch");
}

- (void)_fetchNextBatch
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[4];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v5 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke;
  v25[3] = &unk_24CC656C0;
  v25[4] = self;
  v27 = v28;
  v6 = v4;
  v26 = v6;
  v7 = (void *)MEMORY[0x212BE0F2C](v25);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[SYSession targetQueue](self, "targetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke_73;
  block[3] = &unk_24CC656E8;
  v13 = &v15;
  block[4] = self;
  v9 = v7;
  v12 = v9;
  v14 = &v19;
  dispatch_sync(v8, block);

  v10 = *((unsigned int *)v16 + 6);
  if ((v10 - 1) >= 2)
  {
    if ((_DWORD)v10 == 5)
    {
      -[SYSession setError:](self, "setError:", v20[5]);
      self->_errorIsLocal = 1;
      v10 = *((unsigned int *)v16 + 6);
    }
    -[SYOutgoingBatchSyncSession setState:](self, "setState:", v10);
  }
  else
  {
    -[SYOutgoingBatchSyncSession _sendSyncBatch:nextState:](self, "_sendSyncBatch:nextState:", v6);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(v28, 8);
}

uint64_t __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s state;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &state);
  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeSYChangeForBackwardCompatibility:protocolVersion:", v3, objc_msgSend(*(id *)(a1 + 32), "protocolVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "serializer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v13 = objc_alloc(MEMORY[0x24BDD1540]);
      v23[0] = CFSTR("SYDelegateProtocolName");
      NSStringFromProtocol((Protocol *)&unk_254AC3ED8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = CFSTR("SYDelegateMethodNames");
      v24[0] = v14;
      NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      NSStringFromSelector(sel_dataWithSYObject_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v13, "initWithSYError:userInfo:", 2020, v18);
      objc_msgSend(*(id *)(a1 + 32), "setError:", v19);

      objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
      v11 = 0;
LABEL_9:
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithSYObject:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v11, "length");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 0x200000uLL
    && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  v12 = 1;
LABEL_10:

  os_activity_scope_leave(&state);
  return v12;
}

void __45__SYOutgoingBatchSyncSession__fetchNextBatch__block_invoke_73(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v6 = objc_msgSend(v3, "syncSession:enqueueChanges:error:", v4, v5, &v9);
  v7 = v9;
  v8 = v9;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);

}

- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  int v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SYSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_opt_new();
    -[SYSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "_newMessageHeader");
    objc_msgSend(v8, "setHeader:", v10);

    -[SYSession identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSyncID:", v11);

    ++self->_batchIndex;
    objc_msgSend(v8, "setChunkIndex:");
    objc_msgSend(v8, "setObjects:", v6);
    -[SYOutgoingBatchSyncSession setState:](self, "setState:", 8);
    objc_msgSend(v8, "header");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "sequenceNumber");

    -[SYOutgoingBatchSyncSession _setMessageTimerForSeqno:](self, "_setMessageTimerForSeqno:", v13);
    objc_msgSend(v9, "syncEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SYSession priority](self, "priority");
    -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __55__SYOutgoingBatchSyncSession__sendSyncBatch_nextState___block_invoke;
    v18[3] = &unk_24CC65710;
    v18[4] = self;
    v18[5] = v13;
    v19 = v4;
    objc_msgSend(v14, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v8, 4, v15, v16, v17, v18);

  }
  else
  {
    -[SYOutgoingBatchSyncSession setState:](self, "setState:", v4);
    -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
  }

}

void __55__SYOutgoingBatchSyncSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  os_activity_scope_state_s v10;

  v7 = a3;
  v8 = a4;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v10);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (a2)
  {
    objc_msgSend(v9, "setIdentifier:forSequenceNumber:", v7, *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 8)
      objc_msgSend(*(id *)(a1 + 32), "setState:", *(unsigned int *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v9, "cancelTimerForSequenceNumber:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 276) = 1;
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "signal");
  }
  os_activity_scope_leave(&v10);

}

- (void)_sendSyncCompleteAndRunBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 errorIsLocal;
  void *v13;
  NSObject *v14;
  void *v15;
  SYErrorInfo *v16;
  void *v17;
  SYErrorInfo *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_INFO, "Sending end-session message", buf, 2u);
  }
  v7 = (void *)objc_opt_new();
  -[SYSession service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "_newMessageHeader");
  objc_msgSend(v7, "setHeader:", v9);

  -[SYSession identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSyncID:", v10);

  -[SYSession error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    errorIsLocal = self->_errorIsLocal;

    if (errorIsLocal)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[SYSession error](self, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "Attaching error to end-session: %@", buf, 0xCu);

      }
      v16 = [SYErrorInfo alloc];
      -[SYSession error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SYErrorInfo initWithError:](v16, "initWithError:", v17);
      objc_msgSend(v7, "setError:", v18);

    }
  }
  v19 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v7, "header");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "sequenceNumber");

  -[SYOutgoingBatchSyncSession _setMessageTimerForSeqno:](self, "_setMessageTimerForSeqno:", v21);
  objc_msgSend(v8, "syncEngine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SYSession priority](self, "priority");
  -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __59__SYOutgoingBatchSyncSession__sendSyncCompleteAndRunBlock___block_invoke;
  v27[3] = &unk_24CC65738;
  v28 = v19;
  v29 = v21;
  v27[4] = self;
  v26 = v19;
  objc_msgSend(v22, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v7, 5, v23, v24, v25, v27);

  self->_hasSentEnd = 1;
}

void __59__SYOutgoingBatchSyncSession__sendSyncCompleteAndRunBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  os_activity_scope_state_s v11;

  v7 = a3;
  v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v11);
  v9 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v9, "setState:", 7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setIdentifier:forSequenceNumber:", v7, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v9, "setError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "cancelTimerForSequenceNumber:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "signal");
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, *(dispatch_block_t *)(a1 + 40));

  }
  os_activity_scope_leave(&v11);

}

- (void)_sendSyncCancelled
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SYErrorInfo *v8;
  void *v9;
  SYErrorInfo *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_opt_new();
  -[SYSession service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "_newMessageHeader");
  objc_msgSend(v4, "setHeader:", v6);

  -[SYSession identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyncID:", v7);

  v8 = [SYErrorInfo alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
  v10 = -[SYErrorInfo initWithError:](v8, "initWithError:", v9);
  objc_msgSend(v4, "setError:", v10);

  objc_msgSend(v4, "header");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sequenceNumber");

  -[SYOutgoingBatchSyncSession _setMessageTimerForSeqno:](self, "_setMessageTimerForSeqno:", v12);
  objc_msgSend(v5, "syncEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SYSession priority](self, "priority");
  -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke;
  v17[3] = &unk_24CC65760;
  v17[4] = self;
  v17[5] = v12;
  objc_msgSend(v13, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v4, 5, v14, v15, v16, v17);

  self->_hasSentEnd = 1;
}

void __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &state);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "cancelTimerForSequenceNumber:", *(_QWORD *)(a1 + 40));
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke_2;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  }
  os_activity_scope_leave(&state);

}

uint64_t __48__SYOutgoingBatchSyncSession__sendSyncCancelled__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
}

- (void)_sendSyncRestart
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SYOutgoingBatchSyncSession canRestart](self, "canRestart"))
  {
    -[NSMutableIndexSet removeAllIndexes](self->_ackedBatchIndices, "removeAllIndexes");
    self->_batchIndex = 0;
    -[SYOutgoingBatchSyncSession _sendSyncStart](self, "_sendSyncStart");
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("This session does not support being restarted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSYError:userInfo:", 2008, v5);
    -[SYSession setError:](self, "setError:", v6);

    self->_errorIsLocal = 1;
    -[SYOutgoingBatchSyncSession setState:](self, "setState:", 5);
  }
}

- (void)_sendSyncStart
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(v4, "_newMessageHeader");
  objc_msgSend(v5, "setHeader:", v6);

  -[SYSession identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSyncID:", v7);

  objc_msgSend(v4, "syncEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYSession priority](self, "priority");
  -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SYOutgoingBatchSyncSession__sendSyncStart__block_invoke;
  v12[3] = &unk_24CC65788;
  v12[4] = self;
  objc_msgSend(v8, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v5, 3, v9, v10, v11, v12);

}

void __44__SYOutgoingBatchSyncSession__sendSyncStart__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  os_activity_scope_state_s v11;

  v7 = a3;
  v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v11);
  v9 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    v9[28] = 0;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v9, "setError:", v8);
    v10 = 5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", v10);
  os_activity_scope_leave(&v11);

}

- (void)_notifySessionComplete
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  -[SYSession targetQueue](self, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SYOutgoingBatchSyncSession__notifySessionComplete__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(v4, block);

  -[SYSession service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionDidEnd:withError:", self, v6);

  -[SYSession didCompleteSession](self, "didCompleteSession");
}

void __52__SYOutgoingBatchSyncSession__notifySessionComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncSession:didEndWithError:", v4, v5);

}

- (void)_sessionComplete
{
  NSObject *sessionTimer;
  OS_dispatch_source *v4;
  _QWORD v5[5];

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    v4 = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  if (self->_errorIsLocal && !self->_hasSentEnd)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __46__SYOutgoingBatchSyncSession__sessionComplete__block_invoke;
    v5[3] = &unk_24CC65418;
    v5[4] = self;
    -[SYOutgoingBatchSyncSession _sendSyncCompleteAndRunBlock:](self, "_sendSyncCompleteAndRunBlock:", v5);
  }
  else
  {
    -[SYOutgoingBatchSyncSession _notifySessionComplete](self, "_notifySessionComplete");
  }
}

uint64_t __46__SYOutgoingBatchSyncSession__sessionComplete__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setStateQuietly:", 5);
  return objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
}

- (void)_messageExpiredWithSeqno:(unint64_t)a3 identifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
    -[SYOutgoingBatchSyncSession _messageExpiredWithSeqno:identifier:].cold.1((uint64_t)v6, a3, v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
  -[SYSession setError:](self, "setError:", v8);

  -[SYOutgoingBatchSyncSession setState:](self, "setState:", 5);
}

- (void)_processNextState
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  switch(-[SYOutgoingBatchSyncSession state](self, "state"))
  {
    case 1u:
      -[SYOutgoingBatchSyncSession _waitForMessageWindow](self, "_waitForMessageWindow");
      break;
    case 2u:
      -[SYOutgoingBatchSyncSession _sendSyncCompleteAndRunBlock:](self, "_sendSyncCompleteAndRunBlock:", 0);
      break;
    case 3u:
      self->_cancelled = 1;
      -[SYOutgoingBatchSyncSession _sendSyncCancelled](self, "_sendSyncCancelled");
      break;
    case 4u:
      -[SYOutgoingBatchSyncSession _sendSyncRestart](self, "_sendSyncRestart");
      break;
    case 5u:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v4 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[SYSession error](self, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %@", buf, 0x16u);

      }
      goto LABEL_11;
    case 9u:
LABEL_11:
      -[SYOutgoingBatchSyncSession _sessionComplete](self, "_sessionComplete");
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v8);
}

- (void)_installTimers
{
  void *v3;
  double v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *sessionTimer;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __44__SYOutgoingBatchSyncSession__installTimers__block_invoke;
  v14 = &unk_24CC655F8;
  objc_copyWeak(&v15, &location);
  v3 = (void *)MEMORY[0x212BE0F2C](&v11);
  self->_sessionStartTime = CFAbsoluteTimeGetCurrent();
  -[SYSession fullSessionTimeout](self, "fullSessionTimeout", v11, v12, v13, v14);
  if (v4 != 0.0)
  {
    -[SYSession queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v6;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v3);
    v8 = self->_sessionTimer;
    -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
    v10 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __44__SYOutgoingBatchSyncSession__installTimers__block_invoke(uint64_t a1)
{
  os_activity_t *WeakRetained;
  os_activity_t *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_activity_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v7.opaque[0] = 0;
    v7.opaque[1] = 0;
    os_activity_scope_enter(WeakRetained[33], &v7);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __44__SYOutgoingBatchSyncSession__installTimers__block_invoke_cold_1(v5, buf, v3);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
    -[os_activity_t setError:](v2, "setError:", v6);

    -[os_activity_t setState:](v2, "setState:", 5);
    os_activity_scope_leave(&v7);
  }

}

- (void)_setMessageTimerForSeqno:(unint64_t)a3
{
  double v5;
  _SYMessageTimerTable *timers;
  void *v7;
  id v8;

  -[SYSession perMessageTimeout](self, "perMessageTimeout");
  if (v5 != 0.0)
  {
    timers = self->_timers;
    v7 = (void *)MEMORY[0x24BDBCE60];
    -[SYSession perMessageTimeout](self, "perMessageTimeout");
    objc_msgSend(v7, "dateWithTimeIntervalSinceNow:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_SYMessageTimerTable addTimerWithFireDate:forSequenceNumber:](timers, "addTimerWithFireDate:forSequenceNumber:", v8, a3);

  }
}

- (void)_installStateListener
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *stateUpdateSource;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYSession queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v4);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v5;

  objc_initWeak(&location, self);
  v7 = self->_stateUpdateSource;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SYOutgoingBatchSyncSession__installStateListener__block_invoke;
  v8[3] = &unk_24CC655F8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__SYOutgoingBatchSyncSession__installStateListener__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_processNextState");
    WeakRetained = v2;
  }

}

- (void)start:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  os_activity_scope_state_s state;
  _QWORD v30[5];
  id v31;
  _QWORD block[5];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  -[SYSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SYSession serializer](self, "serializer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {

    }
    else
    {
      -[SYSession serializer](self, "serializer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
        v19 = objc_alloc(MEMORY[0x24BDD1540]);
        v39[0] = CFSTR("SYDelegateProtocolName");
        NSStringFromProtocol((Protocol *)&unk_254AC3ED8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = CFSTR("SYDelegateMethodNames");
        v40[0] = v20;
        NSStringFromSelector(sel_encodeSYChangeForBackwardCompatibility_protocolVersion_);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v21;
        NSStringFromSelector(sel_dataWithSYObject_);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v19, "initWithSYError:userInfo:", 2020, v24);

        -[SYSession queue](self, "queue");
        v26 = objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke_2;
        v30[3] = &unk_24CC652B8;
        v30[4] = self;
        v31 = v25;
        v27 = v25;
        dispatch_async(v26, v30);

        v4[2](v4, 0, v27);
        goto LABEL_12;
      }
    }
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[SYSession identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);

    }
    -[SYSession queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke_84;
    v28[3] = &unk_24CC65418;
    v28[4] = self;
    dispatch_async(v18, v28);

    os_activity_scope_leave(&state);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v41 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("You cannot start an SYSession without a delegate.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSYError:userInfo:", 2001, v8);

    -[SYSession queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__SYOutgoingBatchSyncSession_start___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v33 = v9;
    v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:

}

void __36__SYOutgoingBatchSyncSession_start___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
  os_activity_scope_leave(&v2);
}

void __36__SYOutgoingBatchSyncSession_start___block_invoke_2(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 264), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
  os_activity_scope_leave(&v2);
}

uint64_t __36__SYOutgoingBatchSyncSession_start___block_invoke_84(uint64_t a1)
{
  os_activity_t v2;
  uint64_t v3;
  void *v4;

  v2 = _os_activity_create(&dword_211704000, "SYSession (Outgoing)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 264);
  *(_QWORD *)(v3 + 264) = v2;

  objc_msgSend(*(id *)(a1 + 32), "didStartSession");
  objc_msgSend(*(id *)(a1 + 32), "_installStateListener");
  objc_msgSend(*(id *)(a1 + 32), "_installTimers");
  objc_msgSend(*(id *)(a1 + 32), "_setupChangeConcurrency");
  return objc_msgSend(*(id *)(a1 + 32), "_sendSyncStart");
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  os_activity_scope_state_s v8;

  v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("SYErrorDomain")))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != -128)
  {
LABEL_5:
    -[SYSession setError:](self, "setError:", v4);
    v7 = 5;
    goto LABEL_6;
  }
  v7 = 3;
LABEL_6:
  -[SYOutgoingBatchSyncSession setState:](self, "setState:", v7);
  os_activity_scope_leave(&v8);

}

- (BOOL)_handleBatchAck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_activity_scope_state_s v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v15);
  objc_msgSend(v6, "syncID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    -[NSMutableIndexSet addIndex:](self->_ackedBatchIndices, "addIndex:", objc_msgSend(v6, "chunkIndex"));
    -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
    if (objc_msgSend(v6, "hasError"))
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorFromSYErrorInfo:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYBatchChunkAck: %@", buf, 0xCu);
      }
      -[SYSession setError:](self, "setError:", v12);
      -[SYOutgoingBatchSyncSession setState:](self, "setState:", 5);

    }
  }
  else if (a4)
  {
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2006, 0);
  }
  os_activity_scope_leave(&v15);

  return v9;
}

- (BOOL)_handleBatchSyncEndResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v18);
  objc_msgSend(v6, "syncID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    if (objc_msgSend(v6, "hasError"))
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorFromSYErrorInfo:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncEndResponse: %@", buf, 0xCu);
      }
      -[SYSession setError:](self, "setError:", v12);
      -[SYOutgoingBatchSyncSession setState:](self, "setState:", 5);

    }
    else
    {
      if (-[NSMutableIndexSet countOfIndexesInRange:](self->_ackedBatchIndices, "countOfIndexesInRange:", 0, self->_batchIndex) == self->_batchIndex)
      {
        v14 = 9;
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v15 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
          -[SYOutgoingBatchSyncSession _handleBatchSyncEndResponse:error:].cold.1((uint64_t *)&self->_batchIndex, (uint64_t *)&self->_ackedBatchIndices, v15);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 2012, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYSession setError:](self, "setError:", v16);

        v14 = 5;
      }
      -[SYOutgoingBatchSyncSession setState:](self, "setState:", v14);
    }
  }
  else if (a4)
  {
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2006, 0);
  }
  os_activity_scope_leave(&v18);

  return v9;
}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  -[_SYMessageTimerTable cancelTimerForIdentifier:](self->_timers, "cancelTimerForIdentifier:", a3, a4);
}

- (BOOL)canRestart
{
  return self->_canRestart;
}

- (void)setCanRestart:(BOOL)a3
{
  self->_canRestart = a3;
}

- (BOOL)canRollback
{
  return self->_canRollback;
}

- (void)setCanRollback:(BOOL)a3
{
  self->_canRollback = a3;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_ackedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

- (void)_messageExpiredWithSeqno:(os_log_t)log identifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Send timed out for message with sequence number %llu, identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

void __44__SYOutgoingBatchSyncSession__installTimers__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "%{public}@ session timeout expired", buf, 0xCu);

}

- (void)_handleBatchSyncEndResponse:(os_log_t)log error:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109378;
  v5[1] = v3;
  v6 = 2114;
  v7 = v4;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Some sync batches were not acked. We sent {0-%u}, acked %{public}@", (uint8_t *)v5, 0x12u);
}

@end
