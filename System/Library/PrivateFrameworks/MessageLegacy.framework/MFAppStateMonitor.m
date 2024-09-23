@implementation MFAppStateMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFAppStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __35__MFAppStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MFAppStateMonitor;
  -[MFAppStateMonitor dealloc](&v3, sel_dealloc);
}

- (MFAppStateMonitor)init
{
  MFAppStateMonitor *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  BKSApplicationStateMonitor *appStateMonitor;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MFAppStateMonitor;
  v2 = -[MFAppStateMonitor init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.message.applicationStateMonitor", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_storeStrong((id *)&v2->_observable, v3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CFE2F0]);
      v19[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithBundleIDs:states:", v9, *MEMORY[0x1E0CFE290]);
      appStateMonitor = v2->_appStateMonitor;
      v2->_appStateMonitor = (BKSApplicationStateMonitor *)v10;

      v2->_appState = -[BKSApplicationStateMonitor applicationStateForApplication:](v2->_appStateMonitor, "applicationStateForApplication:", v7);
      objc_initWeak(&location, v2);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __25__MFAppStateMonitor_init__block_invoke;
      v13[3] = &unk_1E81CAA98;
      objc_copyWeak(&v16, &location);
      v14 = v7;
      v15 = v3;
      -[BKSApplicationStateMonitor setHandler:](v2->_appStateMonitor, "setHandler:", v13);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

  }
  return v2;
}

void __25__MFAppStateMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateApplicationState:observer:", v6, *(_QWORD *)(a1 + 40));

  }
}

- (EFObservable)appStateObservable
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[EFObserver distinctUntilChanged](self->_observable, "distinctUntilChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MFAppStateMonitor_appStateObservable__block_invoke;
  v6[3] = &unk_1E81CAAC0;
  v6[4] = self;
  objc_msgSend(v3, "map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v4;
}

id __39__MFAppStateMonitor_appStateObservable__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isForeground
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MFAppStateMonitor_isForeground__block_invoke;
  v5[3] = &unk_1E81CAAE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__MFAppStateMonitor_isForeground__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 8) == 8;
  return result;
}

- (void)_updateApplicationState:(id)a3 observer:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  MFAppStateMonitor *v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MFAppStateMonitor__updateApplicationState_observer___block_invoke;
  block[3] = &unk_1E81CAB10;
  v11 = v6;
  v12 = self;
  v9 = v6;
  v8 = a4;
  dispatch_barrier_sync(queue, block);
  objc_msgSend(v8, "observerDidReceiveResult:", v9);

}

void __54__MFAppStateMonitor__updateApplicationState_observer___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    _BKSApplicationStateGetDescription(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _BKSApplicationStateGetDescription(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_INFO, "transitioning from %@ to %@", (uint8_t *)&v6, 0x16u);

  }
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end
