@implementation GEOOfflineService

+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  $BD055F43A5DF7FBAA8066526AB28D3ED v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(+[GEOOfflineService stateManagerClass](), "isCohortAllowed:", v3)
      && objc_msgSend(+[GEOOfflineService stateManagerClass](), "isOfflineAvailable"))
    {
      +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "offlineCohortId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", v3);

      if (v6
        && (+[GEOOfflineService sharedNoCreate](GEOOfflineService, "sharedNoCreate"),
            (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = v7;
        v9.var0 = objc_msgSend(v7, "state");

      }
      else
      {
        v9.var0 = objc_msgSend(+[GEOOfflineService stateManagerClass](), "activeStateForCohortId:", v3);
      }
    }
    else
    {
      v9.var0 = 513;
    }
  }
  else
  {
    v9.var0 = 0;
  }

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)v9.var0;
}

+ (GEOOfflineService)sharedNoCreate
{
  return (GEOOfflineService *)(id)_MergedGlobals_234;
}

+ (id)stateManagerClass
{
  void *v0;

  objc_opt_self();
  v0 = (void *)_stateManagerClass;
  if (!_stateManagerClass)
  {
    objc_opt_self();
    v0 = (void *)objc_opt_class();
    _stateManagerClass = (uint64_t)v0;
  }
  return v0;
}

+ (GEOOfflineService)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__GEOOfflineService_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBBFC8 != -1)
    dispatch_once(&qword_1ECDBBFC8, block);
  return (GEOOfflineService *)(id)_MergedGlobals_234;
}

void __27__GEOOfflineService_shared__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[GEOEntitlements currentProcessEntitlement:](GEOEntitlements, "currentProcessEntitlement:", CFSTR("com.apple.geoservices.offline.cohort-id"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "bundleIdentifier"),
        v2 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2))
  {
    if (objc_msgSend(+[GEOOfflineService stateManagerClass](), "isCohortAllowed:", v2))
    {
      v4 = -[GEOOfflineService initWithSubscriptionManager:preferredAuditToken:]((id *)objc_alloc(*(Class *)(a1 + 32)), 0);
      v5 = (void *)_MergedGlobals_234;
      _MergedGlobals_234 = (uint64_t)v4;

    }
    else
    {
      GEOGetOfflineServiceLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v7 = 138543362;
        v8 = v2;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_FAULT, "Attempt to use offline service with non-allowlisted cohort ID: %{public}@", (uint8_t *)&v7, 0xCu);
      }

    }
  }
  else
  {
    GEOGetOfflineServiceLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Attempt to use offline service with no cohort ID specified", (uint8_t *)&v7, 2u);
    }
  }

}

- (id)initWithSubscriptionManager:(id *)a1 preferredAuditToken:(void *)a2
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  GEOMapDataSubscriptionManager *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id *v24;
  id location;
  objc_super v26;

  v4 = a2;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)GEOOfflineService;
    v5 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[7] = 0;
      v5[15] = 0;
      *((_BYTE *)v5 + 136) = 0;
      v6 = geo_dispatch_queue_create();
      v7 = a1[10];
      a1[10] = (id)v6;

      v8 = objc_alloc_init(GEOMapDataSubscriptionManager);
      v9 = a1[8];
      a1[8] = v8;

      v10 = geo_isolater_create();
      v11 = a1[14];
      a1[14] = (id)v10;

      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[19];
      a1[19] = (id)v12;

      a1[5] = (id)-1;
      objc_storeStrong(a1 + 2, a2);
      objc_initWeak(&location, a1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OfflineService:%p"), a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = a1[10];
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke;
      v23[3] = &unk_1E1BFF6F8;
      v17 = a1;
      v24 = v17;
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_2;
      v21[3] = &unk_1E1C07998;
      objc_copyWeak(&v22, &location);
      +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:reconnectBlock:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:reconnectBlock:eventHandler:", 23, v14, v15, v23, v21);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v17[20];
      v17[20] = (id)v18;

      objc_msgSend(v17[20], "setReconnectAutomatically:", 1);
      GEORegisterPListStateCaptureLegacy();
      a1 = v17;
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
  }

  return a1;
}

- (void)startServiceIfEnabled
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GEOOfflineService_startServiceIfEnabled__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __42__GEOOfflineService_startServiceIfEnabled__block_invoke(uint64_t a1)
{
  -[GEOOfflineService _goActiveOnQueue](*(_QWORD *)(a1 + 32));
}

- (void)_goActiveOnQueue
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD handler[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    if (*(_QWORD *)(a1 + 8) != 2)
    {
      GEOGetOfflineServiceLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = "Shutdown";
        v5 = *(_QWORD *)(a1 + 8);
        v4 = *(_QWORD *)(a1 + 16);
        if (v5 == 1)
          v3 = "Inactive";
        *(_DWORD *)buf = 138412802;
        v23 = v4;
        v24 = 2082;
        if (v5 == 2)
          v3 = "Active";
        v25 = v3;
        v26 = 2082;
        v27 = "Inactive";
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "Starting service with preferred audit token: %@. switching from %{public}s -> %{public}s", buf, 0x20u);
      }

      *(_QWORD *)(a1 + 8) = 1;
      objc_initWeak((id *)buf, (id)a1);
      v6 = MEMORY[0x1E0C809B0];
      if (*(_DWORD *)(a1 + 40) == -1)
      {
        v7 = *(NSObject **)(a1 + 80);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke;
        handler[3] = &unk_1E1C05280;
        objc_copyWeak(&v21, (id *)buf);
        notify_register_dispatch("GEODaemonDidStartDarwinNotification", (int *)(a1 + 40), v7, handler);
        objc_destroyWeak(&v21);
      }
      -[GEOOfflineService _switchToState:waitForReply:]((_QWORD *)a1, 2, 1);
      v8 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
      v9 = *(NSObject **)(a1 + 80);
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_2;
      v18[3] = &unk_1E1C05280;
      objc_copyWeak(&v19, (id *)buf);
      notify_register_dispatch(v8, (int *)(a1 + 44), v9, v18);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_3;
      v16[3] = &unk_1E1C0B150;
      objc_copyWeak(&v17, (id *)buf);
      objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("GEOOfflineAvailabilityChangedNotification"), 0, 0, v16);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v11;

      GEOConfigGetDouble(GeoOfflineConfig_CohortStateTTL, (uint64_t)off_1EDF4E948);
      v13 = geo_dispatch_timer_create_on_qos();
      v14 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v13;

      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      -[GEOOfflineService _updateSubscribedRegions](a1);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      LODWORD(v10) = WeakRetained == 0;

      if ((_DWORD)v10)
        -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)a1);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[GEOOfflineService _switchToState:waitForReply:](WeakRetained, WeakRetained[1], 1);
    WeakRetained = v2;
  }

}

- (void)_switchToState:(int)a3 waitForReply:
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  GEOOfflineServiceStateSubscribeRequest *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  _QWORD v20[4];
  GEOOfflineServiceStateSubscribeRequest *v21;
  _QWORD *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  GEOGetOfflineServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = a1[1];
    v8 = "Shutdown";
    if (v7 == 1)
      v9 = "Inactive";
    else
      v9 = "Shutdown";
    if (v7 == 2)
      v10 = "Active";
    else
      v10 = v9;
    if (a2 == 1)
      v8 = "Inactive";
    if (a2 == 2)
      v8 = "Active";
    *(_DWORD *)buf = 136446722;
    v25 = v10;
    if (a3)
      v11 = "YES";
    else
      v11 = "NO";
    v26 = 2082;
    v27 = v8;
    v28 = 2080;
    v29 = v11;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Switching from state: %{public}s -> %{public}s, willWait: %s", buf, 0x20u);
  }

  v12 = -[GEOOfflineServiceStateSubscribeRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineServiceStateSubscribeRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, a1[2], 0);
  -[GEOOfflineServiceStateSubscribeRequest setSubscribe:](v12, "setSubscribe:", a2 != 0);
  v13 = a1[20];
  if ((a3 & 1) != 0)
  {
    v14 = a1[10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__GEOOfflineService__switchToState_waitForReply___block_invoke;
    v20[3] = &unk_1E1C0B290;
    v21 = v12;
    v22 = a1;
    v23 = a2;
    -[GEOXPCRequest send:withReply:handler:](v21, "send:withReply:handler:", v13, v14, v20);

  }
  else
  {
    -[GEOXPCRequest send:](v12, "send:", a1[20]);
    GEOGetOfflineServiceLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = "Shutdown";
      v17 = a1[1];
      if (v17 == 1)
        v18 = "Inactive";
      else
        v18 = "Shutdown";
      if (v17 == 2)
        v19 = "Active";
      else
        v19 = v18;
      if (a2 == 1)
        v16 = "Inactive";
      if (a2 == 2)
        v16 = "Active";
      *(_DWORD *)buf = 136446466;
      v25 = v19;
      v26 = 2082;
      v27 = v16;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Switched state %{public}s -> %{public}s", buf, 0x16u);
    }

    a1[1] = a2;
  }

}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOOfflineService _updateSubscribedRegions]((uint64_t)WeakRetained);

}

