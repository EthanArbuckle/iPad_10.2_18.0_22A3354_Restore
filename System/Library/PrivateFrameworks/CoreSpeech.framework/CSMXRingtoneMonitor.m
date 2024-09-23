@implementation CSMXRingtoneMonitor

- (CSMXRingtoneMonitor)init
{
  CSMXRingtoneMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *eventMonitorQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMXRingtoneMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSMXRingtoneMonitorQueue", 0);
    eventMonitorQueue = v2->_eventMonitorQueue;
    v2->_eventMonitorQueue = (OS_dispatch_queue *)v3;

    -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](v2, "setIsAnyRingtoneCurrentlyPlaying:", 0);
  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startMonitoringWithQueue:]";
    _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  +[CSMXSessionMonitor sharedInstance](CSMXSessionMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

}

- (void)_stopMonitoring
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[CSMXRingtoneMonitor _stopMonitoring]";
    _os_log_debug_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  +[CSMXSessionMonitor sharedInstance](CSMXSessionMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)mxSessionMonitorSomeClientWentActive:(id)a3
{
  id v4;
  NSObject *eventMonitorQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSMXRingtoneMonitor *v9;

  v4 = a3;
  eventMonitorQueue = self->_eventMonitorQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CSMXRingtoneMonitor_mxSessionMonitorSomeClientWentActive___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(eventMonitorQueue, v7);

}

- (void)_handleStartRingtone
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
    v5 = "-[CSMXRingtoneMonitor _handleStartRingtone]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s _handleStartRingtone : Set isRingtone", (uint8_t *)&v4, 0xCu);
  }
  -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](self, "setIsAnyRingtoneCurrentlyPlaying:", 1);
  -[CSMXRingtoneMonitor _startTimeoutTimer](self, "_startTimeoutTimer");
  -[CSMXRingtoneMonitor _notifyObserversOfRingtoneChange](self, "_notifyObserversOfRingtoneChange");
}

- (void)_handleEndRingtone
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
    v5 = "-[CSMXRingtoneMonitor _handleEndRingtone]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s _handleEndRingtone : Reset isRingtone", (uint8_t *)&v4, 0xCu);
  }
  -[CSMXRingtoneMonitor setIsAnyRingtoneCurrentlyPlaying:](self, "setIsAnyRingtoneCurrentlyPlaying:", 0);
  -[CSMXRingtoneMonitor _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  -[CSMXRingtoneMonitor _notifyObserversOfRingtoneChange](self, "_notifyObserversOfRingtoneChange");
}

- (void)_timerCallback
{
  NSObject *eventMonitorQueue;
  _QWORD block[5];

  eventMonitorQueue = self->_eventMonitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSMXRingtoneMonitor__timerCallback__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(eventMonitorQueue, block);
}

- (void)_cancelTimeoutTimer
{
  NSTimer *ringtoneTimeoutTimer;

  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer)
    -[NSTimer invalidate](ringtoneTimeoutTimer, "invalidate");
}

- (void)_startTimeoutTimer
{
  NSTimer *ringtoneTimeoutTimer;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ringtoneTimeoutTimer = self->_ringtoneTimeoutTimer;
  if (ringtoneTimeoutTimer)
    -[NSTimer invalidate](ringtoneTimeoutTimer, "invalidate");
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSMXRingtoneMonitor _startTimeoutTimer]";
    _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSMXRingtoneMonitor__startTimeoutTimer__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_notifyObserversOfRingtoneChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__CSMXRingtoneMonitor__notifyObserversOfRingtoneChange__block_invoke;
  v2[3] = &unk_1E7C29250;
  v2[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v2);
}

- (BOOL)isAnyRingtoneCurrentlyPlaying
{
  return self->_isAnyRingtoneCurrentlyPlaying;
}

- (void)setIsAnyRingtoneCurrentlyPlaying:(BOOL)a3
{
  self->_isAnyRingtoneCurrentlyPlaying = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMonitorQueue, 0);
  objc_storeStrong((id *)&self->_ringtoneTimeoutTimer, 0);
}

uint64_t __55__CSMXRingtoneMonitor__notifyObserversOfRingtoneChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", a2);
}

void __41__CSMXRingtoneMonitor__startTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__timerCallback, 0, 0, 30.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

uint64_t __37__CSMXRingtoneMonitor__timerCallback__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSMXRingtoneMonitor _timerCallback]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s _timerCallback: Safety timeout. Reset isRingtone", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsAnyRingtoneCurrentlyPlaying:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfRingtoneChange");
}

void __60__CSMXRingtoneMonitor_mxSessionMonitorSomeClientWentActive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D494F8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D49880]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48F70]))
    {
      v6 = *MEMORY[0x1E0D18F60];
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          v9 = 136315138;
          v10 = "-[CSMXRingtoneMonitor mxSessionMonitorSomeClientWentActive:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Some audio session with Ringtone category went Active.", (uint8_t *)&v9, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "_handleStartRingtone");
      }
      else
      {
        if (v7)
        {
          v9 = 136315138;
          v10 = "-[CSMXRingtoneMonitor mxSessionMonitorSomeClientWentActive:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Some audio session with Ringtone category went Inactive.", (uint8_t *)&v9, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "_handleEndRingtone");
      }
    }

  }
  else
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSMXRingtoneMonitor mxSessionMonitorSomeClientWentActive:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Received nil notification. Resetting ringtone activity.", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_handleEndRingtone");
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22055 != -1)
    dispatch_once(&sharedInstance_onceToken_22055, &__block_literal_global_22056);
  return (id)sharedInstance_sharedInstance_22057;
}

void __37__CSMXRingtoneMonitor_sharedInstance__block_invoke()
{
  CSMXRingtoneMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSMXRingtoneMonitor);
  v1 = (void *)sharedInstance_sharedInstance_22057;
  sharedInstance_sharedInstance_22057 = (uint64_t)v0;

}

@end
