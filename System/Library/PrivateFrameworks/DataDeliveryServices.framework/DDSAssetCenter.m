@implementation DDSAssetCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedAssetCenter;
}

- (void)registerDelegate:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DDSAssetCenter registerDelegate:].cold.1();

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet addObject:](self->_delegates, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  DDSAssetQuery *v10;
  void *v11;
  void *v12;
  DDSAssetQuery *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  if (v9)
  {
    v10 = [DDSAssetQuery alloc];
    objc_msgSend(v6, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    v13 = -[DDSAssetQuery initWithAssetType:filter:](v10, "initWithAssetType:filter:", CFSTR("com.apple.MobileAsset.LinguisticDataAuto"), v12);

    -[DDSAssetCenter autoAssetManager](self, "autoAssetManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetsForQuery:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDSAssetCenter provider](self, "provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentItemsFromAssets:matchingFilter:", v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v17);

  }
  -[DDSAssetCenter provider](self, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allContentItemsMatchingQuery:error:", v6, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v19);

  return v7;
}

- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[DDSAssetCenter provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItemsFromAssets:matchingFilter:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetsForQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  DDSAssetQuery *v10;
  void *v11;
  void *v12;
  DDSAssetQuery *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  if (v9)
  {
    v10 = [DDSAssetQuery alloc];
    objc_msgSend(v6, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    v13 = -[DDSAssetQuery initWithAssetType:filter:](v10, "initWithAssetType:filter:", CFSTR("com.apple.MobileAsset.LinguisticDataAuto"), v12);

    -[DDSAssetQuery setCachedOnly:](v13, "setCachedOnly:", objc_msgSend(v6, "cachedOnly"));
    -[DDSAssetCenter autoAssetManager](self, "autoAssetManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetsForQuery:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v15);

  }
  -[DDSAssetCenter provider](self, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetsForQuery:errorPtr:", v6, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v17);

  return v7;
}

- (DDSAssetProviding)provider
{
  return self->_provider;
}

- (DDSMAAutoAssetManager)autoAssetManager
{
  return self->_autoAssetManager;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[DDSAssetCenter provider](self, "provider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompatabilityVersion:forAssetType:", a3, v6);

}

- (DDSAssetCenter)initWithQueue:(id)a3 provider:(id)a4 trialManager:(id)a5 autoAssetManager:(id)a6 createXPCInterface:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  DDSAssetCenter *v17;
  DDSAssetCenter *v18;
  NSMutableSet *v19;
  NSMutableSet *delegates;
  DDSAssetObserver *v21;
  DDSAssetObserving *assetObserver;
  uint64_t v23;
  NSMutableDictionary *managerInterfaceByAssetType;
  uint64_t v25;
  id createXPCInterface;
  id v28;
  objc_super v29;

  v28 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)DDSAssetCenter;
  v17 = -[DDSAssetCenter init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_provider, a4);
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_trialManager, a5);
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    delegates = v18->_delegates;
    v18->_delegates = v19;

    v21 = objc_alloc_init(DDSAssetObserver);
    assetObserver = v18->_assetObserver;
    v18->_assetObserver = (DDSAssetObserving *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    managerInterfaceByAssetType = v18->_managerInterfaceByAssetType;
    v18->_managerInterfaceByAssetType = (NSMutableDictionary *)v23;

    v18->_lock._os_unfair_lock_opaque = 0;
    v25 = MEMORY[0x1DF0A321C](v16);
    createXPCInterface = v18->_createXPCInterface;
    v18->_createXPCInterface = (id)v25;

    objc_storeStrong((id *)&v18->_autoAssetManager, a6);
  }

  return v18;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DDSAssetCenter assetObserver](self, "assetObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[DDSAssetCenter trialManager](self, "trialManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[DDSAssetCenter assetObserver](self, "assetObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observeAssetType:", CFSTR("com.apple.MobileAsset.LinguisticData"));

  -[DDSAssetCenter assetObserver](self, "assetObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "observeAssetType:", CFSTR("com.apple.MobileAsset.LinguisticDataAuto"));

  -[DDSAssetCenter setXPCServiceName:forAssetType:](self, "setXPCServiceName:forAssetType:", CFSTR("com.apple.DataDeliveryServices.AssetService"), CFSTR("com.apple.MobileAsset.LinguisticData"));
  -[DDSAssetCenter setXPCServiceName:forAssetType:](self, "setXPCServiceName:forAssetType:", CFSTR("com.apple.DataDeliveryServices.AssetService"), CFSTR("com.apple.MobileAsset.MecabraDictionaryRapidUpdates"));
}

- (DDSAssetObserving)assetObserver
{
  return self->_assetObserver;
}

void __32__DDSAssetCenter_sharedInstance__block_invoke()
{
  dispatch_queue_t v0;
  DDSMobileAssetv2Provider *v1;
  DDSTrialManager *v2;
  DDSMAAutoAssetManager *v3;
  DDSAssetCenter *v4;
  void *v5;
  NSObject *attr;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.DataDeliveryServices.ddsassetcenter.queue"), "cStringUsingEncoding:", 4), attr);
  v1 = objc_alloc_init(DDSMobileAssetv2Provider);
  v2 = -[DDSTrialManager initWithWorkQueue:]([DDSTrialManager alloc], "initWithWorkQueue:", v0);
  v3 = objc_alloc_init(DDSMAAutoAssetManager);
  v4 = -[DDSAssetCenter initWithQueue:provider:trialManager:autoAssetManager:createXPCInterface:]([DDSAssetCenter alloc], "initWithQueue:provider:trialManager:autoAssetManager:createXPCInterface:", v0, v1, v2, v3, &__block_literal_global_188);
  v5 = (void *)sharedInstance_sharedAssetCenter;
  sharedInstance_sharedAssetCenter = (uint64_t)v4;

  objc_msgSend((id)sharedInstance_sharedAssetCenter, "start");
}

- (void)setXPCServiceName:(id)a3 forAssetType:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  os_unfair_lock_lock(&self->_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
      -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "xpcServiceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v6);

      if ((v15 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  -[DDSAssetCenter createXPCInterface](self, "createXPCInterface");
  v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v18)[2](v18, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v20);

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableDictionary)managerInterfaceByAssetType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

DDSInterface *__32__DDSAssetCenter_sharedInstance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  DDSInterface *v3;

  v2 = a2;
  v3 = -[DDSInterface initWithXPCServiceName:]([DDSInterface alloc], "initWithXPCServiceName:", v2);

  return v3;
}

- (DDSTrialManager)trialManager
{
  return self->_trialManager;
}

- (id)createXPCInterface
{
  return objc_getProperty(self, a2, 72, 1);
}

- (DDSAssetCenter)init
{

  return 0;
}

- (id)managerInterfaceForAssetType:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSSet)managerInterfaces
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[DDSAssetCenter managerInterfaceByAssetType](self, "managerInterfaceByAssetType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  return (NSSet *)v3;
}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DDSAssetCenter unregisterDelegate:].cold.1();

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setAssetTypesForDelegates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[DDSAssetCenter assetObserver](self, "assetObserver");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "observeAssetType:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)addAssertionForAssetsWithQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "assetType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetCenter managerInterfaceForAssetType:](self, "managerInterfaceForAssetType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "addAssertionForQuery:policy:assertionID:clientID:", v10, v11, v12, v13);
  }
  else
  {
    DefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DDSAssetCenter addAssertionForAssetsWithQuery:policy:assertionID:clientID:].cold.1(v10, v16);

  }
}

