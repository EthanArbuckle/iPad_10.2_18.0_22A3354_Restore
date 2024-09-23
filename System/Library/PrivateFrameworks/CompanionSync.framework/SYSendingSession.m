@implementation SYSendingSession

- (SYSendingSession)initWithService:(id)a3 isReset:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SYSendingSession *v7;
  SYSendingSession *v8;
  NSObject *v9;
  os_activity_t v10;
  OS_os_activity *sessionActivity;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableIndexSet *ackedBatchIndices;
  uint64_t v18;
  NSMutableArray *batchMessageIDs;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *changeFetcherQueue;
  SYSendingSession *v26;
  objc_super v28;

  v4 = a4;
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SYSendingSession;
  v7 = -[SYSession initWithService:](&v28, sel_initWithService_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_flagsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v6, "serviceActivity");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _os_activity_create(&dword_211704000, "SYSession (Outgoing)", v9, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v8->_sessionActivity;
    v8->_sessionActivity = (OS_os_activity *)v10;

    if (v4)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&v8->_flags = *(_WORD *)&v8->_flags & 0xFF80 | v12;
    _SessionIdentifierDateFormatter();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    objc_msgSend(v13, "stringFromDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SYSession setIdentifier:](v8, "setIdentifier:", v15);
    v16 = objc_opt_new();
    ackedBatchIndices = v8->_ackedBatchIndices;
    v8->_ackedBatchIndices = (NSMutableIndexSet *)v16;

    v18 = objc_opt_new();
    batchMessageIDs = v8->_batchMessageIDs;
    v8->_batchMessageIDs = (NSMutableArray *)v18;

    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR(" Change Enqueuer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
    changeFetcherQueue = v8->_changeFetcherQueue;
    v8->_changeFetcherQueue = (OS_dispatch_queue *)v24;

    v26 = v8;
  }

  return v8;
}

- (unsigned)state
{
  SYSendingSession *v2;
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
  SYSendingSession *v12;
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
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting state from %{companionsync:SYSessionState}d to %{companionsync:SYSessionState}d", buf, 0x18u);
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
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "State change notification source is nil!", buf, 2u);
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
  SYSendingSession *v9;
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
  SYSendingSession *v2;
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
  SYSendingSession *v2;
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
  SYSendingSession *v2;
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
  return 1;
}

- (BOOL)wasCancelled
{
  SYSendingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = HIBYTE(*(_WORD *)&v2->_flags) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
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

- (void)_sentStart
{
  -[SYSession didStartSession](self, "didStartSession");
  -[SYSendingSession _setupChangeConcurrency](self, "_setupChangeConcurrency");
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_flagsLock);
}

- (void)_confirmedStart
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_sentEnd
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_hasSentEnd
{
  SYSendingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 12) & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)_confirmedEnd
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setCancelled
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setComplete
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (void)_setLocalErrorOccurred
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)_localErrorOccurred
{
  SYSendingSession *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LODWORD(v2) = (*(_WORD *)&v2->_flags >> 14) & 1;
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

  -[SYSendingSession _tweakMessageHeader:](self, "_tweakMessageHeader:", v4);
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

- (void)_setupChangeConcurrency
{
  void *v3;
  void *v4;
  char v5;
  _SYCountedSemaphore *v6;
  _SYCountedSemaphore *changeConcurrencySemaphore;
  OS_os_activity *v8;
  OS_os_activity *changeWaitActivity;

  if (-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages")
    && (-[SYSession maxConcurrentMessages](self, "maxConcurrentMessages") & 0x8000000000000000) == 0)
  {
    -[SYSession service](self, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "buffersSessions");

    if ((v5 & 1) == 0)
    {
      v6 = -[_SYCountedSemaphore initWithCount:]([_SYCountedSemaphore alloc], "initWithCount:", -[SYSession maxConcurrentMessages](self, "maxConcurrentMessages"));
      changeConcurrencySemaphore = self->_changeConcurrencySemaphore;
      self->_changeConcurrencySemaphore = v6;

      v8 = (OS_os_activity *)_os_activity_create(&dword_211704000, "Change Concurrency Wait", (os_activity_t)self->_sessionActivity, OS_ACTIVITY_FLAG_DEFAULT);
      changeWaitActivity = self->_changeWaitActivity;
      self->_changeWaitActivity = v8;

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
    block[2] = __41__SYSendingSession__waitForMessageWindow__block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(changeFetcherQueue, block);
  }
  else
  {
    -[SYSendingSession _fetchNextBatch](self, "_fetchNextBatch");
  }
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[5];
  os_activity_scope_state_s v26;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 248), &state);
  objc_msgSend(*(id *)(a1 + 32), "perMessageTimeout");
  if (v2 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultMessageTimeout");

  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v4 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[30];
  objc_msgSend(v12, "perMessageTimeout");
  if (objc_msgSend(v13, "waitWithTimeout:", v14 + v14))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    v26.opaque[0] = 0;
    v26.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &v26);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SYSendingSession__waitForMessageWindow__block_invoke_4;
    block[3] = &unk_24CC65418;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v23, block);

    os_activity_scope_leave(&v26);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v24 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26.opaque[0]) = 0;
      _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Wait for change slot ended, semaphore cancelled or wait timed out", (uint8_t *)&v26, 2u);
    }
  }
  os_activity_scope_leave(&state);
}

uint64_t __41__SYSendingSession__waitForMessageWindow__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNextBatch");
}

