@implementation CSVoiceTriggerEnabledMonitor

- (CSVoiceTriggerEnabledMonitor)init
{
  CSVoiceTriggerEnabledMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerEnabledMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isVoiceTriggerEnabled = 0;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__CSVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6880F60;
    handler[4] = self;
    notify_register_dispatch("com.apple.coreaudio.BorealisToggled", &self->_notifyToken, v4, handler);
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitring : VoiceTrigger setting switch";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring VoiceTrigger setting switch because it was already started";
LABEL_6:
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isVoiceTriggerEnabled = -[CSVoiceTriggerEnabledMonitor _checkVoiceTriggerEnabled](self, "_checkVoiceTriggerEnabled");

}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSVoiceTriggerEnabledMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitring : VoiceTrigger setting switch", (uint8_t *)&v5, 0xCu);
      notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
}

- (void)_didReceiveVoiceTriggerSettingChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveVoiceTriggerSettingChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSVoiceTriggerEnabledMonitor:didReceiveEnabled:", self, v4);

}

- (BOOL)isEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (BOOL)_checkVoiceTriggerEnabled
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
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[CSVoiceTriggerEnabledMonitor _checkVoiceTriggerEnabled]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

uint64_t __70__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__CSVoiceTriggerEnabledMonitor__didReceiveVoiceTriggerSettingChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

void __58__CSVoiceTriggerEnabledMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = v2[28];
  if (v3 == objc_msgSend(v2, "_checkVoiceTriggerEnabled"))
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28))
        v5 = CFSTR("ON");
      else
        v5 = CFSTR("OFF");
      v6 = 136315394;
      v7 = "-[CSVoiceTriggerEnabledMonitor _startMonitoringWithQueue:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s VoiceTrigger is already %{public}@, received duplicated notification!", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkVoiceTriggerEnabled");
    objc_msgSend(*(id *)(a1 + 32), "_didReceiveVoiceTriggerSettingChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5853 != -1)
    dispatch_once(&sharedInstance_onceToken_5853, &__block_literal_global_5854);
  return (id)sharedInstance__sharedInstance_5855;
}

void __46__CSVoiceTriggerEnabledMonitor_sharedInstance__block_invoke()
{
  CSVoiceTriggerEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance_5855;
  sharedInstance__sharedInstance_5855 = (uint64_t)v0;

}

@end
