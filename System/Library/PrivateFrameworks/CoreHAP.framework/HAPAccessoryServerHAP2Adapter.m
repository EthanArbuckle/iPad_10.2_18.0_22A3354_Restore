@implementation HAPAccessoryServerHAP2Adapter

- (HAPAccessoryServerHAP2Adapter)initWithOperationQueue:(id)a3 accessoryServer:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HAPAccessoryServerHAP2Adapter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessory *v16;
  void *v17;
  HAPAccessory *v18;
  uint64_t v19;
  NSArray *accessories;
  void *v21;
  double v22;
  HAP2AccessorySessionInfo *sessionInfo;
  HAPAccessoryServerHAP2Adapter *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[HAPSystemKeychainStore systemStore](HAPSystemKeychainStore, "systemStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  v10 = -[HAPAccessoryServer initWithKeystore:](&v26, sel_initWithKeystore_, v9);

  if (v10)
  {
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceForKey:", CFSTR("HAPDefaultHAP2DisconnectOnIdleTimeoutSeconds"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v10->super._name, v11);
    objc_storeStrong((id *)&v10->super._identifier, v13);
    objc_storeStrong((id *)&v10->_operationQueue, a3);
    v16 = [HAPAccessory alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPAccessory initWithServer:instanceID:](v16, "initWithServer:instanceID:", v10, v17);

    -[HAPAccessory setName:](v18, "setName:", v11);
    -[HAPAccessory setIdentifier:](v18, "setIdentifier:", v13);
    -[HAPAccessory setServerIdentifier:](v18, "setServerIdentifier:", v13);
    -[HAPAccessory setPrimary:](v18, "setPrimary:", 1);
    objc_storeStrong((id *)&v10->_primaryAccessory, v18);
    v27[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    accessories = v10->_accessories;
    v10->_accessories = (NSArray *)v19;

    -[HAPAccessoryServer setHasPairings:](v10, "setHasPairings:", objc_msgSend(v8, "hasPairings"));
    -[HAPAccessoryServer setSupportsUnreachablePing:](v10, "setSupportsUnreachablePing:", 1);
    if (v15)
    {
      objc_msgSend(v15, "numberValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v10->_disconnectOnIdleTimeout = v22;

    }
    else
    {
      v10->_disconnectOnIdleTimeout = 30.0;
    }
    sessionInfo = v10->_sessionInfo;
    v10->_sessionInfo = 0;

    v24 = v10;
  }

  return v10;
}

- (HAPAccessoryServerHAP2Adapter)initWithUnpairedServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HAPAccessoryServerHAP2Adapter *v8;
  HAPAccessoryServerHAP2Adapter *v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA376F0))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPAccessoryServerHAP2Adapter initWithOperationQueue:accessoryServer:](self, "initWithOperationQueue:accessoryServer:", v7, v4);

  if (v8)
  {
    v8->_internallyPaired = 0;
    objc_storeStrong((id *)&v8->_unpairedServer, v5);
    objc_msgSend(v6, "setDelegate:", v8);
    v9 = v8;
  }

  return v8;
}

- (HAPAccessoryServerHAP2Adapter)initWithPairedServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HAPAccessoryServerHAP2Adapter *v8;
  HAPAccessoryServerHAP2Adapter *v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA37D98))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPAccessoryServerHAP2Adapter initWithOperationQueue:accessoryServer:](self, "initWithOperationQueue:accessoryServer:", v7, v4);

  if (v8)
  {
    v8->_internallyPaired = 1;
    objc_storeStrong((id *)&v8->_pairedServer, v5);
    objc_msgSend(v6, "setDelegate:", v8);
    v9 = v8;
  }

  return v8;
}