- (void)_fetchNextBatch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *batchObjectIDsByBatchIndex;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  SYSendingSession *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD v43[4];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SYSendingSession _hasSentEnd](self, "_hasSentEnd"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 10);
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    -[SYSession service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sendingBufferCap");

    v8 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __35__SYSendingSession__fetchNextBatch__block_invoke;
    v38[3] = &unk_24CC66578;
    v38[4] = self;
    v41 = v43;
    v42 = v7;
    v9 = v4;
    v39 = v9;
    v10 = v5;
    v40 = v10;
    v11 = (void *)MEMORY[0x212BE0F2C](v38);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__8;
    v36 = __Block_byref_object_dispose__8;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    -[SYSession targetQueue](self, "targetQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v19 = v8;
    v20 = 3221225472;
    v21 = __35__SYSendingSession__fetchNextBatch__block_invoke_9;
    v22 = &unk_24CC665A0;
    v26 = &v28;
    v23 = self;
    v13 = v11;
    v25 = v13;
    v14 = v9;
    v24 = v14;
    v27 = &v32;
    dispatch_sync(v12, &v19);

    v15 = *((unsigned int *)v29 + 6);
    if ((v15 - 1) >= 2)
    {
      if ((_DWORD)v15 == 5)
      {
        -[SYSession setError:](self, "setError:", v33[5], v19, v20, v21, v22, v23);
        -[SYSendingSession _setLocalErrorOccurred](self, "_setLocalErrorOccurred");
        -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
        v15 = *((unsigned int *)v29 + 6);
      }
      -[SYSendingSession setState:](self, "setState:", v15, v19, v20, v21, v22, v23);
    }
    else
    {
      v16 = (void *)objc_msgSend(v10, "copy", v19, v20, v21, v22, v23);
      batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_batchIndex);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](batchObjectIDsByBatchIndex, "setObject:forKeyedSubscript:", v16, v18);

      -[SYSendingSession _sendSyncBatch:nextState:](self, "_sendSyncBatch:nextState:", v14, *((unsigned int *)v29 + 6));
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(v43, 8);
  }
}

uint64_t __35__SYSendingSession__fetchNextBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_activity_scope_state_s v10;

  v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &v10);
  +[SYChange changeWithChangeObject:serializer:](SYChange, "changeWithChangeObject:serializer:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v5, "length");

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 64)
    && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v3, "objectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v6 = 1;
  }

  os_activity_scope_leave(&v10);
  return v6;
}

void __35__SYSendingSession__fetchNextBatch__block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  double Current;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  CFAbsoluteTime v12;
  int v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  CFAbsoluteTime v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:enqueueChanges:error:", buf, 2u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  v7 = objc_msgSend(v4, "syncSession:enqueueChanges:error:", v5, v6, &v15);
  v8 = v15;
  v9 = v15;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v10 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = CFAbsoluteTimeGetCurrent() - Current;
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134218496;
    v17 = v12;
    v18 = 1024;
    v19 = v13;
    v20 = 2048;
    v21 = v14;
    _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_INFO, "Delegate callout complete after %.02f seconds: -syncSession:enqueueChanges:error:, state = %{companionsync:SYSessionState}d, %lu changes", buf, 0x1Cu);

  }
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);

}

- (void)_sendSyncBatch:(id)a3 nextState:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  int v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SYSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[SYSendingSession _hasSentEnd](self, "_hasSentEnd"))
  {
LABEL_9:
    -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "count"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v17 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v22 = v4;
      _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_INFO, "No changes to send, setting next state %{companionsync:SYSessionState}d", buf, 8u);
    }
    -[SYSendingSession setState:](self, "setState:", v4);
    goto LABEL_9;
  }
  v8 = (void *)objc_opt_new();
  v9 = -[SYSendingSession _newMessageHeader](self, "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  -[SYSession identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  ++self->_batchIndex;
  objc_msgSend(v8, "setIndex:");
  objc_msgSend(v8, "setChanges:", v6);
  -[SYSendingSession setState:](self, "setState:", 8);
  -[SYSession service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SYSession priority](self, "priority");
  -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__SYSendingSession__sendSyncBatch_nextState___block_invoke;
  v18[3] = &unk_24CC665C8;
  v18[4] = self;
  v19 = v8;
  v20 = v4;
  v16 = v8;
  objc_msgSend(v12, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v16, 103, v13, v14, v15, v18);

LABEL_10:
}

void __45__SYSendingSession__sendSyncBatch_nextState___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  SYMessageStatusRecord *v15;
  id v16;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &state);
  v9 = *(id **)(a1 + 32);
  if (a2)
  {
    v16 = v8;
    v10 = v9[39];
    objc_sync_enter(v10);
    if (objc_msgSend(*(id *)(a1 + 40), "index"))
    {
      while (1)
      {
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "count", v16);
        if (v11 > objc_msgSend(*(id *)(a1 + 40), "index"))
          break;
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v12 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Filling in the batch message IDs array for some reason...", buf, 2u);
        }
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
        v14 = -[SYMessageStatusRecord initFiller]([SYMessageStatusRecord alloc], "initFiller");
        objc_msgSend(v13, "addObject:", v14);

      }
    }
    v15 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setObject:atIndexedSubscript:", v15, objc_msgSend(*(id *)(a1 + 40), "index"));

    objc_sync_exit(v10);
    v8 = v16;
    if (objc_msgSend(*(id *)(a1 + 32), "state") == 8)
      objc_msgSend(*(id *)(a1 + 32), "setState:", *(unsigned int *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v9, "setError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    objc_msgSend(*(id *)(a1 + 32), "_setLocalErrorOccurred");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "signal");
  }
  os_activity_scope_leave(&state);

}

- (void)_sendSyncCompleteAndRunBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  SYErrorInfo *v24;
  void *v25;
  SYErrorInfo *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  unsigned int v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[SYSendingSession _hasSentEnd](self, "_hasSentEnd"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYSendingSession _sendSyncCompleteAndRunBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = (void *)objc_opt_new();
    v15 = -[SYSendingSession _newMessageHeader](self, "_newMessageHeader");
    objc_msgSend(v14, "setHeader:", v15);

    objc_msgSend(v14, "header");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      if (_RunningInXCTest_onceToken != -1)
        dispatch_once(&_RunningInXCTest_onceToken, &__block_literal_global_6);
      if (_RunningInXCTest___value)
      {
        objc_msgSend(v14, "header");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          do
          {
            objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.01);
            v35 = -[SYSendingSession _newMessageHeader](self, "_newMessageHeader");
            objc_msgSend(v14, "setHeader:", v35);

            objc_msgSend(v14, "header");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

          }
          while (!v36);
        }
      }
    }
    -[SYSession identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSessionID:", v17);

    -[SYSession error](self, "error");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      v20 = -[SYSendingSession _localErrorOccurred](self, "_localErrorOccurred");

      if (v20)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v21 = (void *)qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          -[SYSession error](self, "error");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          _os_log_impl(&dword_211704000, v22, OS_LOG_TYPE_DEFAULT, "Attaching error to end-session: %@", buf, 0xCu);

        }
        v24 = [SYErrorInfo alloc];
        -[SYSession error](self, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SYErrorInfo initWithError:](v24, "initWithError:", v25);
        objc_msgSend(v14, "setError:", v26);

        if (-[SYSendingSession canRollback](self, "canRollback"))
          objc_msgSend(v14, "setRollback:", 1);
      }
    }
    v27 = (void *)objc_msgSend(v4, "copy");

    v28 = -[SYSendingSession state](self, "state");
    -[SYSession service](self, "service");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "syncEngine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SYSession priority](self, "priority");
    -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __49__SYSendingSession__sendSyncCompleteAndRunBlock___block_invoke;
    v37[3] = &unk_24CC665F0;
    v37[4] = self;
    v39 = v28;
    v4 = v27;
    v38 = v4;
    objc_msgSend(v30, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v14, 105, v31, v32, v33, v37);

    -[SYSendingSession _sentEnd](self, "_sentEnd");
  }

}

void __49__SYSendingSession__sendSyncCompleteAndRunBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  SYMessageStatusRecord *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  os_activity_scope_state_s v15;

  v7 = a3;
  v8 = a4;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &v15);
  if (a2
    && (v9 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7), v10 = *(_QWORD *)(a1 + 32), v11 = *(void **)(v10 + 304), *(_QWORD *)(v10 + 304) = v9, v11, objc_msgSend(*(id *)(a1 + 32), "state") == *(_DWORD *)(a1 + 48)))
  {
    v12 = 7;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 2 || *(_DWORD *)(a1 + 48) != 2)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    v12 = 5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", v12);
LABEL_11:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, *(dispatch_block_t *)(a1 + 40));

  }
  os_activity_scope_leave(&v15);

}

- (void)_sendSyncCancelled
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  SYErrorInfo *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[SYSendingSession _hasSentEnd](self, "_hasSentEnd"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
    -[SYSession setError:](self, "setError:", v4);
    v5 = (void *)objc_opt_new();
    v6 = -[SYSendingSession _newMessageHeader](self, "_newMessageHeader");
    objc_msgSend(v5, "setHeader:", v6);

    -[SYSession identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSessionID:", v7);

    v8 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", v4);
    objc_msgSend(v5, "setError:", v8);

    if (-[SYSendingSession canRollback](self, "canRollback"))
      objc_msgSend(v5, "setRollback:", 1);
    -[SYSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SYSession priority](self, "priority");
    -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __38__SYSendingSession__sendSyncCancelled__block_invoke;
    v14[3] = &unk_24CC65788;
    v14[4] = self;
    objc_msgSend(v10, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v5, 105, v11, v12, v13, v14);

    -[SYSendingSession _sentEnd](self, "_sentEnd");
  }
}

void __38__SYSendingSession__sendSyncCancelled__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &state);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SYSendingSession__sendSyncCancelled__block_invoke_2;
  block[3] = &unk_24CC65418;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v8, block);

  os_activity_scope_leave(&state);
}

uint64_t __38__SYSendingSession__sendSyncCancelled__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionFinished");
}

- (void)_sendSyncRestart
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SYSendingSession canRestart](self, "canRestart"))
  {
    v4 = (void *)objc_opt_new();
    v5 = -[SYSendingSession _newMessageHeader](self, "_newMessageHeader");
    objc_msgSend(v4, "setHeader:", v5);

    -[SYSession identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSessionID:", v6);

    -[SYSession service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SYSession priority](self, "priority");
    -[SYSession combinedEngineOptions:](self, "combinedEngineOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __36__SYSendingSession__sendSyncRestart__block_invoke;
    v15[3] = &unk_24CC65788;
    v15[4] = self;
    objc_msgSend(v8, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v4, 104, v9, v10, v11, v15);

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("This session does not support being restarted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithSYError:userInfo:", 2008, v13);
    -[SYSession setError:](self, "setError:", v14);

    -[SYSendingSession setState:](self, "setState:", 5);
    -[SYSendingSession _setLocalErrorOccurred](self, "_setLocalErrorOccurred");
  }
}

void __36__SYSendingSession__sendSyncRestart__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  SYMessageStatusRecord *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  os_activity_scope_state_s v16;

  v7 = a3;
  v8 = a4;
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &v16);
  if (a2
    && (v9 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7), v10 = *(_QWORD *)(a1 + 32), v11 = *(void **)(v10 + 296), *(_QWORD *)(v10 + 296) = v9, v11, objc_msgSend(*(id *)(a1 + 32), "state") == 4))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
    objc_msgSend(*(id *)(a1 + 32), "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "buffersSessions");

    if (v14)
      v15 = 1;
    else
      v15 = 6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    v15 = 5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", v15);
  os_activity_scope_leave(&v16);

}

