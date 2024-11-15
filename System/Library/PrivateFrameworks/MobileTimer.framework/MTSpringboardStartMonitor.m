@implementation MTSpringboardStartMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  return (id)sharedInstance__sharedInstance;
}

void __43__MTSpringboardStartMonitor_sharedInstance__block_invoke()
{
  MTSpringboardStartMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MTSpringboardStartMonitor);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (MTSpringboardStartMonitor)init
{
  MTSpringboardStartMonitor *v2;
  uint64_t v3;
  MTObserverStore *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTSpringboardStartMonitor;
  v2 = -[MTSpringboardStartMonitor init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v3;

    v2->_notifyToken = -1;
    v5 = dispatch_queue_create("Serial MTSpringboardStartMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_isSpringBoardStarted = -[MTSpringboardStartMonitor _checkSpringBoardStarted](v2, "_checkSpringBoardStarted");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSpringboardStartMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)MTSpringboardStartMonitor;
  -[MTSpringboardStartMonitor dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  char v4;

  if (a3)
  {
    v4 = 0;
    -[MTObserverStore addObserver:wasFirst:](self->_observers, "addObserver:wasFirst:", a3, &v4);
    if (v4)
      -[MTSpringboardStartMonitor _startMonitoringWithQueue:](self, "_startMonitoringWithQueue:", self->_queue);
  }
}

- (void)removeObserver:(id)a3
{
  char v4;

  if (a3)
  {
    v4 = 0;
    -[MTObserverStore removeObserver:wasLast:](self->_observers, "removeObserver:wasLast:", a3, &v4);
    if (v4)
      -[MTSpringboardStartMonitor _stopMonitoring](self, "_stopMonitoring");
  }
}

- (void)enumerateObservers:(id)a3
{
  -[MTObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", a3);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t v7[8];
  _QWORD handler[5];

  v4 = a3;
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__MTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E39CC5E0;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, v4, handler);
    MTLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)v7 = 0;
    v6 = "Start monitoring : Springboard/Carousel start";
  }
  else
  {
    MTLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)v7 = 0;
    v6 = "Cannot start monitoring Springboard/Carousel start because it was already started";
  }
  _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:

  if (!self->_isSpringBoardStarted)
    self->_isSpringBoardStarted = -[MTSpringboardStartMonitor _checkSpringBoardStarted](self, "_checkSpringBoardStarted");

}

uint64_t __55__MTSpringboardStartMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = objc_msgSend(*(id *)(a1 + 32), "_checkSpringBoardStarted");
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveSpringboardStarted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12));
}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  uint8_t v5[16];

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    MTLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring : Springboard/Carousel start", v5, 2u);
    }

  }
}

- (void)didReceiveSpringboardStarted:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__MTSpringboardStartMonitor_didReceiveSpringboardStarted___block_invoke;
  v3[3] = &unk_1E39CC608;
  v3[4] = self;
  v4 = a3;
  -[MTSpringboardStartMonitor enumerateObservers:](self, "enumerateObservers:", v3);
}

void __58__MTSpringboardStartMonitor_didReceiveSpringboardStarted___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "springboardStartMonitor:didReceiveStarted:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

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
  _BYTE state64[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((MTIsHorseman() & 1) != 0)
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
      v2 = *(_QWORD *)state64 != 0;
    }
    MTLogForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      *(_DWORD *)state64 = 138543362;
      *(_QWORD *)&state64[4] = v4;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Springboard/Carousel started = %{public}@", state64, 0xCu);
    }

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
