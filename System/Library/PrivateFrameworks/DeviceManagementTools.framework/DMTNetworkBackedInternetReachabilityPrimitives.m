@implementation DMTNetworkBackedInternetReachabilityPrimitives

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[DMTNetworkBackedInternetReachabilityPrimitives pathMonitor](self, "pathMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)DMTNetworkBackedInternetReachabilityPrimitives;
  -[DMTNetworkBackedInternetReachabilityPrimitives dealloc](&v4, sel_dealloc);
}

- (DMTNetworkBackedInternetReachabilityPrimitives)init
{
  id v2;
  objc_class *v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  nw_path_monitor_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DMTNetworkBackedInternetReachabilityPrimitives;
  v2 = -[DMTNetworkBackedInternetReachabilityPrimitives init](&v16, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    v9 = nw_path_monitor_create();
    v10 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v9;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v2 + 4), *((dispatch_queue_t *)v2 + 3));
    objc_initWeak(&location, v2);
    v11 = *((_QWORD *)v2 + 4);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__DMTNetworkBackedInternetReachabilityPrimitives_init__block_invoke;
    v13[3] = &unk_24E5A03D0;
    objc_copyWeak(&v14, &location);
    nw_path_monitor_set_update_handler(v11, v13);
    nw_path_monitor_start(*((nw_path_monitor_t *)v2 + 4));
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return (DMTNetworkBackedInternetReachabilityPrimitives *)v2;
}

void __54__DMTNetworkBackedInternetReachabilityPrimitives_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_pathDidChange_, v3, 0);

}

- (void)pathDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  -[DMTNetworkBackedInternetReachabilityPrimitives pathEvaluator](self, "pathEvaluator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if ((v6 == 1) != -[DMTNetworkBackedInternetReachabilityPrimitives reachable](self, "reachable"))
  {
    -[DMTNetworkBackedInternetReachabilityPrimitives setReachable:](self, "setReachable:", v6 == 1);
    -[DMTNetworkBackedInternetReachabilityPrimitives statusChangedBlock](self, "statusChangedBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      ((void (**)(_QWORD, BOOL))v7)[2](v7, v6 == 1);
      v7 = (void (**)(_QWORD, _QWORD))v8;
    }

  }
}

- (id)statusChangedBlock
{
  return self->_statusChangedBlock;
}

- (void)setStatusChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (OS_dispatch_queue)reachabilityMonitorQueue
{
  return self->_reachabilityMonitorQueue;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitorQueue, 0);
  objc_storeStrong(&self->_statusChangedBlock, 0);
}

@end