- (void)setUnpairedServer:(id)a3
{
  id v5;
  NSObject *v6;
  HAP2UnpairedAccessoryServer *v7;
  HAP2PairedAccessoryServer *v8;
  HAP2PairedAccessoryServer *pairedServer;
  int v10;
  HAPAccessoryServerHAP2Adapter *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%@ Received an unpaired server: %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v7 = self->_unpairedServer;
  v8 = self->_pairedServer;
  objc_storeStrong((id *)&self->_unpairedServer, a3);
  pairedServer = self->_pairedServer;
  self->_pairedServer = 0;

  self->_internallyPaired = 0;
  os_unfair_lock_unlock(&self->super._lock);
  if (v7 && (-[HAP2UnpairedAccessoryServer isEqual:](v7, "isEqual:", v5) & 1) == 0)
    -[HAP2UnpairedAccessoryServer setDelegate:](v7, "setDelegate:", 0);
  if (v8)
    -[HAP2PairedAccessoryServer setDelegate:](v8, "setDelegate:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  -[HAPAccessoryServer setHasPairings:](self, "setHasPairings:", objc_msgSend(v5, "hasPairings"));

}

- (void)setPairedServer:(id)a3
{
  id v5;
  NSObject *v6;
  HAP2UnpairedAccessoryServer *v7;
  HAP2PairedAccessoryServer *v8;
  HAP2UnpairedAccessoryServer *unpairedServer;
  NSObject *v10;
  int v11;
  HAPAccessoryServerHAP2Adapter *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%@ Received a paired server: %@", (uint8_t *)&v11, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v7 = self->_unpairedServer;
  v8 = self->_pairedServer;
  objc_storeStrong((id *)&self->_pairedServer, a3);
  unpairedServer = self->_unpairedServer;
  self->_unpairedServer = 0;

  self->_internallyPaired = 1;
  os_unfair_lock_unlock(&self->super._lock);
  if (v7)
    -[HAP2UnpairedAccessoryServer setDelegate:](v7, "setDelegate:", 0);
  if (v8 && (-[HAP2PairedAccessoryServer isEqual:](v8, "isEqual:", v5) & 1) == 0)
    -[HAP2PairedAccessoryServer setDelegate:](v8, "setDelegate:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  -[HAPAccessoryServer setHasPairings:](self, "setHasPairings:", objc_msgSend(v5, "hasPairings"));
  if (-[HAPAccessoryServerHAP2Adapter shouldDiscoverAccessoriesOncePaired](self, "shouldDiscoverAccessoriesOncePaired"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_debug_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%@ Discovering accessories now that we're paired", (uint8_t *)&v11, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter setDiscoverAccessoriesOncePaired:](self, "setDiscoverAccessoriesOncePaired:", 0);
    -[HAPAccessoryServerHAP2Adapter discoverAccessories](self, "discoverAccessories");
  }

}

- (void)setShouldBePaired:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_internallyPaired = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSessionInfoWithNumIPsResolved:(unint64_t)a3 numIPsTried:(unint64_t)a4 numBonjourNames:(unint64_t)a5
{
  HAP2AccessorySessionInfo *v6;

  v6 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:]([HAP2AccessorySessionInfo alloc], "initWithNumIPs:numIPsTried:numBonjourNames:", a3, a4, a5);
  -[HAPAccessoryServerHAP2Adapter setSessionInfo:](self, "setSessionInfo:", v6);

}

- (id)activeServer
{
  os_unfair_lock_s *p_lock;
  HAP2PairedAccessoryServer *v4;
  HAP2UnpairedAccessoryServer *unpairedServer;
  HAP2UnpairedAccessoryServer *v6;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pairedServer;
  unpairedServer = v4;
  if (!v4)
    unpairedServer = self->_unpairedServer;
  v6 = unpairedServer;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)clientQueue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  -[HAPAccessoryServer clientQueue](&v3, sel_clientQueue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HAP2Cancelable)pairingSessionCancelable
{
  os_unfair_lock_s *p_lock;
  HAP2Cancelable *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pairingSessionCancelable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPairingSessionCancelable:(id)a3
{
  HAP2Cancelable *v4;
  HAP2Cancelable *pairingSessionCancelable;

  v4 = (HAP2Cancelable *)a3;
  os_unfair_lock_lock_with_options();
  pairingSessionCancelable = self->_pairingSessionCancelable;
  self->_pairingSessionCancelable = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (id)setupCodeCompletion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1D17B7400](self->_setupCodeCompletion);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSetupCodeCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id setupCodeCompletion;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B7400](v5);

  setupCodeCompletion = self->_setupCodeCompletion;
  self->_setupCodeCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)userConsentCompletion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1D17B7400](self->_userConsentCompletion);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUserConsentCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id userConsentCompletion;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B7400](v5);

  userConsentCompletion = self->_userConsentCompletion;
  self->_userConsentCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldSkipUserConsent
{
  HAPAccessoryServerHAP2Adapter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_skipUserConsent;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)authValidationCompletion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1D17B7400](self->_authValidationCompletion);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAuthValidationCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id authValidationCompletion;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B7400](v5);

  authValidationCompletion = self->_authValidationCompletion;
  self->_authValidationCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)softwareAuthFinishedCompletion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1D17B7400](self->_softwareAuthFinishedCompletion);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSoftwareAuthFinishedCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id softwareAuthFinishedCompletion;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B7400](v5);

  softwareAuthFinishedCompletion = self->_softwareAuthFinishedCompletion;
  self->_softwareAuthFinishedCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)authenticateUUIDCompletion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1D17B7400](self->_authenticateUUIDCompletion);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAuthenticateUUIDCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id authenticateUUIDCompletion;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B7400](v5);

  authenticateUUIDCompletion = self->_authenticateUUIDCompletion;
  self->_authenticateUUIDCompletion = v6;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldDiscoverAccessoriesOncePaired
{
  HAPAccessoryServerHAP2Adapter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_discoverAccessoriesOncePaired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDiscoverAccessoriesOncePaired:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_discoverAccessoriesOncePaired = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateActiveDisconnectOnIdleTimeout:(double)a3
{
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__HAPAccessoryServerHAP2Adapter_updateActiveDisconnectOnIdleTimeout___block_invoke;
  v6[3] = &unk_1E894E078;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  objc_msgSend(v5, "addBlock:", v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_handleConnectionIdleTimeout
{
  void *v3;
  NSObject *v4;
  int v5;
  HAPAccessoryServerHAP2Adapter *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAPAccessoryServerHAP2Adapter onDemandConnectionsAreEnabled](self, "onDemandConnectionsAreEnabled"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%@ The connection idle timer fired, disconnecting...", (uint8_t *)&v5, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter closeSessions](self, "closeSessions");
  }
}

- (void)_startConnectionIdleTimer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  HAPAccessoryServerHAP2Adapter *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (-[HAPAccessoryServerHAP2Adapter onDemandConnectionsAreEnabled](self, "onDemandConnectionsAreEnabled"))
  {
    -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0D286C8]);
      -[HAPAccessoryServerHAP2Adapter disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout");
      v6 = (void *)objc_msgSend(v5, "initWithTimeInterval:options:", 0);
      -[HAPAccessoryServerHAP2Adapter setConnectionIdleTimer:](self, "setConnectionIdleTimer:", v6);

      -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

    }
  }
  -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeInterval");
      v14 = 138412546;
      v15 = self;
      v16 = 2048;
      v17 = v12;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%@ Starting connection idle timer of: %fs", (uint8_t *)&v14, 0x16u);

    }
    -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

  }
}

- (void)_suspendConnectionIdleTimer
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  HAPAccessoryServerHAP2Adapter *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeInterval");
      v10 = 138412546;
      v11 = self;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%@ Suspending connection idle timer of: %fs", (uint8_t *)&v10, 0x16u);

    }
    -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    -[HAPAccessoryServerHAP2Adapter setConnectionIdleTimer:](self, "setConnectionIdleTimer:", 0);
  }
}

- (void)_kickConnectionIdleTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  HAPAccessoryServerHAP2Adapter *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Kicking connection idle timer", (uint8_t *)&v7, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter connectionIdleTimer](self, "connectionIdleTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resume");

  }
}

- (void)disconnectOnIdleUpdated
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HAPAccessoryServerHAP2Adapter_disconnectOnIdleUpdated__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isReachable
{
  void *v2;
  uint64_t v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionState");

  return (unint64_t)(v3 - 1) < 4;
}

- (id)category
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)version
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protocolVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)setupHash
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)configNumber
{
  void *v2;
  unint64_t v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "configNumber");

  return v3;
}

- (BOOL)hasAdvertisement
{
  void *v2;
  char v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDiscoveryAdvertisement");

  return v3;
}

- (id)reachabilityChangedReason
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reachabilityChangedReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_accessories, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccessories:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *accessories;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerHAP2Adapter_setAccessories___block_invoke;
  v7[3] = &unk_1E894B3F0;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  if (!*((_BYTE *)v9 + 24))
  {
    os_unfair_lock_lock_with_options();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    accessories = self->_accessories;
    self->_accessories = v5;

    os_unfair_lock_unlock(&self->super._lock);
  }
  _Block_object_dispose(&v8, 8);

}

- (int64_t)linkLayerType
{
  return 4;
}

- (int64_t)linkType
{
  return 1;
}

- (id)primaryAccessory
{
  os_unfair_lock_s *p_lock;
  HAPAccessory *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryAccessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPrimaryAccessory:(id)a3
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)isSecuritySessionOpen
{
  void *v2;
  BOOL v3;

  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionState") == 3;

  return v3;
}

- (void)setSecuritySessionOpen:(BOOL)a3
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
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)supportsTimedWrite
{
  return 1;
}

- (id)productData
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  v17[3] = &unk_1E894DD80;
  objc_copyWeak(&v21, &location);
  v14 = v12;
  v18 = v14;
  v15 = v11;
  v20 = v15;
  v22 = a3;
  v16 = v10;
  v19 = v16;
  objc_msgSend(v13, "addBlock:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  HAPAccessoryServerHAP2Adapter *v45;
  uint64_t v46;

  v8 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertCurrentQueue");

  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v41 = 0;
    v40 = 0;
    v15 = -[HAPAccessoryServerHAP2Adapter _hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:](self, "_hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:", v10, &v41, &v40);
    v16 = v41;
    v17 = v40;
    if (v15)
    {
      if ((unint64_t)objc_msgSend(v16, "count") < 2)
      {
        objc_msgSend(v16, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "values");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          objc_msgSend(v19, "values");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");

          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_3;
          v30[3] = &unk_1E894D048;
          v31 = v12;
          v32 = v11;
          v25 = (void *)MEMORY[0x1D17B7400](v30);
          objc_msgSend(v19, "accessory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v8)
            v28 = (id)objc_msgSend(v26, "enableNotificationsForCharacteristics:completion:", v24, v25);
          else
            v29 = (id)objc_msgSend(v26, "disableNotificationsForCharacteristics:completion:", v24, v25);

        }
        else
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2_190;
          v33[3] = &unk_1E894D498;
          v34 = v11;
          dispatch_async(v12, v33);
          v24 = v34;
        }

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v18 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = self;
          _os_log_error_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_189;
        block[3] = &unk_1E894D498;
        v36 = v11;
        dispatch_async(v12, block);
        v19 = v36;
      }
    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
      v37[3] = &unk_1E894D5E0;
      v39 = v11;
      v38 = v17;
      dispatch_async(v12, v37);

      v19 = v39;
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v20 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = self;
      _os_log_error_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%@ Cannot update notification configuration while unpaired", buf, 0xCu);
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    v42[3] = &unk_1E894D498;
    v43 = v11;
    dispatch_async(v12, v42);
    v16 = v43;
  }

}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[HAPAccessoryServerHAP2Adapter unpairedServer](self, "unpairedServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[HAPAccessoryServerHAP2Adapter clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HAPAccessoryServerHAP2Adapter_identifyWithCompletion___block_invoke;
    block[3] = &unk_1E894D498;
    v9 = v4;
    dispatch_async(v6, block);

  }
  v7 = (id)objc_msgSend(v5, "identifyWithCompletion:", v4);

}

