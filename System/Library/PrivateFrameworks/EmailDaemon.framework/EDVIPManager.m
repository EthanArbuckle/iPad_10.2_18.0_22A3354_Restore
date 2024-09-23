@implementation EDVIPManager

void __36__EDVIPManager_allVIPEmailAddresses__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_allVIPEmailAddresses");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_allVIPEmailAddresses
{
  EAEmailAddressSet *cachedEmailAddresses;
  id v4;
  NSMutableDictionary *vipsByIdentifier;
  id v6;
  EAEmailAddressSet *v7;
  EAEmailAddressSet *v8;
  _QWORD v10[4];
  id v11;

  cachedEmailAddresses = self->_cachedEmailAddresses;
  if (!cachedEmailAddresses)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1E458]);
    vipsByIdentifier = self->_vipsByIdentifier;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__EDVIPManager__allVIPEmailAddresses__block_invoke;
    v10[3] = &unk_1E94A34C0;
    v6 = v4;
    v11 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vipsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = (EAEmailAddressSet *)objc_msgSend(v6, "copy");
    v8 = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = v7;

    cachedEmailAddresses = self->_cachedEmailAddresses;
  }
  return (id)-[EAEmailAddressSet copy](cachedEmailAddresses, "copy");
}

id __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("vipCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("notificationsEnabled");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasVIPs
{
  EDVIPManager *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__EDVIPManager_hasVIPs__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isVIPAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EDVIPManager allVIPEmailAddresses](self, "allVIPEmailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__43;
  v13 = __Block_byref_object_dispose__43;
  v14 = 0;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__EDVIPManager_allVIPEmailAddresses__block_invoke;
  v8[3] = &unk_1E949BE40;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_barrier_sync(v3, v8);

  v4 = (void *)v10[5];
  if (v4)
    v5 = v4;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0D1E458]);
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return (EAEmailAddressSet *)v6;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

uint64_t __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __23__EDVIPManager_hasVIPs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_2;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v4, "performBlock:", v5);

}

- (EDVIPManager)initWithDirectoryURL:(id)a3 accountsProvider:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  EDVIPManager *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A38], "additionalStoreWithIdentifier:", CFSTR("com.apple.mail.vipsenders"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EDVIPManager initWithDirectoryURL:keyValueStore:accountsProvider:contactStore:delegate:](self, "initWithDirectoryURL:keyValueStore:accountsProvider:contactStore:delegate:", v8, v11, v9, 0, v10);

  return v12;
}

- (EDVIPManager)initWithDirectoryURL:(id)a3 keyValueStore:(id)a4 accountsProvider:(id)a5 contactStore:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  EDVIPManager *v17;
  uint64_t v18;
  NSURL *plistURL;
  dispatch_queue_t v20;
  OS_dispatch_queue *operationQueue;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *notificationQueue;
  void *v25;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)EDVIPManager;
  v17 = -[EDVIPManager init](&v27, sel_init);
  if (v17)
  {
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("VIPs.plist"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    plistURL = v17->_plistURL;
    v17->_plistURL = (NSURL *)v18;

    objc_storeStrong((id *)&v17->_keyValueStore, a4);
    objc_storeStrong((id *)&v17->_contactStore, a6);
    objc_storeStrong((id *)&v17->_accountsProvider, a5);
    v20 = dispatch_queue_create("com.apple.email.edvipmanager", MEMORY[0x1E0C80D50]);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create("com.apple.email.edvipmanager.notifications", v22);
    notificationQueue = v17->_notificationQueue;
    v17->_notificationQueue = (OS_dispatch_queue *)v23;

    v17->_initializeLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v17->_delegate, v16);
    if (v14 && !objc_msgSend(v14, "hasActiveAccounts"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v17, sel__accountsChanged_, *MEMORY[0x1E0D1E4F8], 0);

    }
    else
    {
      -[EDVIPManager _initializeKVSStore](v17, "_initializeKVSStore");
    }
  }

  return v17;
}

