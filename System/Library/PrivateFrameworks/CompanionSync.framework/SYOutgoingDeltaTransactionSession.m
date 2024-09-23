@implementation SYOutgoingDeltaTransactionSession

- (SYOutgoingDeltaTransactionSession)initWithService:(id)a3
{
  id v4;
  SYOutgoingDeltaTransactionSession *v5;
  SYOutgoingDeltaTransactionSession *v6;
  NSObject *v7;
  os_activity_t v8;
  OS_os_activity *sessionActivity;
  _SYMessageTimerTable *v10;
  void *v11;
  uint64_t v12;
  _SYMessageTimerTable *timers;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *changeFetcherQueue;
  void *v20;
  void *v21;
  SYOutgoingDeltaTransactionSession *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SYOutgoingDeltaTransactionSession;
  v5 = -[SYSession initWithService:](&v30, sel_initWithService_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    objc_msgSend(v4, "serviceActivity");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _os_activity_create(&dword_211704000, "SYSession (Outgoing v1 Delta)", v7, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v8;

    objc_initWeak(&location, v6);
    v10 = [_SYMessageTimerTable alloc];
    -[SYSession queue](v6, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __53__SYOutgoingDeltaTransactionSession_initWithService___block_invoke;
    v27 = &unk_24CC65698;
    objc_copyWeak(&v28, &location);
    v12 = -[_SYMessageTimerTable initWithQueue:timerCallback:](v10, "initWithQueue:timerCallback:", v11, &v24);
    timers = v6->_timers;
    v6->_timers = (_SYMessageTimerTable *)v12;

    objc_msgSend(v4, "name", v24, v25, v26, v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(" Change Enqueuer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    changeFetcherQueue = v6->_changeFetcherQueue;
    v6->_changeFetcherQueue = (OS_dispatch_queue *)v18;

    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v6, "setIdentifier:", v21);

    v22 = v6;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__SYOutgoingDeltaTransactionSession_initWithService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_messageExpiredWithSeqno:identifier:", a2, v7);

}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  SYOutgoingDeltaTransactionSession *v8;
  NSObject *stateUpdateSource;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 1024;
    v14 = a3;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state to %{companionsync:SYSessionState}d", buf, 0x12u);

  }
  v8 = self;
  objc_sync_enter(v8);
  v8->_state = a3;
  objc_sync_exit(v8);

  stateUpdateSource = v8->_stateUpdateSource;
  if (stateUpdateSource && !dispatch_source_testcancel((dispatch_source_t)v8->_stateUpdateSource))
    dispatch_source_merge_data(stateUpdateSource, 1uLL);
  os_activity_scope_leave(&v10);
}

- (void)_setStateQuietly:(unsigned int)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a3;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) to %{companionsync:SYSessionState}d", buf, 0x12u);

  }
  self->_state = a3;
  os_activity_scope_leave(&v8);
}

- (BOOL)isResetSync
{
  return 0;
}

- (BOOL)isSending
{
  return 1;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (void)_setupChangeConcurrency
{
  _SYCountedSemaphore *v3;
  _SYCountedSemaphore *changeConcurrencySemaphore;
  OS_os_activity *v5;
  OS_os_activity *changeWaitActivity;

  if (-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"))
  {
    if ((-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages") & 0x8000000000000000) == 0)
    {
      v3 = -[_SYCountedSemaphore initWithCount:]([_SYCountedSemaphore alloc], "initWithCount:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
      changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
      self->_changeConcurrencySemaphore = v3;

      v5 = (OS_os_activity *)_os_activity_create(&dword_211704000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
      changeWaitActivity = self->_changeWaitActivity;
      self->_changeWaitActivity = v5;

    }
  }
}

- (void)_waitForMessageWindow
{
  NSObject *changeFetcherQueue;
  _QWORD block[5];

  if (self->_changeConcurrencySemaphore)
  {
    changeFetcherQueue = self->_changeFetcherQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    -[SYOutgoingDeltaTransactionSession _fetchNextBatch](self, "_fetchNextBatch");
  }
}

void __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke(uint64_t a1)
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
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 248), &state);
  objc_msgSend(*(id *)(a1 + 32), "perMessageTimeout");
  v3 = v2;
  if (v2 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultMessageTimeout");
    v3 = v5;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "waitWithTimeout:", v3 + v3))
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 216), &v8);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke_2;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

    os_activity_scope_leave(&v8);
  }
  os_activity_scope_leave(&state);
}

uint64_t __58__SYOutgoingDeltaTransactionSession__waitForMessageWindow__block_invoke_2(uint64_t a1)
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
  v25[2] = __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke;
  v25[3] = &unk_24CC656C0;
  v25[4] = self;
  v27 = v28;
  v6 = v4;
  v26 = v6;
  v7 = (void *)MEMORY[0x212BE0F2C](v25);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  -[SYSession targetQueue](self, "targetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke_8;
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
      v10 = *((unsigned int *)v16 + 6);
    }
    -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", v10);
  }
  else
  {
    -[SYOutgoingDeltaTransactionSession _sendSyncBatch:nextState:](self, "_sendSyncBatch:nextState:", v6);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(v28, 8);
}