- (void)_updateSubscribedRegions
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t v16;
  id v17;

  if (a1)
  {
    v2 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v2);
    v4 = *(void **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 80);
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke;
    v14[3] = &unk_1E1C0B2B8;
    v15 = v2;
    v16 = a1;
    v7 = v3;
    v17 = v7;
    v8 = v2;
    objc_msgSend(v4, "fetchAllSubscriptionsWithCallbackQueue:completionHandler:", v5, v14);
    v9 = *(NSObject **)(a1 + 80);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke_103;
    block[3] = &unk_1E1C00738;
    v12 = v7;
    v13 = a1;
    v10 = v7;
    dispatch_group_notify(v8, v9, block);

  }
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "state");
    GEOGetOfflineServiceLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      GEOOfflineStateAsString(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "Offline availability updated (%{public}@). Changing state to: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("overall_changed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_27;
      block[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v15, v4);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v15);
    }
  }

}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("GEOOfflineStateChangedNotification"), WeakRetained);

}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_2_29()
{
  id v0;

  +[GEOUtilityService sharedService](GEOUtilityService, "sharedService");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sendHeartbeat");

}

- (void)_startCheckingConnectivity
{
  uint64_t v2;
  dispatch_queue_t v3;
  id v4;
  id location;

  if (a1)
  {
    dispatch_assert_queue_V2(a1[10]);
    if (!a1[13] && GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityInterval, (uint64_t)off_1EDF4EB98) != 0.0)
    {
      objc_initWeak(&location, a1);
      objc_copyWeak(&v4, &location);
      v2 = geo_dispatch_timer_create_on_qos();
      v3 = a1[13];
      a1[13] = (dispatch_queue_t)v2;

      dispatch_activate(a1[13]);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (GEOOfflineService)initWithPreferredAuditToken:(id)a3
{
  return (GEOOfflineService *)-[GEOOfflineService initWithSubscriptionManager:preferredAuditToken:]((id *)&self->super.isa, a3);
}

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke(uint64_t a1)
{
  -[GEOOfflineService _fetchCurrentState](*(_QWORD **)(a1 + 32));
}

- (void)_fetchCurrentState
{
  GEOOfflineServiceStateFetchStateRequest *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  if (a1)
  {
    v2 = -[GEOOfflineServiceStateFetchStateRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineServiceStateFetchStateRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, a1[2], 0);
    v3 = a1[20];
    v4 = a1[10];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__GEOOfflineService__fetchCurrentState__block_invoke;
    v5[3] = &unk_1E1C0B268;
    v5[4] = a1;
    -[GEOXPCRequest send:withReply:handler:](v2, "send:withReply:handler:", v3, v4, v5);

  }
}

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && MEMORY[0x18D765A14](v3) == MEMORY[0x1E0C812F8])
  {
    v5 = WeakRetained[10];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_3;
    v6[3] = &unk_1E1C00738;
    v7 = WeakRetained;
    v8 = v3;
    dispatch_async(v5, v6);

  }
}

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void (**v14)(void);
  id v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  id v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  id v32;
  _BYTE buf[24];
  void *v34;
  uint64_t v35;
  _BYTE v36[24];
  void *v37;
  uint64_t v38;
  id v39;
  id *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    if (+[GEOXPCMessage canDecodeFromXPCDictionary:](GEOOfflineServiceSuggestedStateChanged, "canDecodeFromXPCDictionary:", v2))
    {
      v26 = 0;
      +[GEOXPCMessage decodeFromXPCDictionary:error:](GEOOfflineServiceSuggestedStateChanged, "decodeFromXPCDictionary:error:", v2, &v26);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v26;
      v5 = v4;
      if (v3 && !v4)
      {
        -[GEOOfflineService setSuggestedState:]((void *)v1, objc_msgSend(v3, "currentState"));
LABEL_44:

        goto LABEL_45;
      }
      GEOGetOfflineServiceLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v36 = 138412546;
        *(_QWORD *)&v36[4] = v3;
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v5;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v36, 0x16u);
      }
LABEL_33:

      goto LABEL_44;
    }
    if (+[GEOXPCMessage canDecodeFromXPCDictionary:](GEOOfflineServiceOfflineStateChanged, "canDecodeFromXPCDictionary:", v2))
    {
      v6 = v2;
      v32 = 0;
      +[GEOXPCMessage decodeFromXPCDictionary:error:](GEOOfflineServiceOfflineStateChanged, "decodeFromXPCDictionary:error:", v6, &v32);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v32;
      v9 = v8;
      if (!v7 || v8)
      {
        GEOGetOfflineServiceLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v36 = 138412546;
          *(_QWORD *)&v36[4] = v7;
          *(_WORD *)&v36[12] = 2112;
          *(_QWORD *)&v36[14] = v9;
          _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v36, 0x16u);
        }

      }
      else
      {
        v26 = 0;
        v27 = &v26;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__42;
        v30 = __Block_byref_object_dispose__42;
        v31 = 0;
        v10 = MEMORY[0x1E0C809B0];
        *(_QWORD *)v36 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v36[8] = 3221225472;
        *(_QWORD *)&v36[16] = __41__GEOOfflineService__procesStateChanged___block_invoke;
        v37 = &unk_1E1BFF8F8;
        v38 = v1;
        v39 = v7;
        v40 = &v26;
        geo_isolate_sync_data();
        GEOGetOfflineServiceLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          GEOOfflineStateAsString(*(unsigned int *)(v1 + 60));
          v12 = (id)objc_claimAutoreleasedReturnValue();
          GEOOfflineStateAsString(*(unsigned int *)(v1 + 56));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v13;
          _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEFAULT, "Received new state: %{public}@, savedState: %{public}@", buf, 0x16u);

        }
        *(_QWORD *)buf = v10;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __41__GEOOfflineService__procesStateChanged___block_invoke_116;
        v34 = &unk_1E1BFF6F8;
        v35 = v1;
        dispatch_async(MEMORY[0x1E0C80D38], buf);
        v14 = (void (**)(void))v27[5];
        if (v14)
          v14[2]();

        _Block_object_dispose(&v26, 8);
      }

    }
    else
    {
      if (+[GEOXPCMessage canDecodeFromXPCDictionary:](GEOOfflineServiceSubscriptionStateChanged, "canDecodeFromXPCDictionary:", v2))
      {
        v26 = 0;
        +[GEOXPCMessage decodeFromXPCDictionary:error:](GEOOfflineServiceSubscriptionStateChanged, "decodeFromXPCDictionary:error:", v2, &v26);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v26;
        v5 = v15;
        if (v3 && !v15)
        {
          v16 = objc_msgSend(v3, "isSubscribed");
          GEOGetOfflineServiceLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v16)
          {
            if (v18)
            {
              *(_WORD *)v36 = 0;
              _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEFAULT, "geod said hello, starting service", v36, 2u);
            }

            -[GEOOfflineService _goActiveOnQueue](v1);
            -[GEOOfflineService setSuggestedState:]((void *)v1, objc_msgSend(v3, "currentState"));
          }
          else
          {
            if (v18)
            {
              v23 = *(_QWORD *)(v1 + 8);
              v24 = "Shutdown";
              if (v23 == 1)
                v24 = "Inactive";
              if (v23 == 2)
                v25 = "Active";
              else
                v25 = v24;
              *(_DWORD *)v36 = 136315138;
              *(_QWORD *)&v36[4] = v25;
              _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEFAULT, "geod said goodbye, deactivating service if needed (current state is %s)", v36, 0xCu);
            }

            if (*(_QWORD *)(v1 + 8) == 2)
              -[GEOOfflineService _goInactiveOnQueue:canWait:](v1, 1, 1);
            *(_QWORD *)v36 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v36[8] = 3221225472;
            *(_QWORD *)&v36[16] = __52__GEOOfflineService__processSubscribedStateChanged___block_invoke;
            v37 = &unk_1E1BFF6F8;
            v38 = v1;
            geo_isolate_sync_data();
          }
          goto LABEL_44;
        }
        GEOGetOfflineServiceLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v36 = 138412546;
          *(_QWORD *)&v36[4] = v3;
          *(_WORD *)&v36[12] = 2112;
          *(_QWORD *)&v36[14] = v5;
          _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v36, 0x16u);
        }
        goto LABEL_33;
      }
      v20 = (void *)MEMORY[0x18D765864](v2);
      GEOGetOfflineServiceLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v36 = 136315138;
        *(_QWORD *)&v36[4] = v20;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Received unrecognized message: %s", v36, 0xCu);
      }

      free(v20);
    }
  }
