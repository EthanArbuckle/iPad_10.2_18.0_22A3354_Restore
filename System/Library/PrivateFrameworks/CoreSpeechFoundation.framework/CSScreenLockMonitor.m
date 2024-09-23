@implementation CSScreenLockMonitor

- (CSScreenLockMonitor)init
{
  CSScreenLockMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSScreenLockMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_isScreenLocked = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSScreenLockMonitor;
  -[CSEventMonitor dealloc](&v2, sel_dealloc);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSScreenLockMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async((dispatch_queue_t)a3, block);
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.lock_status"), 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSScreenLockMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : screen lock / unlock state", (uint8_t *)&v5, 0xCu);
  }
}

- (void)screenLockStateChanged
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[CSScreenLockMonitor _queryIsScreenLocked](self, "_queryIsScreenLocked");
  self->_isScreenLocked = v3;
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Unlocked");
    if (v3)
      v5 = CFSTR("Locked");
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSScreenLockMonitor screenLockStateChanged]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Screen Lock Status Changed : %{public}@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__CSScreenLockMonitor_screenLockStateChanged__block_invoke;
  v6[3] = &unk_1E68810D0;
  v6[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
}

- (BOOL)_queryIsScreenLocked
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("MKBUserSessionID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getuid());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = MKBGetDeviceLockState() - 1 < 2;
  return (char)v2;
}

- (void)_notifyObserver:(id)a3 isScreenLocked:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSScreenLockMonitor:didReceiveScreenLockStateChanged:", self, v4);

}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

uint64_t __45__CSScreenLockMonitor_screenLockStateChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:isScreenLocked:", a2, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __49__CSScreenLockMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)HandleDeviceLockStateChanged, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSScreenLockMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : screen lock / unlock state", (uint8_t *)&v5, 0xCu);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_queryIsScreenLocked");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8453 != -1)
    dispatch_once(&sharedInstance_onceToken_8453, &__block_literal_global_8454);
  return (id)sharedInstance__sharedInstance_8455;
}

void __37__CSScreenLockMonitor_sharedInstance__block_invoke()
{
  CSScreenLockMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSScreenLockMonitor);
  v1 = (void *)sharedInstance__sharedInstance_8455;
  sharedInstance__sharedInstance_8455 = (uint64_t)v0;

}

@end
