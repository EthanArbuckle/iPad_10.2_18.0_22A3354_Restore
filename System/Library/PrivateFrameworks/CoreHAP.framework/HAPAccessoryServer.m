@implementation HAPAccessoryServer

- (unint64_t)wakeNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t wakeNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  wakeNumber = self->_wakeNumber;
  os_unfair_lock_unlock(p_lock);
  return wakeNumber;
}

- (int64_t)communicationProtocol
{
  return 1;
}

- (id)shortDescription
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = HAPIsInternalBuild();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    -[HAPAccessoryServer name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)identifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addInternalDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HAPAccessoryServer_addInternalDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)internalDelegateQueue
{
  return self->_internalDelegateQueue;
}

void __42__HAPAccessoryServer_addInternalDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "internalDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)internalDelegates
{
  return self->_internalDelegates;
}

- (unint64_t)configNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t configNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configNumber = self->_configNumber;
  os_unfair_lock_unlock(p_lock);
  return configNumber;
}

- (BOOL)isKnownToSystemCommissioner
{
  return 0;
}

- (HMFVersion)version
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[HMFVersion copy](self->_version, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HMFVersion *)v4;
}

- (void)setPrimaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessory, a3);
}

- (NSArray)accessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_accessories, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSData)setupHash
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_setupHash;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (OS_dispatch_queue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isReachable
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)productData
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_productData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HAPAccessoryServerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HAPAccessoryServerDelegate *)WeakRetained;
}

- (void)setAccessories:(id)a3
{
  NSArray *v4;
  NSArray *accessories;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  accessories = self->_accessories;
  self->_accessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    -[HAPAccessoryServer disconnectOnIdleUpdated](self, "disconnectOnIdleUpdated");
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  HAPAccessoryServerDelegate **p_delegate;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *delegateQueue;
  id obj;

  obj = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  p_delegate = &self->_delegate;
  if (obj && v6)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v8 = (OS_dispatch_queue *)v6;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v8;
  }
  else
  {
    objc_storeWeak((id *)p_delegate, 0);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isSecuritySessionOpen
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_securitySessionOpen;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HAPAccessoryServer)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPAccessoryServer)initWithKeystore:(id)a3
{
  id v4;
  HAPAccessoryServer *v5;
  HAPAccessoryServer *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalDelegateQueue;
  uint64_t v16;
  NSHashTable *internalDelegates;
  uint64_t v18;
  NSHashTable *notificationClients;
  NSString *reachabilityChangedReason;
  NSMutableDictionary *v21;
  NSMutableDictionary *localPairingMetricDictionary;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HAPAccessoryServer;
  v5 = -[HAPAccessoryServer init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (const char *)HAPDispatchQueueName(v5, CFSTR("clientQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2(v7, v8, v9);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = (const char *)HAPDispatchQueueName(v6, CFSTR("delegateQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2(v12, v13, v9);
    internalDelegateQueue = v6->_internalDelegateQueue;
    v6->_internalDelegateQueue = (OS_dispatch_queue *)v14;

    objc_storeWeak((id *)&v6->_keyStore, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    internalDelegates = v6->_internalDelegates;
    v6->_internalDelegates = (NSHashTable *)v16;

    *(_WORD *)&v6->_reachable = 1;
    v6->_authMethod = 5;
    v6->_reachabilityPingEnabled = 0;
    v6->_sessionRestoreActive = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    notificationClients = v6->_notificationClients;
    v6->_notificationClients = (NSHashTable *)v18;

    v6->_shouldDisconnectOnIdle = 0;
    v6->_successfulPingCount = 0;
    v6->_failedPingCount = 0;
    v6->_hasAdvertisement = 1;
    reachabilityChangedReason = v6->_reachabilityChangedReason;
    v6->_reachabilityChangedReason = (NSString *)CFSTR("Unknown");

    v6->_supportsUnreachablePing = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    localPairingMetricDictionary = v6->_localPairingMetricDictionary;
    v6->_localPairingMetricDictionary = v21;

  }
  return v6;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
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

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[HAPAccessoryServer accessories](self, "accessories", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setReachable:", v3);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)shouldDisconnectOnIdle
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)reachabilityPingEnabled
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachabilityPingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachabilityPingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSessionRestoreActive
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_sessionRestoreActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSessionRestoreActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sessionRestoreActive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_securitySessionOpen = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pendingRemovePairing
{
  os_unfair_lock_s *p_lock;
  unint64_t pendingRemovePairing;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pendingRemovePairing = self->_pendingRemovePairing;
  os_unfair_lock_unlock(p_lock);
  return pendingRemovePairing;
}

- (void)setPendingRemovePairing:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pendingRemovePairing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasPairings
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasPairings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasPairings:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int hasPairings;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  HAPAccessoryServer *v12;
  char v13;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  hasPairings = self->_hasPairings;
  if (hasPairings != v3)
    self->_hasPairings = v3;
  if (self->_pendingRemovePairing)
  {
    self->_pendingRemovePairing = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    if (hasPairings == v3)
      return;
  }
  -[HAPAccessoryServer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__HAPAccessoryServer_setHasPairings___block_invoke;
      block[3] = &unk_1E894C050;
      v11 = v7;
      v12 = self;
      v13 = v3;
      dispatch_async(v9, block);

    }
  }

}

- (HAPDeviceID)deviceID
{
  HAPDeviceID *v3;
  void *v4;
  HAPDeviceID *v5;

  v3 = [HAPDeviceID alloc];
  -[HAPAccessoryServer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPDeviceID initWithDeviceIDString:](v3, "initWithDeviceIDString:", v4);

  return v5;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSetupHash:(id)a3
{
  NSData *v4;
  NSData *setupHash;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSData *)objc_msgSend(v6, "copy");
  setupHash = self->_setupHash;
  self->_setupHash = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)authMethod
{
  os_unfair_lock_s *p_lock;
  unint64_t authMethod;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  authMethod = self->_authMethod;
  os_unfair_lock_unlock(p_lock);
  return authMethod;
}

- (void)setAuthMethod:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_authMethod = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  HAPAccessoryServer *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_lock_with_options();
  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", v4))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_name, v5);
    os_unfair_lock_unlock(&self->_lock);
    -[HAPAccessoryServer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __30__HAPAccessoryServer_setName___block_invoke;
        block[3] = &unk_1E894E120;
        v10 = v6;
        v11 = self;
        v12 = v5;
        dispatch_async(v8, block);

      }
    }

  }
}

