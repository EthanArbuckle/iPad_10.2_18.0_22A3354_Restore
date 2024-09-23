@implementation CSPhraseSpotterEnabledMonitor

- (CSPhraseSpotterEnabledMonitor)init
{
  CSPhraseSpotterEnabledMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPhraseSpotterEnabledMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_isPhraseSpotterEnabled = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PhraseSpotterEnabledDidChange, CFSTR("kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  self->_isPhraseSpotterEnabled = -[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled](self, "_checkPhraseSpotterEnabled");
}

- (void)_stopMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification"), 0);
}

- (void)_didReceivePhraseSpotterSettingChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__CSPhraseSpotterEnabledMonitor__didReceivePhraseSpotterSettingChangedInQueue___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSPhraseSpotterEnabledMonitor:didReceiveEnabled:", self, v4);

}

- (BOOL)isEnabled
{
  return self->_isPhraseSpotterEnabled;
}

- (BOOL)_checkPhraseSpotterEnabled
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "phraseSpotterEnabled");

  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s PhraseSpotter enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (void)_phraseSpotterEnabledDidChange
{
  _BOOL8 v3;
  _BOOL4 isPhraseSpotterEnabled;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[CSPhraseSpotterEnabledMonitor _checkPhraseSpotterEnabled](self, "_checkPhraseSpotterEnabled");
  isPhraseSpotterEnabled = self->_isPhraseSpotterEnabled;
  if (isPhraseSpotterEnabled == v3)
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v6 = CFSTR("ON");
      if (!isPhraseSpotterEnabled)
        v6 = CFSTR("OFF");
      v7 = 136315394;
      v8 = "-[CSPhraseSpotterEnabledMonitor _phraseSpotterEnabledDidChange]";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s PhraseSpotter is already %{public}@, received duplicated notification!", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    self->_isPhraseSpotterEnabled = v3;
    -[CSPhraseSpotterEnabledMonitor _didReceivePhraseSpotterSettingChangedInQueue:](self, "_didReceivePhraseSpotterSettingChangedInQueue:", v3);
  }
}

uint64_t __79__CSPhraseSpotterEnabledMonitor__didReceivePhraseSpotterSettingChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22986 != -1)
    dispatch_once(&sharedInstance_onceToken_22986, &__block_literal_global_22987);
  return (id)sharedInstance__sharedInstance_22988;
}

void __47__CSPhraseSpotterEnabledMonitor_sharedInstance__block_invoke()
{
  CSPhraseSpotterEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSPhraseSpotterEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance_22988;
  sharedInstance__sharedInstance_22988 = (uint64_t)v0;

}

@end
