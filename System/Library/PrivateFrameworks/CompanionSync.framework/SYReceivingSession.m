@implementation SYReceivingSession

- (SYReceivingSession)initWithService:(id)a3 isReset:(BOOL)a4 metadata:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  SYReceivingSession *v10;
  SYReceivingSession *v11;
  NSObject *v12;
  os_activity_t v13;
  OS_os_activity *sessionActivity;
  __int16 v15;
  uint64_t v16;
  NSMutableIndexSet *receivedBatchIndices;
  SYReceivingSession *v18;
  objc_super v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SYReceivingSession;
  v10 = -[SYSession initWithService:](&v20, sel_initWithService_, v8);
  v11 = v10;
  if (v10)
  {
    v10->_flagsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v8, "serviceActivity");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = _os_activity_create(&dword_211704000, "SYSession (Incoming)", v12, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v11->_sessionActivity;
    v11->_sessionActivity = (OS_os_activity *)v13;

    if (v6)
      v15 = 64;
    else
      v15 = 0;
    *(_WORD *)&v11->_flags = *(_WORD *)&v11->_flags & 0xFF80 | v15;
    v16 = objc_opt_new();
    receivedBatchIndices = v11->_receivedBatchIndices;
    v11->_receivedBatchIndices = (NSMutableIndexSet *)v16;

    if (v9)
    {
      -[SYReceivingSession setSessionMetadata:](v11, "setSessionMetadata:", v9);
      *(_WORD *)&v11->_flags &= ~0x400u;
    }
    v18 = v11;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *asyncResetGroupToWaitOn;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SYReceivingSession;
  v4 = a3;
  -[SYSession setDelegate:](&v8, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = (OS_dispatch_group *)dispatch_group_create();
    asyncResetGroupToWaitOn = self->_asyncResetGroupToWaitOn;
    self->_asyncResetGroupToWaitOn = v6;

  }
}

- (void)setSessionMetadata:(id)a3
{
  id v4;
  objc_super v5;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v5.receiver = self;
  v5.super_class = (Class)SYReceivingSession;
  -[SYSession setSessionMetadata:](&v5, sel_setSessionMetadata_, v4);
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_flagsLock);
  os_activity_scope_leave(&state);

}

- (BOOL)metadataModified
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 10) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (unsigned)state
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = *(_WORD *)&v2->_flags & 0xF;
  os_unfair_lock_unlock(p_flagsLock);
  return v2;
}

- (void)setState:(unsigned int)a3
{
  os_unfair_lock_s *p_flagsLock;
  NSObject *v6;
  int v7;
  NSObject *stateUpdateSource;
  NSObject *v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  SYReceivingSession *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    v12 = self;
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = a3;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Set state from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF0 | a3 & 0xF;
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
  {
    if (!dispatch_source_testcancel(stateUpdateSource))
      dispatch_source_merge_data(stateUpdateSource, 1uLL);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "No dispatch source set up for state-change notifications!", buf, 2u);
    }
  }
  os_unfair_lock_unlock(p_flagsLock);
  os_activity_scope_leave(&v10);
}

- (void)_setStateQuietly:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  SYReceivingSession *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v7);
  os_unfair_lock_lock(&self->_flagsLock);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_WORD *)&self->_flags & 0xF;
    *(_DWORD *)buf = 138543874;
    v9 = self;
    v10 = 1024;
    v11 = v6;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state (quietly) from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF0 | a3 & 0xF;
  os_unfair_lock_unlock(&self->_flagsLock);
  os_activity_scope_leave(&v7);
}

- (BOOL)canRestart
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 4) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setCanRestart:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_flagsLock;
  __int16 v6;

  v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3)
    v6 = 16;
  else
    v6 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v6;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)canRollback
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 5) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setCanRollback:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_flagsLock;
  __int16 v6;

  v3 = a3;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  if (v3)
    v6 = 32;
  else
    v6 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v6;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)isResetSync
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 6) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (BOOL)isSending
{
  return 0;
}

- (BOOL)wasCancelled
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = HIBYTE(*(_WORD *)&v2->_flags) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_setCompleted
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_hasCompleted
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 9) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_setCancelled
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setStarted
{
  -[SYSession didStartSession](self, "didStartSession");
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_flagsLock);
}