- (NSNumber)category
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_category;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCategory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  HAPAccessoryServer *v11;
  id v12;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  if ((-[NSNumber isEqual:](self->_category, "isEqual:", v5) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_category, a3);
    os_unfair_lock_unlock(&self->_lock);
    -[HAPAccessoryServer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34__HAPAccessoryServer_setCategory___block_invoke;
        block[3] = &unk_1E894E120;
        v10 = v6;
        v11 = self;
        v12 = v5;
        dispatch_async(v8, block);

      }
    }

  }
}

- (void)setProductData:(id)a3
{
  NSString *v4;
  NSString *productData;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfigNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setWakeNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wakeNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setStateNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_stateNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)stateNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t stateNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  stateNumber = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return stateNumber;
}

- (void)setCompatibilityFeatures:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_compatibilityFeatures = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)compatibilityFeatures
{
  os_unfair_lock_s *p_lock;
  unint64_t compatibilityFeatures;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  compatibilityFeatures = self->_compatibilityFeatures;
  os_unfair_lock_unlock(p_lock);
  return compatibilityFeatures;
}

- (void)setVersion:(id)a3
{
  HMFVersion *v4;
  HMFVersion *version;

  v4 = (HMFVersion *)a3;
  os_unfair_lock_lock_with_options();
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPairSetupType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pairSetupType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pairSetupType
{
  os_unfair_lock_s *p_lock;
  unint64_t pairSetupType;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pairSetupType = self->_pairSetupType;
  os_unfair_lock_unlock(p_lock);
  return pairSetupType;
}

- (NSUUID)commissioningID
{
  return 0;
}

- (NSNumber)vendorID
{
  return 0;
}

- (NSNumber)productID
{
  return 0;
}

- (NSData)rootPublicKey
{
  return 0;
}

- (NSNumber)nodeID
{
  return 0;
}

- (BOOL)requiresThreadRouter
{
  return 0;
}

- (BOOL)hasAdvertisement
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAdvertisement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAdvertisement = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)reachabilityChangedReason
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_reachabilityChangedReason;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReachabilityChangedReason:(id)a3
{
  NSString *v4;
  NSString *reachabilityChangedReason;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  reachabilityChangedReason = self->_reachabilityChangedReason;
  self->_reachabilityChangedReason = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConnectionStartTime:(id)a3
{
  NSDate *v4;
  NSDate *connectionStartTime;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  connectionStartTime = self->_connectionStartTime;
  self->_connectionStartTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)connectionStartTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_connectionStartTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPairingMetricWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localPairingMetricDictionary, "setObject:forKeyedSubscript:", v6, v7);
  os_unfair_lock_unlock(&self->_metriclock);

}

