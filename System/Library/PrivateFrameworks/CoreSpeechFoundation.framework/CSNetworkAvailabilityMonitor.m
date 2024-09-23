@implementation CSNetworkAvailabilityMonitor

- (CSNetworkAvailabilityMonitor)init
{
  CSNetworkAvailabilityMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSNetworkAvailabilityMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  const char *notify_key;
  NSObject *v6;
  NSObject *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CSNetworkAvailabilityMonitor _startMonitoringWithQueue:]";
      v11 = 2080;
      v12 = notify_key;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s network state notify key : %s", buf, 0x16u);
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__CSNetworkAvailabilityMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6880F60;
    handler[4] = self;
    notify_register_dispatch(notify_key, &self->_notifyToken, v4, handler);
  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSNetworkAvailabilityMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : network availability", buf, 0xCu);
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
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSNetworkAvailabilityMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : network availability", (uint8_t *)&v5, 0xCu);
      notifyToken = self->_notifyToken;
    }
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
}

- (void)_availabilityChanged
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSNetworkAvailabilityMonitor _availabilityChanged]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Network availability changed", (uint8_t *)&v4, 0xCu);
  }
  -[CSNetworkAvailabilityMonitor _didReceivedNetworkAvailabilityChangedNotification:](self, "_didReceivedNetworkAvailabilityChangedNotification:", isDNSAvailable());
}

- (void)_didReceivedNetworkAvailabilityChangedNotification:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__CSNetworkAvailabilityMonitor__didReceivedNetworkAvailabilityChangedNotification___block_invoke;
  v3[3] = &unk_1E6880F88;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withNetworkAvailability:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSNetworkAvailabilityMonitor:didReceiveNetworkAvailabilityChanged:", self, v4);

}

uint64_t __83__CSNetworkAvailabilityMonitor__didReceivedNetworkAvailabilityChangedNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withNetworkAvailability:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __58__CSNetworkAvailabilityMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_availabilityChanged");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9441 != -1)
    dispatch_once(&sharedInstance_onceToken_9441, &__block_literal_global_9442);
  return (id)sharedInstance__sharedInstance_9443;
}

void __46__CSNetworkAvailabilityMonitor_sharedInstance__block_invoke()
{
  CSNetworkAvailabilityMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSNetworkAvailabilityMonitor);
  v1 = (void *)sharedInstance__sharedInstance_9443;
  sharedInstance__sharedInstance_9443 = (uint64_t)v0;

}

@end
