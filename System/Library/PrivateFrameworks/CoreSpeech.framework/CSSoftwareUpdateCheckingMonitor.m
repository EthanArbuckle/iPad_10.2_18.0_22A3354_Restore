@implementation CSSoftwareUpdateCheckingMonitor

- (CSSoftwareUpdateCheckingMonitor)init
{
  CSSoftwareUpdateCheckingMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSSoftwareUpdateCheckingMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_isSoftwareUpdateCheckingRunning = 0;
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
    handler[2] = __61__CSSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch("com.apple.duetscheduler.restartCheckNotification", &self->_notifyToken, v4, handler);
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSoftwareUpdateCheckingMonitor _startMonitoringWithQueue:]";
      v6 = "%s Start monitoring : Software update checking state";
      goto LABEL_6;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSoftwareUpdateCheckingMonitor _startMonitoringWithQueue:]";
      v6 = "%s Cannot start monitoring software update checking state because it was already started";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  self->_isSoftwareUpdateCheckingRunning = -[CSSoftwareUpdateCheckingMonitor _checkSoftwareUpdateCheckingState](self, "_checkSoftwareUpdateCheckingState");

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
      v6 = "-[CSSoftwareUpdateCheckingMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Software update checking state", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)_checkSoftwareUpdateCheckingState
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[CSSoftwareUpdateCheckingMonitor _softwareUpdateCheckingState](self, "_softwareUpdateCheckingState");
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2 == 1)
      v4 = CFSTR("YES");
    v6 = 136315394;
    v7 = "-[CSSoftwareUpdateCheckingMonitor _checkSoftwareUpdateCheckingState]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Software update checking running : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v2 == 1;
}

- (unsigned)_softwareUpdateCheckingState
{
  uint64_t v4;
  int out_token;

  out_token = -1;
  notify_register_check("com.apple.duetscheduler.restartCheckNotification", &out_token);
  if (out_token == -1)
    return 0;
  v4 = 0;
  notify_get_state(out_token, &v4);
  notify_cancel(out_token);
  if (v4)
    return 1;
  else
    return 2;
}

- (BOOL)isSoftwareUpdateCheckingRunning
{
  return self->_isSoftwareUpdateCheckingRunning;
}

- (void)_didReceiveSoftwareUpdateCheckingStateChangedInQueue:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__CSSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_didReceiveSoftwareUpdateCheckingStateChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__CSSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

- (void)_notifyObserver:(id)a3 withSoftwareUpdateCheckingRunning:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSSoftwareUpdateCheckingMonitor:didReceiveStateChanged:", self, v4);

}

uint64_t __81__CSSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withSoftwareUpdateCheckingRunning:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__CSSoftwareUpdateCheckingMonitor__didReceiveSoftwareUpdateCheckingStateChangedInQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withSoftwareUpdateCheckingRunning:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __61__CSSoftwareUpdateCheckingMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(a1 + 32), "_checkSoftwareUpdateCheckingState");
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveSoftwareUpdateCheckingStateChanged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18850 != -1)
    dispatch_once(&sharedInstance_onceToken_18850, &__block_literal_global_18851);
  return (id)sharedInstance__sharedInstance_18852;
}

void __49__CSSoftwareUpdateCheckingMonitor_sharedInstance__block_invoke()
{
  CSSoftwareUpdateCheckingMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSoftwareUpdateCheckingMonitor);
  v1 = (void *)sharedInstance__sharedInstance_18852;
  sharedInstance__sharedInstance_18852 = (uint64_t)v0;

}

@end
