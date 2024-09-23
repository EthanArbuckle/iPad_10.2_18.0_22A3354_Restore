@implementation PFApplicationStateMonitor

- (PFApplicationStateMonitor)init
{
  PFApplicationStateMonitor *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  PFCloudKitThrottledNotificationObserver *v8;
  uint64_t v9;
  uint64_t v10;
  PFCloudKitThrottledNotificationObserver *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id *v22;
  id *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PFApplicationStateMonitor;
  v2 = -[PFApplicationStateMonitor init](&v41, sel_init);
  if (v2)
  {
    if (_PF_USE_IOS_PLATFORM == 1)
    {
      v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("UIBackgroundModes"));
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v38 != v5)
              objc_enumerationMutation(v3);
            v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((objc_msgSend(v7, "isEqualToString:", CFSTR("audio")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("bluetooth-central")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("bluetooth-peripheral")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("external-accessory")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("fetch")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("location")) & 1) != 0
              || (objc_msgSend(v7, "isEqualToString:", CFSTR("processing")) & 1) != 0
              || objc_msgSend(v7, "isEqualToString:", CFSTR("voip")))
            {
              v2->_backgroundTimeout = 30;
              goto LABEL_20;
            }
          }
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
          if (v4)
            continue;
          break;
        }
      }
    }
LABEL_20:
    objc_initWeak(&location, v2);
    v8 = [PFCloudKitThrottledNotificationObserver alloc];
    v9 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __33__PFApplicationStateMonitor_init__block_invoke;
    v34[3] = &unk_1E1EE1120;
    v22 = &v35;
    objc_copyWeak(&v35, &location);
    v10 = -[PFCloudKitThrottledNotificationObserver initWithLabel:handlerBlock:](v8, "initWithLabel:handlerBlock:", CFSTR("AppActivateObserver"), v34);
    v2->_appActivateLifecycleObserver = (PFCloudKitThrottledNotificationObserver *)v10;
    if (v10)
      *(_QWORD *)(v10 + 32) = 1;
    v11 = [PFCloudKitThrottledNotificationObserver alloc];
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __33__PFApplicationStateMonitor_init__block_invoke_2;
    v32[3] = &unk_1E1EE1120;
    v23 = &v33;
    objc_copyWeak(&v33, &location);
    v12 = -[PFCloudKitThrottledNotificationObserver initWithLabel:handlerBlock:](v11, "initWithLabel:handlerBlock:", CFSTR("AppDeactivateObserver"), v32);
    v2->_appDeactivateLifecycleObserver = (PFCloudKitThrottledNotificationObserver *)v12;
    if (v12)
      *(_QWORD *)(v12 + 32) = 1;
    atomic_store(0, (unsigned int *)&v2->_transitionCounter);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = +[_PFRoutines applicationActivateLifecyleNotifications]();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v22, v23), "addObserver:selector:name:object:", v2, sel_applicationDidActivate_, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 0);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
      }
      while (v14);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = +[_PFRoutines applicationDeactivateLifecyleNotifications]();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v42, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v22), "addObserver:selector:name:object:", v2, sel_applicationWillDeactivate_, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), 0);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v42, 16);
      }
      while (v18);
    }
    objc_destroyWeak(v23);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__PFApplicationStateMonitor_init__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  unsigned int *v2;
  unsigned int v3;
  id v4;
  void *v5;
  char *v6;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 5) = 1;
    v2 = (unsigned int *)(WeakRetained + 24);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)WeakRetained + 6);
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "applicationStateMonitorEnteredForeground:", v6);

    WeakRetained = v6;
  }

}

void __33__PFApplicationStateMonitor_init__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  id v2;
  void *v3;
  unsigned int *v4;
  unsigned int v5;
  dispatch_time_t v6;
  NSObject *global_queue;
  char *v8;
  _QWORD block[5];
  unsigned int v10;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 5) = 2;
    v8 = WeakRetained;
    v2 = objc_loadWeakRetained((id *)WeakRetained + 6);
    v3 = v2;
    if (v2)
      objc_msgSend(v2, "applicationStateMonitorEnteredBackground:", v8);
    if (*((uint64_t *)v8 + 4) >= 1 && _PF_USE_IOS_PLATFORM == 1)
    {
      v4 = (unsigned int *)(v8 + 24);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5, v4));
      v6 = dispatch_time(0, 1000000000 * *((_QWORD *)v8 + 4));
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke;
      block[3] = &unk_1E1EE15F8;
      block[4] = v8;
      v10 = v5;
      dispatch_after(v6, global_queue, block);
    }

    WeakRetained = v8;
  }

}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_appActivateLifecycleObserver = 0;
  self->_appDeactivateLifecycleObserver = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFApplicationStateMonitor;
  -[PFApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)applicationDidActivate:(id)a3
{
  -[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]((uint64_t)self->_appActivateLifecycleObserver, a3);
}

- (void)applicationWillDeactivate:(id)a3
{
  -[PFCloudKitThrottledNotificationObserver noteRecievedNotification:]((uint64_t)self->_appDeactivateLifecycleObserver, a3);
}

void __54__PFApplicationStateMonitor_scheduleBackgroundTimeout__block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  id WeakRetained;
  id v5;

  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (*(_DWORD *)(a1 + 40) == v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "applicationStateMonitorExpiredBackgroundActivityTimeout:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