- (void)_sendEndSessionAndError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  OS_dispatch_source *sessionTimer;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SYSendingSession *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  if (self->_sessionTimer)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      _SYObfuscate(self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling session timer for %{public}@", buf, 0xCu);

    }
    dispatch_source_cancel((dispatch_source_t)self->_sessionTimer);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = 0;

  }
  -[SYSendingSession _setComplete](self, "_setComplete");
  -[SYSession targetQueue](self, "targetQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __44__SYSendingSession__sendEndSessionAndError___block_invoke;
  v16 = &unk_24CC652B8;
  v17 = self;
  v18 = v4;
  v11 = v4;
  dispatch_sync(v10, &v13);

  -[SYSession service](self, "service", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionDidEnd:withError:", self, v11);

  -[SYSession didCompleteSession](self, "didCompleteSession");
}

void __44__SYSendingSession__sendEndSessionAndError___block_invoke(uint64_t a1)
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

- (void)_notifyErrorAndShutdown
{
  NSObject *stateUpdateSource;
  id v4;
  _QWORD v5[5];

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
    dispatch_source_cancel(stateUpdateSource);
  if (-[SYSendingSession _localErrorOccurred](self, "_localErrorOccurred")
    && !-[SYSendingSession _hasSentEnd](self, "_hasSentEnd"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__SYSendingSession__notifyErrorAndShutdown__block_invoke;
    v5[3] = &unk_24CC65418;
    v5[4] = self;
    -[SYSendingSession _sendSyncCompleteAndRunBlock:](self, "_sendSyncCompleteAndRunBlock:", v5);
  }
  else
  {
    -[SYSession error](self, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SYSendingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", v4);

  }
}

void __43__SYSendingSession__notifyErrorAndShutdown__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setStateQuietly:", 5);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendEndSessionAndError:", v3);

}

- (void)_sessionFinished
{
  NSObject *stateUpdateSource;
  uint64_t v4;
  id v5;

  -[_SYCountedSemaphore invalidate](self->_changeConcurrencySemaphore, "invalidate");
  stateUpdateSource = self->_stateUpdateSource;
  if (stateUpdateSource)
    dispatch_source_cancel(stateUpdateSource);
  if (-[SYSendingSession wasCancelled](self, "wasCancelled"))
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
  else
    v4 = 0;
  v5 = (id)v4;
  -[SYSendingSession _sendEndSessionAndError:](self, "_sendEndSessionAndError:", v4);

}

- (void)_processNextState
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  os_activity_scope_state_s state;
  uint8_t v19[128];
  uint8_t buf[4];
  SYSendingSession *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v4 = -[SYSendingSession state](self, "state");
  switch((int)v4)
  {
    case 1:
      -[SYSendingSession _waitForMessageWindow](self, "_waitForMessageWindow");
      break;
    case 2:
      -[SYSendingSession _sendSyncCompleteAndRunBlock:](self, "_sendSyncCompleteAndRunBlock:", 0);
      break;
    case 3:
      -[SYSendingSession _sendSyncCancelled](self, "_sendSyncCancelled");
      break;
    case 4:
      -[SYSendingSession _sendSyncRestart](self, "_sendSyncRestart");
      break;
    case 5:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[SYSession error](self, "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ entered error state. Error = %@", buf, 0x16u);

      }
      -[SYSendingSession _notifyErrorAndShutdown](self, "_notifyErrorAndShutdown");
      break;
    case 9:
      -[SYSendingSession _sessionFinished](self, "_sessionFinished");
      break;
    default:
      break;
  }
  -[SYSession stateResponders](self, "stateResponders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v11);
    }

    objc_msgSend(v10, "removeAllObjects", (_QWORD)v14);
  }

  os_activity_scope_leave(&state);
}