- (void)removeAssertionWithIdentifier:(id)a3
{
  -[DDSAssetCenter removeAssertionWithIdentifier:assetType:](self, "removeAssertionWithIdentifier:assetType:", a3, CFSTR("com.apple.MobileAsset.LinguisticData"));
}

- (id)assertionIDsForClientID:(id)a3
{
  return -[DDSAssetCenter assertionIDsForClientID:assetType:](self, "assertionIDsForClientID:assetType:", a3, CFSTR("com.apple.MobileAsset.LinguisticData"));
}

- (void)removeAssertionWithIdentifier:(id)a3 assetType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[DDSAssetCenter managerInterfaceForAssetType:](self, "managerInterfaceForAssetType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "removeAssertionWithID:", v6);
  }
  else
  {
    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DDSAssetCenter removeAssertionWithIdentifier:assetType:].cold.1();

  }
}

- (id)assertionIDsForClientID:(id)a3 assetType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DDSAssetCenter managerInterfaceForAssetType:](self, "managerInterfaceForAssetType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__DDSAssetCenter_assertionIDsForClientID_assetType___block_invoke;
    v14[3] = &unk_1EA1412A0;
    v14[4] = &v15;
    objc_msgSend(v8, "assertionIDsForClientID:reply:", v6, v14);
    DefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v16[5];
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Found assertions: (%{public}@) for clientID: (%{public}@)", buf, 0x16u);
    }

    v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    DefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DDSAssetCenter assertionIDsForClientID:assetType:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __52__DDSAssetCenter_assertionIDsForClientID_assetType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[DDSAssetCenter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DDSAssetCenter_fetchTrialAssetForQuery_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__DDSAssetCenter_fetchTrialAssetForQuery_callback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "trialManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchTrialAssetForQuery:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setUpTrialForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DDSAssetCenter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__DDSAssetCenter_setUpTrialForQuery___block_invoke;
  v7[3] = &unk_1EA1412F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__DDSAssetCenter_setUpTrialForQuery___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "trialManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUpTrialForQuery:", *(_QWORD *)(a1 + 40));

}