- (BOOL)_hasStarted
{
  SYReceivingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 7) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (id)_newMessageHeader
{
  void *v3;
  void *v4;

  -[SYSession service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "_newMessageHeader");

  -[SYReceivingSession _tweakMessageHeader:](self, "_tweakMessageHeader:", v4);
  return v4;
}

- (void)_tweakMessageHeader:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  double Current;
  double v8;
  id v9;

  v9 = a3;
  -[SYSession perMessageTimeout](self, "perMessageTimeout");
  if (v4 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "setTimeout:");

    v6 = v5;
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[SYSession perMessageTimeout](self, "perMessageTimeout");
    objc_msgSend(v9, "setTimeout:", Current + v8);
    v6 = v9;
  }

}

- (void)_sendEndSessionAndError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *stateUpdateSource;
  NSObject *sessionTimer;
  OS_dispatch_source *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
    dispatch_source_cancel(stateUpdateSource);
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    dispatch_source_cancel(sessionTimer);
    v8 = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  -[SYReceivingSession _setCompleted](self, "_setCompleted");
  -[SYSession targetQueue](self, "targetQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SYReceivingSession__sendEndSessionAndError___block_invoke;
  block[3] = &unk_24CC652B8;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_sync(v9, block);

  -[SYSession service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionDidEnd:withError:", self, v11);

  -[SYSession didCompleteSession](self, "didCompleteSession");
}

void __46__SYReceivingSession__sendEndSessionAndError___block_invoke(uint64_t a1)
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

- (void)_midStreamErrorHandled
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  SYReceivingSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v4 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: _midStreamErrorHandled", buf, 0xCu);
  }
  -[SYSession error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SYErrorDomain")) & 1) == 0)
  {

    goto LABEL_9;
  }
  -[SYSession error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code") == -128;

  if (!v8)
  {
LABEL_9:
    -[SYReceivingSession _setStateQuietly:](self, "_setStateQuietly:", 5);
    goto LABEL_10;
  }
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEF0 | 0x103;
  os_unfair_lock_unlock(&self->_flagsLock);
LABEL_10:
  -[SYSession error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYReceivingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", v9);

  os_activity_scope_leave(&v10);
}

- (void)_notifyErrorAndShutdown
{
  id v3;

  -[SYSession error](self, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SYReceivingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", v3);

}

- (void)_sessionCancelled
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
  -[SYReceivingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", v3);

}

- (void)_sessionRestarted
{
  -[NSMutableIndexSet removeAllIndexes](self->_receivedBatchIndices, "removeAllIndexes");
}

- (void)_sessionFinished
{
  -[SYReceivingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", 0);
}

- (void)_processNextState
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  SYReceivingSession *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_activity_scope_state_s state;
  uint8_t v23[128];
  uint8_t buf[4];
  SYReceivingSession *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v4 = -[SYReceivingSession state](self, "state");
  switch(-[SYReceivingSession state](self, "state"))
  {
    case 3u:
      -[SYReceivingSession _sessionCancelled](self, "_sessionCancelled");
      break;
    case 4u:
      -[SYReceivingSession _sessionRestarted](self, "_sessionRestarted");
      break;
    case 5u:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[SYSession error](self, "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v7;
        _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %{public}@", buf, 0x16u);

      }
      -[SYReceivingSession _notifyErrorAndShutdown](self, "_notifyErrorAndShutdown");
      break;
    case 9u:
      -[SYReceivingSession _sessionFinished](self, "_sessionFinished");
      break;
    case 0xCu:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v8 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[SYSession error](self, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(v9);
        v10 = (SYReceivingSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for async client operation to complete. Will send error as part of response to that operation. Error = %{public}@", buf, 0xCu);

      }
      break;
    default:
      break;
  }
  -[SYSession stateResponders](self, "stateResponders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v14);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v15);
    }

    objc_msgSend(v14, "removeAllObjects", (_QWORD)v18);
  }

  os_activity_scope_leave(&state);
}

- (void)_installTimers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *sessionTimer;
  NSObject *v14;
  double v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[SYSession identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = (void *)MEMORY[0x24BDBCE60];
  -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __36__SYReceivingSession__installTimers__block_invoke;
  v24 = &unk_24CC65D50;
  objc_copyWeak(&v27, &location);
  v7 = v4;
  v25 = v7;
  v8 = v6;
  v26 = v8;
  v9 = (void *)MEMORY[0x212BE0F2C](&v21);
  -[SYSession fullSessionTimeout](self, "fullSessionTimeout", v21, v22, v23, v24);
  if (v10 != 0.0)
  {
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v11);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v12;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v9);
    v14 = self->_sessionTimer;
    -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
    v16 = dispatch_walltime(0, (uint64_t)(v15 * 1000000000.0));
    dispatch_source_set_timer(v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
    v17 = (void *)MEMORY[0x24BDBCE60];
    -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
    objc_msgSend(v17, "dateWithTimeIntervalSinceNow:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
      *(_DWORD *)buf = 134218242;
      v30 = v20;
      v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "Session timeout is %.02f seconds. Timer will fire at %{public}@", buf, 0x16u);
    }

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __36__SYReceivingSession__installTimers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, (os_log_type_t)0x90u))
  {
    __34__SYSendingSession__installTimers__block_invoke_cold_1(a1, (uint64_t)WeakRetained, v3);
    if (!WeakRetained)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (WeakRetained)
  {
LABEL_5:
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __36__SYReceivingSession__installTimers__block_invoke_10;
    v5[3] = &unk_24CC652B8;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
LABEL_6:

}

void __36__SYReceivingSession__installTimers__block_invoke_10(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 232), &v10);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v2);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 11)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      __36__SYReceivingSession__installTimers__block_invoke_10_cold_1(v3);
    v4 = 12;
  }
  else
  {
    v4 = 5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", v4);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Session timeout timer fired. Expected to fire at %{public}@, delta is %.02f", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  v9 = WeakRetained;
  if (WeakRetained)
    dispatch_block_cancel(WeakRetained);

  os_activity_scope_leave(&v10);
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
  v7[2] = __43__SYReceivingSession__installStateListener__block_invoke;
  v7[3] = &unk_24CC655F8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__SYReceivingSession__installStateListener__block_invoke(uint64_t a1)
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

- (BOOL)_isMissingSyncBatches
{
  uint64_t v3;

  v3 = -[NSMutableIndexSet lastIndex](self->_receivedBatchIndices, "lastIndex");
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && -[NSMutableIndexSet countOfIndexesInRange:](self->_receivedBatchIndices, "countOfIndexesInRange:", 0, v3 + 1) != v3 + 1;
}

- (BOOL)_postAsyncResetRequestReturningError:(id *)a3
{
  NSObject *v5;
  CFAbsoluteTime Current;
  void *v7;
  NSObject *v8;
  char v9;
  __CFString *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  id v15[2];
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SYReceivingSession setState:](self, "setState:", 10);
  dispatch_group_enter((dispatch_group_t)self->_asyncResetGroupToWaitOn);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  objc_initWeak(&location, self);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_INFO, "Delegate: -resetDataStoreForSyncSession:completion:", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  -[SYSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__SYReceivingSession__postAsyncResetRequestReturningError___block_invoke;
  v14[3] = &unk_24CC667E0;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&Current;
  v14[4] = &v17;
  v14[5] = &v21;
  objc_msgSend(v7, "resetDataStoreForSyncSession:completion:", self, v14);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *((_BYTE *)v18 + 24);
    _SYObfuscate((void *)v22[5]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SYReceivingSession _postAsyncResetRequestReturningError:].cold.1(v9, v10, buf, v8);
  }

  v11 = (void *)v22[5];
  if (v11)
    *a3 = objc_retainAutorelease(v11);
  v12 = *((_BYTE *)v18 + 24) != 0;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __59__SYReceivingSession__postAsyncResetRequestReturningError___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  dispatch_group_t *WeakRetained;
  void *v8;
  NSObject *v9;
  double v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    _SYObfuscate(WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = "YES";
    else
      v12 = "NO";
    _SYObfuscate(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134218754;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2080;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Async reset-data completion called after %.02f seconds with strongSelf = %{public}@, success = %s, error = %{public}@", (uint8_t *)&v19, 0x2Au);

  }
  if (!a2)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      _SYObfuscate(WeakRetained);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _SYObfuscate(v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = *(double *)&v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Error reported from async reset-data in session %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    -[dispatch_group_t setError:](WeakRetained, "setError:", v6);
    v14 = 5;
    goto LABEL_16;
  }
  if (-[dispatch_group_t state](WeakRetained, "state") == 10)
  {
    v14 = 1;
LABEL_16:
    -[dispatch_group_t setState:](WeakRetained, "setState:", v14);
  }
  dispatch_group_leave(WeakRetained[30]);

}

- (void)start:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  void (**v16)(id, _QWORD, id);
  _QWORD block[5];
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  SYReceivingSession *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  -[SYSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    v10 = objc_alloc(MEMORY[0x24BDD1540]);
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("You cannot start an SYSession without a delegate.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithSYError:userInfo:", 2001, v11);

    -[SYSession queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__SYReceivingSession_start___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v14 = v12;
    v18 = v14;
    dispatch_async(v13, block);

    v4[2](v4, 0, v14);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SYSession identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);

    }
    -[SYSession queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __28__SYReceivingSession_start___block_invoke_18;
    v15[3] = &unk_24CC657F0;
    v15[4] = self;
    v16 = v4;
    dispatch_async(v9, v15);

  }
  os_activity_scope_leave(&state);

}