- (void)clearPairingMetrics
{
  os_unfair_lock_s *p_metriclock;

  p_metriclock = &self->_metriclock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeAllObjects](self->_localPairingMetricDictionary, "removeAllObjects");
  os_unfair_lock_unlock(p_metriclock);
}

- (NSDictionary)pairingMetricDictionary
{
  os_unfair_lock_s *p_metriclock;
  void *v4;

  p_metriclock = &self->_metriclock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_localPairingMetricDictionary, "copy");
  os_unfair_lock_unlock(p_metriclock);
  return (NSDictionary *)v4;
}

- (void)authenticateAccessory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)provisionToken:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)tearDownSessionOnAuthCompletion
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)validatePairingAuthMethod:(id)a3
{
  void *v3;
  void (**v4)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))MEMORY[0x1D17B7400](a3, a2);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3, 0);

  }
}

- (BOOL)isPaired
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)matchesSetupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HAPAccessoryServer setupHash](self, "setupHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HAPValidateSetupHash(v5, v6, v4);

  return v7;
}

- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (v7)
      goto LABEL_6;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!-[HAPAccessoryServer matchesSetupID:](self, "matchesSetupID:", v6))
    goto LABEL_7;
  if (v8)
  {
LABEL_6:
    -[HAPAccessoryServer identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)continuePairingAfterAuthPrompt
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)continuePairingUsingWAC
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)startPairingWithRequest:(id)a3
{
  -[HAPAccessoryServer startPairingWithConsentRequired:config:ownershipToken:](self, "startPairingWithConsentRequired:config:ownershipToken:", 0, 0, 0);
}

- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  HAPPairingIdentity *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  HAPAccessoryServer *v29;
  id v30;
  char v31;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[HAPAccessoryServer keyBag](self, "keyBag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v13);

  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __97__HAPAccessoryServer_removePairingIdentifier_pairingPublicKey_completionQueue_completionHandler___block_invoke;
  v27 = &unk_1E894C078;
  v29 = self;
  v30 = v11;
  v31 = v17;
  v28 = v10;
  v18 = v11;
  v19 = v10;
  v20 = (void *)MEMORY[0x1D17B7400](&v24);
  v21 = objc_alloc(MEMORY[0x1E0D28658]);
  v22 = (void *)objc_msgSend(v21, "initWithPairingKeyData:", v12, v24, v25, v26, v27);

  v23 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v13, v22, 0, 0);
  -[HAPAccessoryServer removePairing:completionQueue:completionHandler:](self, "removePairing:completionQueue:completionHandler:", v23, v19, v20);

}

- (void)discoverAccessories
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = *MEMORY[0x1E0C99768];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = *MEMORY[0x1E0C99768];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = *MEMORY[0x1E0C99768];
  v14 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (BOOL)requiresTimedWrite:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v17;
  void *v18;
  HAPAccessoryServer *v19;
  NSObject *v20;
  void *v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPAccessoryServer supportsTimedWrite](self, "supportsTimedWrite"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v5)
    {
      v6 = v5;
      v23 = v4;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v26;
LABEL_4:
      v10 = 0;
      v11 = v7;
      v12 = v8;
      while (1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_msgSend(v13, "characteristic", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "service");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "instanceID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8 || v7 == 0)
          break;
        if ((objc_msgSend(v13, "timedWrite") & 1) != 0 || (objc_msgSend(v8, "properties") & 0x20) != 0)
        {
          v17 = 1;
LABEL_18:
          v4 = v23;
          goto LABEL_23;
        }
        ++v10;
        v11 = v7;
        v12 = v8;
        if (v6 == v10)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
          if (v6)
            goto LABEL_4;
          v17 = 0;
          goto LABEL_18;
        }
      }
      v18 = (void *)MEMORY[0x1D17B7244]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v4 = v23;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v21;
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to check prepare characteristic write requests for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v17 = 0;
LABEL_23:

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)removeInternalDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HAPAccessoryServer_removeInternalDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)enumerateInternalDelegatesUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServer_enumerateInternalDelegatesUsingBlock___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)pingSupported
{
  return 0;
}

