@implementation SYOutgoingSyncAllObjectsSession

- (SYOutgoingSyncAllObjectsSession)initWithService:(id)a3
{
  id v4;
  SYOutgoingSyncAllObjectsSession *v5;
  SYOutgoingSyncAllObjectsSession *v6;
  NSObject *v7;
  os_activity_t v8;
  OS_os_activity *sessionActivity;
  uint64_t v10;
  NSMutableArray *changesToSend;
  void *v12;
  void *v13;
  SYOutgoingSyncAllObjectsSession *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SYOutgoingSyncAllObjectsSession;
  v5 = -[SYSession initWithService:](&v16, sel_initWithService_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    objc_msgSend(v4, "serviceActivity");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _os_activity_create(&dword_211704000, "SYSession (v1 Outgoing AllObjects)", v7, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v6->_sessionActivity;
    v6->_sessionActivity = (OS_os_activity *)v8;

    v10 = objc_opt_new();
    changesToSend = v6->_changesToSend;
    v6->_changesToSend = (NSMutableArray *)v10;

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v6, "setIdentifier:", v13);

    v14 = v6;
  }

  return v6;
}

- (unsigned)state
{
  SYOutgoingSyncAllObjectsSession *v2;
  unsigned int state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)setState:(unsigned int)a3
{
  SYOutgoingSyncAllObjectsSession *v4;
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
  SYOutgoingSyncAllObjectsSession *v4;
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

- (void)_fetchChanges
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke;
  v23[3] = &unk_24CC65B78;
  v23[4] = self;
  v5 = (void *)MEMORY[0x212BE0F2C](v23);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[SYSession targetQueue](self, "targetQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke_66;
  block[3] = &unk_24CC656E8;
  v11 = &v13;
  block[4] = self;
  v7 = v5;
  v10 = v7;
  v12 = &v17;
  dispatch_sync(v6, block);

  v8 = *((unsigned int *)v14 + 6);
  if ((_DWORD)v8 == 2)
  {
    -[SYOutgoingSyncAllObjectsSession _sendChanges](self, "_sendChanges");
  }
  else
  {
    if ((_DWORD)v8 == 5)
    {
      -[SYSession setError:](self, "setError:", v18[5]);
      self->_errorIsLocal = 1;
      v8 = *((unsigned int *)v14 + 6);
    }
    -[SYOutgoingSyncAllObjectsSession setState:](self, "setState:", v8);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

uint64_t __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke(uint64_t a1, void *a2)
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
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &state);
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
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "serializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithSYObject:", v3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addObject:", v11);
  v12 = 1;
LABEL_7:

  os_activity_scope_leave(&state);
  return v12;
}

void __48__SYOutgoingSyncAllObjectsSession__fetchChanges__block_invoke_66(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v2 = 0;
    do
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v3 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v10 = v2;
      v7 = objc_msgSend(v4, "syncSession:enqueueChanges:error:", v5, v6, &v10);
      v8 = v10;
      v9 = v10;

      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
      if (v9)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v8);
      v2 = v9;
    }
    while (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1);

  }
}

- (void)_sendChanges
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

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

  v8 = (void *)-[NSMutableArray copy](self->_changesToSend, "copy");
  objc_msgSend(v4, "setAllObjects:", v8);

  -[SYOutgoingSyncAllObjectsSession setState:](self, "setState:", 8);
  objc_msgSend(v5, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SYSession priority](self, "priority");
  -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SYOutgoingSyncAllObjectsSession__sendChanges__block_invoke;
  v13[3] = &unk_24CC65788;
  v13[4] = self;
  objc_msgSend(v9, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v4, 2, v10, v11, v12, v13);

}

void __47__SYOutgoingSyncAllObjectsSession__sendChanges__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  os_activity_scope_state_s v11;

  v7 = a3;
  v8 = a4;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &v11);
  v9 = *(void **)(a1 + 32);
  if (!a2)
  {
    objc_msgSend(v9, "setError:", v8);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) = 1;
    v10 = 5;
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "state") == 8)
  {
    v10 = 7;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setState:", v10);
  }
  os_activity_scope_leave(&v11);

}

