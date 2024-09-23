@implementation ANAnnounceReachabilityManager

- (ANAnnounceReachabilityManager)init
{
  ANAnnounceReachabilityManager *v2;
  os_log_t v3;
  OS_os_log *log;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  uint64_t v7;
  NSMutableDictionary *homeReachability;
  uint64_t v9;
  ANRapportConnectionProvider *rapportConnection;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ANAnnounceReachabilityManager;
  v2 = -[ANAnnounceReachabilityManager init](&v13, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.announce", "ReachabilityMgr");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_create("com.apple.announce.reachability-queue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    homeReachability = v2->_homeReachability;
    v2->_homeReachability = (NSMutableDictionary *)v7;

    +[ANRapportConnection sharedConnection](ANRapportConnection, "sharedConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    rapportConnection = v2->_rapportConnection;
    v2->_rapportConnection = (ANRapportConnectionProvider *)v9;

    v2->_started = 0;
    +[ANHomeManager shared](ANHomeManager, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerDelegate:queue:", v2, v2->_serialQueue);

    -[ANAnnounceReachabilityManager _initializeReachabilityStatus](v2, "_initializeReachabilityStatus");
  }
  return v2;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E938F8E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id location;
  _QWORD block[4];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E938F938;
    v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "rapportConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_3;
    v3[3] = &unk_1E938F988;
    v3[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v5, &location);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "activateLinkWithOptions:completion:", 7, v3);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E938F960;
  objc_copyWeak(&v11, a1 + 6);
  v10 = v3;
  v6 = v3;
  dispatch_async(v4, block);

  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E938F938;
  v8 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v11);
}

void __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_rapportActivationHandler:", *(_QWORD *)(a1 + 32));

}

uint64_t __60__ANAnnounceReachabilityManager_startWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ANAnnounceReachabilityManager_stop__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __37__ANAnnounceReachabilityManager_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transaction:setActive:", *MEMORY[0x1E0CF7DC0], 0);

  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "rapportConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateLinkWithOptions:", 2);

  }
}

- (unint64_t)reachabilityForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ANAnnounceReachabilityManager_reachabilityForHome___block_invoke;
  block[3] = &unk_1E938F640;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__ANAnnounceReachabilityManager_reachabilityForHome___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_reevaluateHomeKitReachabilityForHome:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_reachabilityForHome:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)reachabilityForRoom:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__ANAnnounceReachabilityManager_reachabilityForRoom_inHome___block_invoke;
  v13[3] = &unk_1E938F9D8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);

  v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __60__ANAnnounceReachabilityManager_reachabilityForRoom_inHome___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_reevaluateHomeKitReachabilityForHome:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_reachabilityForRoom:inHome:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)monitoredRoomsForHome:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = (id)objc_opt_new();
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ANAnnounceReachabilityManager_monitoredRoomsForHome___block_invoke;
  block[3] = &unk_1E938F640;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  dispatch_sync(v5, block);

  objc_msgSend((id)v13[5], "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__ANAnnounceReachabilityManager_monitoredRoomsForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "homeReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 40), "accessoryWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "room");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (NSArray)monitoredHomes
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = (id)objc_opt_new();
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ANAnnounceReachabilityManager_monitoredHomes__block_invoke;
  v6[3] = &unk_1E938F618;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)v8[5], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __47__ANAnnounceReachabilityManager_monitoredHomes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "homeReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        +[ANHomeManager shared](ANHomeManager, "shared", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "homeForID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (unint64_t)_filteredReachabilityLevelFromReachabilityLevel:(unint64_t)a3 forHome:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    v8 = objc_msgSend(v5, "hmu_isRemoteAccessAllowedForCurrentUser");

    if (!v8)
      a3 &= ~2uLL;
  }

  return a3;
}

