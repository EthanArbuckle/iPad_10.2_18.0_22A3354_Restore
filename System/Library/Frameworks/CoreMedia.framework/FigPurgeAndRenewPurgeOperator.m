@implementation FigPurgeAndRenewPurgeOperator

+ (id)operatorForClientPID:(int)a3 notificationQueue:(id)a4 withPurgeBlock:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithClientPID:withPurgeBlock:notificationQueue:", *(_QWORD *)&a3, a5, a4);
}

- (id)_initWithClientPID:(int)a3 withPurgeBlock:(id)a4 notificationQueue:(id)a5
{
  unsigned int v9;
  FigPurgeAndRenewPurgeOperator *v10;
  FigPurgeAndRenewPurgeOperator *v11;
  objc_super v13;

  v9 = FigNote_AllowInternalDefaultLogs() != 0;
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigPurgeAndRenewProcessStateTracker[1], CFSTR("processtatetracker_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", v9, 0, gFigPurgeAndRenewProcessStateTracker);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1EE141E08, CFSTR("processtatetracker_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 1u, 0, &qword_1EE141E00);
  v13.receiver = self;
  v13.super_class = (Class)FigPurgeAndRenewPurgeOperator;
  v10 = -[FigPurgeAndRenewPurgeOperator init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_clientPID = a3;
    v10->_queue = (OS_dispatch_queue *)a5;
    dispatch_retain((dispatch_object_t)a5);
    v11->_purgeBlock = (id)objc_msgSend(a4, "copy");
    v11->_isSuspended = 0;
    v11->_lastSuspensionTimeNs = 0;
    v11->_purgeTimeoutSeconds = FigGetCFPreferenceNumberWithDefault(CFSTR("purge_timeout_seconds"), CFSTR("com.apple.coremedia"), 600);
    *(_WORD *)&v11->_purgeSuspended = 0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)FigPurgeAndRenewPurgeOperator;
  -[FigPurgeAndRenewPurgeOperator dealloc](&v3, sel_dealloc);
}

- (void)checkAppStateAndPurgeObjectsBasedOnSuspensionTime:(int64_t)a3
{
  if (self->_isSuspended && !self->_purgeSuspended && self->_lastSuspensionTimeNs == a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    (*((void (**)(void))self->_purgeBlock + 2))();
    *(_WORD *)&self->_purgeSuspended = 256;
  }
}

- (void)_setTimeoutBeforePurge:(unsigned int)a3
{
  self->_purgeTimeoutSeconds = a3;
}

- (unsigned)getPurgeTimeoutSeconds
{
  return self->_purgeTimeoutSeconds;
}

- (void)restartPurgeTimerIfNecessary
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int clientPID;
  id *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  id *v14;
  void *lastSuspensionTimeNs;
  dispatch_time_t v16;
  NSObject *queue;
  _QWORD block[4];
  id v19[2];
  os_log_type_t type;
  int v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  FigPurgeAndRenewPurgeOperator *v27;
  id location[17];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  if (dword_1EE141E08)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, &v21, &type);
    v4 = v21;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      clientPID = self->_clientPID;
      v22 = 136315650;
      v23 = "-[FigPurgeAndRenewPurgeOperator restartPurgeTimerIfNecessary]";
      v24 = 1024;
      v25 = clientPID;
      v26 = 2048;
      v27 = self;
      v8 = (id *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v21;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v8, v8 != location, v4, 0, v5);
  }
  if (self->_purgeSuspended)
  {
    if (dword_1EE141E08)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, &v21, &type);
      v10 = v21;
      if (os_log_type_enabled(v9, type))
        v12 = v10;
      else
        v12 = v10 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = self->_clientPID;
        v22 = 136315650;
        v23 = "-[FigPurgeAndRenewPurgeOperator restartPurgeTimerIfNecessary]";
        v24 = 1024;
        v25 = v13;
        v26 = 2048;
        v27 = self;
        v14 = (id *)_os_log_send_and_compose_impl();
        LOBYTE(v10) = v21;
      }
      else
      {
        v14 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v14, v14 != location, v10, 0, v11);
    }
  }
  else
  {
    objc_initWeak(location, self);
    lastSuspensionTimeNs = (void *)self->_lastSuspensionTimeNs;
    v16 = dispatch_time(0x8000000000000000, 1000000000 * self->_purgeTimeoutSeconds);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FigPurgeAndRenewPurgeOperator_restartPurgeTimerIfNecessary__block_invoke;
    block[3] = &unk_1E28D7E70;
    objc_copyWeak(v19, location);
    v19[1] = lastSuspensionTimeNs;
    dispatch_after(v16, queue, block);
    objc_destroyWeak(v19);
    objc_destroyWeak(location);
  }
}

