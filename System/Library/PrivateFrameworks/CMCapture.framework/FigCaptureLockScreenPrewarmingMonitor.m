@implementation FigCaptureLockScreenPrewarmingMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)start
{
  if (!sPrewarmingMonitor)
  {
    if (MGGetBoolAnswer())
      sPrewarmingMonitor = (uint64_t)-[FigCaptureLockScreenPrewarmingMonitor _init]([FigCaptureLockScreenPrewarmingMonitor alloc]);
  }
}

- (_QWORD)_init
{
  _QWORD *v1;
  NSObject *v2;
  uint64_t v3;
  objc_super v5;
  _QWORD v6[5];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)FigCaptureLockScreenPrewarmingMonitor;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    v2 = FigDispatchQueueCreateWithPriority();
    v3 = MEMORY[0x1E0C809B0];
    v1[1] = v2;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __97__FigCaptureLockScreenPrewarmingMonitor__registerForBiometricEnrollmentChangesAndStartMonitoring__block_invoke;
    v6[3] = &unk_1E4923948;
    v6[4] = v1;
    *((_DWORD *)v1 + 4) = clspm_registerForNotifyName("com.apple.BiometricKit.enrollmentChanged", v2, (uint64_t)v6);
    v7 = CFSTR("ExtendedDeviceLockState");
    v8[0] = MEMORY[0x1E0C9AAB0];
    v1[5] = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  }
  return v1;
}

+ (void)stop
{
  -[FigCaptureLockScreenPrewarmingMonitor _invalidate](sPrewarmingMonitor);

  sPrewarmingMonitor = 0;
}

- (void)_invalidate
{
  int v2;
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 16);
    if (v2)
    {
      notify_cancel(v2);
      *(_DWORD *)(a1 + 16) = 0;
      v3 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__FigCaptureLockScreenPrewarmingMonitor__invalidate__block_invoke;
      block[3] = &unk_1E491E720;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureLockScreenPrewarmingMonitor;
  -[FigCaptureLockScreenPrewarmingMonitor dealloc](&v3, sel_dealloc);
}

void __52__FigCaptureLockScreenPrewarmingMonitor__invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 20))
    -[FigCaptureLockScreenPrewarmingMonitor _stopMonitoring](v1);
}

- (void)_stopMonitoring
{
  int v2;
  int v3;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v2 = *(_DWORD *)(a1 + 48);
    if (v2)
    {
      notify_cancel(v2);
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
    }
    v3 = *(_DWORD *)(a1 + 24);
    if (v3)
    {
      notify_cancel(v3);
      *(_QWORD *)(a1 + 24) = 0;
      *(_QWORD *)(a1 + 32) = 0;
    }
    if (*(_BYTE *)(a1 + 66))
    {
      objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "removeLayoutObserver:", a1);
      *(_BYTE *)(a1 + 64) = 0;
      *(_BYTE *)(a1 + 66) = 0;
    }
    -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
  }
}

- (uint64_t)_startMonitoring
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (result)
  {
    v1 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
      result = FigDebugAssert3();
    if (*(_BYTE *)(v1 + 20) && !*(_DWORD *)(v1 + 24) && !*(_DWORD *)(v1 + 48) && !*(_BYTE *)(v1 + 66))
    {
      v2 = MEMORY[0x1E0C809B0];
      v3 = *(NSObject **)(v1 + 8);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke;
      v6[3] = &unk_1E4923948;
      v6[4] = v1;
      *(_DWORD *)(v1 + 24) = clspm_registerForNotifyName("com.apple.BiometricKit.activeOperation", v3, (uint64_t)v6);
      v4 = *(NSObject **)(v1 + 8);
      v5[0] = v2;
      v5[1] = 3221225472;
      v5[2] = __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke_2;
      v5[3] = &unk_1E4923948;
      v5[4] = v1;
      *(_DWORD *)(v1 + 48) = clspm_registerForNotifyName("com.apple.mobile.keybagd.lock_status", v4, (uint64_t)v5);
      *(_BYTE *)(v1 + 65) = 1;
      result = objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "addLayoutObserver:", v1);
      *(_WORD *)(v1 + 65) = 256;
    }
  }
  return result;
}

void __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke(uint64_t a1, int a2)
{
  -[FigCaptureLockScreenPrewarmingMonitor _updateActiveBiometricOperation:](*(_QWORD *)(a1 + 32), a2);
}

- (void)_updateActiveBiometricOperation:(uint64_t)a1
{
  int v3;

  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 28);
    if (v3 != a2)
    {
      *(_DWORD *)(a1 + 28) = a2;
      if (v3 == 2)
        *(_QWORD *)(a1 + 32) = mach_absolute_time();
      -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
    }
  }
}

void __57__FigCaptureLockScreenPrewarmingMonitor__startMonitoring__block_invoke_2(uint64_t a1)
{
  -[FigCaptureLockScreenPrewarmingMonitor _updateDeviceLockState](*(_QWORD *)(a1 + 32));
}

