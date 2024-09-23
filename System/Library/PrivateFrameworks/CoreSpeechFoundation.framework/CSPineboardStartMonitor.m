@implementation CSPineboardStartMonitor

- (CSPineboardStartMonitor)init
{
  CSPineboardStartMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPineboardStartMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isPineBoardStarted = 0;
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
    handler[2] = __53__CSPineboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6880F60;
    handler[4] = self;
    notify_register_dispatch("com.apple.PineBoard.FinishedStartup", &self->_notifyToken, v4, handler);
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSPineboardStartMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : Pineboard start";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSPineboardStartMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring Pineboard start because it was already started";
LABEL_6:
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isPineBoardStarted = -[CSPineboardStartMonitor _checkPineBoardStarted](self, "_checkPineBoardStarted");

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
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSPineboardStartMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Pineboard start", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceivePineboardStartedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CSPineboardStartMonitor__didReceivePineboardStartedInQueue___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceivePineboardStarted:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__CSPineboardStartMonitor__didReceivePineboardStarted___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withStarted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSPineboardStartMonitor:didReceiveStarted:", self, v4);

}

- (BOOL)isPineboardStarted
{
  return self->_isPineBoardStarted;
}

- (BOOL)_checkPineBoardStarted
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v4;
  int out_token;
  int check;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  out_token = -1;
  notify_register_check("com.apple.PineBoard.FinishedStartup", &out_token);
  if (out_token == -1)
  {
    v2 = 0;
  }
  else
  {
    check = 0;
    notify_check(out_token, &check);
    notify_cancel(out_token);
    v2 = check != 0;
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    check = 136315394;
    v8 = "-[CSPineboardStartMonitor _checkPineBoardStarted]";
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s PineBoard started = %{public}@", (uint8_t *)&check, 0x16u);
  }
  return v2;
}

uint64_t __55__CSPineboardStartMonitor__didReceivePineboardStarted___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __62__CSPineboardStartMonitor__didReceivePineboardStartedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __53__CSPineboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkPineBoardStarted");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceivePineboardStarted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3415 != -1)
    dispatch_once(&sharedInstance_onceToken_3415, &__block_literal_global_3416);
  return (id)sharedInstance__sharedInstance_3417;
}

void __41__CSPineboardStartMonitor_sharedInstance__block_invoke()
{
  CSPineboardStartMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSPineboardStartMonitor);
  v1 = (void *)sharedInstance__sharedInstance_3417;
  sharedInstance__sharedInstance_3417 = (uint64_t)v0;

}

@end