- (void)closeSessions
{
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__HAPAccessoryServerHAP2Adapter_closeSessions__block_invoke;
  v5[3] = &unk_1E894E078;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  objc_msgSend(v4, "addBlock:", v5);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)startPing
{
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__HAPAccessoryServerHAP2Adapter_startPing__block_invoke;
  v5[3] = &unk_1E894E078;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  objc_msgSend(v4, "addBlock:", v5);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)stopPing
{
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HAPAccessoryServerHAP2Adapter_stopPing__block_invoke;
  v5[3] = &unk_1E894E078;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a2;
  objc_msgSend(v4, "addBlock:", v5);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (BOOL)doesPeriodicSessionChecks
{
  return 1;
}

- (unint64_t)sessionCheckInterval
{
  void *v2;
  double v3;
  unint64_t v4;

  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionCheckInterval");
  v4 = (unint64_t)v3;

  return v4;
}

- (unint64_t)numActiveSessionClients
{
  return 1;
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HAPAccessoryServerHAP2Adapter_continueAuthAfterValidation___block_invoke;
  v6[3] = &unk_1E894D0C0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  objc_msgSend(v5, "addBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)provisionToken:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HAPAccessoryServerHAP2Adapter_provisionToken___block_invoke;
  v8[3] = &unk_1E894B438;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a2;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "addBlock:", v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

- (void)validatePairingAuthMethod:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServerHAP2Adapter_validatePairingAuthMethod___block_invoke;
  v7[3] = &unk_1E894E028;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_handleIncorrectStartPairingCall
{
  void *v3;
  void *v4;
  id v5;

  -[HAPAccessoryServerHAP2Adapter pairingSessionCancelable](self, "pairingSessionCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HAPAccessoryServerHAP2Adapter pairingSessionCancelable](self, "pairingSessionCancelable");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelWithError:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerHAP2Adapter _notifyDelegatePairingStoppedWithError:](self, "_notifyDelegatePairingStoppedWithError:");
  }

}

- (void)_notifyDelegatePairingStoppedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  HAPAccessoryServerHAP2Adapter *v10;
  id v11;

  v4 = a3;
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAPAccessoryServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HAPAccessoryServerHAP2Adapter__notifyDelegatePairingStoppedWithError___block_invoke;
    block[3] = &unk_1E894E120;
    v9 = v6;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
  -[HAPAccessoryServerHAP2Adapter setPairingSessionCancelable:](self, "setPairingSessionCancelable:", 0);
  -[HAPAccessoryServer setPairingRequest:](self, "setPairingRequest:", 0);

}

- (void)_resetPairingState
{
  void *v3;
  HAP2Cancelable *pairingSessionCancelable;
  id setupCodeCompletion;
  id userConsentCompletion;
  id authValidationCompletion;
  id softwareAuthFinishedCompletion;
  id authenticateUUIDCompletion;

  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  os_unfair_lock_lock_with_options();
  pairingSessionCancelable = self->_pairingSessionCancelable;
  self->_pairingSessionCancelable = 0;

  setupCodeCompletion = self->_setupCodeCompletion;
  self->_setupCodeCompletion = 0;

  userConsentCompletion = self->_userConsentCompletion;
  self->_userConsentCompletion = 0;

  authValidationCompletion = self->_authValidationCompletion;
  self->_authValidationCompletion = 0;

  softwareAuthFinishedCompletion = self->_softwareAuthFinishedCompletion;
  self->_softwareAuthFinishedCompletion = 0;

  authenticateUUIDCompletion = self->_authenticateUUIDCompletion;
  self->_authenticateUUIDCompletion = 0;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)continuePairingAfterAuthPrompt
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HAPAccessoryServerHAP2Adapter_continuePairingAfterAuthPrompt__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_continuePairingAfterAuthPromptWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  int v8;
  HAPAccessoryServerHAP2Adapter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAPAccessoryServerHAP2Adapter userConsentCompletion](self, "userConsentCompletion");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HAPAccessoryServerHAP2Adapter setUserConsentCompletion:](self, "setUserConsentCompletion:", 0);
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Someone thinks we just prompted for auth but we didn't", (uint8_t *)&v8, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter _handleIncorrectStartPairingCall](self, "_handleIncorrectStartPairingCall");
  }

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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)startPairingWithRequest:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D28540]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@, %s:%ld"), v8, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 987);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithName:", v9);

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HAPAccessoryServerHAP2Adapter_startPairingWithRequest___block_invoke;
  v14[3] = &unk_1E894DFD8;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v15 = v12;
  v13 = v5;
  v16 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HAPAccessoryServerHAP2Adapter_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v12[3] = &unk_1E894DF38;
  objc_copyWeak(&v14, &location);
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "addBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)stopPairingWithError:(id *)a3
{
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HAPAccessoryServerHAP2Adapter_stopPairingWithError___block_invoke;
  v6[3] = &unk_1E894E050;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "addBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return 1;
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  HAPAccessoryServerHAP2Adapter *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke;
  v19 = &unk_1E894D6D0;
  v20 = v9;
  v21 = self;
  v22 = v8;
  v23 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x1D17B7400](&v16);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addBlock:", v14);

}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  HAPAccessoryServerHAP2Adapter *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke;
  v19 = &unk_1E894D6D0;
  v20 = v9;
  v21 = self;
  v22 = v8;
  v23 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x1D17B7400](&v16);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addBlock:", v14);

}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke;
  v13[3] = &unk_1E894D9E8;
  v14 = v6;
  v15 = v7;
  v13[4] = self;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D17B7400](v13);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBlock:", v10);

  return 1;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HAPAccessoryServerHAP2Adapter *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E894D9E8;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17B7400](v12);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBlock:", v10);

}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29[2];
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 1216);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__HAPAccessoryServerHAP2Adapter_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v24[3] = &unk_1E894B460;
  objc_copyWeak(v29, &location);
  v20 = v13;
  v28 = v20;
  v21 = v18;
  v25 = v21;
  v22 = v11;
  v26 = v22;
  v29[1] = *(id *)&a4;
  v23 = v12;
  v27 = v23;
  objc_msgSend(v19, "addBlock:", v24);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  HAPAccessoryServerHAP2Adapter *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertCurrentQueue");

  if (objc_msgSend(v9, "count"))
  {
    v24 = 0;
    v25 = 0;
    v12 = -[HAPAccessoryServerHAP2Adapter _hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:](self, "_hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:", v9, &v25, &v24);
    v13 = v25;
    v14 = v24;
    if (v12)
    {
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        objc_msgSend(v13, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerHAP2Adapter _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
        objc_msgSend(v17, "accessory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "values");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
        v22[3] = &unk_1E894C7E0;
        v23 = v10;
        v21 = (id)objc_msgSend(v18, "readValuesForCharacteristics:timeout:completion:", v20, v22, a4);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = self;
          _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29[2];
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/HAPAdapter/HAPAccessoryServerHAP2Adapter.m", 1293);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithName:", v17);

  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__HAPAccessoryServerHAP2Adapter_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v24[3] = &unk_1E894B460;
  objc_copyWeak(v29, &location);
  v20 = v13;
  v28 = v20;
  v21 = v18;
  v25 = v21;
  v22 = v11;
  v26 = v22;
  v29[1] = *(id *)&a4;
  v23 = v12;
  v27 = v23;
  objc_msgSend(v19, "addBlock:", v24);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  HAPAccessoryServerHAP2Adapter *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertCurrentQueue");

  if (objc_msgSend(v9, "count"))
  {
    v25 = 0;
    v26 = 0;
    v12 = -[HAPAccessoryServerHAP2Adapter _hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:](self, "_hap2CharacteristicTuplesForHAPCharacteristics:tuples:error:", v9, &v26, &v25);
    v13 = v26;
    v14 = v25;
    if (v12)
    {
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        objc_msgSend(v13, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerHAP2Adapter _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
        objc_msgSend(v17, "accessory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "values");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
        v22[3] = &unk_1E894D048;
        v23 = v9;
        v24 = v10;
        v21 = (id)objc_msgSend(v18, "writeValuesForCharacteristics:timeout:completion:", v20, v22, a4);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v15 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = self;
          _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%@ More than one accessory not supported at the moment", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)_printMissingValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  HAPAccessoryServerHAP2Adapter *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_2;
  v12[3] = &unk_1E894B580;
  v9 = v5;
  v13 = v9;
  v14 = self;
  v15 = &__block_literal_global_209;
  v16 = v17;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  if (objc_msgSend(v9, "count"))
  {
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_220;
    v10[3] = &unk_1E894B5A8;
    v10[4] = self;
    v11 = &__block_literal_global_209;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
  _Block_object_dispose(v17, 8);

}

- (BOOL)_hap2CharacteristicTuplesForHAPCharacteristics:(id)a3 tuples:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Cannot get characteristics while unpaired", (uint8_t *)&buf, 0xCu);
      if (a5)
        goto LABEL_9;
    }
    else if (a5)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10342;
  v22 = __Block_byref_object_dispose__10343;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke;
  v16[3] = &unk_1E894B620;
  v16[4] = self;
  p_buf = &buf;
  v11 = v10;
  v17 = v11;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v13 = v12 == 0;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    *a4 = (id)objc_msgSend(v11, "copy");
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v13;
}

- (void)accessoryServerDidUpdateConnectionState:(id)a3
{
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:", a3))
    -[HAPAccessoryServer setReachable:](self, "setReachable:", -[HAPAccessoryServerHAP2Adapter isReachable](self, "isReachable"));
}

- (void)accessoryServerConnectionFailureReportWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HAPAccessoryServerHAP2Adapter accessories](self, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "invalidateWithError:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[HAPAccessoryServer delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HAPAccessoryServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerHAP2Adapter sessionInfo](self, "sessionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryServer:didUpdateConnectionState:sessionInfo:linkLayerType:withError:", self, 0, v13, 4, v4);

  }
}

- (void)accessoryServerConnectedWithSecureSession
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[HAPAccessoryServer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HAPAccessoryServer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerHAP2Adapter sessionInfo](self, "sessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryServer:didUpdateConnectionState:sessionInfo:linkLayerType:withError:", self, 1, v5, 4, 0);

  }
}

- (void)accessoryServerDidUpdateName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:"))
  {
    objc_msgSend(v5, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer setName:](self, "setName:", v4);

  }
}

