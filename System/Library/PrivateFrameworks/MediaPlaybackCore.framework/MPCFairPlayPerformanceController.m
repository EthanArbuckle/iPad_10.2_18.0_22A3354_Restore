@implementation MPCFairPlayPerformanceController

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCFairPlayPerformanceController _optimisticallyFetchLeaseForAccounts:](self, "_optimisticallyFetchLeaseForAccounts:", v6);

  }
}

void __52__MPCFairPlayPerformanceController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  if ((ICCurrentApplicationIsSystemApp() & 1) == 0)
  {
    v0 = -[MPCFairPlayPerformanceController _init]([MPCFairPlayPerformanceController alloc], "_init");
    v1 = (void *)sharedController___sharedController_22475;
    sharedController___sharedController_22475 = (uint64_t)v0;

  }
}

- (id)_init
{
  MPCFairPlayPerformanceController *v2;
  uint64_t v3;
  NSHashTable *leaseManagers;
  uint64_t v5;
  NSMutableSet *SAPSignPrewarmingAccounts;
  uint64_t v7;
  NSMutableSet *SAPSignPrewarmedAccounts;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *miniQueue;
  uint64_t v12;
  NSMutableDictionary *miniSINFAccounts;
  uint64_t v14;
  NSMutableSet *miniSINFEndpointLoadingAccounts;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MPCFairPlayPerformanceController;
  v2 = -[MPCFairPlayPerformanceController init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    leaseManagers = v2->_leaseManagers;
    v2->_leaseManagers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    SAPSignPrewarmingAccounts = v2->_SAPSignPrewarmingAccounts;
    v2->_SAPSignPrewarmingAccounts = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    SAPSignPrewarmedAccounts = v2->_SAPSignPrewarmedAccounts;
    v2->_SAPSignPrewarmedAccounts = (NSMutableSet *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCFairPlayPerformance-miniSinf", v9);
    miniQueue = v2->_miniQueue;
    v2->_miniQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    miniSINFAccounts = v2->_miniSINFAccounts;
    v2->_miniSINFAccounts = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    miniSINFEndpointLoadingAccounts = v2->_miniSINFEndpointLoadingAccounts;
    v2->_miniSINFEndpointLoadingAccounts = (NSMutableSet *)v14;

    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerObserver:", v2);

    objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerObserver:", v2);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

+ (id)sharedController
{
  if (sharedController_onceToken_22473 != -1)
    dispatch_once(&sharedController_onceToken_22473, &__block_literal_global_22474);
  return (id)sharedController___sharedController_22475;
}

- (void)registerLeaseManager:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_leaseManagers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2114;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:prewarmSAP:bag", "account=%{public}@ error=%{public}@", buf, 0x16u);

  }
  objc_msgSend(v5, "urlForBagKey:", *MEMORY[0x24BEC86F8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://itunes.apple.com/"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A00]), "initWithURL:requestContext:", v14, *(_QWORD *)(a1 + 40));
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "fppc:prewarmSAP:buildURL", "account=%{public}@", buf, 0xCu);

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_55;
  v23[3] = &unk_24CAB82D0;
  v28 = *(_QWORD *)(a1 + 56);
  v24 = *(id *)(a1 + 32);
  v25 = v5;
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 48);
  v26 = v20;
  v27 = v21;
  v22 = v5;
  objc_msgSend(v15, "buildURLRequestWithCompletionHandler:", v23);

}

void __69__MPCFairPlayPerformanceController_accountManager_didChangeAccounts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "hashedDSID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "removeObject:", v11);

        objc_msgSend(*(id *)(a1 + 32), "_prewarmMiniSINFEndpointForAccount:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v2;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v17;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_INFO, "[FPPC] engine:didChangeAccounts: removing account=%{public}@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v17);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", 0, v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v14);
  }

}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char IsAudioAccessory;
  NSObject *miniQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        -[MPCFairPlayPerformanceController _prewarmSAPSigningForAccount:](self, "_prewarmSAPSigningForAccount:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  MPUIApplication();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "applicationState"))
  {
    IsAudioAccessory = MSVDeviceIsAudioAccessory();

    if ((IsAudioAccessory & 1) == 0)
      goto LABEL_13;
  }
  else
  {

  }
  -[MPCFairPlayPerformanceController _optimisticallyFetchLeaseForAccounts:](self, "_optimisticallyFetchLeaseForAccounts:", v6);
LABEL_13:
  miniQueue = self->_miniQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__MPCFairPlayPerformanceController_accountManager_didChangeAccounts___block_invoke;
  v15[3] = &unk_24CABA1D0;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_async(miniQueue, v15);

}

