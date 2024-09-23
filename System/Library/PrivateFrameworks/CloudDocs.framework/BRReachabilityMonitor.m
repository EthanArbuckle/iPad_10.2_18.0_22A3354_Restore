@implementation BRReachabilityMonitor

+ (id)sharedReachabilityMonitor
{
  if (sharedReachabilityMonitor_onceToken != -1)
    dispatch_once(&sharedReachabilityMonitor_onceToken, &__block_literal_global_10);
  return (id)sharedReachabilityMonitor_monitor;
}

void __50__BRReachabilityMonitor_sharedReachabilityMonitor__block_invoke()
{
  BRReachabilityMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(BRReachabilityMonitor);
  v1 = (void *)sharedReachabilityMonitor_monitor;
  sharedReachabilityMonitor_monitor = (uint64_t)v0;

}

- (BRReachabilityMonitor)init
{
  BRReachabilityMonitor *v2;
  uint64_t v3;
  NSHashTable *reachabilityObservers;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  BRReachabilityMonitor *v10;
  uint64_t v11;
  OS_nw_path_monitor *pathMonitor;
  _QWORD v14[4];
  BRReachabilityMonitor *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BRReachabilityMonitor;
  v2 = -[BRReachabilityMonitor init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    reachabilityObservers = v2->_reachabilityObservers;
    v2->_reachabilityObservers = (NSHashTable *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.reachability", v6);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __29__BRReachabilityMonitor_init__block_invoke;
    v14[3] = &unk_1E3DA56E0;
    objc_copyWeak(&v16, &location);
    v10 = v2;
    v15 = v10;
    +[BRNWPathMonitorWrapper createPathMonitorWithQueue:changeHandler:](BRNWPathMonitorWrapper, "createPathMonitorWithQueue:changeHandler:", v9, v14);
    v11 = objc_claimAutoreleasedReturnValue();
    pathMonitor = v10->_pathMonitor;
    v10->_pathMonitor = (OS_nw_path_monitor *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__BRReachabilityMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 *WeakRetained;
  int v5;
  int v6;
  NSObject *v7;
  _QWORD v8[4];
  unsigned __int8 *v9;
  id v10;

  v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (+[BRNWPathMonitorWrapper getStatusOfPath:](BRNWPathMonitorWrapper, "getStatusOfPath:", v3) & 0xFFFFFFFD) == 1
      && +[BRNWPathMonitorWrapper pathHasDNS:](BRNWPathMonitorWrapper, "pathHasDNS:", v3);
    v6 = WeakRetained[24];
    WeakRetained[24] = v5;
    if (v6 != v5)
    {
      v7 = *((_QWORD *)WeakRetained + 2);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __29__BRReachabilityMonitor_init__block_invoke_2;
      v8[3] = &unk_1E3DA4A70;
      v9 = WeakRetained;
      v10 = *(id *)(a1 + 32);
      dispatch_async(v7, v8);

    }
  }

}

void __29__BRReachabilityMonitor_init__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reachabilityMonitor:didChangeReachabilityStatusTo:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  objc_super v3;

  +[BRNWPathMonitorWrapper cancelPathMonitor:](BRNWPathMonitorWrapper, "cancelPathMonitor:", self->_pathMonitor);
  v3.receiver = self;
  v3.super_class = (Class)BRReachabilityMonitor;
  -[BRReachabilityMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)isNetworkReachable
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
  v5[2] = __43__BRReachabilityMonitor_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E3DA5708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__BRReachabilityMonitor_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__BRReachabilityMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E3DA4A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__BRReachabilityMonitor_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "reachabilityMonitor:didChangeReachabilityStatusTo:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BRReachabilityMonitor_removeObserver___block_invoke;
  block[3] = &unk_1E3DA4A70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __40__BRReachabilityMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  +[BRNWPathMonitorWrapper cancelPathMonitor:](BRNWPathMonitorWrapper, "cancelPathMonitor:", self->_pathMonitor);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
}

@end