- (void)accessoryServerDidUpdateCategory:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "category"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer setCategory:](self, "setCategory:", v4);

  }
}

- (void)accessory:(id)a3 didNotifyForUpdatedValuesOnCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, uint64_t, _BYTE *);
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  void *v51;
  uint8_t buf[4];
  HAPAccessoryServerHAP2Adapter *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "instanceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__10342;
  v49 = __Block_byref_object_dispose__10343;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10342;
  v43 = __Block_byref_object_dispose__10343;
  v44 = 0;
  -[HAPAccessoryServerHAP2Adapter accessories](self, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke;
  v33 = &unk_1E894B670;
  v13 = v9;
  v34 = v13;
  v14 = v10;
  v35 = v14;
  v15 = v11;
  v36 = v15;
  v37 = &v45;
  v38 = &v39;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v30);

  if (v40[5])
  {
    objc_msgSend(v7, "value", v30, v31, v32, v33, v34, v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EFA2EAA8);
      if (v18)
        v19 = v17;
      else
        v19 = 0;
      v20 = v19;
      if (v18)
        v21 = objc_msgSend(v17, "copyWithZone:", 0);
      else
        v21 = objc_msgSend(v17, "copy");
      v23 = (void *)v21;

    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(v7, "notificationContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend((id)v40[5], "setNotificationContext:", v25);

    v26 = (void *)objc_msgSend((id)v40[5], "copy");
    objc_msgSend(v26, "setValue:", v23);
    objc_msgSend((id)v40[5], "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setService:", v27);

    objc_msgSend((id)v46[5], "server");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleUpdatesForCharacteristics:stateNumber:", v29, 0);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = self;
      _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%@ Didn't match characteristic for event", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HAPAccessoryServerHAP2Adapter *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__HAPAccessoryServerHAP2Adapter_handleUpdatesForCharacteristics_stateNumber___block_invoke;
    v10[3] = &unk_1E894DA30;
    v11 = v8;
    v12 = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)discoverAccessories
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  HAPAccessoryServerHAP2Adapter *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer pairingActivity](self, "pairingActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "begin");
  -[HAPAccessoryServer pairingActivity](self, "pairingActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_debug_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%@ Accessory server requested to discover accessories", buf, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter setDiscoverAccessoriesOncePaired:](self, "setDiscoverAccessoriesOncePaired:", 0);
    -[HAPAccessoryServerHAP2Adapter pairedServer](self, "pairedServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "updateAccessoriesWithReason:", CFSTR("requested"));

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%@ Accessory server requested to discover accessories, queued until paired", buf, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter setDiscoverAccessoriesOncePaired:](self, "setDiscoverAccessoriesOncePaired:", 1);
  }
  __HMFActivityScopeLeave();

}

- (BOOL)_isActiveServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA37540))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

- (void)_informDelegateOfUpdatedAccessories:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HAPAccessoryServerHAP2Adapter *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __75__HAPAccessoryServerHAP2Adapter__informDelegateOfUpdatedAccessories_error___block_invoke;
      v10[3] = &unk_1E894DA30;
      v11 = v8;
      v12 = self;
      v13 = v6;
      v14 = v7;
      dispatch_async(v9, v10);

    }
  }

}