uint64_t __28__SYReceivingSession_start___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEndSessionAndError:", *(_QWORD *)(a1 + 40));
}

void __28__SYReceivingSession_start___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void (**v4)(_QWORD, _QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *);
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[5];
  id v38;
  uint8_t v39[4];
  uint64_t v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __28__SYReceivingSession_start___block_invoke_2;
  v37[3] = &unk_24CC66808;
  v3 = (id *)(a1 + 32);
  v37[4] = *(_QWORD *)(a1 + 32);
  v38 = *(id *)(a1 + 40);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BE0F2C](v37);
  v5 = objc_msgSend(*v3, "state");
  if (v5)
  {
    if (v5 == 5)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Receiving session entered error state during initialization", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v12);

    }
    else if (v5 == 3)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Receiving session canceled during initialization", buf, 2u);
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
      ((void (**)(_QWORD, void *))v4)[2](v4, v7);

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(a1 + 32);
        v15 = v13;
        v16 = objc_msgSend(v14, "state");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v16;
        _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected state during initialization: %{companionsync:SYSessionState}d", buf, 8u);

      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2011, 0);
      ((void (**)(_QWORD, void *))v4)[2](v4, v17);

    }
    goto LABEL_36;
  }
  objc_msgSend(*(id *)(a1 + 32), "fullSessionTimeout");
  if (v8 < 0.0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Pre-expired session arrived. Dropping.", buf, 2u);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2007, 0);
    ((void (**)(_QWORD, void *))v4)[2](v4, v10);

    goto LABEL_36;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isResetSync"))
    goto LABEL_33;
  *(_QWORD *)buf = 0;
  v42 = buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__11;
  v45 = __Block_byref_object_dispose__11;
  v46 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "targetQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v25 = v2;
  v26 = 3221225472;
  v27 = __28__SYReceivingSession_start___block_invoke_20;
  v28 = &unk_24CC66830;
  v20 = v18;
  v21 = *(_QWORD *)(a1 + 32);
  v29 = v20;
  v30 = v21;
  v31 = &v33;
  v32 = buf;
  dispatch_sync(v19, &v25);

  v22 = *((unsigned __int8 *)v34 + 24);
  if (*((_BYTE *)v34 + 24))
  {

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(buf, 8);

LABEL_33:
    objc_msgSend(*(id *)(a1 + 32), "_installStateListener", v25, v26, v27, v28);
    objc_msgSend(*(id *)(a1 + 32), "_installTimers");
    objc_msgSend(*(id *)(a1 + 32), "_setStarted");
    if (!objc_msgSend(*(id *)(a1 + 32), "state"))
      objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_36;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v23 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *((_QWORD *)v42 + 5);
    *(_DWORD *)v39 = 138412290;
    v40 = v24;
    _os_log_impl(&dword_211704000, v23, OS_LOG_TYPE_DEFAULT, "Delegate failed reset-store operation: %@", v39, 0xCu);
  }
  v4[2](v4, *((_QWORD *)v42 + 5));

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  if (v22)
    goto LABEL_33;
LABEL_36:

}

