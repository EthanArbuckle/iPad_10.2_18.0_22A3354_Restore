@implementation AKNetworkObserver

- (AKNetworkObserver)init
{
  AKNetworkObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *observerQueue;
  uint64_t v6;
  NSMutableDictionary *callbacksByObserver;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKNetworkObserver;
  v2 = -[AKNetworkObserver init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AuthKit.AKNetworkObserver", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    callbacksByObserver = v2->_callbacksByObserver;
    v2->_callbacksByObserver = (NSMutableDictionary *)v6;

    -[AKNetworkObserver _startPathMonitor](v2, "_startPathMonitor");
  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *callbacksByObserver;
  objc_super v4;

  -[AKNetworkObserver _stopPathMonitor](self, "_stopPathMonitor");
  callbacksByObserver = self->_callbacksByObserver;
  self->_callbacksByObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)AKNetworkObserver;
  -[AKNetworkObserver dealloc](&v4, sel_dealloc);
}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver_onceToken != -1)
    dispatch_once(&sharedNetworkObserver_onceToken, &__block_literal_global_43);
  return (id)sharedNetworkObserver_networkObserver;
}

void __42__AKNetworkObserver_sharedNetworkObserver__block_invoke()
{
  AKNetworkObserver *v0;
  void *v1;

  v0 = objc_alloc_init(AKNetworkObserver);
  v1 = (void *)sharedNetworkObserver_networkObserver;
  sharedNetworkObserver_networkObserver = (uint64_t)v0;

}

- (void)_startPathMonitor
{
  NSObject *pathMonitor;
  OS_nw_path_monitor *v4;
  OS_nw_path_monitor *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  pathMonitor = self->_pathMonitor;
  if (!pathMonitor)
  {
    v4 = (OS_nw_path_monitor *)nw_path_monitor_create();
    v5 = self->_pathMonitor;
    self->_pathMonitor = v4;

    pathMonitor = self->_pathMonitor;
  }
  nw_path_monitor_set_queue(pathMonitor, (dispatch_queue_t)self->_observerQueue);
  objc_initWeak(&location, self);
  v6 = self->_pathMonitor;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AKNetworkObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_1E2E612D8;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__AKNetworkObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *WeakRetained;
  int v4;
  int v5;
  NSObject *path;

  path = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (nw_path_get_status(path) & 0xFFFFFFFD) == 1 && nw_path_has_dns(path);
    v5 = WeakRetained[32];
    WeakRetained[32] = v4;
    if (v5 != v4)
      objc_msgSend(WeakRetained, "_onqueue_networkReachabilityDidChange");
  }

}

- (void)_stopPathMonitor
{
  NSObject *pathMonitor;
  OS_nw_path_monitor *v4;

  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    v4 = self->_pathMonitor;
    self->_pathMonitor = 0;

  }
}

- (void)_onqueue_networkReachabilityDidChange
{
  BOOL isNetworkReachable;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  isNetworkReachable = self->_isNetworkReachable;
  -[NSMutableDictionary allValues](self->_callbacksByObserver, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AKNetworkObserver__onqueue_networkReachabilityDidChange__block_invoke;
  v6[3] = &unk_1E2E61300;
  v7 = v4;
  v8 = isNetworkReachable;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __58__AKNetworkObserver__onqueue_networkReachabilityDidChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)isNetworkReachable
{
  NSObject *observerQueue;
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
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AKNetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E2E602F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AKNetworkObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *observerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, v6);
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke;
  v16[3] = &unk_1E2E61328;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  v8 = (void *)MEMORY[0x194022E4C](v16);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke_2;
  v13[3] = &unk_1E2E61350;
  v14 = v9;
  v15 = v8;
  v13[4] = self;
  v11 = v9;
  v12 = v8;
  dispatch_sync(observerQueue, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "methodSignatureForSelector:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelector:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setTarget:", v4);
    objc_msgSend(v6, "setArgument:atIndex:", &v7, 2);
    objc_msgSend(v6, "invoke");

  }
}

void __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 24);
  v3 = (id)MEMORY[0x194022E4C](a1[6]);
  objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);

}

- (void)removeNetworkReachableObserver:(id)a3
{
  void *v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AKNetworkObserver_removeNetworkReachableObserver___block_invoke;
  block[3] = &unk_1E2E5EC28;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __52__AKNetworkObserver_removeNetworkReachableObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacksByObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end
