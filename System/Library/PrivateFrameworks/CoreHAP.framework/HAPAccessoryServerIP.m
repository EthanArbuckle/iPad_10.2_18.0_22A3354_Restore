@implementation HAPAccessoryServerIP

+ (id)_parseSerializedAccessoryDictionary:(id)a3 server:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  __objc2_class *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("services"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v9 = v7;
        v10 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v50;
LABEL_6:
          v14 = 0;
          v15 = v12;
          while (1)
          {
            if (*(_QWORD *)v50 != v13)
              objc_enumerationMutation(v9);
            _parseSerializedService(*(void **)(*((_QWORD *)&v49 + 1) + 8 * v14));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
              break;
            objc_msgSend(v8, "addObject:", v12);
            ++v14;
            v15 = v12;
            if (v11 == v14)
            {
              v11 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
              if (v11)
                goto LABEL_6;

              goto LABEL_13;
            }
          }
          v39 = (void *)MEMORY[0x1D17B7244]();
          v40 = v6;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            goto LABEL_31;
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v55 = v42;
          _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse serialized service", buf, 0xCu);
        }
        else
        {
LABEL_13:

          objc_msgSend(v5, "hmf_numberForKey:", CFSTR("aid"));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[__CFString isEqualToNumber:](v9, "isEqualToNumber:", v16);

            v18 = (void *)MEMORY[0x1D17B7244]();
            v19 = v6;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
            if ((v17 & 1) != 0)
            {
              if (v21)
              {
                HMFGetLogIdentifier();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = v22;
                v56 = 2114;
                v57 = v9;
                _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating HAP Accessory with instanceID %{public}@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v18);
              v23 = HAPAccessory;
            }
            else
            {
              if (v21)
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = v44;
                v56 = 2114;
                v57 = v9;
                _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating HAP Bridged Accessory with instanceID %{public}@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v18);
              v23 = HAPBridgedAccessory;
            }
            v30 = (void *)objc_msgSend([v23 alloc], "initWithServer:instanceID:parsedServices:", v19, v9, v8);
            objc_msgSend(v19, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setIdentifier:", v45);

            objc_msgSend(v19, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setServerIdentifier:", v46);

            goto LABEL_38;
          }
          v39 = (void *)MEMORY[0x1D17B7244]();
          v40 = v6;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
LABEL_31:

            objc_autoreleasePoolPop(v39);
            v30 = 0;
LABEL_38:

            goto LABEL_39;
          }
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aid"));
          v48 = v39;
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v42;
          v56 = 2112;
          v57 = v43;
          _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse accessory's instanceID: %@", buf, 0x16u);

          v39 = v48;
        }

        goto LABEL_31;
      }
      v31 = (void *)MEMORY[0x1D17B7244]();
      v32 = v6;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v55 = v36;
        v56 = 2114;
        v57 = CFSTR("services");
        v58 = 2114;
        v59 = v37;
        v38 = v37;
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%{public}@Expected '%{public}@' to be an array in the accessory object of the attribute database, instead it is a %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v31 = (void *)MEMORY[0x1D17B7244]();
      v32 = v6;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v34;
        _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@No services found when parsing accessory object in attribute database", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v31);
    v30 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v24 = (void *)MEMORY[0x1D17B7244]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (__CFString *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v55 = v27;
    v56 = 2114;
    v57 = v28;
    v29 = v28;
    _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Expected accessory object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v30 = 0;
LABEL_40:

  return v30;
}

- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4 discoveryMethod:(unint64_t)a5
{
  id v8;
  HAPAccessoryServerIP *v9;
  HAPAccessoryServerIP *v10;
  uint64_t v11;
  NSMutableArray *queuedOperations;
  NSOperationQueue *v13;
  void *v14;
  NSOperationQueue *clientOperationQueue;
  NSOperationQueue *v16;
  HAPAuthSession *v17;
  HAPAuthSession *authSession;
  HMFNetMonitor *v19;
  HMFNetMonitor *networkMonitor;
  HMFTimer *reachabilityEventTimer;
  NSDate *reachabilityStartTime;
  HAPSocketInfo *cachedSocketInfo;
  HAPAccessoryServerBookkeeping *v24;
  HAPAccessoryServerBookkeeping *discoveryBookkeeping;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  HAPAccessoryServerIPConnectionStatistics *v34;
  HAPAccessoryServerIPConnectionStatistics *ipConnectionStatistics;
  objc_super v37;

  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HAPAccessoryServerIP;
  v9 = -[HAPAccessoryServer initWithKeystore:](&v37, sel_initWithKeystore_, a3);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_browser, v8);
    v10->_retryingPairSetup = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    queuedOperations = v10->_queuedOperations;
    v10->_queuedOperations = (NSMutableArray *)v11;

    v10->_establishingSecureConnection = 0;
    v10->_hasAttributeDatabase = 0;
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), HAPDispatchQueueName(v10, CFSTR("clientOperationQueue")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v13, "setName:", v14);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v13, "setQualityOfService:", 25);
    clientOperationQueue = v10->_clientOperationQueue;
    v10->_clientOperationQueue = v13;
    v16 = v13;

    v17 = -[HAPAuthSession initWithRole:instanceId:delegate:]([HAPAuthSession alloc], "initWithRole:instanceId:delegate:", 0, 0, v10);
    authSession = v10->_authSession;
    v10->_authSession = v17;

    v10->_authenticated = 0;
    v19 = (HMFNetMonitor *)objc_alloc_init(MEMORY[0x1E0D28610]);
    networkMonitor = v10->_networkMonitor;
    v10->_networkMonitor = v19;

    -[HMFNetMonitor setDelegate:](v10->_networkMonitor, "setDelegate:", v10);
    v10->_hasUpdatedBonjour = 0;
    reachabilityEventTimer = v10->_reachabilityEventTimer;
    v10->_reachabilityEventTimer = 0;

    v10->_idleTimerActiveSessions = 0;
    reachabilityStartTime = v10->_reachabilityStartTime;
    v10->_reachabilityStartTime = 0;

    cachedSocketInfo = v10->_cachedSocketInfo;
    v10->_cachedSocketInfo = 0;

    v24 = -[HAPAccessoryServerBookkeeping initWithDiscoveryMethod:]([HAPAccessoryServerBookkeeping alloc], "initWithDiscoveryMethod:", a5);
    discoveryBookkeeping = v10->_discoveryBookkeeping;
    v10->_discoveryBookkeeping = v24;

    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferenceForKey:", CFSTR("reachabilityMinimumPollTimeout"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "doubleValue");
    v10->_minimumReachabilityPingInterval = v29;
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "preferenceForKey:", CFSTR("HAPDefaultIPDisconnectOnIdleTimeoutSeconds"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v10->_disconnectOnIdleTimeout = v33;

    v34 = -[HAPAccessoryServerIPConnectionStatistics initWithAccessory:]([HAPAccessoryServerIPConnectionStatistics alloc], "initWithAccessory:", v10);
    ipConnectionStatistics = v10->_ipConnectionStatistics;
    v10->_ipConnectionStatistics = v34;

  }
  return v10;
}

- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4
{
  return -[HAPAccessoryServerIP initWithKeyStore:browser:discoveryMethod:](self, "initWithKeyStore:browser:discoveryMethod:", a3, a4, 0);
}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  model = self->_model;
  self->_model = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)model
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_model, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setStatusFlags:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_statusFlags = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)statusFlags
{
  os_unfair_lock_s *p_lock;
  unint64_t statusFlags;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  statusFlags = self->_statusFlags;
  os_unfair_lock_unlock(p_lock);
  return statusFlags;
}

- (void)setSourceVersion:(id)a3
{
  NSString *v4;
  NSString *sourceVersion;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  sourceVersion = self->_sourceVersion;
  self->_sourceVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)sourceVersion
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_sourceVersion, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (HAPAccessoryServerIP)initWithBonjourDeviceInfo:(id)a3 keyStore:(id)a4 browser:(id)a5 discoveryMethod:(unint64_t)a6
{
  id v11;
  HAPAccessoryServerIP *v12;
  HAPAccessoryServerIP *v13;
  uint64_t v14;
  NSString *name;

  v11 = a3;
  v12 = -[HAPAccessoryServerIP initWithKeyStore:browser:discoveryMethod:](self, "initWithKeyStore:browser:discoveryMethod:", a4, a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bonjourDeviceInfo, a3);
    v13->_hasUpdatedBonjour = 1;
    v13->_invalidated = 0;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    name = v13->super._name;
    v13->super._name = (NSString *)v14;

    if (!-[HAPAccessoryServerIP _parseAndValidateTXTRecord](v13, "_parseAndValidateTXTRecord"))
    {

      v13 = 0;
    }
  }

  return v13;
}

- (void)_reset
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  HAPAccessory *primaryAccessoryForServer;
  HAPSocketInfo *cachedSocketInfo;
  NSDictionary *bonjourDeviceInfo;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@*** RESET Called", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerIP _tearDownSession](v4, "_tearDownSession");
  -[HAPAccessoryServer setAccessories:](v4, "setAccessories:", 0);
  v4->_wacAccessory = 0;
  primaryAccessoryForServer = v4->_primaryAccessoryForServer;
  v4->_primaryAccessoryForServer = 0;

  cachedSocketInfo = v4->_cachedSocketInfo;
  v4->_cachedSocketInfo = 0;

  bonjourDeviceInfo = v4->_bonjourDeviceInfo;
  v4->_bonjourDeviceInfo = 0;

  v4->_statusFlags = 0;
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HAPAccessoryServerIP_invalidateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)dealloc
{
  NSOperationQueue *clientOperationQueue;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  void *v7;
  PairingSessionPrivate *pairingSession;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIP _stopReachabilityTimer](self, "_stopReachabilityTimer");
  -[HAPAccessoryServerIP setConnectionIdleTimer:](self, "setConnectionIdleTimer:", 0);
  clientOperationQueue = self->_clientOperationQueue;
  self->_clientOperationQueue = 0;

  if (self->_httpClient)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@HTTP client not invalidated - invalidating....", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPHTTPClient invalidate](self->_httpClient, "invalidate");
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerIP;
  -[HAPAccessoryServerIP dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryServerIP;
  -[HMFObject description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    Device ID: %@"), v6);

  -[HAPAccessoryServerIP model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    Model: %@"), v7);

  -[HAPAccessoryServer version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "versionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    Protocol Version: %@"), v9);

  -[HAPAccessoryServerIP sourceVersion](self, "sourceVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    Source Version: %@"), v10);

  objc_msgSend(v5, "appendFormat:", CFSTR("    Config Number: %lu"), -[HAPAccessoryServer configNumber](self, "configNumber"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    Wake Number: %lu"), -[HAPAccessoryServer wakeNumber](self, "wakeNumber"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    State Number: %lu"), -[HAPAccessoryServer stateNumber](self, "stateNumber"));
  -[HAPAccessoryServer category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("    Category: %@"), v11);

  objc_msgSend(v5, "appendFormat:", CFSTR("    Status Flags: 0x%x"), -[HAPAccessoryServerIP statusFlags](self, "statusFlags"));
  objc_msgSend(v5, "appendFormat:", CFSTR("    Compatibility Features: 0x%x"), (unsigned __int16)-[HAPAccessoryServer compatibilityFeatures](self, "compatibilityFeatures"));
  v12 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v12;
}

- (void)_notifyDelegateOfPairingProgress:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  _QWORD v9[6];

  -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_updatePairingProgress_);

    if (v7)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __57__HAPAccessoryServerIP__notifyDelegateOfPairingProgress___block_invoke;
      v9[3] = &unk_1E894D3B0;
      v9[4] = self;
      v9[5] = a3;
      dispatch_async(v8, v9);

    }
  }
}

- (void)hapWACAccessoryClient:(id)a3 wacProgress:(unint64_t)a4
{
  uint64_t v4;

  if (a4 - 1 > 2)
    v4 = 8;
  else
    v4 = qword_1CCFA30B8[a4 - 1];
  -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](self, "_notifyDelegateOfPairingProgress:", v4);
}

- (void)hapWACAccessoryClient:(id)a3 setBonjourInfo:(id)a4
{
  -[HAPAccessoryServerIP setBonjourDeviceInfo:](self, "setBonjourDeviceInfo:", a4);
}

- (void)addActiveSession:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HAPAccessoryServerIP_addActiveSession___block_invoke;
  v6[3] = &unk_1E894D3B0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)removeActiveSession:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HAPAccessoryServerIP_removeActiveSession___block_invoke;
  v6[3] = &unk_1E894D3B0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerIP setWacStarted:](self, "setWacStarted:", 0);
  -[HAPAccessoryServerIP setHasStartedPairing:](self, "setHasStartedPairing:", 0);
  -[HAPAccessoryServerIP setHandlingInvalidSetupCode:](self, "setHandlingInvalidSetupCode:", 0);
  -[HAPAccessoryServerIP setPreSoftAuthWacStarted:](self, "setPreSoftAuthWacStarted:", 0);
  -[HAPAccessoryServer setPairingRequest:](self, "setPairingRequest:", 0);
  if (-[HAPAccessoryServerIP isWacAccessory](self, "isWacAccessory"))
  {
    -[HAPAccessoryServerIP hapWACAccessoryClient](self, "hapWACAccessoryClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dumpStatsWithError:", v4);

    if (!v4)
      -[HAPAccessoryServerIP setWacAccessory:](self, "setWacAccessory:", 0);
  }
  if (-[HAPAccessoryServerIP _shouldNotifyClientsOfPVFailure:](self, "_shouldNotifyClientsOfPVFailure:", v4)
    && -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__HAPAccessoryServerIP__notifyDelegatesPairingStopped___block_invoke;
    v7[3] = &unk_1E894E0F8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateConnectionState_linkLayerType_bookkeeping_withError_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HAPAccessoryServerIP__notifyDelegatesOfConnectionState_withError___block_invoke;
    block[3] = &unk_1E894C050;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

- (void)_notifyDelegatesOfAddAccessoryFailureWithError:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 79, 0, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP setWacComplete:](self, "setWacComplete:", 0);
  -[HAPAccessoryServerIP setWacStarted:](self, "setWacStarted:", 0);
  -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](self, "_notifyDelegatesPairingStopped:", v4);

}

- (void)_notifyDelegateNeedsOwnershipToken
{
  NSObject *v3;
  _QWORD block[5];

  if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerNeedsOwnershipToken_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HAPAccessoryServerIP__notifyDelegateNeedsOwnershipToken__block_invoke;
    block[3] = &unk_1E894DD08;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)_notifyDelegateOfDiscoveryCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    if (-[HAPAccessoryServerIP abruptDisconnectionCounter](self, "abruptDisconnectionCounter") <= 1)
      -[HAPAccessoryServerIP setAbruptDisconnectionCounter:](self, "setAbruptDisconnectionCounter:", -[HAPAccessoryServerIP abruptDisconnectionCounter](self, "abruptDisconnectionCounter") + 1);
  }
  else
  {
    -[HAPAccessoryServerIP setAbruptDisconnectionCounter:](self, "setAbruptDisconnectionCounter:", 0);
    -[HAPAccessoryServerIP _startConnectionIdleTimer](self, "_startConnectionIdleTimer");
  }
  if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__HAPAccessoryServerIP__notifyDelegateOfDiscoveryCompletionWithError___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (NSDictionary)bonjourDeviceInfo
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDictionary copy](self->_bonjourDeviceInfo, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setBonjourDeviceInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *bonjourDeviceInfo;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  bonjourDeviceInfo = self->_bonjourDeviceInfo;
  self->_bonjourDeviceInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasBonjourDeviceInfo
{
  void *v2;
  BOOL v3;

  -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isEstablishingSecureConnection
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_establishingSecureConnection;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEstablishingSecureConnection:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_establishingSecureConnection = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setBonjourDiscoveryPending:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_bonjourDiscoveryPending = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isBonjourDiscoveryPending
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_bonjourDiscoveryPending;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)abruptDisconnectionCounter
{
  os_unfair_lock_s *p_lock;
  unint64_t abruptDisconnectionCounter;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  abruptDisconnectionCounter = self->_abruptDisconnectionCounter;
  os_unfair_lock_unlock(p_lock);
  return abruptDisconnectionCounter;
}

- (void)setAbruptDisconnectionCounter:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_abruptDisconnectionCounter = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_submitStateNumberChangeEvent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[HAPAccessoryServerIP primaryAccessoryForServer](self, "primaryAccessoryForServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPAccessoryServerIP primaryAccessoryForServer](self, "primaryAccessoryForServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer buildReachabilityNotificationDictionary:reachable:linkType:withError:](self, "buildReachabilityNotificationDictionary:reachable:linkType:withError:", v6, v3, 1, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[HAPAccessoryServer notifyClients:withDictionary:](self, "notifyClients:withDictionary:", 3, v7);
  }
}

- (BOOL)_shouldConnectBasedOnDisconnectOnIdle
{
  void *v3;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[HAPAccessoryServer shouldDisconnectOnIdle](self, "shouldDisconnectOnIdle"))
    return 1;
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Recommend deferring update to server until next connection", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)_updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  unint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  HAPAccessoryServerIP *v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  _BOOL4 v32;
  uint64_t v33;
  BOOL v34;
  BOOL v35;
  int v36;
  _BOOL4 v37;
  void *v38;
  BOOL v39;
  void *v40;
  HAPAccessoryServerIP *v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  HAPAccessoryServerIP *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _BOOL4 v53;
  unint64_t v54;
  void *v55;
  _QWORD block[5];
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = 2;
  else
    v8 = 1;
  -[HAPAccessoryServerIP discoveryBookkeeping](self, "discoveryBookkeeping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastDiscoveryMethod:", v8);

  v52 = v6;
  -[HAPAccessoryServerIP setBonjourDeviceInfo:](self, "setBonjourDeviceInfo:", v6);
  -[HAPAccessoryServerIP setHasUpdatedBonjour:](self, "setHasUpdatedBonjour:", 1);
  v54 = -[HAPAccessoryServer configNumber](self, "configNumber");
  v10 = -[HAPAccessoryServer wakeNumber](self, "wakeNumber");
  v11 = -[HAPAccessoryServer stateNumber](self, "stateNumber");
  v53 = -[HAPAccessoryServerIP isBonjourDiscoveryPending](self, "isBonjourDiscoveryPending");
  -[HAPAccessoryServerIP setInvalidated:](self, "setInvalidated:", 0);
  -[HAPAccessoryServerIP setBonjourDiscoveryPending:](self, "setBonjourDiscoveryPending:", 0);
  v12 = -[HAPAccessoryServerIP _parseAndValidateTXTRecord](self, "_parseAndValidateTXTRecord");
  v13 = -[HAPAccessoryServerIP isPaired](self, "isPaired");
  v14 = v13;
  v55 = v7;
  if (v7 && v13)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = v10;
      v19 = v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v20;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Saving socket info", buf, 0xCu);

      v12 = v19;
      v10 = v18;
    }

    objc_autoreleasePoolPop(v15);
    -[HAPAccessoryServerIP setCachedSocketInfo:](v16, "setCachedSocketInfo:", v7);
  }
  v21 = (void *)MEMORY[0x1D17B7244]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v26 = v12;
    v27 = -[HAPAccessoryServer configNumber](v22, "configNumber");
    v28 = -[HAPAccessoryServer wakeNumber](v22, "wakeNumber");
    v29 = -[HAPAccessoryServer stateNumber](v22, "stateNumber");
    *(_DWORD *)buf = 138545410;
    v30 = CFSTR("NO");
    v62 = v24;
    if (v14)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    if (v53)
      v30 = CFSTR("YES");
    v63 = 2048;
    v64 = v54;
    v65 = 2048;
    v66 = v27;
    v12 = v26;
    v10 = v25;
    v67 = 2048;
    v68 = v25;
    v69 = 2048;
    v70 = v28;
    v71 = 2048;
    v72 = v11;
    v73 = 2048;
    v74 = v29;
    v75 = 2114;
    v76 = v31;
    v77 = 2114;
    v78 = v30;
    _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Parsing record: C# old/new %tu/%tu, W# old/new %tu/%tu, S# old/new %tu/%tu Paired: %{public}@, Discovery Pending: %{public}@", buf, 0x5Cu);

  }
  objc_autoreleasePoolPop(v21);
  if (v11 != -[HAPAccessoryServer stateNumber](v22, "stateNumber")
    && -[HAPAccessoryServer stateNumber](v22, "stateNumber") != 1)
  {
    -[HAPAccessoryServerIP _submitStateNumberChangeEvent:](v22, "_submitStateNumberChangeEvent:", 1);
  }
  v32 = v54 != -[HAPAccessoryServer configNumber](v22, "configNumber");
  v33 = -[HAPAccessoryServer stateNumber](v22, "stateNumber");
  v34 = v11 == v33;
  v35 = v11 != v33;
  v36 = !v34 || v32;
  v37 = v12
     && v14
     && v36 | v53
     && -[HAPAccessoryServerIP _shouldConnectBasedOnDisconnectOnIdle](v22, "_shouldConnectBasedOnDisconnectOnIdle")
     || -[HAPAccessoryServerIP abruptDisconnectionCounter](v22, "abruptDisconnectionCounter") == 1;
  -[HAPAccessoryServerIP ipConnectionStatistics](v22, "ipConnectionStatistics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "accessoryServerIPEvent:", 2);

  v39 = v10 != -[HAPAccessoryServer wakeNumber](v22, "wakeNumber");
  if (-[HAPAccessoryServer wakeNumber](v22, "wakeNumber"))
  {
    v40 = (void *)MEMORY[0x1D17B7244]();
    v41 = v22;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v43;
      v44 = "%{public}@skip connecting because accessory is suspended";
      v45 = v42;
      v46 = OS_LOG_TYPE_DEBUG;
LABEL_30:
      _os_log_impl(&dword_1CCE01000, v45, v46, v44, buf, 0xCu);

    }
  }
  else
  {
    if (v10)
    {
      v47 = (void *)MEMORY[0x1D17B7244]();
      v48 = v22;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v50;
        _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_INFO, "%{public}@connecting because accessory is no longer suspended", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v47);
    }
    else if (!v37)
    {
      goto LABEL_40;
    }
    if (!-[HAPAccessoryServerIP isWacAccessory](v22, "isWacAccessory")
      || -[HAPAccessoryServerIP isWacComplete](v22, "isWacComplete"))
    {
      -[HAPAccessoryServer clientQueue](v22, "clientQueue");
      v51 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__HAPAccessoryServerIP__updateWithBonjourDeviceInfo_socketInfo___block_invoke;
      block[3] = &unk_1E894D748;
      block[4] = v22;
      v57 = v32;
      v58 = v35;
      v59 = v39;
      v60 = v53;
      dispatch_async(v51, block);

      goto LABEL_40;
    }
    v40 = (void *)MEMORY[0x1D17B7244]();
    v41 = v22;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v43;
      v44 = "%{public}@skip update because WAC is in progress";
      v45 = v42;
      v46 = OS_LOG_TYPE_INFO;
      goto LABEL_30;
    }
  }

  objc_autoreleasePoolPop(v40);
LABEL_40:

}

- (void)bonjourRemoveEvent
{
  id v2;

  -[HAPAccessoryServerIP ipConnectionStatistics](self, "ipConnectionStatistics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerIPEvent:", 1);

}

- (HAPAccessoryServerIP)initWithHAPWACAccessory:(id)a3 keystore:(id)a4 browser:(id)a5
{
  id v8;
  HAPAccessoryServerIP *v9;
  HAPAccessoryServerIP *v10;

  v8 = a3;
  v9 = -[HAPAccessoryServerIP initWithKeyStore:browser:discoveryMethod:](self, "initWithKeyStore:browser:discoveryMethod:", a4, a5, 3);
  v10 = v9;
  if (v9)
    -[HAPAccessoryServerIP updateWithHAPWACAccessory:](v9, "updateWithHAPWACAccessory:", v8);

  return v10;
}

- (void)updateWithHAPWACAccessory:(id)a3
{
  NSString *v5;
  NSString *name;
  NSString *v7;
  NSString *identifier;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v11, "name");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->super._name;
  self->super._name = v5;

  objc_msgSend(v11, "deviceId");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->super._identifier;
  self->super._identifier = v7;

  self->_wacAccessory = 1;
  self->_wacComplete = 0;
  objc_storeStrong((id *)&self->_hapWACAccessory, a3);
  os_unfair_lock_unlock(&self->_lock);
  -[HAPAccessoryServerIP setWacLegacy:](self, "setWacLegacy:", objc_msgSend(v11, "pairSetupWAC") ^ 1);
  objc_msgSend(v11, "setupHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer setSetupHash:](self, "setSetupHash:", v9);

  objc_msgSend(v11, "wacCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer setCategory:](self, "setCategory:", v10);

  -[HAPAccessoryServerIP setBonjourDeviceInfo:](self, "setBonjourDeviceInfo:", 0);
}

- (HAPWACAccessory)hapWACAccessory
{
  os_unfair_lock_s *p_lock;
  HAPWACAccessory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hapWACAccessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPaired
{
  void *v3;
  void *v4;
  char v5;

  -[HAPAccessoryServerIP browser](self, "browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPaired:", v4);

  return v5;
}

- (BOOL)isWacAccessory
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWacAccessory:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacAccessory = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isWacComplete
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWacComplete:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacComplete = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isWacNeeded
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_wacAccessory && !self->_wacComplete;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isWacLegacy
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacLegacy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWacLegacy:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacLegacy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPreSoftAuthWacStarted
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_preSoftAuthWacStarted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPreSoftAuthWacStarted:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_preSoftAuthWacStarted = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPostSoftAuthWacStarted
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_postSoftAuthWacStarted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPostSoftAuthWacStarted:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_postSoftAuthWacStarted = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startReprovisioningWithPairingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HAPAccessoryServerIP_startReprovisioningWithPairingRequest___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)resetPostSoftAuthWAC
{
  -[HAPAccessoryServerIP setPostSoftAuthWacStarted:](self, "setPostSoftAuthWacStarted:", 0);
}

- (void)_invalidateWAC
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@invalidateWAC", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerIP pairOperation](v4, "pairOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finish");

}

- (id)_joinAccessoryNetworkWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HAPWACAccessoryClient *v8;
  void *v9;
  void *v10;
  void *v11;
  HAPWACAccessoryClient *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HAPAccessoryServerIP *v23;
  NSObject *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerIP browser](self, "browser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visible2Pt4Networks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPAccessoryServerIP browser](self, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopDiscoveringWACAccessoryServersWithInvalidation:", 0);

  v8 = [HAPWACAccessoryClient alloc];
  -[HAPAccessoryServerIP hapWACAccessory](self, "hapWACAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP browser](self, "browser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wacBrowser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HAPWACAccessoryClient initWithWACAccessory:server:browser:compatible2Pt4Networks:](v8, "initWithWACAccessory:server:browser:compatible2Pt4Networks:", v9, self, v11, v6);
  -[HAPAccessoryServerIP setHapWACAccessoryClient:](self, "setHapWACAccessoryClient:", v12);

  -[HAPAccessoryServerIP hapWACAccessoryClient](self, "hapWACAccessoryClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAPAccessoryServerIP hapWACAccessoryClient](self, "hapWACAccessoryClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerClientDelegate:", self);

    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Join accessory network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HAPAccessoryServerIP hapWACAccessoryClient](v16, "hapWACAccessoryClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __60__HAPAccessoryServerIP__joinAccessoryNetworkWithCompletion___block_invoke;
    v27[3] = &unk_1E894D798;
    v27[4] = v16;
    v28 = v4;
    v20 = (id)objc_msgSend(v19, "joinAccessoryNetworkWithCompletion:", v27);

    v21 = 0;
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v25;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Error Allocating HAPWACAccessoryClient", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v21);
  }

  return v21;
}

- (void)_pairSetupContinueWAC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0D28550];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke;
  v10 = &unk_1E894E050;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "blockOperationWithBlock:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP setPairOperation:](self, "setPairOperation:", v4, v7, v8, v9, v10);

  +[HAPAccessoryServerIP sharedPairOperationQueue](HAPAccessoryServerIP, "sharedPairOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP pairOperation](self, "pairOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_pairVerifyStartWAC:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP hapWACAccessory](v6, "hapWACAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to start reprovisioning: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerIP setWacComplete:](v6, "setWacComplete:", 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke;
  v12[3] = &unk_1E894DB00;
  v12[4] = v6;
  v13 = v4;
  v10 = v4;
  v11 = -[HAPAccessoryServerIP _joinAccessoryNetworkWithCompletion:](v6, "_joinAccessoryNetworkWithCompletion:", v12);

}

- (void)_continuePairingAfterConfirmingSecureWAC:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  HAPAccessoryInfo *v9;
  void *v10;
  void *v11;
  HAPAccessoryInfo *v12;
  NSObject *v13;
  HAPAccessoryInfo *v14;
  _QWORD block[5];
  HAPAccessoryInfo *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Continue pairing after confirming secure WAC with error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    -[HAPAccessoryServerIP _continuePairingAfterWAC:](v6, "_continuePairingAfterWAC:", v4);
  }
  else if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](v6, "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
  {
    v9 = [HAPAccessoryInfo alloc];
    -[HAPAccessoryServer name](v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer category](v6, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v9, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v10, 0, 0, v11, 0, 0, 0);

    -[HAPAccessoryServer delegateQueue](v6, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HAPAccessoryServerIP__continuePairingAfterConfirmingSecureWAC___block_invoke;
    block[3] = &unk_1E894E0F8;
    block[4] = v6;
    v16 = v12;
    v14 = v12;
    dispatch_async(v13, block);

  }
}

- (void)continuePairingUsingWAC
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HAPAccessoryServerIP_continuePairingUsingWAC__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  -[HAPAccessoryServerIP hapWACAccessoryClient](self, "hapWACAccessoryClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer pairingRequest](self, "pairingRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__HAPAccessoryServerIP__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_completion___block_invoke;
  v15[3] = &unk_1E894D798;
  v15[4] = self;
  v16 = v10;
  v13 = v10;
  v14 = (id)objc_msgSend(v11, "performEasyConfigWithParingPrompt:performPairSetup:isSplit:pairingRequest:completion:", a3, v7, v6, v12, v15);

}

- (void)_continuePairingUsingWAC
{
  _BOOL4 v3;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  HAPAccessoryServerIP *v13;
  uint64_t (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[HAPAccessoryServerIP isWacStarted](self, "isWacStarted");
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@WAC already started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Continuing WAC Pairing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPAccessoryServerIP setWacStarted:](v5, "setWacStarted:", 1);
    -[HAPAccessoryServerIP hapWACAccessory](v5, "hapWACAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsLegacyWAC");

    if (v11)
    {
      -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v5, "_notifyDelegateOfPairingProgress:", 6);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke;
      v19[3] = &unk_1E894DD58;
      v19[4] = v5;
      v12 = v19;
      v13 = v5;
      v14 = 0;
    }
    else
    {
      if (-[HAPAccessoryServerIP isPostSoftAuthWacStarted](v5, "isPostSoftAuthWacStarted"))
      {
        -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v5, "_notifyDelegateOfPairingProgress:", 0);
        -[HAPAccessoryServerIP hapWACAccessoryClient](v5, "hapWACAccessoryClient");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_89;
        v18[3] = &unk_1E894DD58;
        v18[4] = v5;
        v16 = (id)objc_msgSend(v15, "joinAccessoryNetworkWithCompletion:", v18);

        return;
      }
      -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v5, "_notifyDelegateOfPairingProgress:", 6);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_94;
      v17[3] = &unk_1E894DD58;
      v17[4] = v5;
      v14 = _WACPairSetupPromptForSetupCodeDelegateCallback_f;
      v12 = v17;
      v13 = v5;
    }
    -[HAPAccessoryServerIP _performEasyConfigWithPairingPrompt:performPairSetup:isSplit:completion:](v13, "_performEasyConfigWithPairingPrompt:performPairSetup:isSplit:completion:", v14, 1, 0, v12);
  }
}

- (int)_continuePairingWithSetupCode:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2080;
    v15 = "-[HAPAccessoryServerIP _continuePairingWithSetupCode:]";
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%s", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerIP hapWACAccessoryClient](v6, "hapWACAccessoryClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "continuePairingWithSetupCode:", v4);

  return 0;
}

- (void)_continuePairingAfterWAC:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_tearDownWAC
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 1024;
    v15 = -[HAPAccessoryServerIP isWacComplete](v4, "isWacComplete");
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@tearDownWAC - wacComplete: %d", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v3);
  if (-[HAPAccessoryServerIP isWacStarted](v4, "isWacStarted")
    && !-[HAPAccessoryServerIP isWacComplete](v4, "isWacComplete")
    || -[HAPAccessoryServerIP isPreSoftAuthWacStarted](v4, "isPreSoftAuthWacStarted")
    || -[HAPAccessoryServerIP isPostSoftAuthWacStarted](v4, "isPostSoftAuthWacStarted"))
  {
    -[HAPAccessoryServerIP hapWACAccessoryClient](v4, "hapWACAccessoryClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopEasyConfig");

    -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v4, "_notifyDelegateOfPairingProgress:", 3);
    -[HAPAccessoryServerIP hapWACAccessoryClient](v4, "hapWACAccessoryClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__HAPAccessoryServerIP__tearDownWAC__block_invoke;
    v11[3] = &unk_1E894DD58;
    v11[4] = v4;
    v9 = (id)objc_msgSend(v8, "restoreNetworkWithCompletion:", v11);

  }
  else
  {
    -[HAPAccessoryServerIP pairOperation](v4, "pairOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finish");

  }
}

- (void)pairSetupStartSoftAuthWAC
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerIP_pairSetupStartSoftAuthWAC__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)createKeysForDataStreamWithKeySalt:(id)a3 completionHandler:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HAPAccessoryServerIP_createKeysForDataStreamWithKeySalt_completionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)services
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_ipServices, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)primaryAccessory
{
  os_unfair_lock_s *p_lock;
  HAPAccessory *primaryAccessoryForServer;
  HAPAccessory *v5;
  void *v6;
  HAPAccessory *v7;
  HAPAccessory *v8;
  HAPAccessory *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  primaryAccessoryForServer = self->_primaryAccessoryForServer;
  if (!primaryAccessoryForServer)
  {
    v5 = [HAPAccessory alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HAPAccessory initWithServer:instanceID:](v5, "initWithServer:instanceID:", self, v6);
    v8 = self->_primaryAccessoryForServer;
    self->_primaryAccessoryForServer = v7;

    -[HAPAccessory setName:](self->_primaryAccessoryForServer, "setName:", self->super._name);
    -[HAPAccessory setIdentifier:](self->_primaryAccessoryForServer, "setIdentifier:", self->super._identifier);
    -[HAPAccessory setPrimary:](self->_primaryAccessoryForServer, "setPrimary:", 1);
    -[HAPAccessory setServerIdentifier:](self->_primaryAccessoryForServer, "setServerIdentifier:", self->super._identifier);
    primaryAccessoryForServer = self->_primaryAccessoryForServer;
  }
  v9 = primaryAccessoryForServer;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (int64_t)linkLayerType
{
  return 1;
}

- (int64_t)linkType
{
  return 1;
}

- (HMFNetAddress)peerAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HAPAccessoryServerIP httpClient](self, "httpClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "peerAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (HMFNetAddress *)v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer address -- httpClient is nil", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    return (HMFNetAddress *)0;
  }
}

- (HMFNetAddress)peerAddressEx
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerAddressEx");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFNetAddress *)v3;
}

- (NSString)peerEndpointDescription
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerEndpointDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HAPSocketInfo)currentSocketInfo
{
  void *v2;
  void *v3;

  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerSocketInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HAPSocketInfo *)v3;
}

- (void)setCachedSocketInfo:(id)a3
{
  id v5;
  HAPSocketInfo *v6;
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPAccessoryServerIP *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if (v5 && !-[HAPSocketInfo isEqual:](self->_cachedSocketInfo, "isEqual:", v5))
    v6 = self->_cachedSocketInfo;
  else
    v6 = 0;
  objc_storeStrong((id *)&self->_cachedSocketInfo, a3);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPSocketInfo shortDescription](v6, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@cached socket updated from %@ to %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    if (v5)
      goto LABEL_10;
    v7 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@cleared socket info", (uint8_t *)&v15, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v7);
LABEL_10:

}

- (void)_clearIPCacheOnError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_errorForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CB2F90]);

    if (v9)
    {
      v10 = objc_msgSend(v7, "code");
      if ((unint64_t)(v10 - 54) <= 0xB && ((1 << (v10 - 54)) & 0x881) != 0)
      {
        v12 = v10;
        v13 = (void *)MEMORY[0x1D17B7244]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v16;
          v19 = 2048;
          v20 = v12;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Clearing IP cache due to error %ld", (uint8_t *)&v17, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        -[HAPAccessoryServerIP setCachedSocketInfo:](v14, "setCachedSocketInfo:", 0);
      }
    }
  }

}

- (void)discoverAccessories
{
  NSObject *v3;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServerIP hasBonjourDeviceInfo](self, "hasBonjourDeviceInfo"))
  {
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__HAPAccessoryServerIP_discoverAccessories__block_invoke;
    block[3] = &unk_1E894DD08;
    block[4] = self;
    dispatch_async(v3, block);

  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Waiting for Bonjour to discoverAccessories", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPAccessoryServerIP setBonjourDiscoveryPending:](v5, "setBonjourDiscoveryPending:", 1);
    -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v5, "_notifyDelegateOfPairingProgress:", 8);
  }
}