void __28__SYReceivingSession_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__SYReceivingSession_start___block_invoke_3;
  v8[3] = &unk_24CC652B8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, v8);

  (*(void (**)(_QWORD, _QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v5, v6, v7);
}

uint64_t __28__SYReceivingSession_start___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEndSessionAndError:", *(_QWORD *)(a1 + 40));
}

void __28__SYReceivingSession_start___block_invoke_20(_QWORD *a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  double Current;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  CFAbsoluteTime v16;
  id v17;
  id v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_INFO, "Delegate: -syncSession:resetDataStoreWithError:", buf, 2u);
    }
    Current = CFAbsoluteTimeGetCurrent();
    v10 = (void *)a1[4];
    v11 = a1[5];
    v17 = 0;
    v12 = objc_msgSend(v10, "syncSession:resetDataStoreWithError:", v11, &v17);
    v13 = v17;
    v7 = v17;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v12;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      v20 = Current - v16;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:resetDataStoreWithError:", buf, 0xCu);

    }
    if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v13);
    v5 = 0;
    goto LABEL_15;
  }
  v2 = (void *)a1[5];
  v18 = 0;
  v3 = objc_msgSend(v2, "_postAsyncResetRequestReturningError:", &v18);
  v4 = v18;
  v5 = v4;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v6 = *(_QWORD *)(a1[7] + 8);
    v5 = v4;
    v7 = *(id *)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