- (void)_sessionFailed
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  -[SYSession error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_cancelled)
  {
    v6 = (id)v3;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);

    v4 = (void *)v5;
  }
  v7 = v4;
  -[SYOutgoingSyncAllObjectsSession _sessionCompleteWithError:](self, "_sessionCompleteWithError:", v4);

}

- (void)_sessionCompleteWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *sessionTimer;
  OS_dispatch_source *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    v7 = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  -[SYSession targetQueue](self, "targetQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SYOutgoingSyncAllObjectsSession__sessionCompleteWithError___block_invoke;
  block[3] = &unk_24CC652B8;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(v8, block);

  -[SYSession service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionDidEnd:withError:", self, v10);

  -[SYSession didCompleteSession](self, "didCompleteSession");
}

void __61__SYOutgoingSyncAllObjectsSession__sessionCompleteWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncSession:didEndWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

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
  switch(-[SYOutgoingSyncAllObjectsSession state](self, "state"))
  {
    case 1u:
      -[SYOutgoingSyncAllObjectsSession _fetchChanges](self, "_fetchChanges");
      break;
    case 3u:
      self->_cancelled = 1;
      -[SYOutgoingSyncAllObjectsSession _sessionFailed](self, "_sessionFailed");
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
      goto LABEL_9;
    case 9u:
LABEL_9:
      -[SYOutgoingSyncAllObjectsSession _sessionCompleteWithError:](self, "_sessionCompleteWithError:", 0);
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
  v13 = __49__SYOutgoingSyncAllObjectsSession__installTimers__block_invoke;
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

void __49__SYOutgoingSyncAllObjectsSession__installTimers__block_invoke(uint64_t a1)
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
    os_activity_scope_enter(WeakRetained[26], &v7);
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
  v7[2] = __56__SYOutgoingSyncAllObjectsSession__installStateListener__block_invoke;
  v7[3] = &unk_24CC655F8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__SYOutgoingSyncAllObjectsSession__installStateListener__block_invoke(uint64_t a1)
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
        v30[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_2;
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
    v28[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_72;
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
    block[2] = __41__SYOutgoingSyncAllObjectsSession_start___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v33 = v9;
    v11 = v9;
    dispatch_async(v10, block);

    v4[2](v4, 0, v11);
  }
LABEL_12:

}

void __41__SYOutgoingSyncAllObjectsSession_start___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_sessionFailed");
  os_activity_scope_leave(&v2);
}

void __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_2(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &v2);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_sessionFailed");
  os_activity_scope_leave(&v2);
}

uint64_t __41__SYOutgoingSyncAllObjectsSession_start___block_invoke_72(uint64_t a1)
{
  os_activity_t v2;
  uint64_t v3;
  void *v4;

  v2 = _os_activity_create(&dword_211704000, "SYSession (Outgoing)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 208);
  *(_QWORD *)(v3 + 208) = v2;

  objc_msgSend(*(id *)(a1 + 32), "didStartSession");
  objc_msgSend(*(id *)(a1 + 32), "_installStateListener");
  objc_msgSend(*(id *)(a1 + 32), "_installTimers");
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
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
  -[SYOutgoingSyncAllObjectsSession setState:](self, "setState:", v7);
  os_activity_scope_leave(&v8);

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
        _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncEndResponse: %@", buf, 0xCu);
      }
      -[SYSession setError:](self, "setError:", v12);
      -[SYOutgoingSyncAllObjectsSession setState:](self, "setState:", 5);

    }
    else
    {
      -[SYOutgoingSyncAllObjectsSession setState:](self, "setState:", 9);
    }
  }
  else if (a4)
  {
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2006, 0);
  }
  os_activity_scope_leave(&v15);

  return v9;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
}

- (BOOL)canRestart
{
  return self->canRestart;
}

- (void)setCanRestart:(BOOL)a3
{
  self->canRestart = a3;
}

- (BOOL)canRollback
{
  return self->canRollback;
}

- (void)setCanRollback:(BOOL)a3
{
  self->canRollback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesToSend, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
}

@end
