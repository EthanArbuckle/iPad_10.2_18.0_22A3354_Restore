@implementation CSAudioServerCrashMonitor

- (CSAudioServerCrashMonitor)init
{
  CSAudioServerCrashMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAudioServerCrashMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_serverState = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke;
  v10[3] = &unk_1E6880FD0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setServerCrashedBlock:", v10);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke_5;
  v8[3] = &unk_1E6880FD0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "setServerResetBlock:", v8);
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audiomxd crash / recover event", buf, 0xCu);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_mediaserverdDidRestart
{
  -[CSAudioServerCrashMonitor _didReceiveMediaserverNotification:](self, "_didReceiveMediaserverNotification:", 2);
}

- (void)_didReceiveMediaserverNotification:(unint64_t)a3
{
  _QWORD v3[6];

  self->_serverState = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__CSAudioServerCrashMonitor__didReceiveMediaserverNotification___block_invoke;
  v3[3] = &unk_1E6880FF8;
  v3[4] = self;
  v3[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withMediaserverState:(unint64_t)a4
{
  void *v6;
  char v7;
  char v8;
  id v9;

  v9 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:");
  if (a4 == 2)
  {
    v8 = objc_opt_respondsToSelector();
    v6 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "CSAudioServerCrashMonitorDidReceiveServerRestart:", self);
      goto LABEL_7;
    }
  }
  else
  {
    v6 = v9;
    if (a4 == 1)
    {
      v7 = objc_opt_respondsToSelector();
      v6 = v9;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v9, "CSAudioServerCrashMonitorDidReceiveServerCrash:", self);
LABEL_7:
        v6 = v9;
      }
    }
  }

}

- (unint64_t)serverState
{
  return self->_serverState;
}

- (void)setServerState:(unint64_t)a3
{
  self->_serverState = a3;
}

uint64_t __64__CSAudioServerCrashMonitor__didReceiveMediaserverNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withMediaserverState:", a2, *(_QWORD *)(a1 + 40));
}

void __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received audiomxd or bridgeaudiod crashes event", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveMediaserverNotification:", 1);

}

void __55__CSAudioServerCrashMonitor__startMonitoringWithQueue___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioServerCrashMonitor _startMonitoringWithQueue:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received audiomxd or bridgeaudiod reset event", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveMediaserverNotification:", 2);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11521 != -1)
    dispatch_once(&sharedInstance_onceToken_11521, &__block_literal_global_11522);
  return (id)sharedInstance__sharedInstance_11523;
}

void __43__CSAudioServerCrashMonitor_sharedInstance__block_invoke()
{
  CSAudioServerCrashMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioServerCrashMonitor);
  v1 = (void *)sharedInstance__sharedInstance_11523;
  sharedInstance__sharedInstance_11523 = (uint64_t)v0;

}

@end