- (void)_establishSecureConnectionAndFetchAttributeDatabaseWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (!-[HAPAccessoryServerIP isEstablishingSecureConnection](self, "isEstablishingSecureConnection"))
  {
    objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportConnection:linkType:accessoryCategory:", v6, 1, v7);

    -[HAPAccessoryServerIP setEstablishingSecureConnection:](self, "setEstablishingSecureConnection:", 1);
    -[HAPAccessoryServerIP setHasAttributeDatabase:](self, "setHasAttributeDatabase:", 0);
    -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", v4);
    -[HAPAccessoryServerIP _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke;
    v13 = &unk_1E894AEA0;
    objc_copyWeak(&v16, &location);
    v9 = v8;
    v14 = v9;
    v15 = v4;
    -[HAPAccessoryServerIP setPairVerifyCompletionBlock:](self, "setPairVerifyCompletionBlock:", &v10);
    -[HAPAccessoryServerIP _establishSecureSession](self, "_establishSecureSession", v10, v11, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

- (void)_isAccessoryPublicKeyPresent:(BOOL *)a3 registeredWithHomeKit:(BOOL *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[HAPAccessoryServer keyStore](self, "keyStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[HAPAccessoryServer identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v16, 0, 0, 0, v8, &v15);
  v9 = v16;
  v10 = v15;

  if (!v10 && v9)
  {
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v11, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v12, a4, &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (a3 && !v10 && v13)
      *a3 = 1;

  }
}

- (void)startPairingWithRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

- (void)reconfirm
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HAPAccessoryServerIP_reconfirm__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)continuePairingAfterAuthPrompt
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP hapWACAccessory](v4, "hapWACAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Continuing pairing after auth prompt hapWACAccessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServer clientQueue](v4, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HAPAccessoryServerIP_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v4;
  dispatch_async(v8, block);

}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__HAPAccessoryServerIP_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v10[3] = &unk_1E894E0F8;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(v7, v10);

  return 1;
}

- (void)_tearDownSessionWithError:(id)a3
{
  id v4;
  PairingSessionPrivate *pairingSession;
  void *v6;
  HAPAccessoryServerIP *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  v6 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerIP setSecuritySessionOpen:](self, "setSecuritySessionOpen:", 0));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2114;
    v29 = v4;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Invalidating HTTP client with error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HAPAccessoryServerIP httpClient](v7, "httpClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateWithError:", v4);

  -[HAPAccessoryServerIP setHttpClient:](v7, "setHttpClient:", 0);
  -[HAPAccessoryServerIP setHasAttributeDatabase:](v7, "setHasAttributeDatabase:", 0);
  if (!v7->_retryingPairSetup)
    -[HAPAccessoryServerIP setPreSoftAuthWacStarted:](v7, "setPreSoftAuthWacStarted:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HAPAccessoryServer accessories](v7, "accessories", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "invalidateWithError:", v4);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  -[HAPAccessoryServerIP _notifyDelegatesOfConnectionState:withError:](v7, "_notifyDelegatesOfConnectionState:withError:", 0, v4);
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferenceForKey:", CFSTR("HAPDefaultIPDisconnectOnIdleTimeoutSeconds"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  -[HAPAccessoryServerIP setDisconnectOnIdleTimeout:](v7, "setDisconnectOnIdleTimeout:");

  -[HAPAccessoryServerIP _suspendConnectionIdleTimer](v7, "_suspendConnectionIdleTimer");
  if (v4)
    v19 = 4;
  else
    v19 = 5;
  -[HAPAccessoryServerIP ipConnectionStatistics](v7, "ipConnectionStatistics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessoryServerIPEvent:", v19);

}

- (void)_tearDownSession
{
  -[HAPAccessoryServerIP _tearDownSessionWithError:](self, "_tearDownSessionWithError:", 0);
}

- (void)_doBonjourReconfirm
{
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = BonjourDevice_Reconfirm();
    if (v5)
    {
      v6 = v5;
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v10;
        v13 = 1024;
        v14 = v6;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Bonjour reconfirm failed %d", (uint8_t *)&v11, 0x12u);

      }
      objc_autoreleasePoolPop(v7);
    }
  }

}

- (BOOL)_matchesError:(id)a3 withHAPErrorCode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", CFSTR("HAPErrorDomain")))
      v8 = objc_msgSend(v6, "code") == a4;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_matchesError:(id)a3 withHAPHMErrorCode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", CFSTR("HMErrorDomain")))
      v8 = objc_msgSend(v6, "code") == a4;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_skipReconfirm
{
  void *v3;
  HAPAccessoryServerIP *v4;
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
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping reconfirm", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)_tearDownSessionAndStartReachabilityWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HAPAccessoryServerIP *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HAPAccessoryServerIP *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@invalidating HTTP client and tearing down pairing session %{public}@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v10 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerIP _tearDownSessionWithError:](v7, "_tearDownSessionWithError:", v4));
  v11 = v7;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ensuring reachability poll is enabled", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HAPAccessoryServerIP _startReachability](v11, "_startReachability");
  -[HAPAccessoryServerIP browser](v11, "browser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDiscoveringAccessoryServers");

}

- (void)disconnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HAPAccessoryServerIP_disconnectWithError___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)disconnect
{
  -[HAPAccessoryServerIP disconnectWithError:](self, "disconnectWithError:", 0);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)_handleMFiCertValidation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PairingSessionPrivate *pairingSession;
  void *v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id inited;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HAPAccessoryServerIP *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  __CFString *v30;
  __CFString *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  unsigned int v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BYTE v42[18];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  if (-[HAPAccessoryServer pairSetupType](self, "pairSetupType") == 5
    || (pairingSession = -[HAPAccessoryServer pairSetupType](self, "pairSetupType"),
        pairingSession == (PairingSessionPrivate *)6))
  {
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      v8 = (void *)PairingSessionCopyProperty();
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v12;
        v41 = 1024;
        *(_DWORD *)v42 = v38;
        *(_WORD *)&v42[4] = 2112;
        *(_QWORD *)&v42[6] = v8;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Pair Setup completed with err: %d - MFi Cert %@", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v9);
      if (v8)
      {
        v13 = v8;
        CFRelease(v13);
        if (-[HAPAccessoryServerIP isPreSoftAuthWacStarted](v10, "isPreSoftAuthWacStarted"))
        {
          inited = objc_initWeak(&location, v10);
          v15 = (void *)MEMORY[0x1D17B7244](inited);
          v16 = v10;
          HMFGetOSLogHandle();
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v40 = v18;
            _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Restoring network to validate Cert", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v16, "_notifyDelegateOfPairingProgress:", 3);
          -[HAPAccessoryServerIP hapWACAccessoryClient](v16, "hapWACAccessoryClient");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke;
          v34[3] = &unk_1E8949080;
          objc_copyWeak(&v36, &location);
          v35 = v13;
          v20 = (id)objc_msgSend(v19, "restoreNetworkWithCompletion:", v34);

          objc_destroyWeak(&v36);
          objc_destroyWeak(&location);
        }
        else if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](v10, "_delegateRespondsToSelector:", sel_accessoryServer_validateCert_model_))
        {
          -[HAPAccessoryServer delegateQueue](v10, "delegateQueue");
          v21 = objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_3;
          v32[3] = &unk_1E894E0F8;
          v32[4] = v10;
          v33 = v13;
          dispatch_async(v21, v32);

        }
        else
        {
          -[HAPAccessoryServerIP _tearDownSession](v10, "_tearDownSession");
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v10, "_processQueuedOperationsWithError:", v22);
          HMErrorFromOSStatus(v38);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v10, "_notifyDelegatesPairingStopped:", v23);

        }
      }
    }
  }
  v24 = (void *)MEMORY[0x1D17B7244](pairingSession, v3, v4, v5, v6);
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HAPAccessoryServer pairSetupType](v25, "pairSetupType");
    v29 = -[HAPAccessoryServer authMethod](v25, "authMethod");
    if (v29 > 6)
      v30 = CFSTR("HAPAuthMethodUnknown");
    else
      v30 = off_1E8948F80[v29];
    v31 = v30;
    *(_DWORD *)buf = 138543874;
    v40 = v27;
    v41 = 2048;
    *(_QWORD *)v42 = v28;
    *(_WORD *)&v42[8] = 2112;
    *(_QWORD *)&v42[10] = v31;
    _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Pair-Setup Completed with Type: %tu, Auth method: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v24);
}

- (void)_continuePairingAfterMFiCertValidation
{
  _BOOL4 v3;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIP tearDownSessionOnAuthCompletion](self, "tearDownSessionOnAuthCompletion");
  if (-[HAPAccessoryServer pairSetupType](self, "pairSetupType") == 6)
  {
    v3 = -[HAPAccessoryServerIP isPreSoftAuthWacStarted](self, "isPreSoftAuthWacStarted");
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v14 = 138543362;
        *(_QWORD *)&v14[4] = v8;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Transient Pair-Setup completed with Cert Auth - starting easyConfig", v14, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      -[HAPAccessoryServerIP pairSetupStartSoftAuthWAC](v5, "pairSetupStartSoftAuthWAC");
    }
    else
    {
      if (v7)
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v14 = 138543362;
        *(_QWORD *)&v14[4] = v9;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Transient Pair-Setup completed with Cert Auth - starting regular", v14, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      -[HAPAccessoryServer pairingActivity](v5, "pairingActivity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "begin");
      -[HAPAccessoryServer pairingActivity](v5, "pairingActivity");
      *(_QWORD *)v14 = objc_claimAutoreleasedReturnValue();

      -[HAPAccessoryServer pairingRequest](v5, "pairingRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "copy");

      objc_msgSend(v12, "setRequiresUserConsent:", 0);
      -[HAPAccessoryServer pairingRequest](v5, "pairingRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP startPairingWithRequest:](v5, "startPairingWithRequest:", v13);

      __HMFActivityScopeLeave();
    }
  }
  else
  {
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](self, "_notifyDelegatesPairingStopped:", 0);
  }
}

- (void)_error:(id)a3 forReadCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPAccessoryServerIP *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HAPAccessoryServerIP *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v29 = a5;
  v28 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v11;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v35)
  {
    v13 = *(_QWORD *)v41;
    v30 = *(_QWORD *)v41;
    v31 = v12;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accessory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = (void *)MEMORY[0x1D17B7244]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "instanceID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "instanceID");
            v34 = v18;
            v23 = v10;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "type");
            v33 = v17;
            v25 = self;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v45 = v21;
            v46 = 2114;
            v47 = v22;
            v48 = 2114;
            v49 = v24;
            v50 = 2114;
            v51 = v26;
            v52 = 2114;
            v53 = v23;
            _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Read response failed for characteristic %{public}@/%{public}@/%{public}@: %{public}@", buf, 0x34u);

            self = v25;
            v17 = v33;

            v10 = v23;
            v18 = v34;

            v12 = v31;
            v13 = v30;
          }

          objc_autoreleasePoolPop(v18);
        }
        +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v15, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v27);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v35);
  }

  if (v28)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__HAPAccessoryServerIP__error_forReadCharacteristicValues_queue_completionHandler___block_invoke;
    block[3] = &unk_1E894D9E8;
    v39 = v28;
    v37 = v12;
    v38 = v10;
    dispatch_async(v29, block);

  }
}

- (void)_error:(id)a3 forWriteCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPAccessoryServerIP *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  HAPAccessoryServerIP *v31;
  void *v32;
  id obj;
  void *v34;
  uint64_t v35;
  void *context;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v29 = a5;
  v28 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v11;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v35)
  {
    v13 = *(_QWORD *)v42;
    v31 = self;
    v32 = v12;
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "characteristic");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "accessory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          context = (void *)MEMORY[0x1D17B7244]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "instanceID");
            v22 = v10;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "instanceID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "type");
            v34 = v18;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v46 = v21;
            v47 = 2114;
            v48 = v23;
            v49 = 2114;
            v50 = v24;
            v51 = 2114;
            v52 = v25;
            v53 = 2114;
            v54 = v22;
            _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Write response for characteristic %{public}@/%{public}@/%{public}@ with error: %{public}@", buf, 0x34u);

            v18 = v34;
            v13 = v30;

            v10 = v22;
            v12 = v32;

            self = v31;
          }

          objc_autoreleasePoolPop(context);
        }
        objc_msgSend(v15, "characteristic");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v26, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v27);
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v35);
  }

  if (v28)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__HAPAccessoryServerIP__error_forWriteCharacteristicValues_queue_completionHandler___block_invoke;
    block[3] = &unk_1E894D9E8;
    v40 = v28;
    v38 = v12;
    v39 = v10;
    dispatch_async(v29, block);

  }
}

- (id)_queuedReadOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __82__HAPAccessoryServerIP__queuedReadOperationBlock_timeout_queue_completionHandler___block_invoke;
  v22 = &unk_1E89490A8;
  objc_copyWeak(v26, &location);
  v13 = v10;
  v23 = v13;
  v14 = v11;
  v24 = v14;
  v15 = v12;
  v25 = v15;
  v26[1] = *(id *)&a4;
  v16 = (void *)MEMORY[0x1D17B7400](&v19);
  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_queueReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markWithReason:", CFSTR("Queuing"));
  -[HAPAccessoryServerIP _queuedReadOperationBlock:timeout:queue:completionHandler:](self, "_queuedReadOperationBlock:timeout:queue:completionHandler:", v10, v11, v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple read until pair-verify completes", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v10, "count");
  -[HAPAccessoryServerIP queuedOperations](v16, "queuedOperations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1D17B7400](v14);
  objc_msgSend(v19, "addObject:", v20);

}

- (void)_insertReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markWithReason:", CFSTR("Queuing retry"));

  -[HAPAccessoryServerIP _queuedReadOperationBlock:timeout:queue:completionHandler:](self, "_queuedReadOperationBlock:timeout:queue:completionHandler:", v10, v11, v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing multiple read at the start until pair-verify completes", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  -[HAPAccessoryServerIP queuedOperations](v16, "queuedOperations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1D17B7400](v14);
  objc_msgSend(v19, "insertObject:atIndex:", v20, 0);

}

- (id)_queuedWriteOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __83__HAPAccessoryServerIP__queuedWriteOperationBlock_timeout_queue_completionHandler___block_invoke;
  v22 = &unk_1E89490A8;
  objc_copyWeak(v26, &location);
  v13 = v10;
  v23 = v13;
  v14 = v11;
  v24 = v14;
  v15 = v12;
  v25 = v15;
  v26[1] = *(id *)&a4;
  v16 = (void *)MEMORY[0x1D17B7400](&v19);
  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_queueWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markWithReason:", CFSTR("Queuing"));
  -[HAPAccessoryServerIP _queuedWriteOperationBlock:timeout:queue:completionHandler:](self, "_queuedWriteOperationBlock:timeout:queue:completionHandler:", v10, v11, v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple characteristic write until pair-verify completes", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v10, "count");
  -[HAPAccessoryServerIP queuedOperations](v16, "queuedOperations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1D17B7400](v14);
  objc_msgSend(v19, "addObject:", v20);

}

- (void)_insertWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markWithReason:", CFSTR("Queuing retry"));

  -[HAPAccessoryServerIP _queuedWriteOperationBlock:timeout:queue:completionHandler:](self, "_queuedWriteOperationBlock:timeout:queue:completionHandler:", v10, v11, v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple characteristic write at the start until pair-verify completes", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  -[HAPAccessoryServerIP queuedOperations](v16, "queuedOperations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1D17B7400](v14);
  objc_msgSend(v19, "insertObject:atIndex:", v20, 0);

}

- (void)_queueAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HAPAccessoryServerIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  id location;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
  v27[3] = &unk_1E89490D0;
  objc_copyWeak(&v32, &location);
  v16 = v14;
  v28 = v16;
  v17 = v15;
  v31 = v17;
  v18 = v12;
  v29 = v18;
  v19 = v13;
  v30 = v19;
  v33 = a5;
  v20 = (void *)MEMORY[0x1D17B7400](v27);
  v21 = (void *)MEMORY[0x1D17B7244]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing add-pairing until pair-verify completes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  -[HAPAccessoryServerIP queuedOperations](v22, "queuedOperations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1D17B7400](v20);
  objc_msgSend(v25, "addObject:", v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

- (void)_queueListPairingWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke;
  v23 = &unk_1E894A548;
  objc_copyWeak(&v26, &location);
  v8 = v6;
  v24 = v8;
  v9 = v7;
  v25 = v9;
  v10 = (void *)MEMORY[0x1D17B7400](&v20);
  v14 = (void *)MEMORY[0x1D17B7244](v10, v11, v12, v13);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v17;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing list-pairing until pair-verify completes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  -[HAPAccessoryServerIP queuedOperations](v15, "queuedOperations", v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1D17B7400](v10);
  objc_msgSend(v18, "addObject:", v19);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)_queueEnableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  id location;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  v29 = &unk_1E89490F8;
  objc_copyWeak(&v33, &location);
  v13 = v12;
  v30 = v13;
  v14 = v11;
  v32 = v14;
  v34 = a3;
  v15 = v10;
  v31 = v15;
  v16 = (void *)MEMORY[0x1D17B7400](&v26);
  v20 = (void *)MEMORY[0x1D17B7244](v16, v17, v18, v19);
  v21 = self;
  HMFGetOSLogHandle();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing enableEvents until pair-verify completes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  -[HAPAccessoryServerIP queuedOperations](v21, "queuedOperations", v26, v27, v28, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1D17B7400](v16);
  objc_msgSend(v24, "addObject:", v25);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (void)_processQueuedOperationsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id obj;
  _QWORD block[4];
  id v17;
  HAPAccessoryServerIP *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerIP queuedOperations](self, "queuedOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[HAPAccessoryServerIP setEstablishingSecureConnection:](self, "setEstablishingSecureConnection:", 0);
  if (v4)
    -[HAPAccessoryServerIP setSecuritySessionOpen:](self, "setSecuritySessionOpen:", 0);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        -[HAPAccessoryServerIP queuedOperations](self, "queuedOperations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1D17B7400](v11);
        objc_msgSend(v12, "removeObject:", v13);

        -[HAPAccessoryServer clientQueue](self, "clientQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__HAPAccessoryServerIP__processQueuedOperationsWithError___block_invoke;
        block[3] = &unk_1E894D9E8;
        v17 = v4;
        v18 = self;
        v19 = v11;
        dispatch_async(v14, block);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

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
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  id v28;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 2630);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v14, "initWithName:", v17);

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894AC48;
  block[4] = self;
  v23 = v11;
  v27 = a4;
  v24 = v12;
  v25 = v28;
  v26 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async(v18, block);

  __HMFActivityScopeLeave();
}

- (void)_handleReadECONNRESETError:(id)a3 readCharacteristics:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  NSObject *v31;
  id v32;
  double v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmf_errorForKey:", *MEMORY[0x1E0CB3388]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0CB2F90]) && objc_msgSend(v20, "code") == 54)
  {
    v22 = -[HAPAccessoryServerIP econnresetRetryInProgress](self, "econnresetRetryInProgress");

    if (!v22)
    {
      -[HAPAccessoryServer clientQueue](self, "clientQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E894D608;
      block[4] = self;
      v30 = v15;
      v33 = a6;
      v31 = v17;
      v32 = v18;
      dispatch_async(v23, block);

      v24 = v30;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v18)
  {
    -[HAPAccessoryServerIP _indicateSessionActivityWithReason:](self, "_indicateSessionActivityWithReason:", CFSTR("Read"));
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke_156;
    v25[3] = &unk_1E894D9E8;
    v28 = v18;
    v26 = v16;
    v27 = v14;
    dispatch_async(v17, v25);

    v24 = v28;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HAPAccessoryServerIP *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HAPAccessoryServerIP *v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  NSObject *queue;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50[2];
  id location;
  _QWORD v52[4];
  id v53;
  NSObject *v54;
  id v55;
  id v56[2];
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _QWORD block[4];
  id v66;
  id v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  queue = a5;
  v11 = a6;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        v14 = v12;
        if (v13)
        {
          v15 = *(_QWORD *)v60;
LABEL_6:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v60 != v15)
              objc_enumerationMutation(v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            if (v13 == ++v16)
            {
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
              if (v13)
                goto LABEL_6;
              v14 = v12;
              goto LABEL_27;
            }
          }

          if (!v11)
            goto LABEL_28;
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_161;
          v57[3] = &unk_1E894D498;
          v58 = v11;
          dispatch_async(queue, v57);
          v14 = v58;
        }
LABEL_27:

LABEL_28:
        objc_initWeak((id *)buf, self);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2;
        v52[3] = &unk_1E8949168;
        objc_copyWeak(v56, (id *)buf);
        v31 = v12;
        v53 = v31;
        v56[1] = *(id *)&a4;
        v32 = queue;
        v54 = v32;
        v33 = v11;
        v55 = v33;
        v34 = (void *)MEMORY[0x1D17B7400](v52);
        objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_alloc_init(MEMORY[0x1E0D28550]);
        objc_initWeak(&location, v36);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_4;
        v45[3] = &unk_1E8949190;
        objc_copyWeak(&v49, &location);
        objc_copyWeak(v50, (id *)buf);
        v46 = v31;
        v37 = v35;
        v47 = v37;
        v50[1] = *(id *)&a4;
        v38 = v34;
        v48 = v38;
        objc_msgSend(v36, "addExecutionBlock:", v45);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2_173;
        v41[3] = &unk_1E894DC48;
        objc_copyWeak(&v44, &location);
        v43 = v33;
        v42 = v32;
        objc_msgSend(v36, "setCompletionBlock:", v41);
        -[HAPAccessoryServerIP clientOperationQueue](self, "clientOperationQueue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addOperation:", v36);

        objc_destroyWeak(&v44);
        objc_destroyWeak(v50);
        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);

        objc_destroyWeak(v56);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v27 = (void *)MEMORY[0x1D17B7244]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v70 = v30;
          _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing read", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        -[HAPAccessoryServerIP _queueReadCharacteristicValues:timeout:queue:completionHandler:](v28, "_queueReadCharacteristicValues:timeout:queue:completionHandler:", v10, queue, v11, a4);
        -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v28, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.read"));
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v26;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Reading 0 characteristics, bailing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      if (v11)
      {
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_157;
        v63[3] = &unk_1E894D498;
        v64 = v11;
        dispatch_async(queue, v63);

      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1D17B7400](v11);
      *(_DWORD *)buf = 138543874;
      v70 = v20;
      v71 = 2112;
      v72 = 0;
      v73 = 2112;
      v74 = v21;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to read values because the characteristics were %@ and the completion handler was %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E894D5E0;
      v67 = v11;
      v66 = v22;
      dispatch_async(queue, block);

    }
  }

}

- (void)_handleReadResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, id, void *);
  void *v17;
  HAPAccessoryServerIP *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  __CFString *v29;
  BOOL v30;
  int v31;
  char isKindOfClass;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  int v48;
  void *v49;
  NSObject *v50;
  void *v51;
  int v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  NSObject *v103;
  void *v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  HAPAccessoryServerIP *v109;
  NSObject *v110;
  id v111;
  void *v112;
  uint64_t v113;
  __CFString *v114;
  __CFString *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  HAPAccessoryServerIP *v120;
  NSObject *v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  __CFString *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  id v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  HAPAccessoryServerIP *v142;
  NSObject *v143;
  void *v144;
  uint64_t v145;
  __CFString *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  __int128 v155;
  void *context;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  HAPAccessoryServerIP *v166;
  void *v167;
  void *v168;
  void *v169;
  id obj;
  int v171;
  void (**v172)(id, id, void *);
  uint64_t v173;
  void *v174;
  uint64_t v175;
  id v176;
  void *v177;
  void *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _BYTE v192[128];
  uint8_t v193[128];
  uint8_t v194[4];
  void *v195;
  __int16 v196;
  uint64_t v197;
  __int16 v198;
  void *v199;
  __int16 v200;
  uint64_t v201;
  __int16 v202;
  void *v203;
  uint8_t buf[4];
  void *v205;
  __int16 v206;
  _BYTE v207[38];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v176 = a7;
  v16 = (void (**)(id, id, void *))a8;
  v17 = (void *)MEMORY[0x1D17B7244]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v205 = v20;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Received response to a read characteristics request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1D17B7244](v21);
    v24 = v18;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v15;
      v27 = v14;
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 - 1 > 3)
        v29 = CFSTR("Invalid");
      else
        v29 = off_1E894BB00[a4 - 1];
      v115 = v29;
      *(_DWORD *)buf = 138544386;
      v205 = v28;
      v206 = 2114;
      *(_QWORD *)v207 = v176;
      *(_WORD *)&v207[8] = 2114;
      *(_QWORD *)&v207[10] = v27;
      *(_WORD *)&v207[18] = 2114;
      *(_QWORD *)&v207[20] = v115;
      *(_WORD *)&v207[28] = 2114;
      *(_QWORD *)&v207[30] = v26;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristics %{public}@, received response object: %{public}@, MIME type: %{public}@, error: %{public}@", buf, 0x34u);

      v14 = v27;
      v15 = v26;
    }

    objc_autoreleasePoolPop(v23);
    v116 = v176;
    objc_msgSend(v176, "count");
    objc_msgSend(v15, "domain");

    objc_msgSend(v15, "code");
    v117 = v15;
    if (objc_msgSend(v117, "code") == -6723 || (v118 = v117, objc_msgSend(v117, "code") == -6753))
    {
      v119 = (void *)MEMORY[0x1D17B7244]();
      v120 = v24;
      HMFGetOSLogHandle();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v122 = v15;
        v123 = v14;
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v205 = v124;
        _os_log_impl(&dword_1CCE01000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);

        v14 = v123;
        v15 = v122;
        v116 = v176;
      }

      objc_autoreleasePoolPop(v119);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 4, 0, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[HAPAccessoryServerIP ipConnectionStatistics](v24, "ipConnectionStatistics");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "accessoryServerIPEvent:", 4);

    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v24, "_tearDownSessionAndStartReachabilityWithError:", v117);
    v138 = 0;
    goto LABEL_100;
  }
  v30 = a5 == 200 || a5 == 207;
  v31 = v30;
  v174 = (void *)v21;
  if (!v14 || !v31 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), a4 != 1) || (isKindOfClass & 1) == 0)
  {
    v108 = (void *)MEMORY[0x1D17B7244]();
    v109 = v18;
    HMFGetOSLogHandle();
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      v111 = v14;
      HMFGetLogIdentifier();
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v114 = CFSTR("Invalid");
      else
        v114 = off_1E894BB00[a4 - 1];
      v126 = v114;
      *(_DWORD *)buf = 138544386;
      v205 = v112;
      v206 = 1026;
      *(_DWORD *)v207 = a5;
      *(_WORD *)&v207[4] = 2082;
      *(_QWORD *)&v207[6] = v113;
      *(_WORD *)&v207[14] = 2114;
      *(_QWORD *)&v207[16] = v126;
      *(_WORD *)&v207[24] = 2114;
      *(_QWORD *)&v207[26] = v111;
      _os_log_impl(&dword_1CCE01000, v110, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristics because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      v14 = v111;
      v15 = 0;
    }

    objc_autoreleasePoolPop(v108);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP ipConnectionStatistics](v109, "ipConnectionStatistics");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "accessoryServerIPEvent:", 6);

    v138 = 0;
    v116 = v176;
    v37 = v174;
    if (!v16)
      goto LABEL_107;
    goto LABEL_106;
  }
  v166 = v18;
  v171 = a5;
  v33 = v14;
  v34 = v176;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("characteristics"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v164 = v14;
  v165 = v35;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v104 = v34;
    v128 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v129 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v130 = v33;
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v205 = v131;
      v206 = 2112;
      *(_QWORD *)v207 = CFSTR("characteristics");
      _os_log_impl(&dword_1CCE01000, v129, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, %@ key doesn't contain an NSArray", buf, 0x16u);

      v33 = v130;
    }

    objc_autoreleasePoolPop(v128);
    v138 = 0;
    v15 = 0;
    v37 = v174;
    goto LABEL_117;
  }
  v36 = objc_msgSend(v35, "count");
  v160 = v34;
  if (v36 != objc_msgSend(v34, "count"))
  {
    v132 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = v33;
      v136 = objc_msgSend(v35, "count");
      v137 = objc_msgSend(v160, "count");
      *(_DWORD *)buf = 138543874;
      v205 = v134;
      v206 = 2050;
      *(_QWORD *)v207 = v136;
      v33 = v135;
      *(_WORD *)&v207[8] = 2050;
      *(_QWORD *)&v207[10] = v137;
      _os_log_impl(&dword_1CCE01000, v133, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, '%{public}lu' response objects for '%{public}lu' requested characteristics", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v132);
    v138 = 0;
    v15 = 0;
    v37 = v174;
    v104 = v160;
    goto LABEL_117;
  }
  v158 = v33;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v34);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  obj = v35;
  v37 = v174;
  v175 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, buf, 16);
  if (!v175)
    goto LABEL_85;
  v173 = *(_QWORD *)v189;
  *(_QWORD *)&v38 = 138543362;
  v155 = v38;
  v172 = v16;
  do
  {
    v39 = 0;
    do
    {
      if (*(_QWORD *)v189 != v173)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * v39);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v53 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_opt_class();
          *(_DWORD *)v194 = 138543618;
          v195 = v55;
          v196 = 2112;
          v197 = (uint64_t)v56;
          v57 = v56;
          _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response object - ignoring response object %@", v194, 0x16u);

        }
        objc_autoreleasePoolPop(v53);
        goto LABEL_40;
      }
      objc_msgSend(v40, "hmf_numberForKey:", CFSTR("aid"));
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "hmf_numberForKey:", CFSTR("iid"));
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("value"));
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "hmf_numberForKey:", CFSTR("status"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = (void *)v42;
      v178 = (void *)v41;
      v30 = v41 == 0;
      v45 = v44;
      v46 = v30 || v42 == 0;
      v47 = (void *)v43;
      if (v46 || (v171 == 207) != (v44 != 0))
      {
LABEL_32:
        v49 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v194 = 138544386;
          v195 = v51;
          v196 = 2114;
          v197 = (uint64_t)v177;
          v198 = 2114;
          v199 = v178;
          v200 = 2112;
          v201 = v43;
          v202 = 2114;
          v203 = v45;
          _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%@' and HAP status code '%{public}@'", v194, 0x34u);

        }
        objc_autoreleasePoolPop(v49);
        v52 = 1;
        goto LABEL_35;
      }
      v48 = objc_msgSend(v44, "intValue");
      if (v43)
      {
        if (v48)
          goto LABEL_32;
      }
      else if (!v48)
      {
        goto LABEL_32;
      }
      v168 = (void *)v43;
      v169 = v45;
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v58 = v163;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v185;
LABEL_45:
        v62 = 0;
        while (1)
        {
          if (*(_QWORD *)v185 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v62);
          objc_msgSend(v63, "service", v155);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "accessory");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "instanceID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            if (objc_msgSend(v178, "isEqualToNumber:", v66))
            {
              objc_msgSend(v63, "instanceID");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = objc_msgSend(v177, "isEqualToNumber:", v67);

              if ((v68 & 1) != 0)
                break;
            }
          }

          if (v60 == ++v62)
          {
            v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
            if (v60)
              goto LABEL_45;
            goto LABEL_53;
          }
        }
        v69 = v63;

        if (!v69)
          goto LABEL_60;
        objc_msgSend(v58, "removeObject:", v69);
        v16 = v172;
        v37 = v174;
        v47 = v168;
        v162 = v69;
        if (objc_msgSend(v69, "shouldValidateValueAfterReading"))
        {
          objc_msgSend(v69, "metadata");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "format");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = HAPCharacteristicFormatFromString(v71);

          if (!v72)
          {
            v73 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v194 = v155;
              v195 = v75;
              _os_log_impl(&dword_1CCE01000, v74, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", v194, 0xCu);

            }
            objc_autoreleasePoolPop(v73);
            v76 = v168;
LABEL_68:
            v15 = 0;
            v45 = v169;
            v159 = v76;
            if (objc_msgSend(v169, "intValue"))
            {
              HMErrorFromHAPIPStatusErrorCode((void *)objc_msgSend(v169, "integerValue"));
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v162;
            }
            else
            {
              v85 = v162;
              if (!objc_msgSend(v162, "shouldValidateValueAfterReading")
                || (objc_msgSend(v162, "validateValue:outValue:", v76, 0),
                    (v161 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                objc_msgSend(v162, "setValue:", v76);
                v161 = 0;
              }
            }
            if ((objc_msgSend(v85, "properties") & 0x100) != 0)
            {
              _parseNotificationContextFromCharacteristicResponse(v40);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "setNotificationContext:", v86);

              v87 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v88 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "notificationContext");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v194 = 138543874;
                v195 = v89;
                v196 = 2114;
                v197 = (uint64_t)v90;
                v198 = 2114;
                v199 = v177;
                _os_log_impl(&dword_1CCE01000, v88, OS_LOG_TYPE_INFO, "%{public}@[HAPAccessoryServerIP] Received notification context:%{public}@ in read response for characteristic instanceId: %{public}@", v194, 0x20u);

                v15 = 0;
                v45 = v169;
              }

              objc_autoreleasePoolPop(v87);
              v85 = v162;
            }
            else
            {
              objc_msgSend(v85, "setNotificationContext:", 0);
            }
            +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v85, v161);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            if (v161)
            {
              objc_msgSend(v162, "service");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "accessory");
              v93 = (void *)objc_claimAutoreleasedReturnValue();

              v157 = v93;
              objc_msgSend(v93, "server");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              context = (void *)MEMORY[0x1D17B7244]();
              v95 = v94;
              HMFGetOSLogHandle();
              v96 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "instanceID");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "instanceID");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "type");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v194 = 138544386;
                v195 = v97;
                v196 = 2114;
                v197 = (uint64_t)v98;
                v198 = 2114;
                v199 = v99;
                v200 = 2114;
                v201 = (uint64_t)v100;
                v202 = 2114;
                v203 = v161;
                _os_log_impl(&dword_1CCE01000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Read response for characteristic %{public}@/%{public}@/%{public}@ with error: %{public}@", v194, 0x34u);

                v47 = v168;
                v45 = v169;

              }
              objc_autoreleasePoolPop(context);

              v15 = 0;
              v37 = v174;
            }
            objc_msgSend(v167, "addObject:", v91);

            v52 = 0;
            goto LABEL_83;
          }
        }
        else
        {
          v72 = 12;
        }
        +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = 0;
        objc_msgSend(v80, "reverseTransformedValue:format:error:", v168, v72, &v183);
        v76 = (id)objc_claimAutoreleasedReturnValue();
        v81 = v183;

        v161 = v81;
        if (!v81)
          goto LABEL_68;
        v159 = v76;
        v82 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v194 = 138543874;
          v195 = v84;
          v196 = 2114;
          v197 = (uint64_t)v168;
          v198 = 2112;
          v199 = v161;
          _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Failed to transform value '%{public}@' with error: %@", v194, 0x20u);

        }
        objc_autoreleasePoolPop(v82);
        v52 = 1;
        v15 = 0;
        v45 = v169;
LABEL_83:

        goto LABEL_35;
      }
LABEL_53:

LABEL_60:
      v77 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v78 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v16 = v172;
      v37 = v174;
      v47 = v168;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v194 = 138544130;
        v195 = v79;
        v196 = 2114;
        v197 = (uint64_t)v177;
        v198 = 2114;
        v199 = v178;
        v200 = 2112;
        v201 = (uint64_t)v168;
        _os_log_impl(&dword_1CCE01000, v78, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%@': characteristic was not requested to be read", v194, 0x2Au);

        v15 = 0;
      }

      objc_autoreleasePoolPop(v77);
      v52 = 1;
      v45 = v169;
LABEL_35:

      if (v52)
      {

        v138 = 0;
        goto LABEL_115;
      }
LABEL_40:
      ++v39;
    }
    while (v39 != v175);
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, buf, 16);
    v175 = v101;
  }
  while (v101);
LABEL_85:

  if (objc_msgSend(v163, "count"))
  {
    v102 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v103 = objc_claimAutoreleasedReturnValue();
    v33 = v158;
    v104 = v160;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v105 = v15;
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v163, "count");
      *(_DWORD *)v194 = 138543618;
      v195 = v106;
      v196 = 2050;
      v197 = v107;
      _os_log_impl(&dword_1CCE01000, v103, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, '%{public}lu' request tuples remain unmatched with a response object", v194, 0x16u);

      v15 = v105;
    }

    objc_autoreleasePoolPop(v102);
    v138 = 0;
  }
  else
  {
    v138 = v167;
LABEL_115:
    v33 = v158;
    v104 = v160;
  }

LABEL_117:
  -[HAPAccessoryServerIP ipConnectionStatistics](v166, "ipConnectionStatistics");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "accessoryServerIPEvent:", 6);

  if (objc_msgSend(v138, "count"))
  {
    v118 = 0;
  }
  else
  {
    v140 = v33;
    v141 = (void *)MEMORY[0x1D17B7244]();
    v142 = v166;
    HMFGetOSLogHandle();
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = HTTPGetReasonPhrase();
      v146 = CFSTR("HAP JSON");
      *(_DWORD *)buf = 138544386;
      v205 = v144;
      v206 = 1026;
      *(_DWORD *)v207 = v171;
      *(_WORD *)&v207[4] = 2082;
      *(_QWORD *)&v207[6] = v145;
      *(_WORD *)&v207[14] = 2114;
      *(_QWORD *)&v207[16] = CFSTR("HAP JSON");
      *(_WORD *)&v207[24] = 2114;
      *(_QWORD *)&v207[26] = v140;
      _os_log_impl(&dword_1CCE01000, v143, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response objects for a read request, the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      v15 = 0;
    }

    objc_autoreleasePoolPop(v141);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v138 = 0;
    v37 = v174;
  }
  v116 = v176;
  if (!v37)
  {
    v14 = v164;
    if (!v16)
      goto LABEL_107;
    goto LABEL_106;
  }
  v22 = v37;
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v138 = v138;
  v147 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v179, v192, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v180;
    do
    {
      for (i = 0; i != v148; ++i)
      {
        if (*(_QWORD *)v180 != v149)
          objc_enumerationMutation(v138);
        v151 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
        objc_msgSend(v151, "characteristic", v155);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "instanceID");

        objc_msgSend(v151, "error");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "domain");

        objc_msgSend(v151, "error");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "code");

      }
      v148 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v179, v192, 16);
    }
    while (v148);
  }

  v14 = v164;
  v15 = 0;
LABEL_100:
  v37 = v22;
  if (v16)
LABEL_106:
    v16[2](v16, v138, v118);
LABEL_107:

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
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  HAPAccessoryServerIP *v24;
  id v25;
  id v26;
  id v27;
  double v28;
  id v29;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc(MEMORY[0x1E0D28540]);
  v15 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 3165);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v14, "initWithName:", v17);

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894AC48;
  v23 = v11;
  v24 = self;
  v28 = a4;
  v25 = v12;
  v26 = v29;
  v27 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async(v18, block);

  __HMFActivityScopeLeave();
}

- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HAPAccessoryServerIP *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HAPAccessoryServerIP *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HAPAccessoryServerIP *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
      {
        v13 = -[HAPAccessoryServer requiresTimedWrite:](self, "requiresTimedWrite:", v10);
        v14 = (void *)MEMORY[0x1D17B7244]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v13)
        {
          if (v17)
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v18;
            v41 = 2114;
            v42 = v10;
            _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristicWriteRequestTuples %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          -[HAPAccessoryServerIP _performTimedWriteValues:timeout:queue:completionHandler:](v15, "_performTimedWriteValues:timeout:queue:completionHandler:", v10, v11, v12, a4);
        }
        else
        {
          if (v17)
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v40 = v33;
            v41 = 2114;
            v42 = v10;
            _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristicWriteRequestTuples %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          -[HAPAccessoryServerIP _performWriteValues:timeout:queue:completionHandler:](v15, "_performWriteValues:timeout:queue:completionHandler:", v10, v11, v12, a4);
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D17B7244]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v32;
          _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing write", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        -[HAPAccessoryServerIP _queueWriteCharacteristicValues:timeout:queue:withCompletionHandler:](v30, "_queueWriteCharacteristicValues:timeout:queue:withCompletionHandler:", v10, v11, v12, a4);
        -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v30, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.write"));
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v28;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Writing 0 characteristics, bailing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      if (v12)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke_189;
        v34[3] = &unk_1E894D498;
        v35 = v12;
        dispatch_async(v11, v34);

      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1D17B7400](v12);
      *(_DWORD *)buf = 138543874;
      v40 = v22;
      v41 = 2114;
      v42 = 0;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to write values because the characteristicWriteRequestTuples was %{public}@ and the completion handler was %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E894D5E0;
      v38 = v12;
      v37 = v24;
      dispatch_async(v11, block);

    }
  }

}

- (void)_handleWriteECONNResetError:(id)a3 writeRequests:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  NSObject *v31;
  id v32;
  double v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmf_errorForKey:", *MEMORY[0x1E0CB3388]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0CB2F90]) && objc_msgSend(v20, "code") == 54)
  {
    v22 = -[HAPAccessoryServerIP econnresetRetryInProgress](self, "econnresetRetryInProgress");

    if (!v22)
    {
      -[HAPAccessoryServer clientQueue](self, "clientQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E894D608;
      block[4] = self;
      v30 = v15;
      v33 = a6;
      v31 = v17;
      v32 = v18;
      dispatch_async(v23, block);

      v24 = v30;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v18)
  {
    -[HAPAccessoryServerIP _indicateSessionActivityWithReason:](self, "_indicateSessionActivityWithReason:", CFSTR("Write"));
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke_197;
    v25[3] = &unk_1E894D9E8;
    v28 = v18;
    v26 = v16;
    v27 = v14;
    dispatch_async(v17, v25);

    v24 = v28;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_performWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *queue;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38[2];
  id from;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  id v43;
  id v44[2];
  id location;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  const __CFString *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  queue = a5;
  v11 = a6;
  v49 = 0;
  v25 = v10;
  -[HAPAccessoryServerIP _serializeCharacteristicWriteRequestTuples:error:](self, v10, &v49);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v49;
  v13 = v12;
  if (v11 && v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E894D5E0;
    v48 = v11;
    v47 = v13;
    dispatch_async(queue, block);

    v14 = v48;
  }
  else
  {
    v50 = CFSTR("characteristics");
    v51[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2;
    v40[3] = &unk_1E8949168;
    objc_copyWeak(v44, &location);
    v15 = v10;
    v41 = v15;
    v44[1] = *(id *)&a4;
    v16 = queue;
    v42 = v16;
    v17 = v11;
    v43 = v17;
    v18 = (void *)MEMORY[0x1D17B7400](v40);
    v19 = objc_alloc_init(MEMORY[0x1E0D28550]);
    objc_initWeak(&from, v19);
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_4;
    v32[3] = &unk_1E89491E0;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(v38, &location);
    v21 = v20;
    v33 = v21;
    v34 = v15;
    v38[1] = *(id *)&a4;
    v14 = v24;
    v35 = v14;
    v22 = v18;
    v36 = v22;
    objc_msgSend(v19, "addExecutionBlock:", v32);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2_204;
    v28[3] = &unk_1E894DC48;
    objc_copyWeak(&v31, &from);
    v30 = v17;
    v29 = v16;
    objc_msgSend(v19, "setCompletionBlock:", v28);
    -[HAPAccessoryServerIP clientOperationQueue](self, "clientOperationQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v19);

    objc_destroyWeak(&v31);
    objc_destroyWeak(v38);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&from);
    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }

}

- (void)_performTimedWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  dispatch_queue_t queue;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51[2];
  id from;
  id location;
  _QWORD block[4];
  id v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  queue = (dispatch_queue_t)a5;
  v9 = a6;
  v56 = 0;
  HMFRandomDataWithLength();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "getBytes:length:", &v56, 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E89893F8, CFSTR("ttl"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, CFSTR("pid"));
  if (!v9 || v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D28550]);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    v12 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2;
    v45[3] = &unk_1E8949208;
    objc_copyWeak(&v50, &location);
    objc_copyWeak(v51, &from);
    v46 = v31;
    v13 = v28;
    v47 = v13;
    v51[1] = *(id *)&a4;
    v14 = queue;
    v48 = v14;
    v15 = v9;
    v49 = v15;
    v16 = (void *)MEMORY[0x1D17B7400](v45);
    v40[0] = v12;
    v40[1] = 3221225472;
    v40[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_4;
    v40[3] = &unk_1E894AF40;
    objc_copyWeak(&v43, &from);
    objc_copyWeak(&v44, &location);
    v41 = v10;
    v26 = v16;
    v42 = v26;
    objc_msgSend(v11, "addExecutionBlock:", v40);
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2_207;
    v36[3] = &unk_1E894DC48;
    objc_copyWeak(&v39, &from);
    v38 = v15;
    v37 = v14;
    objc_msgSend(v11, "setCompletionBlock:", v36);
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v23 = v17;
            objc_msgSend(v22, "characteristic");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "instanceID");

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
        }
        while (v19);
      }

    }
    -[HAPAccessoryServerIP clientOperationQueue](self, "clientOperationQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addOperation:", v11);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v43);

    objc_destroyWeak(v51);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E894D498;
    v55 = v9;
    dispatch_async(queue, block);
    v11 = v55;
  }

}

- (void)_performExecuteWriteValues:(id)a3 prepareIdentifier:(id)a4 timeout:(double)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(id *, void *, uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33[2];
  id location;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v41 = 0;
  -[HAPAccessoryServerIP _serializeCharacteristicWriteRequestTuples:error:](self, v12, &v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v41;
  v18 = v17;
  if (v15 && v14 && v17)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E894D5E0;
    v40 = v15;
    v18 = v18;
    v39 = v18;
    dispatch_async(v14, block);

    v19 = &v40;
  }
  else
  {
    if (v13)
    {
      v42[0] = CFSTR("characteristics");
      v42[1] = CFSTR("pid");
      v43[0] = v16;
      v43[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v27 = 3221225472;
      v28 = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_3;
      v29 = &unk_1E8949168;
      v26 = MEMORY[0x1E0C809B0];
      objc_copyWeak(v33, &location);
      v30 = v12;
      v33[1] = *(id *)&a5;
      v31 = v14;
      v32 = v15;
      v21 = (void *)MEMORY[0x1D17B7400](&v26);
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("characteristics"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 10.0;
      if (a5 > 0.0)
        v23 = a5;
      -[HAPAccessoryServerIP sendPUTRequestToURL:request:serializationType:timeout:completionHandler:](self, "sendPUTRequestToURL:request:serializationType:timeout:completionHandler:", v22, v20, 1, v21, v23, v33, v26, v27, v28, v29);

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == 0 || v15 == 0)
    {
      v18 = v24;
      goto LABEL_11;
    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_2;
    v35[3] = &unk_1E894D5E0;
    v37 = v15;
    v18 = v24;
    v36 = v18;
    dispatch_async(v14, v35);

    v19 = &v37;
  }
  v20 = *v19;
LABEL_10:

LABEL_11:
}

- (void)_handlePrepareWriteResponseObject:(id)a3 type:(unint64_t)a4 prepareIdentifier:(id)a5 httpStatus:(int)a6 error:(id)a7 requestTuples:(id)a8 timeout:(double)a9 queue:(id)a10 originalCompletion:(id)a11 completion:(id)a12
{
  id v19;
  id v20;
  void (**v21)(id, _QWORD, id);
  void *v22;
  HAPAccessoryServerIP *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HAPAccessoryServerIP *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  HAPAccessoryServerIP *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  char isKindOfClass;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  HAPAccessoryServerIP *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HAPAccessoryServerIP *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  HAPAccessoryServerIP *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void (**v66)(id, _QWORD, id);
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  _BYTE v75[24];
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v68 = a5;
  v20 = a7;
  v71 = a8;
  v70 = a10;
  v69 = a11;
  v21 = (void (**)(id, _QWORD, id))a12;
  v22 = (void *)MEMORY[0x1D17B7244]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v73 = v25;
    v74 = 1026;
    *(_DWORD *)v75 = a6;
    *(_WORD *)&v75[4] = 2082;
    *(_QWORD *)&v75[6] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Received prepare write response with '%{public}d %{public}s' HTTP status code", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v20)
  {
    v66 = v21;
    v28 = (void *)MEMORY[0x1D17B7244]();
    v29 = v23;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v32 = v69;
    v31 = v70;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v33;
      v74 = 2114;
      *(_QWORD *)v75 = v20;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare write characteristic because the HTTP request returned the following error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(v20, "domain");

    objc_msgSend(v20, "code");
    if (objc_msgSend(v20, "code") == -6723 || objc_msgSend(v20, "code") == -6753)
    {
      v34 = v19;
      v35 = v27;
      v36 = (void *)MEMORY[0x1D17B7244]();
      v37 = v29;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v39;
        _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v36);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 4, 0, v20);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v35;
      v19 = v34;
    }
    else
    {
      v40 = v20;
    }
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v29, "_tearDownSessionAndStartReachabilityWithError:", v20);
    v21 = v66;
    v51 = v68;
    v52 = v71;
    if (v66)
      v66[2](v66, 0, v40);
  }
  else
  {
    v67 = (void *)v26;
    if (a6 == 200
      && (v41 = v19, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v41, a4 == 1)
      && (isKindOfClass & 1) != 0
      && v41)
    {
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("status"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v43)
      {
        v45 = objc_msgSend(v43, "intValue");
        v46 = (void *)MEMORY[0x1D17B7244]();
        v47 = v23;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v45)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v73 = v50;
            v74 = 2114;
            *(_QWORD *)v75 = v44;
            *(_WORD *)&v75[8] = 2114;
            *(_QWORD *)&v75[10] = v41;
            _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Prepare write failed with HAP Status Code %{public}@ and a body: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v46);
          HMErrorFromHAPIPStatusErrorCode((void *)objc_msgSend(v44, "integerValue"));
          v40 = (id)objc_claimAutoreleasedReturnValue();
          if (v21)
            v21[2](v21, 0, v40);
          v51 = v68;
          v32 = v69;
          v31 = v70;
          v52 = v71;
        }
        else
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v73 = v64;
            v74 = 2112;
            *(_QWORD *)v75 = v71;
            _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_INFO, "%{public}@Performing execute write for inCharacteristicWriteRequestTuples %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v46);
          v31 = v70;
          v52 = v71;
          v51 = v68;
          v32 = v69;
          -[HAPAccessoryServerIP _performExecuteWriteValues:prepareIdentifier:timeout:queue:completionHandler:](v47, "_performExecuteWriteValues:prepareIdentifier:timeout:queue:completionHandler:", v71, v68, v70, v69, a9);
          v40 = 0;
        }
      }
      else
      {
        v60 = (void *)MEMORY[0x1D17B7244]();
        v61 = v23;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = v63;
          _os_log_impl(&dword_1CCE01000, v62, OS_LOG_TYPE_ERROR, "%{public}@Invalid prepare write response", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v60);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 59);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        v32 = v69;
        v31 = v70;
        if (v21)
          v21[2](v21, 0, v40);
        v51 = v68;
        v52 = v71;
      }
      v27 = v67;

    }
    else
    {
      v53 = (void *)MEMORY[0x1D17B7244]();
      v54 = v23;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v65 = v53;
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = HTTPGetReasonPhrase();
        if (a4 - 1 > 3)
          v58 = CFSTR("Invalid");
        else
          v58 = off_1E894BB00[a4 - 1];
        v59 = v58;
        *(_DWORD *)buf = 138544386;
        v73 = v56;
        v74 = 1026;
        *(_DWORD *)v75 = a6;
        *(_WORD *)&v75[4] = 2082;
        *(_QWORD *)&v75[6] = v57;
        *(_WORD *)&v75[14] = 2114;
        *(_QWORD *)&v75[16] = v59;
        v76 = 2114;
        v77 = v19;
        _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare write characteristic because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

        v53 = v65;
      }

      objc_autoreleasePoolPop(v53);
      v32 = v69;
      v31 = v70;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v67;
      if (v21)
        v21[2](v21, 0, v40);
      v51 = v68;
      v52 = v71;
    }
  }

}

- (void)_handleWriteResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 requestTuples:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, id, void *);
  id v16;
  HAPAccessoryServerIP *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HAPAccessoryServerIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HAPAccessoryServerIP *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  _BOOL4 v37;
  void *v38;
  id v39;
  void *v40;
  HAPAccessoryServerIP *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  BOOL v57;
  void *v58;
  NSObject *v59;
  void *v60;
  int v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  HAPAccessoryServerIP *v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  HAPAccessoryServerIP *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  __CFString *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  HAPAccessoryServerIP *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  HAPAccessoryServerIP *v136;
  NSObject *v137;
  id v138;
  void *v139;
  void *v140;
  uint64_t v141;
  __CFString *v142;
  __CFString *v143;
  __CFString *v144;
  id v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  HAPAccessoryServerIP *v155;
  id v156;
  void *context;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id obj;
  void *v164;
  void *v165;
  id v166;
  int v167;
  uint64_t v168;
  void (**v169)(id, id, void *);
  uint64_t v170;
  void *v171;
  uint64_t v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _BYTE v195[128];
  _BYTE v196[128];
  uint8_t v197[128];
  uint8_t v198[4];
  void *v199;
  __int16 v200;
  uint64_t v201;
  __int16 v202;
  void *v203;
  __int16 v204;
  void *v205;
  __int16 v206;
  void *v207;
  uint8_t buf[4];
  void *v209;
  __int16 v210;
  _BYTE v211[24];
  __int16 v212;
  void *v213;
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v176 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void (**)(id, id, void *))a8;
  v16 = (id)MEMORY[0x1D17B7244]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v209 = v19;
    v210 = 2114;
    *(_QWORD *)v211 = v14;
    *(_WORD *)&v211[8] = 1026;
    *(_DWORD *)&v211[10] = a5;
    *(_WORD *)&v211[14] = 2082;
    *(_QWORD *)&v211[16] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Received write response with %{public}@ and '%{public}d %{public}s' HTTP status code", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = v17;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v209 = v24;
      v210 = 2114;
      *(_QWORD *)v211 = v13;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic because the HTTP request returned the following error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v14, "count");
    objc_msgSend(v13, "domain");

    objc_msgSend(v13, "code");
    -[HAPAccessoryServerIP ipConnectionStatistics](v22, "ipConnectionStatistics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessoryServerIPEvent:", 4);

    if (objc_msgSend(v13, "code") == -6723 || objc_msgSend(v13, "code") == -6753)
    {
      v26 = (void *)MEMORY[0x1D17B7244]();
      v27 = v22;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = v13;
        v30 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v209 = v31;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);

        v20 = v30;
        v13 = v29;
      }

      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 4, 0, v13);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = v13;
    }
    v38 = v32;
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v22, "_tearDownSessionAndStartReachabilityWithError:", v13);
    v39 = 0;
    v33 = v176;
    goto LABEL_139;
  }
  v169 = v15;
  if (a5 == 207 || a5 == 200)
  {
    v33 = v176;
    v34 = v176;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v16 = v35;

    v37 = a4 == 1 && v16 != 0;
  }
  else
  {
    v37 = 0;
    v33 = v176;
  }
  if (a5 == 207 || a5 == 200)

  v166 = v14;
  v167 = a5;
  if (!v37)
  {
    v102 = (void *)MEMORY[0x1D17B7244]();
    v103 = v17;
    HMFGetOSLogHandle();
    v104 = objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (a4 == 4 && !v33 && a5 == 204)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = HTTPGetReasonPhrase();
        *(_DWORD *)buf = 138543874;
        v209 = v106;
        v210 = 1026;
        *(_DWORD *)v211 = 204;
        *(_WORD *)&v211[4] = 2082;
        *(_QWORD *)&v211[6] = v107;
        _os_log_impl(&dword_1CCE01000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@Received write response with no body and a '%{public}d %{public}s' HTTP status code.", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v102);
      -[HAPAccessoryServerIP ipConnectionStatistics](v103, "ipConnectionStatistics");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "accessoryServerIPEvent:", 6);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v178 = 0u;
      v179 = 0u;
      v180 = 0u;
      v181 = 0u;
      v109 = v14;
      v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v178, v195, 16);
      if (v110)
      {
        v111 = v110;
        v165 = v20;
        v112 = 0;
        v113 = *(_QWORD *)v179;
        do
        {
          v114 = 0;
          v115 = v112;
          do
          {
            if (*(_QWORD *)v179 != v113)
              objc_enumerationMutation(v109);
            v116 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v114);
            objc_msgSend(v116, "characteristic");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "value");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "setValue:", v118);

            objc_msgSend(v116, "characteristic");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v119, 0);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "addObject:", v112);
            objc_msgSend(v116, "characteristic");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "instanceID");

            ++v114;
            v115 = v112;
          }
          while (v111 != v114);
          v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v178, v195, 16);
        }
        while (v111);

        v33 = v176;
        v14 = v166;
        v20 = v165;
      }

      v38 = 0;
      v15 = v169;
      goto LABEL_139;
    }
    v15 = v169;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      v125 = v20;
      HMFGetLogIdentifier();
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v128 = CFSTR("Invalid");
      else
        v128 = off_1E894BB00[a4 - 1];
      v143 = v128;
      *(_DWORD *)buf = 138544386;
      v209 = v126;
      v210 = 1026;
      *(_DWORD *)v211 = a5;
      *(_WORD *)&v211[4] = 2082;
      *(_QWORD *)&v211[6] = v127;
      *(_WORD *)&v211[14] = 2114;
      *(_QWORD *)&v211[16] = v143;
      v212 = 2114;
      v213 = v33;
      _os_log_impl(&dword_1CCE01000, v105, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      v15 = v169;
      v20 = v125;
      v13 = 0;
    }

    objc_autoreleasePoolPop(v102);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
LABEL_138:
    v14 = v166;
    goto LABEL_139;
  }
  v40 = (void *)MEMORY[0x1D17B7244]();
  v41 = v17;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = HTTPGetReasonPhrase();
    *(_DWORD *)buf = 138544130;
    v209 = v43;
    v210 = 1026;
    *(_DWORD *)v211 = a5;
    *(_WORD *)&v211[4] = 2082;
    *(_QWORD *)&v211[6] = v44;
    *(_WORD *)&v211[14] = 2114;
    *(_QWORD *)&v211[16] = v33;
    _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Characteristic write request responded with '%{public}d %{public}s' HTTP status code %{public}@", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v40);
  -[HAPAccessoryServerIP ipConnectionStatistics](v41, "ipConnectionStatistics");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "accessoryServerIPEvent:", 6);

  v46 = v33;
  v47 = v14;
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("characteristics"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v160 = v48;
  v161 = v46;
  v171 = v47;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v121 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v122 = objc_claimAutoreleasedReturnValue();
    v15 = v169;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v123 = v41;
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v209 = v124;
      v210 = 2114;
      *(_QWORD *)v211 = CFSTR("characteristics");
      _os_log_impl(&dword_1CCE01000, v122, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, %{public}@ key doesn't contain an NSArray", buf, 0x16u);

      v41 = v123;
    }

    objc_autoreleasePoolPop(v121);
    v39 = 0;
    v47 = v171;
    goto LABEL_118;
  }
  v49 = objc_msgSend(v48, "count");
  if (v49 != objc_msgSend(v47, "count"))
  {
    v129 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v130 = objc_claimAutoreleasedReturnValue();
    v15 = v169;
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v41;
      v133 = objc_msgSend(v160, "count");
      v134 = objc_msgSend(v171, "count");
      *(_DWORD *)buf = 138543874;
      v209 = v131;
      v210 = 2050;
      *(_QWORD *)v211 = v133;
      v41 = v132;
      *(_WORD *)&v211[8] = 2050;
      *(_QWORD *)&v211[10] = v134;
      _os_log_impl(&dword_1CCE01000, v130, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, '%{public}lu' response objects for '%{public}lu' request tuples", buf, 0x20u);

      v47 = v171;
    }

    objc_autoreleasePoolPop(v129);
    v39 = 0;
    goto LABEL_118;
  }
  v155 = v41;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v47);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  obj = v48;
  v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
  if (!v170)
    goto LABEL_87;
  v168 = *(_QWORD *)v192;
  v164 = v20;
  do
  {
    v50 = 0;
    do
    {
      v51 = v13;
      if (*(_QWORD *)v192 != v168)
        objc_enumerationMutation(obj);
      v52 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v50);
      objc_msgSend(v52, "hmf_numberForKey:", CFSTR("aid"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "hmf_numberForKey:", CFSTR("iid"));
      v54 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("value"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "hmf_numberForKey:", CFSTR("status"));
      v55 = objc_claimAutoreleasedReturnValue();
      v177 = (void *)v54;
      if (v53)
        v56 = v54 == 0;
      else
        v56 = 1;
      v175 = (void *)v55;
      v57 = v56 || v55 == 0;
      v173 = v50;
      if (v57)
      {
        v58 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v198 = 138544386;
          v199 = v60;
          v200 = 2114;
          v201 = (uint64_t)v177;
          v202 = 2114;
          v203 = v53;
          v204 = 2114;
          v205 = v174;
          v206 = 2114;
          v207 = v175;
          _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%{public}@' and HAP status code '%{public}@'", v198, 0x34u);

          v47 = v171;
        }

        objc_autoreleasePoolPop(v58);
        v61 = 1;
        goto LABEL_84;
      }
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v62 = v162;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v187, v197, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v188;
LABEL_51:
        v66 = 0;
        while (1)
        {
          if (*(_QWORD *)v188 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * v66);
          objc_msgSend(v67, "characteristic");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "service");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "accessory");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "instanceID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71)
          {
            if (objc_msgSend(v53, "isEqualToNumber:", v71))
            {
              objc_msgSend(v68, "instanceID");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v177, "isEqualToNumber:", v72);

              if ((v73 & 1) != 0)
                break;
            }
          }

          if (v64 == ++v66)
          {
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v187, v197, 16);
            if (v64)
              goto LABEL_51;
            goto LABEL_59;
          }
        }
        v74 = v67;

        if (!v74)
          goto LABEL_66;
        v20 = v164;
        if (v68)
        {
          objc_msgSend(v62, "removeObject:", v74);
          if (objc_msgSend(v175, "intValue"))
          {
            HMErrorFromHAPIPStatusErrorCode((void *)objc_msgSend(v175, "integerValue"));
            v75 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "service");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "accessory");
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            v158 = v77;
            objc_msgSend(v77, "server");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            context = (void *)MEMORY[0x1D17B7244]();
            v79 = v78;
            HMFGetOSLogHandle();
            v80 = objc_claimAutoreleasedReturnValue();
            v33 = v176;
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v158, "instanceID");
              v156 = v75;
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "instanceID");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "type");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v198 = 138544386;
              v199 = v81;
              v200 = 2114;
              v201 = (uint64_t)v82;
              v202 = 2114;
              v203 = v83;
              v204 = 2114;
              v205 = v84;
              v206 = 2114;
              v207 = v156;
              _os_log_impl(&dword_1CCE01000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Response for characteristic write %{public}@/%{public}@/%{public}@ with error: %{public}@", v198, 0x34u);

              v20 = v164;
              v75 = v156;

            }
            objc_autoreleasePoolPop(context);

            v47 = v171;
            v85 = v158;
            goto LABEL_82;
          }
          v89 = objc_msgSend(v74, "includeResponseValue");
          v33 = v176;
          if (v174)
          {
            v47 = v171;
            if (v89)
            {
              objc_msgSend(v68, "metadata");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "format");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = HAPCharacteristicFormatFromString(v91);

              +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v186 = 0;
              objc_msgSend(v93, "reverseTransformedValue:format:error:", v174, v92, &v186);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v186;

              if (!v75)
                objc_msgSend(v68, "setValue:", v85);
              v47 = v171;
              goto LABEL_82;
            }
            goto LABEL_81;
          }
          if ((v89 & 1) == 0)
          {
            objc_msgSend(v74, "includeResponseValue");
            v47 = v171;
LABEL_81:
            objc_msgSend(v74, "value");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setValue:", v85);
            v75 = 0;
LABEL_82:

            +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v68, v75);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "addObject:", v97);

            v61 = 0;
            goto LABEL_83;
          }
          v94 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v198 = 138543874;
            v199 = v96;
            v200 = 2114;
            v201 = (uint64_t)v177;
            v202 = 2114;
            v203 = v53;
            _os_log_impl(&dword_1CCE01000, v95, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@': response value is not included in the response when one is requested", v198, 0x20u);

          }
          objc_autoreleasePoolPop(v94);
          v61 = 1;
          goto LABEL_70;
        }
      }
      else
      {
LABEL_59:

        v68 = 0;
        v74 = 0;
LABEL_66:
        v20 = v164;
      }
      v86 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v198 = 138543874;
        v199 = v88;
        v200 = 2114;
        v201 = (uint64_t)v177;
        v202 = 2114;
        v203 = v53;
        _os_log_impl(&dword_1CCE01000, v87, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@': characteristic was not requested to be written", v198, 0x20u);

      }
      objc_autoreleasePoolPop(v86);
      v61 = 1;
      v33 = v176;
LABEL_70:
      v47 = v171;
LABEL_83:

      v51 = 0;
LABEL_84:

      if (v61)
      {

        v39 = 0;
        v15 = v169;
        v13 = v51;
LABEL_116:
        v41 = v155;
        goto LABEL_117;
      }
      v50 = v173 + 1;
      v13 = v51;
    }
    while (v173 + 1 != v170);
    v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
  }
  while (v170);
LABEL_87:

  if (!objc_msgSend(v162, "count"))
  {
    v39 = v159;
    v15 = v169;
    goto LABEL_116;
  }
  v98 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v99 = objc_claimAutoreleasedReturnValue();
  v41 = v155;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v162, "count");
    *(_DWORD *)v198 = 138543618;
    v199 = v100;
    v200 = 2050;
    v201 = v101;
    _os_log_impl(&dword_1CCE01000, v99, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, '%{public}lu' request tuples remain unmatched with a response object", v198, 0x16u);

  }
  objc_autoreleasePoolPop(v98);
  v39 = 0;
  v15 = v169;
LABEL_117:

LABEL_118:
  if (!objc_msgSend(v39, "count"))
  {
    v135 = (void *)MEMORY[0x1D17B7244]();
    v136 = v41;
    HMFGetOSLogHandle();
    v137 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      v138 = v13;
      v139 = v20;
      HMFGetLogIdentifier();
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v142 = CFSTR("Invalid");
      else
        v142 = off_1E894BB00[a4 - 1];
      v144 = v142;
      *(_DWORD *)buf = 138544386;
      v209 = v140;
      v210 = 1026;
      *(_DWORD *)v211 = v167;
      *(_WORD *)&v211[4] = 2082;
      *(_QWORD *)&v211[6] = v141;
      *(_WORD *)&v211[14] = 2114;
      *(_QWORD *)&v211[16] = v144;
      v212 = 2114;
      v213 = v161;
      _os_log_impl(&dword_1CCE01000, v137, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse response objects for a write request, the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      v15 = v169;
      v20 = v139;
      v13 = v138;
    }

    objc_autoreleasePoolPop(v135);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0;
    if (v20)
      goto LABEL_130;
    goto LABEL_138;
  }
  v38 = 0;
  if (!v20)
    goto LABEL_138;
LABEL_130:
  v145 = v13;
  v146 = v20;
  v184 = 0u;
  v185 = 0u;
  v182 = 0u;
  v183 = 0u;
  v39 = v39;
  v147 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v182, v196, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v183;
    do
    {
      for (i = 0; i != v148; ++i)
      {
        if (*(_QWORD *)v183 != v149)
          objc_enumerationMutation(v39);
        v151 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
        objc_msgSend(v151, "characteristic");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "instanceID");

        objc_msgSend(v151, "error");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "domain");

        objc_msgSend(v151, "error");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "code");

      }
      v148 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v182, v196, 16);
    }
    while (v148);
  }

  v14 = v166;
  v15 = v169;
  v20 = v146;
  v13 = v145;
LABEL_139:
  if (v15)
    v15[2](v15, v39, v38);

}

- (void)sendPUTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HAPAccessoryServerIP *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0C99E60];
      v29 = CFSTR("authData");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "secureDescriptionWithBlacklistKeys:", v22);
      v28 = v16;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v19;
      v32 = 2114;
      v33 = v12;
      v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sending PUT request to '%{public}@' with body %{public}@", buf, 0x20u);

      v16 = v28;
    }

    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[HAPAccessoryServerIP _kickConnectionIdleTimer](v17, "_kickConnectionIdleTimer", v28);
    -[HAPAccessoryServerIP httpClient](v17, "httpClient");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sendPUTRequestToURL:withRequestObject:serializationType:timeout:completionHandler:", v12, v13, a5, v14, a6);

  }
  else
  {
    -[HAPAccessoryServerIP handleHTTPClientUnavailableErrorWithCompletion:serializationType:](self, "handleHTTPClientUnavailableErrorWithCompletion:serializationType:", v14, a5);
  }

}

- (void)sendPOSTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Sending POST request to '%@'", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HAPAccessoryServerIP _kickConnectionIdleTimer](v15, "_kickConnectionIdleTimer");
    -[HAPAccessoryServerIP httpClient](v15, "httpClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendPOSTRequestToURL:withRequestObject:serializationType:completionHandler:", v10, v11, a5, v12);

  }
  else
  {
    -[HAPAccessoryServerIP handleHTTPClientUnavailableErrorWithCompletion:serializationType:](self, "handleHTTPClientUnavailableErrorWithCompletion:serializationType:", v12, a5);
  }

}

- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HAPAccessoryServerIP *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending GET request to '%{public}@'", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[HAPAccessoryServerIP _kickConnectionIdleTimer](v12, "_kickConnectionIdleTimer");
    -[HAPAccessoryServerIP httpClient](v12, "httpClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendGETRequestToURL:timeout:completionHandler:", v8, v9, a4);

  }
  else
  {
    -[HAPAccessoryServerIP handleHTTPClientUnavailableErrorWithCompletion:serializationType:](self, "handleHTTPClientUnavailableErrorWithCompletion:serializationType:", v9, 1);
  }

}

- (void)handleHTTPClientUnavailableErrorWithCompletion:(id)a3 serializationType:(unint64_t)a4
{
  void (**v6)(id, _QWORD, unint64_t, uint64_t, void *);
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, unint64_t, uint64_t, void *))a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to handle request because httpClient has been deallocated", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, a4, 503, v11);

}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HAPAccessoryServerIP_handleUpdatesForCharacteristics_stateNumber___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  HAPAccessoryServerIP *v25;
  void *v26;
  id v27;
  void *v28;
  id obj;
  _QWORD block[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))goto LABEL_23;
  v25 = self;
  v26 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v6;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v9)
    goto LABEL_18;
  v10 = v9;
  v11 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v13, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("00000125-0000-1000-8000-0026BB765291")) & 1) != 0)
      {
        objc_msgSend(v13, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("00000126-0000-1000-8000-0026BB765291"));

        if (v17)
        {
          +[HAPCharacteristicEvent eventWithCharacteristic:](HAPCharacteristicEvent, "eventWithCharacteristic:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v18);

          goto LABEL_16;
        }
      }
      else
      {

      }
      objc_msgSend(v14, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("00000125-0000-1000-8000-0026BB765291")) & 1) == 0)
        goto LABEL_14;
      objc_msgSend(v13, "type");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("000000E7-0000-1000-8000-0026BB765291"));

      if (v21)
      {
        +[HAPCharacteristicEvent eventWithCharacteristic:](HAPCharacteristicEvent, "eventWithCharacteristic:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v19);
LABEL_14:

      }
      objc_msgSend(v8, "addObject:", v13);
LABEL_16:

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  }
  while (v10);
LABEL_18:

  if (objc_msgSend(v28, "count"))
  {
    v37 = CFSTR("HAPCharacteristicEvents");
    v38 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("HAPCharacteristicEventNotification"), 0, v22);

  }
  v7 = v26;
  if (objc_msgSend(v8, "count"))
  {
    -[HAPAccessoryServer delegateQueue](v25, "delegateQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__HAPAccessoryServerIP__handleUpdatesForCharacteristics_stateNumber___block_invoke;
    block[3] = &unk_1E894E120;
    block[4] = v25;
    v31 = v8;
    v32 = v26;
    dispatch_async(v24, block);

  }
  v6 = v27;
LABEL_23:

}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HAPAccessoryServerIP_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  block[3] = &unk_1E894D518;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  HAPAccessoryServerIP *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  HAPAccessoryServerIP *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  HAPAccessoryServerIP *v43;
  void *v44;
  HAPAccessoryServerIP *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HAPAccessoryServerIP *v49;
  NSObject *v50;
  void *v51;
  HAPAccessoryServerIP *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id obj;
  _BOOL4 v57;
  _QWORD v58[5];
  id v59;
  NSObject *v60;
  id v61;
  BOOL v62;
  _QWORD v63[4];
  id v64;
  _QWORD block[4];
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  const __CFString *v72;
  id v73;
  _QWORD v74[3];
  _QWORD v75[3];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint8_t v80[4];
  void *v81;
  uint64_t v82;

  v57 = a3;
  v82 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v54 = a6;
  v11 = v9;
  v55 = v11;
  if (self)
  {
    v12 = v11;
    v52 = self;
    v53 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v69;
LABEL_4:
      v19 = 0;
      v20 = (void *)v16;
      v21 = (void *)v17;
      while (1)
      {
        if (*(_QWORD *)v69 != v18)
          objc_enumerationMutation(obj);
        v22 = v13;
        v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v19);
        if ((objc_msgSend(v23, "properties") & 1) == 0)
          break;
        objc_msgSend(v23, "service");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accessory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "instanceID");
        v17 = objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v30 = (void *)MEMORY[0x1D17B7244]();
          self = v52;
          v35 = v52;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v77 = v36;
            v78 = 2112;
            v79 = v23;
            _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize event request for characteristic %@ because the accessory instance ID was nil.", buf, 0x16u);

          }
          v21 = 0;
          v34 = 20;
LABEL_20:
          v13 = v22;

          objc_autoreleasePoolPop(v30);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", v34);
          v29 = (id)objc_claimAutoreleasedReturnValue();

          v28 = 0;
          goto LABEL_21;
        }
        v75[0] = v17;
        v74[0] = CFSTR("aid");
        v74[1] = CFSTR("iid");
        objc_msgSend(v23, "instanceID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v75[1] = v26;
        v74[2] = CFSTR("ev");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v75[2] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = v22;
        objc_msgSend(v22, "addObject:", v16);
        ++v19;
        v20 = (void *)v16;
        v21 = (void *)v17;
        if (v15 == v19)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v30 = (void *)MEMORY[0x1D17B7244]();
      self = v52;
      v31 = v52;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v33;
        v78 = 2112;
        v79 = v23;
        _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@Characteristic doesn't support notifications: %@", buf, 0x16u);

      }
      v34 = 3;
      goto LABEL_20;
    }
    v16 = 0;
    v17 = 0;
LABEL_13:

    v28 = v13;
    v29 = 0;
    v21 = (void *)v17;
    v20 = (void *)v16;
    self = v52;
LABEL_21:

    v10 = v53;
  }
  else
  {
    v29 = 0;
    v28 = 0;
  }

  v37 = v29;
  if (!v28)
  {
    v40 = v54;
    if (!v10)
      goto LABEL_36;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E894D5E0;
    v67 = v10;
    v66 = v37;
    dispatch_async(v54, block);

    v41 = v67;
LABEL_32:

    goto LABEL_36;
  }
  if (objc_msgSend(v28, "count"))
  {
    if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
    {
      v72 = CFSTR("characteristics");
      v73 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("characteristics"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_256;
      v58[3] = &unk_1E8949230;
      v58[4] = self;
      v59 = v55;
      v62 = v57;
      v61 = v10;
      v40 = v54;
      v60 = v54;
      -[HAPAccessoryServerIP sendPUTRequestToURL:request:serializationType:timeout:completionHandler:](self, "sendPUTRequestToURL:request:serializationType:timeout:completionHandler:", v39, v38, 1, v58, 10.0);

    }
    else
    {
      v48 = (void *)MEMORY[0x1D17B7244]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v80 = 138543362;
        v81 = v51;
        _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing enableEvents", v80, 0xCu);

      }
      objc_autoreleasePoolPop(v48);
      v40 = v54;
      -[HAPAccessoryServerIP _queueEnableEvents:forCharacteristics:withCompletionHandler:queue:](v49, "_queueEnableEvents:forCharacteristics:withCompletionHandler:queue:", v57, v55, v10, v54);
      -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v49, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.events"));
    }
    goto LABEL_36;
  }
  v42 = MEMORY[0x1D17B7244]();
  v43 = self;
  v44 = (void *)v42;
  v45 = v43;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v80 = 138543362;
    v81 = v47;
    _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Modifying 0 characteristics, bailing", v80, 0xCu);

  }
  objc_autoreleasePoolPop(v44);
  v40 = v54;
  if (v10)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_253;
    v63[3] = &unk_1E894D498;
    v64 = v10;
    dispatch_async(v54, v63);
    v41 = v64;
    goto LABEL_32;
  }
