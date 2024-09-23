@implementation DSAppSharing

- (DSAppSharing)initWithTCCStore:(id)a3
{
  DSTCCStore *v4;
  uint64_t v5;
  os_log_t v6;
  void *v7;
  DSTCCStore *tccStore;
  DSTCCStore *v9;
  HKHealthStore *v10;
  HKHealthStore *healthKitStore;
  HKAuthorizationStore *v12;
  HKAuthorizationStore *authorizationStore;
  dispatch_queue_t v14;

  v4 = (DSTCCStore *)a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = os_log_create("com.apple.DigitalSeparation", "DSAppSharing");
    v7 = (void *)DSLog;
    DSLog = (uint64_t)v6;

  }
  tccStore = self->_tccStore;
  self->_tccStore = v4;
  v9 = v4;

  v10 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
  healthKitStore = self->_healthKitStore;
  self->_healthKitStore = v10;

  v12 = (HKAuthorizationStore *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3958]), "initWithHealthStore:", self->_healthKitStore);
  authorizationStore = self->_authorizationStore;
  self->_authorizationStore = v12;

  v14 = dispatch_queue_create("AppPermissionsQueue", 0);
  -[DSAppSharing setWorkQueue:](self, "setWorkQueue:", v14);

  return self;
}

- (void)collectPermissionsForApps:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[DSAppSharing workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke;
  block[3] = &unk_24F0816D0;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)objc_msgSend(WeakRetained, "newDictionaryWithApps:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "addLocationPermissions:", v4);
  objc_initWeak(&location, WeakRetained);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_2;
  v7[3] = &unk_24F0816A8;
  v5 = v3;
  v8 = v5;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v9 = v6;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "addTCCPermissionsToAppMap:handler:", v6, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(a1[4], "addObjectsFromArray:", v3);
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_initWeak(&location, WeakRetained);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_3;
  v6[3] = &unk_24F0816A8;
  v5 = a1[5];
  v7 = a1[4];
  objc_copyWeak(&v11, &location);
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  objc_msgSend(WeakRetained, "addHealthPermissionsToAppMap:handler:", v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(a1[4], "addObjectsFromArray:", v3);
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_initWeak(&location, WeakRetained);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_4;
  v6[3] = &unk_24F081680;
  v5 = a1[5];
  v7 = a1[4];
  objc_copyWeak(&v11, &location);
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  objc_msgSend(WeakRetained, "addLocalNetworkPermissionsToAppMap:handler:", v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removeAppsWithNoPermissions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_5;
  block[3] = &unk_24F0815B8;
  v7 = *(NSObject **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __56__DSAppSharing_collectPermissionsForApps_queue_handler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)removeAppsWithNoPermissions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!+[DSApp appHasNoPermissions:](DSApp, "appHasNoPermissions:", v10, (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)addApp:(id)a3 toMap:(id)a4 withLocationAuthorization:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a3;
  -[DSAppSharing workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v12, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "setLocationAuthorization:", a5);
    objc_msgSend(v10, "appID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v10, v11);

  }
}

- (void)addApp:(id)a3 toMap:(id)a4 withService:(id)a5
{
  __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v8 = (__CFString *)a5;
  v9 = a3;
  -[DSAppSharing workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(v14, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (+[DSUtilities isContactsTCC:](DSUtilities, "isContactsTCC:", v8))
    {

      v8 = CFSTR("DSContacts");
    }
    objc_msgSend(v11, "permissionsGranted");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v8);

    objc_msgSend(v11, "appID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v11, v13);

  }
}

- (id)newDictionaryWithApps:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DSApp *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSAppSharing workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = objc_alloc_init(DSApp);
        -[DSApp setAppID:](v13, "setAppID:", v12, (_QWORD)v20);
        -[DSApp appID](v13, "appID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        displayNameForApp(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DSApp setDisplayName:](v13, "setDisplayName:", v15);

        -[DSApp displayName](v13, "displayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          -[DSApp setPermissionsGranted:](v13, "setPermissionsGranted:", v17);

          -[DSApp appID](v13, "appID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setValue:forKey:", v13, v18);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)collectAppsWithAccessToService:(id)a3 appMap:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  DSTCCStore *tccStore;
  void *v13;
  _QWORD v14[4];
  id v15;
  DSAppSharing *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DSAppSharing workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (+[DSApp skipTCCCheck:](DSApp, "skipTCCCheck:", v8))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    tccStore = self->_tccStore;
    -[DSAppSharing workQueue](self, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__DSAppSharing_collectAppsWithAccessToService_appMap_completionHandler___block_invoke;
    v14[3] = &unk_24F0816F8;
    v15 = v9;
    v16 = self;
    v17 = v8;
    v18 = v10;
    -[DSTCCStore appsWithPermissionGrantedForService:queue:completionHandler:](tccStore, "appsWithPermissionGrantedForService:queue:completionHandler:", v17, v13, v14);

  }
}

void __72__DSAppSharing_collectAppsWithAccessToService_appMap_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", v12))
          objc_msgSend(*(id *)(a1 + 40), "addApp:toMap:withService:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)addTCCPermissionsToAppMap:(id)a3 handler:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v22 = a4;
  -[DSAppSharing workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = dispatch_group_create();
  +[DSUtilities tccServices](DSUtilities, "tccServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUtilities contactsServices](DSUtilities, "contactsServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17);
        dispatch_group_enter(v7);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke;
        v27[3] = &unk_24F081720;
        v28 = v12;
        v29 = v7;
        -[DSAppSharing collectAppsWithAccessToService:appMap:completionHandler:](self, "collectAppsWithAccessToService:appMap:completionHandler:", v18, v23, v27);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  -[DSAppSharing workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke_2;
  block[3] = &unk_24F081590;
  v25 = v12;
  v26 = v22;
  v20 = v12;
  v21 = v22;
  dispatch_group_notify(v7, v19, block);

}

void __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__DSAppSharing_addTCCPermissionsToAppMap_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addLocationPermissions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[DSAppSharing workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DSTCCStore appsWithLocationService](self->_tccStore, "appsWithLocationService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__DSAppSharing_addLocationPermissions___block_invoke;
  v8[3] = &unk_24F081748;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __39__DSAppSharing_addLocationPermissions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isEntityClassApplication:", v5))
    objc_msgSend(*(id *)(a1 + 32), "addApp:toMap:withLocationAuthorization:", v6, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "locationAuthorizationForApp:", v5));

}

- (void)addHealthPermissionsToAppMap:(id)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  DSTCCStore *tccStore;
  HKAuthorizationStore *authorizationStore;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id obj;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  DSAppSharing *v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  -[DSAppSharing workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = dispatch_group_create();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v6;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
        dispatch_group_enter(v8);
        tccStore = self->_tccStore;
        authorizationStore = self->_authorizationStore;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke;
        v26[3] = &unk_24F081798;
        v27 = v8;
        v28 = self;
        v29 = v15;
        v30 = v10;
        v31 = v9;
        -[DSTCCStore healthAuthorizationForApp:andAuthorizationStore:withCompletionHandler:](tccStore, "healthAuthorizationForApp:andAuthorizationStore:withCompletionHandler:", v15, authorizationStore, v26);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  -[DSAppSharing workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_3;
  block[3] = &unk_24F081590;
  v24 = v9;
  v25 = v21;
  v19 = v9;
  v20 = v21;
  dispatch_group_notify(v8, v18, block);

}

void __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  __int128 v9;
  id v10;

  v5 = a3;
  if (a2)
  {
    v6 = *(NSObject **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_2;
    block[3] = &unk_24F081770;
    v9 = *(_OWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 56);
    dispatch_group_notify(v6, v7, block);

  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addApp:toMap:withService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("DSHealth"));
}

uint64_t __53__DSAppSharing_addHealthPermissionsToAppMap_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addLocalNetworkPermissionsToAppMap:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  DSTCCStore *tccStore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[DSAppSharing workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  tccStore = self->_tccStore;
  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSAppSharing workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__DSAppSharing_addLocalNetworkPermissionsToAppMap_handler___block_invoke;
  v16[3] = &unk_24F0817C0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  -[DSTCCStore allAppsWithLocalNetworkAccess:queue:handler:](tccStore, "allAppsWithLocalNetworkAccess:queue:handler:", v12, v13, v16);

}

void __59__DSAppSharing_addLocalNetworkPermissionsToAppMap_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "addApp:toMap:withService:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), *(_QWORD *)(a1 + 40), CFSTR("DSLocalNetwork"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)deleteApp:(id)a3 forTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v4 = a4;
  v6 = a3;
  if (+[DSRestrictionStore isAppRemovalRestricted](DSRestrictionStore, "isAppRemovalRestricted"))
  {
    v7 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_227D24000, v7, OS_LOG_TYPE_INFO, "Cannot delete app due to device restrictions", v11, 2u);
    }
    displayNameForApp(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:appName:](DSError, "errorWithCode:appName:", 8, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DSTCCStore deleteApp:forTest:](self->_tccStore, "deleteApp:forTest:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)resetPermission:(id)a3 forApps:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v20 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = dispatch_group_create();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
        dispatch_group_enter(v11);
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __48__DSAppSharing_resetPermission_forApps_handler___block_invoke;
        v25[3] = &unk_24F0817E8;
        v26 = v10;
        v27 = v11;
        -[DSAppSharing resetPermission:forApp:handler:](self, "resetPermission:forApp:handler:", v8, v16, v25);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  -[DSAppSharing workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__DSAppSharing_resetPermission_forApps_handler___block_invoke_2;
  block[3] = &unk_24F081590;
  v23 = v10;
  v24 = v20;
  v18 = v10;
  v19 = v20;
  dispatch_group_notify(v11, v17, block);

}

void __48__DSAppSharing_resetPermission_forApps_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __48__DSAppSharing_resetPermission_forApps_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)resetPermissions:(id)a3 forApps:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DSAppSharing workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke;
  block[3] = &unk_24F0818B0;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke(uint64_t a1)
{
  id v2;
  dispatch_group_t v3;
  void *v4;
  size_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  dispatch_group_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id location;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = dispatch_group_create();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_2;
  block[3] = &unk_24F081888;
  v19 = v3;
  v20 = v4;
  v7 = v4;
  v8 = v3;
  objc_copyWeak(&v24, &location);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = v10;
  v11 = v2;
  v23 = v11;
  dispatch_apply(v5, 0, block);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_7;
  v15[3] = &unk_24F081590;
  v12 = *(NSObject **)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v16 = v11;
  v17 = v13;
  v14 = v11;
  dispatch_group_notify(v8, v12, v15);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_3;
  v9[3] = &unk_24F081860;
  v7 = v4;
  v10 = v7;
  objc_copyWeak(&v14, (id *)(a1 + 72));
  v8 = *(void **)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = v8;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "resetPermission:forApps:handler:", v7, v6, v9);

  objc_destroyWeak(&v14);
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("DSLocalNetwork")))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(WeakRetained, "tccStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_4;
    v15[3] = &unk_24F081838;
    v7 = v3;
    v8 = a1[5];
    v9 = a1[6];
    v16 = v7;
    v17 = v8;
    v18 = v9;
    v19 = a1[7];
    objc_msgSend(v5, "saveConfiguration:handler:", v6, v15);

LABEL_5:
    dispatch_group_leave((dispatch_group_t)a1[7]);
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "count"))
    goto LABEL_5;
  objc_msgSend(a1[5], "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_6;
  block[3] = &unk_24F081770;
  v12 = a1[6];
  v13 = v3;
  v14 = a1[7];
  dispatch_async(v10, block);

LABEL_6:
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_4(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "count") || objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[5], "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_5;
    v5[3] = &unk_24F081810;
    v6 = a1[6];
    v7 = v3;
    v8 = a1[4];
    v9 = a1[7];
    dispatch_async(v4, v5);

  }
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __55__DSAppSharing_resetPermissions_forApps_queue_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)resetPermission:(id)a3 forApp:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  DSTCCStore *tccStore;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (+[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", v8)
    && -[DSTCCStore isServiceGranted:forApp:](self->_tccStore, "isServiceGranted:forApp:", v8, v9))
  {
    v11 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_227D24000, v11, OS_LOG_TYPE_INFO, "Cannot reset permission %@ for app %@ due to screen time restrictions", (uint8_t *)&v17, 0x16u);
    }
    v12 = (void *)MEMORY[0x24BDBCE30];
    +[DSError errorWithCode:serviceName:](DSError, "errorWithCode:serviceName:", 7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);

  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DSLocationAlways")) & 1) != 0
         || objc_msgSend(v8, "isEqualToString:", CFSTR("DSLocationWhenInUse")))
  {
    -[DSTCCStore resetLocationPermissionForApp:](self->_tccStore, "resetLocationPermissionForApp:", v9);
    v10[2](v10, 0);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("DSHealth")))
  {
    -[DSAppSharing resetHealthPermissionsForApp:withCompletionHandler:](self, "resetHealthPermissionsForApp:withCompletionHandler:", v9, v10);
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("DSLocalNetwork")))
    {
      tccStore = self->_tccStore;
      -[DSAppSharing workQueue](self, "workQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSTCCStore resetLocalNetworkPermissionForApp:queue:handler:](tccStore, "resetLocalNetworkPermissionForApp:queue:handler:", v9, v16, v10);
    }
    else
    {
      -[DSTCCStore resetTCCPermission:forApp:](self->_tccStore, "resetTCCPermission:forApp:", v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v16);
    }

  }
}