- (id)_hapIdentifierForAccessory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "accessoryServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)accessoryServerDidUpdateHasPairings:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  HAPAccessoryServerHAP2Adapter *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Accessory server updated hasPairings", (uint8_t *)&v7, 0xCu);
  }
  v6 = objc_msgSend(v4, "hasPairings");

  -[HAPAccessoryServer setHasPairings:](self, "setHasPairings:", v6);
}

- (id)currentIdentity
{
  void *v2;
  void *v3;

  -[HAPAccessoryServer keyBag](self, "keyBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessoryServerDidBecomeUnpaired:(id)a3
{
  NSObject *v4;
  NSArray *accessories;
  int v6;
  HAPAccessoryServerHAP2Adapter *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:", a3))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%@ Accessory server has become unpaired", (uint8_t *)&v6, 0xCu);
    }
    -[HAPAccessoryServerHAP2Adapter stopPing](self, "stopPing");
    os_unfair_lock_lock_with_options();
    accessories = self->_accessories;
    self->_accessories = (NSArray *)MEMORY[0x1E0C9AA60];

    os_unfair_lock_unlock(&self->super._lock);
  }
}

- (void)accessoryServerDidUpdateAccessories:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  HAPAccessoryServerHAP2Adapter *v20;
  id v21;
  id v22;
  _BYTE *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:", v4);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@ Accessory server has updated accessories", buf, 0xCu);
    }
    objc_msgSend(v4, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerHAP2Adapter accessories](self, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17B7244]();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke;
    v19 = &unk_1E894B698;
    v20 = self;
    v23 = buf;
    v11 = v8;
    v21 = v11;
    v12 = v9;
    v22 = v12;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v16);

    objc_autoreleasePoolPop(v10);
    v13 = (void *)objc_msgSend(v12, "copy", v16, v17, v18, v19, v20);
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_accessories, v13);
    os_unfair_lock_unlock(&self->super._lock);
    -[HAPAccessoryServerHAP2Adapter _informDelegateOfUpdatedAccessories:error:](self, "_informDelegateOfUpdatedAccessories:error:", v13, 0);

    _Block_object_dispose(buf, 8);
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v14 = v6;
    -[HAPAccessoryServerHAP2Adapter activeServer](self, "activeServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v25 = v15;
    _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Incoming accessory server (%@) isn't the active one (%@)", buf, 0x20u);

  }
}

- (void)accessoryServer:(id)a3 didFailToUpdateAccessoriesWithError:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  HAPAccessoryServerHAP2Adapter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[HAPAccessoryServerHAP2Adapter _isActiveServer:](self, "_isActiveServer:", a3))
  {
    -[HAPAccessoryServerHAP2Adapter _informDelegateOfUpdatedAccessories:error:](self, "_informDelegateOfUpdatedAccessories:error:", 0, v6);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Accessory server is no longer active.  Ignoring accessory update failure propagation.", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (id)_accessoryFromHAP2Accessory:(id)a3
{
  id v4;
  uint64_t v5;
  HAPAccessory *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPAccessory *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  HAPAccessory *v18;
  HAPAccessory *v19;
  _QWORD v21[4];
  HAPAccessory *v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "instanceID");
  v6 = [HAPAccessory alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = -[HAPAccessory initWithServer:instanceID:parsedServices:](v6, "initWithServer:instanceID:parsedServices:", self, v7, v9);

  if (v10)
  {
    -[HAPAccessoryServer identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setIdentifier:](v10, "setIdentifier:", v11);

    -[HAPAccessoryServer identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setServerIdentifier:](v10, "setServerIdentifier:", v12);

    -[HAPAccessory setPrimary:](v10, "setPrimary:", objc_msgSend(v4, "isPrimary"));
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "sleepInterval");
    objc_msgSend(v13, "numberWithUnsignedInteger:", (unint64_t)(v14 * 1000.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setSleepInterval:](v10, "setSleepInterval:", v15);

    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory setName:](v10, "setName:", v16);

    -[HAPAccessory services](v10, "services");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__HAPAccessoryServerHAP2Adapter__accessoryFromHAP2Accessory___block_invoke;
    v21[3] = &unk_1E894C9C0;
    v18 = v10;
    v22 = v18;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);

    v19 = v18;
  }

  return v10;
}

- (void)accessoryServer:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HAPAccessoryServerHAP2Adapter_accessoryServer_didCompleteWithError___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 doesRequirePermission:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke;
  v12[3] = &unk_1E894DC20;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v10, "addBlock:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 didRejectSetupCodeWithBackoffInterval:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke;
  v12[3] = &unk_1E894DC20;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = *(id *)&a4;
  objc_msgSend(v10, "addBlock:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 doesRequireSetupCodeWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke;
  v10[3] = &unk_1E894E028;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v13;
  v21 = v15;
  v16 = v11;
  v19 = v16;
  v17 = v12;
  v20 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v13;
  v21 = v15;
  v16 = v11;
  v19 = v16;
  v17 = v12;
  v20 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 didFinishAuthWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v13;
  v21 = v15;
  v16 = v11;
  v19 = v16;
  v17 = v12;
  v20 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)accessoryServer:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke;
  v22[3] = &unk_1E894DC98;
  objc_copyWeak(&v27, &location);
  v18 = v16;
  v26 = v18;
  v19 = v13;
  v23 = v19;
  v20 = v14;
  v24 = v20;
  v21 = v15;
  v25 = v21;
  objc_msgSend(v17, "addBlock:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerHAP2Adapter;
  -[HMFObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_firedConnectionIdleTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerHAP2Adapter operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServerHAP2Adapter__firedConnectionIdleTimer___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (HAP2UnpairedAccessoryServer)unpairedServer
{
  return self->_unpairedServer;
}

- (HAP2PairedAccessoryServer)pairedServer
{
  return self->_pairedServer;
}

- (BOOL)isInternallyPaired
{
  return self->_internallyPaired;
}

- (void)setInternallyPaired:(BOOL)a3
{
  self->_internallyPaired = a3;
}

- (void)setSkipUserConsent:(BOOL)a3
{
  self->_skipUserConsent = a3;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HMFTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setConnectionIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, a3);
}

- (double)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setDisconnectOnIdleTimeout:(double)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong(&self->_authenticateUUIDCompletion, 0);
  objc_storeStrong(&self->_softwareAuthFinishedCompletion, 0);
  objc_storeStrong(&self->_authValidationCompletion, 0);
  objc_storeStrong(&self->_userConsentCompletion, 0);
  objc_storeStrong(&self->_setupCodeCompletion, 0);
  objc_storeStrong((id *)&self->_pairingSessionCancelable, 0);
  objc_storeStrong((id *)&self->_pairedServer, 0);
  objc_storeStrong((id *)&self->_unpairedServer, 0);
}

void __59__HAPAccessoryServerHAP2Adapter__firedConnectionIdleTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "connectionIdleTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      objc_msgSend(v3, "_handleConnectionIdleTimeout");
      objc_msgSend(v3, "setConnectionIdleTimer:", 0);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "Accessory server died", v7, 2u);
    }
  }

}