- (void)_prewarmSAPSigningForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  NSMutableSet *SAPSignPrewarmedAccounts;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  NSMutableSet *SAPSignPrewarmingAccounts;
  void *v13;
  int v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSMutableSet *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  MPCFairPlayPerformanceController *v31;
  os_signpost_id_t v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (objc_msgSend(v4, "isDelegated"))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "hashedDSID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      v7 = "[FPPC] _prewarmSAPSigningForAccount: skipping account=%{public}@ [delegated]";
LABEL_10:
      v10 = v5;
      v11 = OS_LOG_TYPE_INFO;
      goto LABEL_11;
    }
  }
  else
  {
    SAPSignPrewarmedAccounts = self->_SAPSignPrewarmedAccounts;
    objc_msgSend(v4, "hashedDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(SAPSignPrewarmedAccounts) = -[NSMutableSet containsObject:](SAPSignPrewarmedAccounts, "containsObject:", v9);

    if ((_DWORD)SAPSignPrewarmedAccounts)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "hashedDSID");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v6;
        v7 = "[FPPC] _prewarmSAPSigningForAccount: ignoring account=%{public}@ [already prewarmed]";
        v10 = v5;
        v11 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl(&dword_210BD8000, v10, v11, v7, buf, 0xCu);
LABEL_19:

      }
    }
    else
    {
      SAPSignPrewarmingAccounts = self->_SAPSignPrewarmingAccounts;
      objc_msgSend(v4, "hashedDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSMutableSet containsObject:](SAPSignPrewarmingAccounts, "containsObject:", v13);

      v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v5 = v15;
      if (!v14)
      {
        v16 = os_signpost_id_make_with_pointer(v15, v4);

        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          objc_msgSend(v4, "hashedDSID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v19;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:prewarmSAP", "account=%{public}@", buf, 0xCu);

        }
        v20 = self->_SAPSignPrewarmingAccounts;
        objc_msgSend(v4, "hashedDSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v20, "addObject:", v21);

        objc_msgSend(v4, "userIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v22);
        v5 = objc_claimAutoreleasedReturnValue();

        -[NSObject _createStoreRequestContext](v5, "_createStoreRequestContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v25 = v24;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          objc_msgSend(v4, "hashedDSID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v26;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:prewarmSAP:bag", "account=%{public}@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke;
        v28[3] = &unk_24CAB8280;
        v32 = v16;
        v29 = v4;
        v30 = v23;
        v31 = self;
        v6 = v23;
        objc_msgSend(v27, "getBagForRequestContext:withCompletionHandler:", v6, v28);

        goto LABEL_19;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "hashedDSID");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v6;
        v7 = "[FPPC] _prewarmSAPSigningForAccount: skipping account=%{public}@ [already prewarming]";
        goto LABEL_10;
      }
    }
  }

}

- (void)_optimisticallyFetchLeaseForAccounts:(id)a3
{
  _MPCLeaseManager *v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable anyObject](self->_leaseManagers, "anyObject");
  v4 = (_MPCLeaseManager *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v4)
    v4 = -[_MPCLeaseManager initWithPlaybackEngine:]([_MPCLeaseManager alloc], "initWithPlaybackEngine:", 0);
  objc_msgSend(v6, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCFairPlayPerformanceController _optimisticallyFetchLeaseWithLeaseManager:accountEnumerator:](self, "_optimisticallyFetchLeaseWithLeaseManager:accountEnumerator:", v4, v5);

}