LABEL_36:

}

- (void)_handleEventResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 requestedEventState:(BOOL)a8 completion:(id)a9 queue:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  HAPAccessoryServerIP *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HAPAccessoryServerIP *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HAPAccessoryServerIP *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  HAPAccessoryServerIP *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  HAPAccessoryServerIP *v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  __CFString *v97;
  void *v98;
  HAPAccessoryServerIP *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  HAPAccessoryServerIP *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  HAPAccessoryServerIP *v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  __CFString *v115;
  __CFString *v116;
  HAPAccessoryServerIP *v117;
  void *v118;
  __int128 v119;
  _BOOL4 v120;
  void *v121;
  void *v122;
  HAPAccessoryServerIP *v123;
  id obj;
  uint64_t v125;
  uint64_t v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  id v134;
  id v135;
  id v136;
  NSObject *v137;
  HAPAccessoryServerIP *v138;
  _QWORD block[4];
  id v140;
  id v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint8_t v155[128];
  uint8_t v156[4];
  void *v157;
  __int16 v158;
  uint64_t v159;
  __int16 v160;
  void *v161;
  __int16 v162;
  void *v163;
  __int16 v164;
  void *v165;
  uint8_t v166[128];
  uint8_t buf[4];
  void *v168;
  __int16 v169;
  _BYTE v170[24];
  __int16 v171;
  id v172;
  uint64_t v173;

  v10 = a8;
  v173 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a6;
  v18 = a7;
  v135 = a9;
  v136 = v16;
  v137 = a10;
  v138 = self;
  if (v17)
  {
    v19 = v18;
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v168 = v23;
      v169 = 2112;
      *(_QWORD *)v170 = v17;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting notification registration failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v24 = v137;
    if (objc_msgSend(v17, "code") == -6723 || objc_msgSend(v17, "code") == -6753)
    {
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = v21;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v168 = v28;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Interpreting error as unreachable", buf, 0xCu);

        v24 = v137;
      }

      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 4, 0, v17);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = v17;
    }
    v93 = v29;
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v21, "_tearDownSessionAndStartReachabilityWithError:", v17);
    v79 = 0;
    v30 = v19;
    goto LABEL_67;
  }
  v134 = v18;
  v30 = v18;
  if (v16 && a4 == 1 && a5 == 207)
  {
    v31 = (void *)MEMORY[0x1D17B7244]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v168 = v34;
      v169 = 1024;
      *(_DWORD *)v170 = 207;
      v30 = v134;
      *(_WORD *)&v170[4] = 2080;
      *(_QWORD *)&v170[6] = HTTPGetReasonPhrase();
      *(_WORD *)&v170[14] = 2112;
      *(_QWORD *)&v170[16] = v16;
      _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@Characteristic event registration request responded with '%d %s' HTTP status code %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v31);
    v35 = v16;
    v36 = v30;
    v127 = v35;
    if (v32)
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("characteristics"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      v132 = v36;
      v128 = v37;
      if (v38 == objc_msgSend(v36, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v36);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = 0u;
        v152 = 0u;
        v153 = 0u;
        v154 = 0u;
        obj = v37;
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
        if (v125)
        {
          v126 = *(_QWORD *)v152;
          *(_QWORD *)&v39 = 138544386;
          v119 = v39;
          v123 = v32;
          v120 = v10;
LABEL_18:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v152 != v126)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v40);
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("aid"), v119);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("iid"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("status"));
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = !v42 || v43 == 0;
            v133 = (void *)v44;
            if (v45 || v44 == 0)
              break;
            v131 = v40;
            v47 = v42;
            v149 = 0u;
            v150 = 0u;
            v148 = 0u;
            v147 = 0u;
            v48 = v130;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
            if (!v49)
            {
LABEL_79:

LABEL_80:
              v105 = (void *)MEMORY[0x1D17B7244]();
              v106 = v123;
              HMFGetOSLogHandle();
              v107 = objc_claimAutoreleasedReturnValue();
              v42 = v47;
              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v156 = 138543874;
                v157 = v108;
                v158 = 2112;
                v159 = (uint64_t)v43;
                v160 = 2112;
                v161 = v47;
                _os_log_impl(&dword_1CCE01000, v107, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response for characteristic ID '%@' against accessory '%@': characteristic was not requested to change event registration", v156, 0x20u);

              }
              v30 = v134;
              goto LABEL_83;
            }
            v50 = v49;
            v51 = *(_QWORD *)v148;
LABEL_30:
            v52 = 0;
            while (1)
            {
              if (*(_QWORD *)v148 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v52);
              objc_msgSend(v53, "service");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "accessory");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "instanceID");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v56)
              {
                if (objc_msgSend(v47, "isEqualToNumber:", v56))
                {
                  objc_msgSend(v53, "instanceID");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = objc_msgSend(v43, "isEqualToNumber:", v57);

                  if ((v58 & 1) != 0)
                    break;
                }
              }

              if (v50 == ++v52)
              {
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
                if (v50)
                  goto LABEL_30;
                goto LABEL_79;
              }
            }
            v59 = v53;

            if (!v59)
              goto LABEL_80;
            objc_msgSend(v48, "removeObject:", v59);
            v60 = v133;
            if (objc_msgSend(v133, "intValue"))
            {
              HMErrorFromHAPIPStatusErrorCode((void *)objc_msgSend(v133, "integerValue"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "service");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "accessory");
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              v64 = (void *)MEMORY[0x1D17B7244]();
              v65 = v123;
              HMFGetOSLogHandle();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "instanceID");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "instanceID");
                v121 = v64;
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "type");
                v122 = v43;
                v70 = v47;
                v71 = v63;
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v156 = v119;
                v157 = v67;
                v158 = 2112;
                v159 = (uint64_t)v68;
                v160 = 2112;
                v161 = v69;
                v162 = 2112;
                v163 = v72;
                v164 = 2112;
                v165 = v61;
                _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Event response for characteristic %@/%@/%@ with error: %@", v156, 0x34u);

                v63 = v71;
                v47 = v70;
                v43 = v122;

                v64 = v121;
                v60 = v133;

              }
              objc_autoreleasePoolPop(v64);

            }
            else
            {
              objc_msgSend(v59, "setEventNotificationsEnabled:", v120);
              v61 = 0;
            }
            +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v59, v61);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "addObject:", v73);

            v36 = v132;
            v40 = v131 + 1;
            v17 = 0;
            v30 = v134;
            if (v131 + 1 == v125)
            {
              v16 = v136;
              v32 = v123;
              v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, buf, 16);
              if (v125)
                goto LABEL_18;
              goto LABEL_47;
            }
          }
          v105 = (void *)MEMORY[0x1D17B7244]();
          v117 = v123;
          HMFGetOSLogHandle();
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v156 = 138544130;
            v157 = v118;
            v158 = 2112;
            v159 = (uint64_t)v43;
            v160 = 2112;
            v161 = v42;
            v162 = 2112;
            v163 = v133;
            _os_log_impl(&dword_1CCE01000, v107, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response for characteristic ID '%@' against accessory '%@' and HAP status code '%@'", v156, 0x2Au);

          }
LABEL_83:
          v24 = v137;

          objc_autoreleasePoolPop(v105);
          v32 = v123;

          v79 = 0;
          v16 = v136;
          v17 = 0;
          v36 = v132;
          goto LABEL_84;
        }
LABEL_47:

        v24 = v137;
        if (objc_msgSend(v130, "count"))
        {
          v74 = (void *)MEMORY[0x1D17B7244]();
          v75 = v32;
          HMFGetOSLogHandle();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v130, "count");
            *(_DWORD *)v156 = 138543618;
            v157 = v77;
            v158 = 2048;
            v159 = v78;
            _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response, '%lu' requested characteristics remain unmatched with a response object", v156, 0x16u);

            v30 = v134;
          }

          objc_autoreleasePoolPop(v74);
          v79 = 0;
        }
        else
        {
          v79 = v129;
        }
LABEL_84:

      }
      else
      {
        v98 = (void *)MEMORY[0x1D17B7244]();
        v99 = v32;
        HMFGetOSLogHandle();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v101 = v30;
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v128, "count");
          v104 = objc_msgSend(v132, "count");
          *(_DWORD *)buf = 138543874;
          v168 = v102;
          v169 = 2048;
          *(_QWORD *)v170 = v103;
          *(_WORD *)&v170[8] = 2048;
          *(_QWORD *)&v170[10] = v104;
          _os_log_impl(&dword_1CCE01000, v100, OS_LOG_TYPE_ERROR, "%{public}@Invalid write response, '%lu' response objects for '%lu' request tuples", buf, 0x20u);

          v30 = v101;
          v36 = v132;
          v16 = v136;
        }

        objc_autoreleasePoolPop(v98);
        v79 = 0;
        v24 = v137;
      }
      v35 = v127;

    }
    else
    {
      v79 = 0;
      v24 = v137;
    }

    if (objc_msgSend(v79, "count"))
    {
      v93 = 0;
      goto LABEL_68;
    }
    v109 = v30;
    v110 = (void *)MEMORY[0x1D17B7244]();
    v111 = v32;
    HMFGetOSLogHandle();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = HTTPGetReasonPhrase();
      v115 = CFSTR("HAP JSON");
      *(_DWORD *)buf = 138544386;
      v168 = v113;
      v169 = 1024;
      *(_DWORD *)v170 = 207;
      v17 = 0;
      *(_WORD *)&v170[4] = 2080;
      *(_QWORD *)&v170[6] = v114;
      *(_WORD *)&v170[14] = 2112;
      *(_QWORD *)&v170[16] = CFSTR("HAP JSON");
      v171 = 2112;
      v172 = v127;
      _os_log_impl(&dword_1CCE01000, v112, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response objects for an event registration request, the accessory sent an invalid response with HTTP Status Code '%d %s' and a %@ body: %@", buf, 0x30u);

      v24 = v137;
      v109 = v134;
    }

    objc_autoreleasePoolPop(v110);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = 0;
    v30 = v109;
LABEL_67:
    v16 = v136;
LABEL_68:
    v94 = v135;
    goto LABEL_69;
  }
  v80 = (void *)MEMORY[0x1D17B7244]();
  v81 = self;
  HMFGetOSLogHandle();
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v16 || a4 != 4 || a5 != 204)
  {
    v24 = v137;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v97 = CFSTR("Invalid");
      else
        v97 = off_1E894BB00[a4 - 1];
      v116 = v97;
      *(_DWORD *)buf = 138544386;
      v168 = v95;
      v169 = 1024;
      *(_DWORD *)v170 = a5;
      *(_WORD *)&v170[4] = 2080;
      *(_QWORD *)&v170[6] = v96;
      *(_WORD *)&v170[14] = 2112;
      *(_QWORD *)&v170[16] = v116;
      v171 = 2112;
      v172 = v16;
      _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to set event registration because the accessory sent an invalid response with HTTP Status Code '%d %s' and a %@ body: %@", buf, 0x30u);

      v30 = v134;
    }

    objc_autoreleasePoolPop(v80);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v17 = 0;
    goto LABEL_68;
  }
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v168 = v84;
    v169 = 1024;
    *(_DWORD *)v170 = 204;
    v30 = v134;
    *(_WORD *)&v170[4] = 2080;
    *(_QWORD *)&v170[6] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@Received event registration response with no body and a '%d %s' HTTP status code.", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v80);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v79 = (id)objc_claimAutoreleasedReturnValue();
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v85 = v30;
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v143, v155, 16);
  if (v86)
  {
    v87 = v86;
    v88 = 0;
    v89 = *(_QWORD *)v144;
    do
    {
      v90 = 0;
      v91 = v88;
      do
      {
        if (*(_QWORD *)v144 != v89)
          objc_enumerationMutation(v85);
        v92 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v90);
        objc_msgSend(v92, "setEventNotificationsEnabled:", v10);
        +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v92, 0);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v79, "addObject:", v88);
        ++v90;
        v91 = v88;
      }
      while (v87 != v90);
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v143, v155, 16);
    }
    while (v87);

    v30 = v134;
  }

  v93 = 0;
  v94 = v135;
  v16 = v136;
  v17 = 0;
  v24 = v137;
LABEL_69:
  -[HAPAccessoryServerIP _indicateSessionActivityWithReason:](v138, "_indicateSessionActivityWithReason:", CFSTR("Event"));
  if (v94 && v24)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__HAPAccessoryServerIP__handleEventResponseObject_type_httpStatus_error_characteristics_requestedEventState_completion_queue___block_invoke;
    block[3] = &unk_1E894D9E8;
    v142 = v94;
    v140 = v79;
    v141 = v93;
    dispatch_async(v24, block);

  }
}

- (void)httpClient:(id)a3 didReceiveEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  id v20;
  id v21;
  void *v22;
  HAPAccessoryServerIP *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  HAPAccessoryServerIP *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  HAPAccessoryServerIP *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id obj;
  _QWORD v38[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer category](self, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportIncomingIPEvent:accessoryCategory:", v9, v10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("characteristics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v11;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v42;
        v16 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            v40 = 0;
            v19 = -[HAPAccessoryServerIP _processEvent:matchedCharacteristic:](self, "_processEvent:matchedCharacteristic:", v18, &v40);
            v20 = v40;
            if (!v19)
            {
              v32 = (void *)MEMORY[0x1D17B7244]();
              v33 = self;
              HMFGetOSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v47 = v35;
                _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to process individual event", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v32);

              goto LABEL_21;
            }
            objc_msgSend(v12, "addObject:", v20);
            v38[0] = v16;
            v38[1] = 3221225472;
            v38[2] = __51__HAPAccessoryServerIP_httpClient_didReceiveEvent___block_invoke;
            v38[3] = &unk_1E8949258;
            v38[4] = self;
            v39 = v20;
            v21 = v20;
            -[HAPAccessoryServer enumerateInternalDelegatesUsingBlock:](self, "enumerateInternalDelegatesUsingBlock:", v38);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v14)
            continue;
          break;
        }
      }

      -[HAPAccessoryServerIP _handleUpdatesForCharacteristics:stateNumber:](self, "_handleUpdatesForCharacteristics:stateNumber:", v12, 0);
LABEL_21:
      v6 = v36;

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17B7244]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v30;
        v48 = 2112;
        v49 = CFSTR("characteristics");
        v50 = 2112;
        v51 = (id)objc_opt_class();
        v31 = v51;
        _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle event because the '%@' value was not an array, instead it was %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      v48 = 2112;
      v49 = (__CFString *)objc_opt_class();
      v26 = v49;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle event because it was not an NSDictionary, instead it was %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (BOOL)_processEvent:(id)a3 matchedCharacteristic:(id *)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  HAPAccessoryServerIP *v27;
  NSObject *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  HAPAccessoryServerIP *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  HAPAccessoryServerIP *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HAPAccessoryServerIP *v45;
  NSObject *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  HAPAccessoryServerIP *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  HAPAccessoryServerIP *v56;
  NSObject *v57;
  void *v58;
  const char *v59;
  NSObject *v60;
  uint32_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  HAPAccessoryServerIP *v65;
  NSObject *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  __CFString *v77;
  __CFString *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  __CFString *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (!-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v29;
      v87 = 2112;
      v88 = v6;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@No secure session dropping event %@", buf, 0x16u);
LABEL_21:

    }
LABEL_22:

    objc_autoreleasePoolPop(v26);
    v24 = 0;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17B7244]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v29;
      v87 = 2112;
      v88 = (__CFString *)objc_opt_class();
      v30 = v88;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because it is not a dictionary, instead it is %@", buf, 0x16u);

      goto LABEL_21;
    }
    goto LABEL_22;
  }
  -[__CFString hmf_numberForKey:](v6, "hmf_numberForKey:", CFSTR("aid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[__CFString hmf_numberForKey:](v6, "hmf_numberForKey:", CFSTR("iid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("value"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (__CFString *)v9;
      if (v9)
      {
        v74 = (__CFString *)v9;
        -[HAPAccessoryServer accessories](self, "accessories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v7;
        objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v73 = v12;
        objc_msgSend(v12, "services");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v81;
LABEL_8:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v81 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v17), "characteristics");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hmf_firstObjectWithInstanceID:", v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
              break;
            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
              if (v15)
                goto LABEL_8;
              goto LABEL_14;
            }
          }

          if (objc_msgSend(v19, "shouldValidateValueAfterReading"))
          {
            objc_msgSend(v19, "metadata");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "format");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = HAPCharacteristicFormatFromString(v42);

            v10 = v74;
            v7 = v76;
            if (!v43)
            {
              v44 = (void *)MEMORY[0x1D17B7244]();
              v45 = self;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v72 = v44;
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v86 = v47;
                _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);

                v44 = v72;
              }

              objc_autoreleasePoolPop(v44);
              v48 = v74;
              goto LABEL_41;
            }
          }
          else
          {
            v43 = 12;
            v10 = v74;
            v7 = v76;
          }
          +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0;
          objc_msgSend(v53, "reverseTransformedValue:format:error:", v10, v43, &v79);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v54 = (__CFString *)v79;

          if (v54)
          {
            v77 = v48;
            v55 = (void *)MEMORY[0x1D17B7244]();
            v56 = self;
            HMFGetOSLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v86 = v58;
              v87 = 2112;
              v88 = v10;
              v89 = 2112;
              v90 = v54;
              v59 = "%{public}@Failed to transform the value '%@' with error %@";
              v60 = v57;
              v61 = 32;
LABEL_45:
              _os_log_impl(&dword_1CCE01000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);

            }
LABEL_46:

            objc_autoreleasePoolPop(v55);
            v24 = 0;
            v48 = v77;
            goto LABEL_54;
          }
LABEL_41:
          if (!objc_msgSend(v19, "shouldValidateValueAfterReading")
            || (objc_msgSend(v19, "validateValue:outValue:", v48, 0), (v62 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            if ((objc_msgSend(v19, "properties") & 0x100) != 0)
            {
              _parseNotificationContextFromCharacteristicResponse(v6);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setNotificationContext:", v63);

              v64 = (void *)MEMORY[0x1D17B7244]();
              v65 = self;
              HMFGetOSLogHandle();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v75 = v64;
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "notificationContext");
                v78 = v48;
                v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v86 = v67;
                v87 = 2112;
                v88 = v68;
                v89 = 2112;
                v90 = v8;
                _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_INFO, "%{public}@Received notification context:%@ in event for characteristic instanceId: %@", buf, 0x20u);

                v48 = v78;
                v64 = v75;
              }

              objc_autoreleasePoolPop(v64);
            }
            else
            {
              objc_msgSend(v19, "setNotificationContext:", 0);
            }
            if (!a4)
            {
              v24 = 1;
              goto LABEL_55;
            }
            v69 = (void *)objc_msgSend(v19, "copy");
            objc_msgSend(v69, "setValue:", v48);
            objc_msgSend(v19, "service");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setService:", v70);

            v54 = objc_retainAutorelease(v69);
            *a4 = v54;
            v24 = 1;
LABEL_54:

LABEL_55:
            v25 = v73;

            goto LABEL_56;
          }
          v54 = (__CFString *)v62;
          v77 = v48;
          v55 = (void *)MEMORY[0x1D17B7244]();
          v56 = self;
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v86 = v58;
            v87 = 2112;
            v88 = v54;
            v59 = "%{public}@Failed to handle individual event update because the new value is invalid with error %@";
            v60 = v57;
            v61 = 22;
            goto LABEL_45;
          }
          goto LABEL_46;
        }
LABEL_14:

        v20 = (void *)MEMORY[0x1D17B7244]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v86 = v23;
          _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because there was no matching characteristic", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        v24 = 0;
        v10 = v74;
        v7 = v76;
        v25 = v73;
LABEL_56:

      }
      else
      {
        v49 = (void *)MEMORY[0x1D17B7244]();
        v50 = self;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v86 = v52;
          _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because there was no value", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v49);
        v24 = 0;
      }

    }
    else
    {
      v36 = (void *)MEMORY[0x1D17B7244]();
      v37 = self;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v86 = v39;
        v87 = 2112;
        v88 = CFSTR("iid");
        v89 = 2112;
        v90 = (id)objc_opt_class();
        v40 = v90;
        _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because '%@' is not a number, instead it is %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v36);
      v24 = 0;
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x1D17B7244]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v86 = v34;
      v87 = 2112;
      v88 = CFSTR("aid");
      v89 = 2112;
      v90 = (id)objc_opt_class();
      v35 = v90;
      _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because '%@' is not a number, instead it is %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    v24 = 0;
  }

LABEL_60:
  return v24;
}

- (BOOL)_parseAndValidateTXTRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  HAPAccessoryServerIP *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  HAPAccessoryServerIP *v18;
  HAPAccessoryServerIP *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37B0], "dictionaryFromTXTRecordData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[HAPAccessoryServerIP _parseTXTRecordDictionary:](self, "_parseTXTRecordDictionary:", v5))
      {
        -[HAPAccessoryServer identifier](self, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v7 = 1;
LABEL_17:

          goto LABEL_18;
        }
        v13 = (void *)MEMORY[0x1D17B7244]();
        v19 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v16;
          v23 = 2112;
          v24 = v5;
          v17 = "%{public}@Failed to instantiate accessory because a deviceID wasn't present in the TXT record dictionary: %@";
          goto LABEL_15;
        }
LABEL_16:

        objc_autoreleasePoolPop(v13);
        v7 = 0;
        goto LABEL_17;
      }
      v13 = (void *)MEMORY[0x1D17B7244]();
      v18 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v5;
      v17 = "%{public}@Failed to instantiate accessory because TXT record is malformed: %@";
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v4;
      v17 = "%{public}@Failed to instantiate accessory because the TXT record data could not be converted to a dictionary: %@";
    }
LABEL_15:
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x16u);

    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP bonjourDeviceInfo](v9, "bonjourDeviceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate accessory because no TXT record data was found in BonjourDeviceInfo: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v7 = 0;
LABEL_18:

  return v7;
}

- (BOOL)_parseTXTRecordDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  HAPAccessoryServerIP *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HAPAccessoryServerIP *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HAPAccessoryServerIP *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HAPAccessoryServerIP *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HAPAccessoryServerIP *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  HAPAccessoryServerIP *v57;
  NSObject *v58;
  void *v59;
  _BOOL4 v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HAPAccessoryServerIP *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  id v73;
  void *v74;
  HAPAccessoryServerIP *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  HAPAccessoryServerIP *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  uint64_t v84;
  void *v85;
  HAPAccessoryServerIP *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  HAPAccessoryServerIP *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  unint64_t *p_featureFlags;
  id v96;
  _QWORD block[6];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  const __CFString *v101;
  __int16 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("id"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v18;
      v100 = 2112;
      v101 = CFSTR("id");
LABEL_11:
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);

    }
LABEL_12:

LABEL_13:
    objc_autoreleasePoolPop(v15);
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  v6 = (void *)v5;
  v7 = 0x1E0CB3000uLL;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  -[HAPAccessoryServer setIdentifier:](self, "setIdentifier:", v8);

  self->_featureFlags = 0;
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("ff"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    p_featureFlags = &self->_featureFlags;
    SNScanF();
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("md"), p_featureFlags);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v18;
      v100 = 2112;
      v101 = CFSTR("md");
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  -[HAPAccessoryServerIP setModel:](self, "setModel:", v12);

  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("sv"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
    -[HAPAccessoryServerIP setSourceVersion:](self, "setSourceVersion:", v14);

  }
  else
  {
    -[HAPAccessoryServerIP setSourceVersion:](self, "setSourceVersion:", 0);
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("pv"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v22);
      -[HAPAccessoryServer setVersion:](self, "setVersion:", v23);
      if ((unint64_t)objc_msgSend(v23, "majorVersion") >= 2)
      {
        v41 = (void *)MEMORY[0x1D17B7244]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v99 = v44;
          v100 = 2112;
          v101 = v22;
          _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@TXT record contains incompatible protocol version %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        if (-[HAPAccessoryServerIP isPaired](v42, "isPaired"))
        {
          -[HAPAccessoryServer setReachabilityChangedReason:](v42, "setReachabilityChangedReason:", CFSTR("Internal"));
          -[HAPAccessoryServer setReachable:](v42, "setReachable:", 0);
          -[HAPAccessoryServerIP _tearDownSession](v42, "_tearDownSession");
        }

        goto LABEL_50;
      }

    }
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("w#"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v24, 4);
    v26 = -[__CFString longLongValue](v25, "longLongValue");
    if ((unint64_t)(v26 - 1) >= 0xFFFFFFFF)
    {
      v30 = (void *)MEMORY[0x1D17B7244]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v33;
        v100 = 2112;
        v101 = v25;
        _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'w#' has invalid wake number: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);

      goto LABEL_14;
    }
    v27 = v26;

  }
  else
  {
    v27 = 0;
  }
  if (-[HAPAccessoryServer wakeNumber](self, "wakeNumber") != v27
    && -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateWakeNumber_))
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HAPAccessoryServerIP__parseTXTRecordDictionary___block_invoke;
    block[3] = &unk_1E894D3B0;
    block[4] = self;
    block[5] = v27;
    dispatch_async(v28, block);

  }
  -[HAPAccessoryServer setWakeNumber:](self, "setWakeNumber:", v27);
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("c#"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (v27)
      goto LABEL_36;
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v94;
      v100 = 2112;
      v101 = CFSTR("c#");
      _os_log_impl(&dword_1CCE01000, v93, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);

    }
    goto LABEL_13;
  }
  v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
  v29 = -[__CFString longLongValue](v22, "longLongValue");
  if ((unint64_t)(v29 - 1) >= 0xFFFFFFFF)
  {
    v45 = (void *)MEMORY[0x1D17B7244]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v48;
      _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'c#' has invalid configuration number", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v45);
LABEL_50:

    goto LABEL_14;
  }
  -[HAPAccessoryServer setConfigNumber:](self, "setConfigNumber:", v29);

LABEL_36:
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("s#"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v34, 4);
    v36 = objc_msgSend(v35, "longLongValue");
    if ((unint64_t)(v36 - 0x100000000) <= 0xFFFFFFFF00000000)
    {
      v37 = (void *)MEMORY[0x1D17B7244]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v99 = v40;
        _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 's#' has invalid state number", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      v36 = 1;
    }
    -[HAPAccessoryServer setStateNumber:](self, "setStateNumber:", v36);

  }
  else
  {
    v49 = (void *)MEMORY[0x1D17B7244]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v52;
      v100 = 2112;
      v101 = CFSTR("s#");
      _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    -[HAPAccessoryServer setStateNumber:](v50, "setStateNumber:", 1);
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("sf"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v53, 4);
    v55 = objc_msgSend(v54, "longLongValue");

  }
  else
  {
    v55 = 0;
  }
  v56 = (void *)MEMORY[0x1D17B7244]();
  v57 = self;
  HMFGetOSLogHandle();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[HAPAccessoryServerIP isPaired](v57, "isPaired");
    v61 = CFSTR("No");
    *(_DWORD *)buf = 138543874;
    v99 = v59;
    if (v60)
      v61 = CFSTR("Yes");
    v100 = 2112;
    v101 = v61;
    v102 = 2048;
    v103 = v55;
    _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Paired: %@, Setting status flags to %tu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v56);
  -[HAPAccessoryServerIP setStatusFlags:](v57, "setStatusFlags:", v55);
  if (!-[HAPAccessoryServerIP isWacAccessory](v57, "isWacAccessory")
    || -[HAPAccessoryServerIP isWacLegacy](v57, "isWacLegacy"))
  {
    -[HAPAccessoryServer setHasPairings:](v57, "setHasPairings:", (v55 & 1) == 0);
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("ci"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v62, 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)objc_msgSend(v63, "longLongValue"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer setCategory:](v57, "setCategory:", v64);

  }
  else
  {
    v65 = (void *)MEMORY[0x1D17B7244]();
    v66 = v57;
    HMFGetOSLogHandle();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v68;
      v100 = 2112;
      v101 = CFSTR("ci");
      _os_log_impl(&dword_1CCE01000, v67, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@', set the category to @(1) - Other", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v65);
    -[HAPAccessoryServer setCategory:](v66, "setCategory:", &unk_1E8989350);
  }
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("sh"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v69, 4);
    +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    objc_msgSend(v71, "reverseTransformedValue:format:error:", v70, 12, &v96);
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v73 = v96;

    if (v72)
    {
      v74 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServer setSetupHash:](v57, "setSetupHash:", v72));
      v75 = v57;
      HMFGetOSLogHandle();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v77;
        v100 = 2112;
        v101 = v72;
        _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_DEBUG, "%{public}@Setup hash is %@ for accessory server", buf, 0x16u);

        v7 = 0x1E0CB3000;
      }

      objc_autoreleasePoolPop(v74);
    }

  }
  else
  {
    v78 = (void *)MEMORY[0x1D17B7244]();
    v79 = v57;
    HMFGetOSLogHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v81;
      v100 = 2112;
      v101 = CFSTR("sh");
      _os_log_impl(&dword_1CCE01000, v80, OS_LOG_TYPE_DEBUG, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v78);
  }
  -[HAPAccessoryServer setCompatibilityFeatures:](v57, "setCompatibilityFeatures:", 0);
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("fe"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    v83 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v7 + 2368)), "initWithData:encoding:", v82, 4);
    v84 = -[__CFString longLongValue](v83, "longLongValue");
    if ((unint64_t)(v84 - 0x100000000) > 0xFFFFFFFF00000000)
    {
      -[HAPAccessoryServer setCompatibilityFeatures:](v57, "setCompatibilityFeatures:", v84);
    }
    else
    {
      v85 = (void *)MEMORY[0x1D17B7244]();
      v86 = v57;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v88;
        v100 = 2112;
        v101 = v83;
        _os_log_impl(&dword_1CCE01000, v87, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'fe' has invalid value %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v85);
    }

  }
  else
  {
    v89 = (void *)MEMORY[0x1D17B7244]();
    v90 = v57;
    HMFGetOSLogHandle();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v92;
      v100 = 2112;
      v101 = CFSTR("fe");
      _os_log_impl(&dword_1CCE01000, v91, OS_LOG_TYPE_DEBUG, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v89);
  }
  v19 = 1;
LABEL_15:

  return v19;
}

- (void)_getAttributeDatabase
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__649;
  v8[4] = __Block_byref_object_dispose__650;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.CoreHAP.get-att-db"));
  v3 = (void *)MEMORY[0x1D17B7244]();
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("accessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HAPAccessoryServerIP__getAttributeDatabase__block_invoke;
  v5[3] = &unk_1E8949280;
  objc_copyWeak(&v6, &location);
  v5[4] = v8;
  -[HAPAccessoryServerIP sendGETRequestToURL:timeout:completionHandler:](self, "sendGETRequestToURL:timeout:completionHandler:", v4, v5, 0.0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v3);
  _Block_object_dispose(v8, 8);

}

- (void)_parseAttributeDatabase:(id)a3 transaction:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HAPAccessoryServerIP *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  HAPAccessoryServerIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  HAPAccessoryServerIP *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  HAPAccessoryServerIP *v47;
  NSObject *v48;
  void *v49;
  HAPAccessoryServerIP *v50;
  void *v51;
  void *v52;
  HAPAccessoryServerIP *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  HAPAccessoryServerIP *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id obj;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v64 = a4;
  v7 = (void *)MEMORY[0x1D17B7244]();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  else
    v9 = 0;
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = (uint64_t)v13;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Parsing attribute database", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = v11;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9)
      v19 = (const __CFString *)v9;
    else
      v19 = v6;
    *(_DWORD *)buf = 138543618;
    v73 = v17;
    v74 = 2112;
    v75 = v19;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Parsing attribute database: %@", buf, 0x16u);

  }
  v63 = (void *)v9;

  objc_autoreleasePoolPop(v14);
  -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("accessories"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    goto LABEL_56;
  v41 = (void *)MEMORY[0x1D17B7244]();
  v42 = v15;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = (uint64_t)v44;
    _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%{public}@No accessory objects found in the attribute database", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v41);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
LABEL_56:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = v15;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v73 = (uint64_t)v24;
      v74 = 2114;
      v75 = CFSTR("accessories");
      v76 = 2114;
      v77 = v25;
      v26 = v25;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Expected the value of '%{public}@' to be an array in the attribute database, instead it is a %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
LABEL_16:
      v61 = v8;
      v62 = v7;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v20, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v60 = v20;
      obj = v20;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      v59 = v6;
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v68;
LABEL_18:
        v33 = 0;
        v34 = v31;
        while (1)
        {
          if (*(_QWORD *)v68 != v32)
            objc_enumerationMutation(obj);
          +[HAPAccessoryServerIP _parseSerializedAccessoryDictionary:server:](HAPAccessoryServerIP, "_parseSerializedAccessoryDictionary:server:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v33), v15, v59);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
            break;
          objc_msgSend(v31, "instanceID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqualToNumber:", v36);

          if (v37)
          {
            objc_msgSend(v31, "setPrimary:", 1);
            -[HAPAccessoryServerIP setPrimaryAccessoryForServer:](v15, "setPrimaryAccessoryForServer:", v31);
            -[HAPAccessoryServerIP _updateProtocolVersionFromPrimaryAccessory:](v15, "_updateProtocolVersionFromPrimaryAccessory:", v31);
          }
          else
          {
            objc_msgSend(v31, "setPrimary:", 0);
          }
          objc_msgSend(v31, "instanceID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v28, "containsObject:", v38);

          if (v39)
          {
            v46 = (void *)MEMORY[0x1D17B7244]();
            v50 = v15;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v73 = (uint64_t)v51;
              _os_log_impl(&dword_1CCE01000, v48, OS_LOG_TYPE_ERROR, "%{public}@Accessory Server has accessory with duplicate instance ID", buf, 0xCu);

            }
            goto LABEL_40;
          }
          objc_msgSend(v31, "instanceID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v40);

          objc_msgSend(v31, "setServer:", v15);
          objc_msgSend(v66, "addObject:", v31);
          ++v33;
          v34 = v31;
          if (v30 == v33)
          {
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
            if (v30)
              goto LABEL_18;
            goto LABEL_34;
          }
        }
        v46 = (void *)MEMORY[0x1D17B7244]();
        v47 = v15;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = (uint64_t)v49;
          _os_log_impl(&dword_1CCE01000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse serialized accessory", buf, 0xCu);

        }
        v31 = 0;
LABEL_40:
        v6 = v59;
        v45 = v66;

        objc_autoreleasePoolPop(v46);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 66);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          goto LABEL_51;
      }
      else
      {
        v31 = 0;
LABEL_34:

        v6 = v59;
        v45 = v66;
      }
      if ((unint64_t)objc_msgSend(v45, "count", v59) < 0xC9)
      {
        if (-[HAPAccessoryServerIP _updateAccessories:](v15, "_updateAccessories:", v45))
        {
          v27 = 0;
          goto LABEL_51;
        }
        v52 = (void *)MEMORY[0x1D17B7244]();
        v57 = v15;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = (uint64_t)v58;
          _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessories, returning invalid response error", buf, 0xCu);

        }
        v56 = 50;
      }
      else
      {
        v52 = (void *)MEMORY[0x1D17B7244]();
        v53 = v15;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = (uint64_t)v55;
          _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_ERROR, "%{public}@Accessory Server exceeds maximum number of allowed accessories", buf, 0xCu);

        }
        v56 = 49;
      }

      objc_autoreleasePoolPop(v52);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", v56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

      v8 = v61;
      v7 = v62;
      v20 = v60;
      if (!v27)
        -[HAPAccessoryServerIP setHasAttributeDatabase:](v15, "setHasAttributeDatabase:", 1);
    }
  }
  -[HAPAccessoryServerIP __registerForInternalCharacteristicNotifications](v15, "__registerForInternalCharacteristicNotifications");
  -[HAPAccessoryServerIP _notifyDelegateOfDiscoveryCompletionWithError:](v15, "_notifyDelegateOfDiscoveryCompletionWithError:", v27);
  -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v15, "_processQueuedOperationsWithError:", v27);

  objc_autoreleasePoolPop(v7);
}

- (void)__registerForInternalCharacteristicNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  HAPAccessoryServerIP *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = self;
  -[HAPAccessoryServer accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v8 = &selRef_new;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", v8[302]) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v4;
          objc_msgSend(v10, "accessoryServerDidRequestCharacteristicsToRegisterForNotifications:", v24);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                if ((objc_msgSend(v17, "eventNotificationsEnabled") & 1) == 0)
                  objc_msgSend(v3, "addObject:", v17);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            }
            while (v14);
          }

          v4 = v11;
          v8 = &selRef_new;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__HAPAccessoryServerIP___registerForInternalCharacteristicNotifications__block_invoke;
    v25[3] = &unk_1E894C998;
    v25[4] = v24;
    v18 = (void *)MEMORY[0x1D17B7400](v25);
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = v24;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2112;
      v37 = v3;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Registering events for characteristics: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    -[HAPAccessoryServer clientQueue](v20, "clientQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP enableEvents:forCharacteristics:withCompletionHandler:queue:](v20, "enableEvents:forCharacteristics:withCompletionHandler:queue:", 1, v3, v18, v23);

  }
}

- (void)_updateProtocolVersionFromPrimaryAccessory:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
      objc_msgSend(v9, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_20;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v12, "characteristics", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
LABEL_13:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        objc_msgSend(v18, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("00000037-0000-1000-8000-0026BB765291"));

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v15)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
      objc_msgSend(v18, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_26;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v21);
      -[HAPAccessoryServer setVersion:](self, "setVersion:", v22);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("1.1"));
      v24 = objc_msgSend(v22, "isAtLeastVersion:", v23);

      if (v24)
        -[HAPAccessoryServer setSupportsTimedWrite:](self, "setSupportsTimedWrite:", 1);

    }
    else
    {
LABEL_19:
      v21 = v13;
    }

  }
  else
  {
LABEL_9:

LABEL_20:
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("1.0"));
    -[HAPAccessoryServer setVersion:](self, "setVersion:", v12);
  }
LABEL_26:

}