void __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(WeakRetained, "setAuthValidationCompletion:", *(_QWORD *)(a1 + 56));
    objc_msgSend(WeakRetained, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke_2;
    block[3] = &unk_1E894B6E8;
    v8 = v3;
    v9 = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v5, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

uint64_t __97__HAPAccessoryServerHAP2Adapter_accessoryServer_validateSoftwareAuthUUID_token_model_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:validateUUID:token:model:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(WeakRetained, "setAuthValidationCompletion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke_2;
    v7[3] = &unk_1E894DA30;
    v8 = v3;
    v9 = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

uint64_t __86__HAPAccessoryServerHAP2Adapter_accessoryServer_validatePairingCert_model_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:validateCert:model:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pairingActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");

  objc_msgSend(*(id *)(a1 + 32), "code");
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke_2;
  block[3] = &unk_1E894E120;
  v8 = v4;
  v9 = WeakRetained;
  v10 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __72__HAPAccessoryServerHAP2Adapter_accessoryServer_didFinishAuthWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didFinishAuth:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    objc_msgSend(WeakRetained, "setSoftwareAuthFinishedCompletion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke_2;
    v7[3] = &unk_1E894DA30;
    v8 = v3;
    v9 = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    dispatch_async(v5, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
}

uint64_t __90__HAPAccessoryServerHAP2Adapter_accessoryServer_confirmSoftwareAuthUUID_token_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:confirmUUID:token:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(WeakRetained, "setAuthenticateUUIDCompletion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke_2;
    v6[3] = &unk_1E894DA30;
    v7 = v3;
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    dispatch_async(v4, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_notifyDelegatePairingStoppedWithError:", v5);

  }
}

uint64_t __95__HAPAccessoryServerHAP2Adapter_accessoryServer_authenticateSoftwareAuthUUID_token_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:authenticateUUID:token:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(WeakRetained, "setSetupCodeCompletion:", v4);
    objc_msgSend(WeakRetained, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke_2;
    v7[3] = &unk_1E894E0F8;
    v8 = v3;
    v9 = WeakRetained;
    dispatch_async(v5, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);

  }
}

uint64_t __84__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequireSetupCodeWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:promptUserForPasswordWithType:", *(_QWORD *)(a1 + 40), 1);
}

void __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(WeakRetained, "setSetupCodeCompletion:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke_2;
    block[3] = &unk_1E894B6C0;
    v8 = v3;
    v9 = WeakRetained;
    v10 = *(_QWORD *)(a1 + 48);
    dispatch_async(v5, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);

  }
}

uint64_t __98__HAPAccessoryServerHAP2Adapter_accessoryServer_didRejectSetupCodeWithBackoffInterval_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:", *(_QWORD *)(a1 + 40), (uint64_t)*(double *)(a1 + 48));
}

void __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "unpairedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = WeakRetained;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Accessory server is paired (expected unpaired)", buf, 0xCu);
    }
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v5);
    goto LABEL_28;
  }
  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 1) > 1
    || !objc_msgSend(WeakRetained, "shouldSkipUserConsent"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(WeakRetained, "setUserConsentCompletion:", *(_QWORD *)(a1 + 32));
      v6 = *(_QWORD *)(a1 + 48);
      if ((unint64_t)(v6 - 3) >= 2)
      {
        if (v6 == 1)
        {
          v7 = 0;
          goto LABEL_27;
        }
        if (v6 == 2)
        {
          v7 = 3;
LABEL_27:
          objc_msgSend(WeakRetained, "setUserConsentCompletion:", *(_QWORD *)(a1 + 32));
          objc_msgSend(WeakRetained, "delegateQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke_237;
          v16[3] = &unk_1E894DF10;
          v17 = v3;
          v18 = v5;
          v19 = WeakRetained;
          v20 = v7;
          dispatch_async(v15, v16);

          goto LABEL_28;
        }
      }
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 9;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = WeakRetained;
        _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Delegate doesn't support auth prompts", buf, 0xCu);
      }
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 2;
    }
    objc_msgSend(v12, "hapErrorWithCode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

LABEL_28:
    goto LABEL_29;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = WeakRetained;
    _os_log_debug_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%@ Skipping user consent as requested", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_29:

}

void __82__HAPAccessoryServerHAP2Adapter_accessoryServer_doesRequirePermission_completion___block_invoke_237(uint64_t a1)
{
  HAPAccessoryInfo *v2;
  void *v3;
  void *v4;
  HAPAccessoryInfo *v5;

  v2 = [HAPAccessoryInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v2, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v3, 0, 0, v4, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, 0);
}

void __70__HAPAccessoryServerHAP2Adapter_accessoryServer_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetPairingState");
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 79, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(WeakRetained, "_notifyDelegatePairingStoppedWithError:", v2);

}

uint64_t __61__HAPAccessoryServerHAP2Adapter__accessoryFromHAP2Accessory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessory:", *(_QWORD *)(a1 + 32));
}

void __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_accessoryFromHAP2Accessory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    while (1)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v5 >= objc_msgSend(*(id *)(a1 + 40), "count"))
        break;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "instanceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instanceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

      if ((v9 & 1) != 0)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v6)
        {
          v16 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v4, "services");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "services");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "services");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[HAPService hap2_mergeServices:discoveredServices:mergedServices:](HAPService, "hap2_mergeServices:discoveredServices:mergedServices:", v19, v20, v18);

          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke_2;
          v23[3] = &unk_1E894C9C0;
          v24 = v6;
          v21 = v6;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);
          v22 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v21, "setServices:", v22);

          objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
          goto LABEL_15;
        }
        break;
      }
      objc_msgSend(v6, "instanceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntValue");
      objc_msgSend(v4, "instanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");

      if (v11 > v13)
      {

        break;
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v3;
      _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Failed to validate HAP2Accessory: %@", buf, 0x16u);
    }
  }
LABEL_15:

}

uint64_t __69__HAPAccessoryServerHAP2Adapter_accessoryServerDidUpdateAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessory:", *(_QWORD *)(a1 + 32));
}

uint64_t __75__HAPAccessoryServerHAP2Adapter__informDelegateOfUpdatedAccessories_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didDiscoverAccessories:transaction:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

void __77__HAPAccessoryServerHAP2Adapter_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v3, v4, *(_QWORD *)(a1 + 56), 0);

}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v14 = a2;
  objc_msgSend(v14, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  v8 = v14;
  if (v7)
  {
    objc_msgSend(v14, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_2;
    v15[3] = &unk_1E894B648;
    v16 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v17 = v10;
    v19 = v11;
    v12 = v14;
    v13 = *(_QWORD *)(a1 + 64);
    v18 = v12;
    v20 = v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      *a4 = 1;

    v8 = v14;
  }

}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  uint64_t v16;

  v12 = a2;
  objc_msgSend(v12, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  v8 = v12;
  if (v7)
  {
    objc_msgSend(v12, "characteristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_3;
    v13[3] = &unk_1E894D270;
    v14 = *(id *)(a1 + 40);
    v11 = *(_OWORD *)(a1 + 48);
    v10 = (id)v11;
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      *a4 = 1;

    v8 = v12;
  }

}

void __85__HAPAccessoryServerHAP2Adapter_accessory_didNotifyForUpdatedValuesOnCharacteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HAP2CharacteristicTuple *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  HAP2CharacteristicTuple *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  HAP2CharacteristicTuple *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "characteristic");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  objc_msgSend(v8, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = *(void **)(a1 + 40);
    v17 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_2;
    v42[3] = &unk_1E894B5D0;
    v18 = v14;
    v43 = v18;
    v19 = objc_msgSend(v16, "indexOfObjectPassingTest:", v42);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = v13;
      objc_msgSend(*(id *)(a1 + 32), "pairedServer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accessories");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v17;
      v40[1] = 3221225472;
      v40[2] = __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_3;
      v40[3] = &unk_1E894B5F8;
      v41 = (HAP2CharacteristicTuple *)v18;
      v22 = objc_msgSend(v21, "indexOfObjectPassingTest:", v40);

      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = *(void **)(a1 + 32);
        v44 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_printMissingValues:", v24);

        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        v13 = v39;
        *a4 = 1;
        v28 = v41;
LABEL_17:

        goto LABEL_18;
      }
      v34 = [HAP2CharacteristicTuple alloc];
      objc_msgSend(*(id *)(a1 + 32), "pairedServer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "accessories");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v22);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HAP2CharacteristicTuple initWithAccessory:](v34, "initWithAccessory:", v37);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v28);
      v13 = v39;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v19);
      v28 = (HAP2CharacteristicTuple *)objc_claimAutoreleasedReturnValue();
    }
    -[HAP2CharacteristicTuple values](v28, "values");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v6);

    goto LABEL_17;
  }
  v29 = *(void **)(a1 + 32);
  v45[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_printMissingValues:", v30);

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v31;

  *a4 = 1;
LABEL_18:

}