- (void)_initializeKVSStore
{
  os_unfair_lock_s *p_initializeLock;
  NSObject *operationQueue;
  void *v5;
  _QWORD block[5];

  p_initializeLock = &self->_initializeLock;
  os_unfair_lock_lock(&self->_initializeLock);
  if (!self->_initialized)
  {
    self->_initialized = 1;
    operationQueue = self->_operationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__EDVIPManager__initializeKVSStore__block_invoke;
    block[3] = &unk_1E949AEB8;
    block[4] = self;
    dispatch_barrier_async(operationQueue, block);
    if (self->_keyValueStore)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyValueStoreChanged_, *MEMORY[0x1E0CB3368], self->_keyValueStore);

    }
  }
  os_unfair_lock_unlock(p_initializeLock);
}

void __35__EDVIPManager__initializeKVSStore__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadVIPs");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[6])
  {
    objc_msgSend(v2, "_synchronizeKVStore");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDVIPManager log](EDVIPManager, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = CFSTR("com.apple.mail.vipsenders");
      v11 = 2048;
      v12 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "registering for VIP kvstore at: %@\nnumber of VIPs in current store: %lu", (uint8_t *)&v9, 0x16u);
    }

    +[EDVIPManager log](EDVIPManager, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "_partiallyRedactedVIPDictionary:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __35__EDVIPManager__initializeKVSStore__block_invoke_cold_1(v6, (uint64_t)&v9, v5);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateLocalWithCloud:refresh:", v8, 1);

    objc_msgSend(*(id *)(a1 + 32), "gatherStatisticsWithVIPCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"));
  }
}

- (void)gatherStatisticsWithVIPCount:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_v12__0B8l;
  aBlock[4] = a3;
  v5 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_4;
    v8[3] = &unk_1E94A3630;
    v9 = v5;
    objc_msgSend(v7, "vipManager:hasVIPNotificationsEnabledWithCompletion:", self, v8);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v5 + 2))(v5, 0);
  }

}

- (void)_updateLocalWithCloud:(id)a3 refresh:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id *p_isa;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  EAEmailAddressSet *cachedEmailAddresses;
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  id v70;
  EDVIPManager *v71;
  _QWORD block[4];
  id v73;
  id v74;
  id *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  uint64_t v90;
  uint64_t v91;

  v4 = a4;
  v91 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  +[EDVIPManager log](EDVIPManager, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSMutableDictionary count](self->_vipsByIdentifier, "count");
    *(_DWORD *)buf = 134217984;
    v90 = v7;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "local store has %lu VIPs before updating from cloud", buf, 0xCu);
  }
  v71 = self;

  +[EDVIPManager log](EDVIPManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDVIPManager _updateLocalWithCloud:refresh:].cold.2((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);

  v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v4)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary allKeys](self->_vipsByIdentifier, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (id)objc_msgSend(v15, "initWithArray:", v16);

  }
  else
  {
    v66 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  -[EDVIPManager keyValueStore](self, "keyValueStore");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v63;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
  if (v17)
  {
    v68 = *(_QWORD *)v84;
    do
    {
      v69 = v17;
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v84 != v68)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        if (objc_msgSend(v19, "hasPrefix:", CFSTR("VIP_")))
        {
          objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("VIP_"), &stru_1E94A4508, 8, 0, objc_msgSend(v19, "length"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDVIPManager _validatedCloudVIPFromStore:withCloudKey:](v71, "_validatedCloudVIPFromStore:withCloudKey:", v65, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("n"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_alloc(MEMORY[0x1E0D1E458]);
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("a"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v24, "initWithArray:", v25);

            -[NSMutableDictionary objectForKeyedSubscript:](v71->_vipsByIdentifier, "objectForKeyedSubscript:", v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              objc_msgSend(v27, "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v23 && (objc_msgSend(v29, "isEqualToString:", v23) & 1) == 0)
              {
                v36 = v23;

                v31 = 1;
                v30 = v36;
              }
              else
              {
                v31 = 0;
              }
              objc_msgSend(v28, "emailAddresses");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "count") && (objc_msgSend(v26, "isSubsetOfSet:", v32) & 1) == 0)
              {
                v37 = (void *)objc_msgSend(v32, "mutableCopy");
                objc_msgSend(v37, "unionSet:", v26);

                v32 = v37;
              }
              else if (!v31)
              {
                v35 = 0;
                goto LABEL_33;
              }
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E3B8]), "initWithIdentifier:name:emailAddresses:", v20, v30, v32);
            }
            else
            {
              v30 = (void *)objc_msgSend(v26, "mutableCopy");
              -[EDVIPManager _contactForName:emailAddresses:](v71, "_contactForName:emailAddresses:", v23, v26);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "emailAddresses");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "valueForKey:", CFSTR("value"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v34, "count"))
                objc_msgSend(v30, "addObjectsFromArray:", v34);
              if (objc_msgSend(v30, "count"))
                v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E3B8]), "initWithIdentifier:name:emailAddresses:", v20, v23, v30);
              else
                v35 = 0;

            }
