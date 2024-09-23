@implementation CSHangUpEnabledMonitor

- (CSHangUpEnabledMonitor)init
{
  CSHangUpEnabledMonitor *v3;
  CSHangUpEnabledMonitor *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSHangUpEnabledMonitor;
    v4 = -[CSEventMonitor init](&v8, sel_init);
    if (v4)
    {
      v5 = dispatch_queue_create("CSHangUpEnabledMonitor queue", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

      v4->_isEnabled = 0;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSHangUpEnabledMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s start monitoring Siri Hangup settings in VTPreferences", (uint8_t *)&v6, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_VoiceTriggerDuringCallEnabledDidChange, (CFStringRef)*MEMORY[0x1E0DC8680], 0, CFNotificationSuspensionBehaviorDrop);
  self->_isEnabled = -[CSHangUpEnabledMonitor _checkCanUseVoiceTriggerDuringCallEnabled](self, "_checkCanUseVoiceTriggerDuringCallEnabled");
}

- (void)_stopMonitoring
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSHangUpEnabledMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s stop monitoring Siri Hangup settings in VTPreferences", (uint8_t *)&v5, 0xCu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DC8680], 0);
}

- (void)_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__CSHangUpEnabledMonitor__didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)_checkCanUseVoiceTriggerDuringCallEnabled
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
  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canUseVoiceTriggerDuringPhoneCall");

  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[CSHangUpEnabledMonitor _checkCanUseVoiceTriggerDuringCallEnabled]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Hangup enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (void)_voiceTriggerDuringCallEnabledDidChange
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSHangUpEnabledMonitor__voiceTriggerDuringCallEnabledDidChange__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__CSHangUpEnabledMonitor__voiceTriggerDuringCallEnabledDidChange__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_checkCanUseVoiceTriggerDuringCallEnabled");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(v3 + 28);
  if (v4 == v2)
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v6 = CFSTR("ON");
      if (!v4)
        v6 = CFSTR("OFF");
      v7 = 136315394;
      v8 = "-[CSHangUpEnabledMonitor _voiceTriggerDuringCallEnabledDidChange]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Siri Hangup is already %{public}@, received duplicated notification!", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    *(_BYTE *)(v3 + 28) = v2;
    objc_msgSend(*(id *)(a1 + 32), "_didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
  }
}

uint64_t __87__CSHangUpEnabledMonitor__didReceiveCanUseVoiceTriggerDuringCallSettingChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6150 != -1)
    dispatch_once(&sharedInstance_onceToken_6150, &__block_literal_global_6151);
  return (id)sharedInstance__sharedInstance_6152;
}

void __40__CSHangUpEnabledMonitor_sharedInstance__block_invoke()
{
  CSHangUpEnabledMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSHangUpEnabledMonitor);
  v1 = (void *)sharedInstance__sharedInstance_6152;
  sharedInstance__sharedInstance_6152 = (uint64_t)v0;

}

@end