- (void)resetHealthPermissionsForApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke;
  v14 = &unk_24F0818D8;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x22E2A849C](&v11);
  -[DSTCCStore resetHealthPermissionsForApp:withAuthorizationStore:andCompletionHandler:](self->_tccStore, "resetHealthPermissionsForApp:withAuthorizationStore:andCompletionHandler:", v9, self->_authorizationStore, v10, v11, v12, v13, v14);

}

void __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 4, v6, CFSTR("DSHealth"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v9 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR))
      __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke_cold_1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetBackgroundAppRefresh:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DSAppSharing workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke;
  block[3] = &unk_24F081928;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

}

void __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)get_DASSchedulerClass_softClass;
  v14 = get_DASSchedulerClass_softClass;
  v3 = MEMORY[0x24BDAC760];
  if (!get_DASSchedulerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __get_DASSchedulerClass_block_invoke;
    v10[3] = &unk_24F081978;
    v10[4] = &v11;
    __get_DASSchedulerClass_block_invoke((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v4, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableAppRefreshForApps:", v6);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke_2;
  v8[3] = &unk_24F081900;
  v7 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v7, v8);

}

uint64_t __56__DSAppSharing_resetBackgroundAppRefresh_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetShortcutsAutomationTimer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[DSAppSharing workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke;
  v11[3] = &unk_24F081658;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v3 = objc_msgSend(v2, "resetAutomationConfirmationStatusWithError:", &v18);
  v4 = v18;
  if ((v3 & 1) == 0)
  {
    v5 = DSLog;
    if (os_log_type_enabled((os_log_t)DSLog, OS_LOG_TYPE_ERROR))
      __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_255;
  block[3] = &unk_24F081590;
  v12 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v16 = v4;
  v17 = v13;
  v14 = v4;
  dispatch_async(v12, block);

}

uint64_t __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)approvedBundleIdForKappa:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[DSAppSharing workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke;
  block[3] = &unk_24F0816D0;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke(id *a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = (void *)WeakRetained[1];
  v4 = *MEMORY[0x24BEB3868];
  objc_msgSend(a1[4], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_2;
  v6[3] = &unk_24F081950;
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(v3, "appsWithPermissionGrantedForService:queue:completionHandler:", v4, v5, v6);

}

void __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  id v6;
  __CFString *v7;
  _QWORD v8[4];
  __CFString *v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24F082380;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_3;
  v8[3] = &unk_24F081590;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __49__DSAppSharing_approvedBundleIdForKappa_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (DSTCCStore)tccStore
{
  return self->_tccStore;
}

- (void)setTccStore:(id)a3
{
  objc_storeStrong((id *)&self->_tccStore, a3);
}

- (HKHealthStore)healthKitStore
{
  return self->_healthKitStore;
}

- (void)setHealthKitStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitStore, a3);
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationStore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthKitStore, 0);
  objc_storeStrong((id *)&self->_tccStore, 0);
}

void __67__DSAppSharing_resetHealthPermissionsForApp_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227D24000, a2, a3, "Error resetting Health authorization %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__DSAppSharing_resetShortcutsAutomationTimer_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_227D24000, a2, a3, "Failed to reset automation timer with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
