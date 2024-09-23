@implementation NFReachability

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_s_reachability;
}

void __32__NFReachability_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_s_reachability;
  sharedInstance_s_reachability = (uint64_t)v0;

}

- (NFReachability)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  nw_path_monitor_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NFReachability;
  v2 = -[NFReachability init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("NFReachability.observation", 0);
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = nw_path_monitor_create();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    *((_QWORD *)v2 + 1) = +[NFReachability _currentNetworkStatus](NFReachability, "_currentNetworkStatus");
    objc_initWeak(&location, v2);
    v7 = *((_QWORD *)v2 + 3);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __22__NFReachability_init__block_invoke;
    v9[3] = &unk_24CE72498;
    objc_copyWeak(&v10, &location);
    nw_path_monitor_set_update_handler(v7, v9);
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v2 + 3), *((dispatch_queue_t *)v2 + 2));
    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 3));
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return (NFReachability *)v2;
}

+ (int64_t)_currentNetworkStatus
{
  const __SCNetworkReachability *v2;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], &address);
  if (!v2)
    return 3;
  flags = 0;
  if (!SCNetworkReachabilityGetFlags(v2, &flags))
    return 3;
  if ((flags & 2) == 0)
    return 0;
  if ((flags & 4) != 0 && ((flags & 0x28) == 0 || (flags & 0x10) != 0))
    return ((unint64_t)flags >> 17) & 2;
  return 1;
}

void __22__NFReachability_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateCurrentNetworkPath:", v3);

}

- (void)_updateCurrentNetworkPath:(id)a3
{
  NSObject *v4;
  BOOL is_equal;
  NSObject *path;

  path = a3;
  -[NFReachability currentNetworkPath](self, "currentNetworkPath");
  v4 = objc_claimAutoreleasedReturnValue();
  is_equal = nw_path_is_equal(path, v4);

  if (!is_equal)
  {
    -[NFReachability setCurrentNetworkPath:](self, "setCurrentNetworkPath:", path);
    -[NFReachability setCurrentReachabilityStatus:](self, "setCurrentReachabilityStatus:", -[NFReachability _statusFromNetworkPath:](self, "_statusFromNetworkPath:", path));
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_6);
  }

}

- (void)setCurrentReachabilityStatus:(int64_t)a3
{
  self->_currentReachabilityStatus = a3;
}

- (void)setCurrentNetworkPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkPath, a3);
}

- (OS_nw_path)currentNetworkPath
{
  return self->_currentNetworkPath;
}

- (int64_t)_statusFromNetworkPath:(id)a3
{
  NSObject *v3;
  int64_t v4;

  v3 = a3;
  if ((nw_path_get_status(v3) | 2) == 3)
  {
    v4 = nw_path_uses_interface_type(v3, nw_interface_type_wifi)
      || nw_path_uses_interface_type(v3, nw_interface_type_wired);
    if (nw_path_uses_interface_type(v3, nw_interface_type_cellular))
      v4 |= 2uLL;
    if (nw_path_uses_interface_type(v3, nw_interface_type_other))
      v4 |= 4uLL;
  }
  else
  {
    v4 = 0;
  }
  if (nw_path_is_expensive(v3))
    v4 |= 8uLL;
  if (nw_path_is_constrained(v3))
    v4 |= 0x10uLL;

  return v4;
}

- (int64_t)currentReachabilityStatus
{
  return self->_currentReachabilityStatus;
}

void __44__NFReachability__updateCurrentNetworkPath___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("kNFReachabilityChangedNotification"), 0);

}

- (void)dealloc
{
  objc_super v3;

  nw_path_monitor_cancel((nw_path_monitor_t)self->_networkPathMonitor);
  v3.receiver = self;
  v3.super_class = (Class)NFReachability;
  -[NFReachability dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (void)setObservationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observationQueue, a3);
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkPathMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkPath, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

@end
