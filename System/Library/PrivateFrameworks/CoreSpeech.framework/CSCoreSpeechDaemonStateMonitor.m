@implementation CSCoreSpeechDaemonStateMonitor

- (CSCoreSpeechDaemonStateMonitor)init
{
  CSCoreSpeechDaemonStateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoreSpeechDaemonStateMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)notifyDaemonStateChanged:(unint64_t)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSCoreSpeechDaemonStateMonitor notifyDaemonStateChanged:]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Notifying CoreSpeechDaemon launched", (uint8_t *)&v4, 0xCu);
    }
    notify_post("com.apple.corespeech.corespeechd.launch");
  }
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
    handler[2] = __60__CSCoreSpeechDaemonStateMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch("com.apple.corespeech.corespeechd.launch", &self->_notifyToken, v4, handler);
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : corespeechd state";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSCoreSpeechDaemonStateMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring corespeechd state because it was already started";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }

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
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSCoreSpeechDaemonStateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : corespeechd state", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceiveDaemonStateChanged:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSCoreSpeechDaemonStateMonitor _didReceiveDaemonStateChanged:]";
    v9 = 1026;
    v10 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s CoreSpeechDaemon state changed to %{public}u", buf, 0x12u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CSCoreSpeechDaemonStateMonitor__didReceiveDaemonStateChanged___block_invoke;
  v6[3] = &unk_1E7C28CD8;
  v6[4] = self;
  v6[5] = a3;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v6);
}

- (void)_notifyObserver:(id)a3 withDaemonState:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "coreSpeechDaemonStateMonitor:didReceiveStateChanged:", self, a4);

}

uint64_t __64__CSCoreSpeechDaemonStateMonitor__didReceiveDaemonStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withDaemonState:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __60__CSCoreSpeechDaemonStateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveDaemonStateChanged:", 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25619 != -1)
    dispatch_once(&sharedInstance_onceToken_25619, &__block_literal_global_25620);
  return (id)sharedInstance__sharedInstance_25621;
}

void __48__CSCoreSpeechDaemonStateMonitor_sharedInstance__block_invoke()
{
  CSCoreSpeechDaemonStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSCoreSpeechDaemonStateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_25621;
  sharedInstance__sharedInstance_25621 = (uint64_t)v0;

}

@end