- (void)startPing
{
  void *v3;
  HAPAccessoryServer *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Ping called -- NOP", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)stopPing
{
  void *v3;
  HAPAccessoryServer *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop ping called -- NOP", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isPinging
{
  return 0;
}

- (void)registerForNotifications:(id)a3
{
  id v4;
  NSHashTable *notificationClients;
  void *v6;
  HAPAccessoryServer *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    -[NSHashTable addObject:](notificationClients, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering client for accessory server notification %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)unregisterForNotifications:(id)a3
{
  id v4;
  NSHashTable *notificationClients;
  void *v6;
  HAPAccessoryServer *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
    -[NSHashTable removeObject:](notificationClients, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing client from accessory server notification %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4
{
  NSHashTable *notificationClients;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HAPAccessoryServer *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  HAPAccessoryServer *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  int v27;
  __int128 v29;
  id obj;
  char v32;
  id v33;
  uint64_t v34;
  HAPAccessoryServer *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    v6 = (void *)-[NSHashTable copy](notificationClients, "copy");
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      v35 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v6, "count");
        +[HAPNotification typeToString:](HAPNotification, "typeToString:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v9;
        v43 = 2048;
        v44 = v10;
        v45 = 2112;
        v46 = v11;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying %ld clients for %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      if (v33)
      {
        objc_msgSend(v33, "hmf_numberForKey:", CFSTR("HAPAccessoryInstanceID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = v6;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v17)
      {
        v32 = 0;
        v34 = *(_QWORD *)v37;
        *(_QWORD *)&v18 = 138543874;
        v29 = v18;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v37 != v34)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v20, "hapInstanceId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v21 = 0;
            }
            v22 = (void *)MEMORY[0x1D17B7244]();
            v23 = v35;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v42 = v25;
              v43 = 2112;
              v44 = (uint64_t)v12;
              v45 = 2112;
              v46 = v21;
              _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@Attempt to notify client dictionary instanceID %@ clientInstanceId %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v22);
            if (v21)
              v26 = v12 != 0;
            else
              v26 = 0;
            if (!v26 || (v27 = objc_msgSend(v21, "intValue"), v27 == objc_msgSend(v12, "intValue")))
            {
              objc_msgSend(v20, "indicateNotificationFromServer:notifyType:withDictionary:", v23, a3, v33, v29);
              v32 = 1;
            }

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v17);
      }
      else
      {
        v32 = 0;
      }

      goto LABEL_33;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v16;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Notification client does not exist", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  v32 = 0;
LABEL_33:

  return v32 & 1;
}

- (void)setSuspendedAccessory:(id)a3
{
  id v5;
  void *v6;
  HAPAccessoryServer *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_suspendedAccessory, a3);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating the server's suspended accessory to: '%@'", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HAPAccessoryServer *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10
    && (objc_msgSend(v10, "identifier"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("HAPAccessoryReachable"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("HAPAccessoryInstance"));
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("HAPAccessoryIdentifier"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("HAPAccessoryLinkType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("HAPAccessoryError"));

    objc_msgSend(v11, "instanceID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v11, "instanceID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("HAPAccessoryInstanceID"));

    }
    v20 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@*** failed to build reachability notify dictionary -- invalid accessory or identifier %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (void)incrementSuccessfulPing
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_successfulPingCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementFailedPing
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_failedPingCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateAccessoryInfoDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSArray count](self->_accessories, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_accessories, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manufacturer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_category;
    objc_msgSend(v5, "firmwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("manufacturer"));
    v10 = v11;
    if (v7)
    {
      objc_msgSend(v11, "setObject:forKey:", v7, CFSTR("product"));
      v10 = v11;
    }
    if (v9)
    {
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("firmwareVersion"));
      v10 = v11;
    }
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("category"));
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v8 = 0;
    v9 = 0;
    v7 = 0;
    v6 = 0;
  }

}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  void *v4;
  HAPMetricsPairVerifyEvent *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  HAPMetricsPairVerifyEvent *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[HAPAccessoryServer metric_pairVerifyDurationInMS](self, "metric_pairVerifyDurationInMS"))
  {
    -[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [HAPMetricsPairVerifyEvent alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HAPAccessoryServer linkType](self, "linkType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HAPAccessoryServer metric_pairVerifyDurationInMS](self, "metric_pairVerifyDurationInMS");
      -[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer metric_pairVerifyConnectionEstablishedBy](self, "metric_pairVerifyConnectionEstablishedBy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HAPMetricsPairVerifyEvent initWithAccessory:forLinkType:durationInMS:reason:connectionEstablishedUsing:pvError:](v5, "initWithAccessory:forLinkType:durationInMS:reason:connectionEstablishedUsing:pvError:", self, v6, v7, v8, v9, v12);

      +[HAPMetricsDispatcher sharedInstance](HAPMetricsDispatcher, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitLogEvent:", v10);

    }
  }
  -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", 0);
  -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", 0);

}

- (void)disconnectWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)disconnect
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)getControllerUserName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  HAPAccessoryServer *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  -[HAPAccessoryServer getControllerPairingIdentityWithError:](self, "getControllerPairingIdentityWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = 0;
  if (!v4)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Using default controller username : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (id)getControllerPairingIdentityWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[HAPAccessoryServer useHH2](self, "useHH2")
    || (-[HAPAccessoryServer keyBag](self, "keyBag"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "currentIdentity"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "readControllerPairingKeyForAccessory:error:", v8, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)initializeKeyBagIfNecessary
{
  os_unfair_lock_s *p_lock;
  HAPKeyBag *v4;
  NSString *identifier;
  id WeakRetained;
  HAPKeyBag *v7;
  HAPKeyBag *keyBag;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_keyBag)
    goto LABEL_4;
  if (self->_identifier)
  {
    v4 = [HAPKeyBag alloc];
    identifier = self->_identifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);
    v7 = -[HAPKeyBag initWithAccessoryIdentifier:keyStore:](v4, "initWithAccessoryIdentifier:keyStore:", identifier, WeakRetained);
    keyBag = self->_keyBag;
    self->_keyBag = v7;

LABEL_4:
    os_unfair_lock_unlock(p_lock);
    return;
  }
  _HMFPreconditionFailure();
  __break(1u);
}

- (void)refreshKeyBag
{
  id v2;

  -[HAPAccessoryServer keyBag](self, "keyBag");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshKeys");

}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  HAPAccessoryServer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HAPAccessoryServer *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HAPAccessoryServer useHH2](self, "useHH2");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v10;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@PV failed with error: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14
      && (objc_msgSend(v14, "domain"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = HMFEqualObjects(),
          v15,
          v16)
      && objc_msgSend(v14, "code") == -6754)
    {
      -[HAPAccessoryServer identifier](v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:](v8, "disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v17);

      -[HAPAccessoryServer keyBag](v8, "keyBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nextIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v19 != 0;
      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = v8;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v23)
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB37E8];
          -[HAPAccessoryServer keyBag](v21, "keyBag");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "getCurrentIndexInBag"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543874;
          v31 = v24;
          v32 = 2112;
          v33 = v27;
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to retry PV with next pairing Identity [%@]: %@", (uint8_t *)&v30, 0x20u);

        }
        objc_autoreleasePoolPop(v20);
      }
      else
      {
        if (v23)
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543362;
          v31 = v29;
          _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Not retrying PV as exhausted all the keys from the key bag.", (uint8_t *)&v30, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        -[HAPAccessoryServer refreshKeyBag](v21, "refreshKeyBag");
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  char v9;
  id v11;

  v4 = a3;
  -[HAPAccessoryServer keyStore](self, "keyStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v5, "isAccessoryAssociatedWithControllerKey:controllerID:", v6, &v11);
  v8 = v11;

  if (v7)
    v9 = objc_msgSend(v4, "isEqualToString:", v8);
  else
    v9 = 0;

  return v9;
}

- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4
{
  HAPPairingIdentity *v6;
  id v7;
  void *v8;
  HAPAccessoryServer *v9;
  NSObject *v10;
  void *v11;
  HAPPairingIdentity *v12;
  void *v13;
  void *v14;
  HAPPairingIdentity *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  HAPAccessoryServer *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  HAPPairingIdentity *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (HAPPairingIdentity *)a3;
  v7 = a4;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    v8 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary"));
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Establishing relationship with controller key: [%@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = [HAPPairingIdentity alloc];
    -[HAPAccessoryServer identifier](v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v7);
    v15 = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](v12, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", v13, v6, v14, 0, 0);

    -[HAPAccessoryServer keyStore](v9, "keyStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v17 = objc_msgSend(v16, "establishRelationshipBetweenAccessoryAndControllerKey:error:", v15, &v24);
    v18 = v24;

    if (!v17 || v18)
    {
      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = v9;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the accessory public key inside KeyChain: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    else
    {
      -[HAPAccessoryServer pairingRequest](v9, "pairingRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        -[HAPAccessoryServer refreshKeyBag](v9, "refreshKeyBag");
    }

  }
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    -[HAPAccessoryServer pairingRequest](self, "pairingRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIdentity");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;

LABEL_5:
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer associateAccessoryWithControllerKey:usingAccessoryPublicKey:](self, "associateAccessoryWithControllerKey:usingAccessoryPublicKey:", v8, v9);

      goto LABEL_6;
    }
    -[HAPAccessoryServer keyBag](self, "keyBag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HAPAccessoryServer *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    v5 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary"));
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer keyBag](v6, "keyBag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v8;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@PV Succeeded using [%{public}@]", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPAccessoryServer keyBag](v6, "keyBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HAPAccessoryServer isAccessoryAssociatedWithControllerKey:](v6, "isAccessoryAssociatedWithControllerKey:", v14);

    if (!v15)
    {
      -[HAPAccessoryServer keyStore](v6, "keyStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v16, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v4, 0, &v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;

      if (!v17 || v18)
      {
        v19 = (void *)MEMORY[0x1D17B7244]();
        v20 = v6;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v22;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
      else
      {
        -[HAPAccessoryServer associateAccessoryWithControllerKeyUsingAccessoryPublicKey:](v6, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v17);
      }

    }
  }

}

- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HAPAccessoryServer *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    -[HAPAccessoryServer keyBag](self, "keyBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HAPAccessoryServer isAccessoryAssociatedWithControllerKey:](self, "isAccessoryAssociatedWithControllerKey:", v7);

    if (v8)
    {
      -[HAPAccessoryServer keyStore](self, "keyStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v9, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v4, 0, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;

      if (!v10 || v11)
      {
        v12 = (void *)MEMORY[0x1D17B7244]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v15;
          v19 = 2112;
          v20 = v11;
          _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
      }
      else
      {
        -[HAPAccessoryServer associateAccessoryWithControllerKey:usingAccessoryPublicKey:](self, "associateAccessoryWithControllerKey:usingAccessoryPublicKey:", 0, v10);
        -[HAPAccessoryServer refreshKeyBag](self, "refreshKeyBag");
      }

    }
  }

}

- (BOOL)doesPeriodicSessionChecks
{
  return 0;
}

- (unint64_t)sessionCheckInterval
{
  return 0;
}

- (unint64_t)numActiveSessionClients
{
  return 0;
}

- (BOOL)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  HAPAccessoryServer *v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = *a4;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960542);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v8, "isEqual:", v9);

      if ((v8 & 1) == 0)
      {
        +[HAPTLVParser parserWithData:](HAPTLVParser, "parserWithData:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "parseResponseForNumber:", 6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "parseResponseForNumber:", 7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *a4;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960596);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqual:", v16))
        {
          v17 = objc_msgSend(v13, "unsignedCharValue");

          if (v17 == 3)
            goto LABEL_17;
        }
        else
        {

        }
        v18 = *a4;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960569);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = objc_msgSend(v18, "isEqual:", v19);

        if (!(_DWORD)v18)
          goto LABEL_20;
        if (v13)
        {
          v10 = 1;
          if (objc_msgSend(v13, "unsignedIntValue") != 4 || !v14)
            goto LABEL_21;
        }
        else if (!v14)
        {
LABEL_20:
          v10 = 1;
LABEL_21:

          goto LABEL_5;
        }
        if (objc_msgSend(&unk_1E8989B88, "containsObject:", v14))
        {
LABEL_17:
          v20 = (void *)MEMORY[0x1D17B7244]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *a4;
            v25 = 138543618;
            v26 = v23;
            v27 = 2112;
            v28 = v24;
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Overwriting the security session error code: %@", (uint8_t *)&v25, 0x16u);

          }
          objc_autoreleasePoolPop(v20);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960542);
          v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (BOOL)useHH2
{
  if (-[HAPAccessoryServer unitTest_useHH2](self, "unitTest_useHH2"))
    return 1;
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  return HAPIsHH2Enabled_hh2Enabled;
}