- (BOOL)_updateAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HAPAccessoryServerIP *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  HAPAccessoryServerIP *v40;
  NSObject *v41;
  void *v42;
  HAPAccessoryServerIP *v44;
  id v45;
  id obj;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[HAPAccessoryServer accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v44 = self;
  -[HAPAccessoryServer accessories](self, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v61;
    obj = v7;
    while (2)
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v10 = v51;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v57;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v57 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
            objc_msgSend(v9, "instanceID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "instanceID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

            if (v18)
              break;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
              if (v12)
                goto LABEL_8;
              goto LABEL_17;
            }
          }
          if ((objc_msgSend(v9, "shouldMergeObject:", v15) & 1) != 0)
          {
            objc_msgSend(v9, "mergeObject:", v15);
            objc_msgSend(v47, "addObject:", v9);
            objc_msgSend(v10, "removeObject:", v15);
            objc_msgSend(v48, "removeObject:", v9);
            goto LABEL_17;
          }
          v39 = (void *)MEMORY[0x1D17B7244]();
          v40 = v44;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v66 = v42;
            v67 = 2112;
            v68 = v9;
            v69 = 2112;
            v70 = v15;
            _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to merge existing accessory %@ with new accessory %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v39);

          v38 = 0;
          v31 = v45;
          v37 = obj;
          v19 = v47;
          goto LABEL_40;
        }
LABEL_17:

      }
      v7 = obj;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      if (v50)
        continue;
      break;
    }
  }

  v19 = v47;
  if (objc_msgSend(v48, "count"))
  {
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v44;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v23;
      v67 = 2114;
      v68 = v48;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@The following accessories are not present in the latest attribute database: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = v48;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          HMErrorFromHAPErrorCode(33);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "invalidateWithError:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      }
      while (v26);
    }

  }
  v31 = v45;
  if (objc_msgSend(v51, "count"))
  {
    -[HAPAccessoryServer accessories](v44, "accessories");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x1D17B7244]();
      v34 = v44;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v36;
        v67 = 2114;
        v68 = v51;
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@The following accessories are new in the latest attribute database: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
    }
    objc_msgSend(v47, "addObjectsFromArray:", v51);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v47);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer setAccessories:](v44, "setAccessories:", v37);
  v38 = 1;
LABEL_40:

  return v38;
}

- (BOOL)isSessionEstablished
{
  HAPAccessoryServerIP *v2;
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__HAPAccessoryServerIP_isSessionEstablished__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSessionEstablished
{
  NSObject *v3;

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_httpClient
      && self->_pairingSession
      && !-[HAPAccessoryServerIP isEstablishingSecureConnection](self, "isEstablishingSecureConnection")
      || self->_unitTest_establishedSession;
}

- (BOOL)isSecuritySessionOpen
{
  HAPAccessoryServerIP *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_securitySessionOpen;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_securitySessionOpen = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_invokePairVerifyCompletionBlock:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a3;
  -[HAPAccessoryServerIP pairVerifyCompletionBlock](self, "pairVerifyCompletionBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP setPairVerifyCompletionBlock:](self, "setPairVerifyCompletionBlock:", 0);
  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v5);
  -[HAPAccessoryServerIP setEconnresetRetryInProgress:](self, "setEconnresetRetryInProgress:", 0);

}

- (void)invokePairVerifyCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HAPAccessoryServerIP_invokePairVerifyCompletionBlock___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_establishSecureSession
{
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled == 1)
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
  -[HAPAccessoryServerIP _pairVerifyStartWithRetry:](self, "_pairVerifyStartWithRetry:", 1);
}

- (void)setPairVerifyCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id pairVerifyCompletionBlock;
  _QWORD v13[4];
  id v14;
  id v15[2];
  id location;
  _QWORD block[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1D17B7400](self->_pairVerifyCompletionBlock);
  v6 = (void *)v5;
  v7 = MEMORY[0x1E0C809B0];
  if (v4 && v5)
  {
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke;
    block[3] = &unk_1E894D5E0;
    block[4] = self;
    v18 = v6;
    dispatch_async(v8, block);

  }
  else if (!v4)
  {
    pairVerifyCompletionBlock = self->_pairVerifyCompletionBlock;
    self->_pairVerifyCompletionBlock = 0;

    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  mach_absolute_time();
  v9 = (void *)UpTicksToMilliseconds();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke_332;
  v13[3] = &unk_1E89492A8;
  objc_copyWeak(v15, &location);
  v14 = v4;
  v15[1] = v9;
  v10 = (void *)MEMORY[0x1D17B7400](v13);
  v11 = self->_pairVerifyCompletionBlock;
  self->_pairVerifyCompletionBlock = v10;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
LABEL_6:

}

- (void)httpClientDidCloseConnectionDueToServer:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received a server-initiated disconnection", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer category](v6, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportDisconnection:linkType:accessoryCategory:", v10, 1, v11);

  -[HAPAccessoryServerIP primaryAccessory](v6, "primaryAccessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "suspendedState") == 2)
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Disconnected -> Entering suspended mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HAPAccessoryServer delegate](v14, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[HAPAccessoryServer delegateQueue](v14, "delegateQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__HAPAccessoryServerIP_httpClientDidCloseConnectionDueToServer___block_invoke;
      block[3] = &unk_1E894DD08;
      block[4] = v14;
      dispatch_async(v19, block);

    }
    -[HAPAccessoryServerIP _tearDownSession](v14, "_tearDownSession");
  }
  else
  {
    objc_msgSend(v4, "invalidateReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v6, "_tearDownSessionAndStartReachabilityWithError:", v20);

    -[HAPAccessoryServerIP browser](v6, "browser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](v6, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "processPendingBonjourRemoveEvents:", v22);

  }
}

- (void)httpClient:(id)a3 didReceiveSocketEvent:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v4 & 1) != 0)
      objc_msgSend(v11, "appendString:", CFSTR(", WakePacket"));
    if ((v4 & 2) != 0)
      objc_msgSend(v12, "appendString:", CFSTR(", KeepAlive"));
    v16 = 138543618;
    v17 = v10;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received a socket event %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer category](v8, "category");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportWakeEvent:linkType:accessoryCategory:", v14, 1, v15);

}

- (int)getBonjourDeviceDNSName:(id *)a3
{
  void *v5;
  int DNSName;
  _BYTE v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3 || !-[HAPAccessoryServerIP hasBonjourDeviceInfo](self, "hasBonjourDeviceInfo"))
    return -6705;
  v8[0] = 0;
  -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNSName = BonjourDevice_GetDNSName();

  if (!DNSName)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return DNSName;
}

- (id)getAddressTypeWithSocketInfo:(id)a3
{
  uint64_t v3;
  const __CFString *v4;

  v3 = objc_msgSend(a3, "ipAddressType");
  v4 = CFSTR("IPv4Address");
  if (v3 == 2)
    v4 = CFSTR("IPv6LLAddress");
  if (v3 == 3)
    return CFSTR("IPv6GlobalAddress");
  else
    return (id)v4;
}

- (int)_doEnsureHTTPClientSetUp
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  HAPHTTPClient *v12;
  void *v13;
  HAPHTTPClient *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  if (-[HAPAccessoryServer wakeNumber](self, "wakeNumber"))
  {
    -[HAPAccessoryServer suspendedAccessory](self, "suspendedAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "wakeTuples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wakeAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = 0;
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v21 = 0;
  v10 = -[HAPAccessoryServerIP getBonjourDeviceDNSName:](self, "getBonjourDeviceDNSName:", &v21);
  v11 = v21;
  if (!v10)
  {
    -[HAPAccessoryServer setMetric_pairVerifyConnectionEstablishedBy:](self, "setMetric_pairVerifyConnectionEstablishedBy:", CFSTR("dnsName"));
    v12 = [HAPHTTPClient alloc];
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPHTTPClient initWithDNSName:port:eventsEnabled:queue:wakeAddress:](v12, "initWithDNSName:port:eventsEnabled:queue:wakeAddress:", v11, 0, 1, v13, v8);
    -[HAPAccessoryServerIP setHttpClient:](self, "setHttpClient:", v14);

    -[HAPAccessoryServerIP httpClient](self, "httpClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v10 = -6718;
      goto LABEL_14;
    }
    -[HAPAccessoryServerIP httpClient](self, "httpClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer clientQueue](self, "clientQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:queue:", self, v17);

    -[HAPAccessoryServerIP setHasUpdatedBonjour:](self, "setHasUpdatedBonjour:", 0);
    if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerIP_didReceiveHTTPHeaders_httpBody_)|| -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerIP_willSendHTTPHeaders_httpBody_))
    {
      -[HAPAccessoryServerIP httpClient](self, "httpClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer clientQueue](self, "clientQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDebugDelegate:queue:", self, v19);

    }
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (unsigned)_getNameResolutionGroupResolveTimeout
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HAPNameResolutionGroupResolveTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntValue");
  else
    v5 = 12;

  return v5;
}

- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CFTypeRef *p_pairingSession;
  PairingSessionPrivate *pairingSession;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t featureFlags;
  void *v18;
  HAPAccessoryServerIP *v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  HAPAccessoryServerIP *v29;
  NSObject *v30;
  void *v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer pairingRequest](self, "pairingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[HAPAccessoryServerIP controllerUsername](self, "controllerUsername");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  p_pairingSession = (CFTypeRef *)&self->_pairingSession;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    *p_pairingSession = 0;
  }
  v13 = PairingSessionCreate();
  if (v13)
    goto LABEL_39;
  -[HAPAccessoryServerIP setCancelPairingErr:](self, "setCancelPairingErr:", 0);
  v14 = -[HAPAccessoryServer setPairSetupType:](self, "setPairSetupType:", 1);
  if (a3 != 1)
    goto LABEL_36;
  if (LOBYTE(self->_featureFlags))
  {
    if ((self->_featureFlags & 1) != 0)
    {
      v16 = 1;
    }
    else if ((self->_featureFlags & 2) != 0)
    {
      v16 = 2;
    }
    else
    {
      v15 = 5;
      if ((self->_featureFlags & 0x10) != 0)
        v15 = 6;
      if ((self->_featureFlags & 8) != 0)
        v16 = 4;
      else
        v16 = v15;
    }
  }
  else
  {
    v16 = 0;
  }
  -[HAPAccessoryServer setAuthMethod:](self, "setAuthMethod:", v16);
  featureFlags = self->_featureFlags;
  if ((featureFlags & 1) == 0)
  {
    if ((featureFlags & 2) != 0)
    {
      if (!-[HAPAccessoryServerIP authenticated](self, "authenticated"))
      {
        v18 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServer setPairSetupType:](self, "setPairSetupType:", 3));
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = self->_featureFlags;
          *(_DWORD *)buf = 138543618;
          v34 = v21;
          v35 = 2048;
          v36 = v22;
          _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Feature flags: %llu, Performing Transient Split pair-setup", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        goto LABEL_35;
      }
    }
    else
    {
      if ((featureFlags & 8) != 0)
      {
        -[HAPAccessoryServer setPairSetupType:](self, "setPairSetupType:", 5);
        goto LABEL_35;
      }
      if ((featureFlags & 0x10) == 0)
        goto LABEL_35;
      if (!-[HAPAccessoryServerIP authenticated](self, "authenticated"))
      {
        v23 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServer setPairSetupType:](self, "setPairSetupType:", 6));
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = self->_featureFlags;
          *(_DWORD *)buf = 138543874;
          v34 = v26;
          v35 = 2048;
          v36 = v27;
          v37 = 1024;
          v38 = 16793617;
          _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Feature flags: %llu, Performing Transient Split pair-setup with Cert Auth flags: 0x%X", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v23);
        goto LABEL_35;
      }
    }
    -[HAPAccessoryServer setPairSetupType:](self, "setPairSetupType:", 4);
  }
LABEL_35:
  PairingSessionSetFlags();
  v14 = PairingSessionSetEventHandler();
LABEL_36:
  v28 = (void *)MEMORY[0x1D17B7244](v14);
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v31;
    v35 = 2112;
    v36 = (unint64_t)v10;
    _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting Pairing session identifier to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v13 = PairingSessionSetIdentifier();
  if (v13)
  {
LABEL_39:
    if (*p_pairingSession)
    {
      CFRelease(*p_pairingSession);
      *p_pairingSession = 0;
    }
  }

  return v13;
}

- (int)_pairSetupStartWithConsentRequired:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  HAPAccessoryServerIP *v9;
  NSObject *v10;
  void *v11;
  unint64_t featureFlags;
  uint64_t v13;
  uint64_t featureFlags_low;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  HAPAccessoryInfo *v20;
  void *v21;
  void *v22;
  HAPAccessoryInfo *v23;
  NSObject *v24;
  HAPAccessoryInfo *v25;
  HAPAccessoryInfo *v26;
  void *v27;
  HAPAccessoryServerIP *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  HAPAccessoryServerIP *v36;
  NSObject *v37;
  void *v38;
  HAPAccessoryInfo *v39;
  void *v40;
  void *v41;
  HAPAccessoryInfo *v42;
  NSObject *v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  HAPAccessoryInfo *v49;
  _QWORD block[5];
  HAPAccessoryInfo *v51;
  uint64_t v52;
  _QWORD v53[6];
  id v54;
  _QWORD v55[5];
  BOOL v56;
  __int16 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke;
  v55[3] = &unk_1E894D770;
  v55[4] = self;
  v56 = a3;
  __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke((uint64_t)v55);
  v6 = -[HAPAccessoryServerIP _isAccessoryPublicKeyPresent:registeredWithHomeKit:](self, "_isAccessoryPublicKeyPresent:registeredWithHomeKit:", (char *)&v57 + 1, &v57);
  if (HIBYTE(v57))
  {
    if ((_BYTE)v57)
    {
      v53[0] = v5;
      v53[1] = 3221225472;
      v53[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_352;
      v53[3] = &unk_1E894E0F8;
      v53[4] = self;
      v53[5] = 0;
      __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_352((uint64_t)v53);
      v7 = 0;
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17B7244](v6);
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v59 = v30;
        _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory public key was already present but it has not been configured with HomeKit", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      -[HAPAccessoryServer keyStore](v28, "keyStore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v28, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      objc_msgSend(v31, "registerAccessoryWithHomeKit:error:", v32, &v54);
      v7 = v54;

    }
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](self, "_notifyDelegatesPairingStopped:", v7);

    goto LABEL_18;
  }
  v8 = (void *)MEMORY[0x1D17B7244](v6);
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    featureFlags = v9->_featureFlags;
    *(_DWORD *)buf = 138543618;
    v59 = v11;
    v60 = 2048;
    v61 = featureFlags;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting a reconfirm with Bonjour during pairing with flags: %llu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = -[HAPAccessoryServerIP reconfirm](v9, "reconfirm");
  featureFlags_low = LOBYTE(v9->_featureFlags);
  if (LOBYTE(v9->_featureFlags))
  {
    if ((featureFlags_low & 1) != 0)
    {
      if (v3)
      {
        v33 = -[HAPAccessoryServerIP _ensurePairingSessionIsInitializedWithType:](v9, "_ensurePairingSessionIsInitializedWithType:", 1);
        if ((_DWORD)v33)
        {
LABEL_28:
          HMErrorFromOSStatus(v33);
          v46[0] = v5;
          v46[1] = 3221225472;
          v46[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2;
          v46[3] = &unk_1E894E0F8;
          v46[4] = v9;
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v44 = v47;
          __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2((uint64_t)v46);
          -[HAPAccessoryServerIP _notifyDelegatesOfAddAccessoryFailureWithError:](v9, "_notifyDelegatesOfAddAccessoryFailureWithError:", v44);
          -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v9, "_tearDownSessionAndStartReachabilityWithError:", v44);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 79, 0, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v9, "_processQueuedOperationsWithError:", v45);
          return v33;
        }
        v35 = (void *)MEMORY[0x1D17B7244]();
        v36 = v9;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v38;
          _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Requesting consent for MFi Auth pair-setup", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](v36, "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
        {
          v39 = [HAPAccessoryInfo alloc];
          -[HAPAccessoryServer name](v36, "name");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServer category](v36, "category");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v39, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v40, 0, 0, v41, 0, 0, 0);

          -[HAPAccessoryServer delegateQueue](v36, "delegateQueue");
          v43 = objc_claimAutoreleasedReturnValue();
          v48[0] = v5;
          v48[1] = 3221225472;
          v48[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_357;
          v48[3] = &unk_1E894E0F8;
          v48[4] = v36;
          v49 = v42;
          v25 = v42;
          dispatch_async(v43, v48);

          v26 = v49;
          goto LABEL_13;
        }
LABEL_27:
        v33 = 4294960560;
        goto LABEL_28;
      }
    }
    else if ((featureFlags_low & 0x1A) == 0)
    {
      goto LABEL_9;
    }
    LODWORD(v33) = -[HAPAccessoryServerIP _continuePairingAfterAuthPromptWithRetry:](v9, "_continuePairingAfterAuthPromptWithRetry:", 1);
    return v33;
  }
LABEL_9:
  v15 = (void *)MEMORY[0x1D17B7244](v13);
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v9->_featureFlags;
    *(_DWORD *)buf = 138543618;
    v59 = v18;
    v60 = 2048;
    v61 = v19;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory doesn't support known auth flags: %llu, prompting user...", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  if (!-[HAPAccessoryServerIP _delegateRespondsToSelector:](v16, "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))goto LABEL_27;
  v20 = [HAPAccessoryInfo alloc];
  -[HAPAccessoryServer name](v16, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer category](v16, "category");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v20, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v21, 0, 0, v22, 0, 0, 0);

  -[HAPAccessoryServer delegateQueue](v16, "delegateQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_356;
  block[3] = &unk_1E894B6C0;
  v51 = v23;
  v52 = 4 * (featureFlags_low != 0);
  block[4] = v16;
  v25 = v23;
  dispatch_async(v24, block);

  v26 = v51;
LABEL_13:

LABEL_18:
  LODWORD(v33) = 0;
  return v33;
}

- (int)_continuePairingAfterAuthPromptWithRetry:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HAPAccessoryServerIP *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HAPAccessoryServerIP *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  BOOL v31;
  id location;
  _QWORD v33[5];
  char v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = 0;
  self->_retryingPairSetup = a3;
  v5 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke;
  v33[3] = &unk_1E894DD58;
  v33[4] = self;
  v6 = (void *)MEMORY[0x1D17B7400](v33, a2);
  objc_initWeak(&location, self);
  v25 = v5;
  v26 = 3221225472;
  v27 = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_363;
  v28 = &unk_1E89492D0;
  objc_copyWeak(&v30, &location);
  v31 = a3;
  v7 = v6;
  v29 = v7;
  v8 = (void *)MEMORY[0x1D17B7400](&v25);
  v12 = (void *)MEMORY[0x1D17B7244](v8, v9, v10, v11);
  v13 = self;
  HMFGetOSLogHandle();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v15;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Pair-setup starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  -[HAPAccessoryServerIP setCachedSocketInfo:](v13, "setCachedSocketInfo:", 0, v25, v26, v27, v28);
  v16 = -[HAPAccessoryServerIP _ensurePairingSessionIsInitializedWithType:](v13, "_ensurePairingSessionIsInitializedWithType:", 1);
  if (!(_DWORD)v16)
  {
    v17 = PairingSessionExchange();
    v16 = v17;
    if ((_DWORD)v17)
    {
      if ((_DWORD)v17 == -6771)
        goto LABEL_9;
    }
    else
    {
      if (-[HAPAccessoryServerIP cancelPairingErr](v13, "cancelPairingErr"))
      {
        v16 = -[HAPAccessoryServerIP cancelPairingErr](v13, "cancelPairingErr");
        goto LABEL_10;
      }
      v16 = -[HAPAccessoryServerIP _ensureHTTPClientSetUp](v13, "_ensureHTTPClientSetUp");
      if (!(_DWORD)v16)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v36, v35);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](v13, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/pair-setup"), v18, 2, v8);

LABEL_9:
        v16 = 0;
      }
    }
  }
LABEL_10:
  if (v36)
    free(v36);
  if ((_DWORD)v16)
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = v13;
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v22;
      v39 = 1024;
      v40 = v16;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Pair-setup start failed: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v19);
    HMErrorFromOSStatus(v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v20, "_tearDownSessionAndStartReachabilityWithError:", v23);
    (*((void (**)(id, void *))v7 + 2))(v7, v23);
    -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v20, "_processQueuedOperationsWithError:", v23);
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v20, "_notifyDelegatesPairingStopped:", v23);

  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v16;
}

- (int)_handlePairSetupCompletionWithData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HAPAccessoryServerIP *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HAPAccessoryServerIP *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  HAPAccessoryServerIP *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HAPAccessoryServerIP *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HAPAccessoryServerIP *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *context;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  HAPAccessoryServerIP *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id location;
  _QWORD v56[4];
  id v57;
  HAPAccessoryServerIP *v58;
  char v59;
  uint64_t v60;
  void *v61;
  uint8_t v62[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint8_t v68[32];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60 = 0;
  v61 = 0;
  v59 = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke;
  v56[3] = &unk_1E894DB00;
  v5 = v4;
  v57 = v5;
  v58 = self;
  v6 = (void *)MEMORY[0x1D17B7400](v56);
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_3;
  v52[3] = &unk_1E89492F8;
  objc_copyWeak(&v54, &location);
  v7 = v6;
  v53 = v7;
  v47 = (void *)MEMORY[0x1D17B7400](v52);
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = PairingSessionExchange();
  v10 = v9;
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 != -6771)
      goto LABEL_28;
LABEL_27:
    v10 = 0;
    goto LABEL_28;
  }
  if (!v59)
  {
    if (-[HAPAccessoryServerIP cancelPairingErr](self, "cancelPairingErr"))
    {
      v10 = -[HAPAccessoryServerIP cancelPairingErr](self, "cancelPairingErr");
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, v60);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/pair-setup"), v36, 2, v47);

    goto LABEL_27;
  }
  v11 = (void *)MEMORY[0x1D17B7244]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v70 = v14;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Pairing completed - Done", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (-[HAPAccessoryServer pairSetupType](v12, "pairSetupType") != 3)
  {
    if (-[HAPAccessoryServer pairSetupType](v12, "pairSetupType") == 5
      || -[HAPAccessoryServer pairSetupType](v12, "pairSetupType") == 6)
    {
      -[HAPAccessoryServerIP _handleMFiCertValidation](v12, "_handleMFiCertValidation");
    }
    else
    {
      -[HAPAccessoryServerIP _tearDownSession](v12, "_tearDownSession");
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v12, "_processQueuedOperationsWithError:", v37);
      -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v12, "_notifyDelegatesPairingStopped:", 0);

    }
    goto LABEL_27;
  }
  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = v12;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v62 = 138543362;
    v63 = v18;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Split pair setup done.", v62, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  v10 = PairingSessionDeriveKey();
  if (!(_DWORD)v10)
  {
    v10 = PairingSessionDeriveKey();
    if (!(_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v68, 32);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = v16;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138543874;
        v63 = v24;
        v64 = 2112;
        v65 = v20;
        v66 = 2112;
        v67 = v45;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Generated read key: %@, write key: %@", v62, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      -[HAPAccessoryServerIP httpClient](v22, "httpClient");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v26 = objc_msgSend(v25, "enableUAPSessionSecurityWithReadKey:writeKey:error:", buf, v68, &v51);
      v46 = v51;

      if ((v26 & 1) != 0)
        goto LABEL_16;
      context = (void *)MEMORY[0x1D17B7244]();
      v27 = v22;
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v62 = 138543618;
        v63 = v29;
        v64 = 2112;
        v65 = v46;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable HAP session security with error %@", v62, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      v10 = objc_msgSend(v46, "code");
      if (!(_DWORD)v10)
      {
LABEL_16:
        v30 = (void *)MEMORY[0x1D17B7244]();
        v31 = v22;
        HMFGetOSLogHandle();
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v62 = 138543362;
          v63 = v33;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Secure session enabled - starting Auth", v62, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        -[HAPAccessoryServerIP _notifyDelegateOfPairingProgress:](v31, "_notifyDelegateOfPairingProgress:", 2);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_370;
        v48[3] = &unk_1E894DB00;
        v35 = v34;
        v49 = v35;
        v50 = v31;
        -[HAPAccessoryServerIP getAccessoryInfo:](v31, "getAccessoryInfo:", v48);

        v10 = 0;
      }

    }
  }
LABEL_28:
  if (v61)
    free(v61);
  if ((_DWORD)v10)
  {
    v38 = (void *)MEMORY[0x1D17B7244]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v41;
      v71 = 1024;
      v72 = v10;
      _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@Pair-setup message failed with %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v38);
    HMErrorFromOSStatus(v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v39, "_tearDownSessionAndStartReachabilityWithError:", v42);
    (*((void (**)(id, void *))v7 + 2))(v7, v42);
    -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v39, "_processQueuedOperationsWithError:", v42);
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v39, "_notifyDelegatesPairingStopped:", v42);

  }
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);

  return v10;
}

- (void)_handlePairSetupAfterM4Callback
{
  NSObject *v3;
  int PeerFlags;
  void *v5;
  CFTypeID v6;
  id v7;
  void *v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HAPAccessoryServerIP *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HAPAccessoryServerIP *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  PeerFlags = PairingSessionGetPeerFlags();
  v5 = (void *)PairingSessionCopyProperty();
  v6 = CFGetTypeID(v5);
  if (v6 != CFDataGetTypeID())
  {
    v7 = 0;
    if (!v5)
      goto LABEL_24;
    goto LABEL_23;
  }
  v7 = v5;
  +[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer setProductData:](self, "setProductData:", v8);

  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v12;
    v40 = 1024;
    v41 = PeerFlags;
    v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Pair-setup after M4, flags %08X  productData %@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v9);
  -[HAPAccessoryServer category](v10, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", &unk_1E8989380) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceForKey:", CFSTR("shouldRequireOwnershipProof"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
    {
      v18 = (void *)MEMORY[0x1D17B7244]();
      v19 = v10;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v21;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Overriding to require ownership proof flags", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      if (!v7)
      {
        v37 = 0x1A862D3F6955180CLL;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v37, 8);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        +[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServer setProductData:](v19, "setProductData:", v22);

        v23 = (void *)MEMORY[0x1D17B7244]();
        v24 = v19;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v26;
          _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Overriding product data to that of BBN/IMP", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
      }
      goto LABEL_14;
    }
  }
  else
  {

  }
  if ((PeerFlags & 0x40000000) == 0)
    goto LABEL_22;
LABEL_14:
  -[HAPAccessoryServer pairingRequest](v10, "pairingRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "ownershipToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1D17B7244]();
  v30 = v10;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
  if (!v28)
  {
    if (v32)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v36;
      _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_INFO, "%{public}@Accessory requires ownership token, but we don't have one, bailing out", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    -[HAPAccessoryServerIP _notifyDelegateNeedsOwnershipToken](v30, "_notifyDelegateNeedsOwnershipToken");
    -[HAPAccessoryServerIP setCancelPairingErr:](v30, "setCancelPairingErr:", 4294896152);
LABEL_22:
    if (!v5)
      goto LABEL_24;
LABEL_23:
    CFRelease(v5);
    goto LABEL_24;
  }
  if (v32)
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v33;
    _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding an ownership token to the pairing session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v29);
  -[HAPAccessoryServer pairingRequest](v30, "pairingRequest");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "ownershipToken");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  PairingSessionSetProperty();

  if (v5)
    goto LABEL_23;
LABEL_24:

}

- (int)_promptForSetupCodeWithFlags:(unsigned int)a3 delaySeconds:(int)a4 pairingFlags:(unsigned int)a5 isWAC:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  HAPAccessoryServerIP *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  HAPAccessoryServerIP *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[6];
  _QWORD v26[5];
  int v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a6;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1D17B7244](self, a2);
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v14;
    v31 = 1024;
    v32 = a3;
    v33 = 1024;
    v34 = a4;
    v35 = 1024;
    v36 = a5;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Pair-setup received request to prompt for password, flags: %0x, delay: %d pairing flags: %0x isWAC: %@\n", buf, 0x28u);

  }
  objc_autoreleasePoolPop(v11);
  if ((a3 & 0x10000) == 0 || -[HAPAccessoryServerIP isHandlingInvalidSetupCode](v12, "isHandlingInvalidSetupCode"))
  {
    if ((a3 & 0x30000) != 0 || -[HAPAccessoryServerIP isHandlingInvalidSetupCode](v12, "isHandlingInvalidSetupCode"))
    {
      -[HAPAccessoryServerIP setHandlingInvalidSetupCode:](v12, "setHandlingInvalidSetupCode:", 0);
      if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](v12, "_delegateRespondsToSelector:", sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_))
      {
        -[HAPAccessoryServer delegateQueue](v12, "delegateQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_2;
        v26[3] = &unk_1E894D748;
        v26[4] = v12;
        v27 = a4;
        v18 = v26;
LABEL_20:
        dispatch_async(v16, v18);
        goto LABEL_21;
      }
    }
    else if (-[HAPAccessoryServerIP _delegateRespondsToSelector:](v12, "_delegateRespondsToSelector:", sel_accessoryServer_promptUserForPasswordWithType_))
    {
      if ((a5 & 0x40000000) != 0)
        v23 = 2;
      else
        v23 = 1;
      -[HAPAccessoryServer delegateQueue](v12, "delegateQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_3;
      v25[3] = &unk_1E894D3B0;
      v25[4] = v12;
      v25[5] = v23;
      v18 = v25;
      goto LABEL_20;
    }
    return -6702;
  }
  v19 = (void *)MEMORY[0x1D17B7244]();
  v20 = v12;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v22;
    _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Pair-setup restarting pairing before asking for the setup code.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  -[HAPAccessoryServerIP setHandlingInvalidSetupCode:](v20, "setHandlingInvalidSetupCode:", 1);
  if (!v6)
  {
    -[HAPAccessoryServer clientQueue](v20, "clientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke;
    block[3] = &unk_1E894DD08;
    block[4] = v20;
    v18 = block;
    goto LABEL_20;
  }
  -[HAPAccessoryServerIP hapWACAccessoryClient](v20, "hapWACAccessoryClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "restart");
LABEL_21:

  return 0;
}

- (int)_pairSetupTryPassword:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;
  char v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__HAPAccessoryServerIP__pairSetupTryPassword___block_invoke;
  v15[3] = &unk_1E8949320;
  objc_copyWeak(&v16, &location);
  v5 = (void *)MEMORY[0x1D17B7400](v15);
  if (self->_pairingSession)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v6 = PairingSessionSetSetupCode();
    if (!(_DWORD)v6)
    {
      v7 = PairingSessionExchange();
      if (v7)
      {
        if (v7 == -6771)
          v6 = 0;
        else
          v6 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/pair-setup"), v8, 2, v5);

        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 4294960578;
  }
  if (v20)
    free(v20);
  if ((_DWORD)v6)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 1024;
      v24 = v6;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed initializing message for try-password during Pair Setup: error: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v9);
    HMErrorFromOSStatus(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v10, "_tearDownSessionAndStartReachabilityWithError:", v13);
    -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v10, "_processQueuedOperationsWithError:", v13);
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v10, "_notifyDelegatesPairingStopped:", v13);

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)_shouldNotifyClientsOfPVFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "underlyingErrors"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "underlyingErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = !v8
      || !-[HAPAccessoryServerIP consecutivePairVerifyFailures](self, "consecutivePairVerifyFailures")
      || objc_msgSend(v8, "code") != -6722;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (int)_pairVerifyStartWithRetry:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v24;
  id v25;
  BOOL v26;
  id location;
  char v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = 0;
  v28 = 0;
  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __50__HAPAccessoryServerIP__pairVerifyStartWithRetry___block_invoke;
  v24 = &unk_1E8949348;
  objc_copyWeak(&v25, &location);
  v26 = a3;
  v5 = (void *)MEMORY[0x1D17B7400](&v21);
  v9 = (void *)MEMORY[0x1D17B7244](v5, v6, v7, v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Pair-verify starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = -[HAPAccessoryServerIP _ensurePairingSessionIsInitializedWithType:](v10, "_ensurePairingSessionIsInitializedWithType:", 3, v21, v22, v23, v24);
  if (!(_DWORD)v13)
  {
    v13 = PairingSessionExchange();
    if (!(_DWORD)v13)
    {
      v13 = -[HAPAccessoryServerIP _ensureHTTPClientSetUp](v10, "_ensureHTTPClientSetUp");
      if (!(_DWORD)v13)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](v10, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/pair-verify"), v14, 2, v5);

        v13 = 0;
      }
    }
  }
  if (v30)
    free(v30);
  if ((_DWORD)v13)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = v10;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 1024;
      v34 = v13;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Pair-verify start failed: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v15);
    HMErrorFromOSStatus(v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v16, "_tearDownSessionAndStartReachabilityWithError:", v19);
    -[HAPAccessoryServerIP invokePairVerifyCompletionBlock:](v16, "invokePairVerifyCompletionBlock:", v19);
    -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v16, "_processQueuedOperationsWithError:", v19);
    -[HAPAccessoryServerIP _notifyDelegatesPairingStopped:](v16, "_notifyDelegatesPairingStopped:", v19);

  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v13;
}

- (int)_handlePairVerifyCompletionWithData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v22;
  void *v24;
  char v25;
  HAPAccessoryServerIP *v26;
  NSObject *v27;
  void *v28;
  HAPAccessoryServerIP *v29;
  NSObject *v30;
  void *v31;
  void *context;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  id v38;
  id location;
  _QWORD v40[4];
  id v41;
  HAPAccessoryServerIP *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  char v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  _BYTE v55[14];
  char v56[32];
  char v57[32];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__649;
  v47 = __Block_byref_object_dispose__650;
  v48 = 0;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke;
  v40[3] = &unk_1E894DB00;
  v6 = v4;
  v41 = v6;
  v42 = self;
  v7 = (void *)MEMORY[0x1D17B7400](v40);
  objc_initWeak(&location, self);
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_3;
  v35[3] = &unk_1E8949370;
  objc_copyWeak(&v38, &location);
  v37 = &v43;
  v8 = v7;
  v36 = v8;
  v9 = (void *)MEMORY[0x1D17B7400](v35);
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = PairingSessionExchange();
  if ((_DWORD)v11)
    goto LABEL_5;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v51, v50);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v44[5];
    v44[5] = v13;

    -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/pair-verify"), v44[5], 2, v9);
    v12 = 0;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v11 = PairingSessionDeriveKey();
  if ((_DWORD)v11 || (v11 = PairingSessionDeriveKey(), (_DWORD)v11))
  {
LABEL_5:
    v12 = 0;
    goto LABEL_8;
  }
  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v25 = objc_msgSend(v24, "enableUAPSessionSecurityWithReadKey:writeKey:error:", v57, v56, &v34);
  v12 = v34;

  if ((v25 & 1) != 0)
    goto LABEL_24;
  context = (void *)MEMORY[0x1D17B7244]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v28;
    v54 = 2112;
    *(_QWORD *)v55 = v12;
    _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable HAP session security with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(context);
  v11 = objc_msgSend(v12, "code");
  if (!(_DWORD)v11)
  {
LABEL_24:
    -[HAPAccessoryServerIP invokePairVerifyCompletionBlock:](self, "invokePairVerifyCompletionBlock:", v12, context);
    -[HAPAccessoryServerIP setSecuritySessionOpen:](self, "setSecuritySessionOpen:", 1);
    -[HAPAccessoryServer setReachable:](self, "setReachable:", 1);
    context = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerIP _notifyDelegatesOfConnectionState:withError:](self, "_notifyDelegatesOfConnectionState:withError:", 1, 0));
    v29 = self;
    HMFGetOSLogHandle();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v31;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%{public}@Pair-verify succeeded", buf, 0xCu);

    }
    objc_autoreleasePoolPop(context);
    goto LABEL_7;
  }
LABEL_8:
  if (v51)
    free(v51);
  if ((_DWORD)v11)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v18;
      v54 = 1024;
      *(_DWORD *)v55 = v11;
      *(_WORD *)&v55[4] = 2112;
      *(_QWORD *)&v55[6] = v10;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify message failed: %d with data: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v15);
    HMErrorFromOSStatus(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HAPAccessoryServer useHH2](v16, "useHH2");
    if ((_DWORD)v11 == -6727 && v20)
    {
      v33 = v19;
      -[HAPAccessoryServerIP _handleSecureSessionClosingWithError:status:data:](v16, "_handleSecureSessionClosingWithError:status:data:", &v33, 4294960569, v10);
      v22 = v33;

      v19 = v22;
    }
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v16, "_tearDownSessionAndStartReachabilityWithError:", v19, context);
    (*((void (**)(id, void *))v8 + 2))(v8, v19);
    -[HAPAccessoryServerIP _processQueuedOperationsWithError:](v16, "_processQueuedOperationsWithError:", v19);
    -[HAPAccessoryServerIP invokePairVerifyCompletionBlock:](v16, "invokePairVerifyCompletionBlock:", v19);

  }
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v43, 8);
  return v11;
}

- (BOOL)_handleSecureSessionClosingWithError:(id *)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5;
  id v8;
  _BOOL4 v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v5 = *(_QWORD *)&a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[HAPAccessoryServer useHH2](self, "useHH2");
  v10 = 0;
  if (a3)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "length");
      v10 = 0;
      if ((_DWORD)v5)
      {
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v12;
          -[HAPAccessoryServer securitySessionWillCloseWithResponseData:error:](self, "securitySessionWillCloseWithResponseData:error:", v8, &v21);
          v13 = v21;

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", 4294960542);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if (v15)
          {
            v16 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(*a3, "domain");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(*a3, "code");
            v22 = *MEMORY[0x1E0CB3388];
            v23[0] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v19);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          v10 = v15 ^ 1;

        }
      }
    }
  }

  return v10;
}