LABEL_33:

            if (v35)
              objc_msgSend(v64, "setObject:forKeyedSubscript:", v35, v20);
            objc_msgSend(v66, "removeObject:", v20);

          }
          else
          {
            objc_msgSend(v66, "addObject:", v20);
          }

          continue;
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    }
    while (v17);
  }

  p_isa = (id *)&v71->super.isa;
  if (objc_msgSend(v64, "count") || objc_msgSend(v66, "count"))
  {
    v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = MEMORY[0x1E0C809B0];
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke;
    v80[3] = &unk_1E94A3538;
    v80[4] = v71;
    v42 = v70;
    v81 = v42;
    v43 = v40;
    v82 = v43;
    objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v80);
    -[EAEmailAddressSet unionSet:](v71->_cachedEmailAddresses, "unionSet:", v43);
    if (objc_msgSend(v66, "count"))
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v44 = v66;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v77 != v46)
              objc_enumerationMutation(v44);
            v48 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
            -[NSMutableDictionary objectForKeyedSubscript:](v71->_vipsByIdentifier, "objectForKeyedSubscript:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
              objc_msgSend(v39, "addObject:", v49);
            -[NSMutableDictionary removeObjectForKey:](v71->_vipsByIdentifier, "removeObjectForKey:", v48);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
        }
        while (v45);
      }

      cachedEmailAddresses = v71->_cachedEmailAddresses;
      v71->_cachedEmailAddresses = 0;

      p_isa = (id *)&v71->super.isa;
    }
    objc_msgSend(p_isa, "_saveVIPsLocally");
    objc_msgSend(p_isa, "notificationQueue");
    v51 = objc_claimAutoreleasedReturnValue();
    block[0] = v41;
    block[1] = 3221225472;
    block[2] = __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke_2;
    block[3] = &unk_1E949B390;
    v73 = v42;
    v74 = v39;
    v75 = p_isa;
    v52 = v39;
    v53 = v42;
    dispatch_async(v51, block);

    p_isa = (id *)&v71->super.isa;
  }
  +[EDVIPManager log](EDVIPManager, "log");
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = objc_msgSend(p_isa[1], "count");
    *(_DWORD *)buf = 134217984;
    v90 = v55;
    _os_log_impl(&dword_1D2F2C000, v54, OS_LOG_TYPE_DEFAULT, "local store has %lu VIPs after updating from cloud", buf, 0xCu);
  }

  +[EDVIPManager log](EDVIPManager, "log");
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    -[EDVIPManager _updateLocalWithCloud:refresh:].cold.1((uint64_t)v71, v56, v57, v58, v59, v60, v61, v62);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__EDVIPManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_97 != -1)
    dispatch_once(&log_onceToken_97, block);
  return (OS_os_log *)(id)log_log_97;
}

- (NSUbiquitousKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)_synchronizeKVStore
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to synchronize KV Store", v1, 2u);
}

- (void)_loadVIPs
{
  NSMutableDictionary *v3;
  NSMutableDictionary *vipsByIdentifier;
  id v5;
  _QWORD v6[5];

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  vipsByIdentifier = self->_vipsByIdentifier;
  self->_vipsByIdentifier = v3;

  -[EDVIPManager _vipsDictionary](self, "_vipsDictionary");
  v6[1] = 3221225472;
  v6[2] = __25__EDVIPManager__loadVIPs__block_invoke;
  v6[3] = &unk_1E949F220;
  v6[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (id)_vipsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  -[EDVIPManager plistURL](self, "plistURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

uint64_t __45__EDVIPManager_gatherStatisticsWithVIPCount___block_invoke_2()
{
  return AnalyticsSendEventLazy();
}

void __19__EDVIPManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_97;
  log_log_97 = (uint64_t)v1;

}

- (id)_partiallyRedactedVIPDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke;
  v7[3] = &unk_1E949F220;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke_2;
    v9[3] = &unk_1E949C150;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __48__EDVIPManager__partiallyRedactedVIPDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("a")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringFromArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
LABEL_7:

      goto LABEL_10;
    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("n")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("v")))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
