@implementation CSBuiltinSpeakerStateMonitor

- (CSBuiltinSpeakerStateMonitor)init
{
  CSBuiltinSpeakerStateMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSBuiltinSpeakerStateMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSBuiltInSpeakerStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_builtInSpeakerState = 0;
    v2->_isSpeakerMuted = -[CSBuiltinSpeakerStateMonitor _getIsSpeakerMutedDefaultVal](v2, "_getIsSpeakerMutedDefaultVal");
    -[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo](v2, "_fetchSpeakerStateMutedInfo");
    -[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo](v2, "_fetchSpeakerStateActiveInfo");
  }
  return v2;
}

- (BOOL)_getIsSpeakerMutedDefaultVal
{
  return 1;
}

- (void)_fetchSpeakerStateMutedInfo
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD block[5];
  BOOL v11;
  _QWORD v12[5];
  NSObject *v13;
  BOOL v14;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = -[CSBuiltinSpeakerStateMonitor _getIsSpeakerMutedDefaultVal](self, "_getIsSpeakerMutedDefaultVal");
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke;
  v12[3] = &unk_1E687F250;
  v12[4] = self;
  v14 = v4;
  v7 = v3;
  v13 = v7;
  objc_msgSend(v5, "speakerStateMutedCompletionBlock:", v12);

  v8 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v7, v8))
  {
    queue = self->_queue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_12;
    block[3] = &unk_1E687F440;
    v11 = v4;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)_fetchSpeakerStateActiveInfo
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v10[5];
  NSObject *v11;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke;
  v10[3] = &unk_1E6880AF8;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v4, "speakerStateActiveCompletionBlock:", v10);

  v7 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v6, v7))
  {
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_22;
    block[3] = &unk_1E6881138;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (unint64_t)currentBuiltinSpeakerState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CSBuiltinSpeakerStateMonitor_currentBuiltinSpeakerState__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBuiltinSpeakerMuted
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CSBuiltinSpeakerStateMonitor_isBuiltinSpeakerMuted__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke;
  v11[3] = &unk_1E687F278;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setSpeakerStateChangedBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_27;
  v9[3] = &unk_1E687F2C8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setSpeakerMuteStateChangedBlock:", v9);
  objc_msgSend(v5, "enableSpeakerStateListening:completionBlock:", 1, &__block_literal_global_32);
  +[CSAudioServerCrashMonitor sharedInstance](CSAudioServerCrashMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Speaker state from AVVC", buf, 0xCu);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_stopMonitoring
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSpeakerStateChangedBlock:", 0);
  objc_msgSend(v2, "setSpeakerMuteStateChangedBlock:", 0);
  objc_msgSend(v2, "enableSpeakerStateListening:completionBlock:", 0, &__block_literal_global_34);
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltinSpeakerStateMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Speaker state from AVVC", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setBuiltInSpeakerState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CSBuiltinSpeakerStateMonitor_setBuiltInSpeakerState___block_invoke;
  v4[3] = &unk_1E6881228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_didReceiveBuiltinSpeakerStateChangeNotification:(unint64_t)a3
{
  _QWORD v3[6];

  self->_builtInSpeakerState = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__CSBuiltinSpeakerStateMonitor__didReceiveBuiltinSpeakerStateChangeNotification___block_invoke;
  v3[3] = &unk_1E6880FF8;
  v3[4] = self;
  v3[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withBuiltinSpeakerState:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSBuiltinSpeakerStateMonitor:didReceiveBuiltinSpeakerStateChange:", self, a4);

}

- (void)_didReceiveSpeakerMuteStateChangeNotification:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_isSpeakerMuted = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__CSBuiltinSpeakerStateMonitor__didReceiveSpeakerMuteStateChangeNotification___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v3;

  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableSpeakerStateListening:completionBlock:", 1, &__block_literal_global_38);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)builtInSpeakerState
{
  return self->_builtInSpeakerState;
}

- (BOOL)isSpeakerMuted
{
  return self->_isSpeakerMuted;
}

- (void)setIsSpeakerMuted:(BOOL)a3
{
  self->_isSpeakerMuted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __81__CSBuiltinSpeakerStateMonitor_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBuiltinSpeakerStateMonitor CSAudioServerCrashMonitorDidReceiveServerRestart:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

uint64_t __78__CSBuiltinSpeakerStateMonitor__didReceiveSpeakerMuteStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:isSpeakerMuted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __81__CSBuiltinSpeakerStateMonitor__didReceiveBuiltinSpeakerStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withBuiltinSpeakerState:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __55__CSBuiltinSpeakerStateMonitor_setBuiltInSpeakerState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveBuiltinSpeakerStateChangeNotification:", *(_QWORD *)(a1 + 40));
}

void __47__CSBuiltinSpeakerStateMonitor__stopMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBuiltinSpeakerStateMonitor _stopMonitoring]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to disable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2;
  v7[3] = &unk_1E687F530;
  v8 = v3;
  v6 = v3;
  objc_copyWeak(&v9, a1);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_27(uint64_t a1, char a2)
{
  id *v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2_28;
  v6[3] = &unk_1E687F2A0;
  v8 = a2;
  objc_copyWeak(&v7, v3);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable speakerStateListening: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2_28(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("muted");
    if (!*(_BYTE *)(a1 + 40))
      v3 = CFSTR("not muted");
    v5 = 136315394;
    v6 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Speaker mute state changed: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveSpeakerMuteStateChangeNotification:", *(unsigned __int8 *)(a1 + 40));

}

void __58__CSBuiltinSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Speaker state changed : %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("active")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("active"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_didReceiveBuiltinSpeakerStateChangeNotification:", objc_msgSend(v7, "unsignedIntegerValue"));

  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSBuiltinSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get speaker state from AVVC, default to inactive", (uint8_t *)&v9, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_didReceiveBuiltinSpeakerStateChangeNotification:", 0);
  }

}

uint64_t __53__CSBuiltinSpeakerStateMonitor_isBuiltinSpeakerMuted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __58__CSBuiltinSpeakerStateMonitor_currentBuiltinSpeakerState__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) != 0;
  return result;
}