id __61__FigPurgeAndRenewPurgeOperator_restartPurgeTimerIfNecessary__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
    return (id)objc_msgSend(result, "checkAppStateAndPurgeObjectsBasedOnSuspensionTime:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)handleprocessDidSuspendOnQueue
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int clientPID;
  char *v8;
  os_log_type_t type;
  int v10[2];
  const char *v11;
  __int16 v12;
  int v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141E08)
  {
    v10[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, v10, &type);
    v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      clientPID = self->_clientPID;
      v10[1] = 136315394;
      v11 = "-[FigPurgeAndRenewPurgeOperator handleprocessDidSuspendOnQueue]";
      v12 = 1024;
      v13 = clientPID;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
  self->_isSuspended = 1;
  self->_lastSuspensionTimeNs = FigGetUpTimeNanoseconds();
  -[FigPurgeAndRenewPurgeOperator restartPurgeTimerIfNecessary](self, "restartPurgeTimerIfNecessary");
}

- (void)processDidSuspend
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FigPurgeAndRenewPurgeOperator_processDidSuspend__block_invoke;
  block[3] = &unk_1E28D7E98;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__FigPurgeAndRenewPurgeOperator_processDidSuspend__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleprocessDidSuspendOnQueue");
}

- (void)handleProcessIsNoLongerSuspendedOnQueue
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int clientPID;
  char *v8;
  os_log_type_t type;
  int v10[2];
  const char *v11;
  __int16 v12;
  int v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141E08)
  {
    v10[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, v10, &type);
    v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      clientPID = self->_clientPID;
      v10[1] = 136315394;
      v11 = "-[FigPurgeAndRenewPurgeOperator handleProcessIsNoLongerSuspendedOnQueue]";
      v12 = 1024;
      v13 = clientPID;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
  self->_isSuspended = 0;
  self->_lastSuspensionTimeNs = 0;
}

- (void)processIsNoLongerSuspended
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__FigPurgeAndRenewPurgeOperator_processIsNoLongerSuspended__block_invoke;
  block[3] = &unk_1E28D7E98;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__FigPurgeAndRenewPurgeOperator_processIsNoLongerSuspended__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleProcessIsNoLongerSuspendedOnQueue");
}

- (void)processDidTerminate
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int clientPID;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  os_log_type_t type;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141E08)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, &v13, &type);
    v4 = v13;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      clientPID = self->_clientPID;
      v14 = 136315394;
      v15 = "-[FigPurgeAndRenewPurgeOperator processDidTerminate]";
      v16 = 1024;
      v17 = clientPID;
      LODWORD(v11) = 18;
      v10 = &v14;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v13;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v8, v8 != &v18, v4, 0, v5);
  }
  v9 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("FigProcessStateTrackerClientProcessIsTerminated"), self, 0, v10, v11);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v9);
}

- (BOOL)setPurgeSuspended:(BOOL)a3
{
  NSObject *queue;
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  uint64_t v9;
  unsigned int v10;
  char *v11;
  BOOL v12;
  int *v14;
  uint64_t v15;
  os_log_type_t type;
  int v17;
  _QWORD block[6];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  int v24;
  const char *v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  self->_purgeSuspended = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FigPurgeAndRenewPurgeOperator_setPurgeSuspended___block_invoke;
  block[3] = &unk_1E28D7EC0;
  block[4] = self;
  block[5] = &v20;
  v19 = a3;
  dispatch_sync(queue, block);
  v6 = *((unsigned __int8 *)v21 + 24);
  if (*((_BYTE *)v21 + 24) && !a3)
  {
    if (dword_1EE141E08)
    {
      v17 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E00, 1, &v17, &type);
      v8 = v17;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v10 = v8;
      else
        v10 = v8 & 0xFFFFFFFE;
      if (v10)
      {
        v24 = 136315138;
        v25 = "-[FigPurgeAndRenewPurgeOperator setPurgeSuspended:]";
        LODWORD(v15) = 12;
        v14 = &v24;
        v11 = (char *)_os_log_send_and_compose_impl();
        LOBYTE(v8) = v17;
      }
      else
      {
        v11 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E00, 1u, 1, v11, v11 != &v26, v8, 0, v9);
    }
    -[FigPurgeAndRenewPurgeOperator hintProcessMayNeedPurgeTimerRestart](self, "hintProcessMayNeedPurgeTimerRestart", v14, v15);
    v6 = *((unsigned __int8 *)v21 + 24);
  }
  v12 = v6 != 0;
  _Block_object_dispose(&v20, 8);
  return v12;
}

uint64_t __51__FigPurgeAndRenewPurgeOperator_setPurgeSuspended___block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 10))
    v2 = 0;
  else
    v2 = *(unsigned __int8 *)(v1 + 9) == *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (BOOL)purgeSuspended
{
  return self->_purgeSuspended || !self->_isSuspended;
}

- (BOOL)isProcessStateSuspended
{
  return self->_isSuspended;
}

- (void)hintProcessMayNeedPurgeTimerRestart
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__FigPurgeAndRenewPurgeOperator_hintProcessMayNeedPurgeTimerRestart__block_invoke;
  block[3] = &unk_1E28D7E98;
  block[4] = self;
  dispatch_async(queue, block);
}

_BYTE *__68__FigPurgeAndRenewPurgeOperator_hintProcessMayNeedPurgeTimerRestart__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[8])
    return (_BYTE *)objc_msgSend(result, "restartPurgeTimerIfNecessary");
  return result;
}

@end
