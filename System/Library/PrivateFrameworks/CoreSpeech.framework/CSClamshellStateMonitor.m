@implementation CSClamshellStateMonitor

- (CSClamshellStateMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSClamshellStateMonitor;
  return -[CSEventMonitor init](&v3, sel_init);
}

- (BOOL)isClamshellClosed
{
  return 0;
}

- (void)_didReceiveClamshellStateChangeNotification:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CSClamshellStateMonitor__didReceiveClamshellStateChangeNotification___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withClamshellState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSClamshellStateMonitor:didReceiveClamshellStateChange:", self, v4);

}

uint64_t __71__CSClamshellStateMonitor__didReceiveClamshellStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withClamshellState:", a2, *(unsigned __int8 *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6631 != -1)
    dispatch_once(&sharedInstance_onceToken_6631, &__block_literal_global_6632);
  return (id)sharedInstance__sharedInstance_6633;
}

void __41__CSClamshellStateMonitor_sharedInstance__block_invoke()
{
  CSClamshellStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSClamshellStateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_6633;
  sharedInstance__sharedInstance_6633 = (uint64_t)v0;

}

@end
