@implementation CSGestureMonitorPhone

- (CSGestureMonitorPhone)init
{
  CSGestureMonitorPhone *v2;
  uint64_t v3;
  CMWakeGestureManager *gestureManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSGestureMonitorPhone;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2 && objc_msgSend(getCMWakeGestureManagerClass(), "isWakeGestureAvailable"))
  {
    objc_msgSend(getCMWakeGestureManagerClass(), "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    gestureManager = v2->_gestureManager;
    v2->_gestureManager = (CMWakeGestureManager *)v3;

  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CMWakeGestureManager setDelegate:](self->_gestureManager, "setDelegate:", self);
  -[CMWakeGestureManager startWakeGestureUpdates](self->_gestureManager, "startWakeGestureUpdates");
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSGestureMonitorPhone _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Start monitoring: wake Gesture", (uint8_t *)&v5, 0xCu);
  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;

  v6 = a3;
  if (a4 == 3)
  {
    v8 = mach_absolute_time();
    v9.receiver = self;
    v9.super_class = (Class)CSGestureMonitorPhone;
    -[CSGestureMonitor setDismissalTimestamp:](&v9, sel_setDismissalTimestamp_, v8);
    -[CSGestureMonitorPhone _didReceiveSleepGesture](self, "_didReceiveSleepGesture");
  }
  else if (a4 == 1)
  {
    v7 = mach_absolute_time();
    v10.receiver = self;
    v10.super_class = (Class)CSGestureMonitorPhone;
    -[CSGestureMonitor setWakeGestureTimestamp:](&v10, sel_setWakeGestureTimestamp_, v7);
    -[CSGestureMonitorPhone _didReceiveWakeGesture](self, "_didReceiveWakeGesture");
  }

}

- (void)_didReceiveWakeGesture
{
  objc_super v2;
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __47__CSGestureMonitorPhone__didReceiveWakeGesture__block_invoke;
  v3[3] = &unk_1E7C29250;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)CSGestureMonitorPhone;
  v3[0] = MEMORY[0x1E0C809B0];
  -[CSEventMonitor enumerateObserversInQueue:](&v2, sel_enumerateObserversInQueue_, v3);
}

- (void)_didReceiveSleepGesture
{
  objc_super v2;
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __48__CSGestureMonitorPhone__didReceiveSleepGesture__block_invoke;
  v3[3] = &unk_1E7C29250;
  v3[4] = self;
  v2.receiver = self;
  v2.super_class = (Class)CSGestureMonitorPhone;
  v3[0] = MEMORY[0x1E0C809B0];
  -[CSEventMonitor enumerateObserversInQueue:](&v2, sel_enumerateObserversInQueue_, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
}

void __48__CSGestureMonitorPhone__didReceiveSleepGesture__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gestureMonitorDidReceiveSleepGesture:", *(_QWORD *)(a1 + 32));

}

void __47__CSGestureMonitorPhone__didReceiveWakeGesture__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "gestureMonitorDidReceiveWakeGesture:", *(_QWORD *)(a1 + 32));

}

@end