- (void)_validateReachabilityTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  HAPAccessoryServerIP *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_reachabilityStartTime);
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPAccessoryServerIP _getReachabilityTimeoutValue](self, "_getReachabilityTimeoutValue");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceForKey:", CFSTR("HAPReachabilityTimerDelayToleranceInSeconds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v13 = v12;
  v14 = objc_msgSend(v11, "doubleValue");
  if (v13 > v8 + v15)
  {
    v16 = (void *)MEMORY[0x1D17B7244](v14);
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v19;
      v26 = 2112;
      v27 = v6;
      v28 = 2048;
      v29 = v8;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Reachability timer late actual duration %@  expected %0.3f", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8, CFSTR("HAPAccessoryDuration"), CFSTR("HAPAccessoryExpectedDuration"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAPAccessoryServer notifyClients:withDictionary:](v17, "notifyClients:withDictionary:", 4, v21);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPAccessoryServerIP bonjourEventTimer](self, "bonjourEventTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Timed out waiting for Bonjour event after legacy WAC completion - aborting...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__HAPAccessoryServerIP_timerDidFire___block_invoke;
    v15[3] = &unk_1E894E0F8;
    v15[4] = v10;
    v15[5] = v13;
    __37__HAPAccessoryServerIP_timerDidFire___block_invoke((uint64_t)v15);
    -[HAPAccessoryServerIP _notifyDelegatesOfAddAccessoryFailureWithError:](v10, "_notifyDelegatesOfAddAccessoryFailureWithError:", v13);
    -[HAPAccessoryServerIP setBonjourEventTimer:](v10, "setBonjourEventTimer:", 0);

  }
  else
  {
    -[HAPAccessoryServerIP reachabilityEventTimer](self, "reachabilityEventTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[HAPAccessoryServerIP _validateReachabilityTimer](self, "_validateReachabilityTimer");
      -[HAPAccessoryServerIP reachabilityEventTimer](self, "reachabilityEventTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "suspend");

      -[HAPAccessoryServerIP pollAccessory](self, "pollAccessory");
    }
    else
    {
      -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        -[HAPAccessoryServerIP _handleConnectionIdleTimeout](self, "_handleConnectionIdleTimeout");
    }
  }

}

- (void)networkMonitorIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPAccessoryServerIP *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)networkMonitorIsUnreachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPAccessoryServerIP *v9;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HAPAccessoryServerIP_networkMonitorIsUnreachable___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)getAccessoryInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__649;
  v13[4] = __Block_byref_object_dispose__650;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke;
  v7[3] = &unk_1E89493C0;
  v9 = v13;
  v10 = v11;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

}

- (BOOL)_validateProtocolInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_7;
  v7 = objc_msgSend(v4, "categoryIdentifier");
  -[HAPAccessoryServer category](self, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "unsignedShortValue")
    || self->_featureFlags != objc_msgSend(v4, "featureFlags"))
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "protocolVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer category](v14, "category");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPAccessoryServer authMethod](v14, "authMethod");
    -[HAPAccessoryServer version](v14, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544386;
    v22 = v16;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v17;
    v27 = 2048;
    v28 = v18;
    v29 = 2112;
    v30 = v19;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match category: %@, authMethods: %tu version: %@", (uint8_t *)&v21, 0x34u);

  }
  objc_autoreleasePoolPop(v13);
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)validatePairingAuthMethod:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("validatePairingAuthMethod"));
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HAPAccessoryServerIP_validatePairingAuthMethod___block_invoke;
  v7[3] = &unk_1E894D9E8;
  v7[4] = self;
  v9 = v4;
  v8 = v10;
  v6 = v4;
  dispatch_async(v5, v7);

  __HMFActivityScopeLeave();
}

- (void)_validatePairingAuthMethod:(id)a3 activity:(id)a4
{
  void (**v6)(id, void *, uint64_t);
  id v7;
  NSObject *v8;
  void *v9;
  HAPAccessoryServerIP *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HAPAccessoryServerIP *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  HAPAccessoryServerIP *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HAPAccessoryServerIP *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  void (**v48)(id, void *, uint64_t);
  id v49[2];
  char v50;
  _QWORD v51[4];
  id v52;
  void (**v53)(id, void *, uint64_t);
  id v54;
  id location;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
  {
    if ((self->_featureFlags & 0x20) == 0)
    {
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v12;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Not sending auth challenge request because the accessory doesn't claim to support it", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13, 5);

      goto LABEL_11;
    }
    if (!self->_featureFlags)
    {
      v26 = 0;
      goto LABEL_19;
    }
    if ((self->_featureFlags & 1) != 0)
    {
      LOBYTE(location) = 0;
      +[HAPProtocolMessages constructAuthChallengeRequest:nonce:outTID:](HAPProtocolMessages, "constructAuthChallengeRequest:nonce:outTID:", &unk_1E8989368, 0, &location);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1D17B7244]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v36;
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Sending auth challenge request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
      objc_initWeak((id *)buf, v34);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke_407;
      v46[3] = &unk_1E89493E8;
      objc_copyWeak(v49, (id *)buf);
      v48 = v6;
      v37 = v7;
      v50 = (char)location;
      v47 = v37;
      v49[1] = (id)1;
      v38 = (void *)MEMORY[0x1D17B7400](v46);
      objc_msgSend(v37, "markWithReason:", CFSTR("Sending auth challenge request"));
      -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](v34, "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/secure-message"), v32, 3, v38);

      objc_destroyWeak(v49);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      if ((self->_featureFlags & 2) != 0)
      {
        v39 = 2;
      }
      else if ((self->_featureFlags & 8) != 0)
      {
        v39 = 4;
      }
      else
      {
        if ((self->_featureFlags & 0x10) == 0)
        {
          v26 = 5;
LABEL_19:
          v27 = (void *)MEMORY[0x1D17B7244]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = off_1E8948F80[v26];
            *(_DWORD *)buf = 138543618;
            v57 = v30;
            v58 = 2112;
            v59 = v31;
            _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Not sending auth challenge because the auth method doesn't support auth challenges or is unknown: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          v6[2](v6, 0, v26);
          goto LABEL_11;
        }
        v39 = 6;
      }
      v40 = (void *)MEMORY[0x1D17B7244]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = off_1E8948F80[v39];
        *(_DWORD *)buf = 138543618;
        v57 = v43;
        v58 = 2112;
        v59 = v44;
        _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Not sending auth challenge due to unsupported auth type: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v45, 5);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and then doing auth challenge request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_initWeak(&location, v15);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke;
    v51[3] = &unk_1E894A548;
    v53 = v6;
    objc_copyWeak(&v54, &location);
    v18 = v7;
    v52 = v18;
    v19 = (void *)MEMORY[0x1D17B7400](v51);
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing auth challenge request until pair-verify completes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v18, "markWithReason:", CFSTR("Queuing"));
    -[HAPAccessoryServerIP queuedOperations](v21, "queuedOperations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1D17B7400](v19);
    objc_msgSend(v24, "addObject:", v25);

    -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v21, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.validatePairingAuthMethod"));
    objc_destroyWeak(&v54);

    objc_destroyWeak(&location);
  }
LABEL_11:

}

- (BOOL)_validateAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  id *v23;
  uint64_t v24;
  void *v25;
  HAPAccessoryServerIP *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HAPAccessoryServerIP *v30;
  NSObject *v31;
  void *v32;
  id *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint8_t v41[4];
  void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = 0;
  v36 = 0;
  v9 = +[HAPProtocolMessages parseAuthChallengeResponse:expectedTID:outChallengeResponse:outMFICert:withHeader:](HAPProtocolMessages, "parseAuthChallengeResponse:expectedTID:outChallengeResponse:outMFICert:withHeader:", v8, v6, &v36, &v35, 1);
  v10 = v36;
  v11 = v35;
  if (v9)
  {
    v34 = a5;
    PairingSessionDeriveKey();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41, 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmf_hexadecimalRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Derived nonce: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = objc_retainAutorelease(v12);
    objc_msgSend(v18, "bytes");
    objc_msgSend(v18, "length");
    v19 = objc_retainAutorelease(v10);
    objc_msgSend(v19, "bytes");
    objc_msgSend(v19, "length");
    v20 = objc_retainAutorelease(v11);
    objc_msgSend(v20, "bytes");
    objc_msgSend(v20, "length");
    v21 = MFiPlatform_VerifySignature();
    v22 = (_DWORD)v21 == 0;
    v23 = v34;
    if ((_DWORD)v21)
    {
      v24 = v21;
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = v14;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        v39 = 1024;
        LODWORD(v40) = v24;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Unable to verify the signature, got error: %d", buf, 0x12u);

        v23 = v34;
      }

      objc_autoreleasePoolPop(v25);
      if (v23)
      {
        if ((_DWORD)v24 == -67808)
          objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 17);
        else
          HMErrorFromOSStatus(v24);
        *v23 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17B7244]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v41 = 138543362;
      v42 = v32;
      _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse auth challenge response", v41, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 15);
      v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (void)authenticateAccessory
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HAPAccessoryServerIP_authenticateAccessory__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2048;
    v15 = -[HAPAccessoryServer pairSetupType](v6, "pairSetupType");
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Current Pair Setup Type %tu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServer clientQueue](v6, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke;
  v10[3] = &unk_1E894D770;
  v10[4] = v6;
  v11 = a3;
  dispatch_async(v9, v10);

}

- (void)provisionToken:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServer clientQueue](v6, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__HAPAccessoryServerIP_provisionToken___block_invoke;
  v11[3] = &unk_1E894E0F8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)tearDownSessionOnAuthCompletion
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerIP_tearDownSessionOnAuthCompletion__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPAccessoryServerIP *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Sending Auth Exchange with data: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HAPAccessoryServer clientQueue](v9, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke;
  v14[3] = &unk_1E894E0F8;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke;
  v15[3] = &unk_1E894DA30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)copyPairingIdentityDelegateCallback
{
  return _CopyPairingIdentityDelegateCallback_f;
}

- (void)findPairedPeerDelegateCallback
{
  return _FindPairedPeerDelegateCallback_f;
}

- (void)savePairedPeerDelegateCallback
{
  return _SavePairedPeerDelegateCallback_f;
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HAPAccessoryServerIP *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HAPAccessoryServerIP_addPairing_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E894D6D0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_startAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  HAPPairingIdentity *v17;
  void *v18;
  void *v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *context;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  NSObject *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v9 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v13);
  v17 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v12, v16, 0, v9);
  v38 = 0;
  +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createAddPairingRequestForPairingIdentity:error:", v17, &v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v38;
  if (v18)
  {
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("pairings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_444;
      v32[3] = &unk_1E8949410;
      v32[4] = self;
      v33 = v14;
      v34 = v15;
      -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", v19, v18, 2, v32);

    }
    else
    {
      v30 = v15;
      context = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = v12;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing add-pairing", buf, 0xCu);

        v12 = v27;
      }

      objc_autoreleasePoolPop(context);
      v15 = v30;
      -[HAPAccessoryServerIP _queueAddPairingWithIdentifier:publicKey:admin:queue:completion:](v24, "_queueAddPairingWithIdentifier:publicKey:admin:queue:completion:", v12, v13, v9, v14, v30);
      -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v24, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("pairingAdd"));
    }
    goto LABEL_12;
  }
  v20 = (void *)MEMORY[0x1D17B7244]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v23;
    v41 = 2112;
    v42 = v31;
    _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing request payload with error: %@", buf, 0x16u);

    v15 = v29;
  }

  objc_autoreleasePoolPop(v20);
  if (v14 && v15)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v36 = v31;
    v37 = v15;
    dispatch_async(v14, block);

    v19 = v36;
LABEL_12:

  }
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HAPAccessoryServerIP_removePairing_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E894D6D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  HAPPairingIdentity *v15;
  void *v16;
  id v17;
  HAPAccessoryServerIP *v18;
  NSObject *v19;
  void *v20;
  void *context;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v11);
  v15 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v10, v14, 0, 0);
  v25 = 0;
  +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createRemovePairingRequestForPairingIdentity:error:", v15, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v25;
  if (v16)
  {
    -[HAPAccessoryServerIP _establishSecureSessionAndRemovePairing:queue:completion:](self, "_establishSecureSessionAndRemovePairing:queue:completion:", v16, v12, v13);
  }
  else
  {
    context = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing request payload with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(context);
    if (v12 && v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__HAPAccessoryServerIP__removePairingWithIdentifier_publicKey_queue_completion___block_invoke;
      block[3] = &unk_1E894D5E0;
      v23 = v17;
      v24 = v13;
      dispatch_async(v12, block);

    }
  }

}

- (void)_establishSecureSessionAndRemovePairing:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id location;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServer keyStore](self, "keyStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v12, 0, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;

  if (v13)
  {
    if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
    {
      -[HAPAccessoryServerIP _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
      -[HAPAccessoryServerIP _sendRemovePairingWithData:queue:completion:](self, "_sendRemovePairingWithData:queue:completion:", v8, v9, v10);
    }
    else
    {
      -[HAPAccessoryServerIP _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke;
      v17[3] = &unk_1E8949488;
      objc_copyWeak(&v21, &location);
      v18 = v8;
      v19 = v9;
      v20 = v10;
      -[HAPAccessoryServerIP setPairVerifyCompletionBlock:](self, "setPairVerifyCompletionBlock:", v17);
      -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", CFSTR("pairingRemove"));
      -[HAPAccessoryServerIP _establishSecureSession](self, "_establishSecureSession");

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else if (v9 && v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_3;
    block[3] = &unk_1E894D498;
    v16 = v10;
    dispatch_async(v9, block);

  }
}

- (void)_sendRemovePairingWithData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("pairings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HAPAccessoryServerIP__sendRemovePairingWithData_queue_completion___block_invoke;
  v14[3] = &unk_1E8949410;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", v11, v10, 2, v14);

}

- (void)_handlePairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 removeRequest:(BOOL)a7 completionQueue:(id)a8 completionBlock:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  _BOOL4 v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  HAPAccessoryServerIP *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  BOOL v32;
  void *v33;
  void *v34;
  HAPAccessoryServerIP *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  HAPAccessoryServerIP *v42;
  NSObject *v43;
  id v44;
  void *v45;
  const char *v46;
  void *v47;
  HAPAccessoryServerIP *v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  id v55;
  _QWORD block[4];
  id v57;
  id v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  _BYTE v66[24];
  __int16 v67;
  id v68;
  uint64_t v69;

  v10 = a7;
  v69 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  if (v16)
  {
    v19 = v10;
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("add");
      *(_DWORD *)buf = 138543874;
      v62 = (uint64_t)v23;
      v63 = 2112;
      if (v19)
        v24 = CFSTR("remove");
      v64 = (void *)v24;
      v65 = 2112;
      *(_QWORD *)v66 = v16;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to %@ pairing with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = v16;
  }
  else if (v15 && a4 == 2 && a5 == 200 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v54 = v10;
    v26 = (void *)MEMORY[0x1D17B7244]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      v31 = "add";
      if (v54)
        v31 = "remove";
      *(_DWORD *)buf = 138543618;
      v62 = v29;
      v63 = 2080;
      v64 = (void *)v31;
      _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Received valid response to %s pairing", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    if (v54)
    {
      v60 = 0;
      v32 = +[HAPPairingUtilities parseRemovePairingResponse:error:](HAPPairingUtilities, "parseRemovePairingResponse:error:", v15, &v60);
      v33 = v60;
    }
    else
    {
      v59 = 0;
      v32 = +[HAPPairingUtilities parseAddPairingResponse:error:](HAPPairingUtilities, "parseAddPairingResponse:error:", v15, &v59);
      v33 = v59;
    }
    v25 = v33;
    if (!v32)
    {
      v41 = (void *)MEMORY[0x1D17B7244]();
      v42 = v27;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v44 = v15;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = "add";
        *(_DWORD *)buf = 138544130;
        v63 = 2080;
        v62 = (uint64_t)v45;
        if (v54)
          v46 = "remove";
        v64 = (void *)v46;
        v65 = 2112;
        *(_QWORD *)v66 = v44;
        *(_WORD *)&v66[8] = 2112;
        *(_QWORD *)&v66[10] = v25;
        _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse %s pairing response: %@ with error %@", buf, 0x2Au);

        v15 = v44;
      }

      objc_autoreleasePoolPop(v41);
    }
    if (v25)
    {
      v47 = (void *)MEMORY[0x1D17B7244]();
      v48 = v27;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = "add";
        *(_DWORD *)buf = 138544130;
        v63 = 2080;
        v62 = (uint64_t)v50;
        if (v54)
          v51 = "remove";
        v64 = (void *)v51;
        v65 = 2112;
        *(_QWORD *)v66 = v15;
        *(_WORD *)&v66[8] = 2112;
        *(_QWORD *)&v66[10] = v25;
        _os_log_impl(&dword_1CCE01000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse %s pairing response: %@ with error %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v47);
    }
  }
  else
  {
    v55 = v15;
    v34 = (void *)MEMORY[0x1D17B7244]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v53 = v34;
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v37 = "remove";
      else
        v37 = "add";
      v38 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v39 = CFSTR("Invalid");
      else
        v39 = off_1E894BB00[a4 - 1];
      v40 = v39;
      *(_DWORD *)buf = 138544642;
      v62 = (uint64_t)v52;
      v63 = 2080;
      v64 = (void *)v37;
      v65 = 1024;
      *(_DWORD *)v66 = a5;
      *(_WORD *)&v66[4] = 2080;
      *(_QWORD *)&v66[6] = v38;
      *(_WORD *)&v66[14] = 2112;
      *(_QWORD *)&v66[16] = v40;
      v67 = 2112;
      v68 = v55;
      _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response to %s /pairings with HTTP status '%d %s', serializationType %@ responseObject %@", buf, 0x3Au);

      v34 = v53;
    }

    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v55;
  }
  if (v17 && v18)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__HAPAccessoryServerIP__handlePairingsResponseObject_type_httpStatus_httpError_removeRequest_completionQueue_completionBlock___block_invoke;
    block[3] = &unk_1E894D5E0;
    v58 = v18;
    v57 = v25;
    dispatch_async(v17, block);

  }
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[5];

  v46[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = 0;
  -[HAPAccessoryServer getControllerPairingIdentityWithError:](self, "getControllerPairingIdentityWithError:", &v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v40;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publicKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v12 && v10)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v18;
        v43 = 2112;
        v44 = v10;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending request to accessory to remove the pairing for the current controller: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HAPAccessoryServer keyStore](v16, "keyStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer identifier](v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer clientQueue](v16, "clientQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_464;
      v27[3] = &unk_1E8949460;
      v27[4] = v16;
      v28 = v10;
      v29 = v12;
      v30 = v19;
      v31 = v20;
      v32 = v6;
      v33 = v7;
      v22 = v20;
      v14 = v19;
      dispatch_async(v21, v27);

      v9 = 0;
      v13 = 1;
    }
    else
    {
      v45[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove the pairing for the current controller"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v23;
      v45[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("There was no controller public key or controller username"), &stru_1E894EFE8, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:userInfo:", 27, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      if (v6 && v7)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2;
        v34[3] = &unk_1E894D5E0;
        v36 = v7;
        v9 = v9;
        v35 = v9;
        dispatch_async(v6, v34);

        v13 = 0;
      }
    }
    goto LABEL_13;
  }
  v13 = 0;
  if (v6 && v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke;
    block[3] = &unk_1E894D5E0;
    v39 = v7;
    v9 = v9;
    v38 = v9;
    dispatch_async(v6, block);

    v13 = 0;
    v14 = v39;
LABEL_13:

  }
  return v13;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
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
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HAPAccessoryServerIP_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E894D9E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HAPAccessoryServerIP *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerIP *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished"))
  {
    v25 = 0;
    +[HAPPairingUtilities createListPairingsRequest:](HAPPairingUtilities, "createListPairingsRequest:", &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (v8)
    {
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("pairings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E8949410;
      v19[4] = self;
      v20 = v6;
      v21 = v7;
      -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](self, "sendPOSTRequestToURL:request:serializationType:completionHandler:", v10, v8, 2, v19);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create list pairings request payload with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      if (!v6 || !v7)
        goto LABEL_13;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke;
      block[3] = &unk_1E894D5E0;
      v24 = v7;
      v23 = v9;
      dispatch_async(v6, block);

      v10 = v24;
    }

LABEL_13:
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x1D17B7244]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing list-pairing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HAPAccessoryServerIP _queueListPairingWithCompletionQueue:completionHandler:](v12, "_queueListPairingWithCompletionQueue:completionHandler:", v6, v7);
  -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v12, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.listPairings"));
LABEL_14:

}

- (void)_handleListPairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  HAPAccessoryServerIP *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  HAPAccessoryServerIP *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HAPAccessoryServerIP *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  _BYTE v49[24];
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v15)
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v21;
      v48 = 2112;
      *(_QWORD *)v49 = v15;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to list-pairings with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v22 = v15;
LABEL_21:
    v28 = v22;
LABEL_22:
    v27 = 0;
    goto LABEL_23;
  }
  if (!v14 || a4 != 2 || a5 != 200 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v33 = (void *)MEMORY[0x1D17B7244]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v40 = v33;
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3)
        v38 = CFSTR("Invalid");
      else
        v38 = off_1E894BB00[a4 - 1];
      v39 = v38;
      *(_DWORD *)buf = 138544386;
      v47 = v36;
      v48 = 1024;
      *(_DWORD *)v49 = a5;
      *(_WORD *)&v49[4] = 2080;
      *(_QWORD *)&v49[6] = v37;
      *(_WORD *)&v49[14] = 2112;
      *(_QWORD *)&v49[16] = v39;
      v50 = 2112;
      v51 = v14;
      _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response to list-pairings with HTTP status '%d %s', serializationType %@ responseObject %@", buf, 0x30u);

      v33 = v40;
    }

    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v23 = (void *)MEMORY[0x1D17B7244]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v26;
    _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received valid response to list-pairings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v45 = 0;
  +[HAPPairingUtilities parseListPairingsResponse:error:](HAPPairingUtilities, "parseListPairingsResponse:error:", v14, &v45);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v45;
  if (!v27)
  {
    v29 = (void *)MEMORY[0x1D17B7244]();
    v30 = v24;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v32;
      v48 = 2112;
      *(_QWORD *)v49 = v14;
      *(_WORD *)&v49[8] = 2112;
      *(_QWORD *)&v49[10] = v28;
      _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse list-pairings response: %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    goto LABEL_22;
  }
LABEL_23:
  if (v16 && v17)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__HAPAccessoryServerIP__handleListPairingsResponseObject_type_httpStatus_httpError_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E894D9E8;
    v44 = v17;
    v42 = v27;
    v43 = v28;
    dispatch_async(v16, block);

  }
}

- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA548C8))
  {
    v10 = -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerIP_didReceiveHTTPHeaders_httpBody_);

    if (v10)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__HAPAccessoryServerIP_httpClient_didReceiveHTTPMessageWithHeaders_body___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v13 = v7;
      v14 = v8;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HAPAccessoryServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA548C8))
  {
    v10 = -[HAPAccessoryServerIP _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerIP_willSendHTTPHeaders_httpBody_);

    if (v10)
    {
      -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__HAPAccessoryServerIP_httpClient_willSendHTTPMessageWithHeaders_body___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v13 = v7;
      v14 = v8;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)startPing
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HAPAccessoryServerIP_startPing__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopPing
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HAPAccessoryServerIP_stopPing__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)pingSupported
{
  return 1;
}

- (void)_stopReachabilityTimer
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  HMFTimer *reachabilityEventTimer;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_reachabilityEventTimer)
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping reachability timer", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMFTimer suspend](self->_reachabilityEventTimer, "suspend");
    reachabilityEventTimer = self->_reachabilityEventTimer;
    self->_reachabilityEventTimer = 0;

  }
}

- (void)_stopReachability
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  HAPAccessoryServerIP *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServer accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {

LABEL_7:
    -[HAPAccessoryServerIP _stopReachabilityTimer](self, "_stopReachabilityTimer");
    return;
  }
  v5 = -[HAPAccessoryServer reachabilityPingEnabled](self, "reachabilityPingEnabled");

  if (!v5)
    goto LABEL_7;
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Server still has accessories to support ping for -- ignoring stop ping request for server", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
}

- (double)_getReachabilityTimeoutValueWithSleepInterval:(id)a3
{
  double minimumReachabilityPingInterval;
  double v4;
  double v5;

  minimumReachabilityPingInterval = self->_minimumReachabilityPingInterval;
  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    v5 = v4 / 1000.0;
    if (v5 > minimumReachabilityPingInterval)
      return v5;
  }
  return minimumReachabilityPingInterval;
}

- (double)_getReachabilityTimeoutValue
{
  double minimumReachabilityPingInterval;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  minimumReachabilityPingInterval = self->_minimumReachabilityPingInterval;
  -[HAPAccessoryServerIP primaryAccessory](self, "primaryAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicOfType:serviceType:", CFSTR("0000023A-0000-1000-8000-0026BB765291"), CFSTR("00000239-0000-1000-8000-0026BB765291"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _getReachabilityTimeoutValueWithSleepInterval:](self, "_getReachabilityTimeoutValueWithSleepInterval:", v6);
    minimumReachabilityPingInterval = v7;

  }
  return minimumReachabilityPingInterval;
}

- (id)_startReachabilityEventTimer
{
  void *v3;
  HAPAccessoryServerIP *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServer shouldDisconnectOnIdle](self, "shouldDisconnectOnIdle"))
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@shouldDisconnectOnIdle is enabled -- ignoring request to start reachability timer", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    goto LABEL_6;
  }
  -[HAPAccessoryServerIP reachabilityEventTimer](self, "reachabilityEventTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_6:
    v8 = 0;
    return v8;
  }
  v10 = -[HAPAccessoryServerIP _getReachabilityTimeoutValue](self, "_getReachabilityTimeoutValue");
  v12 = v11;
  v13 = (void *)MEMORY[0x1D17B7244](v10);
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP primaryAccessory](v14, "primaryAccessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v16;
    v23 = 2112;
    v24 = v18;
    v25 = 2048;
    v26 = v12;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting reachability poll timer for accessory: %@ to %0.3fs", (uint8_t *)&v21, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 3, v12);
  objc_msgSend(v8, "setDelegate:", v14);
  -[HAPAccessoryServer clientQueue](v14, "clientQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegateQueue:", v19);

  -[HAPAccessoryServerIP setReachabilityEventTimer:](v14, "setReachabilityEventTimer:", v8);
  -[HAPAccessoryServer setReachabilityPingEnabled:](v14, "setReachabilityPingEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerIP setReachabilityStartTime:](v14, "setReachabilityStartTime:", v20);

  return v8;
}

- (void)_startReachability
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP _startReachabilityEventTimer](self, "_startReachabilityEventTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HAPAccessoryServerIP _pollAccessory](self, "_pollAccessory");
    v4 = v5;
  }

}

- (void)_indicateSessionActivityWithReason:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HAPAccessoryServer setReachabilityChangedReason:](self, "setReachabilityChangedReason:", a3);
  -[HAPAccessoryServer setReachable:](self, "setReachable:", 1);
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HAPAccessoryServerIP__indicateSessionActivityWithReason___block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_doReachabilityWithError:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPAccessoryServerIP *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  HAPAccessoryServerIP *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    -[HAPAccessoryServer buildReachabilityNotificationDictionary:reachable:linkType:withError:](self, "buildReachabilityNotificationDictionary:reachable:linkType:withError:", v7, 0, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer incrementFailedPing](self, "incrementFailedPing");
    -[HAPAccessoryServer notifyClients:withDictionary:](self, "notifyClients:withDictionary:", 1, v9);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceForKey:", CFSTR("reachabilityFailedPingLimit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v7, "setConsecutiveFailedPingCount:", objc_msgSend(v7, "consecutiveFailedPingCount") + 1));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "consecutiveFailedPingCount");
      objc_msgSend(v7, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v16;
      v27 = 1024;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Reachability poll failure count: %d for accessory: %@", (uint8_t *)&v25, 0x1Cu);

    }
    objc_autoreleasePoolPop(v13);
    v19 = objc_msgSend(v7, "consecutiveFailedPingCount");
    if (v19 == objc_msgSend(v12, "intValue"))
      -[HAPAccessoryServerIP _accessoryDidBecomeUnreachable:](v14, "_accessoryDidBecomeUnreachable:", v7);

  }
  else
  {
    -[HAPAccessoryServer incrementSuccessfulPing](self, "incrementSuccessfulPing");
    if (objc_msgSend(v7, "consecutiveFailedPingCount"))
    {
      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v23;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Reachability poll -- resetting consecutive ping failure", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v7, "setConsecutiveFailedPingCount:", 0);
    }
    if ((objc_msgSend(v7, "isReachable") & 1) == 0)
    {
      if ((objc_msgSend(v7, "isPrimary") & 1) == 0)
      {
        -[HAPAccessoryServer setReachabilityChangedReason:](self, "setReachabilityChangedReason:", CFSTR("Ping"));
        objc_msgSend(v7, "setReachable:", 1);
      }
      -[HAPAccessoryServer buildReachabilityNotificationDictionary:reachable:linkType:withError:](self, "buildReachabilityNotificationDictionary:reachable:linkType:withError:", v7, 1, 1, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServer notifyClients:withDictionary:](self, "notifyClients:withDictionary:", 2, v24);

    }
    -[HAPAccessoryServer buildReachabilityNotificationDictionary:reachable:linkType:withError:](self, "buildReachabilityNotificationDictionary:reachable:linkType:withError:", v7, 1, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer notifyClients:withDictionary:](self, "notifyClients:withDictionary:", 1, v9);
  }

}

- (void)_doPollForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPAccessoryServerIP *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_reachabilityEventTimer)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      objc_autoreleasePoolPop(v8);
      goto LABEL_9;
    }
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    v12 = "%{public}@Reachability poll called while reachability event timer is nil";
LABEL_7:
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_8;
  }
  objc_msgSend(v4, "characteristicOfType:serviceType:", CFSTR("0000023C-0000-1000-8000-0026BB765291"), CFSTR("00000239-0000-1000-8000-0026BB765291"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "characteristicOfType:serviceType:", CFSTR("00000052-0000-1000-8000-0026BB765291"), CFSTR("0000003E-0000-1000-8000-0026BB765291"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      v12 = "%{public}@Reachability poll failed - no suitable characteristic";
      goto LABEL_7;
    }
  }
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__HAPAccessoryServerIP__doPollForAccessory___block_invoke;
  v13[3] = &unk_1E894D540;
  v13[4] = self;
  v14 = v4;
  objc_msgSend(v14, "readValueForCharacteristic:timeout:completionQueue:completionHandler:", v6, v7, v13, 0.0);

LABEL_9:
}

- (void)_pollAccessory
{
  BOOL v3;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[HAPAccessoryServer reachabilityPingEnabled](self, "reachabilityPingEnabled");
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP primaryAccessory](v5, "primaryAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Reachability poll for accessory: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPAccessoryServerIP primaryAccessory](v5, "primaryAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP _doPollForAccessory:](v5, "_doPollForAccessory:", v11);

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Reachability ping disabled", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HAPAccessoryServerIP stopPing](v5, "stopPing");
  }
}

- (void)pollAccessory
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HAPAccessoryServerIP_pollAccessory__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_accessoryDidBecomeUnreachable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HAPAccessoryServerIP *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HAPAccessoryServerIP *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isReachable");
    objc_msgSend(v4, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v9;
    v19 = 1024;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory became unreachable after ping - reachable flag %d accessory: %@", (uint8_t *)&v17, 0x1Cu);

  }
  objc_autoreleasePoolPop(v6);
  -[HAPAccessoryServer setReachabilityChangedReason:](v7, "setReachabilityChangedReason:", CFSTR("Ping"));
  if (objc_msgSend(v4, "isReachable"))
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Marking accessory unreachable", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HAPAccessoryServer buildReachabilityNotificationDictionary:reachable:linkType:withError:](v13, "buildReachabilityNotificationDictionary:reachable:linkType:withError:", v4, 0, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer notifyClients:withDictionary:](v13, "notifyClients:withDictionary:", 2, v16);

  }
  if (objc_msgSend(v4, "isPrimary"))
    -[HAPAccessoryServerIP _startReachability](v7, "_startReachability");

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPAccessoryServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPAccessoryServer delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)updateActiveDisconnectOnIdleTimeout:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HAPAccessoryServerIP_updateActiveDisconnectOnIdleTimeout___block_invoke;
  v6[3] = &unk_1E894D3B0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_handleConnectionIdleTimeout
{
  NSObject *v3;
  void *v4;
  HAPAccessoryServerIP *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HAPAccessoryServer shouldDisconnectOnIdle](self, "shouldDisconnectOnIdle"))
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, disconnecting...", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 29, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerIP disconnectWithError:](v5, "disconnectWithError:", v8);

  }
}

- (void)_kickConnectionIdleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Kicking connection idle timer", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPAccessoryServerIP connectionIdleTimer](v6, "connectionIdleTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kick");

  }
}

- (void)_startConnectionIdleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  HAPAccessoryServerIP *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP httpClient](self, "httpClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v8;
      v9 = "%{public}@Not starting connection idle timer --- no active connection";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v5);
    return;
  }
  if (-[HAPAccessoryServer isSessionRestoreActive](self, "isSessionRestoreActive"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v8;
      v9 = "%{public}@*** Session Restore is active, ignoring start connection idle timer request";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl(&dword_1CCE01000, v10, v11, v9, (uint8_t *)&v25, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (-[HAPAccessoryServer shouldDisconnectOnIdle](self, "shouldDisconnectOnIdle"))
  {
    -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_11:

      goto LABEL_13;
    }
    if (!self->_idleTimerActiveSessions)
    {
      v21 = objc_alloc(MEMORY[0x1E0D286C8]);
      -[HAPAccessoryServerIP disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout");
      v22 = (void *)objc_msgSend(v21, "initWithTimeInterval:options:", 0);
      -[HAPAccessoryServerIP setConnectionIdleTimer:](self, "setConnectionIdleTimer:", v22);

      -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegate:", self);

      -[HAPAccessoryServer clientQueue](self, "clientQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDelegateQueue:", v12);

      goto LABEL_11;
    }
  }
LABEL_13:
  -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP connectionIdleTimer](v15, "connectionIdleTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeInterval");
      v25 = 138543618;
      v26 = v17;
      v27 = 2048;
      v28 = v19;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting connection idle timer of: %03fs", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HAPAccessoryServerIP connectionIdleTimer](v15, "connectionIdleTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

  }
}

- (void)_suspendConnectionIdleTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP connectionIdleTimer](self, "connectionIdleTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerIP connectionIdleTimer](v6, "connectionIdleTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeInterval");
      v12 = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Suspending connection idle timer of: %0.3fs", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPAccessoryServerIP connectionIdleTimer](v6, "connectionIdleTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    -[HAPAccessoryServerIP setConnectionIdleTimer:](v6, "setConnectionIdleTimer:", 0);
  }
}

- (void)disconnectOnIdleUpdated
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HAPAccessoryServerIP_disconnectOnIdleUpdated__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_incrementPairVerifyFailureCount
{
  NSObject *v3;

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  ++self->_consecutivePairVerifyFailures;
  os_unfair_lock_unlock(&self->_lock);
  -[HAPAccessoryServer setReachable:](self, "setReachable:", 0);
  -[HAPAccessoryServerIP setCachedSocketInfo:](self, "setCachedSocketInfo:", 0);
}

- (unint64_t)consecutivePairVerifyFailureCount
{
  os_unfair_lock_s *p_lock;
  unint64_t consecutivePairVerifyFailures;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  consecutivePairVerifyFailures = self->_consecutivePairVerifyFailures;
  os_unfair_lock_unlock(p_lock);
  return consecutivePairVerifyFailures;
}

- (void)resetPairVerifyFailureCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_consecutivePairVerifyFailures = 0;
  os_unfair_lock_unlock(p_lock);
}

- (HMFTimer)reachabilityEventTimer
{
  return self->_reachabilityEventTimer;
}

- (void)setReachabilityEventTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityEventTimer, a3);
}

- (double)minimumReachabilityPingInterval
{
  return self->_minimumReachabilityPingInterval;
}

- (void)setMinimumReachabilityPingInterval:(double)a3
{
  self->_minimumReachabilityPingInterval = a3;
}

- (NSDate)reachabilityStartTime
{
  return self->_reachabilityStartTime;
}

- (void)setReachabilityStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityStartTime, a3);
}

- (HAPSocketInfo)cachedSocketInfo
{
  return self->_cachedSocketInfo;
}

- (HAPAccessoryServerBookkeeping)discoveryBookkeeping
{
  return self->_discoveryBookkeeping;
}

- (void)setDiscoveryBookkeeping:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryBookkeeping, a3);
}

- (unint64_t)consecutivePairVerifyFailures
{
  return self->_consecutivePairVerifyFailures;
}

- (void)setConsecutivePairVerifyFailures:(unint64_t)a3
{
  self->_consecutivePairVerifyFailures = a3;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (unint64_t)metricHAPIPInvalidationCount
{
  return self->_metricHAPIPInvalidationCount;
}

- (void)setMetricHAPIPInvalidationCount:(unint64_t)a3
{
  self->_metricHAPIPInvalidationCount = a3;
}

- (unint64_t)metricHAPIPHTTPEventsCount
{
  return self->_metricHAPIPHTTPEventsCount;
}

- (void)setMetricHAPIPHTTPEventsCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPEventsCount = a3;
}

- (unint64_t)metricHAPIPHTTPRequestsCount
{
  return self->_metricHAPIPHTTPRequestsCount;
}

- (void)setMetricHAPIPHTTPRequestsCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPRequestsCount = a3;
}

- (unint64_t)metricHAPIPHTTPResponsesCount
{
  return self->_metricHAPIPHTTPResponsesCount;
}

- (void)setMetricHAPIPHTTPResponsesCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPResponsesCount = a3;
}

- (BOOL)hasUpdatedBonjour
{
  return self->_hasUpdatedBonjour;
}

- (void)setHasUpdatedBonjour:(BOOL)a3
{
  self->_hasUpdatedBonjour = a3;
}

- (HAPAccessoryServerBrowserIP)browser
{
  return (HAPAccessoryServerBrowserIP *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (NSArray)ipServices
{
  return self->_ipServices;
}

- (void)setIpServices:(id)a3
{
  objc_storeStrong((id *)&self->_ipServices, a3);
}

- (NSMutableArray)queuedOperations
{
  return self->_queuedOperations;
}

- (void)setQueuedOperations:(id)a3
{
  objc_storeStrong((id *)&self->_queuedOperations, a3);
}

- (HAPAccessory)primaryAccessoryForServer
{
  return self->_primaryAccessoryForServer;
}

- (void)setPrimaryAccessoryForServer:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessoryForServer, a3);
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, a3);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (id)pairVerifyCompletionBlock
{
  return self->_pairVerifyCompletionBlock;
}

- (id)netServiceResolveCompletionBlock
{
  return self->_netServiceResolveCompletionBlock;
}