LABEL_10:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EDVIPManager;
  -[EDVIPManager dealloc](&v4, sel_dealloc);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (id)vipWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
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
  v15 = __Block_byref_object_copy__43;
  v16 = __Block_byref_object_dispose__43;
  v17 = 0;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EDVIPManager_vipWithIdentifier___block_invoke;
  block[3] = &unk_1E949BE18;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __34__EDVIPManager_vipWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)allVIPs
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__43;
  v13 = __Block_byref_object_dispose__43;
  v14 = 0;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__EDVIPManager_allVIPs__block_invoke;
  v8[3] = &unk_1E949BE40;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  v4 = (void *)v10[5];
  if (v4)
    v5 = v4;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return (NSSet *)v6;
}

void __23__EDVIPManager_allVIPs__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithArray:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)getAllVIPsWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[EDVIPManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDVIPManager getAllVIPsWithCompletion:]", "EDVIPManager.m", 175, "0");
}

void __37__EDVIPManager__allVIPEmailAddresses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "emailAddresses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:");

}

- (id)allVIPWaitForResult
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__EDVIPManager_allVIPWaitForResult__block_invoke;
  v6[3] = &unk_1E949BE40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__EDVIPManager_allVIPWaitForResult__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithArray:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)saveVIPs:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  EDVIPManager *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[EDVIPManager keyValueStore](self, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDVIPManager.m"), 215, CFSTR("Modification of VIPs only supported when syncing is enabled"));

  }
  +[EDVIPManager log](EDVIPManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "save VIPs with count %lu", buf, 0xCu);
  }

  -[EDVIPManager operationQueue](self, "operationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__EDVIPManager_saveVIPs___block_invoke;
  v11[3] = &unk_1E949B6D0;
  v12 = v5;
  v13 = self;
  v9 = v5;
  dispatch_barrier_async(v8, v11);

}

void __25__EDVIPManager_saveVIPs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD block[5];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v43 = a1;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v2)
  {
    v41 = *(_QWORD *)v52;
    do
    {
      v42 = v2;
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v4, "name", v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "emailAddresses");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v43 + 40) + 8), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", v44);

          if ((v10 & 1) != 0)
            v11 = 0;
          else
            v11 = v44;
          objc_msgSend(v8, "emailAddresses");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v5, "isSubsetOfSet:", v20);

          if ((v21 & 1) != 0)
          {
            v12 = 0;
          }
          else
          {
            objc_msgSend(v8, "emailAddresses");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v22, "mutableCopy");

            objc_msgSend((id)v12, "unionSet:", v5);
          }
          if (!(v11 | v12))
            goto LABEL_35;
          if (v11)
          {
            v23 = (id)v11;
          }
          else
          {
            objc_msgSend(v8, "name");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v23;
          if (v12)
          {
            v24 = (id)v12;
          }
          else
          {
            objc_msgSend(v8, "emailAddresses");
            v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          v25 = v24;
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E3B8]), "initWithIdentifier:name:emailAddresses:", v6, v13, v24);
          objc_msgSend(v39, "addObject:", v26);
        }
        else
        {
          objc_msgSend(*(id *)(v43 + 40), "_contactForName:emailAddresses:", v44, v5);
          v11 = objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(v43 + 40), "_isVIPForContact:orAddresses:", v11, v5) & 1) != 0)
            goto LABEL_36;
          v12 = v44;
          v13 = (void *)objc_msgSend(v5, "mutableCopy");
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v11, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              v16 = v14;

              v12 = (uint64_t)v16;
            }
            objc_msgSend((id)v11, "emailAddresses");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("value"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "count"))
              objc_msgSend(v13, "addObjectsFromArray:", v18);

          }
          if (!objc_msgSend(v13, "count"))
            goto LABEL_34;
          if (v12)
          {
            v19 = (id)v12;
          }
          else
          {
            objc_msgSend(v13, "anyObject");
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          v25 = v19;
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E3B8]), "initWithIdentifier:name:emailAddresses:", v6, v19, v13);
          objc_msgSend(v39, "addObject:", v26);
        }