- (void)_optimisticallyFetchLeaseWithLeaseManager:(id)a3 accountEnumerator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  MPCFairPlayPerformanceController *v28;
  id v29;
  os_signpost_id_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = (void *)v8;
    *(_QWORD *)&v9 = 138543362;
    v24 = v9;
    while (1)
    {
      v11 = objc_msgSend(v10, "usesLease", v24);
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v13 = v12;
      if ((v11 & 1) != 0)
        break;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "hashedDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v24;
        v32 = v14;
        _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: skipping [account doesn't use lease] account=%{public}@", buf, 0xCu);

      }
      objc_msgSend(v7, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
      if (!v15)
        goto LABEL_15;
    }
    v16 = os_signpost_id_generate(v12);

    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      objc_msgSend(v10, "hashedDSID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v24;
      v32 = v19;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:_optimisticallyFetchLeaseForAccount", "account=%{public}@", buf, 0xCu);

    }
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v21 = v20;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      objc_msgSend(v10, "hashedDSID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v24;
      v32 = v22;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:_optimisticallyFetchLeaseForAccount:getHasPreparedLease", "account=%{public}@", buf, 0xCu);

    }
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke;
    v25[3] = &unk_24CAB8190;
    v30 = v16;
    v26 = v10;
    v27 = v6;
    v28 = self;
    v29 = v7;
    v23 = v10;
    objc_msgSend(v27, "getHasPreparedLeaseForAccount:completion:", v23, v25);

  }
LABEL_15:

}

- (void)_prewarmMiniSINFEndpointForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSMutableSet *miniSINFEndpointLoadingAccounts;
  void *v9;
  NSMutableSet *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  MPCFairPlayPerformanceController *v28;
  id v29;
  os_signpost_id_t v30;
  _QWORD v31[4];
  NSObject *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_miniQueue);
  if (objc_msgSend(v4, "isDelegated"))
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "hashedDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [delegated]";
LABEL_10:
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_INFO, v7, buf, 0xCu);

    }
  }
  else if ((objc_msgSend(v4, "usesLease") & 1) != 0)
  {
    miniSINFEndpointLoadingAccounts = self->_miniSINFEndpointLoadingAccounts;
    objc_msgSend(v4, "hashedDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(miniSINFEndpointLoadingAccounts) = -[NSMutableSet containsObject:](miniSINFEndpointLoadingAccounts, "containsObject:", v9);

    if ((_DWORD)miniSINFEndpointLoadingAccounts)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "hashedDSID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v6;
        v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [account already loading]";
        goto LABEL_10;
      }
    }
    else
    {
      v10 = self->_miniSINFEndpointLoadingAccounts;
      objc_msgSend(v4, "hashedDSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v10, "addObject:", v11);

      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v13 = os_signpost_id_make_with_pointer(v12, v4);

      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        objc_msgSend(v4, "hashedDSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v16;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:prewarmMiniSINF", "account=%{public}@", buf, 0xCu);

      }
      v17 = objc_alloc(MEMORY[0x24BEC89F8]);
      v18 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke;
      v31[3] = &unk_24CAB8258;
      v19 = v4;
      v32 = v19;
      v20 = (void *)objc_msgSend(v17, "initWithBlock:", v31);
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v22 = v21;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        -[NSObject hashedDSID](v19, "hashedDSID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v23;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:prewarmMiniSINF:bag", "account=%{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_45;
      v26[3] = &unk_24CAB8280;
      v30 = v13;
      v27 = v19;
      v28 = self;
      v29 = v20;
      v25 = v20;
      objc_msgSend(v24, "getBagForRequestContext:withCompletionHandler:", v25, v26);

      v5 = v32;
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "hashedDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      v7 = "[FPPC] _prewarmMiniSINFEndpointForAccount: skipping account=%{public}@ [account doesn't use lease]";
      goto LABEL_10;
    }
  }

}

