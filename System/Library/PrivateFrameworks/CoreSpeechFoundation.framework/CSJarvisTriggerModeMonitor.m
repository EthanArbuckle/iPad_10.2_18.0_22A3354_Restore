@implementation CSJarvisTriggerModeMonitor

- (CSJarvisTriggerModeMonitor)init
{
  CSJarvisTriggerModeMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSJarvisTriggerModeMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_triggerMode = 2;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  int64_t v5;
  int v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_jarvisTriggerModeDidChange, CFSTR("kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  v5 = -[CSJarvisTriggerModeMonitor _fetchTriggerMode](self, "_fetchTriggerMode");
  v6 = v5;
  self->_triggerMode = v5;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSJarvisTriggerModeMonitor _startMonitoringWithQueue:]";
    v10 = 1026;
    v11 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : jarvis trigger mode switch, trigger mode is set to %{public}d", (uint8_t *)&v8, 0x12u);
  }
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
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("kCSPreferencesJarvisTriggerModeDidChangeDarwinNotification"), 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSJarvisTriggerModeMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : jarvis trigger mode switch", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setTriggerMode:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor setTriggerMode:]";
    v8 = 1026;
    v9 = a3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setJarvisTriggerMode:", a3);

}

- (int64_t)getTriggerMode
{
  NSObject *v3;
  int64_t triggerMode;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    triggerMode = self->_triggerMode;
    v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor getTriggerMode]";
    v8 = 1026;
    v9 = triggerMode;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return self->_triggerMode;
}

- (int64_t)_fetchTriggerMode
{
  void *v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getJarvisTriggerMode");

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _fetchTriggerMode]";
    v8 = 1026;
    v9 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched Jarvis trigger mode : %{public}d", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (void)_notifyJarvisTriggerModeDidChanged
{
  int64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[CSJarvisTriggerModeMonitor _fetchTriggerMode](self, "_fetchTriggerMode");
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSJarvisTriggerModeMonitor _notifyJarvisTriggerModeDidChanged]";
    v8 = 1026;
    v9 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Notifying jarvis trigger mode change to %{public}d", buf, 0x12u);
  }
  self->_triggerMode = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CSJarvisTriggerModeMonitor__notifyJarvisTriggerModeDidChanged__block_invoke;
  v5[3] = &unk_1E6880FF8;
  v5[4] = self;
  v5[5] = v3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v5);
}

- (void)_notifyObserver:(id)a3 withJarvisTriggerMode:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSJarvisTriggerModeMonitor:didReceiveTriggerModeChanged:", self, a4);

}

uint64_t __64__CSJarvisTriggerModeMonitor__notifyJarvisTriggerModeDidChanged__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withJarvisTriggerMode:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11006 != -1)
    dispatch_once(&sharedInstance_onceToken_11006, &__block_literal_global_11007);
  return (id)sharedInstance__sharedInstance_11008;
}

+ (id)triggerModeStringDescription:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E6880DD0[a3 + 1];
}

void __44__CSJarvisTriggerModeMonitor_sharedInstance__block_invoke()
{
  CSJarvisTriggerModeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSJarvisTriggerModeMonitor);
  v1 = (void *)sharedInstance__sharedInstance_11008;
  sharedInstance__sharedInstance_11008 = (uint64_t)v0;

}

@end