LABEL_45:

}

- (void)dealloc
{
  unint64_t serviceState;
  const char *v4;
  objc_super v5;
  uint8_t buf[4];
  GEOOfflineService *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  serviceState = self->_serviceState;
  if (serviceState)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = "Shutdown";
      if (serviceState == 1)
        v4 = "Inactive";
      if (serviceState == 2)
        v4 = "Active";
      *(_DWORD *)buf = 134218242;
      v7 = self;
      v8 = 2082;
      v9 = v4;
      _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "dealloc called on %p while still in %{public}s state", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _serviceState == ServiceStateShutdown", buf, 2u);
    }
    -[GEOOfflineService _goInactiveOnQueue:canWait:]((uint64_t)self, 0, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineService;
  -[GEOOfflineService dealloc](&v5, sel_dealloc);
}

- (void)_goInactiveOnQueue:(int)a3 canWait:
{
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  const char *v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1 || *(_QWORD *)(a1 + 8) == a2)
    return;
  GEOGetOfflineServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 == 1)
  {
    if (v7)
    {
      v8 = "NO";
      if (a3)
        v8 = "YES";
      *(_DWORD *)buf = 136315138;
      v36 = v8;
      v9 = "Deactivating service, canWait: %s";
LABEL_12:
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else if (v7)
  {
    v10 = "NO";
    if (a3)
      v10 = "YES";
    *(_DWORD *)buf = 136315138;
    v36 = v10;
    v9 = "Shutting down service, canWait: %s";
    goto LABEL_12;
  }

  -[GEOOfflineService _switchToState:waitForReply:]((_QWORD *)a1, a2, a3);
  GEOUnregisterStateCaptureLegacy();
  if (!a2)
  {
    v11 = *(_DWORD *)(a1 + 40);
    if (v11 != -1)
    {
      notify_cancel(v11);
      *(_DWORD *)(a1 + 40) = -1;
    }
    objc_msgSend(*(id *)(a1 + 160), "close");
  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __48__GEOOfflineService__goInactiveOnQueue_canWait___block_invoke;
  v32 = &unk_1E1BFF6F8;
  v33 = a1;
  geo_isolate_sync_data();
  v12 = *(_DWORD *)(a1 + 44);
  if (v12 != -1)
  {
    notify_cancel(v12);
    *(_DWORD *)(a1 + 44) = -1;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver:", *(_QWORD *)(a1 + 48));

  }
  v14 = *(NSObject **)(a1 + 96);
  if (v14)
  {
    dispatch_source_cancel(v14);
    v15 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

  }
  -[GEOOfflineService _stopCheckingConnectivity](a1);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 72), "allValues", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20);
        if (v21)
          v22 = *(void **)(v21 + 16);
        else
          v22 = 0;
        objc_msgSend(v22, "removeObserver:forKeyPath:context:", a1, CFSTR("loadState"), _KVOContext_0);
        ++v20;
      }
      while (v18 != v20);
      v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      v18 = v23;
    }
    while (v23);
  }

  v24 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;

}

uint64_t __48__GEOOfflineService__goInactiveOnQueue_canWait___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = 0;
  return result;
}

- (void)_stopCheckingConnectivity
{
  NSObject *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    v2 = *(NSObject **)(a1 + 104);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

    }
  }
}

- (void)shutdownService
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GEOOfflineService_shutdownService__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__GEOOfflineService_shutdownService__block_invoke(uint64_t a1)
{
  -[GEOOfflineService _goInactiveOnQueue:canWait:](*(_QWORD *)(a1 + 32), 0, 0);
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  int subscriptionsChangedNotifyToken;
  BOOL v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  OS_dispatch_source *heartbeatTimer;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  id WeakRetained;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _QWORD v32[12];
  _QWORD v33[14];

  v33[12] = *MEMORY[0x1E0C80C00];
  subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  v5 = self->_daemonLaunchNotifyToken == -1;
  v26 = CFSTR("daemonLaunch");
  v27 = CFSTR("subscriptionChange");
  if (v5)
    v6 = CFSTR("NO");
  else
    v6 = CFSTR("YES");
  if (subscriptionsChangedNotifyToken == -1)
    v7 = CFSTR("NO");
  else
    v7 = CFSTR("YES");
  v29 = v6;
  v30 = v7;
  v28 = CFSTR("offlineAvailability");
  if (self->_offlineAvailabilityObserver)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v31 = v8;
  v32[0] = CFSTR("listeners");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v26, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  v32[1] = CFSTR("geodConnected");
  if (-[GEOXPCConnection isConnected](self->_connection, "isConnected", v26, v27, v28, v29, v30))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v33[1] = v10;
  v32[2] = CFSTR("savedState");
  GEOOfflineStateAsString(self->_savedState.raw);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v11;
  v32[3] = CFSTR("state");
  GEOOfflineStateAsString(self->_state.raw);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v12;
  v32[4] = CFSTR("numSubscriptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSDictionary count](self->_localSubscriptionInfos, "count"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  heartbeatTimer = self->_heartbeatTimer;
  if (self->_updateCoalescingTimer)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v33[4] = v13;
  v33[5] = v16;
  v32[5] = CFSTR("updateTimer");
  v32[6] = CFSTR("heartbeatTimer");
  if (heartbeatTimer)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (self->_connectivityCheckTimer)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v33[6] = v17;
  v33[7] = v18;
  v32[7] = CFSTR("connectivityTimer");
  v32[8] = CFSTR("delegate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v33[8] = v20;
  v32[9] = CFSTR("delegateInformedState");
  GEOOfflineModeAsString(self->_delegateInformedMode);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v21;
  v32[10] = CFSTR("suggestedState");
  GEOOfflineSuggestedStateAsString(self->_suggestedState);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v22;
  v32[11] = CFSTR("registeredMapViews");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMapTable count](self->_registeredMapViews, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)setDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  GEOOfflineService *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __33__GEOOfflineService_setDelegate___block_invoke;
  v15 = &unk_1E1C03ED8;
  v18 = v20;
  v16 = self;
  v17 = v4;
  v19 = v22;
  geo_isolate_sync_data();
  workQueue = self->_workQueue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __33__GEOOfflineService_setDelegate___block_invoke_2;
  v8[3] = &unk_1E1C043B0;
  v8[4] = self;
  v9 = v17;
  v10 = v20;
  v11 = v22;
  v7 = v17;
  dispatch_async(workQueue, v8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __33__GEOOfflineService_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = WeakRetained != 0;

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  v4 = *(id *)(a1 + 40);

  if (v3 != v4)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __33__GEOOfflineService_setDelegate___block_invoke_2(uint64_t *a1)
{
  uint64_t v2;

  v2 = a1[4];
  if (*(_QWORD *)(v2 + 8) == 2)
  {
    if (a1[5])
    {
      if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
        -[GEOOfflineService _stopCheckingConnectivity](v2);
    }
    else if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)v2);
    }
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      -[GEOOfflineService _fetchCurrentState]((_QWORD *)a1[4]);
      -[GEOOfflineService _setStateNeedsUpdate](a1[4]);
    }
  }
}

- (uint64_t)_setStateNeedsUpdate
{
  uint64_t v1;
  GEOCoalescingTimer *v2;
  double Double;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location[2];

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 80));
    if (!*(_QWORD *)(v1 + 88))
    {
      objc_initWeak(location, (id)v1);
      v2 = [GEOCoalescingTimer alloc];
      Double = GEOConfigGetDouble(GeoOfflineConfig_ServiceUpdateMaximumInterval, (uint64_t)off_1EDF4EBF8);
      v4 = *(_QWORD *)(v1 + 80);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __41__GEOOfflineService__setStateNeedsUpdate__block_invoke;
      v8[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v9, location);
      v5 = -[GEOCoalescingTimer initWithCoalescingInterval:deadlineInterval:queue:callback:](v2, "initWithCoalescingInterval:deadlineInterval:queue:callback:", v4, v8, 0.2, Double);
      v6 = *(void **)(v1 + 88);
      *(_QWORD *)(v1 + 88) = v5;

      objc_destroyWeak(&v9);
      objc_destroyWeak(location);
    }
    GEOGetOfflineServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Pushing out state update timer", (uint8_t *)location, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 88), "scheduleRun");
  }
  return result;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *workQueue;
  _QWORD v8[10];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v8[5] = MEMORY[0x1E0C809B0];
  v8[6] = 3221225472;
  v8[7] = __36__GEOOfflineService_removeDelegate___block_invoke;
  v8[8] = &unk_1E1BFF8F8;
  v8[9] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  geo_isolate_sync_data();
  if (*((_BYTE *)v12 + 24))
  {
    workQueue = self->_workQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __36__GEOOfflineService_removeDelegate___block_invoke_2;
    v8[3] = &unk_1E1BFF6F8;
    v8[4] = self;
    dispatch_async(workQueue, v8);
  }

  _Block_object_dispose(&v11, 8);
}

