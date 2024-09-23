@implementation BKHIDEventDeliveryObserverService

- (BKHIDEventDeliveryObserverService)init
{
  BKHIDDomainServiceServer *v3;
  uint64_t v4;
  void *v5;
  BKHIDDomainServiceServer *v6;
  BKHIDEventDeliveryObserverService *v7;

  v3 = [BKHIDDomainServiceServer alloc];
  v4 = *MEMORY[0x1E0D00A08];
  BKLogEventDelivery();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKHIDDomainServiceServer initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:](v3, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", self, self, &unk_1EF900C28, &unk_1EF9042C0, v4, 0, v5, 0);

  v7 = -[BKHIDEventDeliveryObserverService initWithServer:](self, "initWithServer:", v6);
  return v7;
}

- (BKHIDEventDeliveryObserverService)initWithServer:(id)a3
{
  id v5;
  BKHIDEventDeliveryObserverService *v6;
  BKHIDEventDeliveryObserverService *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_identityToChain;
  BKThreeLevelForest *v10;
  BKThreeLevelForest *lock_identityToPIDToObservations;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKHIDEventDeliveryObserverService;
  v6 = -[BKHIDEventDeliveryObserverService init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_identityToChain = v7->_lock_identityToChain;
    v7->_lock_identityToChain = v8;

    v10 = objc_alloc_init(BKThreeLevelForest);
    lock_identityToPIDToObservations = v7->_lock_identityToPIDToObservations;
    v7->_lock_identityToPIDToObservations = v10;

    objc_storeStrong((id *)&v7->_server, a3);
    -[BKHIDDomainServiceServer activate](v7->_server, "activate");
  }

  return v7;
}

- (BOOL)_locked_setObservations:(id)a3 forPID:(int)a4
{
  id v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  BSMutableIntegerMap *lock_observationsByPID;
  BSMutableIntegerMap *v12;
  BSMutableIntegerMap *v13;

  v6 = a3;
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v7 = a4;
  -[BSMutableIntegerMap objectForKey:](self->_lock_observationsByPID, "objectForKey:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  if ((BSEqualObjects() & 1) == 0 && (objc_msgSend(v6, "count") || objc_msgSend(v8, "count")))
  {
    v10 = objc_msgSend(v6, "count");
    lock_observationsByPID = self->_lock_observationsByPID;
    if (v10)
    {
      if (!lock_observationsByPID)
      {
        v12 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
        v13 = self->_lock_observationsByPID;
        self->_lock_observationsByPID = v12;

        lock_observationsByPID = self->_lock_observationsByPID;
      }
      -[BSMutableIntegerMap setObject:forKey:](lock_observationsByPID, "setObject:forKey:", v6, v7);
    }
    else
    {
      -[BSMutableIntegerMap removeObjectForKey:](lock_observationsByPID, "removeObjectForKey:", v7);
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_locked_chainsForIdentities:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary objectForKey:](self->_lock_identityToChain, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_locked_postChainsToObservingClients
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_lock_deferringChainObserverConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v8, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alreadySeenDeliveryChains");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "observingChainIdentities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKHIDEventDeliveryObserverService _locked_chainsForIdentities:](self, "_locked_chainsForIdentities:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "count") || objc_msgSend(v12, "count")) && (BSEqualObjects() & 1) == 0)
        {
          objc_msgSend(v9, "setAlreadySeenDeliveryChains:", v12);
          -[BKHIDDomainServiceServer remoteTargetForServiceConnection:](self->_server, "remoteTargetForServiceConnection:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "didUpdateDeferringChains:", v12);

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)deliveryChainDidUpdate:(id)a3 forIdentity:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  BKThreeLevelForest *lock_identityToPIDToObservations;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BKThreeLevelForest *v25;
  void *v26;
  BKThreeLevelForest *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  os_unfair_lock_t lock;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  BKHIDEventDeliveryObserverService *v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v43 = a4;
  v9 = a5;
  v42 = self;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BKLogEventDelivery();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v9;
    v62 = 2114;
    v63 = v8;
    _os_log_impl(&dword_1C8914000, v10, OS_LOG_TYPE_DEFAULT, "chain did update (%{public}@) %{public}@", buf, 0x16u);
  }
  v37 = v9;

  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  lock_identityToPIDToObservations = self->_lock_identityToPIDToObservations;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke;
  v57[3] = &unk_1E81F70E0;
  v35 = v11;
  v58 = v35;
  -[BKThreeLevelForest enumerateTrunk:block:](lock_identityToPIDToObservations, "enumerateTrunk:block:", v43, v57);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_identityToChain, "setObject:forKeyedSubscript:", v8, v43);
  -[BKThreeLevelForest removeTrunk:](self->_lock_identityToPIDToObservations, "removeTrunk:", v43);
  objc_msgSend(v8, "environment");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compatibilityDisplay");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(v8, "display");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v8;
  objc_msgSend(v8, "deferringPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v54;
    v19 = 0xFFFFFFFFLL;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        v21 = v19;
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v19 = objc_msgSend(v22, "pid");
        v23 = (void *)MEMORY[0x1E0D00D20];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_2;
        v48[3] = &unk_1E81F7108;
        v48[4] = v22;
        v49 = v40;
        v50 = v41;
        v51 = v17 + i + 1;
        v52 = v14;
        objc_msgSend(v23, "build:", v48);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v42->_lock_identityToPIDToObservations;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKThreeLevelForest addLeaf:toBranch:trunk:](v25, "addLeaf:toBranch:trunk:", v24, v26, v43);

        if ((int)v21 >= 1 && (_DWORD)v21 != (_DWORD)v19)
        {
          v27 = v42->_lock_identityToPIDToObservations;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKThreeLevelForest addLeaf:toBranch:trunk:](v27, "addLeaf:toBranch:trunk:", v24, v28, v43);

        }
      }
      v17 += i;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v16);
  }

  -[BKThreeLevelForest dictionaryContainingBranchesToLeaves](v42->_lock_identityToPIDToObservations, "dictionaryContainingBranchesToLeaves");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  v31 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v32 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_3;
  v45[3] = &unk_1E81F7130;
  v46 = v30;
  v47 = v31;
  v33 = v31;
  v34 = v30;
  objc_msgSend(v35, "enumerateIndexesUsingBlock:", v45);
  v44[0] = v32;
  v44[1] = 3221225472;
  v44[2] = __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_4;
  v44[3] = &unk_1E81F7158;
  v44[4] = v42;
  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v44);
  -[BKHIDEventDeliveryObserverService _locked_postChainsToObservingClients](v42, "_locked_postChainsToObservingClients");
  os_unfair_lock_unlock(lock);

}

