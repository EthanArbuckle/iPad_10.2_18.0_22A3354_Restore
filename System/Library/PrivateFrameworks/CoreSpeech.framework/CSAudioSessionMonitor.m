@implementation CSAudioSessionMonitor

- (CSAudioSessionMonitor)initWithCrashMonitor:(id)a3
{
  id v4;
  CSAudioSessionMonitor *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CSAudioServerCrashMonitor *v8;
  CSAudioServerCrashMonitor *crashMonitor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAudioSessionMonitor;
  v5 = -[CSEventMonitor init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("audioSessionMonitor queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v5->_audioSessionState = 0;
    if (v4)
    {
      v8 = (CSAudioServerCrashMonitor *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
      v8 = (CSAudioServerCrashMonitor *)objc_claimAutoreleasedReturnValue();
    }
    crashMonitor = v5->_crashMonitor;
    v5->_crashMonitor = v8;

    -[CSAudioServerCrashMonitor addObserver:](v5->_crashMonitor, "addObserver:", v5);
  }

  return v5;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAudioSessionMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : audio session event", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSAudioSessionMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : audio session event", (uint8_t *)&v3, 0xCu);
  }
}

- (unint64_t)getAudioSessionState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CSAudioSessionMonitor_getAudioSessionState__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)notifyAudioSessionStateChange:(unint64_t)a3
{
  NSObject *queue;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD block[6];

  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke;
  block[3] = &unk_1E7C29178;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke_3;
  v7[3] = &unk_1E7C28CD8;
  v7[4] = self;
  v7[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v7);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  -[CSAudioSessionMonitor notifyAudioSessionStateChange:](self, "notifyAudioSessionStateChange:", 2);
}

- (void)audioSessionEventProvidingWillSetAudioSessionActive:(BOOL)a3
{
  if (a3)
    -[CSAudioSessionMonitor notifyAudioSessionStateChange:](self, "notifyAudioSessionStateChange:", 1);
}

- (void)audioSessionEventProvidingDidSetAudioSessionActive:(BOOL)a3
{
  if (!a3)
    -[CSAudioSessionMonitor notifyAudioSessionStateChange:](self, "notifyAudioSessionStateChange:", 2);
}

- (void)setAudioSessionState:(unint64_t)a3
{
  self->_audioSessionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crashMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 40) != v2)
  {
    *(_QWORD *)(v1 + 40) = v2;
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 136315394;
      v7 = "-[CSAudioSessionMonitor notifyAudioSessionStateChange:]_block_invoke";
      v8 = 2050;
      v9 = v5;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Notifying audio session state change to %{public}lu", (uint8_t *)&v6, 0x16u);
    }
  }
}

uint64_t __55__CSAudioSessionMonitor_notifyAudioSessionStateChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withAudioSessionState:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __45__CSAudioSessionMonitor_getAudioSessionState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5891 != -1)
    dispatch_once(&sharedInstance_onceToken_5891, &__block_literal_global_5892);
  return (id)sharedInstance__sharedInstance_5893;
}

void __39__CSAudioSessionMonitor_sharedInstance__block_invoke()
{
  CSAudioSessionMonitor *v0;
  void *v1;

  v0 = -[CSAudioSessionMonitor initWithCrashMonitor:]([CSAudioSessionMonitor alloc], "initWithCrashMonitor:", 0);
  v1 = (void *)sharedInstance__sharedInstance_5893;
  sharedInstance__sharedInstance_5893 = (uint64_t)v0;

}

@end