BOOL __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "instanceID");
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == objc_msgSend(v5, "unsignedIntValue");

  return v6;
}

BOOL __93__HAPAccessoryServerHAP2Adapter__hap2CharacteristicTuplesForHAPCharacteristics_tuples_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");
  v6 = objc_msgSend(v3, "instanceID");

  return v6 == v5;
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_3;
  v12[3] = &unk_1E894B558;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v15 = v6;
  v16 = v10;
  v17 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, id);
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "characteristic");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(void (**)(uint64_t, id))(v11 + 16);
    v14 = v10;
    v13(v11, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v12;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v5;
    _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ Couldn't find characteristic (%@): %@", (uint8_t *)&v16, 0x20u);

  }
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  objc_msgSend(v6, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_4;
  v11[3] = &unk_1E894B530;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v16 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v17 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10342;
  v24 = __Block_byref_object_dispose__10343;
  v25 = 0;
  v7 = *(void **)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_212;
  v13 = &unk_1E894B508;
  v8 = v6;
  v19 = &v20;
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v8;
  v15 = v9;
  v18 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v10);
  if (v21[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsAtIndexes:", v10, v11, v12, v13, v14, v15, v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "count") == 0;
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }

  _Block_object_dispose(&v20, 8);
}

void __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke_212(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, id);
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "characteristic");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  objc_msgSend(v7, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v15)
    {
      objc_msgSend(v15, "addIndex:", a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v19 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 64);
      v23 = *(void (**)(uint64_t, id))(v22 + 16);
      v24 = v19;
      v23(v22, v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412546;
      v33 = v21;
      v34 = 2112;
      *(_QWORD *)v35 = v25;
      _os_log_error_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%@ Found missing characteristic %@", (uint8_t *)&v32, 0x16u);

      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    }
    v20 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 40);
      v26 = *(void **)(a1 + 48);
      v28 = v20;
      LODWORD(v26) = objc_msgSend(v26, "instanceID");
      objc_msgSend(*(id *)(a1 + 56), "instanceID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instanceID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 32);
      v32 = 138413314;
      v33 = v27;
      v34 = 1024;
      *(_DWORD *)v35 = (_DWORD)v26;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v29;
      v36 = 2112;
      v37 = v30;
      v38 = 2112;
      v39 = v31;
      _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%@ (%d.%@.%@): %@", (uint8_t *)&v32, 0x30u);

    }
  }

}

id __53__HAPAccessoryServerHAP2Adapter__printMissingValues___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@.%@"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2;
    v10[3] = &unk_1E894C728;
    v11 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_207);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristic");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __102__HAPAccessoryServerHAP2Adapter__writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");

  objc_msgSend(v2, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");

  objc_msgSend(v2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");

  objc_msgSend(v2, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "code");
}

void __101__HAPAccessoryServerHAP2Adapter_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "begin");
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_writeCharacteristicValues:timeout:completionQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));
    __HMFActivityScopeLeave();

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_204_10373);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __101__HAPAccessoryServerHAP2Adapter__readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");

  objc_msgSend(v2, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");

  objc_msgSend(v2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");

  objc_msgSend(v2, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "code");
}

void __100__HAPAccessoryServerHAP2Adapter_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "begin");
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_readCharacteristicValues:timeout:completionQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));
    __HMFActivityScopeLeave();

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke(id *a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
  v8[3] = &unk_1E894D048;
  v9 = a1[4];
  v10 = a1[6];
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17B7400](v8);
  objc_msgSend(a1[5], "pairedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "pairedServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "getPairingsWithCompletion:", v2);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "Cannot list pairings if not paired", v7, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v2)[2](v2, 0, v4);
  }

}

void __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_3;
  block[3] = &unk_1E894D9E8;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__HAPAccessoryServerHAP2Adapter_listPairingsWithCompletionQueue_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  id *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;

  objc_msgSend(a1[4], "pairedServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = a1[4];
  if (v2)
  {
    objc_msgSend(v3, "pairedServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_3;
    v13[3] = &unk_1E894D798;
    v5 = &v15;
    v15 = a1[6];
    v14 = a1[5];
    v6 = (id)objc_msgSend(v4, "unpairWithCompletion:", v13);

    goto LABEL_10;
  }
  objc_msgSend(v3, "authValidationCompletion");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  if (v7)
  {
    objc_msgSend(v8, "setAuthValidationCompletion:", 0);
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v10);

    goto LABEL_8;
  }
  objc_msgSend(v8, "softwareAuthFinishedCompletion");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7 = (void (**)(_QWORD, _QWORD))v9;
    objc_msgSend(a1[4], "setSoftwareAuthFinishedCompletion:", 0);
    goto LABEL_7;
  }
LABEL_8:
  v11 = a1[6];
  if (!v11)
    return;
  v12 = a1[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E894D498;
  v5 = &v17;
  v17 = v11;
  dispatch_async(v12, block);
LABEL_10:

}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 17);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_4;
    block[3] = &unk_1E894D498;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __85__HAPAccessoryServerHAP2Adapter_removePairingForCurrentControllerOnQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_2;
  v9 = &unk_1E894D798;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 56);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](&v6);
  objc_msgSend(*(id *)(a1 + 40), "pairedServer", v6, v7, v8, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "pairedServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "removePairing:completion:", *(_QWORD *)(a1 + 48), v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v4);
  }

}

void __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_3;
  v7[3] = &unk_1E894D5E0;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __81__HAPAccessoryServerHAP2Adapter_removePairing_completionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_2;
  v9 = &unk_1E894D798;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 56);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](&v6);
  objc_msgSend(*(id *)(a1 + 40), "pairedServer", v6, v7, v8, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "pairedServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "addPairing:completion:", *(_QWORD *)(a1 + 48), v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v4);
  }

}

void __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_3;
  v7[3] = &unk_1E894D5E0;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __78__HAPAccessoryServerHAP2Adapter_addPairing_completionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__HAPAccessoryServerHAP2Adapter_stopPairingWithError___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setupCodeCompletion");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "setSetupCodeCompletion:", 0);
    ((void (**)(_QWORD, _QWORD, void *))v2)[2](v2, 0, v1);
  }
  else
  {
    objc_msgSend(WeakRetained, "userConsentCompletion");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(WeakRetained, "setUserConsentCompletion:", 0);
      ((void (**)(_QWORD, void *))v3)[2](v3, v1);
    }
    else
    {
      objc_msgSend(WeakRetained, "pairingSessionCancelable");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        objc_msgSend(v4, "cancelWithError:", v1);

    }
  }

}

