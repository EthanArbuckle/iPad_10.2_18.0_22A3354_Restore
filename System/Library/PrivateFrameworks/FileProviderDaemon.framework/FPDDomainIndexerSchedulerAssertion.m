@implementation FPDDomainIndexerSchedulerAssertion

- (void)processMonitor:(id)a3 didBecomeForeground:(BOOL)a4
{
  _BOOL4 v4;
  FPDDomainIndexerSchedulerAssertion *v6;
  void (**unregisterForceRunning)(void);
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = self;
  objc_sync_enter(v6);
  unregisterForceRunning = (void (**)(void))v6->_unregisterForceRunning;
  if (v4)
  {
    if (!unregisterForceRunning)
    {
      indexingScheduler();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("request from pid: %d"), v6->_pid, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "forceRunningWithReason:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6->_unregisterForceRunning;
      v6->_unregisterForceRunning = (id)v10;

LABEL_6:
    }
  }
  else if (unregisterForceRunning)
  {
    unregisterForceRunning[2]();
    v8 = v6->_unregisterForceRunning;
    v6->_unregisterForceRunning = 0;
    goto LABEL_6;
  }
  objc_sync_exit(v6);

}

- (void)start
{
  FPDProcessMonitor *v3;
  FPDProcessMonitor *v4;
  FPDProcessMonitor *monitor;

  if (self->_forceForeground)
  {
    -[FPDDomainIndexerSchedulerAssertion processMonitor:didBecomeForeground:](self, "processMonitor:didBecomeForeground:", 0, 1);
  }
  else if (!self->_monitor)
  {
    v3 = [FPDProcessMonitor alloc];
    v4 = -[FPDProcessMonitor initWithExcludedBundleIDs:](v3, "initWithExcludedBundleIDs:", MEMORY[0x1E0C9AA60]);
    monitor = self->_monitor;
    self->_monitor = v4;

    -[FPDProcessMonitor setDelegate:](self->_monitor, "setDelegate:", self);
    -[FPDProcessMonitor addPIDToObserve:](self->_monitor, "addPIDToObserve:", self->_pid);
  }
}

- (FPDDomainIndexerSchedulerAssertion)initWithPID:(int)a3 forceForeground:(BOOL)a4
{
  FPDDomainIndexerSchedulerAssertion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPDDomainIndexerSchedulerAssertion;
  result = -[FPDDomainIndexerSchedulerAssertion init](&v7, sel_init);
  if (result)
  {
    result->_pid = a3;
    result->_forceForeground = a4;
  }
  return result;
}

- (void)stop
{
  FPDDomainIndexerSchedulerAssertion *v2;
  void (**unregisterForceRunning)(void);
  id v4;
  FPDProcessMonitor *monitor;
  FPDProcessMonitor *v6;

  v2 = self;
  objc_sync_enter(v2);
  unregisterForceRunning = (void (**)(void))v2->_unregisterForceRunning;
  if (unregisterForceRunning)
  {
    unregisterForceRunning[2]();
    v4 = v2->_unregisterForceRunning;
    v2->_unregisterForceRunning = 0;

  }
  -[FPDProcessMonitor setDelegate:](v2->_monitor, "setDelegate:", 0);
  monitor = v2->_monitor;
  v2->_monitor = 0;
  v6 = monitor;

  objc_sync_exit(v2);
  -[FPDProcessMonitor invalidate](v6, "invalidate");

}

- (void)dealloc
{
  objc_super v3;

  -[FPDDomainIndexerSchedulerAssertion stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)FPDDomainIndexerSchedulerAssertion;
  -[FPDDomainIndexerSchedulerAssertion dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterForceRunning, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