LABEL_34:
LABEL_35:

LABEL_36:
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v2);
  }

  +[EDVIPManager log](EDVIPManager, "log");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v39, "count");
    *(_DWORD *)buf = 134217984;
    v57 = v28;
    _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "save new VIPs with count %lu", buf, 0xCu);
  }

  if (objc_msgSend(v39, "count"))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0D1E458]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v39;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v35 = *(void **)(*(_QWORD *)(v43 + 40) + 8);
          objc_msgSend(v34, "identifier", v39);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v36);

          objc_msgSend(v34, "emailAddresses");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "unionSet:", v37);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v31);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v43 + 40) + 16), "unionSet:", v29);
    objc_msgSend(*(id *)(v43 + 40), "_saveVIPs");
    objc_msgSend(*(id *)(v43 + 40), "notificationQueue");
    v38 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__EDVIPManager_saveVIPs___block_invoke_50;
    block[3] = &unk_1E949B6D0;
    block[4] = *(_QWORD *)(v43 + 40);
    v46 = v30;
    dispatch_async(v38, block);

  }
}

void __25__EDVIPManager_saveVIPs___block_invoke_50(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0D1E0B8];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E0A8], v4, v5);

}

- (BOOL)_isVIPForContact:(id)a3 orAddresses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[EDVIPManager _allVIPEmailAddresses](self, "_allVIPEmailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "intersectsSet:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E458]), "initWithArray:", v11);
      v9 = objc_msgSend(v12, "intersectsSet:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  -[EDVIPManager keyValueStore](self, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDVIPManager.m"), 308, CFSTR("Modification of VIPs only supported when syncing is enabled"));

  }
  -[EDVIPManager operationQueue](self, "operationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__EDVIPManager_removeVIPsWithIdentifiers___block_invoke;
  v10[3] = &unk_1E949B6D0;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_barrier_async(v7, v10);

}

uint64_t __42__EDVIPManager_removeVIPsWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeVIPsWithIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  -[EDVIPManager keyValueStore](self, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDVIPManager.m"), 315, CFSTR("Modification of VIPs only supported when syncing is enabled"));

  }
  -[EDVIPManager operationQueue](self, "operationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke;
  v10[3] = &unk_1E949B6D0;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_barrier_async(v7, v10);

}

void __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke_2;
  v5[3] = &unk_1E94A34E8;
  v6 = v2;
  objc_msgSend(v3, "keysOfEntriesPassingTest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_removeVIPsWithIdentifiers:", v4);

}

uint64_t __45__EDVIPManager_removeVIPsWithEmailAddresses___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_removeVIPsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  EAEmailAddressSet *cachedEmailAddresses;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDVIPManager log](EDVIPManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "remove VIPs with identifiers %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_vipsByIdentifier, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_vipsByIdentifier, "removeObjectForKey:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  cachedEmailAddresses = self->_cachedEmailAddresses;
  self->_cachedEmailAddresses = 0;

  -[EDVIPManager _saveVIPs](self, "_saveVIPs");
  -[EDVIPManager notificationQueue](self, "notificationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__EDVIPManager__removeVIPsWithIdentifiers___block_invoke;
  v16[3] = &unk_1E949B6D0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  dispatch_async(v14, v16);

}

void __43__EDVIPManager__removeVIPsWithIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *MEMORY[0x1E0D1E0B0];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E0A8], v4, v5);

}

void __25__EDVIPManager__loadVIPs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EmailAddresses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D1E3B8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E458]), "initWithArray:", v7);
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:name:emailAddresses:", v11, v6, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v10, v11);
}

- (void)_saveVIPs
{
  -[EDVIPManager _saveVIPsLocally](self, "_saveVIPsLocally");
  -[EDVIPManager _updateCloudWithLocal](self, "_updateCloudWithLocal");
}

- (void)_saveVIPsLocally
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to write serialized entries: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (id)_serializedData
{
  id v3;
  NSMutableDictionary *vipsByIdentifier;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  vipsByIdentifier = self->_vipsByIdentifier;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__EDVIPManager__serializedData__block_invoke;
  v13[3] = &unk_1E94A34C0;
  v5 = v3;
  v14 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](vipsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v13);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v6)
  {
    +[EDVIPManager log](EDVIPManager, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v5, "count");
      objc_msgSend(v7, "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDVIPManager _serializedData].cold.1(v10, buf, v9, v8);
    }

  }
  return v6;
}