- (void)unregisterLeaseManager:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_leaseManagers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MPCFairPlayPerformanceController;
  -[MPCFairPlayPerformanceController dealloc](&v5, sel_dealloc);
}

- (void)scheduleMiniSINFFetch
{
  NSObject *miniQueue;
  _QWORD block[5];

  miniQueue = self->_miniQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(miniQueue, block);
}

- (void)_fetchMiniSINFsWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSMutableDictionary *miniSINFAccounts;
  uint64_t v11;
  NSObject *v12;
  NSObject *miniQueue;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  os_signpost_id_t v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  os_signpost_id_t v22;
  uint8_t buf[16];
  _QWORD v24[3];
  char v25;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_miniQueue);
  v5 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = os_signpost_id_generate(v6);

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "fppc:fetchMiniSINFs", ", buf, 2u);
  }

  miniSINFAccounts = self->_miniSINFAccounts;
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke;
  v19[3] = &unk_24CAB8208;
  v21 = v24;
  v22 = v7;
  v12 = v5;
  v20 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](miniSINFAccounts, "enumerateKeysAndObjectsUsingBlock:", v19);
  miniQueue = self->_miniQueue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_40;
  block[3] = &unk_24CAB8230;
  v17 = v24;
  v18 = v7;
  block[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_group_notify(v12, miniQueue, block);

  _Block_object_dispose(v24, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniSINFAccounts, 0);
  objc_storeStrong((id *)&self->_miniSINFEndpointLoadingAccounts, 0);
  objc_storeStrong((id *)&self->_miniQueue, 0);
  objc_storeStrong((id *)&self->_SAPSignPrewarmedAccounts, 0);
  objc_storeStrong((id *)&self->_SAPSignPrewarmingAccounts, 0);
  objc_storeStrong((id *)&self->_leaseManagers, 0);
}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2114;
    v24 = v4;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "fppc:prewarmSAP:buildURL", "account=%{public}@ error=%{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEC8988], "sharedSAPSessionWithVersion:URLBag:requestContext:", *MEMORY[0x24BEC8630], *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 64);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v13;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "fppc:prewarmSAP:signData", "account=%{public}@", buf, 0xCu);

  }
  objc_msgSend(CFSTR(" "), "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_59;
  v17[3] = &unk_24CAB82A8;
  v20 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 56);
  v18 = v15;
  v19 = v16;
  objc_msgSend(v9, "signData:withCompletionHandler:", v14, v17);

}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  int8x16_t v12;
  _QWORD block[4];
  int8x16_t v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v4;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v7, "fppc:prewarmSAP:signData", "account=%{public}@ error=%{public}@", buf, 0x16u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_60;
  block[3] = &unk_24CAB86C0;
  v12 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v12.i64[0];
  v14 = vextq_s8(v12, v12, 8uLL);
  v10 = *(_QWORD *)(a1 + 48);
  v15 = v4;
  v16 = v10;
  v11 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__MPCFairPlayPerformanceController__prewarmSAPSigningForAccount___block_invoke_60(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v9;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "fppc:prewarmSAP", "account=%{public}@", (uint8_t *)&v16, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 48);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_INFO, "[FPPC] _prewarmSAPSigningForAccount: failed account=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x16u);

    }
  }
  else if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_INFO, "[FPPC] _prewarmSAPSigningForAccount: done account=%{public}@", (uint8_t *)&v16, 0xCu);

  }
}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentity:", v4);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  objc_msgSend(v3, "setClientInfo:", v5);

}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2114;
    v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:prewarmMiniSINF:bag", "account=%{public}@ error=%{public}@", buf, 0x16u);

  }
  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(NSObject **)(v11 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_46;
  block[3] = &unk_24CAB8168;
  block[4] = v11;
  v14 = v12;
  v15 = *(void **)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v18 = v14;
  v19 = v5;
  v20 = v15;
  v16 = v5;
  dispatch_async(v13, block);

}

