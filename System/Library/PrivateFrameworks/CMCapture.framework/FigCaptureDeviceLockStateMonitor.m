@implementation FigCaptureDeviceLockStateMonitor

uint64_t __50__FigCaptureDeviceLockStateMonitor_deviceIsLocked__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (BOOL)deviceIsLocked
{
  NSObject *monitorQueue;
  char v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (!_FigIsNotCurrentDispatchQueue())
    FigDebugAssert3();
  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FigCaptureDeviceLockStateMonitor_deviceIsLocked__block_invoke;
  block[3] = &unk_1E491E9A8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(monitorQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)sharedDeviceLockStateMonitor
{
  if (sharedDeviceLockStateMonitor_sDeviceLockStateMonitorOnceToken != -1)
    dispatch_once(&sharedDeviceLockStateMonitor_sDeviceLockStateMonitorOnceToken, &__block_literal_global_53);
  return (id)sharedDeviceLockStateMonitor_sDeviceLockStateMonitor;
}

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureDeviceLockStateMonitor)init
{
  FigCaptureDeviceLockStateMonitor *v2;
  NSObject *monitorQueue;
  _QWORD v5[5];
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDeviceLockStateMonitor;
  v2 = -[FigCaptureDeviceLockStateMonitor init](&v6, sel_init);
  if (v2)
  {
    v2->_monitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v2->_deviceLockStateObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = CFSTR("ExtendedDeviceLockState");
    v8[0] = MEMORY[0x1E0C9AAB0];
    v2->_mobileKeyBagOptions = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    monitorQueue = v2->_monitorQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__FigCaptureDeviceLockStateMonitor_init__block_invoke;
    v5[3] = &unk_1E491E720;
    v5[4] = v2;
    dispatch_async(monitorQueue, v5);
  }
  return v2;
}

void __40__FigCaptureDeviceLockStateMonitor_init__block_invoke(uint64_t a1)
{
  -[FigCaptureDeviceLockStateMonitor _startMonitoringDeviceLockState](*(_QWORD *)(a1 + 32));
}

- (void)_startMonitoringDeviceLockState
{
  NSObject *v2;
  _QWORD handler[5];

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (!*(_DWORD *)(a1 + 24))
    {
      v2 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __67__FigCaptureDeviceLockStateMonitor__startMonitoringDeviceLockState__block_invoke;
      handler[3] = &unk_1E491FB78;
      handler[4] = a1;
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(a1 + 24), v2, handler);
      -[FigCaptureDeviceLockStateMonitor _updateDeviceLockState](a1);
    }
  }
}

- (void)dealloc
{
  NSObject *monitorQueue;
  objc_super v4;
  _QWORD block[5];

  monitorQueue = self->_monitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__FigCaptureDeviceLockStateMonitor_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(monitorQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureDeviceLockStateMonitor;
  -[FigCaptureDeviceLockStateMonitor dealloc](&v4, sel_dealloc);
}

uint64_t __43__FigCaptureDeviceLockStateMonitor_dealloc__block_invoke(uint64_t a1)
{
  return -[FigCaptureDeviceLockStateMonitor _stopMonitoringDeviceLockState](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_stopMonitoringDeviceLockState
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    result = *(unsigned int *)(v1 + 24);
    if ((_DWORD)result)
    {
      result = notify_cancel(result);
      *(_DWORD *)(v1 + 24) = 0;
    }
  }
  return result;
}

FigCaptureDeviceLockStateMonitor *__64__FigCaptureDeviceLockStateMonitor_sharedDeviceLockStateMonitor__block_invoke()
{
  FigCaptureDeviceLockStateMonitor *result;

  result = objc_alloc_init(FigCaptureDeviceLockStateMonitor);
  sharedDeviceLockStateMonitor_sDeviceLockStateMonitor = (uint64_t)result;
  return result;
}

- (void)addDeviceLockStateObserver:(id)a3
{
  NSObject *monitorQueue;
  _QWORD v4[6];

  monitorQueue = self->_monitorQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__FigCaptureDeviceLockStateMonitor_addDeviceLockStateObserver___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(monitorQueue, v4);
}

uint64_t __63__FigCaptureDeviceLockStateMonitor_addDeviceLockStateObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "deviceLockStateMonitor:didUpdateDeviceLockState:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)removeDeviceLockStateObserver:(id)a3
{
  NSObject *monitorQueue;
  _QWORD v4[6];

  monitorQueue = self->_monitorQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__FigCaptureDeviceLockStateMonitor_removeDeviceLockStateObserver___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(monitorQueue, v4);
}

uint64_t __66__FigCaptureDeviceLockStateMonitor_removeDeviceLockStateObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __67__FigCaptureDeviceLockStateMonitor__startMonitoringDeviceLockState__block_invoke(uint64_t a1)
{
  -[FigCaptureDeviceLockStateMonitor _updateDeviceLockState](*(_QWORD *)(a1 + 32));
}

- (void)_updateDeviceLockState
{
  unsigned int v2;
  uint64_t v3;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v2 = MKBGetDeviceLockState();
    v3 = (v2 < 7) & (0x46u >> v2);
    if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)v3)
    {
      *(_BYTE *)(a1 + 40) = (v2 < 7) & (0x46u >> v2);
      -[FigCaptureDeviceLockStateMonitor _updateObserversWithDeviceIsLockedState:](a1, v3);
    }
  }
}

- (void)_updateObserversWithDeviceIsLockedState:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(a1 + 16), "copy", v10, v11);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "deviceLockStateMonitor:didUpdateDeviceLockState:", a1, a2);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

@end