void __87__HAPAccessoryServerHAP2Adapter_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setupCodeCompletion");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(WeakRetained, "setSetupCodeCompletion:", 0);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
    }
    ((void (**)(_QWORD, uint64_t, void *))v3)[2](v3, v4, v5);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%@ Pairing password provided, but wasn't expected", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(WeakRetained, "_handleIncorrectStartPairingCall");
  }

}

void __57__HAPAccessoryServerHAP2Adapter_startPairingWithRequest___block_invoke(id *a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setPairingActivity:", a1[4]);
  objc_msgSend(WeakRetained, "setPairingRequest:", a1[5]);
  objc_msgSend(WeakRetained, "softwareAuthFinishedCompletion");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(WeakRetained, "setSoftwareAuthFinishedCompletion:", 0);
    v3[2](v3, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "pairingSessionCancelable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = WeakRetained;
        _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Request to pair when we're already pairing, canceling", v21, 0xCu);
      }
      objc_msgSend(WeakRetained, "pairingSessionCancelable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelWithError:", v7);

    }
    else
    {
      objc_msgSend(WeakRetained, "unpairedServer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = a1 + 5;
        objc_msgSend(WeakRetained, "setSkipUserConsent:", objc_msgSend(a1[5], "requiresUserConsent") ^ 1);
        v11 = a1[4];
        v10 = a1 + 4;
        v12 = v11;
        v13 = (id)HMFBooleanToString();
        v14 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "connectionState"));
        v15 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
        objc_msgSend(*v9, "requiresUserConsent");

        v16 = (id)HMFBooleanToString();
        objc_msgSend(v8, "protocolVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");

        objc_msgSend(*v10, "begin");
        *(_QWORD *)v21 = *v10;
        objc_msgSend(v8, "pairWithDelegate:", WeakRetained);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setPairingSessionCancelable:", v18);

        __HMFActivityScopeLeave();
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v19 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v21 = 138412290;
          *(_QWORD *)&v21[4] = WeakRetained;
          _os_log_error_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%@ Ignoring request to pair an already paired accessory", v21, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_notifyDelegatePairingStoppedWithError:", v20);

      }
    }
  }

}

void __63__HAPAccessoryServerHAP2Adapter_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_continuePairingAfterAuthPromptWithError:", 0);

}

uint64_t __72__HAPAccessoryServerHAP2Adapter__notifyDelegatePairingStoppedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__HAPAccessoryServerHAP2Adapter_validatePairingAuthMethod___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __48__HAPAccessoryServerHAP2Adapter_provisionToken___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "authenticateUUIDCompletion");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(WeakRetained, "setAuthenticateUUIDCompletion:", 0);
    v3[2](v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v5 = *(const char **)(a1 + 48);
      v6 = v4;
      NSStringFromSelector(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = WeakRetained;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%@ Incorrect call to %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __61__HAPAccessoryServerHAP2Adapter_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "authValidationCompletion");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "setAuthValidationCompletion:", 0);
    v3 = 0;
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(_QWORD, void *))v2)[2](v2, v3);
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(WeakRetained, "_continuePairingAfterAuthPromptWithError:", v3);
  }

}

void __41__HAPAccessoryServerHAP2Adapter_stopPing__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setReachabilityPingEnabled:", 0);
  objc_msgSend(WeakRetained, "pairedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      v7 = *(const char **)(a1 + 40);
      v8 = v4;
      NSStringFromSelector(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = WeakRetained;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(WeakRetained, "pairedServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopConfirming");

  }
  else if (v5)
  {
    v10 = *(const char **)(a1 + 40);
    v11 = v4;
    NSStringFromSelector(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v13, 0x16u);

  }
}

void __42__HAPAccessoryServerHAP2Adapter_startPing__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pairedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      v7 = *(const char **)(a1 + 40);
      v8 = v4;
      NSStringFromSelector(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = WeakRetained;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(WeakRetained, "setReachabilityPingEnabled:", 1);
    objc_msgSend(WeakRetained, "pairedServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startConfirming");

  }
  else if (v5)
  {
    v10 = *(const char **)(a1 + 40);
    v11 = v4;
    NSStringFromSelector(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v13, 0x16u);

  }
}

void __46__HAPAccessoryServerHAP2Adapter_closeSessions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pairedServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      v10 = *(const char **)(a1 + 40);
      v11 = v4;
      NSStringFromSelector(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = WeakRetained;
      v18 = 2112;
      v19 = v12;
      _os_log_debug_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(WeakRetained, "pairedServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closeSession");

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceForKey:", CFSTR("HAPDefaultHAP2DisconnectOnIdleTimeoutSeconds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(WeakRetained, "setDisconnectOnIdleTimeout:");

  }
  else if (v5)
  {
    v13 = *(const char **)(a1 + 40);
    v14 = v4;
    NSStringFromSelector(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = WeakRetained;
    v18 = 2112;
    v19 = v15;
    _os_log_debug_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: server not paired", (uint8_t *)&v16, 0x16u);

  }
}

void __56__HAPAccessoryServerHAP2Adapter_identifyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 18);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_189(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2_190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_4;
  block[3] = &unk_1E894D9E8;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_10394);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __94__HAPAccessoryServerHAP2Adapter__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");

  objc_msgSend(v2, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");

  objc_msgSend(v2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");

  objc_msgSend(v2, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "code");
}

void __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_enableEvents:forCharacteristics:withCompletionHandler:queue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "Accessory server died", buf, 2u);
    }
    v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_187;
    block[3] = &unk_1E894D498;
    v7 = *(id *)(a1 + 48);
    dispatch_async(v5, block);

  }
}

void __93__HAPAccessoryServerHAP2Adapter_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_187(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __48__HAPAccessoryServerHAP2Adapter_setAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __56__HAPAccessoryServerHAP2Adapter_disconnectOnIdleUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "onDemandConnectionsAreEnabled"))
      objc_msgSend(v2, "_startConnectionIdleTimer");
    else
      objc_msgSend(v2, "_suspendConnectionIdleTimer");
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "Accessory server died", v4, 2u);
    }
  }

}

void __69__HAPAccessoryServerHAP2Adapter_updateActiveDisconnectOnIdleTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "onDemandConnectionsAreEnabled"))
    {
      objc_msgSend(v3, "setDisconnectOnIdleTimeout:", *(double *)(a1 + 40));
      objc_msgSend(v3, "connectionIdleTimer");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        objc_msgSend(v3, "connectionIdleTimer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeInterval");
        v8 = v7;
        objc_msgSend(v3, "disconnectOnIdleTimeout");
        v10 = v9;

        if (v8 != v10)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v11 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            objc_msgSend(v3, "disconnectOnIdleTimeout");
            v15 = 138412546;
            v16 = v3;
            v17 = 2048;
            v18 = v13;
            _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%@ Updating active connection idle timer timeout to: %fs", (uint8_t *)&v15, 0x16u);

          }
          objc_msgSend(v3, "_suspendConnectionIdleTimer");
          objc_msgSend(v3, "_startConnectionIdleTimer");
        }
      }
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEFAULT, "Accessory server died", (uint8_t *)&v15, 2u);
    }
  }

}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E89898E0, CFSTR("HAPDefaultHAP2DisconnectOnIdleTimeoutSeconds"));
}

@end
