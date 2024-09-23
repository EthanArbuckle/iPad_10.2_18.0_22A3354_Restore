@implementation EFNetworkStatus

void ___ef_log_EFNetworkStatus_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EFNetworkStatus");
  v1 = (void *)_ef_log_EFNetworkStatus_log;
  _ef_log_EFNetworkStatus_log = (uint64_t)v0;

}

+ (EFNetworkStatus)external
{
  if (external_onceToken != -1)
    dispatch_once(&external_onceToken, &__block_literal_global_3_0);
  return (EFNetworkStatus *)(id)external_sNetworkStatus;
}

void __27__EFNetworkStatus_external__block_invoke()
{
  EFNetworkStatus *v0;
  void *v1;
  nw_path_monitor_t v2;

  v2 = nw_path_monitor_create();
  v0 = -[EFNetworkStatus initWithPathMonitor:]([EFNetworkStatus alloc], "initWithPathMonitor:", v2);
  v1 = (void *)external_sNetworkStatus;
  external_sNetworkStatus = (uint64_t)v0;

}

+ (EFNetworkStatus)cellular
{
  if (cellular_onceToken != -1)
    dispatch_once(&cellular_onceToken, &__block_literal_global_4_0);
  return (EFNetworkStatus *)(id)cellular_sNetworkStatus;
}

void __27__EFNetworkStatus_cellular__block_invoke()
{
  EFNetworkStatus *v0;
  void *v1;

  v0 = -[EFNetworkStatus initWithInterfaceType:]([EFNetworkStatus alloc], "initWithInterfaceType:", 2);
  v1 = (void *)cellular_sNetworkStatus;
  cellular_sNetworkStatus = (uint64_t)v0;

}

+ (EFNetworkStatus)wifi
{
  if (wifi_onceToken != -1)
    dispatch_once(&wifi_onceToken, &__block_literal_global_5);
  return (EFNetworkStatus *)(id)wifi_sNetworkStatus;
}

void __23__EFNetworkStatus_wifi__block_invoke()
{
  EFNetworkStatus *v0;
  void *v1;

  v0 = -[EFNetworkStatus initWithInterfaceType:]([EFNetworkStatus alloc], "initWithInterfaceType:", 1);
  v1 = (void *)wifi_sNetworkStatus;
  wifi_sNetworkStatus = (uint64_t)v0;

}

+ (EFNetworkStatus)wired
{
  if (wired_onceToken != -1)
    dispatch_once(&wired_onceToken, &__block_literal_global_6_1);
  return (EFNetworkStatus *)(id)wired_sNetworkStatus;
}

void __24__EFNetworkStatus_wired__block_invoke()
{
  EFNetworkStatus *v0;
  void *v1;

  v0 = -[EFNetworkStatus initWithInterfaceType:]([EFNetworkStatus alloc], "initWithInterfaceType:", 3);
  v1 = (void *)wired_sNetworkStatus;
  wired_sNetworkStatus = (uint64_t)v0;

}

- (EFNetworkStatus)initWithInterfaceType:(int)a3
{
  nw_path_monitor_t v4;
  EFNetworkStatus *v5;

  v4 = nw_path_monitor_create_with_type((nw_interface_type_t)a3);
  v5 = -[EFNetworkStatus initWithPathMonitor:](self, "initWithPathMonitor:", v4);

  return v5;
}

- (EFNetworkStatus)initWithPathMonitor:(id)a3
{
  NSObject *v5;
  EFNetworkStatus *v6;
  EFNetworkStatus *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *monitorQueue;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id from;
  id location;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EFNetworkStatus;
  v6 = -[EFNetworkStatus init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_currentPathLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pathMonitor, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.mail.EFNetworkStatus.monitorQueue", v9);
    monitorQueue = v7->_monitorQueue;
    v7->_monitorQueue = (OS_dispatch_queue *)v10;

    nw_path_monitor_set_queue((nw_path_monitor_t)v7->_pathMonitor, (dispatch_queue_t)v7->_monitorQueue);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v7);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __39__EFNetworkStatus_initWithPathMonitor___block_invoke;
    v20 = &unk_1E62A6210;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    nw_path_monitor_set_update_handler(v5, &v17);
    nw_path_monitor_start(v5);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0, v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "lockWhenCondition:beforeDate:", 1, v13);

    if (v14)
    {
      objc_msgSend(v12, "unlock");
    }
    else
    {
      _ef_log_EFNetworkStatus();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[EFNetworkStatus initWithPathMonitor:].cold.1(v15);

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __39__EFNetworkStatus_initWithPathMonitor___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(v5 + 2);
    objc_storeStrong((id *)&v6[8], a2);
    os_unfair_lock_unlock(v6 + 2);
    objc_msgSend(WeakRetained, "lock");
    objc_msgSend(WeakRetained, "unlockWithCondition:", 1);
  }

}

- (BOOL)isAvailable
{
  os_unfair_lock_s *p_currentPathLock;
  OS_nw_path *v4;
  BOOL v5;

  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4)
    v5 = ((nw_path_get_status((nw_path_t)v4) - 1) & 0xFFFFFFFD) == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isExpensive
{
  os_unfair_lock_s *p_currentPathLock;
  OS_nw_path *v4;
  BOOL is_expensive;

  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4)
    is_expensive = nw_path_is_expensive((nw_path_t)v4);
  else
    is_expensive = 0;

  return is_expensive;
}

- (BOOL)isConstrained
{
  os_unfair_lock_s *p_currentPathLock;
  OS_nw_path *v4;
  BOOL is_constrained;

  p_currentPathLock = &self->_currentPathLock;
  os_unfair_lock_lock(&self->_currentPathLock);
  v4 = self->_currentPath;
  os_unfair_lock_unlock(p_currentPathLock);
  if (v4)
    is_constrained = nw_path_is_constrained((nw_path_t)v4);
  else
    is_constrained = 0;

  return is_constrained;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (OS_nw_path)currentPath
{
  return self->_currentPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)initWithPathMonitor:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B106E000, log, OS_LOG_TYPE_FAULT, "Timed out waiting for path initialization", v1, 2u);
}

@end
