@implementation FLNetworkObserver

- (FLNetworkObserver)init
{
  -[FLNetworkObserver doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_init
{
  FLNetworkObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observerQueue;
  uint64_t v5;
  NSMutableDictionary *invocationByObserver;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FLNetworkObserver;
  v2 = -[FLNetworkObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.CoreFollowUpUI.FLNetworkObserver", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    invocationByObserver = v2->_invocationByObserver;
    v2->_invocationByObserver = (NSMutableDictionary *)v5;

    -[FLNetworkObserver _startPathMonitor](v2, "_startPathMonitor");
  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *invocationByObserver;
  objc_super v4;

  -[FLNetworkObserver _stopPathMonitor](self, "_stopPathMonitor");
  invocationByObserver = self->_invocationByObserver;
  self->_invocationByObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)FLNetworkObserver;
  -[FLNetworkObserver dealloc](&v4, sel_dealloc);
}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver_onceToken != -1)
    dispatch_once(&sharedNetworkObserver_onceToken, &__block_literal_global_1);
  return (id)sharedNetworkObserver_networkObserver;
}

void __42__FLNetworkObserver_sharedNetworkObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FLNetworkObserver _init]([FLNetworkObserver alloc], "_init");
  v1 = (void *)sharedNetworkObserver_networkObserver;
  sharedNetworkObserver_networkObserver = (uint64_t)v0;

}

- (void)disableAirplaneMode
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21641D000, v3, OS_LOG_TYPE_DEFAULT, "Disabling airplane mode and waiting for network change.", v5, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04788]), "initWithQueue:", self->_observerQueue);
  objc_msgSend(v4, "setAirplaneMode:", 0);

}

- (BOOL)isAirplaneModeActiveWithoutWiFi
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04788]), "initWithQueue:", self->_observerQueue);
  v4 = objc_msgSend(v3, "airplaneMode") && !-[FLNetworkObserver _isWiFiEnabled](self, "_isWiFiEnabled");

  return v4;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__FLNetworkObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_24D55CC00;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__FLNetworkObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
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
    WeakRetained[33] = nw_path_uses_interface_type(path, nw_interface_type_wifi);
    if (v5 != v4)
      objc_msgSend(WeakRetained, "_networkReachabilityDidChange");
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

- (void)_networkReachabilityDidChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_invocationByObserver, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x24BDAC760];
    v7 = MEMORY[0x24BDAC9B8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __50__FLNetworkObserver__networkReachabilityDidChange__block_invoke;
        block[3] = &unk_24D55CAC8;
        block[4] = v9;
        dispatch_async(v7, block);
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __50__FLNetworkObserver__networkReachabilityDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__FLNetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_24D55CC28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__FLNetworkObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (BOOL)_isWiFiEnabled
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__FLNetworkObserver__isWiFiEnabled__block_invoke;
  v5[3] = &unk_24D55CC28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__FLNetworkObserver__isWiFiEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 33);
  return result;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *observerQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  objc_msgSend(v6, "methodSignatureForSelector:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelector:", a4);
  objc_msgSend(v7, "setTarget:", v6);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__FLNetworkObserver_addNetworkReachableObserver_selector___block_invoke;
  block[3] = &unk_24D55CC50;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(observerQueue, block);

}

uint64_t __58__FLNetworkObserver_addNetworkReachableObserver_selector___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

- (id)addNetworkReachableBlock:(id)a3
{
  id v4;
  _FLNetworkObserverBlock *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [_FLNetworkObserverBlock alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__FLNetworkObserver_addNetworkReachableBlock___block_invoke;
  v9[3] = &unk_24D55CC78;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[_FLNetworkObserverBlock _initWithBlock:networkObserver:](v5, "_initWithBlock:networkObserver:", v9, self);
  -[FLNetworkObserver addNetworkReachableObserver:selector:](self, "addNetworkReachableObserver:selector:", v7, sel_executeBlock);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __46__FLNetworkObserver_addNetworkReachableBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained, "isNetworkReachable"));
    WeakRetained = v3;
  }

}

- (void)removeNetworkReachableObserver:(id)a3
{
  void *v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__FLNetworkObserver_removeNetworkReachableObserver___block_invoke;
  block[3] = &unk_24D55CCA0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __52__FLNetworkObserver_removeNetworkReachableObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationByObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end