void __36__GEOOfflineService_removeDelegate___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  v3 = (id)a1[5];

  if (WeakRetained == v3)
  {
    objc_storeWeak((id *)(a1[4] + 128), 0);
    *(_BYTE *)(a1[4] + 136) = 0;
    *(_QWORD *)(a1[4] + 120) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __36__GEOOfflineService_removeDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 8) == 2)
  {
    -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)result);
    -[GEOOfflineService _fetchCurrentState](*(_QWORD **)(a1 + 32));
    return -[GEOOfflineService _setStateNeedsUpdate](*(_QWORD *)(a1 + 32));
  }
  return result;
}

- (GEOOfflineServiceDelegate)delegate
{
  id WeakRetained;
  geo_isolater *v5;

  v5 = self->_applicationStateIsolater;
  _geo_isolate_lock_data();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  _geo_isolate_unlock();

  return (GEOOfflineServiceDelegate *)WeakRetained;
}

- (void)registerMapView:(id)a3 withPriority:(double)a4
{
  id v6;
  NSObject *v7;
  _GEOOfflineServiceMapViewMetaData *v8;
  _BYTE v9[12];
  __int16 v10;
  id v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOGetOfflineServiceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 141558530;
    *(_QWORD *)&v9[4] = 1752392040;
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEFAULT, "registering map view: %{mask.hash}@ at %f", v9, 0x20u);
  }

  *(_QWORD *)v9 = self->_applicationStateIsolater;
  _geo_isolate_lock_data();
  -[NSMapTable objectForKey:](self->_registeredMapViews, "objectForKey:", v6);
  v8 = (_GEOOfflineServiceMapViewMetaData *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (v8 = objc_alloc_init(_GEOOfflineServiceMapViewMetaData),
        -[NSMapTable setObject:forKey:](self->_registeredMapViews, "setObject:forKey:", v8, v6),
        v8))
  {
    v8->priority = a4;

  }
  _geo_isolate_unlock();

}

- (void)unregisterMapView:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BYTE buf[24];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOGetOfflineServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "UNregistering map view: %{mask.hash}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v8 = 0;
  v6 = v4;
  geo_isolate_sync_data();
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);

  _Block_object_dispose(buf, 8);
}

uint64_t __39__GEOOfflineService_unregisterMapView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 == v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (id)_mapViewToUse
{
  id *WeakRetained;
  id v2;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double *v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double *v19;
  uint64_t v20;
  id *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  WeakRetained = a1;
  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return WeakRetained;
  geo_assert_isolated();
  if ((unint64_t)objc_msgSend(WeakRetained[19], "count") <= 1)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
    return WeakRetained;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = WeakRetained[19];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v3)
  {

    v5 = 0;
    goto LABEL_36;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v24;
  v8 = 2.22507386e-308;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(WeakRetained[19], "objectForKey:", v10, (_QWORD)v23);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (double *)v11;
      if (!v5)
      {
LABEL_22:
        if (v12)
          v13 = v12[1];
        else
          v13 = 0.0;
LABEL_24:
        v18 = v10;

        v19 = v12;
        v5 = v19;
        v6 = v18;
        v8 = v13;
        goto LABEL_25;
      }
      if (v11)
      {
        v13 = *(double *)(v11 + 8);
        if (v13 > v8)
          goto LABEL_24;
        v14 = v5 + 3;
        v15 = *(double *)(v11 + 24) - v5[3];
      }
      else
      {
        v13 = 0.0;
        if (v8 < 0.0)
          goto LABEL_24;
        v14 = v5 + 3;
        v15 = 0.0 - v5[3];
      }
      if (v15 < 0.0)
        v15 = -v15;
      if (v15 >= GEOConfigGetDouble(GeoOfflineConfig_MapViewUpdateMaxDeltaToUseSpan, (uint64_t)off_1EDF4EC98))
      {
        if (v12)
          v17 = v12[3];
        else
          v17 = 0.0;
        if (v17 > *v14)
          goto LABEL_22;
      }
      else
      {
        if (v12)
          v16 = v12[6] * v12[7];
        else
          v16 = 0.0;
        if (v16 < v5[6] * v5[7])
          goto LABEL_22;
      }
LABEL_25:

      ++v9;
    }
    while (v4 != v9);
    v20 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v4 = v20;
  }
  while (v20);

  if (v6)
  {
    WeakRetained = v6;
    v21 = WeakRetained;
    goto LABEL_37;
  }
LABEL_36:
  WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
  v21 = 0;
LABEL_37:

  return WeakRetained;
}

- (void)setStateNeedsUpdate
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__GEOOfflineService_setStateNeedsUpdate__block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)mapView:(id)a3 viewPortUpdated:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v7 + 24))
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);

  _Block_object_dispose(&v6, 8);
}

void __45__GEOOfflineService_mapView_viewPortUpdated___block_invoke(uint64_t a1)
{
  CFAbsoluteTime *v2;
  __int128 v3;
  id WeakRetained;
  void *v5;
  CFAbsoluteTime *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (CFAbsoluteTime *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
    v3 = *(_OWORD *)(a1 + 72);
    *((_OWORD *)v6 + 2) = *(_OWORD *)(a1 + 56);
    *((_OWORD *)v6 + 3) = v3;
    v6[3] = CFAbsoluteTimeGetCurrent();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    if (WeakRetained)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 == *(void **)(a1 + 40);

    }
    v2 = v6;
  }

}

- (void)mapView:(id)a3 viewPortUpdated:(id)a4 showingGrid:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v8 + 24))
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);

  _Block_object_dispose(&v7, 8);
}

void __57__GEOOfflineService_mapView_viewPortUpdated_showingGrid___block_invoke(uint64_t a1)
{
  CFAbsoluteTime *v2;
  __int128 v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  CFAbsoluteTime *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (CFAbsoluteTime *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 40));
    v3 = *(_OWORD *)(a1 + 72);
    *((_OWORD *)v7 + 2) = *(_OWORD *)(a1 + 56);
    *((_OWORD *)v7 + 3) = v3;
    v7[3] = CFAbsoluteTimeGetCurrent();
    v4 = 1;
    if (*(_BYTE *)(a1 + 88))
      v4 = 2;
    *((_QWORD *)v7 + 2) = v4;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    if (WeakRetained)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 == *(void **)(a1 + 40);

    }
    v2 = v7;
  }

}

- (BOOL)isUsingOffline
{
  unsigned __int8 v2;
  int v3;
  _BOOL4 v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = -[GEOOfflineService state](self, "state");
  v3 = v2;
  if (v2 >= 3u)
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v6, 8u);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = (v2 & 7) == 2;
  }
  return v4;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)state
{
  if (objc_msgSend(+[GEOOfflineService stateManagerClass](), "isOfflineAvailable"))
    return ($BD055F43A5DF7FBAA8066526AB28D3ED)-[GEOOfflineService _stateIsolated]((uint64_t)self);
  else
    return ($BD055F43A5DF7FBAA8066526AB28D3ED)513;
}

- (uint64_t)_stateIsolated
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  int v7;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2810000000;
  v6 = "";
  v7 = 0;
  geo_isolate_sync_data();
  v1 = *((unsigned int *)v4 + 8);
  _Block_object_dispose(&v3, 8);
  return v1;
}

uint64_t __35__GEOOfflineService__stateIsolated__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32) = *(_DWORD *)(*(_QWORD *)(result + 32) + 60);
  return result;
}

