@implementation CSBluetoothSpeakerStateMonitor

- (CSBluetoothSpeakerStateMonitor)init
{
  CSBluetoothSpeakerStateMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSBluetoothSpeakerStateMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSBluetoothSpeakerStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isActive = 0;
  }
  return v2;
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
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke;
  v10[3] = &unk_1E7C26928;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v4, "portStateActiveCompletionBlock:", v10);

  v7 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v6, v7))
  {
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_12;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (BOOL)isActive
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
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CSBluetoothSpeakerStateMonitor_isActive__block_invoke;
  v5[3] = &unk_1E7C29228;
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
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id *, void *);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__CSBluetoothSpeakerStateMonitor__startMonitoringWithQueue___block_invoke;
  v12 = &unk_1E7C26950;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setPortStateChangedBlock:", &v9);
  v17[0] = CFSTR("AVVoiceTriggerPort_BluetoothSpeaker");
  v17[1] = CFSTR("AVVoiceTriggerPort_BuiltinSpeaker");
  v18[0] = MEMORY[0x1E0C9AAB0];
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableListeningOnPorts:completionBlock:", v6, &__block_literal_global_18_16268);
  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : BT Speaker state from AVVC", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_stopMonitoring
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPortStateChangedBlock:", 0);
  v7[0] = CFSTR("AVVoiceTriggerPort_BluetoothSpeaker");
  v7[1] = CFSTR("AVVoiceTriggerPort_BuiltinSpeaker");
  v8[0] = MEMORY[0x1E0C9AAA0];
  v8[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableListeningOnPorts:completionBlock:", v3, &__block_literal_global_20_16265);
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSBluetoothSpeakerStateMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : BT Speaker state from AVVC", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_didReceiveBluetoothSpeakerStateChangeNotification:(BOOL)a3
{
  _QWORD v3[5];

  self->_isActive = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__CSBluetoothSpeakerStateMonitor__didReceiveBluetoothSpeakerStateChangeNotification___block_invoke;
  v3[3] = &unk_1E7C29250;
  v3[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("AVVoiceTriggerPort_BluetoothSpeaker");
  v5[1] = CFSTR("AVVoiceTriggerPort_BuiltinSpeaker");
  v6[0] = MEMORY[0x1E0C9AAB0];
  v6[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableListeningOnPorts:completionBlock:", v3, &__block_literal_global_22_16261);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __83__CSBluetoothSpeakerStateMonitor_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1, void *a2)
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
    v3 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBluetoothSpeakerStateMonitor CSAudioServerCrashMonitorDidReceiveServerRestart:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable ListeningOnPorts: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

uint64_t __85__CSBluetoothSpeakerStateMonitor__didReceiveBluetoothSpeakerStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

void __49__CSBluetoothSpeakerStateMonitor__stopMonitoring__block_invoke(uint64_t a1, void *a2)
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
    v3 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBluetoothSpeakerStateMonitor _stopMonitoring]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed to disable ListeningOnPorts: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __60__CSBluetoothSpeakerStateMonitor__startMonitoringWithQueue___block_invoke(id *a1, void *a2)
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
  v7[2] = __60__CSBluetoothSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2;
  v7[3] = &unk_1E7C28E78;
  v8 = v3;
  v6 = v3;
  objc_copyWeak(&v9, a1);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void __60__CSBluetoothSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_16(uint64_t a1, void *a2)
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
    v3 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed to enable ListeningOnPorts: %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __60__CSBluetoothSpeakerStateMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke_2";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s BT Speaker state changed : %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVVoiceTriggerPort_BluetoothSpeaker")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AVVoiceTriggerPort_BluetoothSpeaker"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_didReceiveBluetoothSpeakerStateChangeNotification:", objc_msgSend(v8, "BOOLValue"));

  }
  else
  {
    v9 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSBluetoothSpeakerStateMonitor _startMonitoringWithQueue:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get BT speaker state from AVVC, default to inactive", (uint8_t *)&v10, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_didReceiveBluetoothSpeakerStateChangeNotification:", 0);
  }

}

uint64_t __42__CSBluetoothSpeakerStateMonitor_isActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2;
  block[3] = &unk_1E7C291C0;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CSBluetoothSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s Timed-out for fetching speaker state active info, setting speakerStateActive = NO", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveBluetoothSpeakerStateChangeNotification:", 0);
}

void __62__CSBluetoothSpeakerStateMonitor__fetchSpeakerStateActiveInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v10;
  NSObject *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AVVoiceTriggerPort_BluetoothSpeaker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(void **)(a1 + 40);
  if (v4)
    v5 = 1;
  else
    v5 = v2 == 0;
  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v11 = v6;
      objc_msgSend(v4, "localizedDescription");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[CSBluetoothSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke_2";
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch BT speaker active state, error : %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v2, "BOOLValue");
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("inactive");
      if ((_DWORD)v7)
        v10 = CFSTR("active");
      v13 = 136315394;
      v14 = "-[CSBluetoothSpeakerStateMonitor _fetchSpeakerStateActiveInfo]_block_invoke";
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Queried built-in speaker state as %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_didReceiveBluetoothSpeakerStateChangeNotification:", v7);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_16288 != -1)
    dispatch_once(&sharedInstance_onceToken_16288, &__block_literal_global_16289);
  return (id)sharedInstance__sharedInstance_16290;
}

uint64_t __48__CSBluetoothSpeakerStateMonitor_sharedInstance__block_invoke()
{
  CSBluetoothSpeakerStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSBluetoothSpeakerStateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_16290;
  sharedInstance__sharedInstance_16290 = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance__sharedInstance_16290, "start");
}

@end