- (void)_installTimers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *sessionTimer;
  NSObject *v11;
  double v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  OS_dispatch_source *v20;
  OS_dispatch_source *messageTimer;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[SYSession identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __34__SYSendingSession__installTimers__block_invoke;
  v26[3] = &unk_24CC65C88;
  objc_copyWeak(&v28, &location);
  v5 = v4;
  v27 = v5;
  v6 = (void *)MEMORY[0x212BE0F2C](v26);
  self->_sessionStartTime = CFAbsoluteTimeGetCurrent();
  -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
  if (v7 != 0.0)
  {
    -[SYSession queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
    sessionTimer = self->_sessionTimer;
    self->_sessionTimer = v9;

    dispatch_source_set_event_handler((dispatch_source_t)self->_sessionTimer, v6);
    v11 = self->_sessionTimer;
    -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
    v13 = dispatch_walltime(0, (uint64_t)(v12 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_sessionTimer);
    v14 = (void *)MEMORY[0x24BDBCE60];
    -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
    objc_msgSend(v14, "dateWithTimeIntervalSinceNow:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v16 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[SYSession fullSessionTimeout](self, "fullSessionTimeout");
      *(_DWORD *)buf = 134218242;
      v31 = v17;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Session timeout is %.02f seconds. Timer will fire at %{public}@", buf, 0x16u);
    }

  }
  -[SYSession perMessageTimeout](self, "perMessageTimeout");
  if (v18 != 0.0)
  {
    -[SYSession queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v19);
    messageTimer = self->_messageTimer;
    self->_messageTimer = v20;

    dispatch_source_set_event_handler((dispatch_source_t)self->_messageTimer, v6);
    v22 = self->_messageTimer;
    v23 = dispatch_walltime(0, 0x7FFFFFFFFFFFFFFFLL);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
    dispatch_resume((dispatch_object_t)self->_messageTimer);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v24 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[SYSession perMessageTimeout](self, "perMessageTimeout");
      *(_DWORD *)buf = 134217984;
      v31 = v25;
      _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Message timeout is set to %.02f", buf, 0xCu);
    }

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __34__SYSendingSession__installTimers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
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
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__SYSendingSession__installTimers__block_invoke_22;
    block[3] = &unk_24CC65418;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
LABEL_6:

}

void __34__SYSendingSession__installTimers__block_invoke_22(uint64_t a1)
{
  void *v2;
  double *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  os_activity_scope_state_s state;
  const __CFString *v30;
  void *v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &state);
  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = *(double **)(a1 + 32);
  v4 = v3[35];
  objc_msgSend(v3, "fullSessionTimeout");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:", v4 + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543618;
    v34 = v6;
    v35 = 2048;
    v36 = v8;
    _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Session timeout timer fired. Expected to fire at %{public}@, delta is %.02f", buf, 0x16u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 16);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 296);
  if (v12)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("StartRequest"));
    v11 = *(_QWORD *)(a1 + 32);
  }
  v13 = *(_QWORD *)(v11 + 304);
  if (v13)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("EndRequest"));
    v11 = *(_QWORD *)(a1 + 32);
  }
  v14 = *(id *)(v11 + 312);
  objc_sync_enter(v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = *(id *)(*(_QWORD *)(a1 + 32) + 312);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v20, "isComplete", (_QWORD)v25) & 1) == 0)
          objc_msgSend(v15, "addObject:", v20);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("Batches"));

  objc_sync_exit(v14);
  v22 = objc_alloc(MEMORY[0x24BDD1540]);
  v30 = CFSTR("SYSessionMessageStatus");
  v31 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithSYError:userInfo:", 2007, v23);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v24);

  objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  os_activity_scope_leave(&state);
}

- (void)_setMessageTimer
{
  NSObject *messageTimer;
  double v3;
  dispatch_time_t v4;

  messageTimer = self->_messageTimer;
  if (messageTimer)
  {
    -[SYSession perMessageTimeout](self, "perMessageTimeout");
    v4 = dispatch_walltime(0, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(messageTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
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
  v7[2] = __41__SYSendingSession__installStateListener__block_invoke;
  v7[3] = &unk_24CC655F8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_stateUpdateSource);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__SYSendingSession__installStateListener__block_invoke(uint64_t a1)
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

- (void)_startFailedForStateChangeWithError:(id)a3
{
  unsigned int v4;
  NSObject *v6;
  _QWORD block[5];

  v4 = -[SYSendingSession state](self, "state", a3);
  if (v4 > 9 || ((1 << v4) & 0x228) == 0)
  {
    -[SYSession queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SYSendingSession__startFailedForStateChangeWithError___block_invoke;
    block[3] = &unk_24CC65418;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

uint64_t __56__SYSendingSession__startFailedForStateChangeWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionFinished");
}

- (void)start:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *batchObjectIDsByBatchIndex;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[5];
  id v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  SYSendingSession *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  -[SYSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
      batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
      self->_batchObjectIDsByBatchIndex = v6;

    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SYSession identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);

    }
    -[SYSendingSession _installStateListener](self, "_installStateListener");
    -[SYSendingSession _installTimers](self, "_installTimers");
    -[SYSession queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __26__SYSendingSession_start___block_invoke_36;
    v16[3] = &unk_24CC657F0;
    v16[4] = self;
    v17 = v4;
    dispatch_async(v10, v16);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = CFSTR("You cannot start an SYSession without a delegate.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithSYError:userInfo:", 2001, v12);

    -[SYSession queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__SYSendingSession_start___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v15 = v13;
    v19 = v15;
    dispatch_async(v14, block);

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v15);
  }

  os_activity_scope_leave(&state);
}

uint64_t __26__SYSendingSession_start___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEndSessionAndError:", *(_QWORD *)(a1 + 40));
}

void __26__SYSendingSession_start___block_invoke_36(uint64_t a1)
{
  os_activity_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  __CFString *v36;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = _os_activity_create(&dword_211704000, "SYSession (Outgoing)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 272);
  *(_QWORD *)(v3 + 272) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v5)
  {
    if (v5 == 3)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v27 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v27, OS_LOG_TYPE_DEFAULT, "Sending session canceled during initialization", buf, 2u);
      }
      v28 = *(_QWORD *)(a1 + 40);
      v29 = objc_alloc(MEMORY[0x24BDD1540]);
      v30 = -128;
    }
    else
    {
      if (v5 == 5)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v6 = qword_253D84AB8;
        if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Sending session entered error state during initialization.", buf, 2u);
        }
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
        goto LABEL_23;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v31 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(void **)(a1 + 32);
        v33 = v31;
        *(_DWORD *)buf = 67109120;
        v39 = objc_msgSend(v32, "state");
        _os_log_impl(&dword_211704000, v33, OS_LOG_TYPE_DEFAULT, "Unexpected state during initialization: %{companionsync:SYSessionState}d", buf, 8u);

      }
      v28 = *(_QWORD *)(a1 + 40);
      v29 = objc_alloc(MEMORY[0x24BDD1540]);
      v30 = 2011;
    }
    v8 = (void *)objc_msgSend(v29, "initWithSYError:userInfo:", v30, 0);
    (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v8);
    goto LABEL_23;
  }
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newMessageHeader");
  objc_msgSend(v8, "setHeader:", v9);

  objc_msgSend(v8, "setIsResetSync:", objc_msgSend(*(id *)(a1 + 32), "isResetSync"));
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionID:", v10);

  objc_msgSend(v8, "setExpectsRollbackSupport:", objc_msgSend(*(id *)(a1 + 32), "canRollback"));
  objc_msgSend(v8, "setExpectsRestartSupport:", objc_msgSend(*(id *)(a1 + 32), "canRestart"));
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "fullSessionTimeout");
  objc_msgSend(v8, "setSessionTimeout:", Current + v12);
  objc_msgSend(*(id *)(a1 + 32), "reason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReason:", v13);

  objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(*(id *)(a1 + 32), "sessionMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMetadata:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "syncEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(*(id *)(a1 + 32), "priority");
  v22 = *(void **)(a1 + 32);
  v36 = CFSTR("SYEngineUseMessaging");
  v37 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "combinedEngineOptions:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "wrappedUserContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __26__SYSendingSession_start___block_invoke_39;
  v34[3] = &unk_24CC66618;
  v26 = *(void **)(a1 + 40);
  v34[4] = *(_QWORD *)(a1 + 32);
  v35 = v26;
  objc_msgSend(v20, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v8, 102, v21, v24, v25, v34);

LABEL_23:
}