void __71__MPCFairPlayPerformanceController__prewarmMiniSINFEndpointForAccount___block_invoke_46(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _MPCMiniSINFEndpointInfo *v13;
  os_signpost_id_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((v2 & 1) != 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    objc_msgSend(*(id *)(a1 + 48), "urlForBagKey:", *MEMORY[0x24BEC86D8]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 48), "int64ValueForBagKey:", CFSTR("max-mini-sinf-batch-size"));
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v11;
        v30 = 2114;
        v31 = v6;
        v32 = 2048;
        v33 = v8;
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_INFO, "[FPPC] _prewarmMiniSINFEndpointForAccount: ignoring account=%{public}@ [missing endpointURL or batch size] endpointURL=%{public}@ batchSize=%lld", (uint8_t *)&v28, 0x20u);

      }
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v13 = (_MPCMiniSINFEndpointInfo *)v12;
      v14 = *(_QWORD *)(a1 + 64);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v15;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, &v13->super, OS_SIGNPOST_INTERVAL_END, v14, "fppc:prewarmMiniSINF", "account=%{public}@ [failed]", (uint8_t *)&v28, 0xCu);

      }
    }
    else
    {
      if (v7 >= 50)
        v21 = 50;
      else
        v21 = v7;
      v13 = -[_MPCMiniSINFEndpointInfo initWithEndpointURL:maximumBatchSize:requestContext:]([_MPCMiniSINFEndpointInfo alloc], "initWithEndpointURL:maximumBatchSize:requestContext:", v6, v21, *(_QWORD *)(a1 + 56));
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, v23);

      v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v25 = v24;
      v26 = *(_QWORD *)(a1 + 64);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_END, v26, "fppc:prewarmMiniSINF", "account=%{public}@", (uint8_t *)&v28, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "scheduleMiniSINFFetch");
    }

  }
  else
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v17;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_INFO, "[FPPC] _prewarmMiniSINFEndpointForAccount: ignoring account=%{public}@ [account removed while loading]", (uint8_t *)&v28, 0xCu);

    }
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v6 = v18;
    v19 = *(_QWORD *)(a1 + 64);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      objc_msgSend(*(id *)(a1 + 40), "hashedDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v20;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_END, v19, "fppc:prewarmMiniSINF", "account=%{public}@ [removed]", (uint8_t *)&v28, 0xCu);

    }
  }

}