void __31__EDVIPManager__serializedData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14[0] = CFSTR("Name");
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("EmailAddresses");
    v15[0] = v8;
    objc_msgSend(v6, "emailAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("EmailAddresses");
    objc_msgSend(v6, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v5);
}

- (void)_updateCloudWithLocal
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "VIP store contents after writing to cloud: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

void __37__EDVIPManager__updateCloudWithLocal__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_cloudKeyForIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_validatedCloudVIPFromStore:withCloudKey:", *(_QWORD *)(a1 + 48), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);
    v11 = objc_alloc(MEMORY[0x1E0D1E458]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

    if ((objc_msgSend(v8, "isEqualToSet:", v13) & v10 & 1) != 0)
      v14 = 0;
    else
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);

    if (!v14)
      goto LABEL_13;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!v14)
      goto LABEL_13;
  }
  if (v7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("n"));
  if (v8)
  {
    objc_msgSend(v8, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("a"));

  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E94E4E68, CFSTR("v"));
  objc_msgSend(*(id *)(a1 + 48), "setDictionary:forKey:", v14, v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_13:

}

- (void)_keyValueStoreChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDVIPManager *v9;

  v4 = a3;
  -[EDVIPManager operationQueue](self, "operationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__EDVIPManager__keyValueStoreChanged___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __38__EDVIPManager__keyValueStoreChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDVIPManager log](EDVIPManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v3;
    v17 = 2048;
    v18 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "VIP kvstore changed, reason: %{public}@\n%lu keys changed", (uint8_t *)&v15, 0x16u);
  }

  +[EDVIPManager log](EDVIPManager, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __38__EDVIPManager__keyValueStoreChanged___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  v13 = objc_msgSend(v3, "integerValue");
  v14 = 0;
  switch(v13)
  {
    case 0:
    case 2:
      goto LABEL_8;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "_mergeVIPs");
      break;
    case 3:
      v14 = 1;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "_updateLocalWithCloud:refresh:", v4, v14);
      break;
    default:
      break;
  }

}

void __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v5, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

}

void __46__EDVIPManager__updateLocalWithCloud_refresh___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D1E0B0];
  v6[0] = *MEMORY[0x1E0D1E0B8];
  v6[1] = v2;
  v3 = a1[5];
  v7[0] = a1[4];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E0A8], a1[6], v4);

}

- (void)_mergeVIPs
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D2F2C000, a2, a3, "merge VIPs from cloud: %@ and local: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __26__EDVIPManager__mergeVIPs__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("VIP_")))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(a1[4], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "addObject:", v5);
          }
          else
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v5, 0);
            objc_msgSend(a1[4], "setObject:forKeyedSubscript:");
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v5, v13);
      objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "givenName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "familyName");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 && v16)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v15, v16);
        objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v5, v18);

      }
    }

  }
}