void __26__SYSendingSession_start___block_invoke_39(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  SYMessageStatusRecord *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  os_activity_scope_state_s state;
  uint64_t v26;
  void *v27;
  uint8_t buf[8];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 272), &state);
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_setLocalErrorOccurred");
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
LABEL_20:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_21;
  }
  v9 = -[SYMessageStatusRecord initWithMessageID:]([SYMessageStatusRecord alloc], "initWithMessageID:", v7);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 296);
  *(_QWORD *)(v10 + 296) = v9;

  if (!objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sentStart");
    objc_msgSend(*(id *)(a1 + 32), "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "syncEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "buffersSessions") & 1) != 0)
    {
      +[SYDevice targetableDevice](SYDevice, "targetableDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "supportsFileTransferMessageSend");

      if (v19)
        v20 = 6;
      else
        v20 = 1;
    }
    else
    {

      v20 = 6;
    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", v20);
    goto LABEL_20;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v12 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __26__SYSendingSession_start___block_invoke_39_cold_1(buf, objc_msgSend(*(id *)(a1 + 32), "state"), v12);

  v13 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v13 == 3)
  {
    v21 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v15);
  }
  else if (v13 == 5)
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x24BDD1540]);
    v26 = *MEMORY[0x24BDD0FC8];
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Start session message enqueued, but session is in unexpected state %d"), objc_msgSend(*(id *)(a1 + 32), "state"));
    v27 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v22, "initWithSYError:userInfo:", 2011, v24);

    objc_msgSend(*(id *)(a1 + 32), "_startFailedForStateChangeWithError:", v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_21:
  os_activity_scope_leave(&state);

}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[SYSendingSession _setCancelled](self, "_setCancelled");
  -[SYSession _cancelPendingMessagesReturningFailures](self, "_cancelPendingMessagesReturningFailures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[SYSession service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionFailedToCancelMessageUUIDs:", v4);

  }
  objc_msgSend(v9, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("SYErrorDomain")))
  {

    goto LABEL_8;
  }
  v7 = objc_msgSend(v9, "code");

  if (v7 != -128)
  {
LABEL_8:
    v8 = 5;
    goto LABEL_9;
  }
  if (-[SYSendingSession state](self, "state") != 7)
  {
    v8 = 3;
    goto LABEL_10;
  }
  v8 = 9;
LABEL_9:
  -[SYSession setError:](self, "setError:", v9);
  -[SYSendingSession _setLocalErrorOccurred](self, "_setLocalErrorOccurred");
