@implementation HMDUnpairedHAPAccessoryPairingInformation

- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 linkType:(int64_t)a5 setupCode:(id)a6 completionHandler:(id)a7 setupCodeProvider:(id)a8 pairingRequest:(id)a9
{
  NSString *v15;
  HAPAccessoryPairingRequest *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDUnpairedHAPAccessoryPairingInformation *v21;
  void *v22;
  id addAccessoryCompletionHandler;
  void *v24;
  id setupCodeProviderCompletionHandler;
  uint64_t v26;
  NSUUID *accessoryUUID;
  NSString *accessoryName;
  NSString *v29;
  uint64_t v30;
  NSString *setupCode;
  HAPAccessoryPairingRequest *pairingRequest;
  objc_super v34;

  v15 = (NSString *)a4;
  v16 = (HAPAccessoryPairingRequest *)a9;
  v34.receiver = self;
  v34.super_class = (Class)HMDUnpairedHAPAccessoryPairingInformation;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a3;
  v21 = -[HMDUnpairedHAPAccessoryPairingInformation init](&v34, sel_init);
  v21->_linkType = a5;
  v22 = _Block_copy(v18);

  addAccessoryCompletionHandler = v21->_addAccessoryCompletionHandler;
  v21->_addAccessoryCompletionHandler = v22;

  v24 = _Block_copy(v17);
  setupCodeProviderCompletionHandler = v21->_setupCodeProviderCompletionHandler;
  v21->_setupCodeProviderCompletionHandler = v24;

  v26 = objc_msgSend(v20, "copy", v34.receiver, v34.super_class);
  accessoryUUID = v21->_accessoryUUID;
  v21->_accessoryUUID = (NSUUID *)v26;

  accessoryName = v21->_accessoryName;
  v21->_accessoryName = v15;
  v29 = v15;

  v30 = objc_msgSend(v19, "copy");
  setupCode = v21->_setupCode;
  v21->_setupCode = (NSString *)v30;

  pairingRequest = v21->_pairingRequest;
  v21->_pairingRequest = v16;

  return v21;
}

- (HMDUnpairedHAPAccessoryPairingInformation)initWithAccessoryDescription:(id)a3 linkType:(int64_t)a4 completionHandler:(id)a5 progressHandler:(id)a6 pairingRequest:(id)a7
{
  id v12;
  id v13;
  HAPAccessoryPairingRequest *v14;
  id v15;
  HMDUnpairedHAPAccessoryPairingInformation *v16;
  uint64_t v17;
  void *v18;
  id addAccessoryCompletionHandler;
  void *v20;
  id addAccessoryProgressHandler;
  uint64_t v22;
  NSUUID *accessoryUUID;
  uint64_t v24;
  NSString *accessoryName;
  uint64_t v26;
  NSString *accessoryServerIdentifier;
  uint64_t v28;
  NSString *setupID;
  uint64_t v30;
  NSString *setupCode;
  uint64_t v32;
  NSUUID *homeUUID;
  uint64_t v34;
  NSUUID *setupAuthTokenUUID;
  uint64_t v36;
  NSData *setupAuthToken;
  HAPAccessoryPairingRequest *pairingRequest;
  objc_super v40;

  v12 = a3;
  v13 = a5;
  v14 = (HAPAccessoryPairingRequest *)a7;
  v40.receiver = self;
  v40.super_class = (Class)HMDUnpairedHAPAccessoryPairingInformation;
  v15 = a6;
  v16 = -[HMDUnpairedHAPAccessoryPairingInformation init](&v40, sel_init);
  v16->_linkType = a4;
  if (!a4)
  {
    if ((objc_msgSend(v12, "supportsBTLE", v40.receiver, v40.super_class) & 1) != 0)
    {
      v17 = 2;
LABEL_6:
      v16->_linkType = v17;
      goto LABEL_7;
    }
    if (objc_msgSend(v12, "supportsIP"))
    {
      v17 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  v18 = _Block_copy(v13);
  addAccessoryCompletionHandler = v16->_addAccessoryCompletionHandler;
  v16->_addAccessoryCompletionHandler = v18;

  v20 = _Block_copy(v15);
  addAccessoryProgressHandler = v16->_addAccessoryProgressHandler;
  v16->_addAccessoryProgressHandler = v20;

  objc_msgSend(v12, "accessoryUUID");
  v22 = objc_claimAutoreleasedReturnValue();
  accessoryUUID = v16->_accessoryUUID;
  v16->_accessoryUUID = (NSUUID *)v22;

  objc_msgSend(v12, "accessoryName");
  v24 = objc_claimAutoreleasedReturnValue();
  accessoryName = v16->_accessoryName;
  v16->_accessoryName = (NSString *)v24;

  objc_msgSend(v12, "accessoryServerIdentifier");
  v26 = objc_claimAutoreleasedReturnValue();
  accessoryServerIdentifier = v16->_accessoryServerIdentifier;
  v16->_accessoryServerIdentifier = (NSString *)v26;

  objc_msgSend(v12, "setupID");
  v28 = objc_claimAutoreleasedReturnValue();
  setupID = v16->_setupID;
  v16->_setupID = (NSString *)v28;

  objc_msgSend(v12, "setupCode");
  v30 = objc_claimAutoreleasedReturnValue();
  setupCode = v16->_setupCode;
  v16->_setupCode = (NSString *)v30;

  objc_msgSend(v12, "homeUUID");
  v32 = objc_claimAutoreleasedReturnValue();
  homeUUID = v16->_homeUUID;
  v16->_homeUUID = (NSUUID *)v32;

  objc_msgSend(v12, "setupAuthTokenUUID");
  v34 = objc_claimAutoreleasedReturnValue();
  setupAuthTokenUUID = v16->_setupAuthTokenUUID;
  v16->_setupAuthTokenUUID = (NSUUID *)v34;

  objc_msgSend(v12, "setupAuthToken");
  v36 = objc_claimAutoreleasedReturnValue();
  setupAuthToken = v16->_setupAuthToken;
  v16->_setupAuthToken = (NSData *)v36;

  v16->_wacAccessory = objc_msgSend(v12, "supportsWAC");
  pairingRequest = v16->_pairingRequest;
  v16->_pairingRequest = v14;

  return v16;
}

- (id)description
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = isInternalBuild();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUnpairedHAPAccessoryPairingInformation accessoryName](self, "accessoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpairedHAPAccessoryPairingInformation accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    -[HMDUnpairedHAPAccessoryPairingInformation setupID](self, "setupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation setupCode](self, "setupCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation wacAccessory](self, "wacAccessory");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation legacyWAC](self, "legacyWAC");
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation homeUUID](self, "homeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("accessoryName: %@, accessoryUUID: %@, setupID: %@, setupCode: %@, WAC: %@, legacyWAC: %@ homeUUID: %@"), v5, v8, v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("accessoryName: %@, accessoryUUID: %@"), v5, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)matchesUnpairedAccessory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "preferredAccessoryServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDUnpairedHAPAccessoryPairingInformation matchesAccessoryServer:](self, "matchesAccessoryServer:", v5))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation accessoryUUID](self, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v6;
}

