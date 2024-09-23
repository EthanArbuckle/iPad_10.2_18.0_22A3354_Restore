@implementation CSCommandControlStreamEventMonitor

- (CSCommandControlStreamEventMonitor)init
{
  CSCommandControlStreamEventMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCommandControlStreamEventMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_isCommandControlStreaming = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;

  +[CSCommandControlBehaviorMonitor sharedInstance](CSCommandControlBehaviorMonitor, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

  self->_isCommandControlStreaming = 0;
}

- (void)_stopMonitoring
{
  void *v3;

  +[CSCommandControlBehaviorMonitor sharedInstance](CSCommandControlBehaviorMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  self->_isCommandControlStreaming = 0;
}

- (BOOL)isStreaming
{
  NSObject *v3;
  _BOOL4 isCommandControlStreaming;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    isCommandControlStreaming = self->_isCommandControlStreaming;
    v6 = 136315394;
    v7 = "-[CSCommandControlStreamEventMonitor isStreaming]";
    v8 = 1024;
    v9 = isCommandControlStreaming;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching CommandControl Listening State: %d", (uint8_t *)&v6, 0x12u);
  }
  return self->_isCommandControlStreaming;
}

- (void)commandControlBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6
{
  _QWORD v6[5];

  if (a5)
    self->_isCommandControlStreaming = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__CSCommandControlStreamEventMonitor_commandControlBehaviorMonitor_didStartStreamWithContext_successfully_option___block_invoke;
  v6[3] = &unk_1E7C29250;
  v6[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v6, a4);
}

- (void)_notifyStopCommandControl
{
  _QWORD v2[5];

  if (self->_isCommandControlStreaming)
  {
    self->_isCommandControlStreaming = 0;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __63__CSCommandControlStreamEventMonitor__notifyStopCommandControl__block_invoke;
    v2[3] = &unk_1E7C29250;
    v2[4] = self;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v2);
  }
}

uint64_t __63__CSCommandControlStreamEventMonitor__notifyStopCommandControl__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

uint64_t __114__CSCommandControlStreamEventMonitor_commandControlBehaviorMonitor_didStartStreamWithContext_successfully_option___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5689 != -1)
    dispatch_once(&sharedInstance_onceToken_5689, &__block_literal_global_5690);
  return (id)sharedInstance__sharedInstance_5691;
}

void __52__CSCommandControlStreamEventMonitor_sharedInstance__block_invoke()
{
  CSCommandControlStreamEventMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSCommandControlStreamEventMonitor);
  v1 = (void *)sharedInstance__sharedInstance_5691;
  sharedInstance__sharedInstance_5691 = (uint64_t)v0;

}

@end