- (void)setStateAuto
{
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v13;
  void *v14;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  const char *v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2810000000;
  v21 = "";
  v22 = 0;
  geo_isolate_sync_data();
  if (*((_BYTE *)v24 + 24))
  {
    v3 = *((_DWORD *)v19 + 8);
    if (v3 >= 2u)
    {
      if (v3 == 2)
        goto LABEL_10;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v3;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    v4 = BYTE1(v3);
    if (v4 >= 2)
    {
      if (v4 == 2)
        goto LABEL_16;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v4;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
      }
    }
LABEL_10:
    v5 = *((_DWORD *)v19 + 8);
    v6 = v5;
    if (v5 < 2u)
      goto LABEL_20;
    if (v5 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v6;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Unreachable reached: invalid offline mode value %x";
      goto LABEL_28;
    }
    v7 = BYTE1(v5);
    if (BYTE1(v5) < 2u)
    {
LABEL_20:
      GEOGetOfflineServiceLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        GEOOfflineStateAsString(*((unsigned int *)v19 + 8));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v14;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEFAULT, "Restoring saved state: %{public}@", buf, 0xCu);

      }
      v11 = *((_DWORD *)v19 + 8);
LABEL_23:
      -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v11);
      -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
      goto LABEL_24;
    }
    if (BYTE1(v5) != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v7;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Unreachable reached: invalid offline reason value %x";
LABEL_28:
      _os_log_fault_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, v17, buf, 8u);
      goto LABEL_20;
    }
LABEL_16:
    GEOGetOfflineServiceLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      GEOOfflineStateAsString(*((unsigned int *)v19 + 8));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      GEOOfflineStateAsString(0x101uLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "Saved state was %{public}@. Setting to %{public}@ instead", buf, 0x16u);

    }
    v11 = 257;
    *((_DWORD *)v19 + 8) = 257;
    goto LABEL_23;
  }
LABEL_24:
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
}

void __33__GEOOfflineService_setStateAuto__block_invoke(_QWORD *a1)
{
  _DWORD *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (_DWORD *)a1[4];
  v3 = v2[15];
  if ((_BYTE)v3)
    v4 = (v3 & 0xFF00) == 0;
  else
    v4 = 1;
  if (v4)
  {
    objc_initWeak(location, v2);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __33__GEOOfflineService_setStateAuto__block_invoke_2;
    v14[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v15, location);
    v5 = objc_msgSend(v14, "copy");
    v6 = a1[4];
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
    return;
  }
  v8 = v3;
  if (v3 >= 2u)
  {
    if (v3 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        return;
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v8;
      v12 = MEMORY[0x1E0C81028];
      v13 = "Unreachable reached: invalid offline mode value %x";
LABEL_19:
      _os_log_fault_impl(&dword_1885A9000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)location, 8u);
      return;
    }
    v9 = BYTE1(v3);
    if (BYTE1(v3) >= 2u)
    {
      if (BYTE1(v3) == 2)
      {
        *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 32) = v2[14];
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
        return;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 67109120;
        HIDWORD(location[0]) = v9;
        v12 = MEMORY[0x1E0C81028];
        v13 = "Unreachable reached: invalid offline reason value %x";
        goto LABEL_19;
      }
    }
  }
}

void __33__GEOOfflineService_setStateAuto__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStateAuto");

}

- (void)_setState:(uint64_t)a1 ifStateIs:(unsigned int)a2
{
  GEOOfflineServiceSetStateRequest *v4;
  uint64_t v5;
  GEOOfflineServiceSetStateRequest *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[6];
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  GEOOfflineServiceSetStateRequest *v19;
  uint8_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  int v29;
  uint8_t buf[4];
  void *v31;
  uint8_t v32[8];
  uint8_t *v33;
  uint64_t v34;
  const char *v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (a2 < 2u)
    goto LABEL_6;
  if (a2 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v32 = 67109120;
      *(_DWORD *)&v32[4] = a2;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", v32, 8u);
    }
LABEL_6:
    if (BYTE1(a2) >= 2u)
    {
      if (BYTE1(a2) == 2)
        return;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v32 = 67109120;
        *(_DWORD *)&v32[4] = BYTE1(a2);
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", v32, 8u);
      }
    }
  }
  v4 = -[GEOOfflineServiceSetStateRequest initWithTraits:auditToken:throttleToken:]([GEOOfflineServiceSetStateRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, *(_QWORD *)(a1 + 16), 0);
  *(_QWORD *)v32 = 0;
  v33 = v32;
  v34 = 0x2810000000;
  v35 = "";
  v36 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2810000000;
  v28[3] = "";
  v29 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __41__GEOOfflineService__setState_ifStateIs___block_invoke;
  v17 = &unk_1E1C0B218;
  v23 = a2;
  v18 = a1;
  v20 = v32;
  v21 = v28;
  v6 = v4;
  v19 = v6;
  v22 = &v24;
  geo_isolate_sync_data();
  if (*((_BYTE *)v25 + 24))
  {
    GEOGetOfflineServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      GEOOfflineStateAsString(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEFAULT, "Changing state to: %{public}@", buf, 0xCu);

    }
    v9 = *(id *)(a1 + 160);
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __41__GEOOfflineService__setState_ifStateIs___block_invoke_87;
    v12[3] = &unk_1E1C0B240;
    v13 = a2;
    v12[4] = a1;
    v12[5] = v32;
    -[GEOXPCRequest send:withReply:handler:](v6, "send:withReply:handler:", v9, v10, v12);

  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v32, 8);

}

- (void)setStateForcedOffline
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  geo_isolate_sync_data();
  if (*((_BYTE *)v4 + 24))
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, 0x10202u);
  _Block_object_dispose(&v3, 8);
}

void __42__GEOOfflineService_setStateForcedOffline__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v2 = *(_DWORD **)(a1 + 32);
  if (v2[15])
    v3 = (v2[15] & 0xFF00) == 0;
  else
    v3 = 1;
  if (v3)
  {
    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__GEOOfflineService_setStateForcedOffline__block_invoke_2;
    v7[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v8, &location);
    v4 = objc_msgSend(v7, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __42__GEOOfflineService_setStateForcedOffline__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStateForcedOffline");

}

- (void)delegatePrefersMode:(unsigned __int8)a3
{
  -[GEOOfflineService delegatePrefersMode:device:](self, "delegatePrefersMode:device:", a3, 0);
}

- (void)delegatePrefersMode:(unsigned __int8)a3 device:(unsigned __int8)a4
{
  int v4;
  int v5;
  void *v7;
  BOOL v8;
  int v9;

  v4 = a4;
  v5 = a3;
  -[GEOOfflineService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
      v8 = 0;
    else
      v8 = v5 == 2;
    v9 = (v4 << 16) | 0x100;
    if (v8)
      v9 = 65792;
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v9 | v5);
    geo_isolate_sync_data();
  }
}

uint64_t __48__GEOOfflineService_delegatePrefersMode_device___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 136) = *(_BYTE *)(result + 40);
  return result;
}

- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4
{
  -[GEOOfflineService delegate:prefersMode:device:](self, "delegate:prefersMode:device:", a3, a4, 0);
}

- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4 device:(unsigned __int8)a5
{
  int v5;
  int v6;
  id v8;
  id v9;
  BOOL v10;
  int v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[GEOOfflineService delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    if (v5)
      v10 = 0;
    else
      v10 = v6 == 2;
    v11 = (v5 << 16) | 0x100;
    if (v10)
      v11 = 65792;
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v11 | v6);
    geo_isolate_sync_data();
  }
}

uint64_t __49__GEOOfflineService_delegate_prefersMode_device___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 136) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __41__GEOOfflineService__setState_ifStateIs___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(*(_QWORD *)(result + 32) + 60);
  if (v1 != *(_DWORD *)(result + 72))
  {
    v2 = result;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 32) = v1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 32) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56);
    v3 = *(_QWORD *)(result + 32);
    v4 = *(_DWORD *)(v3 + 60);
    v5 = v4;
    if (v4 >= 2u)
    {
      if (v4 != 2)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          goto LABEL_10;
        LODWORD(v10) = 67109120;
        HIDWORD(v10) = v5;
        v7 = MEMORY[0x1E0C81028];
        v8 = "Unreachable reached: invalid offline mode value %x";
        goto LABEL_14;
      }
      v6 = BYTE1(v4);
      if (BYTE1(v4) >= 2u)
      {
        if (BYTE1(v4) == 2)
        {
LABEL_11:
          *(_DWORD *)(v3 + 60) = *(_DWORD *)(v2 + 72);
          objc_msgSend(*(id *)(v2 + 40), "setState:", *(unsigned int *)(*(_QWORD *)(v2 + 32) + 60), v10, v11);
          result = objc_msgSend(*(id *)(v2 + 40), "setSavedState:", *(unsigned int *)(*(_QWORD *)(v2 + 32) + 56));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 24) = 1;
          return result;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          LODWORD(v10) = 67109120;
          HIDWORD(v10) = v6;
          v7 = MEMORY[0x1E0C81028];
          v8 = "Unreachable reached: invalid offline reason value %x";
LABEL_14:
          _os_log_fault_impl(&dword_1885A9000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 8u);
        }
      }
    }
