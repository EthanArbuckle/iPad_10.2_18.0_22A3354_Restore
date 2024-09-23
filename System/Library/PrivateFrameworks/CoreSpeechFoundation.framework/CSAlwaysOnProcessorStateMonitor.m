@implementation CSAlwaysOnProcessorStateMonitor

- (CSAlwaysOnProcessorStateMonitor)init
{
  CSAlwaysOnProcessorStateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAlwaysOnProcessorStateMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_isListeningEnabled = 0;
    result->_notifyToken = -1;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke;
  v7[3] = &unk_1E6880AF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "listeningEnabledCompletionBlock:", v7);

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
      v6 = "-[CSAlwaysOnProcessorStateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AOP Listening state", (uint8_t *)&v5, 0xCu);
      notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
}

- (void)_didReceiveAOPListeningStateChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSAlwaysOnProcessorStateMonitor _didReceiveAOPListeningStateChange:]";
    v10 = 1026;
    v11 = v3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Received AOP Listening state change notification : %{public}d", buf, 0x12u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CSAlwaysOnProcessorStateMonitor__didReceiveAOPListeningStateChange___block_invoke;
  v6[3] = &unk_1E6880F88;
  v6[4] = self;
  v7 = v3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6);
}

- (void)_notifyObserver:(id)a3 withEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSAlwaysOnProcessorStateMonitor:didReceiveStateChange:", self, v4);

}

- (BOOL)isEnabled
{
  return self->_isListeningEnabled;
}

uint64_t __70__CSAlwaysOnProcessorStateMonitor__didReceiveAOPListeningStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withEnabled:", a2, *(unsigned __int8 *)(a1 + 40));
}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CSLogContextFacilityCoreSpeech;
  if (v5 && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v11 = v6;
    objc_msgSend(v5, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    v18 = 2114;
    v19 = v12;
    _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch listeningEnabled : %{public}@", buf, 0x16u);

    v6 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    v18 = 1026;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s listening property in AOP : %{public}d", buf, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "_didReceiveAOPListeningStateChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
  v7 = (int *)(*(_QWORD *)(a1 + 32) + 28);
  if (*v7 == -1)
  {
    v8 = *(NSObject **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_6;
    v13[3] = &unk_1E6880B20;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    notify_register_dispatch("com.apple.audio.AOP.enable", v7, v8, v13);

  }
}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_2;
  v5[3] = &unk_1E6880AF8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "listeningEnabledCompletionBlock:", v5);

}

void __61__CSAlwaysOnProcessorStateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CSLogContextFacilityCoreSpeech;
  if (*(_QWORD *)(a1 + 32) && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    v11 = 2114;
    v12 = v8;
    _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch listeningEnabledOnNotification : %{public}@", (uint8_t *)&v9, 0x16u);

    v6 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[CSAlwaysOnProcessorStateMonitor _startMonitoringWithQueue:]_block_invoke";
    v11 = 1026;
    LODWORD(v12) = a2;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s listening property in AOP : %{public}d", (uint8_t *)&v9, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 40), "_didReceiveAOPListeningStateChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10294 != -1)
    dispatch_once(&sharedInstance_onceToken_10294, &__block_literal_global_10295);
  return (id)sharedInstance_sharedInstance_10296;
}

void __49__CSAlwaysOnProcessorStateMonitor_sharedInstance__block_invoke()
{
  CSAlwaysOnProcessorStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAlwaysOnProcessorStateMonitor);
  v1 = (void *)sharedInstance_sharedInstance_10296;
  sharedInstance_sharedInstance_10296 = (uint64_t)v0;

}

@end