- (id)setObservesDeferringResolutions:(id)a3
{
  BKHIDDomainServiceServer *server;
  id v5;
  void *v6;
  _BKEventObserverConnectionRecord *v7;
  void *v8;
  int v9;
  os_unfair_lock_s *p_lock;
  int v11;
  void *v12;

  server = self->_server;
  v5 = a3;
  -[BKHIDDomainServiceServer currentConnection](server, "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v6);
  v7 = (_BKEventObserverConnectionRecord *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(_BKEventObserverConnectionRecord);
    -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v7, v6);
  }
  objc_msgSend(v6, "remoteToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pid");

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = objc_msgSend(v5, "BOOLValue");

  if (v11)
  {
    -[_BKEventObserverConnectionRecord setObservingLocalPolicy:](v7, "setObservingLocalPolicy:", 1);
    -[BSMutableIntegerMap objectForKey:](self->_lock_observationsByPID, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_BKEventObserverConnectionRecord setObservingLocalPolicy:](v7, "setObservingLocalPolicy:", 0);
    v12 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (void)setObservesDeferringChainIdentities:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  _BKEventObserverConnectionRecord *v8;
  NSMutableSet *lock_deferringChainObserverConnections;
  NSMutableSet *v10;
  NSMutableSet *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BKHIDDomainServiceServer currentConnection](self->_server, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v5, "remoteToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.backboardd.globalDeferringChainObserver")) & 1) != 0)
  {
    -[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v5);
    v8 = (_BKEventObserverConnectionRecord *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(_BKEventObserverConnectionRecord);
      -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v8, v5);
    }
    -[_BKEventObserverConnectionRecord setObservingChainIdentities:](v8, "setObservingChainIdentities:", v4);
    lock_deferringChainObserverConnections = self->_lock_deferringChainObserverConnections;
    if (!lock_deferringChainObserverConnections)
    {
      v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v11 = self->_lock_deferringChainObserverConnections;
      self->_lock_deferringChainObserverConnections = v10;

      lock_deferringChainObserverConnections = self->_lock_deferringChainObserverConnections;
    }
    -[NSMutableSet addObject:](lock_deferringChainObserverConnections, "addObject:", v5);
    -[BKHIDEventDeliveryObserverService _locked_postChainsToObservingClients](self, "_locked_postChainsToObservingClients");
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    BKLogEventDelivery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "pid");
      BSProcessDescriptionForPID();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134217984;
      v15 = v13;
      _os_log_error_impl(&dword_1C8914000, v12, OS_LOG_TYPE_ERROR, "'%public@' tried to observe deferring chains. That's illegal.", (uint8_t *)&v14, 0xCu);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_lock_deferringChainObserverConnections, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_identityToChain, 0);
  objc_storeStrong((id *)&self->_lock_identityToPIDToObservations, 0);
  objc_storeStrong((id *)&self->_lock_deferringChainObserverConnections, 0);
  objc_storeStrong((id *)&self->_lock_observationsByPID, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

uint64_t __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "integerValue"));
}

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setPid:", objc_msgSend(*(id *)(a1 + 32), "pid"));
  objc_msgSend(*(id *)(a1 + 32), "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "setToken:", v3);
  objc_msgSend(v5, "setEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setDisplay:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) == *(_QWORD *)(a1 + 64))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v5, "setPolicyStatus:", v4);

}

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

void __79__BKHIDEventDeliveryObserverService_deliveryChainDidUpdate_forIdentity_reason___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(a2, "intValue");
  v6 = objc_msgSend(*(id *)(a1 + 32), "_locked_setObservations:forPID:", v11, v5);
  v7 = v11;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connectionForPID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "userInfoForConnection:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "observingLocalPolicy"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteTargetForServiceConnection:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didUpdateDeferringObservations:", v11);

      }
    }

    v7 = v11;
  }

}

@end