LABEL_15:

  }
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  os_activity_scope_state_s v10;

  v4 = a3;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v10);
  -[SYReceivingSession _setCancelled](self, "_setCancelled");
  -[SYSession _cancelPendingMessagesReturningFailures](self, "_cancelPendingMessagesReturningFailures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[SYSession service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionFailedToCancelMessageUUIDs:", v5);

  }
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SYErrorDomain")))
  {
    v8 = objc_msgSend(v4, "code");

    if (v8 == -128)
    {
      v9 = 3;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[SYSession setError:](self, "setError:", v4);
  v9 = 5;
LABEL_8:
  if (-[SYReceivingSession state](self, "state") == 11)
  {
    -[SYSession setError:](self, "setError:", v4);
    v9 = 12;
  }
  if (-[SYReceivingSession _hasStarted](self, "_hasStarted"))
    -[SYReceivingSession setState:](self, "setState:", v9);
  else
    -[SYReceivingSession _setStateQuietly:](self, "_setStateQuietly:", v9);

  os_activity_scope_leave(&v10);
}

- (void)_handleSyncBatch:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _SYLazyChangeArray *v13;
  void *v14;
  void *v15;
  _SYLazyChangeArray *v16;
  id v17;
  id v18;
  id v19;
  _SYLazyChangeArray *v20;
  dispatch_block_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *asyncResetGroupToWaitOn;
  NSObject *v27;
  _QWORD block[4];
  id v29;
  SYReceivingSession *v30;
  id v31;
  _SYLazyChangeArray *v32;
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v36;
  uint8_t v37[16];
  char v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  objc_msgSend(v8, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSessionID:", v11);

  objc_msgSend(v9, "setIndex:", objc_msgSend(v8, "index"));
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SYReceivingSession _handleSyncBatch:response:completion:].cold.2((uint64_t)v38, objc_msgSend(v8, "index"), v12);

  -[NSMutableIndexSet addIndex:](self->_receivedBatchIndices, "addIndex:", objc_msgSend(v8, "index"));
  v13 = [_SYLazyChangeArray alloc];
  objc_msgSend(v8, "changes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession serializer](self, "serializer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_SYLazyChangeArray initWithSourceArray:decoder:](v13, "initWithSourceArray:decoder:", v14, v15);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke;
  block[3] = &unk_24CC668D0;
  v17 = v8;
  v29 = v17;
  v30 = self;
  v18 = v9;
  v31 = v18;
  v19 = v10;
  v33 = v19;
  v20 = v16;
  v32 = v20;
  v21 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v22 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[SYReceivingSession _handleSyncBatch:response:completion:].cold.1(v37, -[SYReceivingSession state](self, "state"), v22);

  if (-[SYReceivingSession state](self, "state") == 10)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v23 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)MEMORY[0x212BE0F2C](v21);
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "First batch arrived, we're still waiting on reset completion-- using dispatch_group_notify with block %@", buf, 0xCu);

    }
    objc_storeWeak(&self->_weakBlockWaitingForReset, v21);
    asyncResetGroupToWaitOn = self->_asyncResetGroupToWaitOn;
    -[SYSession targetQueue](self, "targetQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(asyncResetGroupToWaitOn, v27, v21);
  }
  else
  {
    -[SYSession targetQueue](self, "targetQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v27, v21);
  }

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id *v7;
  id *v8;
  NSObject *v9;
  CFAbsoluteTime Current;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  uint64_t v14;
  id v15;
  _QWORD v16[2];
  uint8_t buf[8];
  _QWORD block[5];
  id v19;
  id v20;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_cold_1(a1, v2);
  v3 = objc_msgSend(*(id *)(a1 + 40), "state");
  v4 = *(void **)(a1 + 40);
  if (v3 == 5)
  {
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_22;
    block[3] = &unk_24CC66858;
    v6 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v7 = &v19;
    v19 = v6;
    v8 = &v20;
    v20 = *(id *)(a1 + 64);
    dispatch_async(v5, block);
  }
  else
  {
    objc_msgSend(v4, "_setStateQuietly:", 11);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_INFO, "Delegate: -syncSession:applyChanges:completion:", buf, 2u);
    }
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_24;
    v13[3] = &unk_24CC668A8;
    v11 = *(void **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 40);
    *(CFAbsoluteTime *)&v16[1] = Current;
    v7 = &v15;
    v15 = v11;
    v8 = (id *)v16;
    v16[0] = *(id *)(a1 + 64);
    -[NSObject syncSession:applyChanges:completion:](v5, "syncSession:applyChanges:completion:", v14, v12, v13);
  }

}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  SYErrorInfo *v3;
  void *v4;
  SYErrorInfo *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 232), &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Returning error state in response to a sync batch", v9, 2u);
  }
  v3 = [SYErrorInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SYErrorInfo initWithError:](v3, "initWithError:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setError:", v5);

  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "wrappedUserContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  double Current;
  double v11;
  uint64_t v12;
  const char *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  char v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 232), &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v11 = *(double *)(a1 + 56);
    v12 = objc_msgSend(*(id *)(a1 + 40), "index");
    v13 = "NO";
    *(_DWORD *)buf = 134218498;
    v21 = Current - v11;
    if (a2)
      v13 = "YES";
    v22 = 2048;
    v23 = v12;
    v24 = 2080;
    v25 = v13;
    _os_log_debug_impl(&dword_211704000, v6, OS_LOG_TYPE_DEBUG, "Delegate callout complete after %.02f seconds: -syncSession:applyChanges:completion:, chunkIndex = %llu, success = %s", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_25;
  block[3] = &unk_24CC66880;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v18 = a2;
  v15 = v8;
  v16 = v5;
  v17 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v7, block);

  os_activity_scope_leave(&state);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  SYErrorInfo *v10;
  SYErrorInfo *v11;
  SYErrorInfo *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 232), &v18);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "index");
    v5 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    if (v5)
      v6 = "YES";
    else
      v6 = "NO";
    v20 = v3;
    v21 = 2048;
    v22 = v4;
    v23 = 2080;
    v24 = v6;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "%{public}@: Building response for processed changes, chunkIndex = %llu, success = %s", buf, 0x20u);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 12)
    {
      objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
      goto LABEL_22;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _SYObfuscate(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Detected error that occurred while waiting, attaching to batch response. Error = %{public}@", buf, 0xCu);

    }
    v10 = [SYErrorInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "error");
    v11 = (SYErrorInfo *)objc_claimAutoreleasedReturnValue();
    v12 = -[SYErrorInfo initWithError:](v10, "initWithError:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setError:", v12);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v13 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      _SYObfuscate(*(void **)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Failed to process sync batch, returning error: %{public}@", buf, 0xCu);

    }
    v11 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setError:", v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "_midStreamErrorHandled");
LABEL_22:
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "wrappedUserContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v16, v17);

  os_activity_scope_leave(&v18);
}