void __26__EDVIPManager__mergeVIPs__block_invoke_2(id *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  id v52;
  id v53;
  _BOOL4 v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v44 = a2;
  v42 = a3;
  objc_msgSend(v42, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "emailAddresses");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_cloudKeyForIdentifier:", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_validatedCloudVIPFromStore:withCloudKey:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v5;
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "givenName");
  v8 = objc_claimAutoreleasedReturnValue();
  v49 = v8;
  objc_msgSend(v7, "familyName");
  v51 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v10 = v45;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(a1[6], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v9, "unionSet:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v9, "count");
  if (v15)
  {
    if (v15 == 1)
    {
      objc_msgSend(v9, "anyObject");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_70;
    }
    v56 = objc_msgSend(v10, "count");
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v9;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v18)
    {
      v52 = 0;
      v53 = 0;
      v47 = 0;
      v48 = 0;
      v60 = 0;
      v55 = *(_QWORD *)v63;
      v54 = (v8 | v51) != 0;
LABEL_21:
      v57 = v18;
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v55)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v19);
        objc_msgSend(a1[5], "dictionaryForKey:", v20);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v21);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "givenName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "familyName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58 && (objc_msgSend(v21, "isEqualToString:", v58) & 1) != 0)
          {
            v16 = v20;

            v33 = v48;
            v7 = v59;
            if (v16)
              goto LABEL_68;
            goto LABEL_59;
          }
          if (v8)
            LODWORD(v8) = objc_msgSend(v22, "isEqualToString:", v8);
          if (v51)
          {
            v24 = objc_msgSend(v23, "isEqualToString:");
            if ((v8 & v24) == 1 && v47 == 0)
            {
              v47 = v20;
              v24 = 1;
            }
          }
          else
          {
            v24 = 0;
          }
          if (v52)
            v26 = 0;
          else
            v26 = v8;
          if (v26 == 1)
            v52 = v20;
          if (v53)
            v27 = 0;
          else
            v27 = v24;
          v8 = v49;
          if (v27 == 1)
            v53 = v20;

          v7 = v59;
        }
        if (v60 < v56)
        {
          v28 = objc_alloc(MEMORY[0x1E0C99E20]);
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("a"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v28, "initWithArray:", v29);

          objc_msgSend(v30, "intersectSet:", v10);
          v31 = objc_msgSend(v30, "count");
          if (v31 > v60)
          {
            v32 = v20;

            v48 = v32;
            v60 = v31;
          }

        }
        if (v57 == ++v19)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (v18)
            goto LABEL_21;
          goto LABEL_58;
        }
      }
    }
    v52 = 0;
    v53 = 0;
    v47 = 0;
    v48 = 0;
    v60 = 0;
LABEL_58:

    v33 = v48;
LABEL_59:
    if (v47)
    {
      v16 = v47;
      v47 = v16;
    }
    else
    {
      if (v60 == v56)
      {
        v34 = v33;
        v33 = v34;
        v47 = 0;
      }
      else
      {
        if (v53)
        {
          v16 = v53;
          v47 = 0;
          v53 = v16;
          goto LABEL_68;
        }
        if (v52)
        {
          v16 = v52;
          v47 = 0;
          v52 = v16;
          v53 = 0;
          goto LABEL_68;
        }
        v34 = v33;
        v33 = v34;
        v47 = 0;
        v52 = 0;
        v53 = 0;
      }
      v16 = v34;
    }
LABEL_68:

    v17 = v52;
    goto LABEL_69;
  }
  objc_msgSend(a1[7], "objectForKeyedSubscript:", v58);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16 && v8 && v51)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v8, v51);
    objc_msgSend(a1[8], "objectForKeyedSubscript:", v17);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

  }
LABEL_70:
  if (v16)
  {
    v35 = v16;

    objc_msgSend(a1[5], "dictionaryForKey:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v36, "mutableCopy");

    v46 = v35;
  }
  else
  {
    v6 = 0;
  }

LABEL_74:
  if (!v6)
  {
    if (v58)
      v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v58, CFSTR("n"), 0);
    else
      v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = v37;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v45, "mutableCopy");
  objc_msgSend(v39, "addObjectsFromArray:", v38);
  objc_msgSend(v39, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sortedArrayUsingSelector:", sel_compare_);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("a"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E94E4E68, CFSTR("v"));
  objc_msgSend(a1[5], "setDictionary:forKey:", v6, v46);

}

- (id)_cloudKeyForIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(CFSTR("VIP_"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_validatedCloudVIPFromStore:(id)a3 withCloudKey:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dictionaryForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v6 = v4;
      v4 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_84);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");
        if (v8)
        {
          if (v8 == objc_msgSend(v6, "count"))
          {
            v9 = 0;
          }
          else
          {
            v10 = (void *)objc_msgSend(v6, "mutableCopy");
            objc_msgSend(v10, "removeObjectsAtIndexes:", v7);
            v9 = (void *)objc_msgSend(v4, "mutableCopy");
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("a"));

            v4 = v10;
          }

          v4 = v9;
        }
      }
      else
      {
        v7 = v4;
        v4 = 0;
      }

    }
  }
  else
  {
    v5 = v4;
    v4 = 0;
  }

  return v4;
}

BOOL __57__EDVIPManager__validatedCloudVIPFromStore_withCloudKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_accountsChanged:(id)a3
{
  void *v4;

  if (-[EDAccountsProvider hasActiveAccounts](self->_accountsProvider, "hasActiveAccounts", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D1E4F8], 0);

    -[EDVIPManager _initializeKVSStore](self, "_initializeKVSStore");
  }
}

