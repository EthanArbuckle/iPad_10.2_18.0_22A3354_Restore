@implementation _DKForegroundServicesMonitor

+ (id)entitlements
{
  return &unk_24DA70E68;
}

- (id)servicesOfInterestForWatchCommunication
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.PassbookUIService"), 0);
}

- (void)start
{
  NSMutableSet *v3;
  NSMutableSet *previouslyForegroundServices;
  RBSProcessMonitor *v5;
  RBSProcessMonitor *processMonitor;
  _QWORD v7[5];

  if (-[_DKMonitor instantMonitorNeedsActivation](self, "instantMonitorNeedsActivation"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    previouslyForegroundServices = self->_previouslyForegroundServices;
    self->_previouslyForegroundServices = v3;

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37___DKForegroundServicesMonitor_start__block_invoke;
    v7[3] = &unk_24DA67360;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BE80CC8], "monitorWithConfiguration:", v7);
    v5 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
    processMonitor = self->_processMonitor;
    self->_processMonitor = v5;

  }
}

- (void)stop
{
  RBSProcessMonitor *processMonitor;
  NSMutableSet *previouslyForegroundServices;

  if (-[_DKMonitor instantMonitorNeedsDeactivation](self, "instantMonitorNeedsDeactivation"))
  {
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
    processMonitor = self->_processMonitor;
    self->_processMonitor = 0;

    previouslyForegroundServices = self->_previouslyForegroundServices;
    self->_previouslyForegroundServices = 0;

  }
}

- (void)addServicesForeground:(id)a3 andRemoveServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x219A29278]();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKMonitor log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForServicesAppearingForeground");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_219056000, v10, OS_LOG_TYPE_DEFAULT, "Adding objects: %@, Removing objects: %@, previously %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForServicesAppearingForeground");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjects:andRemoveObjects:fromArrayAtKeyPath:", v6, v7, v13);

  objc_autoreleasePoolPop(v8);
}

- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(a5, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKForegroundServicesMonitor servicesOfInterestForWatchCommunication](self, "servicesOfInterestForWatchCommunication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (v11)
  {
    objc_msgSend(v7, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "taskState");

    if (v13 == 4)
    {
      if ((-[NSMutableSet containsObject:](self->_previouslyForegroundServices, "containsObject:", v9) & 1) == 0)
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKForegroundServicesMonitor addServicesForeground:andRemoveServices:](self, "addServicesForeground:andRemoveServices:", v14, MEMORY[0x24BDBD1A8]);

        -[NSMutableSet addObject:](self->_previouslyForegroundServices, "addObject:", v9);
      }
    }
    else
    {
      v16 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKForegroundServicesMonitor addServicesForeground:andRemoveServices:](self, "addServicesForeground:andRemoveServices:", MEMORY[0x24BDBD1A8], v15);

      -[NSMutableSet removeObject:](self->_previouslyForegroundServices, "removeObject:", v9);
    }
  }

}

- (id)processUpdateHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke;
  v4[3] = &unk_24DA673B0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x219A29428](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyForegroundServices, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end