void __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2;
  block[3] = &unk_1E6880350;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_async(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
    _os_log_error_impl(&dword_1B502E000, v2, OS_LOG_TYPE_ERROR, "%s Timed-out for fetching speaker state active info, setting speakerStateActive = NO", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveBuiltinSpeakerStateChangeNotification:", 0);
}

uint64_t __60__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  NSObject *v8;
  __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = CSLogContextFacilityCoreSpeech;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = v3;
      objc_msgSend(v2, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke_2";
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1B502E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch builtIn speaker active state, error : %{public}@", (uint8_t *)&v10, 0x16u);

    }
    v4 = *(void **)(a1 + 40);
    v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = &stru_1E6885088;
      if (!*(_BYTE *)(a1 + 48))
        v6 = CFSTR("in");
      v10 = 136315394;
      v11 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried built-in speaker state as %{public}@active", (uint8_t *)&v10, 0x16u);
    }
    v4 = *(void **)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
  }
  return objc_msgSend(v4, "_didReceiveBuiltinSpeakerStateChangeNotification:", v5);
}

void __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_2;
  block[3] = &unk_1E687F228;
  v10 = v5;
  v11 = v6;
  v12 = *(_BYTE *)(a1 + 48);
  v13 = a2;
  v8 = v5;
  dispatch_async(v7, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v4 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 40))
      v4 = CFSTR("NO");
    v5 = 136315394;
    v6 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_1B502E000, v2, OS_LOG_TYPE_ERROR, "%s Timed-out for fetching speaker state muted info, setting isMuted = %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveSpeakerMuteStateChangeNotification:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __59__CSBuiltinSpeakerStateMonitor__fetchSpeakerStateMutedInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  unsigned __int8 *v4;
  const __CFString *v5;
  NSObject *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = CSLogContextFacilityCoreSpeech;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = v3;
      objc_msgSend(v2, "localizedDescription");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke_2";
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch speaker state muted info, error : %{public}@", (uint8_t *)&v9, 0x16u);

    }
    v4 = (unsigned __int8 *)(a1 + 48);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("muted");
      if (!*(_BYTE *)(a1 + 49))
        v5 = CFSTR("not muted");
      v9 = 136315394;
      v10 = "-[CSBuiltinSpeakerStateMonitor _fetchSpeakerStateMutedInfo]_block_invoke";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Queried built-in speaker mute state as %{public}@", (uint8_t *)&v9, 0x16u);
    }
    v4 = (unsigned __int8 *)(a1 + 49);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_didReceiveSpeakerMuteStateChangeNotification:", *v4);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6144 != -1)
    dispatch_once(&sharedInstance_onceToken_6144, &__block_literal_global_6145);
  return (id)sharedInstance__sharedInstance_6146;
}

void __46__CSBuiltinSpeakerStateMonitor_sharedInstance__block_invoke()
{
  CSBuiltinSpeakerStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSBuiltinSpeakerStateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_6146;
  sharedInstance__sharedInstance_6146 = (uint64_t)v0;

}

@end