LABEL_10:
  -[SYSendingSession setState:](self, "setState:", v8);

}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  __int16 flags;
  __int16 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  __int16 v17;
  __int16 v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  os_activity_scope_state_s v25;
  uint8_t buf[4];
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v25);
  -[SYMessageStatusRecord setResponseReceived:](self->_startMessageID, "setResponseReceived:", 1);
  -[SYSession service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "buffersSessions") & 1) != 0)
  {

    goto LABEL_4;
  }
  v9 = -[SYSendingSession state](self, "state") == 6;

  if (v9)
  {
LABEL_4:
    if ((objc_msgSend(v6, "accepted") & 1) != 0)
    {
      os_unfair_lock_lock(&self->_flagsLock);
      flags = (__int16)self->_flags;
      if ((flags & 0x10) != 0)
      {
        if (objc_msgSend(v6, "supportsRestart"))
          v11 = 16;
        else
          v11 = 0;
        flags = (__int16)self->_flags;
      }
      else
      {
        v11 = 0;
      }
      v17 = flags & 0xFFEF | v11;
      *(_WORD *)&self->_flags = v17;
      if ((flags & 0x20) != 0)
      {
        if (objc_msgSend(v6, "supportsRollback"))
          v18 = 32;
        else
          v18 = 0;
        v17 = (__int16)self->_flags;
      }
      else
      {
        v18 = 0;
      }
      *(_WORD *)&self->_flags = v17 & 0xFFDF | v18;
      os_unfair_lock_unlock(&self->_flagsLock);
      if (objc_msgSend(v6, "hasMetadata"))
      {
        v19 = (void *)objc_opt_class();
        objc_msgSend(v6, "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unarchiveMetadata:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          -[SYSession setSessionMetadata:](self, "setSessionMetadata:", v21);

      }
      if (-[SYSendingSession state](self, "state") == 6)
      {
        -[SYSendingSession setState:](self, "setState:", 1);
LABEL_37:
        -[SYSendingSession _confirmedStart](self, "_confirmedStart");
        v16 = 1;
        goto LABEL_38;
      }
      if (-[SYSendingSession state](self, "state") == 7)
        goto LABEL_37;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v14 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
        -[SYSendingSession _handleStartSessionResponse:error:].cold.1(buf, -[SYSendingSession state](self, "state"), v14);
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorFromSYErrorInfo:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v15 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Received an error SYStartSyncSessionResponse: %@", buf, 0xCu);
      }
      if (-[SYSendingSession state](self, "state") == 6)
      {
        -[SYSession setError:](self, "setError:", v14);
        -[SYSendingSession setState:](self, "setState:", 5);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v22 = (id)qword_253D84AB8;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = -[SYSendingSession state](self, "state");
          *(_DWORD *)buf = 67109120;
          LODWORD(v27) = v23;
          _os_log_impl(&dword_211704000, v22, OS_LOG_TYPE_DEFAULT, "We are not waiting for this start-session response (current state is %{companionsync:SYSessionState}d, so I'm not setting error state here.", buf, 8u);
        }

      }
    }

    goto LABEL_37;
  }
  v16 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2011, 0);
LABEL_38:
  os_activity_scope_leave(&v25);

  return v16;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  id v5;
  NSMutableArray *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSMutableDictionary *batchObjectIDsByBatchIndex;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v26;
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v6 = self->_batchMessageIDs;
  objc_sync_enter(v6);
  v7 = objc_msgSend(v5, "index");
  if (v7 < -[NSMutableArray count](self->_batchMessageIDs, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_batchMessageIDs, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setResponseReceived:](v8, "setResponseReceived:", 1);
LABEL_3:

    goto LABEL_7;
  }
  if (_RunningInXCTest_onceToken != -1)
    dispatch_once(&_RunningInXCTest_onceToken, &__block_literal_global_6);
  if (!_RunningInXCTest___value)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SYSendingSession _handleSyncBatchResponse:error:].cold.1(v27, objc_msgSend(v5, "index"), -[NSMutableArray count](self->_batchMessageIDs, "count"), v8);
    goto LABEL_3;
  }
LABEL_7:
  objc_sync_exit(v6);

  -[NSMutableIndexSet addIndex:](self->_ackedBatchIndices, "addIndex:", objc_msgSend(v5, "index"));
  -[_SYCountedSemaphore signal](self->_changeConcurrencySemaphore, "signal");
  if (objc_msgSend(v5, "hasError"))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v5, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorFromSYErrorInfo:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v12 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncBatchResponse: %@", buf, 0xCu);
    }
    -[SYSession setError:](self, "setError:", v11);
    -[SYSendingSession setState:](self, "setState:", 5);

  }
  -[SYSession delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    batchObjectIDsByBatchIndex = self->_batchObjectIDsByBatchIndex;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "index"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](batchObjectIDsByBatchIndex, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = self->_batchObjectIDsByBatchIndex;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "index"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

      -[SYSession targetQueue](self, "targetQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __51__SYSendingSession__handleSyncBatchResponse_error___block_invoke;
      v22[3] = &unk_24CC652B8;
      v22[4] = self;
      v23 = v17;
      dispatch_async(v20, v22);

    }
  }
  os_activity_scope_leave(&state);

  return 1;
}

void __51__SYSendingSession__handleSyncBatchResponse_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncSession:successfullySynced:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  os_activity_scope_state_s v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &v17);
  -[SYMessageStatusRecord setResponseReceived:](self->_startMessageID, "setResponseReceived:", 1);
  -[SYSession service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "buffersSessions") & 1) != 0)
  {

LABEL_4:
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
        v19 = v12;
        _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Received an error SYSyncSessionRestartResponse: %@", buf, 0xCu);
      }
      -[SYSession setError:](self, "setError:", v12);
      -[SYSendingSession setState:](self, "setState:", 5);

    }
    else if ((objc_msgSend(v6, "accepted") & 1) != 0)
    {
      -[NSMutableIndexSet removeAllIndexes](self->_ackedBatchIndices, "removeAllIndexes");
      -[SYSendingSession setState:](self, "setState:", 1);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v15 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Restart was rejected by slave, cancelling session now.", buf, 2u);
      }
      -[SYSession cancel](self, "cancel");
    }
    -[SYSendingSession _confirmedStart](self, "_confirmedStart");
    v14 = 1;
    goto LABEL_20;
  }
  v9 = -[SYSendingSession state](self, "state") == 6;

  if (v9)
    goto LABEL_4;
  v14 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2011, 0);