uint64_t __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  os_activity_scope_state_s v9;

  v3 = a2;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 216), &v9);
  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYChange changeWithChangeObject:serializer:encodeUsingVersion:](SYChange, "changeWithChangeObject:serializer:encodeUsingVersion:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v6, "length");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 0x200000uLL
    && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v7 = 1;
  }

  os_activity_scope_leave(&v9);
  return v7;
}

void __52__SYOutgoingDeltaTransactionSession__fetchNextBatch__block_invoke_8(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  int v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SYSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "count"))
  {
    -[SYSession service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(v8, "_newMessageHeader");
    objc_msgSend(v9, "setHeader:", v10);

    objc_msgSend(v9, "setChanges:", v6);
    -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", 8);
    objc_msgSend(v9, "header");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "sequenceNumber");

    -[SYOutgoingDeltaTransactionSession _setMessageTimerForSeqno:](self, "_setMessageTimerForSeqno:", v12);
    objc_msgSend(v8, "syncEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SYSession priority](self, "priority");
    -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__SYOutgoingDeltaTransactionSession__sendSyncBatch_nextState___block_invoke;
    v17[3] = &unk_24CC65710;
    v17[4] = self;
    v17[5] = v12;
    v18 = v4;
    objc_msgSend(v13, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v9, 6, v14, v15, v16, v17);

  }
  else
  {
    -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
    -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", v4);
  }

}

void __62__SYOutgoingDeltaTransactionSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  os_activity_scope_state_s v10;

  v7 = a3;
  v8 = a4;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 216), &v10);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
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
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "signal");
  }
  os_activity_scope_leave(&v10);

}

- (void)_notifySessionComplete
{
  NSObject *v3;
  NSObject *stateUpdateSource;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
    dispatch_source_cancel(stateUpdateSource);
  -[SYSession targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SYOutgoingDeltaTransactionSession__notifySessionComplete__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(v5, block);

  -[SYSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionDidEnd:withError:", self, v7);

  -[SYSession didCompleteSession](self, "didCompleteSession");
}

void __59__SYOutgoingDeltaTransactionSession__notifySessionComplete__block_invoke(uint64_t a1)
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

  -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", 5);
}

- (void)_processNextState
{
  NSObject *v3;
  SYOutgoingDeltaTransactionSession *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v8);
  v4 = self;
  objc_sync_enter(v4);
  LODWORD(v3) = v4->_state;
  objc_sync_exit(v4);

  switch((int)v3)
  {
    case 1:
      -[SYOutgoingDeltaTransactionSession _waitForMessageWindow](v4, "_waitForMessageWindow");
      break;
    case 2:
      -[SYOutgoingDeltaTransactionSession setState:](v4, "setState:", 9);
      break;
    case 4:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
      -[SYSession setError:](v4, "setError:", v5);

      break;
    case 5:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[SYSession error](v4, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "SYSession entered error state. Error = %@", buf, 0xCu);

      }
      goto LABEL_10;
    case 9:
LABEL_10:
      -[SYOutgoingDeltaTransactionSession _notifySessionComplete](v4, "_notifySessionComplete");
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v8);
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
  OS_dispatch_source *v4;
  OS_dispatch_source *stateUpdateSource;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v3);
  stateUpdateSource = self->_stateUpdateSource;
  self->_stateUpdateSource = v4;

  objc_initWeak(&location, self);
  v6 = self->_stateUpdateSource;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SYOutgoingDeltaTransactionSession__installStateListener__block_invoke;
  v7[3] = &unk_24CC655F8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SYOutgoingDeltaTransactionSession__installStateListener__block_invoke(uint64_t a1)
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
        v30[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke_2;
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
    v28[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke_79;
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
    block[2] = __43__SYOutgoingDeltaTransactionSession_start___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v33 = v9;
    v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:

}

void __43__SYOutgoingDeltaTransactionSession_start___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 216), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
  os_activity_scope_leave(&v2);
}

void __43__SYOutgoingDeltaTransactionSession_start___block_invoke_2(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 216), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifySessionComplete");
  os_activity_scope_leave(&v2);
}

uint64_t __43__SYOutgoingDeltaTransactionSession_start___block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didStartSession");
  objc_msgSend(*(id *)(a1 + 32), "_installStateListener");
  objc_msgSend(*(id *)(a1 + 32), "_setupChangeConcurrency");
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
}

- (void)cancelWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SYErrorDomain")))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v7, "code");

  if (v5 != -128)
  {
LABEL_5:
    -[SYSession setError:](self, "setError:", v7);
    v6 = 5;
    goto LABEL_6;
  }
  self->_cancelled = 1;
  v6 = 3;
LABEL_6:
  -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", v6);

}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  -[_SYMessageTimerTable cancelTimerForIdentifier:](self->_timers, "cancelTimerForIdentifier:", a3, a4);
  if (!-[_SYMessageTimerTable timerCount](self->_timers, "timerCount")
    && -[SYOutgoingDeltaTransactionSession state](self, "state") == 7)
  {
    -[SYOutgoingDeltaTransactionSession setState:](self, "setState:", 9);
  }
}

- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal", a3, a4);
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
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

@end