LABEL_10:
    *(_DWORD *)(*(_QWORD *)(v2 + 32) + 56) = *(_DWORD *)(*(_QWORD *)(v2 + 32) + 60);
    v3 = *(_QWORD *)(v2 + 32);
    goto LABEL_11;
  }
  return result;
}

void __41__GEOOfflineService__setState_ifStateIs___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOGetOfflineServiceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      GEOOfflineStateAsString(*(unsigned int *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Failed to change state to: %{public}@ - %{public}@", buf, 0x16u);

    }
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __41__GEOOfflineService__setState_ifStateIs___block_invoke_88;
    v11 = &unk_1E1BFF920;
    v12 = *(_OWORD *)(a1 + 32);
    geo_isolate_sync_data();
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("GEOOfflineStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __41__GEOOfflineService__setState_ifStateIs___block_invoke_88(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 60) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32);
  *(_DWORD *)(*(_QWORD *)(result + 32) + 56) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32);
  return result;
}

- (void)setSuggestedState:(void *)a1
{
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    geo_isolate_sync_data();
    if (*((_BYTE *)v8 + 24))
    {
      GEOGetOfflineServiceLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        GEOOfflineSuggestedStateAsString(a2);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        GEOOfflineStateAsString(objc_msgSend(a1, "state"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = v5;
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEFAULT, "Got updated suggestion: %{public}@ current state is: %{public}@", buf, 0x16u);

      }
      -[GEOOfflineService setStateNeedsUpdate]((uint64_t)a1);
    }
    _Block_object_dispose(&v7, 8);
  }
}

_QWORD *__39__GEOOfflineService_setSuggestedState___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = result[6] != *(_QWORD *)(result[4] + 120);
  *(_QWORD *)(result[4] + 120) = result[6];
  return result;
}

- (unint64_t)offlineRegionCount
{
  if (self->_state.var0.device == 1)
    return -[NSDictionary count](self->_localSubscriptionInfos, "count");
  else
    return 0;
}

void __39__GEOOfflineService__fetchCurrentState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __int16 v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOGetOfflineServiceLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to fetch to offline state: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v8 = -[GEOOfflineService _stateIsolated](*(_QWORD *)(a1 + 32));
    if ((_BYTE)v8)
      v9 = (v8 & 0xFF00) == 0;
    else
      v9 = 1;
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v11 = v5;
      v25 = v11;
      geo_isolate_sync_data();
      GEOGetOfflineServiceLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        GEOOfflineStateAsString(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 60));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        GEOOfflineStateAsString(*(unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GEOOfflineSuggestedStateAsString(objc_msgSend(v11, "currentSuggestedState"));
        v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        v27 = v15;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEFAULT, "Fetched current state: %{public}@, savedState: %{public}@, suggestion: %{public}@", buf, 0x20u);

      }
    }
    -[GEOOfflineService setSuggestedState:](*(void **)(a1 + 32), objc_msgSend(v5, "currentSuggestedState"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = __Block_byref_object_copy__42;
    v28 = __Block_byref_object_dispose__42;
    v29 = 0;
    geo_isolate_sync_data();
    v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v23)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))(v23 + 16))(v23, v16, v17, v18, v19, v20, v21, v22, v10, 3221225472, __39__GEOOfflineService__fetchCurrentState__block_invoke_92);
    _Block_object_dispose(buf, 8);

  }
}

uint64_t __39__GEOOfflineService__fetchCurrentState__block_invoke_91(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 60) = objc_msgSend(*(id *)(a1 + 40), "currentState");
  v3 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 40), "savedState");
  *(_DWORD *)(v3 + 56) = result;
  return result;
}

void __39__GEOOfflineService__fetchCurrentState__block_invoke_92(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

void __49__GEOOfflineService__switchToState_waitForReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  _QWORD *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    GEOGetOfflineServiceLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "subscribe");
      v15 = "unsubscribe";
      if (v14)
        v15 = "subscribe";
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = "Shutdown";
      if (v16 == 1)
        v17 = "Inactive";
      v24 = 136446978;
      v25 = v15;
      v18 = "Active";
      v26 = 2114;
      v27 = v7;
      v28 = 2082;
      if (v16 != 2)
        v18 = v17;
      v29 = v18;
      v30 = 2082;
      v31 = "Inactive";
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Unable to %{public}s to offline state: %{public}@. Switched state %{public}s -> %{public}s", (uint8_t *)&v24, 0x2Au);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = 1;
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = objc_msgSend(v5, "subscribed");
    if (v9 == objc_msgSend(*(id *)(a1 + 32), "subscribe"))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v10 = objc_msgSend(v5, "subscribed");
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      if (v10)
      {
        if (v12)
        {
          *(_QWORD *)(v11 + 8) = v12;
          if (*(_QWORD *)(a1 + 48) == 1)
            -[GEOOfflineService _goActiveOnQueue](*(_QWORD *)(a1 + 40));
        }
        else
        {
          *(_QWORD *)(v11 + 8) = 1;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            LOWORD(v24) = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: subscribed when trying to shutdown", (uint8_t *)&v24, 2u);
          }
        }
      }
      else if (v12)
      {
        *(_QWORD *)(v11 + 8) = 1;
      }
      else
      {
        *(_QWORD *)(v11 + 8) = 0;
      }
    }
    GEOGetOfflineServiceLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = "Shutdown";
      if (v8 == 1)
        v21 = "Inactive";
      else
        v21 = "Shutdown";
      if (v8 == 2)
        v21 = "Active";
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v22 == 1)
        v20 = "Inactive";
      if (v22 == 2)
        v20 = "Active";
      v24 = 136446466;
      v25 = v21;
      v26 = 2082;
      v27 = v20;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Switched state %{public}s -> %{public}s", (uint8_t *)&v24, 0x16u);
    }

    if (*(_QWORD *)(a1 + 48) == 2)
    {
      v23 = *(_QWORD **)(a1 + 40);
      if (v23[1] == 2)
        -[GEOOfflineService _fetchCurrentState](v23);
    }
  }

}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  _QWORD v18[5];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOGetOfflineServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Unable to fetch subscriptions: %{public}@", buf, 0xCu);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "dataTypes") & 0x400) != 0)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          v13 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 48);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke_99;
          v18[3] = &unk_1E1C03FE8;
          v18[4] = v12;
          v19 = v15;
          v20 = *(id *)(a1 + 32);
          objc_msgSend(v13, "fetchStateForSubscriptionWithIdentifier:callbackQueue:completionHandler:", v14, v16, v18);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _GEOLocalOfflineSubscriptionInfo *v10;
  void *v11;
  id v12;
  id v13;
  _GEOLocalOfflineSubscriptionInfo *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _BYTE v20[22];
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    GEOGetOfflineServiceLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v20 = 141558530;
      *(_QWORD *)&v20[4] = 1752392040;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v9;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Unable to fetch state for subscription: %{mask.hash}@ - %{public}@", v20, 0x20u);
    }

  }
  v10 = [_GEOLocalOfflineSubscriptionInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v6;
  if (v10)
  {
    *(_QWORD *)v20 = v10;
    *(_QWORD *)&v20[8] = _GEOLocalOfflineSubscriptionInfo;
    v14 = (_GEOLocalOfflineSubscriptionInfo *)objc_msgSendSuper2((objc_super *)v20, sel_init);
    v10 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_region, v11);
      objc_storeStrong((id *)&v10->_state, a2);
      v10->_rect.origin.x = GEOMapRectForMapRegion(v12);
      v10->_rect.origin.y = v15;
      v10->_rect.size.width = v16;
      v10->_rect.size.height = v17;
    }
  }

  v18 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, v19);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  GEOGetOfflineServiceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134349056;
    v36 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Fetched %{public}llu offline subscriptions", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v10 = *(_QWORD *)(a1 + 40);
        if (v9)
        {
          v11 = *(void **)(v9 + 16);
          if (!v10)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(v11, "removeObserver:forKeyPath:context:", v10, CFSTR("loadState"), _KVOContext_0);
          goto LABEL_11;
        }
        v11 = 0;
        if (v10)
          goto LABEL_10;
LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v6 = v12;
    }
    while (v12);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (!v14)
    goto LABEL_29;
  v15 = v14;
  v16 = *(_QWORD *)v26;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v26 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
      v19 = *(_QWORD *)(a1 + 40);
      if (v18)
      {
        v20 = *(void **)(v18 + 16);
        if (!v19)
          goto LABEL_24;
LABEL_23:
        objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v19, CFSTR("loadState"), 0, _KVOContext_0);
        goto LABEL_24;
      }
      v20 = 0;
      if (v19)
        goto LABEL_23;
LABEL_24:
      ++v17;
    }
    while (v15 != v17);
    v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    v15 = v21;
  }
  while (v21);
LABEL_29:

  v22 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 72);
  *(_QWORD *)(v23 + 72) = v22;

  -[GEOOfflineService setStateNeedsUpdate](*(_QWORD *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_KVOContext_0 == a6)
  {
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GEOOfflineService;
    -[GEOOfflineService observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __40__GEOOfflineService_setStateNeedsUpdate__block_invoke(uint64_t a1)
{
  return -[GEOOfflineService _setStateNeedsUpdate](*(_QWORD *)(a1 + 32));
}

void __41__GEOOfflineService__setStateNeedsUpdate__block_invoke(uint64_t a1)
{
  int v1;
  unsigned __int8 v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  unint64_t v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double *v26;
  unint64_t v27;
  void *v28;
  unsigned int v29;
  id WeakRetained;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  const char *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE buf[24];
  void *v60;
  id v61;
  uint64_t *v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 10));
    v1 = objc_msgSend(WeakRetained, "state");
    v2 = BYTE1(v1);
    if (BYTE1(v1) != 2)
    {
      v3 = v1;
      v55 = 0;
      v56 = &v55;
      v57 = 0x2020000000;
      v58 = 0;
      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__109;
      v53 = __Block_byref_object_dispose__110;
      v54 = 0;
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      v39 = 0;
      v40 = (double *)&v39;
      v41 = 0x4010000000;
      v42 = "";
      v43 = kGEOCoordinateRegionInvalid_0;
      v44 = unk_189CD4170;
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0x10000000000000;
      v4 = MEMORY[0x1E0C809B0];
      geo_isolate_sync_data();
      v5 = v56[3];
      if (v5)
      {
        if (v50[5])
        {
          if (v5 == 1)
            v6 = 1;
          else
            v6 = 2;
          if (v6 != *((unsigned __int8 *)v46 + 24))
          {
            GEOGetOfflineServiceLog();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              v8 = v50[5];
              GEOOfflineModeAsString(v6);
              v9 = (id)objc_claimAutoreleasedReturnValue();
              GEOOfflineModeAsString(*((unsigned __int8 *)v46 + 24));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2114;
              v60 = v10;
              _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_INFO, "Informing delegate %{public}@ of new suggestion: %{public}@ (was previously informed of %{public}@)", buf, 0x20u);

            }
            geo_isolate_sync_data();
            *(_QWORD *)buf = v4;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __42__GEOOfflineService__updateSuggestedState__block_invoke_2;
            v60 = &unk_1E1C0B308;
            v61 = WeakRetained;
            v62 = &v49;
            v63 = v6 | 0x100;
            dispatch_async(MEMORY[0x1E0C80D38], buf);
          }
          goto LABEL_26;
        }
        v11 = v40[5];
        if (v11 < -180.0
          || v11 > 180.0
          || (v12 = v40[4], v12 < -90.0)
          || v12 > 90.0
          || (v13 = v40[6], v13 < 0.0)
          || v13 > 180.0
          || (v14 = v40[7], v14 < 0.0)
          || v14 > 360.0)
        {
          GEOGetOfflineServiceLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "No delegate available and viewport is invalid, ignoring suggestion", buf, 2u);
          }

          goto LABEL_26;
        }
        GEOGetOfflineServiceLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v36[3];
          if (v16 > 2)
            v17 = "invalid";
          else
            v17 = off_1E1C0B358[v16];
          v19 = v32[3];
          v20 = *((_QWORD *)v40 + 6);
          v21 = *((_QWORD *)v40 + 7);
          v22 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *((_QWORD *)v40 + 4), *((_QWORD *)v40 + 5));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v23, v20, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 136446723;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2113;
          v60 = v24;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Updating suggestion with map view state \"%{public}s\" with priority %f from viewport: %{private}@", buf, 0x20u);

        }
        v25 = v56[3];
        if (!v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Should have been caught by the guard", buf, 2u);
          }
          goto LABEL_26;
        }
        if (v25 == 1)
        {
          v29 = 257;
          goto LABEL_38;
        }
        if (v25 == 2
          && objc_msgSend(+[GEOOfflineService stateManagerClass](), "isOfflineAvailableLocally"))
        {
          v26 = v40;
          v27 = v36[3];
          objc_msgSend(*((id *)WeakRetained + 9), "allValues");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[GEOOfflineService _preferredStateForRegion:inState:withSubscriptions:]((uint64_t)WeakRetained, v27, v28, v26[4], v26[5], v26[6], v26[7]);

LABEL_38:
          if ((_BYTE)v29 && (v29 & 0xFF00) != 0 && (v3 & 0xFFFF00FF | (v2 << 8)) != v29)
            -[GEOOfflineService _setState:ifStateIs:]((uint64_t)WeakRetained, v29);
        }
      }
LABEL_26:
      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(&v55, 8);
    }
  }

}

void __42__GEOOfflineService__updateSuggestedState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = WeakRetained;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136);
    -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = v5;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v8 = *(_OWORD *)(v6 + 48);
        *(_OWORD *)(v7 + 32) = *(_OWORD *)(v6 + 32);
        *(_OWORD *)(v7 + 48) = v8;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(v6 + 16);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(v6 + 8);
      }

      v5 = v9;
    }

  }
}