LABEL_20:
  os_activity_scope_leave(&v17);

  return v14;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
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
  -[SYMessageStatusRecord setResponseReceived:](self->_endMessageID, "setResponseReceived:", 1);
  v7 = -[SYSendingSession state](self, "state");
  if (v7 == 7)
  {
    if (objc_msgSend(v6, "hasError"))
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorFromSYErrorInfo:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Received an error SYEndSyncSessionResponse: %@", buf, 0xCu);
      }
      -[SYSession setError:](self, "setError:", v10);
      -[SYSendingSession setState:](self, "setState:", 5);

      goto LABEL_25;
    }
    if (objc_msgSend(v6, "hasDidRollback") && (objc_msgSend(v6, "didRollback") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 2008, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYSession setError:](self, "setError:", v15);

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v14 = (id)qword_253D84AB8;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[SYSession error](self, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "End session with rollback was rejected by slave: %@", buf, 0xCu);

      }
    }
    else
    {
      if (-[NSMutableIndexSet countOfIndexesInRange:](self->_ackedBatchIndices, "countOfIndexesInRange:", 0, self->_batchIndex) == self->_batchIndex)
      {
        v12 = 9;
LABEL_24:
        -[SYSendingSession setState:](self, "setState:", v12);
LABEL_25:
        -[SYSendingSession _confirmedEnd](self, "_confirmedEnd");
        goto LABEL_26;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYOutgoingBatchSyncSession _handleBatchSyncEndResponse:error:].cold.1((uint64_t *)&self->_batchIndex, (uint64_t *)&self->_ackedBatchIndices, v13);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithSYError:userInfo:", 2012, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      -[SYSession setError:](self, "setError:", v14);
    }

    v12 = 5;
    goto LABEL_24;
  }
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2011, 0);
LABEL_26:
  os_activity_scope_leave(&v18);

  return v7 == 7;
}

- (void)_resolvedIdentifierForRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "idsIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SYSession _recordOutgoingMessageUUID:](self, "_recordOutgoingMessageUUID:", v4);

}

- (void)_sentMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = 296;
  -[SYMessageStatusRecord messageID](self->_startMessageID, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v10
    || (v8 = 304,
        -[SYMessageStatusRecord messageID](self->_endMessageID, "messageID"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", v6),
        v11,
        v12))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "setDeviceACKReceived:", 1);
  }
  else
  {
    v13 = self->_batchMessageIDs;
    objc_sync_enter(v13);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_batchMessageIDs;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v18, "messageID", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v6);

          if (v20)
          {
            objc_msgSend(v18, "setDeviceACKReceived:", 1);
            goto LABEL_14;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v13);
  }

}

- (void)_peerProcessedMessageWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SYSession _clearOutgoingMessageUUID:](self, "_clearOutgoingMessageUUID:", v6);
  v8 = 296;
  -[SYMessageStatusRecord messageID](self->_startMessageID, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v10
    || (v8 = 304,
        -[SYMessageStatusRecord messageID](self->_endMessageID, "messageID"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", v6),
        v11,
        v12))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "setApplicationACKReceived:", 1);
  }
  else
  {
    v13 = self->_batchMessageIDs;
    objc_sync_enter(v13);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_batchMessageIDs;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v18, "messageID", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v6);

          if (v20)
          {
            objc_msgSend(v18, "setApplicationACKReceived:", 1);
            goto LABEL_14;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v13);
  }

}

- (void)_continue
{
  void *v3;
  objc_super v4;

  if (-[SYSendingSession state](self, "state"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2021, 0);
    -[SYSession setError:](self, "setError:", v3);

    -[SYSendingSession setState:](self, "setState:", 5);
    os_unfair_lock_lock(&self->_flagsLock);
    *(_WORD *)&self->_flags &= ~0x4000u;
    os_unfair_lock_unlock(&self->_flagsLock);
  }
  v4.receiver = self;
  v4.super_class = (Class)SYSendingSession;
  -[SYSession _continue](&v4, sel__continue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchMessageIDs, 0);
  objc_storeStrong((id *)&self->_endMessageID, 0);
  objc_storeStrong((id *)&self->_startMessageID, 0);
  objc_storeStrong((id *)&self->_batchObjectIDsByBatchIndex, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
  objc_storeStrong((id *)&self->_ackedBatchIndices, 0);
  objc_storeStrong((id *)&self->_changeWaitActivity, 0);
  objc_storeStrong((id *)&self->_changeConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_changeFetcherQueue, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_stateUpdateSource, 0);
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "Wait for change slot ended, slot is available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

void __41__SYSendingSession__waitForMessageWindow__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "About to wait for change slot", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (void)_sendSyncCompleteAndRunBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "Sending end-session message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

void __34__SYSendingSession__installTimers__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_211704000, log, (os_log_type_t)0x90u, "Session timeout timer fired. Session ID is %{public}@, weak session reference is %p", (uint8_t *)&v4, 0x16u);
}

void __26__SYSendingSession_start___block_invoke_39_cold_1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Start session message enqueued, but session has changed to state %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleStartSessionResponse:(os_log_t)log error:.cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_211704000, log, (os_log_type_t)0x90u, "Received an accepted start-session response while in unexpected state %{companionsync:SYSessionState}d", buf, 8u);
}

- (void)_handleSyncBatchResponse:(uint64_t)a3 error:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Batch %lu response doesn't have a corresponding entry in list of message IDs (which goes up to %lu)", buf, 0x16u);
}

@end