- (void)_initializeReachabilityStatus
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transaction:setActive:", *MEMORY[0x1E0CF7DC0], 1);

  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ANAnnounceReachabilityManager__initializeReachabilityStatus__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __62__ANAnnounceReachabilityManager__initializeReachabilityStatus__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  __int128 v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "Initializing Reachability Status", buf, 2u);
  }

  +[ANHomeManager shared](ANHomeManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHomes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v53;
    *(_QWORD *)&v5 = 138412546;
    v37 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(obj);
        v41 = v6;
        v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v6);
        v8 = objc_opt_new();
        objc_msgSend(*(id *)(a1 + 32), "homeReachability");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v8;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v11 = (void *)MEMORY[0x1E0CBA1A8];
        objc_msgSend(v7, "accessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v49 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v18, "settings", v37);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "isControllable"))
                v20 = 2;
              else
                v20 = 0;

              v21 = objc_msgSend(*(id *)(a1 + 32), "_filteredReachabilityLevelFromReachabilityLevel:forHome:", v20, v7);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uniqueIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v22, v23);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
          }
          while (v15);
        }

        objc_msgSend(*(id *)(a1 + 32), "log");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", objc_msgSend(*(id *)(a1 + 32), "_reachabilityForHome:", v7));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v37;
          v57 = v25;
          v58 = 2112;
          v59 = v26;
          _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_DEFAULT, "Initial Reachability [Home = %@]: %@", buf, 0x16u);

        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v7, "rooms");
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v42);
              v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(*(id *)(a1 + 32), "log", v37);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v7, "name");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "name");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", objc_msgSend(*(id *)(a1 + 32), "_reachabilityForRoom:inHome:", v31, v7));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v57 = v33;
                v58 = 2112;
                v59 = v34;
                v60 = 2112;
                v61 = v35;
                _os_log_impl(&dword_1D23A0000, v32, OS_LOG_TYPE_DEFAULT, "Initial Reachability [Home = %@, Room = %@]: %@", buf, 0x20u);

              }
            }
            v28 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          }
          while (v28);
        }

        v6 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v40);
  }

  objc_msgSend(*(id *)(a1 + 32), "log");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D23A0000, v36, OS_LOG_TYPE_DEFAULT, "Finished Setting Reachability Status", buf, 2u);
  }

}

- (void)_reevaluateHomeKitReachabilityForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)MEMORY[0x1E0CBA1A8];
  v22 = v4;
  objc_msgSend(v4, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "announceAccessoriesWithAnnounceEnabledFromAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[ANAnnounceReachabilityManager log](self, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "home");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "settings");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isControllable");
          *(_DWORD *)buf = 138412802;
          v29 = v16;
          v30 = 2112;
          v31 = v17;
          v32 = 1024;
          v33 = v19;
          _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "Re-evaluating Reachability for Accessory [Home = %@]: %@, Controllable = %d", buf, 0x1Cu);

        }
        objc_msgSend(v13, "settings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isControllable") ^ 1;

        -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](self, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", 2, v13, v21);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v10);
  }

}

- (void)_rapportActivationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[ANAnnounceReachabilityManager setStarted:](self, "setStarted:", 0);
    -[ANAnnounceReachabilityManager log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ANAnnounceReachabilityManager _rapportActivationHandler:].cold.1((uint64_t)v4, v6);

  }
  else
  {
    -[ANAnnounceReachabilityManager rapportConnection](self, "rapportConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDeviceDelegate:queue:", self, v8);

  }
}

- (unint64_t)_reachabilityForHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v12 |= objc_msgSend(v15, "unsignedIntegerValue");

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)_reachabilityForRoom:(id)a3 inHome:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v26;
  unint64_t v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = a4;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v10;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v27 = 0;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v29, "accessoryWithUniqueIdentifier:", v16, v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "room");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "uniqueIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqual:", v21);

            if (v22)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", v16);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v27 |= objc_msgSend(v23, "unsignedIntegerValue");

            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }
    else
    {
      v27 = 0;
    }

    v10 = v26;
    v24 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_updateReachabilityLevelWithReachabilityLevel:(unint64_t)a3 forAccessory:(id)a4 operation:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[ANAnnounceReachabilityManager serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "room");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[ANAnnounceReachabilityManager _reachabilityForRoom:inHome:](self, "_reachabilityForRoom:inHome:", v17, v16);
      v38 = -[ANAnnounceReachabilityManager _reachabilityForHome:](self, "_reachabilityForHome:", v16);
      v19 = objc_msgSend(v15, "unsignedIntegerValue");
      v20 = v19;
      v21 = v19 | a3;
      if (a5)
        v21 = v19;
      if (a5 == 1)
        v22 = v19 & ~a3;
      else
        v22 = v21;
      v23 = -[ANAnnounceReachabilityManager _filteredReachabilityLevelFromReachabilityLevel:forHome:](self, "_filteredReachabilityLevelFromReachabilityLevel:forHome:", v22, v16);
      if (v23 != v20)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, v25);

      }
      v26 = -[ANAnnounceReachabilityManager _reachabilityForRoom:inHome:](self, "_reachabilityForRoom:inHome:", v17, v16);
      v27 = -[ANAnnounceReachabilityManager _reachabilityForHome:](self, "_reachabilityForHome:", v16);
      if (v26 != v18)
      {
        objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANAnnounceReachabilityManager log](self, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "name");
          v35 = v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v36 = v28;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v41 = v30;
          v42 = 2112;
          v43 = v31;
          v44 = 2112;
          v45 = v36;
          v46 = 2112;
          v47 = v37;
          _os_log_impl(&dword_1D23A0000, v29, OS_LOG_TYPE_DEFAULT, "Reachability Changed [Home = %@, Room = %@]: %@ -> %@", buf, 0x2Au);

          v28 = v36;
          v27 = v35;
        }

        -[ANAnnounceReachabilityManager _notifyClientsReachabilityChangeForRoom:inHome:toLevel:](self, "_notifyClientsReachabilityChangeForRoom:inHome:toLevel:", v17, v16, v26);
      }
      if (v27 != v38)
      {
        objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CF7DF0], "stringForAnnounceReachabilityLevel:", v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANAnnounceReachabilityManager log](self, "log");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = v34;
          v42 = 2112;
          v43 = v39;
          v44 = 2112;
          v45 = v32;
          _os_log_impl(&dword_1D23A0000, v33, OS_LOG_TYPE_DEFAULT, "Reachability Changed [Home = %@]: %@ -> %@", buf, 0x20u);

        }
        -[ANAnnounceReachabilityManager _notifyClientsReachabilityChangeForHome:toLevel:](self, "_notifyClientsReachabilityChangeForHome:toLevel:", v16, v27);

      }
    }

  }
}