void __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  int v23;
  int v24;
  int v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  os_signpost_id_t v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  __int128 *p_buf;
  _QWORD v58[3];
  _QWORD v59[3];
  uint8_t v60[4];
  id v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int128 buf;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v47 = a2;
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v47;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "fppc:fetchMiniSINFs:account", "accountID=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "maximumBatchSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v47;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "fppc:fetchMiniSINFs:account:enumerateAsset", "accountID=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v69 = 0x2020000000;
  v70 = 0;
  objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_18;
  v53[3] = &unk_24CAB81B8;
  v15 = v9;
  v54 = v15;
  v16 = v10;
  v55 = v16;
  v17 = v5;
  v56 = v17;
  p_buf = &buf;
  objc_msgSend(v14, "enumerateAssetsMissingSINFsForHashedPersonID:usingBlock:", v47, v53);

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v18 + 24))
    v19 = 1;
  else
    v19 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  *(_BYTE *)(v18 + 24) = v19;
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 48);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v23 = objc_msgSend(v15, "count");
    v24 = objc_msgSend(v16, "count");
    v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v60 = 138544130;
    v61 = v47;
    v62 = 1024;
    v63 = v23;
    v64 = 1024;
    v65 = v24;
    v66 = 1024;
    v67 = v25;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_END, v22, "fppc:fetchMiniSINFs:account:enumerateAsset", "accountID=%{public}@ flavors=%d assets=%d hasMoreAssets=%{BOOL}u", v60, 0x1Eu);
  }

  if (objc_msgSend(v16, "count"))
  {
    v26 = objc_alloc(MEMORY[0x24BDD16B0]);
    objc_msgSend(v17, "endpointURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithURL:", v27);

    -[NSObject setHTTPMethod:](v28, "setHTTPMethod:", CFSTR("POST"));
    v58[0] = CFSTR("guid");
    objc_msgSend(v17, "requestContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "deviceInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deviceGUID");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = &stru_24CABB5D0;
    if (v31)
      v33 = (const __CFString *)v31;
    v59[0] = v33;
    v58[1] = CFSTR("flavors");
    objc_msgSend(v15, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = CFSTR("adamIds");
    v59[1] = v34;
    v59[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v35, 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v28, "setHTTPBody:", v36);

    -[NSObject addValue:forHTTPHeaderField:](v28, "addValue:forHTTPHeaderField:", CFSTR("application/json"), *MEMORY[0x24BEC85A8]);
    v37 = objc_alloc(MEMORY[0x24BEC8A00]);
    objc_msgSend(v17, "requestContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithURLRequest:requestContext:", v28, v38);

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v41 = v40;
    v42 = *(_QWORD *)(a1 + 48);
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_DWORD *)v60 = 138543362;
      v61 = v47;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v42, "fppc:fetchMiniSINFs:account:request", "accountID=%{public}@", v60, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEC8A50], "defaultSession");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_36;
    v48[3] = &unk_24CAB81E0;
    v52 = *(_QWORD *)(a1 + 48);
    v49 = v47;
    v50 = *(id *)(a1 + 32);
    v44 = v35;
    v51 = v44;
    objc_msgSend(v43, "enqueueDataRequest:withCompletionHandler:", v39, v48);

  }
  else
  {
    v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v28 = v45;
    v46 = *(_QWORD *)(a1 + 48);
    if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_DWORD *)v60 = 138543362;
      v61 = v47;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v28, OS_SIGNPOST_INTERVAL_END, v46, "fppc:fetchMiniSINFs:account", "accountID=%{public}@", v60, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  uint64_t result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fppc:fetchMiniSINFs", "hasMoreAssets=%{BOOL}u", (uint8_t *)v7, 8u);
  }

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "scheduleMiniSINFFetch");
  return result;
}

uint64_t __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_18(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "flavor") - 1;
  if (v7 > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_24CAB82F0[v7];
  objc_msgSend(v5, "addObject:", v8);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v10);
  v11 = objc_msgSend(*(id *)(a1 + 40), "count");
  result = objc_msgSend(*(id *)(a1 + 48), "maximumBatchSize");
  if (v11 == result)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