- (NSHashTable)notificationClients
{
  return self->_notificationClients;
}

- (void)setNotificationClients:(id)a3
{
  objc_storeStrong((id *)&self->_notificationClients, a3);
}

- (int)successfulPingCount
{
  return self->_successfulPingCount;
}

- (void)setSuccessfulPingCount:(int)a3
{
  self->_successfulPingCount = a3;
}

- (int)failedPingCount
{
  return self->_failedPingCount;
}

- (void)setFailedPingCount:(int)a3
{
  self->_failedPingCount = a3;
}

- (BOOL)supportsUnreachablePing
{
  return self->_supportsUnreachablePing;
}

- (void)setSupportsUnreachablePing:(BOOL)a3
{
  self->_supportsUnreachablePing = a3;
}

- (NSMutableDictionary)localPairingMetricDictionary
{
  return self->_localPairingMetricDictionary;
}

- (void)setLocalPairingMetricDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_localPairingMetricDictionary, a3);
}

- (HAPAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (int64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (BOOL)supportsTimedWrite
{
  return self->_supportsTimedWrite;
}

- (void)setSupportsTimedWrite:(BOOL)a3
{
  self->_supportsTimedWrite = a3;
}

- (BOOL)isBLELinkConnected
{
  return self->_bleLinkConnected;
}

- (BOOL)unitTest_useHH2
{
  return self->_unitTest_useHH2;
}

- (void)setUnitTest_useHH2:(BOOL)a3
{
  self->_unitTest_useHH2 = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (BOOL)isIncompatibleUpdate
{
  return self->_incompatibleUpdate;
}

- (void)setIncompatibleUpdate:(BOOL)a3
{
  self->_incompatibleUpdate = a3;
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_loadWeakRetained((id *)&self->_keyStore);
}

- (HAPKeyBag)keyBag
{
  return self->_keyBag;
}

- (void)setKeyBag:(id)a3
{
  objc_storeStrong((id *)&self->_keyBag, a3);
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (void)setPairingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pairingRequest, a3);
}

- (HMFActivity)pairingActivity
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_pairingActivity);
}