- (void)_updateDeviceLockState
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  if (a1)
  {
    v2 = MKBGetDeviceLockState();
    v3 = *(_DWORD *)(a1 + 52);
    if (v2 != v3)
    {
      v4 = v2;
      if (((v2 < 7) & (0x46u >> v2)) == 0 && v3 <= 6 && ((0x39u >> v3) & 1) == 0)
        *(_QWORD *)(a1 + 56) = mach_absolute_time();
      *(_DWORD *)(a1 + 52) = v4;
      -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](a1);
    }
  }
}

- (void)_evaluatePrewarmingConditions
{
  _BOOL4 v2;

  if (a1)
  {
    mach_absolute_time();
    v2 = -[FigCaptureLockScreenPrewarmingMonitor _shouldPrewarmForHostTime:](a1);
    -[FigCaptureLockScreenPrewarmingMonitor _setIsPrewarming:](a1, v2);
  }
}

- (BOOL)_shouldPrewarmForHostTime:(_BOOL8)result
{
  uint64_t v1;
  int v2;
  int v3;
  unsigned int v4;
  float v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  if (result)
  {
    v1 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v2 = *(unsigned __int8 *)(v1 + 67);
    v3 = *(unsigned __int8 *)(v1 + 64);
    v4 = *(_DWORD *)(v1 + 52);
    v5 = (float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0;
    v6 = *(_DWORD *)(v1 + 28);
    v7 = FigHostTimeToNanoseconds();
    result = 0;
    v9 = v5 < 0.5 || v2 != 0;
    if (v3 && ((v4 < 7) & (0x46u >> v4)) == 0 && v9)
      return ((float)((float)(v7 / 1000) / 1000000.0) < 0.5 || v2 != 0) && v6 != 2;
  }
  return result;
}

- (void)_setIsPrewarming:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (*(unsigned __int8 *)(a1 + 67) != a2)
    {
      *(_BYTE *)(a1 + 67) = a2;
      if (a2)
      {
        if (dword_1ECFE9430)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureLockScreenPrewarmingMonitor _prewarmAfterDelay:](a1, 0.25);
      }
      else
      {
        if (*(_QWORD *)(a1 + 72))
        {
          if (dword_1ECFE9430)
          {
            v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](a1);
        }
        *(_QWORD *)(a1 + 56) = 0;
        *(_QWORD *)(a1 + 32) = 0;
      }
    }
  }
}

- (void)_prewarmAfterDelay:(uint64_t)a1
{
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](a1);
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    v5 = dispatch_time(0, (uint64_t)(float)(a2 * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a2 * 0.1 * 1000000000.0));
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    *(_QWORD *)(a1 + 72) = v4;
    dispatch_activate(v4);
  }
}

- (void)_cancelDelayedPrewarmTimer
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(_QWORD *)(a1 + 72) = 0;
    }
  }
}

uint64_t __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFE9430)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[FigCaptureLockScreenPrewarmingMonitor _cancelDelayedPrewarmTimer](*(_QWORD *)(a1 + 32));
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "prewarmDefaultVideoDeviceForPID:completionHandler:", 0, &__block_literal_global_73);
  return -[FigCaptureLockScreenPrewarmingMonitor _setIsPrewarming:](*(_QWORD *)(a1 + 32), 0);
}

void __60__FigCaptureLockScreenPrewarmingMonitor__prewarmAfterDelay___block_invoke_26()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFE9430)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __97__FigCaptureLockScreenPrewarmingMonitor__registerForBiometricEnrollmentChangesAndStartMonitoring__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2 != 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v3 + 20) != v2)
  {
    *(_BYTE *)(v3 + 20) = v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (a2)
      -[FigCaptureLockScreenPrewarmingMonitor _startMonitoring](v4);
    else
      -[FigCaptureLockScreenPrewarmingMonitor _stopMonitoring](v4);
  }
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  int v8;
  NSObject *notifyQueue;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[6];
  _QWORD v13[6];

  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke;
  v13[3] = &unk_1E491E748;
  v13[4] = a3;
  v13[5] = self;
  if (self->_addingLayoutObserver)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v4;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v8 = objc_msgSend(a3, "isOnLockScreen", v10, v11);
    if (self->_onLockScreen != v8)
    {
      self->_onLockScreen = v8;
      -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions]((uint64_t)self);
    }
  }
  else
  {
    if (!_FigIsNotCurrentDispatchQueue())
      FigDebugAssert3();
    notifyQueue = self->_notifyQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke_2;
    block[3] = &unk_1E491F098;
    block[4] = self;
    block[5] = v13;
    dispatch_sync(notifyQueue, block);
  }
}

void __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isOnLockScreen");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 64) != v2)
  {
    *(_BYTE *)(v3 + 64) = v2;
    -[FigCaptureLockScreenPrewarmingMonitor _evaluatePrewarmingConditions](*(_QWORD *)(a1 + 40));
  }
}

uint64_t __71__FigCaptureLockScreenPrewarmingMonitor_layoutMonitor_didUpdateLayout___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 66))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

@end
