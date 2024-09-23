@implementation GEOReachability

+ (id)sharedReachability
{
  if (_MergedGlobals_308 != -1)
    dispatch_once(&_MergedGlobals_308, &__block_literal_global_171);
  return (id)qword_1ECDBC7E0;
}

- (void)reportTileLoadSuccess:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("GEOTileLoadResultSource"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "integerValue") == 2)
    -[GEOReachability _resetErrors](self, "_resetErrors");

}

- (void)_resetErrors
{
  id v3;

  if (self->_errorCount || self->_xpcErrors)
  {
    self->_errorCount = 0;
    self->_xpcErrors = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("GEOReachabilityChangedNotification"), self);

  }
}

- (void)_reachabilityChanged:(id)a3
{
  void *v4;
  _BOOL4 networkReachable;
  int v6;
  BOOL v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("GEONetworkObserverReachable"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  networkReachable = self->_networkReachable;
  v6 = objc_msgSend(v8, "BOOLValue");
  self->_networkReachable = v6;
  if (v6)
    v7 = !networkReachable;
  else
    v7 = 0;
  if (v7)
    -[GEOReachability _resetErrors](self, "_resetErrors");

}

void __37__GEOReachability_sharedReachability__block_invoke()
{
  GEOReachability *v0;
  void *v1;

  v0 = objc_alloc_init(GEOReachability);
  v1 = (void *)qword_1ECDBC7E0;
  qword_1ECDBC7E0 = (uint64_t)v0;

}

- (GEOReachability)init
{
  GEOReachability *v2;
  GEOReachability *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD handler[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GEOReachability;
  v2 = -[GEOReachability init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_networkReachable = 1;
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C80D38];
    objc_msgSend(v4, "addTileGroupObserver:queue:", v3, MEMORY[0x1E0C80D38]);

    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_networkReachable = objc_msgSend(v6, "isNetworkReachable");

    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addNetworkReachableObserver:selector:", v3, sel__reachabilityChanged_);

    objc_initWeak(&location, v3);
    v8 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __23__GEOReachability_init__block_invoke;
    handler[3] = &unk_1E1C05280;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.symptoms.hasAlternateAdvice", &v3->_symptomsAlternateAdviceToken, v5, handler);

    if (GEOConfigGetBOOL(GeoServicesConfig_DaemonLaunchShouldRetryFailedXPCTileLoads, (uint64_t)off_1EDF4E1C8))
    {
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __23__GEOReachability_init__block_invoke_2;
      v11[3] = &unk_1E1C05280;
      objc_copyWeak(&v12, &location);
      notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v3->_daemonLaunchNotifyToken, MEMORY[0x1E0C80D38], v11);

      objc_destroyWeak(&v12);
    }
    else
    {
      v3->_daemonLaunchNotifyToken = -1;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__offlineStateChanged_, CFSTR("GEOOfflineStateChangedNotification"), 0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __23__GEOReachability_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  if (GEOConfigGetBOOL(GeoServicesConfig_SymptomsAlternateAdviceShouldRetry, (uint64_t)off_1EDF4CF68))
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    if (state64 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_resetErrors");

    }
  }
}

void __23__GEOReachability_init__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[4])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resetErrors");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  int daemonLaunchNotifyToken;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  notify_cancel(self->_symptomsAlternateAdviceToken);
  daemonLaunchNotifyToken = self->_daemonLaunchNotifyToken;
  if (daemonLaunchNotifyToken != -1)
    notify_cancel(daemonLaunchNotifyToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTileGroupObserver:", self);

  +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeNetworkReachableObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)GEOReachability;
  -[GEOReachability dealloc](&v7, sel_dealloc);
}

- (BOOL)anyFailures
{
  return self->_errorCount || self->_xpcErrors != 0;
}

- (void)reportLoadFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "code");
    if ((unint64_t)(v8 + 301) < 2 || v8 == -15)
      ++self->_xpcErrors;
  }
  v13 = v4;
  GEOErrorDomain();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (!v11 || (v12 = objc_msgSend(v13, "code"), v12 == -213) || v12 == -11 || v12 == -7)
  {

    ++self->_errorCount;
  }
  else
  {

  }
}

- (BOOL)networkAvailable
{
  return self->_networkReachable;
}

- (void)_offlineStateChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("GEOReachabilityChangedNotification"), self);

}

@end
