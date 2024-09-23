@implementation MFAppStateMonitor

void __35__MFAppStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithBundleId:", *MEMORY[0x1E0D4D878]);
  v3 = (void *)sharedInstance_instance;
  sharedInstance_instance = v2;

}

- (MFAppStateMonitor)initWithBundleId:(id)a3
{
  id v4;
  EFObserver *v5;
  EFObserver *observable;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  EFObserver *v15;
  void *v16;
  void *v17;
  id v18;
  RBSProcessMonitor *v19;
  RBSProcessMonitor *underlyingMonitor;
  MFAppStateMonitor *v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  objc_super v28;
  uint8_t buf[8];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_11;
  v28.receiver = self;
  v28.super_class = (Class)MFAppStateMonitor;
  self = -[MFAppStateMonitor init](&v28, sel_init);
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v5 = (EFObserver *)objc_claimAutoreleasedReturnValue();
    observable = self->_observable;
    self->_observable = v5;

    v7 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v7, "handleForPredicate:error:", v8, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;

    objc_msgSend(v9, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endowmentNamespaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "[RBSProcessMonitor] Is visible: %{BOOL}d (initial)", buf, 8u);
    }

    atomic_store(v13, (unsigned __int8 *)&self->_isVisible);
    v15 = self->_observable;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFObserver observerDidReceiveResult:](v15, "observerDidReceiveResult:", v16);

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = (void *)MEMORY[0x1E0D87D90];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __38__MFAppStateMonitor_initWithBundleId___block_invoke;
    v24[3] = &unk_1E4E8B7A0;
    v18 = v4;
    v25 = v18;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v17, "monitorWithConfiguration:", v24);
    v19 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
    underlyingMonitor = self->_underlyingMonitor;
    self->_underlyingMonitor = v19;

    if (self->_underlyingMonitor)
    {
      objc_destroyWeak(&v26);

      objc_destroyWeak((id *)buf);
      goto LABEL_7;
    }
    MFLogGeneral();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[MFAppStateMonitor initWithBundleId:].cold.1((uint64_t)v18, (uint64_t)v10, v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
LABEL_7:
  self = self;
  v21 = self;
LABEL_12:

  return v21;
}

void __38__MFAppStateMonitor_initWithBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 1);
  v11[0] = CFSTR("com.apple.frontboard.visibility");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", v5);

  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__MFAppStateMonitor_initWithBundleId___block_invoke_2;
  v8[3] = &unk_1E4E8B778;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_msgSend(v3, "setUpdateHandler:", v8);
  objc_destroyWeak(&v9);

}

+ (MFAppStateMonitor)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFAppStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (MFAppStateMonitor *)(id)sharedInstance_instance;
}

- (EFObservable)appIsVisibleObservable
{
  EFObserver *observable;
  EFObserver *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self)
    observable = self->_observable;
  else
    observable = 0;
  v4 = observable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFAppStateMonitor isVisible](self, "isVisible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObserver startWith:](v4, "startWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v7;
}

- (BOOL)isVisible
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isVisible);
  return v2 & 1;
}

void __38__MFAppStateMonitor_initWithBundleId___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  -[MFAppStateMonitor _monitorDidUpdate:process:update:]((uint64_t)WeakRetained, v9, v8, v7);

}

- (void)_monitorDidUpdate:(void *)a3 process:(void *)a4 update:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    objc_msgSend(v9, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "taskState");

    objc_msgSend(v10, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endowmentNamespaces");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    v16 = (unsigned __int8 *)(a1 + 8);
    while (1)
    {
      v17 = __ldaxr(v16);
      if (v17 != (v15 ^ 1))
        break;
      if (!__stlxr(v15, v16))
      {
        MFLogGeneral();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 67109632;
          v22 = v15;
          v23 = 1024;
          v24 = v12;
          v25 = 1024;
          v26 = objc_msgSend(v8, "pid");
          _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "[RBSProcessMonitor] Is visible: %{BOOL}d, state: %d, pid = %d", (uint8_t *)&v21, 0x14u);
        }

        v19 = *(id *)(a1 + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject observerDidReceiveResult:](v19, "observerDidReceiveResult:", v20);

        goto LABEL_10;
      }
    }
    __clrex();
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 67109632;
      v22 = v15;
      v23 = 1024;
      v24 = v12;
      v25 = 1024;
      v26 = objc_msgSend(v8, "pid");
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, "[RBSProcessMonitor] Is visible: %{BOOL}d, state: %d, pid = %d -- (no app visibility change)", (uint8_t *)&v21, 0x14u);
    }
LABEL_10:

  }
}

- (void)dealloc
{
  MFAppStateMonitor *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (MFAppStateMonitor *)self->_underlyingMonitor;
  -[MFAppStateMonitor invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)MFAppStateMonitor;
  -[MFAppStateMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_underlyingMonitor, 0);
}

- (void)initWithBundleId:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Unable to create RBSProcessMonitor for %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

@end
