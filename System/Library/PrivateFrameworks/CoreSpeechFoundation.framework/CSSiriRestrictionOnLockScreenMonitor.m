@implementation CSSiriRestrictionOnLockScreenMonitor

- (CSSiriRestrictionOnLockScreenMonitor)init
{
  CSSiriRestrictionOnLockScreenMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSiriRestrictionOnLockScreenMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_isRestricted = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47228], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSSiriRestrictionOnLockScreenMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Setting preference change", (uint8_t *)&v6, 0xCu);
  }
  self->_isRestricted = -[CSSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen](self, "_checkSiriRestrictedOnLockScreen");
}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47228], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSiriRestrictionOnLockScreenMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Setting preference change", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (BOOL)_checkSiriRestrictedOnLockScreen
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
  objc_msgSend(MEMORY[0x1E0D47228], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F48]);

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3 == 2)
      v5 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[CSSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri restricted on lock screen : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3 == 2;
}

- (void)_didReceiveRestrictionChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveRestrictionChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withRestricted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSSiriRestrictionOnLockScreenMonitor:didReceiveRestrictionChanged:", self, v4);

}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  _BOOL8 v5;

  v5 = -[CSSiriRestrictionOnLockScreenMonitor _checkSiriRestrictedOnLockScreen](self, "_checkSiriRestrictedOnLockScreen", a3, a4);
  self->_isRestricted = v5;
  -[CSSiriRestrictionOnLockScreenMonitor _didReceiveRestrictionChanged:](self, "_didReceiveRestrictionChanged:", v5);
}

uint64_t __70__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withRestricted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__CSSiriRestrictionOnLockScreenMonitor__didReceiveRestrictionChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withRestricted:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (sharedInstance_onceToken_5713 != -1)
    dispatch_once(&sharedInstance_onceToken_5713, &__block_literal_global_5714);
  return (id)sharedInstance__sharedInstance_5715;
}

void __54__CSSiriRestrictionOnLockScreenMonitor_sharedInstance__block_invoke()
{
  CSSiriRestrictionOnLockScreenMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriRestrictionOnLockScreenMonitor);
  v1 = (void *)sharedInstance__sharedInstance_5715;
  sharedInstance__sharedInstance_5715 = (uint64_t)v0;

}

@end