- (id)_contactForName:(id)a3 emailAddresses:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v33 = a4;
  -[EDVIPManager contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v33;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_contactDescriptors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v7, "count");
  if (v14 != 1)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v35);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_contactDescriptors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v15, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v17);

      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "firstObject");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_45;
    }
    objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v15;
    objc_msgSend(v15, "givenName");
    v39 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "familyName");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v39 | v19)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v34 = v7;
      v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v20)
      {
        v40 = 0;
        v41 = 0;
        v37 = *(_QWORD *)v44;
LABEL_16:
        v36 = v20;
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v37)
            objc_enumerationMutation(v34);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
          objc_msgSend(0, "givenName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(0, "familyName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToString:", v39);
          v26 = v19;
          v27 = objc_msgSend(v24, "isEqualToString:", v19);
          if ((v25 & v27 & 1) != 0)
            break;
          if (v41)
            v28 = 0;
          else
            v28 = v25;
          if (v28 == 1)
            v41 = v22;
          if (v40)
            v29 = 0;
          else
            v29 = v27;
          if (v29 == 1)
            v40 = v22;

          v15 = v38;
          v19 = v26;

          if (v36 == ++v21)
          {
            v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            if (v20)
              goto LABEL_16;
            goto LABEL_37;
          }
        }
        v18 = v22;

        v15 = v38;
        v19 = v26;

        v30 = v40;
        if (v18)
          goto LABEL_42;
      }
      else
      {
        v40 = 0;
        v41 = 0;
LABEL_37:

        v30 = v40;
      }
      v31 = v30;
      if (v30)
        goto LABEL_41;
      v30 = v41;
      if (v41)
      {
        v31 = 0;
LABEL_41:
        v18 = v30;
        v30 = v31;
LABEL_42:

        goto LABEL_44;
      }
    }
    -[EDVIPManager _contactFromContacts:matchingMostAddresses:](self, "_contactFromContacts:matchingMostAddresses:", v7, obj);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
    goto LABEL_46;
  }
  objc_msgSend(v7, "firstObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:

  return v18;
}

- (id)_contactFromContacts:(id)a3 matchingMostAddresses:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = objc_msgSend(v6, "count");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
  {

LABEL_16:
    objc_msgSend(obj, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v13 = objc_alloc(MEMORY[0x1E0D1E458]);
      objc_msgSend(v12, "emailAddresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKey:", CFSTR("value"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithArray:", v15);

      objc_msgSend(v16, "intersectSet:", v6);
      v17 = objc_msgSend(v16, "count");
      if (v17 > v9)
      {
        v18 = v12;

        if (v17 == v20)
        {

          v8 = v18;
          goto LABEL_13;
        }
        v8 = v18;
        v9 = v17;
      }

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
      continue;
    break;
  }
LABEL_13:

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

+ (id)_contactDescriptors
{
  if (_contactDescriptors_onceToken != -1)
    dispatch_once(&_contactDescriptors_onceToken, &__block_literal_global_65);
  return (id)_contactDescriptors_descriptors;
}

void __35__EDVIPManager__contactDescriptors__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C966D0];
  v5[0] = v0;
  v5[1] = v1;
  v2 = *MEMORY[0x1E0C966A8];
  v5[2] = *MEMORY[0x1E0C966C0];
  v5[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_contactDescriptors_descriptors;
  _contactDescriptors_descriptors = v3;

}

- (EDVIPManagerDelegate)delegate
{
  return (EDVIPManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStore, a3);
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);
  objc_storeStrong((id *)&self->_vipsByIdentifier, 0);
}

void __35__EDVIPManager__initializeKVSStore__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = CFSTR("com.apple.mail.vipsenders");
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D2F2C000, a2, a3, "%@: current store contents: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

- (void)_serializedData
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to serialize %lu entries: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __38__EDVIPManager__keyValueStoreChanged___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "keys changed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateLocalWithCloud:(uint64_t)a3 refresh:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "local VIPs after updating from cloud: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateLocalWithCloud:(uint64_t)a3 refresh:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, a2, a3, "local VIPs before updating from cloud: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1_0();
}

@end
