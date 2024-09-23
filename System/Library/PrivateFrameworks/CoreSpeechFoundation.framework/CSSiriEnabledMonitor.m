@implementation CSSiriEnabledMonitor

- (CSSiriEnabledMonitor)init
{
  CSSiriEnabledMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSiriEnabledMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_isSiriSettingEnabled = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AssistantPrefsChangedNotification, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = AFPreferencesAssistantEnabled();
  if (self->_isSiriSettingEnabled != (v5 != 0))
    -[CSSiriEnabledMonitor _didReceiveSiriSettingChanged:](self, "_didReceiveSiriSettingChanged:", v5 != 0);
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isSiriSettingEnabled)
      v7 = CFSTR("Enabled");
    else
      v7 = CFSTR("Disabled");
    v8 = 136315394;
    v9 = "-[CSSiriEnabledMonitor _startMonitoringWithQueue:]";
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Siri setting switch, Siri is %{public}@", (uint8_t *)&v8, 0x16u);
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
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSiriEnabledMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Siri setting switch", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  _QWORD v3[5];

  self->_isSiriSettingEnabled = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__CSSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke;
  v3[3] = &unk_1E68810D0;
  v3[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "CSSiriEnabledMonitor:didReceiveEnabled:", self, self->_isSiriSettingEnabled);

}

- (BOOL)isEnabled
{
  return self->_isSiriSettingEnabled;
}

- (BOOL)fetchIsEnabled
{
  BOOL result;

  result = AFPreferencesAssistantEnabled() != 0;
  self->_isSiriSettingEnabled = result;
  return result;
}

uint64_t __54__CSSiriEnabledMonitor__didReceiveSiriSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (sharedInstance_onceToken_258 != -1)
    dispatch_once(&sharedInstance_onceToken_258, &__block_literal_global_259);
  return (id)sharedInstance__sharedInstance;
}

void __38__CSSiriEnabledMonitor_sharedInstance__block_invoke()
{
  CSSiriEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

@end
