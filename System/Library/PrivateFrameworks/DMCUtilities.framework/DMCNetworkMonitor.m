@implementation DMCNetworkMonitor

- (DMCNetworkMonitor)init
{
  DMCNetworkMonitor *v2;
  uint64_t v3;
  NWPathEvaluator *pathEvaluator;
  uint64_t v5;
  NSMutableArray *cachedCompletionHandlers;
  dispatch_queue_t v7;
  OS_dispatch_queue *workerQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMCNetworkMonitor;
  v2 = -[DMCNetworkMonitor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = (NWPathEvaluator *)v3;

    v5 = objc_opt_new();
    cachedCompletionHandlers = v2->_cachedCompletionHandlers;
    v2->_cachedCompletionHandlers = (NSMutableArray *)v5;

    v7 = dispatch_queue_create("com.apple.DMCNetworkMonitor.worker-queue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[DMCNetworkMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)DMCNetworkMonitor;
  -[DMCNetworkMonitor dealloc](&v3, sel_dealloc);
}

- (void)waitForNetworkWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMCNetworkMonitor workerQueue](self, "workerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__DMCNetworkMonitor_waitForNetworkWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4D370F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__DMCNetworkMonitor_waitForNetworkWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_deviceMightHaveNetwork"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cachedCompletionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A85A3C10](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v4);

  result = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_startMonitoring");
  return result;
}

- (void)_notifyAllClients
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[DMCNetworkMonitor cachedCompletionHandlers](self, "cachedCompletionHandlers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[DMCNetworkMonitor cachedCompletionHandlers](self, "cachedCompletionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)_startMonitoring
{
  nw_path_monitor_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD update_handler[5];

  -[DMCNetworkMonitor setIsMonitoring:](self, "setIsMonitoring:", 1);
  v3 = nw_path_monitor_create();
  -[DMCNetworkMonitor setPathMonitor:](self, "setPathMonitor:", v3);

  -[DMCNetworkMonitor pathMonitor](self, "pathMonitor");
  v4 = objc_claimAutoreleasedReturnValue();
  -[DMCNetworkMonitor workerQueue](self, "workerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v4, v5);

  -[DMCNetworkMonitor pathMonitor](self, "pathMonitor");
  v6 = objc_claimAutoreleasedReturnValue();
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __37__DMCNetworkMonitor__startMonitoring__block_invoke;
  update_handler[3] = &unk_1E4D37120;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v6, update_handler);

  -[DMCNetworkMonitor pathMonitor](self, "pathMonitor");
  v7 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v7);

}

uint64_t __37__DMCNetworkMonitor__startMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateNetwork");
}

- (void)_stopMonitoring
{
  NSObject *v3;

  -[DMCNetworkMonitor pathMonitor](self, "pathMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_cancel(v3);

  -[DMCNetworkMonitor setPathMonitor:](self, "setPathMonitor:", 0);
  -[DMCNetworkMonitor setIsMonitoring:](self, "setIsMonitoring:", 0);
}

- (BOOL)_deviceMightHaveNetwork
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[DMCNetworkMonitor pathEvaluator](self, "pathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  if ((v5 | 2) != 3)
    return 0;
  v6 = DMCLogObjects()[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[DMCNetworkMonitor pathEvaluator](self, "pathEvaluator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "status");
    -[DMCNetworkMonitor _interfaceType](self, "_interfaceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEFAULT, "Device might have network now. path status: %ld, interface type: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  return 1;
}

- (id)_interfaceType
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[DMCNetworkMonitor pathEvaluator](self, "pathEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 > 4)
    return CFSTR("Cellular");
  else
    return off_1E4D37168[v5];
}

- (void)_evaluateNetwork
{
  NSObject *v3;
  _QWORD block[5];

  -[DMCNetworkMonitor workerQueue](self, "workerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DMCNetworkMonitor__evaluateNetwork__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__DMCNetworkMonitor__evaluateNetwork__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deviceMightHaveNetwork");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyAllClients");
    return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoring");
  }
  return result;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (NSMutableArray)cachedCompletionHandlers
{
  return self->_cachedCompletionHandlers;
}

- (void)setCachedCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCompletionHandlers, a3);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pathMonitor, a3);
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_cachedCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