- (void)_handleRestartSession:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  SYErrorInfo *v17;
  void *v18;
  _QWORD v19[6];
  id v20;
  _QWORD block[6];
  id v22;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  objc_msgSend(v8, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSessionID:", v11);

  if (-[SYReceivingSession isResetSync](self, "isResetSync") && -[SYReceivingSession canRestart](self, "canRestart"))
  {
    -[SYSession targetQueue](self, "targetQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke;
    block[3] = &unk_24CC66858;
    v13 = block;
    block[4] = v9;
    block[5] = self;
    v22 = v10;
    dispatch_async(v12, block);

LABEL_7:
    v15 = (void *)v13[4];
    goto LABEL_13;
  }
  if (!-[SYReceivingSession isResetSync](self, "isResetSync") && -[SYReceivingSession canRollback](self, "canRollback"))
  {
    -[SYSession targetQueue](self, "targetQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_27;
    v19[3] = &unk_24CC66858;
    v13 = v19;
    v19[4] = v9;
    v19[5] = self;
    v20 = v10;
    dispatch_async(v14, v19);

    goto LABEL_7;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v16 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Rejecting restart request: %@", buf, 0xCu);
  }
  objc_msgSend(v9, "setAccepted:", 0);
  v17 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v15);
  objc_msgSend(v9, "setError:", v17);

  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))v10 + 2))(v10, v9, v18);