void __66__MPCFairPlayPerformanceController__fetchMiniSINFsWithCompletion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  uint32_t v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  void *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v46 = v10;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "fppc:fetchMiniSINFs:account:request", "accountID=%{public}@", buf, 0xCu);
  }

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  if (!v6)
  {
    v16 = *(_QWORD *)(a1 + 56);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v46 = v17;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v16, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@", buf, 0xCu);
    }

    objc_msgSend(v5, "parsedBodyDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCBD8]), "initWithPayload:requestPayload:hashedPersonID:", v18, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDDCBC8], "sharedServerObjectDatabase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v20, "importAssetsFromRequest:error:", v19, &v44);
    v21 = v44;

    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v21;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_FAULT, "[FPPC] _fetchMiniSINFs: failed [import failure] error=%{public}@", buf, 0xCu);
      }

      v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v25 = v24;
      v26 = *(_QWORD *)(a1 + 56);
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v46 = v27;
        v47 = 2114;
        v48 = v21;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v25, OS_SIGNPOST_INTERVAL_END, v26, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@ error=%{public}@", buf, 0x16u);
      }

      v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v29 = v28;
      v30 = *(_QWORD *)(a1 + 56);
      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28))
        goto LABEL_32;
      v31 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v46 = v31;
      v47 = 2114;
      v48 = v21;
      v32 = "accountID=%{public}@ error=%{public}@";
      v33 = v29;
      v34 = v30;
      v35 = 22;
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v36 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v36;
        _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_INFO, "[FPPC] _fetchMiniSINFs: finished importing sinfs for %d identifiers", buf, 8u);
      }

      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v38 = v37;
      v39 = *(_QWORD *)(a1 + 56);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        v40 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v46 = v40;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v38, OS_SIGNPOST_INTERVAL_END, v39, "fppc:fetchMiniSINFs:account:import", "accountID=%{public}@", buf, 0xCu);
      }

      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v29 = v41;
      v42 = *(_QWORD *)(a1 + 56);
      if (v42 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41))
        goto LABEL_32;
      v43 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v46 = v43;
      v32 = "accountID=%{public}@";
      v33 = v29;
      v34 = v42;
      v35 = 12;
    }
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v33, OS_SIGNPOST_INTERVAL_END, v34, "fppc:fetchMiniSINFs:account", v32, buf, v35);
LABEL_32:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_33;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v6;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "[FPPC] _fetchMiniSINFs: failed [network failure] error=%{public}@", buf, 0xCu);
  }

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 56);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v14, OS_SIGNPOST_INTERVAL_END, v15, "fppc:fetchMiniSINFs:account", "error=%{public}@", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_33:

}

void __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    *(_BYTE *)(v1 + 64) = 1;
    v3 = dispatch_time(0, 500000000);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_2;
    block[3] = &unk_24CABA2D0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

_BYTE *__57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_2(uint64_t a1)
{
  _BYTE *result;
  _QWORD v2[5];

  result = *(_BYTE **)(a1 + 32);
  if (result[64])
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_3;
    v2[3] = &unk_24CABA2D0;
    v2[4] = result;
    return (_BYTE *)objc_msgSend(result, "_fetchMiniSINFsWithCompletion:", v2);
  }
  return result;
}

uint64_t __57__MPCFairPlayPerformanceController_scheduleMiniSINFFetch__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 0;
  return result;
}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "fppc:_optimisticallyFetchLeaseForAccount:getHasPreparedLease", "error=%{public}@", buf, 0xCu);
  }

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  if ((a2 & 1) != 0)
  {
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "fppc:_optimisticallyFetchLeaseForAccount", "already had lease", buf, 2u);
    }

    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: already has lease account=%{public}@", buf, 0xCu);

    }
  }
  else
  {
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "fppc:_optimisticallyFetchLeaseForAccount:prepareLease", "account=%{public}@", buf, 0xCu);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_14;
    block[3] = &unk_24CAB8168;
    v19 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v16 = *(void **)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 48);
    v20 = v15;
    v21 = v17;
    v22 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v12 = v19;
  }

}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_2;
  v6[3] = &unk_24CAB8140;
  v11 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "prepareForPlaybackWithAccount:completion:", v4, v6);

}

void __96__MPCFairPlayPerformanceController__optimisticallyFetchLeaseWithLeaseManager_accountEnumerator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v11 = 138543362;
      v12 = v3;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fppc:_optimisticallyFetchLeaseForAccount:prepareLease", "error=%{public}@", (uint8_t *)&v11, 0xCu);
    }

    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: failed to fetch account=%{public}@ error=%{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_optimisticallyFetchLeaseWithLeaseManager:accountEnumerator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fppc:_optimisticallyFetchLeaseForAccount", "fetched lease", (uint8_t *)&v11, 2u);
    }

    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "hashedDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_INFO, "[FPPC] _optimisticallyFetchLeaseForAccount: fetched lease account=%{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

@end
