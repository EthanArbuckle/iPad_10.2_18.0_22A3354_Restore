@implementation CSAVVCRecordingClientMonitor

- (CSAVVCRecordingClientMonitor)init
{
  CSAVVCRecordingClientMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAVVCRecordingClientMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAVVCRecordingClientMonitor Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_numOfAVVCRecordingClients = 0;
  }
  return v2;
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
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke;
  v11[3] = &unk_1E7C24800;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "siriClientsRecordingCompletionBlock:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_7;
  v9[3] = &unk_1E7C26D40;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setSiriClientRecordStateChangedBlock:", v9);
  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAVVCRecordingClientMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AVVC recording client count", buf, 0xCu);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_stopMonitoring
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSiriClientRecordStateChangedBlock:", 0);

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAVVCRecordingClientMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AVVC recording client count", (uint8_t *)&v6, 0xCu);
  }
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAVVCRecordingClientMonitor CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Reset AVVC recording client count due to audio server crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSAVVCRecordingClientMonitor_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_didReceiveAVVCRecordingClientNumberChange:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAVVCRecordingClientMonitor _didReceiveAVVCRecordingClientNumberChange:]";
    v8 = 2050;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s update AVVC recording client # : %{public}lu", (uint8_t *)&v6, 0x16u);
  }
  self->_numOfAVVCRecordingClients = a3;
}

- (unint64_t)numOfAVVCRecordingClients
{
  return self->_numOfAVVCRecordingClients;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __79__CSAVVCRecordingClientMonitor_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveAVVCRecordingClientNumberChange:", 0);
}

void __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11[2];

  v5 = a3;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_2;
  block[3] = &unk_1E7C247D8;
  v10 = v5;
  v8 = v5;
  objc_copyWeak(v11, a1);
  v11[1] = a2;
  dispatch_async(v7, block);

  objc_destroyWeak(v11);
}

void __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8[2];

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_2_8;
  v7[3] = &unk_1E7C25940;
  objc_copyWeak(v8, v4);
  v8[1] = a3;
  dispatch_async(v6, v7);

  objc_destroyWeak(v8);
}

void __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_2_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveAVVCRecordingClientNumberChange:", *(_QWORD *)(a1 + 40));

}

void __58__CSAVVCRecordingClientMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v5 = v3;
      objc_msgSend(v2, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSAVVCRecordingClientMonitor _startMonitoringWithQueue:]_block_invoke_2";
      v10 = 2114;
      v11 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Failed to fetch recording client info, error : %{public}@", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_didReceiveAVVCRecordingClientNumberChange:", 0);

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "_didReceiveAVVCRecordingClientNumberChange:", *(_QWORD *)(a1 + 48));

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5793 != -1)
    dispatch_once(&sharedInstance_onceToken_5793, &__block_literal_global_5794);
  return (id)sharedInstance__sharedInstance_5795;
}

void __46__CSAVVCRecordingClientMonitor_sharedInstance__block_invoke()
{
  CSAVVCRecordingClientMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAVVCRecordingClientMonitor);
  v1 = (void *)sharedInstance__sharedInstance_5795;
  sharedInstance__sharedInstance_5795 = (uint64_t)v0;

}

@end