LABEL_13:
  os_activity_scope_leave(&state);

}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double Current;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  SYErrorInfo *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:resetDataStoreWithError: (restart session)", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v6 = objc_msgSend(v4, "syncSession:resetDataStoreWithError:", v5, &v22);
  v7 = v22;
  objc_msgSend(*(id *)(a1 + 32), "setAccepted:", v6);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v24 = v10 - Current;
    _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:resetDataStoreWithError: (restart session)", buf, 0xCu);

  }
  if (v7)
  {
    v11 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setError:", v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_26;
  block[3] = &unk_24CC65620;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v18 = v13;
  v19 = v14;
  v20 = v7;
  v21 = v15;
  v16 = v7;
  dispatch_async(v12, block);

}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "accepted"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 4);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v2 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Client rejected reset session restart: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "wrappedUserContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  double Current;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  SYErrorInfo *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:rollbackChangesWithError: (restart session)", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v6 = objc_msgSend(v4, "syncSession:rollbackChangesWithError:", v5, &v22);
  v7 = v22;
  objc_msgSend(*(id *)(a1 + 32), "setAccepted:", v6);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v24 = v10 - Current;
    _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:rollbackChangesWithError: (restart session)", buf, 0xCu);

  }
  if (v7)
  {
    v11 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setError:", v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_28;
  block[3] = &unk_24CC65620;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v18 = v13;
  v19 = v14;
  v20 = v7;
  v21 = v15;
  v16 = v7;
  dispatch_async(v12, block);

}

void __64__SYReceivingSession__handleRestartSession_response_completion___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "accepted"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 4);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v2 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 48);
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Client rejected delta session rollback: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "wrappedUserContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);

}

- (void)_handleEndSession:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  SYReceivingSession *v18;
  id v19;
  id v20;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  objc_msgSend(v8, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSessionID:", v11);

  -[SYSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__SYReceivingSession__handleEndSession_response_completion___block_invoke;
  v16[3] = &unk_24CC65620;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id *v23;
  uint64_t v24;
  SYErrorInfo *v25;
  SYErrorInfo *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v35[0] = &v34;
  v35[1] = 0x3032000000;
  v35[2] = __Block_byref_object_copy__11;
  v35[3] = __Block_byref_object_dispose__11;
  v36 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "hasRollback")
    && objc_msgSend(*(id *)(a1 + 32), "rollback"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "canRollback"))
    {
      objc_msgSend(*(id *)(a1 + 40), "targetQueue");
      v2 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_2;
      block[3] = &unk_24CC66728;
      v3 = *(id *)(a1 + 48);
      v4 = *(_QWORD *)(a1 + 40);
      v31 = v3;
      v32 = v4;
      v33 = &v34;
      dispatch_sync(v2, block);

      v5 = v31;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setDidRollback:", 0);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
      v5 = *(void **)(v35[0] + 40);
      *(_QWORD *)(v35[0] + 40) = v13;
    }

    objc_msgSend(*(id *)(a1 + 48), "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v10 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(v35[0] + 40);
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        v12 = "Error rolling back at end session: %@";
        goto LABEL_16;
      }
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "hasError"))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorFromSYErrorInfo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v35[0] + 40);
    *(_QWORD *)(v35[0] + 40) = v8;

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(v35[0] + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      v12 = "Ending session with error from Master: %@";
LABEL_16:
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  if (!*(_QWORD *)(v35[0] + 40) && objc_msgSend(*(id *)(a1 + 40), "_isMissingSyncBatches"))
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2012, 0);
    v18 = *(void **)(v35[0] + 40);
    *(_QWORD *)(v35[0] + 40) = v17;

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, (os_log_type_t)0x90u))
      __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_cold_1((uint64_t)v35, v19);
  }
  v20 = *(void **)(v35[0] + 40);
  if (v20)
  {
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("SYErrorDomain")))
    {
      v22 = objc_msgSend(*(id *)(v35[0] + 40), "code") == -128;

      if (v22)
      {
        v23 = (id *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 40), "_setCancelled");
        v24 = 3;
        goto LABEL_30;
      }
    }
    else
    {

    }
    v23 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(v35[0] + 40));
    v24 = 5;
  }
  else
  {
    v23 = (id *)(a1 + 40);
    v24 = 9;
  }