- (void)_notifyClientsReachabilityChangeForRoom:(id)a3 inHome:(id)a4 toLevel:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  -[ANAnnounceReachabilityManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ANAnnounceReachabilityManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reachabilityLevel:didChangeForRoom:inHome:", a5, v11, v8);

  }
}

- (void)_notifyClientsReachabilityChangeForHome:(id)a3 toLevel:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ANAnnounceReachabilityManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ANAnnounceReachabilityManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reachabilityLevel:didChangeForHome:", a4, v8);

  }
}

- (ANAnnounceReachabilityManagerDelegate)delegate
{
  return (ANAnnounceReachabilityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ANRapportConnectionProvider)rapportConnection
{
  return self->_rapportConnection;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableDictionary)homeReachability
{
  return self->_homeReachability;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_homeReachability, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_rapportConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didAddHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

- (void)didRemoveHome:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "hmu_isHomePod") && objc_msgSend(v6, "an_isAnnounceAccessory"))
  {
    -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isControllable"))
        v11 = 2;
      else
        v11 = 0;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v13);

      -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](self, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", v11, v6, 0);
    }

  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "hmu_isHomePod"))
  {
    -[ANAnnounceReachabilityManager homeReachability](self, "homeReachability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](self, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", 3, v6, 1);
      objc_msgSend(v6, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    }
  }

}

- (void)accessoryDidUpdateControllable:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "hmu_isHomePod"))
  {
    objc_msgSend(v6, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isControllable") ^ 1;

    -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](self, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", 2, v6, v5);
  }

}

- (void)connection:(id)a3 didFindDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  ANAnnounceReachabilityManager *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "isAccessory"))
  {
    -[ANAnnounceReachabilityManager log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v5;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Rapport Did Find Accessory Device: %@", buf, 0xCu);
    }

    +[ANHomeManager shared](ANHomeManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allHomes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v10 = *(_QWORD *)v31;
      v22 = *(_QWORD *)v31;
      v23 = self;
      v25 = v9;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v12, "accessories", v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v18, "uniqueIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "homeKitIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v21)
                {
                  -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](v23, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", 1, v18, 0);

                  v9 = v25;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v15)
                continue;
              break;
            }
          }

          v9 = v25;
          v10 = v22;
        }
        v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }
LABEL_21:

  }
}

- (void)connection:(id)a3 didLoseDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  ANAnnounceReachabilityManager *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "isAccessory"))
  {
    -[ANAnnounceReachabilityManager log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v5;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Rapport Did Lose Accessory Device: %@", buf, 0xCu);
    }

    +[ANHomeManager shared](ANHomeManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allHomes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v10 = *(_QWORD *)v31;
      v22 = *(_QWORD *)v31;
      v23 = self;
      v25 = v9;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v12, "accessories", v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v18, "uniqueIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "homeKitIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v21)
                {
                  -[ANAnnounceReachabilityManager _updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:](v23, "_updateReachabilityLevelWithReachabilityLevel:forAccessory:operation:", 1, v18, 1);

                  v9 = v25;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v15)
                continue;
              break;
            }
          }

          v9 = v25;
          v10 = v22;
        }
        v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }
LABEL_21:

  }
}

- (void)_rapportActivationHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D23A0000, a2, OS_LOG_TYPE_ERROR, "Rapport activation failed %@", (uint8_t *)&v2, 0xCu);
}

@end
