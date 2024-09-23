@implementation HFNetworkMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HFNetworkMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379D30 != -1)
    dispatch_once(&qword_1ED379D30, block);
  return (id)_MergedGlobals_315;
}

void __34__HFNetworkMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_315;
  _MergedGlobals_315 = (uint64_t)v1;

}

- (HFNetworkMonitor)init
{
  HFNetworkMonitor *v2;
  nw_path_monitor_t v3;
  OS_nw_path_monitor *networkPathMonitor;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSHashTable *observers;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HFNetworkMonitor;
  v2 = -[HFNetworkMonitor init](&v17, sel_init);
  if (v2)
  {
    v3 = nw_path_monitor_create();
    networkPathMonitor = v2->_networkPathMonitor;
    v2->_networkPathMonitor = (OS_nw_path_monitor *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.Home.HFNetworkMonitor.accessQueue", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

    -[HFNetworkMonitor networkPathMonitor](v2, "networkPathMonitor");
    v8 = objc_claimAutoreleasedReturnValue();
    -[HFNetworkMonitor accessQueue](v2, "accessQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_set_queue(v8, v9);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    objc_initWeak(&location, v2);
    -[HFNetworkMonitor networkPathMonitor](v2, "networkPathMonitor");
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __24__HFNetworkMonitor_init__block_invoke;
    v14[3] = &unk_1EA73E5B8;
    objc_copyWeak(&v15, &location);
    nw_path_monitor_set_update_handler(v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__HFNetworkMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t status;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 is_expensive;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  status = nw_path_get_status(v3);
  if (objc_msgSend(WeakRetained, "currentNetworkPathStatus") != (_DWORD)status)
  {
    objc_msgSend(WeakRetained, "setCurrentNetworkPathStatus:", status);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(WeakRetained, "_observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(WeakRetained, "_notifyObserver:networkIsAvailable:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11++), (_DWORD)status == 1);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

  }
  is_expensive = nw_path_is_expensive(v3);
  objc_msgSend(WeakRetained, "currentNetworkPathIsExpensive");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        objc_msgSend(WeakRetained, "currentNetworkPathIsExpensive"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "BOOLValue"),
        v15,
        v14,
        is_expensive != v16))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", is_expensive);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setCurrentNetworkPathIsExpensive:", v17);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(WeakRetained, "_observers", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(WeakRetained, "_notifyObserver:networkIsExpensive:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22++), is_expensive);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  v5 = -[HFNetworkMonitor _addObserver:](self, "_addObserver:", v4);
  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HFNetworkMonitor_addObserver___block_invoke;
  block[3] = &unk_1EA727778;
  v9 = v4;
  v10 = v5;
  block[4] = self;
  v7 = v4;
  dispatch_async(v6, block);

}

void __32__HFNetworkMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_startMonitoring");
  if (*(_QWORD *)(a1 + 48) > 1uLL || objc_msgSend(*(id *)(a1 + 32), "hasMonitoredNetworkBefore"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:networkIsAvailable:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentNetworkPathStatus") == 1);
    v3 = *(void **)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "currentNetworkPathIsExpensive");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_notifyObserver:networkIsExpensive:", v2, objc_msgSend(v4, "BOOLValue"));

  }
}

- (void)removeObserver:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  v4 = -[HFNetworkMonitor _removeObserver:](self, "_removeObserver:", a3);
  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__HFNetworkMonitor_removeObserver___block_invoke;
  v6[3] = &unk_1EA72B268;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(v5, v6);

}

uint64_t __35__HFNetworkMonitor_removeObserver___block_invoke(uint64_t result)
{
  if (!*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_stopMonitoring");
  return result;
}

- (BOOL)isNetworkAvailable
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HFNetworkMonitor_isNetworkAvailable__block_invoke;
  block[3] = &unk_1EA73E5E0;
  block[5] = &v8;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(a2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a2;
}

uint64_t __38__HFNetworkMonitor_isNetworkAvailable__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoringNetwork") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HFNetworkMonitor.m"), 115, CFSTR("Not actively monitoring network. Add an observer to gain accurate data."));

  }
  result = objc_msgSend(*(id *)(a1 + 32), "currentNetworkPathStatus");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result == 1;
  return result;
}

- (BOOL)isNetworkExpensive
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HFNetworkMonitor_isNetworkExpensive__block_invoke;
  block[3] = &unk_1EA73E5E0;
  block[5] = &v8;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(a2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a2;
}

void __38__HFNetworkMonitor_isNetworkExpensive__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoringNetwork") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HFNetworkMonitor.m"), 127, CFSTR("Not actively monitoring network. Add an observer to gain accurate data."));

  }
  objc_msgSend(*(id *)(a1 + 32), "currentNetworkPathIsExpensive");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

}

- (unint64_t)_addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  unint64_t v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  v6 = -[NSHashTable count](self->_observers, "count");
  os_unfair_lock_unlock(p_observersLock);
  return v6;
}

- (unint64_t)_removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  unint64_t v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  v6 = -[NSHashTable count](self->_observers, "count");
  os_unfair_lock_unlock(p_observersLock);
  return v6;
}

- (id)_observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (void)_startMonitoring
{
  NSObject *v3;
  NSObject *v4;

  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[HFNetworkMonitor isMonitoringNetwork](self, "isMonitoringNetwork"))
  {
    -[HFNetworkMonitor networkPathMonitor](self, "networkPathMonitor");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_start(v4);

    -[HFNetworkMonitor setIsMonitoringNetwork:](self, "setIsMonitoringNetwork:", 1);
  }
}

- (void)_stopMonitoring
{
  NSObject *v3;
  NSObject *v4;

  -[HFNetworkMonitor accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HFNetworkMonitor isMonitoringNetwork](self, "isMonitoringNetwork"))
  {
    -[HFNetworkMonitor networkPathMonitor](self, "networkPathMonitor");
    v4 = objc_claimAutoreleasedReturnValue();
    nw_path_monitor_cancel(v4);

    -[HFNetworkMonitor setIsMonitoringNetwork:](self, "setIsMonitoringNetwork:", 0);
    -[HFNetworkMonitor setHasMonitoredNetworkBefore:](self, "setHasMonitoredNetworkBefore:", 1);
  }
}

- (void)_notifyObserver:(id)a3 networkIsAvailable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "networkDidBecomeAvailable:", self);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "networkDidBecomeUnavailable:", self);
  }

}

- (void)_notifyObserver:(id)a3 networkIsExpensive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "networkDidBecomeExpensive:", self);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "networkDidBecomeInexpensive:", self);
  }

}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkPathMonitor, a3);
}

- (int)currentNetworkPathStatus
{
  return self->_currentNetworkPathStatus;
}

- (void)setCurrentNetworkPathStatus:(int)a3
{
  self->_currentNetworkPathStatus = a3;
}

- (NSNumber)currentNetworkPathIsExpensive
{
  return self->_currentNetworkPathIsExpensive;
}

- (void)setCurrentNetworkPathIsExpensive:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkPathIsExpensive, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)isMonitoringNetwork
{
  return self->_isMonitoringNetwork;
}

- (void)setIsMonitoringNetwork:(BOOL)a3
{
  self->_isMonitoringNetwork = a3;
}

- (BOOL)hasMonitoredNetworkBefore
{
  return self->_hasMonitoredNetworkBefore;
}

- (void)setHasMonitoredNetworkBefore:(BOOL)a3
{
  self->_hasMonitoredNetworkBefore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_currentNetworkPathIsExpensive, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