LABEL_30:
  objc_msgSend(*v23, "setState:", v24);
  if (*(_QWORD *)(v35[0] + 40))
  {
    v25 = [SYErrorInfo alloc];
    v26 = -[SYErrorInfo initWithError:](v25, "initWithError:", *(_QWORD *)(v35[0] + 40));
    objc_msgSend(*(id *)(a1 + 48), "setError:", v26);

  }
  v28 = *(_QWORD *)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "wrappedUserContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v27 + 16))(v27, v28, v29);

  _Block_object_dispose(&v34, 8);
}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  double Current;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  CFAbsoluteTime v11;
  id v12;
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:rollbackChangesWithError: (session end)", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v6 = objc_msgSend(v4, "syncSession:rollbackChangesWithError:", v5, &v12);
  v7 = v12;
  v8 = v12;
  objc_msgSend(*(id *)(a1 + 32), "setDidRollback:", v6);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v9 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    v14 = v11 - Current;
    _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:rollbackChangesWithError: (session end)", buf, 0xCu);

  }
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  SYThrowWrongSessionType((uint64_t)self, a2);
  return 0;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  SYThrowWrongSessionType((uint64_t)self, a2);
  return 0;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  SYThrowWrongSessionType((uint64_t)self, a2);
  return 0;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  SYThrowWrongSessionType((uint64_t)self, a2);
  return 0;
}

- (void)_continue
{
  unsigned int v3;
  void *v5;
  objc_super v6;

  v3 = -[SYReceivingSession state](self, "state");
  if (v3 > 0xC || ((1 << v3) & 0x1C20) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2021, 0);
    -[SYSession setError:](self, "setError:", v5);

    -[SYReceivingSession setState:](self, "setState:", 5);
  }
  v6.receiver = self;
  v6.super_class = (Class)SYReceivingSession;
  -[SYSession _continue](&v6, sel__continue);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakBlockWaitingForReset);
  objc_storeStrong((id *)&self->_asyncResetGroupToWaitOn, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_receivedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

void __36__SYReceivingSession__installTimers__block_invoke_10_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_211704000, log, OS_LOG_TYPE_DEBUG, "Timeout while waiting for client to apply changes. Setting state to SYSessionStateErrorOccurredWhileWaitingForCompletion.", v1, 2u);
}

- (void)_postAsyncResetRequestReturningError:(uint8_t *)buf .cold.1(char a1, __CFString *a2, uint8_t *buf, os_log_t log)
{
  const char *v5;
  const __CFString *v6;

  v5 = "YES";
  if (!a1)
    v5 = "NO";
  v6 = CFSTR("(nil)");
  if (a2)
    v6 = a2;
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = v6;
  _os_log_debug_impl(&dword_211704000, log, OS_LOG_TYPE_DEBUG, "Sent async reset-data message to delegate. Will continue = %s, error = %{public}@", buf, 0x16u);

}

- (void)_handleSyncBatch:(uint8_t *)buf response:(int)a2 completion:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl(&dword_211704000, log, OS_LOG_TYPE_DEBUG, "Batch incoming, state == %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleSyncBatch:(uint64_t)a1 response:(uint64_t)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_7(&dword_211704000, a3, (uint64_t)a3, "Received incoming batch %llu", (uint8_t *)a1);
}

void __59__SYReceivingSession__handleSyncBatch_response_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = 134217984;
  v6 = objc_msgSend(v2, "index");
  OUTLINED_FUNCTION_0_7(&dword_211704000, v3, v4, "Processing incoming batch %llu", (uint8_t *)&v5);

}

void __60__SYReceivingSession__handleEndSession_response_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_211704000, a2, (os_log_type_t)0x90u, "End session arrived and I have missing sync batches: %@", (uint8_t *)&v3, 0xCu);
}

@end
