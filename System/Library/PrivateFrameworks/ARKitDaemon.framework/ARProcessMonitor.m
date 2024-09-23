@implementation ARProcessMonitor

- (ARProcessMonitor)init
{
  ARProcessMonitor *v2;
  uint64_t v3;
  NSMutableDictionary *pidsToObserve;
  void *v5;
  uint64_t v6;
  RBSProcessMonitor *processMonitor;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARProcessMonitor;
  v2 = -[ARProcessMonitor init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pidsToObserve = v2->_pidsToObserve;
    v2->_pidsToObserve = (NSMutableDictionary *)v3;

    v2->_pidsLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v5 = (void *)MEMORY[0x24BE80CC8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __24__ARProcessMonitor_init__block_invoke;
    v9[3] = &unk_2507027F0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "monitorWithConfiguration:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    processMonitor = v2->_processMonitor;
    v2->_processMonitor = (RBSProcessMonitor *)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __24__ARProcessMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "updateProcessMonitorConfig:withPredicates:", v3, MEMORY[0x24BDBD1A8]);

}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ARProcessMonitor;
  -[ARProcessMonitor dealloc](&v3, sel_dealloc);
}

+ (BOOL)processIsDaemon:(int)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  NSObject *v12;
  objc_class *v13;
  char v14;
  int v16;
  NSObject *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v7, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (!a4 || !*a4))
    {
      v14 = -[NSObject isDaemon](v8, "isDaemon");
      goto LABEL_12;
    }
    _ARLogProcessMonitor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2048;
      v19 = a1;
      v20 = 1024;
      v21 = a3;
      _os_log_impl(&dword_235C46000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create a process handle for pid %d", (uint8_t *)&v16, 0x1Cu);

    }
    goto LABEL_9;
  }
  _ARLogProcessMonitor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2048;
    v19 = a1;
    v20 = 1024;
    v21 = a3;
    _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a process identifier for pid %d", (uint8_t *)&v16, 0x1Cu);
LABEL_9:

  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)startMonitoringPID:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_pidsLock;
  NSMutableDictionary *pidsToObserve;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  RBSProcessMonitor *processMonitor;
  id v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARProcessMonitor *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  p_pidsLock = &self->_pidsLock;
  os_unfair_lock_lock(&self->_pidsLock);
  pidsToObserve = self->_pidsToObserve;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pidsToObserve, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _ARLogProcessMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v28 = 1024;
      v29 = v3;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Adding PID to monitor: %d", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = self->_pidsToObserve;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

      -[NSMutableDictionary allValues](self->_pidsToObserve, "allValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      processMonitor = self->_processMonitor;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __39__ARProcessMonitor_startMonitoringPID___block_invoke;
      v21[3] = &unk_250702818;
      objc_copyWeak(&v23, (id *)buf);
      v18 = v16;
      v22 = v18;
      -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      _ARLogProcessMonitor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        v26 = 2048;
        v27 = self;
        v28 = 1024;
        v29 = v3;
        _os_log_impl(&dword_235C46000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a process identifier for pid %d", buf, 0x1Cu);

      }
    }

  }
  os_unfair_lock_unlock(p_pidsLock);
}

void __39__ARProcessMonitor_startMonitoringPID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "updateProcessMonitorConfig:withPredicates:", v4, *(_QWORD *)(a1 + 32));

}

- (void)stopMonitoringPID:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_pidsLock;
  NSMutableDictionary *pidsToObserve;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  RBSProcessMonitor *processMonitor;
  objc_class *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  ARProcessMonitor *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  p_pidsLock = &self->_pidsLock;
  os_unfair_lock_lock(&self->_pidsLock);
  pidsToObserve = self->_pidsToObserve;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pidsToObserve, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ARLogProcessMonitor();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v12;
      v24 = 2048;
      v25 = self;
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing PID to Monitor: %d", buf, 0x1Cu);

    }
    v13 = self->_pidsToObserve;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

    -[NSMutableDictionary allValues](self->_pidsToObserve, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    processMonitor = self->_processMonitor;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __38__ARProcessMonitor_stopMonitoringPID___block_invoke;
    v19[3] = &unk_250702818;
    objc_copyWeak(&v21, (id *)buf);
    v9 = v15;
    v20 = v9;
    -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else if (v10)
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v18;
    v24 = 2048;
    v25 = self;
    v26 = 1024;
    v27 = v3;
    _os_log_impl(&dword_235C46000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Warning: Removing PID to Monitor that's not being monitored: %d", buf, 0x1Cu);

  }
  os_unfair_lock_unlock(p_pidsLock);
}

void __38__ARProcessMonitor_stopMonitoringPID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "updateProcessMonitorConfig:withPredicates:", v4, *(_QWORD *)(a1 + 32));

}

- (void)updateProcessMonitorConfig:(id)a3 withPredicates:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  ARProcessMonitor *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ARLogProcessMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_235C46000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updating process monitor with new predicates", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", 1);
  v18 = CFSTR("com.apple.frontboard.visibility");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndowmentNamespaces:", v12);

  objc_msgSend(v6, "setStateDescriptor:", v11);
  objc_msgSend(v6, "setPredicates:", v7);
  objc_initWeak((id *)buf, self);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __62__ARProcessMonitor_updateProcessMonitorConfig_withPredicates___block_invoke;
  v16 = &unk_250702840;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v6, "setUpdateHandler:", &v13);
  objc_msgSend(v6, "setServiceClass:", 21, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __62__ARProcessMonitor_updateProcessMonitorConfig_withPredicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleStateUpdate:", v5);

}

- (void)handleStateUpdate:(id)a3
{
  id v4;
  ARProcessMonitorStateUpdate *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARProcessMonitor *v13;
  __int16 v14;
  ARProcessMonitorStateUpdate *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ARProcessMonitorStateUpdate initWithRBSProcessStateUpdate:]([ARProcessMonitorStateUpdate alloc], "initWithRBSProcessStateUpdate:", v4);

  _ARLogProcessMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Notifying delegate of update: %@", (uint8_t *)&v10, 0x20u);

  }
  -[ARProcessMonitor delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processMonitor:didUpdateState:", self, v5);

}

- (ARProcessMonitorStateChangeDelegate)delegate
{
  return (ARProcessMonitorStateChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pidsToObserve, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
}

@end