- (BOOL)matchesAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMDUnpairedHAPAccessoryPairingInformation setupID](self, "setupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpairedHAPAccessoryPairingInformation accessoryServerIdentifier](self, "accessoryServerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "matchesSetupID:serverIdentifier:", v5, v6);

  return v7;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (HMFTimer)pairingInterruptionTimer
{
  return self->_pairingInterruptionTimer;
}

- (void)setPairingInterruptionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pairingInterruptionTimer, a3);
}

- (id)addAccessoryCompletionHandler
{
  return self->_addAccessoryCompletionHandler;
}

- (void)setAddAccessoryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)addAccessoryProgressHandler
{
  return self->_addAccessoryProgressHandler;
}

- (void)setAddAccessoryProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)setupCodeProviderCompletionHandler
{
  return self->_setupCodeProviderCompletionHandler;
}

- (void)setSetupCodeProviderCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HMFTimer)pairingRetryTimer
{
  return self->_pairingRetryTimer;
}

- (void)setPairingRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pairingRetryTimer, a3);
}

- (HMFTimer)reconfirmTimer
{
  return self->_reconfirmTimer;
}

- (void)setReconfirmTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reconfirmTimer, a3);
}

- (BOOL)allowAddUnauthenticatedAccessory
{
  return self->_allowAddUnauthenticatedAccessory;
}

- (void)setAllowAddUnauthenticatedAccessory:(BOOL)a3
{
  self->_allowAddUnauthenticatedAccessory = a3;
}

- (BOOL)provideNetworkCredentialsToAccessory
{
  return self->_provideNetworkCredentialsToAccessory;
}

- (void)setProvideNetworkCredentialsToAccessory:(BOOL)a3
{
  self->_provideNetworkCredentialsToAccessory = a3;
}

- (BOOL)setupCodeProvided
{
  return self->_setupCodeProvided;
}

- (void)setSetupCodeProvided:(BOOL)a3
{
  self->_setupCodeProvided = a3;
}

- (HMFActivity)pairingActivity
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_pairingActivity);
}

- (void)setPairingActivity:(id)a3
{
  objc_storeWeak((id *)&self->_pairingActivity, a3);
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setAccessoryServerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, a3);
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (void)setSetupCode:(id)a3
{
  objc_storeStrong((id *)&self->_setupCode, a3);
}

- (NSString)setupID
{
  return self->_setupID;
}

- (void)setSetupID:(id)a3
{
  objc_storeStrong((id *)&self->_setupID, a3);
}

- (NSUUID)setupAuthTokenUUID
{
  return self->_setupAuthTokenUUID;
}

- (void)setSetupAuthTokenUUID:(id)a3
{
  objc_storeStrong((id *)&self->_setupAuthTokenUUID, a3);
}

- (NSData)setupAuthToken
{
  return self->_setupAuthToken;
}

- (void)setSetupAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_setupAuthToken, a3);
}

- (BOOL)wacAccessory
{
  return self->_wacAccessory;
}

- (void)setWacAccessory:(BOOL)a3
{
  self->_wacAccessory = a3;
}

- (BOOL)legacyWAC
{
  return self->_legacyWAC;
}

- (void)setLegacyWAC:(BOOL)a3
{
  self->_legacyWAC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_setupAuthTokenUUID, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_reconfirmTimer, 0);
  objc_storeStrong((id *)&self->_pairingRetryTimer, 0);
  objc_storeStrong(&self->_setupCodeProviderCompletionHandler, 0);
  objc_storeStrong(&self->_addAccessoryProgressHandler, 0);
  objc_storeStrong(&self->_addAccessoryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairingInterruptionTimer, 0);
}

@end