- (void)setPairingActivity:(id)a3
{
  objc_storeWeak((id *)&self->_pairingActivity, a3);
}

- (unint64_t)metric_pairVerifyDurationInMS
{
  return self->_metric_pairVerifyDurationInMS;
}

- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3
{
  self->_metric_pairVerifyDurationInMS = a3;
}

- (NSString)metric_pairVerifyReason
{
  return self->_metric_pairVerifyReason;
}

- (void)setMetric_pairVerifyReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)metric_pairVerifyConnectionEstablishedBy
{
  return self->_metric_pairVerifyConnectionEstablishedBy;
}

- (void)setMetric_pairVerifyConnectionEstablishedBy:(id)a3
{
  objc_storeStrong((id *)&self->_metric_pairVerifyConnectionEstablishedBy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric_pairVerifyConnectionEstablishedBy, 0);
  objc_storeStrong((id *)&self->_metric_pairVerifyReason, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegates, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong((id *)&self->_localPairingMetricDictionary, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_connectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationClients, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __59__HAPAccessoryServer_enumerateInternalDelegatesUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id location;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "internalDelegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_initWeak(&location, *(id *)(*((_QWORD *)&v10 + 1) + 8 * v5));
        if (!v15)
        {
          v6 = objc_loadWeakRetained(&location);
          v7 = v6 == 0;

          if (!v7)
          {
            v8 = *(_QWORD *)(a1 + 40);
            v9 = objc_loadWeakRetained(&location);
            (*(void (**)(uint64_t, id, char *))(v8 + 16))(v8, v9, &v15);

          }
        }
        objc_destroyWeak(&location);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v3);
  }

}

void __45__HAPAccessoryServer_removeInternalDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "internalDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __97__HAPAccessoryServer_removePairingIdentifier_pairingPublicKey_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  v4 = v5;
  if (!v5 && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
    objc_msgSend(*(id *)(a1 + 40), "refreshKeyBag");
    v4 = 0;
  }

}

uint64_t __34__HAPAccessoryServer_setCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didUpdateCategory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __30__HAPAccessoryServer_setName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didUpdateName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __37__HAPAccessoryServer_setHasPairings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didUpdateHasPairings:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