uint64_t __42__GEOOfflineService__updateSuggestedState__block_invoke_112(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 136) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __42__GEOOfflineService__updateSuggestedState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "offlineService:wouldLikeToSwitchToState:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (uint64_t)_preferredStateForRegion:(void *)a3 inState:(double)a4 withSubscriptions:(double)a5
{
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char *v24;
  char *v25;
  char *v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t i;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  double *v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  NSObject *v77;
  const char *v78;
  NSObject *v79;
  uint32_t v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  BOOL v85;
  int v86;
  double v87;
  double v88;
  _QWORD *v89;
  uint64_t *v90;
  _QWORD *v91;
  uint64_t *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  unint64_t v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double Double;
  double v105;
  char *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  double v112;
  __int16 v113;
  int v114;
  __int16 v115;
  unsigned int v116;
  __int16 v117;
  unsigned int v118;
  uint8_t v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = v13;
  if (!a1 || !objc_msgSend(v13, "count"))
    goto LABEL_76;
  v15 = v14;
  if (!objc_msgSend(v15, "count"))
    goto LABEL_75;
  Double = GEOConfigGetDouble(GeoOfflineConfig_CoordinateSpanForLowZoomTiles, (uint64_t)off_1EDF4E9E8);
  GEOMapRectForCoordinateRegion(a4, a5, a6, a7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (char *)malloc_type_calloc(0x20uLL, objc_msgSend(v15, "count"), 0x92AA8A7uLL);
  v25 = (char *)malloc_type_calloc(0x20uLL, objc_msgSend(v15, "count"), 0x76B633A2uLL);
  v106 = v24;
  if (!v24 || (v26 = v25) == 0)
  {
LABEL_75:

    goto LABEL_76;
  }
  if (a6 <= a7)
    v27 = a7;
  else
    v27 = a6;
  v105 = v27;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v28 = v15;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
  if (!v29)
  {
    v33 = 0;
    v75 = 0.0;
    v76 = 0.0;
LABEL_41:

    LODWORD(v67) = 0;
    goto LABEL_42;
  }
  v30 = v29;
  v98 = a2;
  v99 = v14;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = *(_QWORD *)v108;
  v35 = 0.0;
  v36 = INFINITY;
  v37 = 0.0;
  v38 = INFINITY;
  v102 = v23;
  v103 = v21;
  v100 = v19;
  v101 = v17;
  while (2)
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v108 != v34)
        objc_enumerationMutation(v28);
      v40 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
      if (!objc_msgSend(v40, "isLoaded"))
        continue;
      if (v105 > Double)
      {
        GEOGetOfflineServiceLog();
        v77 = objc_claimAutoreleasedReturnValue();
        v76 = 1.0;
        v75 = 0.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v112 = v105;
          v78 = "Viewport spans %.1f degrees and at least one subscription is loaded.";
          v79 = v77;
          v80 = 12;
LABEL_39:
          _os_log_impl(&dword_1885A9000, v79, OS_LOG_TYPE_DEBUG, v78, buf, v80);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      objc_msgSend(v40, "rect", Double, v105);
      if (GEOMapRectContainsRect(v41, v42, v43, v44, v17, v19, v21, v23))
      {
        GEOGetOfflineServiceLog();
        v77 = objc_claimAutoreleasedReturnValue();
        v76 = 1.0;
        v75 = 0.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v78 = "Found subscription which fully contains current viewport.";
LABEL_38:
          v79 = v77;
          v80 = 2;
          goto LABEL_39;
        }
LABEL_40:
        a2 = v98;
        v14 = v99;

        v33 = objc_msgSend(v40, "device");
        goto LABEL_41;
      }
      objc_msgSend(v40, "rect");
      if (GEOMapRectContainsRect(v17, v19, v21, v23, v45, v46, v47, v48))
      {
        GEOGetOfflineServiceLog();
        v77 = objc_claimAutoreleasedReturnValue();
        v76 = 0.0;
        v75 = 1.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v78 = "Found subscription which is fully contained by current viewport.";
          goto LABEL_38;
        }
        goto LABEL_40;
      }
      objc_msgSend(v40, "rect");
      v55 = GEOMapRectIntersection(v17, v19, v21, v23, v49, v50, v51, v52);
      v57 = v56;
      v58 = v53;
      v59 = fabs(v56);
      if (fabs(v55) != INFINITY && v59 != INFINITY)
      {
        v61 = v54;
        if (v53 != 0.0 || v54 != 0.0)
        {
          v33 = objc_msgSend(v40, "device");
          objc_msgSend(v40, "rect");
          v38 = GEOMapRectUnion(v38, v36, v37, v35, v62, v63);
          v36 = v64;
          v37 = v65;
          v35 = v66;
          v67 = v32 + 1;
          v68 = (double *)&v106[32 * v32];
          *v68 = v55;
          v68[1] = v57;
          v68[2] = v58;
          v68[3] = v61;
          v69 = v31 + 1;
          v70 = &v26[32 * v31];
          objc_msgSend(v40, "rect");
          *(_QWORD *)v70 = v71;
          *((_QWORD *)v70 + 1) = v72;
          *((_QWORD *)v70 + 2) = v73;
          *((_QWORD *)v70 + 3) = v74;
          if (v67 > objc_msgSend(v28, "count"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: intersectingRectsCount <= subscriptionInfos.count", buf, 2u);
            }

            a2 = v98;
            v23 = v102;
            v21 = v103;
            v19 = v100;
            v17 = v101;
LABEL_73:
            v95 = GEOMapRectAreaCoveredByMapRects((uint64_t)v106, v67, v17, v19, v21, v23);
            v96 = GEOMapRectAreaCoveredByMapRects((uint64_t)v26, v69, v38, v36, v37, v35);
            v76 = v95 / (v21 * v23);
            v75 = v95 / v96;
            v14 = v99;
            goto LABEL_42;
          }
          if (v69 > objc_msgSend(v28, "count"))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionRectsCount <= subscriptionInfos.count", buf, 2u);
            }
            v31 = v69;
            v32 = v67;
            v23 = v102;
            v21 = v103;
            v19 = v100;
            v17 = v101;
            goto LABEL_71;
          }
          v31 = v69;
          v32 = v67;
        }
      }
      v23 = v102;
      v21 = v103;
      v19 = v100;
      v17 = v101;
    }
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
    if (v30)
      continue;
    break;
  }
LABEL_71:

  if (v32)
  {
    v67 = v32;
    v69 = v31;
    a2 = v98;
    goto LABEL_73;
  }
  LODWORD(v67) = 0;
  v75 = 0.0;
  v76 = 0.0;
  a2 = v98;
  v14 = v99;
LABEL_42:
  free(v106);
  free(v26);
  GEOGetOfflineServiceLog();
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
  {
    GEOOfflineDeviceAsString(v33);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v112 = *(double *)&v82;
    v113 = 1024;
    v114 = v67;
    v115 = 1024;
    v116 = (v76 * 100.0);
    v117 = 1024;
    v118 = (v75 * 100.0);
    _os_log_impl(&dword_1885A9000, v81, OS_LOG_TYPE_INFO, "Subscriptions from device %{public}@ with %u intersecting regions have %u%% coverage and %u%% containment with viewport.", buf, 0x1Eu);

  }
  if (v76 != 0.0 || v75 != 0.0)
  {
    v85 = v75 == 1.0 || v76 == 1.0;
    if (v85 && v33)
      goto LABEL_55;
    v87 = 0.0;
    v88 = 0.0;
    if (a2 <= 2)
    {
      v89 = *(&off_1E1C0B370 + a2);
      v90 = (uint64_t *)off_1E1C0B388[a2];
      v91 = *(&off_1E1C0B3A0 + a2);
      v92 = (uint64_t *)off_1E1C0B3B8[a2];
      v87 = GEOConfigGetDouble(*v89, *v90);
      v88 = GEOConfigGetDouble(*v91, *v92);
    }
    v93 = GEOConfigGetDouble(GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOnline, (uint64_t)off_1EDF4E9A8);
    v94 = GEOConfigGetDouble(GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline, (uint64_t)off_1EDF4E9D8);
    if (v33)
    {
      if (v76 <= v87 && v75 <= v88)
      {
        v84 = 0;
        if (v76 >= v93 || v75 >= v94)
          goto LABEL_77;
        v86 = 257;
LABEL_56:
        v84 = v86 & 0xFF00FFFF | (v33 << 16);
        goto LABEL_77;
      }
LABEL_55:
      v86 = 258;
      goto LABEL_56;
    }
LABEL_76:
    v84 = 0;
    goto LABEL_77;
  }
  GEOGetOfflineServiceLog();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v119 = 0;
    _os_log_impl(&dword_1885A9000, v83, OS_LOG_TYPE_DEBUG, "No loaded subscriptions intersect current viewport.", v119, 2u);
  }

  v84 = 257;
LABEL_77:

  return v84;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)canUseOfflineForCoordinateRegion:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  unint64_t UInteger;
  $BD055F43A5DF7FBAA8066526AB28D3ED v9;
  void *v10;
  $BD055F43A5DF7FBAA8066526AB28D3ED v11;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  UInteger = GEOConfigGetUInteger(GeoOfflineConfig_CoverageThresholdModeForHelper, (uint64_t)off_1EDF4EA08);
  v9.var0 = objc_msgSend(+[GEOOfflineService stateManagerClass](), "isOfflineAvailableLocally");
  if (v9.var0)
  {
    -[NSDictionary allValues](self->_localSubscriptionInfos, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11.var0 = -[GEOOfflineService _preferredStateForRegion:inState:withSubscriptions:]((uint64_t)self, UInteger, v10, v6, v5, var0, var1);

    return v11;
  }
  return v9;
}

uint64_t __52__GEOOfflineService__processSubscribedStateChanged___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = 0;
  return result;
}

void __41__GEOOfflineService__procesStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 60) = objc_msgSend(*(id *)(a1 + 40), "currentState");
  v3 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v3 + 56) = objc_msgSend(*(id *)(a1 + 40), "savedState");
  v4 = MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

}

void __41__GEOOfflineService__procesStateChanged___block_invoke_116(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEOOfflineStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __47__GEOOfflineService__startCheckingConnectivity__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  __int16 v3;
  int v4;
  int v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  _QWORD *v12;
  const __CFString *v13;
  uint8_t buf[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_12;
  v12 = WeakRetained;
  v3 = objc_msgSend(WeakRetained, "state");
  v2 = v12;
  v4 = v3;
  if (v3 < 2u)
    goto LABEL_12;
  if (v3 != 2)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    v2 = v12;
    if (!v11)
      goto LABEL_12;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
LABEL_10:

    return;
  }
  v5 = HIBYTE(v3);
  if (HIBYTE(v3) < 2u)
  {
LABEL_9:
    v7 = (void *)v2[20];
    v13 = CFSTR("message");
    *(_QWORD *)buf = CFSTR("offlinestate.checkConnectivity");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v7;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", buf, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendDictionary:", v10);

    goto LABEL_10;
  }
  if (HIBYTE(v3) != 2)
  {
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    v2 = v12;
    if (v6)
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
      v2 = v12;
    }
    goto LABEL_9;
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_registeredMapViews, 0);
  objc_destroyWeak((id *)&self->_latestMapView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationStateIsolater, 0);
  objc_storeStrong((id *)&self->_connectivityCheckTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_updateCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localSubscriptionInfos, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong(&self->_offlineAvailabilityObserver, 0);
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
}

@end
