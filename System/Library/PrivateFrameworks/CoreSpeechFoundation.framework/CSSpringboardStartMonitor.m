@implementation CSSpringboardStartMonitor

- (CSSpringboardStartMonitor)init
{
  CSSpringboardStartMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSpringboardStartMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isSpringBoardStarted = 0;
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
    handler[2] = __55__CSSpringboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6880F60;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, v4, handler);
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpringboardStartMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : Springboard start";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSpringboardStartMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring Springboard start because it was already started";
LABEL_6:
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isSpringBoardStarted = -[CSSpringboardStartMonitor _checkSpringBoardStarted](self, "_checkSpringBoardStarted");

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
      v6 = "-[CSSpringboardStartMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Springboard start", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceiveSpringboardStartedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__CSSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveSpringboardStarted:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CSSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke;
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
    objc_msgSend(v6, "CSSpringboardStartMonitor:didReceiveStarted:", self, v4);

}

- (BOOL)isSpringboardStarted
{
  return self->_isSpringBoardStarted;
}

- (BOOL)_checkSpringBoardStarted
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v4;
  int out_token;
  _BYTE state64[12];
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      v2 = 0;
    }
    else
    {
      *(_QWORD *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      notify_cancel(out_token);
      v2 = *(_QWORD *)state64 != 0;
    }
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      *(_DWORD *)state64 = 136315394;
      *(_QWORD *)&state64[4] = "-[CSSpringboardStartMonitor _checkSpringBoardStarted]";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s SpringBoard started = %{public}@", state64, 0x16u);
    }
  }
  return v2;
}

uint64_t __59__CSSpringboardStartMonitor__didReceiveSpringboardStarted___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __66__CSSpringboardStartMonitor__didReceiveSpringboardStartedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withStarted:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55__CSSpringboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkSpringBoardStarted");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveSpringboardStarted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11056 != -1)
    dispatch_once(&sharedInstance_onceToken_11056, &__block_literal_global_11057);
  return (id)sharedInstance__sharedInstance_11058;
}

void __43__CSSpringboardStartMonitor_sharedInstance__block_invoke()
{
  CSSpringboardStartMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSpringboardStartMonitor);
  v1 = (void *)sharedInstance__sharedInstance_11058;
  sharedInstance__sharedInstance_11058 = (uint64_t)v0;

}

@end