- (NSSet)delegates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_delegates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DDSAssetCenter *v9;

  v4 = a3;
  -[DDSAssetCenter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke;
  v7[3] = &unk_1EA1412F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[4];
  __CFString *v14;

  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  if (+[DDSMAAutoAssetManager isAutoAssetType:](DDSMAAutoAssetManager, "isAutoAssetType:", *(_QWORD *)(a1 + 32)))
  {
    v9 = CFSTR("com.apple.MobileAsset.LinguisticData");
    objc_msgSend(*(id *)(a1 + 40), "autoAssetManager");
  }
  else
  {
    v9 = (__CFString *)*(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "provider");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverDidUpdateAssetsWithType:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "delegates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_197;
  v13[3] = &unk_1EA141318;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_197(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateAssetsWithType:", *(_QWORD *)(a1 + 32));
}

- (void)triggerDump
{
  void *v2;
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
  -[DDSAssetCenter managerInterfaces](self, "managerInterfaces", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "triggerDump");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)triggerUpdate
{
  void *v2;
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
  -[DDSAssetCenter managerInterfaces](self, "managerInterfaces", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "triggerUpdate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[DDSAssetCenter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[DDSAssetCenter delegates](self, "delegates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__DDSAssetCenter_trialDidReceiveAsset_forQuery___block_invoke;
  v12[3] = &unk_1EA141340;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __48__DDSAssetCenter_trialDidReceiveAsset_forQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "trialDidReceiveAsset:forQuery:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)trialDidStopForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[DDSAssetCenter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[DDSAssetCenter delegates](self, "delegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__DDSAssetCenter_trialDidStopForQuery___block_invoke;
  v8[3] = &unk_1EA141318;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __39__DDSAssetCenter_trialDidStopForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "trialDidStopForQuery:", *(_QWORD *)(a1 + 32));

}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetCenter managerInterfaceForAssetType:](self, "managerInterfaceForAssetType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "fetchAssetUpdateStatusForQuery:callback:", v6, v7);
  }
  else
  {
    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DDSAssetCenter fetchAssetUpdateStatusForQuery:callback:].cold.1(v6, v10);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);

  }
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssetCenter managerInterfaceForAssetType:](self, "managerInterfaceForAssetType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__DDSAssetCenter_updateAssetForQuery_callback___block_invoke;
    v12[3] = &unk_1EA141368;
    v13 = v7;
    objc_msgSend(v9, "updateAssetForQuery:callback:", v6, v12);
    v10 = v13;
  }
  else
  {
    DefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DDSAssetCenter updateAssetForQuery:callback:].cold.1(v6, v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
  }

}

void __47__DDSAssetCenter_updateAssetForQuery_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createXPCInterface, 0);
  objc_storeStrong((id *)&self->_managerInterfaceByAssetType, 0);
  objc_storeStrong((id *)&self->_autoAssetManager, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_assetObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

- (void)registerDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Adding AssetCenter delegate: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)unregisterDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Removing AssetCenter delegate: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)addAssertionForAssetsWithQuery:(void *)a1 policy:(NSObject *)a2 assertionID:clientID:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, v4, "Cannot add assertion, manager interface is nil for asset type: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)removeAssertionWithIdentifier:assetType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA990000, v0, v1, "Cannot remove assertion with identifier, manager interface is nil for asset type: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)assertionIDsForClientID:assetType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA990000, v0, v1, "Cannot get assertionIDs for clientID, manager interface is nil for asset type: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __48__DDSAssetCenter_serverDidUpdateAssetsWithType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1DA990000, a2, a3, "Letting delegates know assets updated: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)fetchAssetUpdateStatusForQuery:(void *)a1 callback:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, v4, "Cannot fetch asset update status, manager interface is nil for asset type: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)updateAssetForQuery:(void *)a1 callback:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA990000, a2, v4, "Cannot update asset for type, manager interface is nil for asset type: %@", v5);

  OUTLINED_FUNCTION_3();
}

@end
