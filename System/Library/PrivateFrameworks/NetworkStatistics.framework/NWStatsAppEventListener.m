@implementation NWStatsAppEventListener

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appStateDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleStateUpdate:forProcess:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NWAppStateEventListenerDelegate)appStateDelegate
{
  return (NWAppStateEventListenerDelegate *)objc_loadWeakRetained((id *)&self->_appStateDelegate);
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_3;
      block[3] = &unk_24CBD26E0;
      block[4] = v9;
      v13 = v7;
      v14 = v6;
      dispatch_async(v11, block);

    }
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_applicationStateMonitorInit
{
  void *v3;
  objc_class *Class;
  objc_class *v5;
  Class v6;
  RBSProcessMonitor *v7;
  RBSProcessMonitor *appStateMonitor;
  NSObject *v9;
  Class RBSProcessMonitorClass;
  Class RBSProcessPredicateClass;
  void *runningBoradDylibHandle;
  Class RBSProcessStateDescriptorClass;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  Class v18;
  __int16 v19;
  Class v20;
  __int16 v21;
  Class v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 4);
  self->_runningBoradDylibHandle = v3;
  if (v3
    && (self->_RBSProcessMonitorClass = objc_getClass("RBSProcessMonitor"),
        self->_RBSProcessPredicateClass = objc_getClass("RBSProcessPredicate"),
        Class = objc_getClass("RBSProcessStateDescriptor"),
        self->_RBSProcessStateDescriptorClass = Class,
        self->_runningBoradDylibHandle)
    && (v5 = Class, (v6 = self->_RBSProcessMonitorClass) != 0)
    && self->_RBSProcessPredicateClass
    && v5)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke;
    v14[3] = &unk_24CBD2730;
    v14[4] = self;
    -[objc_class monitorWithConfiguration:](v6, "monitorWithConfiguration:", v14);
    v7 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
    appStateMonitor = self->_appStateMonitor;
    self->_appStateMonitor = v7;

  }
  else
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      RBSProcessMonitorClass = self->_RBSProcessMonitorClass;
      RBSProcessPredicateClass = self->_RBSProcessPredicateClass;
      RBSProcessStateDescriptorClass = self->_RBSProcessStateDescriptorClass;
      runningBoradDylibHandle = self->_runningBoradDylibHandle;
      *(_DWORD *)buf = 134218752;
      v16 = runningBoradDylibHandle;
      v17 = 2048;
      v18 = RBSProcessMonitorClass;
      v19 = 2048;
      v20 = RBSProcessPredicateClass;
      v21 = 2048;
      v22 = RBSProcessStateDescriptorClass;
      _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_FAULT, "RB Mapping dylib failure handle %p proc monitor %p predicate %p descriptor %p", buf, 0x2Au);
    }

  }
}

void __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke(id *a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)a1[4];
  a1 += 4;
  objc_msgSend(v4[4], "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", 1);
  objc_msgSend(v5, "setEndowmentNamespaces:", &unk_24CBE27A0);
  objc_msgSend(v3, "setStateDescriptor:", v5);
  objc_msgSend(v3, "setEvents:", 1);
  v10[0] = objc_msgSend(*((id *)*a1 + 3), "performSelector:", NSSelectorFromString(CFSTR("predicateForSymptomsd")));
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

  objc_initWeak(&location, *a1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NWStatsAppEventListener__applicationStateMonitorInit__block_invoke_2;
  v7[3] = &unk_24CBD2708;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setUpdateHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  objc_super v3;

  -[NWStatsAppEventListener cleanupAppStateMonitor](self, "cleanupAppStateMonitor");
  v3.receiver = self;
  v3.super_class = (Class)NWStatsAppEventListener;
  -[NWStatsAppEventListener dealloc](&v3, sel_dealloc);
}

- (void)cleanupAppStateMonitor
{
  RBSProcessMonitor *appStateMonitor;
  RBSProcessMonitor *v4;

  appStateMonitor = self->_appStateMonitor;
  if (appStateMonitor)
  {
    -[RBSProcessMonitor invalidate](appStateMonitor, "invalidate");
    v4 = self->_appStateMonitor;
    self->_appStateMonitor = 0;

  }
}

- (void)setAppStateDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appStateDelegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appStateDelegate, obj);
    if (obj)
      -[NWStatsAppEventListener _applicationStateMonitorInit](self, "_applicationStateMonitorInit");
    else
      -[NWStatsAppEventListener cleanupAppStateMonitor](self, "cleanupAppStateMonitor");
  }

}

- (NWStatsAppEventListener)initWithQueue:(id)a3
{
  id v5;
  NWStatsAppEventListener *v6;
  NWStatsAppEventListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWStatsAppEventListener;
  v6 = -[NWStatsAppEventListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (RBSProcessMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_destroyWeak((id *)&self->_appStateDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