- (void)setNetServiceResolveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (BOOL)hasAttributeDatabase
{
  return self->_hasAttributeDatabase;
}

- (void)setHasAttributeDatabase:(BOOL)a3
{
  self->_hasAttributeDatabase = a3;
}

- (BOOL)econnresetRetryInProgress
{
  return self->_econnresetRetryInProgress;
}

- (void)setEconnresetRetryInProgress:(BOOL)a3
{
  self->_econnresetRetryInProgress = a3;
}

- (HMFBlockOperation)pairOperation
{
  return self->_pairOperation;
}

- (void)setPairOperation:(id)a3
{
  objc_storeStrong((id *)&self->_pairOperation, a3);
}

- (NSOperationQueue)clientOperationQueue
{
  return self->_clientOperationQueue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (HAPWACAccessoryClient)hapWACAccessoryClient
{
  return self->_hapWACAccessoryClient;
}

- (void)setHapWACAccessoryClient:(id)a3
{
  objc_storeStrong((id *)&self->_hapWACAccessoryClient, a3);
}

- (BOOL)isContinuingLegacyWACpairing
{
  return self->_continuingLegacyWACpairing;
}

- (void)setContinuingLegacyWACpairing:(BOOL)a3
{
  self->_continuingLegacyWACpairing = a3;
}

- (BOOL)isWacStarted
{
  return self->_wacStarted;
}

- (void)setWacStarted:(BOOL)a3
{
  self->_wacStarted = a3;
}

- (HMFTimer)bonjourEventTimer
{
  return self->_bonjourEventTimer;
}

- (void)setBonjourEventTimer:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourEventTimer, a3);
}

- (BOOL)hasStartedPairing
{
  return self->_hasStartedPairing;
}

- (void)setHasStartedPairing:(BOOL)a3
{
  self->_hasStartedPairing = a3;
}

- (HMFNetMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (BOOL)isPairingRequestPending
{
  return self->_pairingRequestPending;
}

- (void)setPairingRequestPending:(BOOL)a3
{
  self->_pairingRequestPending = a3;
}

- (BOOL)isTokenValidationPending
{
  return self->_tokenValidationPending;
}

- (void)setTokenValidationPending:(BOOL)a3
{
  self->_tokenValidationPending = a3;
}

- (BOOL)isHandlingInvalidSetupCode
{
  return self->_handlingInvalidSetupCode;
}

- (void)setHandlingInvalidSetupCode:(BOOL)a3
{
  self->_handlingInvalidSetupCode = a3;
}

- (int)cancelPairingErr
{
  return self->_cancelPairingErr;
}

- (void)setCancelPairingErr:(int)a3
{
  self->_cancelPairingErr = a3;
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

- (HAPAccessoryServerIPConnectionStatistics)ipConnectionStatistics
{
  return self->_ipConnectionStatistics;
}

- (void)setIpConnectionStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_ipConnectionStatistics, a3);
}

- (HAPHTTPClient)httpClient
{
  return self->_httpClient;
}

- (void)setHttpClient:(id)a3
{
  objc_storeStrong((id *)&self->_httpClient, a3);
}

- (HAPNameResolver)nameResolver
{
  return self->_nameResolver;
}

- (void)setNameResolver:(id)a3
{
  objc_storeStrong((id *)&self->_nameResolver, a3);
}

- (BOOL)unitTest_establishedSession
{
  return self->_unitTest_establishedSession;
}

- (void)setUnitTest_establishedSession:(BOOL)a3
{
  self->_unitTest_establishedSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameResolver, 0);
  objc_storeStrong((id *)&self->_httpClient, 0);
  objc_storeStrong((id *)&self->_ipConnectionStatistics, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourEventTimer, 0);
  objc_storeStrong((id *)&self->_hapWACAccessoryClient, 0);
  objc_storeStrong((id *)&self->_clientOperationQueue, 0);
  objc_storeStrong((id *)&self->_pairOperation, 0);
  objc_storeStrong(&self->_netServiceResolveCompletionBlock, 0);
  objc_storeStrong(&self->_pairVerifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryForServer, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_ipServices, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_discoveryBookkeeping, 0);
  objc_storeStrong((id *)&self->_cachedSocketInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_reachabilityStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityEventTimer, 0);
  objc_storeStrong((id *)&self->_bonjourDeviceInfo, 0);
  objc_storeStrong((id *)&self->_hapWACAccessory, 0);
}

uint64_t __47__HAPAccessoryServerIP_disconnectOnIdleUpdated__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldDisconnectOnIdle");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_startConnectionIdleTimer");
  else
    return objc_msgSend(v3, "_suspendConnectionIdleTimer");
}

void __60__HAPAccessoryServerIP_updateActiveDisconnectOnIdleTimeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDisconnectOnIdle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisconnectOnIdleTimeout:", *(double *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimer");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeInterval");
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "disconnectOnIdleTimeout");
      v8 = v7;

      if (v6 != v8)
      {
        v9 = (void *)MEMORY[0x1D17B7244]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "disconnectOnIdleTimeout");
          v22 = 138543618;
          v23 = v12;
          v24 = 2048;
          v25 = v13;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating active connection idle timer timeout to: %0.3fs", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "suspend");

        v15 = objc_alloc(MEMORY[0x1E0D286C8]);
        objc_msgSend(*(id *)(a1 + 32), "disconnectOnIdleTimeout");
        v16 = (void *)objc_msgSend(v15, "initWithTimeInterval:options:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setConnectionIdleTimer:", v16);

        v17 = *(void **)(a1 + 32);
        objc_msgSend(v17, "connectionIdleTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDelegate:", v17);

        objc_msgSend(*(id *)(a1 + 32), "clientQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDelegateQueue:", v19);

        objc_msgSend(*(id *)(a1 + 32), "connectionIdleTimer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "resume");

      }
    }
  }
}

uint64_t __37__HAPAccessoryServerIP_pollAccessory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pollAccessory");
}

void __44__HAPAccessoryServerIP__doPollForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "reachabilityPingEnabled");
    v17 = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Reachability poll complete error=%@ reachabilityPingEnabled %d", (uint8_t *)&v17, 0x1Cu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "reachabilityEventTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  objc_msgSend(*(id *)(a1 + 32), "_doReachabilityWithError:forAccessory:", v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 448);
  *(_QWORD *)(v15 + 448) = v14;

}

uint64_t __59__HAPAccessoryServerIP__indicateSessionActivityWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_kickConnectionIdleTimer");
}

uint64_t __32__HAPAccessoryServerIP_stopPing__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping IP reachability", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setReachabilityPingEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_stopReachability");
}

void __33__HAPAccessoryServerIP_startPing__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "reachabilityPingEnabled");
  v3 = (void *)MEMORY[0x1D17B7244]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting IP reachability", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_startReachability");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@Attempting to start ping on server that is not enabled", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    || (objc_msgSend(*(id *)(a1 + 32), "isWacComplete") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v16[0] = CFSTR("/");
    v16[1] = CFSTR("identify");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathWithComponents:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(*(id *)(a1 + 32), "_ensureHTTPClientSetUp");
    if ((_DWORD)v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        HMErrorFromOSStatus(v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      }
    }
    else
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      v8 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke_507;
      v13[3] = &unk_1E89492F8;
      objc_copyWeak(&v15, location);
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v8, "sendPOSTRequestToURL:request:serializationType:completionHandler:", v4, 0, 1, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(location);
    }
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v12;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Identify is not supported for WAC device", (uint8_t *)location, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

  }
}

void __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke_507(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v14;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Identify returned HTTP client error: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = WeakRetained;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)a4 == 204)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v20;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Identify succeeded", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v21 = 0;
    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Identify returned unexpected status code: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v21);

  }
}

void __71__HAPAccessoryServerIP_httpClient_willSendHTTPMessageWithHeaders_body___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerIP:willSendHTTPHeaders:httpBody:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __73__HAPAccessoryServerIP_httpClient_didReceiveHTTPMessageWithHeaders_body___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerIP:didReceiveHTTPHeaders:httpBody:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __118__HAPAccessoryServerIP__handleListPairingsResponseObject_type_httpStatus_httpError_completionQueue_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleListPairingsResponseObject:type:httpStatus:httpError:completionQueue:completionHandler:", a2, a3, a4, a5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74__HAPAccessoryServerIP_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_listPairingsWithCompletionQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_464(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "clientQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_465;
  v6[3] = &unk_1E8949438;
  objc_copyWeak(&v11, &location);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_removePairingWithIdentifier:publicKey:queue:completion:", v3, v4, v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_465(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id *v18;
  _QWORD *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to remove current controller pairing from accessory completed with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    objc_msgSend(v6, "_reset");
  objc_msgSend(v6, "setAuthenticated:", 0);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v25 = 0;
  objc_msgSend(v9, "removeAccessoryKeyForName:error:", v10, &v25);
  v11 = v25;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@After removing the accessory with 'Remove Pairing', we failed to remove accessory from the keychain with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(NSObject **)(a1 + 48);
    if (v16)
    {
      v17 = *(void **)(a1 + 56);
      if (v17)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_466;
        v23[3] = &unk_1E894D498;
        v18 = &v24;
        v24 = v17;
        v19 = v23;
LABEL_14:
        dispatch_async(v16, v19);

      }
    }
  }
  else
  {
    v16 = *(NSObject **)(a1 + 48);
    if (v16)
    {
      v20 = *(void **)(a1 + 56);
      if (v20)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_467;
        block[3] = &unk_1E894D498;
        v18 = &v22;
        v22 = v20;
        v19 = block;
        goto LABEL_14;
      }
    }
  }

}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_466(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_467(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __126__HAPAccessoryServerIP__handlePairingsResponseObject_type_httpStatus_httpError_removeRequest_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__HAPAccessoryServerIP__sendRemovePairingWithData_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePairingsResponseObject:type:httpStatus:httpError:removeRequest:completionQueue:completionBlock:", a2, a3, a4, a5, 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke(id *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a1 + 7;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LODWORD(v6) = objc_msgSend(WeakRetained, "shouldRetryPVDueToAuthenticationError:", v4);
  if ((_DWORD)v6)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_2;
    v8[3] = &unk_1E894D6D0;
    v8[4] = WeakRetained;
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    dispatch_async(v7, v8);

  }
  else
  {
    objc_msgSend(WeakRetained, "_sendRemovePairingWithData:queue:completion:", a1[4], a1[5], a1[6]);
  }

}

uint64_t __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_establishSecureSessionAndRemovePairing:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __80__HAPAccessoryServerIP__removePairingWithIdentifier_publicKey_queue_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Remove pairing failed."), CFSTR("Failed to create remove pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__HAPAccessoryServerIP_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removePairingWithIdentifier:publicKey:queue:completion:", v5, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Add pairing failed."), CFSTR("Failed to create add pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePairingsResponseObject:type:httpStatus:httpError:removeRequest:completionQueue:completionBlock:", a2, a3, a4, a5, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __69__HAPAccessoryServerIP_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "permissions") & 1;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startAddPairingWithIdentifier:publicKey:admin:queue:completion:", v6, v5, v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "code");
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Auth Complete with status: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = *(id *)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_433;
  v21[3] = &unk_1E894E0F8;
  v21[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  v21[5] = v10;
  __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_433((uint64_t)v21);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_2;
    v19[3] = &unk_1E894E0F8;
    v14 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v14;
    dispatch_async(v13, v19);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Does not implement accessoryServer:didFinishAuth:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_433(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didFinishAuth:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:confirmUUID:token:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", v11, v12);

  }
}

void __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:confirmUUID:token:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authenticateUUID:token1:token2:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", v11, v12);

  }
}

void __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:authenticateUUID:token:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "isPreSoftAuthWacStarted"))
  {
    objc_initWeak(location, a1[4]);
    objc_msgSend(a1[4], "_notifyDelegateOfPairingProgress:", 3);
    objc_msgSend(a1[4], "hapWACAccessoryClient");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_2;
    v17[3] = &unk_1E8949C28;
    objc_copyWeak(&v21, location);
    v18 = a1[5];
    v19 = a1[6];
    v20 = a1[7];
    v3 = (id)objc_msgSend(v2, "restoreNetworkWithCompletion:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(a1[4], "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(a1[4], "_notifyDelegateOfPairingProgress:", 5);
      objc_msgSend(a1[4], "delegateQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_428;
      block[3] = &unk_1E894E120;
      block[4] = a1[4];
      v15 = a1[5];
      v16 = a1[6];
      dispatch_async(v6, block);

    }
    else
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = a1[4];
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v10;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", (uint8_t *)location, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v11 = a1[4];
      v12 = a1[7];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "authSession:authComplete:", v12, v13);

    }
  }
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_3;
  block[3] = &unk_1E894B6E8;
  v8 = v3;
  v9 = WeakRetained;
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  v6 = v3;
  dispatch_async(v5, block);

}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_428(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "authenticatedProtocolInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServer:validateUUID:token:model:", v2, v3, v4, v6);

}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to restore back to infrastructure network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *(_QWORD *)(a1 + 32);
    v31 = *MEMORY[0x1E0CB3388];
    v32 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "authSession:authComplete:", *(_QWORD *)(a1 + 64), v9);
LABEL_11:

    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPairingProgress:", 4);
  objc_msgSend(*(id *)(a1 + 40), "networkMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isReachable");

  v12 = *(void **)(a1 + 40);
  if (!v11)
  {
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v12, "pairingActivity");

    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Network is not reachable: Waiting...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(*(id *)(a1 + 40), "setTokenValidationPending:", 1);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPairingProgress:", 5);
    objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_4;
    block[3] = &unk_1E894E120;
    v16 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v29 = v16;
    v30 = *(id *)(a1 + 56);
    dispatch_async(v15, block);

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v24;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = *(void **)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "authSession:authComplete:", v26, v27);

  }
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "authenticatedProtocolInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServer:validateUUID:token:model:", v2, v3, v4, v6);

}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2;
  v6 = &unk_1E8949320;
  objc_copyWeak(&v7, &location);
  v2 = (void *)MEMORY[0x1D17B7400](&v3);
  objc_msgSend(*(id *)(a1 + 32), "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/secure-message"), *(_QWORD *)(a1 + 40), 3, v2, v3, v4, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  _QWORD v24[6];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (!v8 || v9)
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = v11;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v17 = CFSTR("Invalid");
      else
        v17 = off_1E894BB00[a3 - 1];
      v18 = v17;
      *(_DWORD *)buf = 138544130;
      v26 = v16;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed Auth request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_419;
    v24[3] = &unk_1E894E0F8;
    v24[4] = v14;
    v21 = v19;
    v24[5] = v21;
    __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_419((uint64_t)v24);
    if (objc_msgSend(v14, "_delegateRespondsToSelector:", sel_accessoryServer_didFinishAuth_))
    {
      objc_msgSend(v14, "delegateQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2_423;
      block[3] = &unk_1E894DD08;
      block[4] = v14;
      dispatch_async(v22, block);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "authSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleAuthExchangeData:withHeader:", v8, 1);

  }
}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_419(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2_423(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryServer:didFinishAuth:", v2, v3);

}

uint64_t __55__HAPAccessoryServerIP_tearDownSessionOnAuthCompletion__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSession");

  return objc_msgSend(*(id *)(a1 + 32), "_tearDownSession");
}

void __39__HAPAccessoryServerIP_provisionToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendTokenUpdateRequest:", *(_QWORD *)(a1 + 40));

}

void __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[6];

  if (objc_msgSend(*(id *)(a1 + 32), "authMethod") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "authSession");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueAuthAfterValidation:", *(unsigned __int8 *)(a1 + 40));

    return;
  }
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_9;
  if (objc_msgSend(*(id *)(a1 + 32), "authMethod") == 4 || objc_msgSend(*(id *)(a1 + 32), "authMethod") == 6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterMFiCertValidation");
    return;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterAuthPromptWithRetry:", 1);
  }
  else
  {
LABEL_9:
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 16, 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2;
    v5[3] = &unk_1E894E0F8;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    v4 = v2;
    __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2((uint64_t)v5);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfAddAccessoryFailureWithError:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_tearDownSessionAndStartReachabilityWithError:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_processQueuedOperationsWithError:", v4);

  }
}

void __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __45__HAPAccessoryServerIP_authenticateAccessory__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleAuthExchangeData:withHeader:", 0, 1);

}

void __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "begin");
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_validatePairingAuthMethod:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    __HMFActivityScopeLeave();

  }
}

void __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke_407(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  __CFString *v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void (*v31)(void);
  __CFString *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (v9 || !v8 || !WeakRetained)
  {
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v29 = CFSTR("Invalid");
      else
        v29 = off_1E894BB00[a3 - 1];
      v30 = v29;
      *(_DWORD *)buf = 138544130;
      v35 = v28;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v30;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed sending auth Request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 14, CFSTR("Unknown error retrieving auth status"), 0, 0, v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v12 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Handling auth response")));
  v13 = v11;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v15;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Received auth response: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = *(unsigned __int8 *)(a1 + 64);
  v33 = 0;
  v17 = objc_msgSend(v13, "_validateAuthChallengeResponse:expectedTID:error:", v8, v16, &v33);
  v18 = v33;
  if ((v17 & 1) == 0)
  {
LABEL_16:
    v31 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_20;
  }
  v19 = (void *)MEMORY[0x1D17B7244]();
  v20 = v13;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 56);
    if (v23 > 6)
      v24 = CFSTR("HAPAuthMethodUnknown");
    else
      v24 = off_1E8948F80[v23];
    v32 = v24;
    *(_DWORD *)buf = 138543618;
    v35 = v22;
    v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Auth challenge completed successfully with auth method: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  v31 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_20:
  v31();

}

uint64_t __50__HAPAccessoryServerIP_validatePairingAuthMethod___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validatePairingAuthMethod:activity:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  _QWORD v14[4];
  __int128 v15;
  uint64_t v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Getting Acc Info", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke_399;
  v14[3] = &unk_1E8949398;
  objc_copyWeak(&v17, &location);
  v16 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 40);
  v6 = (id)v13;
  v15 = v13;
  v7 = (void *)MEMORY[0x1D17B7400](v14);
  +[HAPProtocolMessages constructInfoRequest:outTID:](HAPProtocolMessages, "constructInfoRequest:outTID:", &unk_1E8989368, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending Acc Info Request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*(id *)(a1 + 32), "sendPOSTRequestToURL:request:serializationType:completionHandler:", CFSTR("/secure-message"), v8, 3, v7);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke_399(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8 || v9)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v15 = CFSTR("Invalid");
      else
        v15 = off_1E894BB00[a3 - 1];
      v16 = v15;
      v29 = 138544130;
      v30 = v14;
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v16;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed sending Acc Info Request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v29, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 8, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  v20 = (void *)MEMORY[0x1D17B7244]();
  v21 = WeakRetained;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v23;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Received Acc Info response: %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  +[HAPProtocolMessages parseInfoResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseInfoResponse:expectedTID:withHeader:", v8, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAuthenticatedProtocolInfo:", v24);

  objc_msgSend(v21, "authenticatedProtocolInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v21, "_validateProtocolInfo:", v25);

  v27 = *(_QWORD *)(a1 + 32);
  if (v26)
  {
    (*(void (**)(_QWORD, _QWORD))(v27 + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 7, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

  }
}

void __52__HAPAccessoryServerIP_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "networkMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Network is unavailable, suspending all streams", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "networkMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Network is available, resuming all streams", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (objc_msgSend(*(id *)(a1 + 40), "isTokenValidationPending"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setTokenValidationPending:", 0);
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "authSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v35 = 0;
        v11 = objc_msgSend(v10, "getToken:uuid:", &v35, &v34);
        v12 = v35;
        v13 = v34;

        if (v11)
        {
          v14 = *(void **)(a1 + 40);
          v15 = v13;
          objc_msgSend(v14, "pairingActivity");

          objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_2;
          block[3] = &unk_1E894E120;
          block[4] = *(_QWORD *)(a1 + 40);
          v32 = v15;
          v12 = v12;
          v33 = v12;
          v13 = v15;
          dispatch_async(v16, block);

        }
        else
        {
          v22 = (void *)MEMORY[0x1D17B7244]();
          v23 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v39 = v25;
            _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get validation info", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v22);
          v36 = *MEMORY[0x1E0CB3388];
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = *(void **)(a1 + 40);
          objc_msgSend(v28, "authSession");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "authSession:authComplete:", v29, v30);

        }
      }
      else
      {
        v17 = (void *)MEMORY[0x1D17B7244]();
        v18 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v20;
          _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        v21 = *(void **)(a1 + 40);
        objc_msgSend(v21, "authSession");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "authSession:authComplete:", v12, v13);
      }

    }
  }
}

void __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "authenticatedProtocolInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServer:validateUUID:token:model:", v2, v3, v4, v6);

}

void __37__HAPAccessoryServerIP_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[7];

  v4 = a2;
  HAPPairingStateFromData(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2;
  v5[3] = &unk_1E894E120;
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v3;
  v5[6] = v4;
  __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2((uint64_t)v5);

}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    objc_msgSend(WeakRetained, "_handlePairVerifyCompletionWithData:", v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v11;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v16 = CFSTR("Invalid");
      else
        v16 = off_1E894BB00[a3 - 1];
      v17 = v16;
      *(_DWORD *)buf = 138544130;
      v22 = v15;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send Pair Verify request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v13, "_tearDownSessionAndStartReachabilityWithError:", v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "useHH2"))
    {
      v20 = v18;
      objc_msgSend(v13, "_handleSecureSessionClosingWithError:status:data:", &v20, 4294960596, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v19 = v20;

      v18 = v19;
    }
    objc_msgSend(v13, "_processQueuedOperationsWithError:", v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v13, "invokePairVerifyCompletionBlock:", v18);

  }
}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 48), "domain");

    objc_msgSend(*(id *)(a1 + 48), "code");
    v2 = v3;
  }

}

void __50__HAPAccessoryServerIP__pairVerifyStartWithRetry___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = (void *)MEMORY[0x1D17B7244]();
  v12 = WeakRetained;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v14;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Pair-verify complete", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (v8 && a3 == 2 && !v9)
  {
    objc_msgSend(v12, "_handlePairVerifyCompletionWithData:", v8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = v12;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v19 = CFSTR("Invalid");
      else
        v19 = off_1E894BB00[a3 - 1];
      v20 = v19;
      v27 = 138544130;
      v28 = v18;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v20;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to send initial Pair Verify request, received response object: %@, MIME type: %@, error: %{public}@", (uint8_t *)&v27, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v16, "_tearDownSessionAndStartReachabilityWithError:", v9);
    if (*(_BYTE *)(a1 + 40) && (objc_msgSend(v16, "invalidated") & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1D17B7244]();
      v23 = v16;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v25;
        _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@Retrying PV on first failure", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v23, "_pairVerifyStartWithRetry:", 0);
    }
    else
    {
      if (v9)
      {
        v21 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 53);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = v21;
      objc_msgSend(v16, "_processQueuedOperationsWithError:", v21);
      objc_msgSend(v16, "_notifyDelegatesPairingStopped:", v26);
      objc_msgSend(v16, "invokePairVerifyCompletionBlock:", v26);

    }
  }

}

void __46__HAPAccessoryServerIP__pairSetupTryPassword___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    objc_msgSend(WeakRetained, "_handlePairSetupCompletionWithData:", v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v11;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v16 = CFSTR("Invalid");
      else
        v16 = off_1E894BB00[a3 - 1];
      v17 = v16;
      v20 = 138544130;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send request to try password during Pair Setup, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (v9)
    {
      v18 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 66);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    objc_msgSend(v13, "_tearDownSessionAndStartReachabilityWithError:", v18);
    objc_msgSend(v13, "_processQueuedOperationsWithError:", v19);
    objc_msgSend(v13, "_notifyDelegatesPairingStopped:", v19);

  }
}

uint64_t __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePairSetupCompletionWithData:", 0);
}

void __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:", *(_QWORD *)(a1 + 32), *(int *)(a1 + 40));

}

void __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:promptUserForPasswordWithType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[7];

  v4 = a2;
  HAPPairingStateFromData(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2;
  v5[3] = &unk_1E894E120;
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v3;
  v5[6] = v4;
  __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2((uint64_t)v5);

}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    objc_msgSend(WeakRetained, "_handlePairSetupCompletionWithData:", v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v11;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v16 = CFSTR("Invalid");
      else
        v16 = off_1E894BB00[a3 - 1];
      v17 = v16;
      v20 = 138544130;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send Pair Setup request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (v9)
    {
      v18 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 66);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v13, "_tearDownSessionAndStartReachabilityWithError:", v19);
    objc_msgSend(v13, "_processQueuedOperationsWithError:", v19);
    objc_msgSend(v13, "_notifyDelegatesPairingStopped:", v19);

  }
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_370(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[7];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_371;
  v10[3] = &unk_1E894B6C0;
  v10[4] = *(_QWORD *)(a1 + 40);
  v10[6] = v6;
  v9 = v3;
  v10[5] = v9;
  __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_371((uint64_t)v10);
  v7 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v7, "authSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authSession:authComplete:", v8, v9);

  }
  else
  {
    objc_msgSend(v7, "authenticateAccessory");
  }

}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_371(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v4;
  }

}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 48), "domain");

    objc_msgSend(*(id *)(a1 + 48), "code");
    v2 = v3;
  }

}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[6];

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2;
  v4[3] = &unk_1E894E0F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2((uint64_t)v4);

}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_363(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    objc_msgSend(WeakRetained, "_handlePairSetupCompletionWithData:", v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = v11;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(a3 - 1) > 3)
        v16 = CFSTR("Invalid");
      else
        v16 = off_1E894BB00[a3 - 1];
      v17 = v16;
      v25 = 138544130;
      v26 = v15;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send initial Pair Setup request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    if (v9)
    {
      v18 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 53);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    v20 = objc_msgSend(v13, "_tearDownSessionAndStartReachabilityWithError:", v18);
    if (*(_BYTE *)(a1 + 48))
    {
      v21 = (void *)MEMORY[0x1D17B7244](v20);
      v22 = v13;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Retrying PS on first failure", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v22, "_continuePairingAfterAuthPromptWithRetry:", 0);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(v13, "_notifyDelegatesPairingStopped:", v19);
      objc_msgSend(v13, "_processQueuedOperationsWithError:", v19);
    }

  }
}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(*(id *)(a1 + 32), "isWacAccessory");
    v3 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 32), "isWacLegacy");
    v4 = (id)HMFBooleanToString();
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "pairSetupType"));
    objc_msgSend(*(id *)(a1 + 32), "authMethod");
    v6 = (id)HMFBooleanToString();
    v2 = v7;
  }

}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_352(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_356(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);

}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_357(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40), 0);

}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __64__HAPAccessoryServerIP_httpClientDidCloseConnectionDueToServer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didDisconnectWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%{public}@pairVerifyCompletionBlock is already set!", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke_332(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "metric_pairVerifyReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      mach_absolute_time();
      objc_msgSend(v4, "setMetric_pairVerifyDurationInMS:", UpTicksToMilliseconds() - *(_QWORD *)(a1 + 48));
      objc_msgSend(v4, "submitPairVerifyMetricWithError:", v6);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __56__HAPAccessoryServerIP_invokePairVerifyCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokePairVerifyCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__HAPAccessoryServerIP_isSessionEstablished__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isSessionEstablished");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __72__HAPAccessoryServerIP___registerForInternalCharacteristicNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      v12 = "%{public}@Failed to enable notifications for accessory with error: %@";
      v13 = v9;
      v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, v14);

    }
  }
  else if (v10)
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v11;
    v12 = "%{public}@Successfully enabled notifications for accessory";
    v13 = v9;
    v14 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __45__HAPAccessoryServerIP__getAttributeDatabase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v8 && a3 == 1 && !v9)
    {
      objc_msgSend(WeakRetained, "_parseAttributeDatabase:transaction:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = v11;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(a3 - 1) > 3)
          v16 = CFSTR("Invalid");
        else
          v16 = off_1E894BB00[a3 - 1];
        v17 = v16;
        v22 = 138544130;
        v23 = v15;
        v24 = 2114;
        v25 = v8;
        v26 = 2114;
        v27 = v17;
        v28 = 2114;
        v29 = v9;
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get attribute database, received response object: %{public}@, MIME type: %{public}@, error: %{public}@", (uint8_t *)&v22, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      if (v9)
      {
        v18 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 66);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;
      objc_msgSend(v13, "_tearDownSessionAndStartReachabilityWithError:", v18);
      objc_msgSend(v13, "_notifyDelegateOfDiscoveryCompletionWithError:", v19);
      objc_msgSend(v13, "_processQueuedOperationsWithError:", v19);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = 0;

    }
  }

}

void __50__HAPAccessoryServerIP__parseTXTRecordDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryServer:didUpdateWakeNumber:", v2, v3);

}

void __51__HAPAccessoryServerIP_httpClient_didReceiveEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryServer:didUpdateValueForCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __126__HAPAccessoryServerIP__handleEventResponseObject_type_httpStatus_error_characteristics_requestedEventState_completion_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_256(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEventResponseObject:type:httpStatus:error:characteristics:requestedEventState:completion:queue:", a2, a3, a4, a5, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __84__HAPAccessoryServerIP_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableEvents:forCharacteristics:withCompletionHandler:queue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __69__HAPAccessoryServerIP__handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v2, v3, *(_QWORD *)(a1 + 48), 0);

}

uint64_t __68__HAPAccessoryServerIP_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdatesForCharacteristics:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_serializeCharacteristicWriteRequestTuples:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  __int128 v88;
  _QWORD *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  void *v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v98 = a1;
  if (!a1)
  {
    v86 = 0;
    goto LABEL_56;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v6;
  v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (!v96)
  {
    v36 = 0;
    goto LABEL_50;
  }
  v95 = *(_QWORD *)v102;
  *(_QWORD *)&v7 = 138543362;
  v88 = v7;
  v89 = a3;
  v90 = v6;
  do
  {
    v13 = 0;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    v17 = v12;
    do
    {
      if (*(_QWORD *)v102 != v95)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v13);
      objc_msgSend(v18, "value", v88);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "characteristic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "instanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v21 = v9 == 0;
      else
        v21 = 1;
      if (v21)
      {
        v69 = (void *)MEMORY[0x1D17B7244]();
        v70 = v98;
        HMFGetOSLogHandle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v107 = v72;
          v108 = 2112;
          v109 = (uint64_t)v12;
          v110 = 2112;
          v111 = (uint64_t)v10;
          v112 = 2112;
          v113 = v9;
          _os_log_impl(&dword_1CCE01000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize characteristic write requests because the tuple contained a value of '%@' for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v69);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
        v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
        v8 = v14;
LABEL_49:
        a3 = v89;
        v6 = v90;
        goto LABEL_50;
      }
      v99 = v12;
      if (!objc_msgSend(v10, "shouldValidateValueAfterReading"))
      {
        v24 = 12;
LABEL_18:
        +[HAPJSONValueTransformer defaultJSONValueTransformer](HAPJSONValueTransformer, "defaultJSONValueTransformer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = 0;
        objc_msgSend(v34, "transformedValue:format:error:", v12, v24, &v100);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v100;

        v11 = (void *)v35;
        if (v36)
          goto LABEL_42;
        goto LABEL_19;
      }
      objc_msgSend(v10, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "format");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = HAPCharacteristicFormatFromString(v23);

      if (v24)
        goto LABEL_18;
      v25 = (void *)MEMORY[0x1E0CB36D8];
      v105 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isValidJSONObject:", v26);

      v28 = (void *)MEMORY[0x1D17B7244]();
      v29 = v98;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (v27)
      {
        if (v31)
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v88;
          v107 = v32;
          _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        v12 = v99;
        v33 = v99;

        v11 = v33;
      }
      else
      {
        if (v31)
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v88;
          v107 = v67;
          _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type and the characteristic value is of a type that cannot be serialized.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 43);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v99;
        if (v36)
        {
LABEL_42:
          v73 = (void *)MEMORY[0x1D17B7244]();
          v74 = v98;
          HMFGetOSLogHandle();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v76 = v9;
            v77 = v10;
            v78 = v11;
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v107 = v79;
            v108 = 2112;
            v109 = (uint64_t)v12;
            v110 = 2112;
            v111 = (uint64_t)v36;
            _os_log_impl(&dword_1CCE01000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform characteristic value '%@' with error: %@", buf, 0x20u);

            v11 = v78;
            v10 = v77;
            v9 = v76;
          }

          objc_autoreleasePoolPop(v73);
          goto LABEL_45;
        }
      }
LABEL_19:
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("aid"));
      objc_msgSend(v10, "instanceID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("iid"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("value"));
      if (objc_msgSend(v18, "includeResponseValue"))
      {
        objc_msgSend(v18, "characteristic");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "properties");

        if ((v39 & 0x80) == 0)
        {
          v80 = (void *)MEMORY[0x1D17B7244]();
          v81 = v98;
          HMFGetOSLogHandle();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v83 = v11;
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v107 = v84;
            v108 = 2112;
            v109 = (uint64_t)v10;
            v110 = 2112;
            v111 = (uint64_t)v9;
            _os_log_impl(&dword_1CCE01000, v82, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize characteristic write requests because the tuple requires a write response value but the characteristic '%@' on accessory with instance ID '%@' does not support it", buf, 0x20u);

            v11 = v83;
          }

          objc_autoreleasePoolPop(v80);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 3);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_49;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("r"));
      }
      objc_msgSend(v18, "authorizationData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      if (v41)
      {
        v42 = (void *)MEMORY[0x1D17B7244]();
        v43 = v98;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v92 = v9;
          v45 = v10;
          v46 = v11;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "authorizationData");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "length");
          *(_DWORD *)buf = 138543618;
          v107 = v47;
          v108 = 2048;
          v109 = v49;
          _os_log_impl(&dword_1CCE01000, v44, OS_LOG_TYPE_INFO, "%{public}@Appending authorization data to characteristic write requests with length: %tu", buf, 0x16u);

          v11 = v46;
          v10 = v45;
          v9 = v92;
        }

        objc_autoreleasePoolPop(v42);
        objc_msgSend(v18, "authorizationData");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "base64EncodedStringWithOptions:", 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("authData"));

        v12 = v99;
      }
      objc_msgSend(v18, "contextData");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "length");

      if (v53)
      {
        v54 = (void *)MEMORY[0x1D17B7244]();
        v55 = v98;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v91 = v54;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "contextData");
          v93 = v11;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "contextData");
          v59 = v9;
          v60 = v10;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "length");
          *(_DWORD *)buf = 138543874;
          v107 = v57;
          v108 = 2112;
          v109 = (uint64_t)v58;
          v110 = 2048;
          v111 = v62;
          _os_log_impl(&dword_1CCE01000, v56, OS_LOG_TYPE_INFO, "%{public}@Appending context data %@ to characteristic write requests with length: %tu", buf, 0x20u);

          v10 = v60;
          v9 = v59;

          v11 = v93;
          v54 = v91;
        }

        objc_autoreleasePoolPop(v54);
        objc_msgSend(v18, "contextData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "base64EncodedStringWithOptions:", 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v64, CFSTR("ctxData"));

        v12 = v99;
      }
      objc_msgSend(v97, "addObject:", v8);
      ++v13;
      v14 = v8;
      v15 = v9;
      v16 = v10;
      v65 = v9;
      v66 = v10;
      v17 = v12;
    }
    while (v96 != v13);
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    v36 = 0;
    a3 = v89;
    v6 = v90;
    v10 = v66;
    v9 = v65;
    v96 = v68;
  }
  while (v68);
LABEL_50:

  if (a3)
    *a3 = objc_retainAutorelease(v36);
  if (v36)
    v85 = 0;
  else
    v85 = v97;
  v86 = v85;

LABEL_56:
  return v86;
}

uint64_t __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17[2];

  v9 = a2;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v12 = a1[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_4;
  v13[3] = &unk_1E8949140;
  objc_copyWeak(v17, a1 + 7);
  v14 = a1[4];
  v17[1] = a1[8];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(WeakRetained, "_handleWriteResponseObject:type:httpStatus:error:requestTuples:completion:", v9, a3, a4, v10, v12, v13);

  objc_destroyWeak(v17);
}

void __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleWriteECONNResetError:writeRequests:responses:timeout:queue:completionHandler:", v6, *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, void *a5)
{
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];

  v15 = a2;
  v14 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = objc_loadWeakRetained((id *)(a1 + 72));
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = *(double *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3;
  v18[3] = &unk_1E8949140;
  objc_copyWeak(v22, (id *)(a1 + 64));
  v19 = *(id *)(a1 + 40);
  v22[1] = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "_handlePrepareWriteResponseObject:type:prepareIdentifier:httpStatus:error:requestTuples:timeout:queue:originalCompletion:completion:", v15, a3, v10, a4, v14, v9, v11, v13, v12, v18);
  objc_msgSend(v8, "finish");

  objc_destroyWeak(v22);
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    if (v3)
    {
      objc_msgSend(v3, "clientQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_206;
      block[3] = &unk_1E894D9E8;
      block[4] = v3;
      v10 = a1[4];
      v11 = a1[5];
      dispatch_async(v4, block);

    }
    else
    {
      v5 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to timed write values because IP Accessory Server has been deallocated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v8);

    }
  }

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2_207(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3_208;
      v6[3] = &unk_1E894D5E0;
      v5 = *(NSObject **)(a1 + 32);
      v8 = *(id *)(a1 + 40);
      v7 = WeakRetained;
      dispatch_async(v5, v6);

    }
  }

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3_208(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_206(uint64_t a1)
{
  id v2;

  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("prepare"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sendPUTRequestToURL:request:serializationType:timeout:completionHandler:", v2, *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), 5.0);

}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleWriteECONNResetError:writeRequests:responses:timeout:queue:completionHandler:", v6, *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

uint64_t __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17[2];

  v9 = a2;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v12 = a1[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3;
  v13[3] = &unk_1E8949140;
  objc_copyWeak(v17, a1 + 7);
  v14 = a1[4];
  v17[1] = a1[8];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(WeakRetained, "_handleWriteResponseObject:type:httpStatus:error:requestTuples:completion:", v9, a3, a4, v10, v12, v13);

  objc_destroyWeak(v17);
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v4 = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "clientQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_198;
      block[3] = &unk_1E89491B8;
      objc_copyWeak(v17, v2);
      v12 = a1[4];
      v6 = a1[5];
      v17[1] = a1[10];
      v13 = v6;
      v14 = v4;
      v15 = a1[6];
      v16 = a1[7];
      dispatch_async(v5, block);

      objc_destroyWeak(v17);
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v9;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to write values because IP Accessory Server has been deallocated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v10);

    }
  }

}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2_204(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3_205;
      v6[3] = &unk_1E894D5E0;
      v5 = *(NSObject **)(a1 + 32);
      v8 = *(id *)(a1 + 40);
      v7 = WeakRetained;
      dispatch_async(v5, v6);

    }
  }

}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3_205(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_198(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("characteristics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 40);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "characteristic", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "instanceID");

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = *(void **)(a1 + 32);
  }
  else
  {
    v10 = 0;
  }
  if (*(double *)(a1 + 80) <= 0.0)
    v11 = 10.0;
  else
    v11 = *(double *)(a1 + 80);
  objc_msgSend(v10, "markWithReason:", CFSTR("Writing"), (_QWORD)v12);
  objc_msgSend(*(id *)(a1 + 48), "sendPUTRequestToURL:request:serializationType:timeout:completionHandler:", v3, *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 64), v11);
  objc_msgSend(WeakRetained, "finish");

}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleWriteECONNResetError:writeRequests:responses:timeout:queue:completionHandler:", v6, *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

void __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_insertWriteCharacteristicValues:timeout:queue:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEstablishingSecureConnection") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Already establishing secure session - not attempting a re-establishment", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setEconnresetRetryInProgress:", 1));
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to re-establish secure session for write on ECONNRESET", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(*(id *)(a1 + 32), "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.write.retry"));
  }
}

uint64_t __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke_197(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  id obj;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
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
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v1 = a1;
  v38 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1D17B7244]();
        v8 = *(id *)(v1 + 40);
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "value");
          v21 = v7;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "characteristic");
          v12 = v4;
          v13 = v1;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "contextData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v30 = v10;
          v31 = 2112;
          v32 = v11;
          v33 = 2114;
          v34 = v14;
          v35 = 2112;
          v36 = v15;
          _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Writing value '%@' to characteristic '%{public}@' with contextData '%@'", buf, 0x2Au);

          v1 = v13;
          v4 = v12;

          v7 = v21;
        }

        objc_autoreleasePoolPop(v7);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v3);
  }

  v17 = *(_QWORD *)(v1 + 32);
  v16 = *(void **)(v1 + 40);
  v18 = *(double *)(v1 + 72);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_188;
  v22[3] = &unk_1E894D048;
  v19 = *(_QWORD *)(v1 + 48);
  v23 = *(id *)(v1 + 56);
  v24 = *(id *)(v1 + 64);
  objc_msgSend(v16, "_writeCharacteristicValues:timeout:queue:completionHandler:", v17, v19, v22, v18);

}

void __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling completion handler"));
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_161(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17[2];

  v9 = a2;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v12 = a1[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3;
  v13[3] = &unk_1E8949140;
  objc_copyWeak(v17, a1 + 7);
  v14 = a1[4];
  v17[1] = a1[8];
  v15 = a1[5];
  v16 = a1[6];
  objc_msgSend(WeakRetained, "_handleReadResponseObject:type:httpStatus:error:characteristics:completion:", v9, a3, a4, v10, v12, v13);

  objc_destroyWeak(v17);
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  NSObject *v42;
  id v43;
  void *context;
  id v45;
  void *v46;
  id *from;
  id *v48;
  uint64_t v49;
  void *v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t v66[4];
  void *v67;
  __int16 v68;
  void *v69;
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    if (v4)
    {
      from = v2;
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("characteristics"));
      v48 = a1;
      v49 = objc_claimAutoreleasedReturnValue();
      v5 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v62;
        v45 = WeakRetained;
        v46 = v4;
LABEL_6:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v62 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v11);
          objc_msgSend(v12, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accessory");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "instanceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            break;
          if (objc_msgSend(v50, "containsObject:", v12))
          {
            context = (void *)MEMORY[0x1D17B7244]();
            v4 = v46;
            v34 = v46;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v66 = 138543618;
              v67 = v35;
              v68 = 2112;
              v69 = v12;
              _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@Refusing to create a query string because the same characteristic has been requested twice: %@", v66, 0x16u);

            }
            v33 = 58;
LABEL_23:
            WeakRetained = v45;
            v26 = v48;
            v25 = (void *)v49;

            objc_autoreleasePoolPop(context);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", v33);
            v24 = (id)objc_claimAutoreleasedReturnValue();

            v23 = 0;
            v22 = v7;
            goto LABEL_24;
          }
          objc_msgSend(v50, "addObject:", v12);
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v15, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "instanceID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v19 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@%@"), v17, CFSTR("."), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v19;
          objc_msgSend(v19, "addObject:", v21);

          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
            WeakRetained = v45;
            v4 = v46;
            if (v9)
              goto LABEL_6;
            goto LABEL_13;
          }
        }
        context = (void *)MEMORY[0x1D17B7244]();
        v4 = v46;
        v30 = v46;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v66 = 138543618;
          v67 = v32;
          v68 = 2112;
          v69 = v12;
          _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create a query string for characteristic %@ because the accessory instance ID was nil.", v66, 0x16u);

        }
        v15 = 0;
        v33 = 20;
        goto LABEL_23;
      }
LABEL_13:

      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("id="), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v26 = v48;
      v25 = (void *)v49;
LABEL_24:

      v36 = v24;
      if (v23)
      {
        if (v26[5])
        {
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v37 = v26[4];
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v58 != v40)
                  objc_enumerationMutation(v37);
                objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "instanceID");

              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            }
            while (v39);
          }

        }
        objc_msgSend(v4, "clientQueue");
        v42 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_168;
        block[3] = &unk_1E894B460;
        objc_copyWeak(v56, from);
        v52 = v25;
        v43 = v23;
        v56[1] = v26[9];
        v53 = v43;
        v54 = v4;
        v55 = v26[6];
        dispatch_async(v42, block);

        objc_destroyWeak(v56);
      }
      else
      {
        objc_msgSend(WeakRetained, "cancelWithError:", v36);
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v71 = v29;
        _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to read values because IP Accessory Server has been deallocated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v25);
    }

  }
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2_173(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3_174;
      v6[3] = &unk_1E894D5E0;
      v5 = *(NSObject **)(a1 + 32);
      v8 = *(id *)(a1 + 40);
      v7 = WeakRetained;
      dispatch_async(v5, v6);

    }
  }

}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3_174(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_168(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?%@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(double *)(a1 + 72) <= 0.0)
    v3 = 10.0;
  else
    v3 = *(double *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markWithReason:", CFSTR("Reading"));

  objc_msgSend(*(id *)(a1 + 48), "sendGETRequestToURL:timeout:completionHandler:", v2, *(_QWORD *)(a1 + 56), v3);
  objc_msgSend(WeakRetained, "finish");

}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleReadECONNRESETError:readCharacteristics:responses:timeout:queue:completionHandler:", v6, *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

void __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_insertReadCharacteristicValues:timeout:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEstablishingSecureConnection") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Already establishing secure session - not attempting a re-establishment", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setEconnresetRetryInProgress:", 1));
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to re-establish secure session for read on ECONNRESET", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(*(id *)(a1 + 32), "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.read.retry"));
  }
}

uint64_t __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke_156(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E894ABD0;
  objc_copyWeak(&v9, &location);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_readCharacteristicValues:timeout:queue:completionHandler:", v3, v5, v6, v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "hmf_objectsPassingTest:", &__block_literal_global_145);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Read Response: '%{public}@'", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling completion handler"));
  v13 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

BOOL __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __58__HAPAccessoryServerIP__processQueuedOperationsWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1D17B7244]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");
      v11 = 138543618;
      v12 = v7;
      v13 = 1026;
      v14 = v8;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failing queued request with %{public}d", (uint8_t *)&v11, 0x12u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Running queued request", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "_kickConnectionIdleTimer");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing enableEvents block with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(NSObject **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_140;
    v11[3] = &unk_1E894D5E0;
    v13 = *(id *)(a1 + 48);
    v12 = v3;
    dispatch_async(v10, v11);

  }
  else
  {
    objc_msgSend(WeakRetained, "_enableEvents:forCharacteristics:withCompletionHandler:queue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }

}

uint64_t __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing add pairing block with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke_139;
    v11[3] = &unk_1E894D5E0;
    v10 = *(NSObject **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v12 = v3;
    dispatch_async(v10, v11);

  }
  else
  {
    objc_msgSend(WeakRetained, "_listPairingsWithCompletionQueue:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing add pairing block with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(NSObject **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_138;
    v11[3] = &unk_1E894D5E0;
    v13 = *(id *)(a1 + 56);
    v12 = v3;
    dispatch_async(v10, v11);

  }
  else
  {
    objc_msgSend(WeakRetained, "_startAddPairingWithIdentifier:publicKey:admin:queue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __83__HAPAccessoryServerIP__queuedWriteOperationBlock_timeout_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (v6)
    objc_msgSend(WeakRetained, "_error:forWriteCharacteristicValues:queue:completionHandler:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(WeakRetained, "_writeCharacteristicValues:timeout:queue:completionHandler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

void __82__HAPAccessoryServerIP__queuedReadOperationBlock_timeout_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (v6)
    objc_msgSend(WeakRetained, "_error:forReadCharacteristicValues:queue:completionHandler:", v6, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(WeakRetained, "_readCharacteristicValues:timeout:queue:completionHandler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

uint64_t __84__HAPAccessoryServerIP__error_forWriteCharacteristicValues_queue_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__HAPAccessoryServerIP__error_forReadCharacteristicValues_queue_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!a2)
    objc_msgSend(WeakRetained, "_notifyDelegateOfPairingProgress:", 4);
  if (objc_msgSend(v5, "_delegateRespondsToSelector:", sel_accessoryServer_validateCert_model_))
  {
    objc_msgSend(v5, "_notifyDelegateOfPairingProgress:", 5);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_2;
    v7[3] = &unk_1E894E0F8;
    v7[4] = v5;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServer:validateCert:model:", v3, v2, v4);

}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServer:validateCert:model:", v3, v2, v4);

}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isWacAccessory");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_tearDownWAC");
  }
  else
  {
    if (objc_msgSend(v3, "isEstablishingSecureConnection"))
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "queuedOperations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_2;
      v11[3] = &unk_1E894DDF8;
      objc_copyWeak(&v12, &location);
      v5 = (void *)MEMORY[0x1D17B7400](v11);
      objc_msgSend(v4, "addObject:", v5);

      v6 = &v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_tearDownSession");
      objc_initWeak(&location, *(id *)(a1 + 32));
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "clientQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_122;
      v9[3] = &unk_1E894DDF8;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "removePairingForCurrentControllerOnQueue:completion:", v8, v9);

      v6 = &v10;
    }
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clientQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_3;
  v7[3] = &unk_1E894DDF8;
  objc_copyWeak(&v8, v4);
  objc_msgSend(WeakRetained, "removePairingForCurrentControllerOnQueue:completion:", v6, v7);

  objc_destroyWeak(&v8);
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Pairing stopped and accessory pairing removed with error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Deferred accessory pairing removed with error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

uint64_t __44__HAPAccessoryServerIP_disconnectWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Tearing down session as a result of disconnect call", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownSessionAndStartReachabilityWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__HAPAccessoryServerIP_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    && (objc_msgSend(*(id *)(a1 + 32), "isWacLegacy") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isPreSoftAuthWacStarted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "supportsTokenAuth"))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "supportsCertAuth");

      if ((v4 & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "_continuePairingWithSetupCode:", *(_QWORD *)(a1 + 40));
    }
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isPostSoftAuthWacStarted"))
    return objc_msgSend(*(id *)(a1 + 32), "_pairSetupTryPassword:", *(_QWORD *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Post SW Auth password", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingWithSetupCode:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__HAPAccessoryServerIP_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterAuthPromptWithRetry:", 1);
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsLegacyWAC");
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v1, "supportsWAC2"))
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "supportsTokenAuth") & 1) != 0)
  {

    if ((v6 & 1) != 0)
    {
LABEL_7:

      return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterAuthPromptWithRetry:", 1);
    }
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsCertAuth");

  if ((v6 & 1) == 0)
  if ((v9 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterAuthPromptWithRetry:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingUsingWAC");
}

void __33__HAPAccessoryServerIP_reconfirm__block_invoke(uint64_t a1)
{
  id v2;

  if (!objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    || (objc_msgSend(*(id *)(a1 + 32), "isWacComplete") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "hasStartedPairing") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_doBonjourReconfirm");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startDiscoveringWACAccessoryServers");

  }
}

id __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke(uint64_t a1)
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setPairingActivity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setHasStartedPairing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPairingRequest:", *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    || (objc_msgSend(*(id *)(a1 + 32), "isWacComplete") & 1) != 0)
  {
    return (id)objc_msgSend(*(id *)(a1 + 32), "_pairSetupStartWithConsentRequired:", objc_msgSend(*(id *)(a1 + 48), "requiresUserConsent"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPairingProgress:", 0);
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_2;
  v4[3] = &unk_1E894DD58;
  v4[4] = v3;
  return (id)objc_msgSend(v3, "_joinAccessoryNetworkWithCompletion:", v4);
}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  HAPAccessoryInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPAccessoryInfo *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[5];
  _QWORD block[5];
  HAPAccessoryInfo *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_notifyDelegatesPairingStopped:", v3);
    goto LABEL_13;
  }
  objc_msgSend(v4, "_notifyDelegateOfPairingProgress:", 1);
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsLegacyWAC");

  if (v6)
  {
    v7 = [HAPAccessoryInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manufacturer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wacCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v7, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v8, v10, v12, v14, 0, 0, 0);

    if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_3;
      block[3] = &unk_1E894E0F8;
      block[4] = *(_QWORD *)(a1 + 32);
      v29 = v15;
      dispatch_async(v16, block);

    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "supportsTokenAuth"))
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "setPairingRequestPending:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setPreSoftAuthWacStarted:", 1);
    v20 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPairingProgress:", 8));
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Waiting for Bonjour to start Cert / Token Auth", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_120;
    v27[3] = &unk_1E894DD08;
    v27[4] = *(_QWORD *)(a1 + 32);
    __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_120((uint64_t)v27);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsCertAuth");

  if (v19)
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "supportsWAC2");

  if (v25)
    objc_msgSend(*(id *)(a1 + 32), "continuePairingAfterAuthPrompt");
LABEL_13:

}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), 0);

}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_120(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = HAPAuthFeaturesToString(objc_msgSend(v3, "authFeatures"));

    v2 = v5;
  }

}

void __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[8];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v8 = v7;

  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2;
  v21[3] = &unk_1E894DF10;
  v21[4] = WeakRetained;
  v21[7] = v8;
  v10 = *(id *)(a1 + 40);
  v21[5] = v10;
  v11 = v3;
  v21[6] = v11;
  __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2((uint64_t)v21);
  if (!v11)
  {
    objc_msgSend(WeakRetained, "_getAttributeDatabase");
    objc_msgSend(WeakRetained, "resetPairVerifyFailureCount");
    if (objc_msgSend(WeakRetained, "authMethod") == 2
      && objc_msgSend(WeakRetained, "isPostSoftAuthWacStarted"))
    {
      objc_msgSend(WeakRetained, "token");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "provisionToken:", v17);

    }
    objc_msgSend(WeakRetained, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "associateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v18);

    goto LABEL_11;
  }
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = WeakRetained;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to complete pair-verify - error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v13, "_incrementPairVerifyFailureCount");
  objc_msgSend(v13, "_clearIPCacheOnError:", v11);
  if (!objc_msgSend(v13, "shouldRetryPVDueToAuthenticationError:", v11))
  {
    objc_msgSend(v13, "_notifyDelegatesPairingStopped:", v11);
LABEL_11:
    objc_msgSend(WeakRetained, "setEstablishingSecureConnection:", 0);
    goto LABEL_12;
  }
  objc_msgSend(v13, "clientQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_118;
  v19[3] = &unk_1E894E0F8;
  v19[4] = v13;
  v20 = *(id *)(a1 + 40);
  dispatch_async(v16, v19);

LABEL_12:
}

void __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "domain");

    objc_msgSend(*(id *)(a1 + 48), "code");
    v2 = v4;
  }

}

uint64_t __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__HAPAccessoryServerIP_discoverAccessories__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t result;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isSessionEstablished");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
    return objc_msgSend(v3, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.discoverAccessories"));
  result = objc_msgSend(v3, "hasAttributeDatabase");
  if ((_DWORD)result)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to discover accessories because the session is already established, calling delegate immediately", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfDiscoveryCompletionWithError:", 0);
  }
  return result;
}

void __77__HAPAccessoryServerIP_createKeysForDataStreamWithKeySalt_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  HAPSecuritySessionEncryption *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  HAPSecuritySessionEncryption *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    v2 = PairingSessionDeriveKey();
    if ((_DWORD)v2
      || (objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"),
          objc_msgSend(*(id *)(a1 + 40), "length"),
          v2 = PairingSessionDeriveKey(),
          (_DWORD)v2))
    {
      v3 = 0;
    }
    else
    {
      v9 = [HAPSecuritySessionEncryption alloc];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v12, 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[HAPSecuritySessionEncryption initWithInputKey:outputKey:](v9, "initWithInputKey:outputKey:", v10, v11);

      v2 = 0;
    }
    HMErrorFromOSStatus(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Attempting to create HDS keys without an active session", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __49__HAPAccessoryServerIP_pairSetupStartSoftAuthWAC__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHasStartedPairing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPreSoftAuthWacStarted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPostSoftAuthWacStarted:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "isWacAccessory");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isWacComplete");
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_tearDownSession");
      return objc_msgSend(*(id *)(a1 + 32), "_pairSetupContinueWAC");
    }
  }
  return result;
}

uint64_t __36__HAPAccessoryServerIP__tearDownWAC__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_notifyDelegateOfPairingProgress:", 4);
  return result;
}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v41 = v5;
    v42 = 2114;
    v43 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Continue pairing after WAC with error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_96;
  v39[3] = &unk_1E894DD58;
  v39[4] = *(_QWORD *)(a1 + 32);
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v39);
  objc_msgSend(*(id *)(a1 + 32), "setWacComplete:", 1);
  objc_msgSend(*(id *)(a1 + 32), "pairOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finish");

  v10 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v10, "setWacComplete:", 0);
    v8[2](v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesPairingStopped:", *(_QWORD *)(a1 + 40));
    goto LABEL_21;
  }
  objc_msgSend(v10, "hapWACAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsWAC2");

  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v13, "keyStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v14, "registerAccessoryWithHomeKit:error:", v15, &v38);
    v16 = v38;

    if (v16)
      ((void (**)(_QWORD, id))v8)[2](v8, v16);
    else
      objc_msgSend(*(id *)(a1 + 32), "setHasPairings:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesPairingStopped:", v16);
LABEL_20:

    goto LABEL_21;
  }
  v17 = objc_msgSend(v13, "hasBonjourDeviceInfo");
  v18 = *(void **)(a1 + 32);
  if (v17)
  {
    if ((objc_msgSend(v18, "isContinuingLegacyWACpairing") & 1) != 0)
      goto LABEL_21;
    v19 = objc_msgSend(*(id *)(a1 + 32), "hasPairings");
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "bonjourDeviceInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        v42 = 2112;
        v43 = v25;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@already has pairings after legacy WAC completion - aborting pairing operation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 11);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v16);
      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfAddAccessoryFailureWithError:", v16);
      goto LABEL_20;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@continuing Legacy WAC", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(*(id *)(a1 + 32), "setContinuingLegacyWACpairing:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_pairSetupStartWithConsentRequired:", 1);
  }
  else
  {
    objc_msgSend(v18, "bonjourEventTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPairingProgress:", 8));
      v28 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_INFO, "%{public}@Starting a timer to wait for Bonjour event after legacy WAC completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      v37[0] = v7;
      v37[1] = 3221225472;
      v37[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_100;
      v37[3] = &unk_1E894DD08;
      v37[4] = *(_QWORD *)(a1 + 32);
      __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_100((uint64_t)v37);
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 60.0);
      objc_msgSend(*(id *)(a1 + 32), "setBonjourEventTimer:", v31);

      objc_msgSend(*(id *)(a1 + 32), "bonjourEventTimer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setDelegate:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "bonjourEventTimer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegateQueue:", v34);

      objc_msgSend(*(id *)(a1 + 32), "bonjourEventTimer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "resume");

    }
  }
LABEL_21:

}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[6];

  v3 = a2;
  if (v3)
  {
    v5[1] = 3221225472;
    v5[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2;
    v5[3] = &unk_1E894E0F8;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v3;
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2((uint64_t)v5);
    v3 = v4;
  }

}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_100(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = HAPAuthFeaturesToString(objc_msgSend(v3, "authFeatures"));

    v2 = v5;
  }

}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config completed error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2;
  v7[3] = &unk_1E894E0F8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_95;
  v10[3] = &unk_1E894E0F8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterConfirmingSecureWAC:", *(_QWORD *)(a1 + 40));
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying to join accessory network due to error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "hapWACAccessoryClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_90;
    v11[3] = &unk_1E894DD58;
    v11[4] = *(_QWORD *)(a1 + 40);
    v8 = (id)objc_msgSend(v7, "joinAccessoryNetworkWithCompletion:", v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPairingProgress:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPairingProgress:", 6);
    v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_92;
    v10[3] = &unk_1E894DD58;
    v10[4] = v9;
    objc_msgSend(v9, "_performEasyConfigWithPairingPrompt:performPairSetup:isSplit:completion:", _WACPairSetupPromptForSetupCodeDelegateCallback_f, 1, 1, v10);
  }
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_91;
  v7[3] = &unk_1E894E0F8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_93;
  v10[3] = &unk_1E894E0F8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_93(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterConfirmingSecureWAC:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_91(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v5;
  _QWORD v6[5];

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "_continuePairingAfterConfirmingSecureWAC:");
  objc_msgSend(v2, "_notifyDelegateOfPairingProgress:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPairingProgress:", 6);
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_3;
  v6[3] = &unk_1E894DD58;
  v6[4] = v5;
  return objc_msgSend(v5, "_performEasyConfigWithPairingPrompt:performPairSetup:isSplit:completion:", _WACPairSetupPromptForSetupCodeDelegateCallback_f, 1, 1, v6);
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterConfirmingSecureWAC:", v3);

}

void __96__HAPAccessoryServerIP__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setBonjourDeviceInfo:", 0));
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Bonjour reset after Easy Config completed with error: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

uint64_t __47__HAPAccessoryServerIP_continuePairingUsingWAC__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterWAC:", 0);
}

void __65__HAPAccessoryServerIP__continuePairingAfterConfirmingSecureWAC___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 5, *(_QWORD *)(a1 + 40), 0);

}

void __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Joined accessory network for re-WAC with join error: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v8, "setWacComplete:", 1);
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notifyDelegatesOfWACCompletionWithIdentifier:error:", v10, v3);

  }
  else
  {
    objc_msgSend(v8, "hapWACAccessoryClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke_88;
    v13[3] = &unk_1E894DD58;
    v11 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v12 = (id)objc_msgSend(v9, "performEasyConfigWithParingPrompt:performPairSetup:isSplit:pairingRequest:completion:", 0, 0, 0, v11, v13);
  }

}

void __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setWacComplete:", 1));
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy config with pair-verify finished with error: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyDelegatesOfWACCompletionWithIdentifier:error:", v9, v3);

}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clientQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_2;
    block[3] = &unk_1E894DD08;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HAPAccessoryInfo *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HAPAccessoryInfo *v14;
  void *v15;
  void *v16;
  HAPAccessoryInfo *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD block[5];
  HAPAccessoryInfo *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pairOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@cancel pairing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "pairOperation");
    v9 = (HAPAccessoryInfo *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryInfo finish](v9, "finish");
    goto LABEL_10;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isWacLegacy"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isWacAccessory"))
    {
      objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "supportsTokenAuth"))
      {

LABEL_16:
        v22 = (void *)MEMORY[0x1D17B7244]();
        v23 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v25;
          _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@Starting WAC Software Auth Split Pair-Setup", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsCertAuth");

      if (v21)
        goto LABEL_16;
    }
LABEL_19:
    objc_msgSend(*(id *)(a1 + 32), "_continuePairingUsingWAC");
    return;
  }
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v13;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Legacy WAC, prompting user to request permission to provide credentials...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
  {
    v14 = [HAPAccessoryInfo alloc];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "category");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v14, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v15, 0, 0, v16, 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_86;
    block[3] = &unk_1E894E0F8;
    block[4] = *(_QWORD *)(a1 + 32);
    v27 = v17;
    v9 = v17;
    dispatch_async(v18, block);

LABEL_10:
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfAddAccessoryFailureWithError:", 0);
}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_86(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40), 0);

}

void __60__HAPAccessoryServerIP__joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setBonjourDeviceInfo:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __62__HAPAccessoryServerIP_startReprovisioningWithPairingRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyStartWAC:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__HAPAccessoryServerIP__updateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  const __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isSessionEstablished"))
    return objc_msgSend(*(id *)(a1 + 32), "_getAttributeDatabase");
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = CFSTR("bonjourUpdate.configNumberChanged");
  }
  else if (*(_BYTE *)(a1 + 41))
  {
    v3 = CFSTR("bonjourUpdate.stateNumberChanged");
  }
  else if (*(_BYTE *)(a1 + 42))
  {
    v3 = CFSTR("bonjourUpdate.wakeNumberChanged");
  }
  else if (*(_BYTE *)(a1 + 43))
  {
    v3 = CFSTR("bonjourUpdate.pendingBonjourDiscovery");
  }
  else
  {
    v3 = CFSTR("requested");
  }
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@establishing secured session due: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  return objc_msgSend(*(id *)(a1 + 32), "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", v3);
}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  _WORD v31[9];

  *(_QWORD *)&v31[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateWithBonjourDeviceInfo:socketInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_2;
  v27[3] = &unk_1E894DD58;
  v27[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v27);
  if (!objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    || !objc_msgSend(*(id *)(a1 + 32), "isWacLegacy"))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isPairingRequestPending"))
      goto LABEL_20;
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v24;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Pairing request pending", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(*(id *)(a1 + 32), "setPairingRequestPending:", 0);
    v2[2](v2, 0);
    v25 = *(void **)(a1 + 32);
    v26 = 0;
    goto LABEL_19;
  }
  v3 = (void *)MEMORY[0x1D17B7244]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_msgSend(*(id *)(a1 + 32), "statusFlags") & 1) == 0;
    v8 = objc_msgSend(*(id *)(a1 + 32), "isContinuingLegacyWACpairing");
    *(_DWORD *)buf = 138543874;
    v29 = v6;
    v30 = 1024;
    *(_DWORD *)v31 = v7;
    v31[2] = 1024;
    *(_DWORD *)&v31[3] = v8;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Legacy WAC accessory Bonjour event - hasPairings %d  continuingLegacyPairing: %d", buf, 0x18u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "setWacComplete:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "hasStartedPairing")
    && (objc_msgSend(*(id *)(a1 + 32), "isContinuingLegacyWACpairing") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bonjourEventTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17B7244]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v13;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Received Bonjour event - suspending timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v2[2](v2, 0);
      objc_msgSend(*(id *)(a1 + 32), "bonjourEventTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "suspend");

      objc_msgSend(*(id *)(a1 + 32), "setBonjourEventTimer:", 0);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "statusFlags") & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "bonjourDeviceInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2112;
        *(_QWORD *)v31 = v19;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@has pairings after legacy WAC completion - aborting pairing operation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v2)[2](v2, v20);
      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfAddAccessoryFailureWithError:", v20);

      goto LABEL_20;
    }
    objc_msgSend(*(id *)(a1 + 32), "setContinuingLegacyWACpairing:", 1);
    v25 = *(void **)(a1 + 32);
    v26 = 1;
LABEL_19:
    objc_msgSend(v25, "_pairSetupStartWithConsentRequired:", v26);
  }
LABEL_20:

}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[6];

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3;
  v4[3] = &unk_1E894E0F8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3((uint64_t)v4);

}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    objc_msgSend(*(id *)(a1 + 32), "isWacAccessory");
    v3 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 32), "isWacComplete");
    v4 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 32), "isWacLegacy");
    v5 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 32), "hapWACAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HAPAuthFeaturesToString(objc_msgSend(v6, "authFeatures"));

    v2 = v8;
  }

}

void __70__HAPAccessoryServerIP__notifyDelegateOfDiscoveryCompletionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, *(_QWORD *)(a1 + 40));

}

void __58__HAPAccessoryServerIP__notifyDelegateNeedsOwnershipToken__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerNeedsOwnershipToken:", *(_QWORD *)(a1 + 32));

}

void __68__HAPAccessoryServerIP__notifyDelegatesOfConnectionState_withError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v2, "discoveryBookkeeping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServer:didUpdateConnectionState:linkLayerType:bookkeeping:withError:", v2, v3, 1, v4, *(_QWORD *)(a1 + 40));

}

void __55__HAPAccessoryServerIP__notifyDelegatesPairingStopped___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __44__HAPAccessoryServerIP_removeActiveSession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) &= ~*(_QWORD *)(a1 + 40);
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession(*(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Removed active session for %@. Current active sessions: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[46])
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HAPStringFromAccessoryServerSession(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Not enabling connection idle timer due to active sessions: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(v8, "_startConnectionIdleTimer");
  }
  objc_msgSend(*(id *)(a1 + 32), "ipConnectionStatistics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessoryServerIPEvent:", 8);

}

void __41__HAPAccessoryServerIP_addActiveSession___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) |= *(_QWORD *)(a1 + 40);
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession(*(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Added active session for %@. Current active sessions: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD **)(a1 + 32);
  if (v8[46])
  {
    objc_msgSend(v8, "_suspendConnectionIdleTimer");
    v8 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v8, "ipConnectionStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryServerIPEvent:", 7);

}

void __57__HAPAccessoryServerIP__notifyDelegateOfPairingProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:updatePairingProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __56__HAPAccessoryServerIP_invalidateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isWacAccessory")
    && (objc_msgSend(*(id *)(a1 + 32), "isWacComplete") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateWAC");
  }
  else
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "httpClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating non WAC server with httpClient: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "_cancelNameResolution");
    objc_msgSend(*(id *)(a1 + 32), "httpClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setHttpClient:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setInvalidated:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "accessories", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          HMErrorFromHAPErrorCode(32);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invalidateWithError:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:queue:", 0, 0);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "incrementHAPIPInvalidationCount");
}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0D28678], "setDefaultValue:forPreferenceKey:", &unk_1E89898B0, CFSTR("HAPDefaultIPDisconnectOnIdleTimeoutSeconds"));
}

+ (id)sharedPairOperationQueue
{
  if (sharedPairOperationQueue_onceToken != -1)
    dispatch_once(&sharedPairOperationQueue_onceToken, &__block_literal_global_700);
  return (id)sharedPairOperationQueue__sharedQueue;
}

void __48__HAPAccessoryServerIP_sharedPairOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v0, "setName:", CFSTR("com.apple.CoreHAP.pairWACOperationQueue"));
  objc_msgSend(v0, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v0, "setQualityOfService:", 25);
  v1 = (void *)sharedPairOperationQueue__sharedQueue;
  sharedPairOperationQueue__sharedQueue = (uint64_t)v0;

}

- (void)processPendingBonjourRemoveEvents
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HAPAccessoryServerIP_SessionRestore__processPendingBonjourRemoveEvents__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __73__HAPAccessoryServerIP_SessionRestore__processPendingBonjourRemoveEvents__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "browser");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processPendingBonjourRemoveEventsForDeviceID:", v2);

}

- (void)incrementHAPIPInvalidationCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPInvalidationCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPHTTPRequestsCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPRequestsCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPHTTPResponsesCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPResponsesCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPHTTPEventsCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPEventsCount;
  os_unfair_lock_unlock(p_lock);
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v11 = a3;
  v13[4] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = &unk_1E8989398;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPIPInvalidationCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = &unk_1E89893B0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPIPHTTPRequestsCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = &unk_1E89893C8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPIPHTTPResponsesCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = &unk_1E89893E0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPIPHTTPEventsCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self->_metricHAPIPHTTPRequestsCount = 0;
    self->_metricHAPIPHTTPResponsesCount = 0;
    self->_metricHAPIPHTTPEventsCount = 0;
    self->_metricHAPIPInvalidationCount = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0D28540]);
  v13 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %s:%ld"), v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 8619);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithName:", v15);

  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke;
  block[3] = &unk_1E894CAB0;
  block[4] = self;
  v23 = v9;
  v24 = v10;
  v25 = v16;
  v26 = v11;
  v18 = v11;
  v19 = v16;
  v20 = v10;
  v21 = v9;
  dispatch_async(v17, block);

}

- (void)_requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  BOOL v11;
  void *v12;
  HAPAccessoryServerIP *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerIP *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  int v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id location;
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HAPAccessoryServerIP _isSessionEstablished](self, "_isSessionEstablished");
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v16;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Requesting resource", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (void *)MEMORY[0x1E0CB3940];
    v42[0] = CFSTR("/");
    v42[1] = CFSTR("resource");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathWithComponents:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[HAPAccessoryServerIP _ensureHTTPClientSetUp](v13, "_ensureHTTPClientSetUp");
    if (v20)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_4;
      v29[3] = &unk_1E89494D8;
      v30 = v10;
      v31 = v20;
      dispatch_async(v9, v29);

    }
    else
    {
      objc_initWeak((id *)buf, v13);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1104;
      v32[3] = &unk_1E89494B0;
      objc_copyWeak(&v35, (id *)buf);
      v33 = v9;
      v34 = v10;
      -[HAPAccessoryServerIP sendPOSTRequestToURL:request:serializationType:completionHandler:](v13, "sendPOSTRequestToURL:request:serializationType:completionHandler:", v19, v8, 1, v32);

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v21;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing resource request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_initWeak(&location, v13);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke;
    v36[3] = &unk_1E8949488;
    objc_copyWeak(&v40, &location);
    v37 = v9;
    v39 = v10;
    v38 = v8;
    v22 = (void *)MEMORY[0x1D17B7400](v36);
    v23 = (void *)MEMORY[0x1D17B7244]();
    v24 = v13;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v26;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing resource request until pair-verify completes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    -[HAPAccessoryServerIP queuedOperations](v24, "queuedOperations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1D17B7400](v22);
    objc_msgSend(v27, "addObject:", v28);

    -[HAPAccessoryServerIP _establishSecureConnectionAndFetchAttributeDatabaseWithReason:](v24, "_establishSecureConnectionAndFetchAttributeDatabaseWithReason:", CFSTR("noSession.hapurl"));
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2;
    v7[3] = &unk_1E894D5E0;
    v9 = *(id *)(a1 + 48);
    v8 = v3;
    dispatch_async(v6, v7);

  }
  else
  {
    objc_msgSend(WeakRetained, "_requestResource:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1104(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  char isKindOfClass;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v10)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v15;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Image snapshot returned HTTP client error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1105;
    block[3] = &unk_1E894D5E0;
    v16 = *(NSObject **)(a1 + 32);
    v33 = *(id *)(a1 + 40);
    v32 = v10;
    dispatch_async(v16, block);

    v17 = v33;
  }
  else if (v9
         && a4 == 200
         && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), a3 == 2)
         && (isKindOfClass & 1) != 0)
  {
    v19 = v9;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2_1106;
    v28[3] = &unk_1E894D5E0;
    v20 = *(NSObject **)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v29 = v19;
    v30 = v21;
    dispatch_async(v20, v28);

    v17 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 50);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_3;
    v25[3] = &unk_1E894D5E0;
    v23 = *(NSObject **)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v26 = v22;
    v27 = v24;
    v17 = v22;
    dispatch_async(v23, v25);

  }
}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1105(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2_1106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E894BBE0;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_requestResource:queue:completionHandler:", v3, v4, v5);

}

void __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling completion handler"));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t409 != -1)
    dispatch_once(&logCategory__hmf_once_t409, &__block_literal_global_1117);
  return (id)logCategory__hmf_once_v410;
}

void __44__HAPAccessoryServerIP_Metrics__logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v410;
  logCategory__hmf_once_v410 = v0;

}

- (void)_doResolveWithGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HAPAccessoryServerIP *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HAPNameResolver *v21;
  void *v22;
  _QWORD v23[5];
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPAccessoryServerIP nameResolver](self, "nameResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Name resolution already in progress!  Are there multiple outstanding connection requests?", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    dispatch_group_leave(v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceForKey:", CFSTR("HAPServerIPServerNameResolutionTimeoutSeconds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberValue");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = (void *)v13;
    else
      v14 = &unk_1E89895F0;
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAPAccessoryServerIP bonjourDeviceInfo](self, "bonjourDeviceInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("serviceType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[HAPNameResolver initWithDeviceName:serviceType:domain:]([HAPNameResolver alloc], "initWithDeviceName:serviceType:domain:", v18, v20, CFSTR("local"));
    -[HAPAccessoryServerIP setNameResolver:](self, "setNameResolver:", v21);

    -[HAPAccessoryServerIP nameResolver](self, "nameResolver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__HAPAccessoryServerIP_NameResolution___doResolveWithGroup___block_invoke;
    v23[3] = &unk_1E894C610;
    v23[4] = self;
    v24 = v4;
    objc_msgSend(v22, "resolveWithTimeout:completion:", v23, v16);

  }
}

- (void)_cancelNameResolution
{
  NSObject *v3;
  void *v4;
  void *v5;
  HAPAccessoryServerIP *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServer clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAPAccessoryServerIP nameResolver](self, "nameResolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling active name resolution", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPAccessoryServerIP nameResolver](v6, "nameResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[HAPAccessoryServerIP setNameResolver:](v6, "setNameResolver:", 0);
  }
}

void __60__HAPAccessoryServerIP_NameResolution___doResolveWithGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setNameResolver:", 0));
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving updated socket info %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "setCachedSocketInfo:", v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Name resolution failed: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

@end
