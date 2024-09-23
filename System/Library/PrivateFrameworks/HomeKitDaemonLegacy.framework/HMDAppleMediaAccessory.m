@implementation HMDAppleMediaAccessory

- (BOOL)supportsHomeHub
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "supportsHomeHub");
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory device](v7, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supports home hub due to no capabilities or device: %@, capabilities: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (void)deleteSiriHistoryForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDAppleMediaAccessory messenger](self, "messenger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sendDeleteSiriHistoryRequestForAccessoryWithUUID:completionHandler:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get messenger to delete siri history for accessory with uuid: %@ error: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v7[2](v7, v10);

  }
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessoryLocalMessageHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAppleMediaAccessory *)v7;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDAppleMediaAccessoryDependencyFactory *v8;
  HMDAppleMediaAccessory *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
  v9 = -[HMDAppleMediaAccessory initWithTransaction:home:dependencyFactory:](self, "initWithTransaction:home:dependencyFactory:", v7, v6, v8);

  return v9;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4 dependencyFactory:(id)a5
{
  HMDAppleMediaAccessory *v5;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  HMDAppleMediaAccessory *v26;
  uint64_t v27;
  OS_os_log *logger;
  HMDAppleMediaAccessoryModelDataSource *v29;
  HMDAppleMediaAccessoryModelDataSource *modelDataSource;
  uint64_t v31;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v33;
  HMFPairingIdentity *pairingIdentity;
  id settingsConnectionFactory;
  id deviceMediaRouteIdentifierFactory;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  HMDRemoteLoginHandler *v41;
  HMDRemoteLoginHandler *remoteLoginHandler;
  void *v43;
  HMDAppleMediaAccessorySleepWakeStateController *v44;
  void *v45;
  uint64_t v46;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  void *v48;
  HMDAppleMediaAccessory *v49;
  HMDAppleMediaAccessory *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "deviceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v14, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (HMDAppleMediaAccessory *)objc_msgSend(v16, "initWithUUIDString:", v17);

      objc_msgSend(v11, "deviceControllerWithDeviceIdentifier:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v14, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (!v15)
      {
        objc_msgSend(v14, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deviceControllerWithDevice:", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v14, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateWithDevice:completionHandler:", v20, 0);

    }
    if (!v15)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = a5;
        v23 = v10;
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v59 = v25;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Unable to determine device", buf, 0xCu);

        v11 = v24;
        v10 = v23;
        a5 = v55;
      }

      objc_autoreleasePoolPop(v21);
    }
    v57.receiver = self;
    v57.super_class = (Class)HMDAppleMediaAccessory;
    v26 = -[HMDMediaAccessory initWithTransaction:home:](&v57, sel_initWithTransaction_home_, v12, v10);
    if (v26)
    {
      v56 = v10;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      logger = v26->_logger;
      v26->_logger = (OS_os_log *)v27;

      v29 = objc_alloc_init(HMDAppleMediaAccessoryModelDataSource);
      modelDataSource = v26->_modelDataSource;
      v26->_modelDataSource = v29;

      objc_storeStrong((id *)&v26->_deviceController, v15);
      objc_msgSend(v14, "softwareVersion");
      v31 = objc_claimAutoreleasedReturnValue();
      softwareVersion = v26->_softwareVersion;
      v26->_softwareVersion = (HMFSoftwareVersion *)v31;

      objc_msgSend(v14, "pairingIdentity");
      v33 = objc_claimAutoreleasedReturnValue();
      pairingIdentity = v26->_pairingIdentity;
      v26->_pairingIdentity = (HMFPairingIdentity *)v33;

      settingsConnectionFactory = v26->_settingsConnectionFactory;
      v26->_settingsConnectionFactory = &__block_literal_global_92330;

      deviceMediaRouteIdentifierFactory = v26->_deviceMediaRouteIdentifierFactory;
      v26->_deviceMediaRouteIdentifierFactory = &__block_literal_global_171;

      objc_msgSend(v14, "idsIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (!v37)
      {
        objc_msgSend(v14, "device");
        v5 = (HMDAppleMediaAccessory *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory idsIdentifier](v5, "idsIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v11;
      objc_storeStrong((id *)&v26->_idsIdentifier, v38);
      if (!v37)
      {

      }
      objc_msgSend(v14, "loggedInAccount");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[HMDRemoteLoginHandler initWithAccessory:loggedInAccountData:]([HMDRemoteLoginHandler alloc], "initWithAccessory:loggedInAccountData:", v26, v40);
      remoteLoginHandler = v26->_remoteLoginHandler;
      v26->_remoteLoginHandler = v41;

      objc_msgSend(v14, "supportedStereoPairVersions");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v26->_supportedStereoPairVersions = objc_msgSend(v43, "unsignedIntegerValue");

      v44 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
      -[HMDAccessory uuid](v26, "uuid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v44, "initWithAccessoryUUID:dataSource:", v45, v26);
      sleepWakeStateController = v26->_sleepWakeStateController;
      v26->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v46;

      __bootstrapSupportedStereoPairVersions(v26);
      objc_msgSend(v14, "productColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v26->_productColor = objc_msgSend(v48, "unsignedIntegerValue");

      objc_storeStrong((id *)&v26->_dependencyFactory, a5);
      v11 = v39;
      v10 = v56;
    }
    v49 = v26;

    v50 = v49;
  }
  else
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v49 = self;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v53;
      _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize an AppleMedia accessory without an AppleMedia model.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
    v50 = 0;
  }

  return v50;
}

- (HMDAppleMediaAccessory)initWithDependencyFactory:(id)a3 deviceMediaRouteIdentifierFactory:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessory *v9;
  HMDAppleMediaAccessory *v10;
  void *v11;
  id deviceMediaRouteIdentifierFactory;

  v7 = a3;
  v8 = a4;
  v9 = -[HMDAppleMediaAccessory init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencyFactory, a3);
    if (v8)
    {
      v11 = _Block_copy(v8);
      deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
      v10->_deviceMediaRouteIdentifierFactory = v11;

    }
  }

  return v10;
}

- (HMDAppleMediaAccessory)init
{
  HMDAppleMediaAccessory *v2;
  uint64_t v3;
  OS_os_log *logger;
  HMDAppleMediaAccessoryModelDataSource *v5;
  HMDAppleMediaAccessoryModelDataSource *modelDataSource;
  id settingsConnectionFactory;
  id deviceMediaRouteIdentifierFactory;
  HMDAppleMediaAccessorySleepWakeStateController *v9;
  void *v10;
  uint64_t v11;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  uint64_t v13;
  NSHashTable *hostedAccessories;
  HMDAppleMediaAccessoryDependencyFactory *v15;
  HMDAppleMediaAccessoryDependencyFactory *dependencyFactory;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDAppleMediaAccessory;
  v2 = -[HMDMediaAccessory init](&v18, sel_init);
  if (v2)
  {
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = objc_alloc_init(HMDAppleMediaAccessoryModelDataSource);
    modelDataSource = v2->_modelDataSource;
    v2->_modelDataSource = v5;

    v2->_deviceReachable = 1;
    settingsConnectionFactory = v2->_settingsConnectionFactory;
    v2->_settingsConnectionFactory = &__block_literal_global_176;

    deviceMediaRouteIdentifierFactory = v2->_deviceMediaRouteIdentifierFactory;
    v2->_deviceMediaRouteIdentifierFactory = &__block_literal_global_177;

    v9 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    -[HMDAccessory uuid](v2, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v9, "initWithAccessoryUUID:dataSource:", v10, v2);
    sleepWakeStateController = v2->_sleepWakeStateController;
    v2->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    hostedAccessories = v2->_hostedAccessories;
    v2->_hostedAccessories = (NSHashTable *)v13;

    v2->_productColor = 0;
    objc_storeWeak((id *)&v2->_mediaDestinationControllerFactory, v2);
    objc_storeWeak((id *)&v2->_mediaDestinationManagerFactory, v2);
    v15 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v2->_dependencyFactory;
    v2->_dependencyFactory = v15;

  }
  return v2;
}

- (HMDAppleMediaAccessory)initWithDeviceController:(id)a3 deviceIdentifierFactory:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessory *v9;
  HMDAppleMediaAccessory *v10;
  void *v11;
  id deviceMediaRouteIdentifierFactory;

  v7 = a3;
  v8 = a4;
  v9 = -[HMDAppleMediaAccessory init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceController, a3);
    v11 = _Block_copy(v8);
    deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
    v10->_deviceMediaRouteIdentifierFactory = v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDAppleMediaAccessory targetControlManager](self, "targetControlManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[HMDAppleMediaAccessory setTargetControlManager:](self, "setTargetControlManager:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  -[HMDAccessory uuid](self, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaAccessory name](self, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory category](self, "category");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory softwareUpdate](self, "softwareUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    v7 = CFSTR(" isCurrent = YES,");
  else
    v7 = &stru_1E89C3E38;
  -[HMDAppleMediaAccessory device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory room](self, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@, UUID = %@, Name = %@, Identifier = %@, Category = %@, Version = %@, Update = %@, Stereo Pair Versions = %@,%@ Device = %@, Home = %@, RoomUUID = %@>"), v16, v15, v21, v3, v14, v4, v5, v6, v7, v8, v10, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory _registerForMessages](&v16, sel__registerForMessages);
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7C68], self, v8, sel_handleFetchManagedConfigurationProfiles_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7DE8], self, v8, sel_handleRemoveManagedConfigurationProfile_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7CA0], self, v8, sel_handleInstallManagedConfigurationProfile_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9C68], self, v12, sel__fetchAvailableUpdate_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB9C78], self, v12, sel__startUpdate_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7BA8], self, v12, sel_handleDeleteSiriHistoryRequest_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8168], self, v12, sel_handleUpdatePreferredMediaUser_);
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8028], self, v12, sel_handleSoftwareUpdateV2Scan_);

  if (isInternalBuild())
  {
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8148], self, v15, sel__handleTriggerPairingIdentityUpdateNotification_);
  }

}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    v5 = -[HMDMediaAccessory _shouldFilterAccessoryProfileForUnentitledClients:](&v7, sel__shouldFilterAccessoryProfileForUnentitledClients_, v4);
  }

  return v5;
}

- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    v5 = -[HMDAccessory _shouldFilterAccessoryProfileForEntitledClients:](&v7, sel__shouldFilterAccessoryProfileForEntitledClients_, v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (HMDDoorbellChimeProfile)doorbellChimeProfile
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDAccessory accessoryProfiles](self, "accessoryProfiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v6);
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      v9 = v8;

      if (v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return (HMDDoorbellChimeProfile *)v7;
}

- (void)_configureGroupParticipantLocalDataStorageWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (isFeatureHomeTheaterQFAEnabledForTests
      && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v4, "homeManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](self, "msgDispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaGroupParticipantDataLocalStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v4 && v6 && v7)
      {
        objc_msgSend(v7, "configureWithHome:messageDispatcher:", v4, v6);
      }
      else
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138544386;
          v18 = v16;
          v19 = 2112;
          v20 = v4;
          v21 = 2112;
          v22 = v6;
          v23 = 2112;
          v24 = v8;
          v25 = 2112;
          v26 = v5;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to configure groups participant local data storage with dependencies home: %@ messageDispatcher: %@ dataStorage: %@ homeManager: %@", (uint8_t *)&v17, 0x34u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
  }

}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
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
  HMDDoorbellChimeProfile *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  HMDAppleMediaAccessory *v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  HMDAccessorySettingsController *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  HMDAccessorySettingsController *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMDDevice *device;
  void *v58;
  void (**v59)(void);
  void *v60;
  uint64_t v61;
  id v62;
  _QWORD *v63;
  NSObject *logger;
  NSObject *v65;
  void *v66;
  void *v67;
  HMDDeviceController *deviceController;
  void *v69;
  void *v70;
  HMDAppleMediaAccessory *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  HMDDeviceController *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  HMDAppleMediaAccessory *v89;
  void *v90;
  void *v91;
  void *v92;
  HMDAppleMediaAccessory *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  _QWORD *v104;
  void *v105;
  void *v106;
  HMDTargetControlManager *v107;
  void *v108;
  void *v109;
  HMDAppleMediaAccessoryMetricsDispatcher *v110;
  void *v111;
  void *v112;
  HMDAppleMediaAccessoryMetricsDispatcher *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  HMDLegacyAccessorySettingsAdaptor *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  HMDLegacyAccessorySettingsAdaptor *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  NSObject *v132;
  id v133;
  id v134;
  void *v135;
  NSObject *v136;
  void *v137;
  _BOOL4 v138;
  _QWORD v139[5];
  id v140;
  NSObject *v141;
  uint64_t v142;
  BOOL v143;
  _QWORD block[5];
  objc_super v145;
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  const __CFString *v149;
  __int16 v150;
  const __CFString *v151;
  __int16 v152;
  const __CFString *v153;
  __int16 v154;
  const __CFString *v155;
  __int16 v156;
  const __CFString *v157;
  __int16 v158;
  void *v159;
  __int16 v160;
  const __CFString *v161;
  __int16 v162;
  void *v163;
  __int16 v164;
  const __CFString *v165;
  __int16 v166;
  void *v167;
  uint64_t v168;

  v6 = a6;
  v168 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = HMFUptime();
  v15 = v14;
  v138 = v6;
  v136 = v12;
  if (v6)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0](v13);
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](v17, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      v147 = v19;
      v148 = 2114;
      v149 = CFSTR("accessoryConfigureStart");
      v150 = 2112;
      v151 = CFSTR("Configuring accessory");
      v152 = 2114;
      v153 = CFSTR("state");
      v154 = 2112;
      v155 = CFSTR("start");
      v156 = 2114;
      v157 = CFSTR("homeUUID");
      v158 = 2112;
      v159 = v20;
      v160 = 2114;
      v161 = CFSTR("accessoryUUID");
      v162 = 2112;
      v163 = v21;
      v164 = 2114;
      v165 = CFSTR("initialConfig");
      v166 = 2112;
      v167 = v22;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0D334C8]);
    objc_msgSend(v10, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](v17, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v24, "initWithTag:data:", CFSTR("accessoryConfigureStart"), v28, CFSTR("state"), CFSTR("start"), CFSTR("homeUUID"), v25, CFSTR("accessoryUUID"), v26, CFSTR("initialConfig"), v27);
    objc_msgSend(MEMORY[0x1E0D28540], "currentTagProcessorList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitTaggedEvent:processorList:", v29, v30);

    v12 = v136;
  }
  objc_msgSend(v10, "homeManager");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    dispatch_group_enter(v12);
  if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
  {
    v31 = -[HMDDoorbellChimeProfile initWithAppleMediaAccessory:]([HMDDoorbellChimeProfile alloc], "initWithAppleMediaAccessory:", self);
    -[NSMutableSet addObject:](self->super.super._accessoryProfiles, "addObject:", v31);

  }
  v145.receiver = self;
  v145.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory configureWithHome:msgDispatcher:configurationTracker:initialConfiguration:](&v145, sel_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration_, v10, v11, v12, v138);
  -[HMDAppleMediaAccessory configureAppleMediaAccessoryMessengerWithFactory:](self, "configureAppleMediaAccessoryMessengerWithFactory:", self);
  objc_msgSend(v10, "wifiManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setWifiManager:](self, "setWifiManager:", v32);

  -[HMDAppleMediaAccessory dependencyFactory](self, "dependencyFactory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "darwinNotificationProviderForAccessory:", self);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setDarwinNotificationProvider:](self, "setDarwinNotificationProvider:", v34);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("mi.hh2"));

  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory settingsController](v38, "settingsController");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v147 = v40;
    v148 = 2112;
    v149 = v41;
    v150 = 2112;
    v151 = v42;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@hh2SettingsMigrationEnabled: %@, self.settingsController: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v37);
  if ((v36 & 1) == 0)
  {
    -[HMDAppleMediaAccessory settingsController](v38, "settingsController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      v44 = [HMDAccessorySettingsController alloc];
      -[HMDAccessory workQueue](v38, "workQueue");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](v38, "uuid");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *MEMORY[0x1E0CB7E18];
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:](v44, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:", v45, v38, v38, v46, v47, v48);
      -[HMDAppleMediaAccessory setSettingsController:](v38, "setSettingsController:", v49);

    }
  }
  -[HMDAppleMediaAccessory remoteLoginHandler](v38, "remoteLoginHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory workQueue](v38, "workQueue");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventStoreReadHandle](v38, "eventStoreReadHandle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventForwarder](v38, "eventForwarder");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "configureWithWorkQueue:messageDispatcher:eventStoreReadHandle:eventForwarder:", v51, v11, v52, v53);

  -[HMDAppleMediaAccessory dependencyFactory](v38, "dependencyFactory");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "symptomsHandlerForAccessory:", v38);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory setSymptomsHandler:](v38, "setSymptomsHandler:", v55);

  -[HMDAppleMediaAccessory symptomsHandler](v38, "symptomsHandler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "configure");

  -[HMDAppleMediaAccessory configureAudioDestinationManager](v38, "configureAudioDestinationManager");
  device = v38->_device;
  v38->_device = 0;

  -[HMDAccessory identifier](v38, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory deviceMediaRouteIdentifierFactory](v38, "deviceMediaRouteIdentifierFactory");
  v59 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v59[2]();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = objc_msgSend(v58, "isEqual:", v60);

  v61 = MEMORY[0x1E0C809B0];
  v62 = v11;
  v63 = (_QWORD *)&unk_1CDB8E000;
  v135 = v62;
  if (!(_DWORD)v53)
  {
    -[HMDAppleMediaAccessory startMonitoringReachability](v38, "startMonitoringReachability");
    -[HMDAppleMediaAccessory createAccessoryInfoSubscriberIfNecessary](v38, "createAccessoryInfoSubscriberIfNecessary");
    __bootstrapSupportedStereoPairVersions(v38);
    goto LABEL_50;
  }
  logger = v38->_logger;
  if (os_signpost_enabled(logger))
  {
    v65 = logger;
    -[HMDAccessory uuid](v38, "uuid");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v147 = v66;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v65, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", "accessoryUUID=%{signpost.description:attribute}@ ", buf, 0xCu);

  }
  -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessoryCurrentAccessoryAddedNotification"), v38);

  -[HMDAppleMediaAccessory registerForDarwinNotificationsOnCurrentAccessory](v38, "registerForDarwinNotificationsOnCurrentAccessory");
  deviceController = v38->_deviceController;
  if (!deviceController
    || (-[HMDDeviceController identifier](deviceController, "identifier"),
        v69 = (void *)objc_claimAutoreleasedReturnValue(),
        v69,
        v69))
  {
    v70 = (void *)MEMORY[0x1D17BA0A0]();
    v71 = v38;
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v147 = v73;
      _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_INFO, "%{public}@Setting up device controller for ourselves", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v70);
    -[HMDAppleMediaAccessory dependencyFactory](v71, "dependencyFactory");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "deviceController");
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v38->_deviceController;
    v38->_deviceController = (HMDDeviceController *)v75;

  }
  objc_msgSend(v137, "softwareUpdateManager");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setAccessory:", v38);

  -[HMDAppleMediaAccessory dependencyFactory](v38, "dependencyFactory");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "accountManagerForAccessory:", v38);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "device");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    if (-[HMDAppleMediaAccessory shouldUpdateWithDevice:initialConfiguration:](v38, "shouldUpdateWithDevice:initialConfiguration:", v80, v138))
    {
      -[HMDAppleMediaAccessory updateWithDevice:](v38, "updateWithDevice:", v80);
    }
    -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "removeObserver:name:object:", v38, CFSTR("HMDDeviceUpdatedNotification"), 0);

    -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addObserver:selector:name:object:", v38, sel_handleCurrentDeviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), v80);

    -[HMDAppleMediaAccessory remoteLoginHandler](v38, "remoteLoginHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "_registerForUsernameUpdates");

    objc_msgSend(v80, "rpIdentity");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "deviceIRK");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "data");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
      -[HMDAppleMediaAccessory postDeviceIRKIfDifferent:](v38, "postDeviceIRKIfDifferent:", v86);

  }
  -[HMDAppleMediaAccessory pairingIdentity](v38, "pairingIdentity");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v61;
  v89 = v38;
  if (!v87)
    goto LABEL_36;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v38, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory pairingIdentity](v38, "pairingIdentity");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "privateKey");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v91)
    {
      v92 = (void *)MEMORY[0x1D17BA0A0]();
      v93 = v38;
      HMFGetOSLogHandle();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v147 = v95;
        _os_log_impl(&dword_1CD062000, v94, OS_LOG_TYPE_DEFAULT, "%{public}@Don't have private info recreate pairing identity", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v92);
      v89 = v93;
LABEL_36:
      -[HMDAppleMediaAccessory createPairingIdentity](v89, "createPairingIdentity");
      goto LABEL_37;
    }
  }
  -[HMDAppleMediaAccessory _fixCloudKeyIfNeeded](v38, "_fixCloudKeyIfNeeded");
LABEL_37:
  -[HMDAppleMediaAccessory updateProductInformation](v38, "updateProductInformation");
  -[HMDAppleMediaAccessory softwareVersion](v38, "softwareVersion");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "softwareVersion");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = HMFEqualObjects();

  if ((v99 & 1) == 0)
  {
    -[HMDAccessory workQueue](v38, "workQueue");
    v100 = objc_claimAutoreleasedReturnValue();
    block[0] = v88;
    block[1] = 3221225472;
    block[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v38;
    dispatch_async(v100, block);

  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "productClass");

    if (v102 == 6)
    {
      -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = (_QWORD *)MEMORY[0x1E0D28538];
      objc_msgSend(v103, "removeObserver:name:object:", v38, *MEMORY[0x1E0D28538], 0);

      -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObserver:selector:name:object:", v38, sel_handleCurrentNetworkChangedNotification_, *v104, 0);

      -[HMDAppleMediaAccessory updateWiFiNetworkInfo](v38, "updateWiFiNetworkInfo");
    }
  }
  if (-[HMDAppleMediaAccessory supportsTargetControl](v38, "supportsTargetControl"))
  {
    -[HMDAppleMediaAccessory targetControlManager](v38, "targetControlManager");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v106)
    {
      v107 = -[HMDTargetControlManager initWithTargetAccessory:controllers:]([HMDTargetControlManager alloc], "initWithTargetAccessory:controllers:", v38, 0);
      -[HMDAppleMediaAccessory setTargetControlManager:](v38, "setTargetControlManager:", v107);

    }
  }
  -[HMDAppleMediaAccessory _fetchMultiUserLanguages](v38, "_fetchMultiUserLanguages");
  -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "removeObserver:name:object:", v38, CFSTR("HMDHomeUserRemovedNotification"), 0);

  -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "addObserver:selector:name:object:", v38, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v10);

  v110 = [HMDAppleMediaAccessoryMetricsDispatcher alloc];
  objc_msgSend(v10, "logEventSubmitter");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dailyScheduler");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = -[HMDAppleMediaAccessoryMetricsDispatcher initWithDataSource:logEventSubmitter:dailyScheduler:](v110, "initWithDataSource:logEventSubmitter:dailyScheduler:", v38, v111, v112);
  -[HMDAppleMediaAccessory setMetricsDispatcher:](v38, "setMetricsDispatcher:", v113);

  -[HMDAppleMediaAccessory metricsDispatcher](v38, "metricsDispatcher");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "registerForDailySetRoomLogEvents");

  v63 = &unk_1CDB8E000;
  if ((objc_msgSend(v10, "isMultiUserEnabled") & 1) == 0)
    objc_msgSend(v10, "enableMultiUser");
  -[HMDMediaAccessory notificationCenter](v38, "notificationCenter");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "addObserver:selector:name:object:", v38, sel_handleCurrentDeviceIRKUpdated_, CFSTR("HMDAppleAccountManagerFetchedCurrentDeviceIRK"), 0);

  v116 = v38->_logger;
  v61 = v88;
  if (os_signpost_enabled(v116))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", ", buf, 2u);
  }

LABEL_50:
  if (_os_feature_enabled_impl()
    && -[HMDAppleMediaAccessory isCurrentAccessory](v38, "isCurrentAccessory"))
  {
    v117 = [HMDLegacyAccessorySettingsAdaptor alloc];
    -[HMDAccessory workQueue](v38, "workQueue");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](v38, "uuid");
    v134 = v10;
    v120 = v61;
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory currentAccessorySettingsController](v38, "currentAccessorySettingsController");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "localOnlySubscriptionProvider");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = -[HMDLegacyAccessorySettingsAdaptor initWithQueue:homeUUID:accessoryUUID:settingsController:subscriptionProvider:](v117, "initWithQueue:homeUUID:accessoryUUID:settingsController:subscriptionProvider:", v118, v119, v121, v122, v123);

    v61 = v120;
    v10 = v134;
    v63 = (_QWORD *)&unk_1CDB8E000;

    -[HMDLegacyAccessorySettingsAdaptor startup](v124, "startup");
  }
  else
  {
    v124 = 0;
  }
  -[HMDAppleMediaAccessory settingsController](v38, "settingsController");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "configureIsSettingOwner:home:legacySettingsAdaptor:", -[HMDAppleMediaAccessory isCurrentAccessory](v38, "isCurrentAccessory"), v10, v124);

  -[HMDAppleMediaAccessory settingsController](v38, "settingsController");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "messageHandler");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "configureWithMessageDispatcher:home:", v135, v10);

  -[HMDAppleMediaAccessory sleepWakeStateController](v38, "sleepWakeStateController");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](v38, "home");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory workQueue](v38, "workQueue");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "configureWithHome:messageDispatcher:workQueue:", v129, v135, v130);

  -[HMDAppleMediaAccessory registerForPublishingNotifications](v38, "registerForPublishingNotifications");
  -[HMDAppleMediaAccessory _configureGroupParticipantLocalDataStorageWithHome:](v38, "_configureGroupParticipantLocalDataStorageWithHome:", v10);
  -[HMDAppleMediaAccessory createOrUpdateSoftwareUpdateEventProviderIfNecessary](v38, "createOrUpdateSoftwareUpdateEventProviderIfNecessary");
  -[HMDAppleMediaAccessory createSoftwareUpdateEventListenerIfNecessary](v38, "createSoftwareUpdateEventListenerIfNecessary");
  -[HMDDeviceController setDelegate:](v38->_deviceController, "setDelegate:", v38);
  -[HMDAccessory workQueue](v38, "workQueue");
  v131 = objc_claimAutoreleasedReturnValue();
  v139[0] = v61;
  v139[1] = v63[202];
  v139[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_244;
  v139[3] = &unk_1E89B0EC8;
  v143 = v138;
  v142 = v15;
  v139[4] = v38;
  v140 = v10;
  v141 = v136;
  v132 = v136;
  v133 = v10;
  dispatch_async(v131, v139);

}

- (void)updateProductInformation
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDAppleMediaAccessory *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating Product Information", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v4, "transactionWithObjectChangeType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = +[HMDDeviceCapabilities supportsStereoPairingV1](HMDDeviceCapabilities, "supportsStereoPairingV1");
  if (+[HMDDeviceCapabilities supportsStereoPairingV2](HMDDeviceCapabilities, "supportsStereoPairingV2"))
    v10 |= 2uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV3](HMDDeviceCapabilities, "supportsStereoPairingV3"))
    v10 |= 4uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV4](HMDDeviceCapabilities, "supportsStereoPairingV4"))
    v11 = v10 | 8;
  else
    v11 = v10;
  v12 = -[HMDAppleMediaAccessory supportedStereoPairVersions](v4, "supportedStereoPairVersions");
  if (v12 != v11)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v4;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v16;
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating supported stereo pair versions to: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedStereoPairVersions:", v18);

  }
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "productClass");

  if (v20 == 6
    && (objc_msgSend(MEMORY[0x1E0D28690], "productInfo"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "productColor"),
        v21,
        -[HMDAppleMediaAccessory productColor](v4, "productColor") != v22))
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v4;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMFProductColorToString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating product color to: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProductColor:", v28);

  }
  else if (v12 == v11)
  {
    goto LABEL_25;
  }
  -[HMDAccessory home](v4, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "backingStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "transaction:options:", CFSTR("Update Product Information"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "add:withMessage:", v9, 0);
  objc_msgSend(v32, "run");

LABEL_25:
}

- (BOOL)isHomePod
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessory category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

  return v4;
}

- (BOOL)isAppleTV
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessory category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A18]);

  return v4;
}

- (BOOL)isDoorbellChimeSettingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_254_92274);

  return v5;
}

- (NSUUID)sensorAccessoryUUID
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessory sensorManager](self, "sensorManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorAccessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (HMMediaDestinationControllerData)audioDestinationControllerData
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
  {
    -[HMDAppleMediaAccessory dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "destinationControllerDataForAppleMediaAccessory:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination data due to no data source", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v5 = 0;
    }

    return (HMMediaDestinationControllerData *)v5;
  }
  else
  {
    -[HMDAppleMediaAccessory legacyAudioDestinationControllerData](self, "legacyAudioDestinationControllerData");
    return (HMMediaDestinationControllerData *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)legacyAudioDestinationControllerData
{
  void *v3;
  void *v4;
  HMMediaDestinationControllerData *v5;

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (HMMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (id)committedAudioDestinationControllerData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!isFeatureHomeTheaterQFAEnabledForTests
    || (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyCommittedAudioDestinationControllerData](self, "legacyCommittedAudioDestinationControllerData");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v6;
    return v5;
  }
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)legacyCommittedAudioDestinationControllerData
{
  void *v3;
  void *v4;
  HMMediaDestinationControllerData *v5;

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "committedData");
    v5 = (HMMediaDestinationControllerData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (void)unsetAudioDestinationControllerData
{
  HMMediaDestinationControllerData *committedAudioDestinationControllerData;

  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestinationControllerData = self->_committedAudioDestinationControllerData;
  self->_committedAudioDestinationControllerData = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)mergeAudioDestinationControllerData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mergeData:", v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v10;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination controller with data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory msgDispatcher](v8, "msgDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaAccessory notificationCenter](v8, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory backingStore](v8, "backingStore");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v11 && v12 && v14)
    {
      -[HMDAppleMediaAccessory mediaDestinationControllerFactory](v8, "mediaDestinationControllerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventSubmitter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dailyScheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory");
      objc_msgSend(v16, "mediaDestinationControllerWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v4, v15, v12, v13, v17, v18, v25, v8, v8);
      v26 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationController:](v8, "setAudioDestinationController:", v19);

      -[HMDAppleMediaAccessory audioDestinationController](v8, "audioDestinationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "configureWithHome:", v11);

      v13 = v26;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v24;
        v29 = 2112;
        v30 = v11;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination due to no home: %@ messageDispatcher: %@ backing store: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
}

- (void)configureAudioDestinationController
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CB7A18]);

  if (v5)
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "parentIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDAccessory uuid](self, "uuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      -[HMDAccessory home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring audio destination controller with data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDAppleMediaAccessory mediaDestinationControllerFactory](v13, "mediaDestinationControllerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](v13, "backingStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](v13, "msgDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](v13, "notificationCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventSubmitter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dailyScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = -[HMDAppleMediaAccessory isCurrentAccessory](v13, "isCurrentAccessory");
      objc_msgSend(v16, "mediaDestinationControllerWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v7, v17, v18, v19, v20, v21, v24, v13, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationController:](v13, "setAudioDestinationController:", v22);

      -[HMDAppleMediaAccessory audioDestinationController](v13, "audioDestinationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "configureWithHome:", v11);

      -[HMDAppleMediaAccessory migrateLocalParticipantData](v13, "migrateLocalParticipantData");
    }
    else
    {
      -[HMDAppleMediaAccessory createAudioDestinationController](self, "createAudioDestinationController");
    }

  }
}

- (void)createAudioDestinationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDAppleMediaAccessory *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationControllerCreation](HMDDeviceCapabilities, "supportsAudioDestinationControllerCreation"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("EE041E8C-28B9-4250-B2E2-0C032BDDDF1A"));
      v4 = (void *)MEMORY[0x1E0CB3A28];
      -[HMDAccessory uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v12;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with identifier: %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      if (isFeatureHomeTheaterQFAEnabledForTests
        && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
      {
        -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](v10, "mediaGroupParticipantDataLocalStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "participantData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "destinationControllerData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = v10;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138543618;
            v33 = v19;
            v34 = 2112;
            v35 = v15;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination controller data: %@", (uint8_t *)&v32, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
        }
        v20 = objc_alloc(MEMORY[0x1E0CBA610]);
        -[HMDAccessory uuid](v10, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions");
        v23 = (void *)objc_msgSend(v20, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v8, v21, 0, v22, MEMORY[0x1E0C9AA60]);

        objc_msgSend(v13, "updateDestinationControllerData:", v23);
        -[HMDAppleMediaAccessory mergeAudioDestinationControllerData:](v10, "mergeAudioDestinationControllerData:", v23);

      }
      else
      {
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = v10;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        -[HMDAppleMediaAccessory legacyCreateAudioDestinationControllerWithControllerIdentifier:](v29, "legacyCreateAudioDestinationControllerWithControllerIdentifier:", v8);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping audio destination controller creation due to device does not support home theater", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }
  }
}

- (void)legacyCreateAudioDestinationControllerWithControllerIdentifier:(id)a3
{
  id v4;
  HMDMediaDestinationControllerModel *v5;
  void *v6;
  HMDMediaDestinationControllerModel *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = [HMDMediaDestinationControllerModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v4, v6);

  -[HMDMediaDestinationControllerModel setAvailableDestinationModelIdentifiers:](v7, "setAvailableDestinationModelIdentifiers:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerModel setSupportedOptions:](v7, "setSupportedOptions:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke;
  v9[3] = &unk_1E89C2350;
  v9[4] = self;
  -[HMDAccessory runTransactionWithModel:label:completion:](self, "runTransactionWithModel:label:completion:", v7, CFSTR("Create audio destination controller"), v9);

}

- (id)committedAudioDestination
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!isFeatureHomeTheaterQFAEnabledForTests
    || (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    -[HMDAppleMediaAccessory legacyCommittedAudioDestination](self, "legacyCommittedAudioDestination");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v6;
    return v5;
  }
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)legacyCommittedAudioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;

  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "committedDestination");
    v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (HMMediaDestination)audioDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
  {
    -[HMDAppleMediaAccessory dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "destinationForAppleMediaAccessory:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination due to no data source", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v5 = 0;
    }

    return (HMMediaDestination *)v5;
  }
  else
  {
    -[HMDAppleMediaAccessory legacyAudioDestination](self, "legacyAudioDestination");
    return (HMMediaDestination *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)legacyAudioDestination
{
  void *v3;
  void *v4;
  HMMediaDestination *v5;

  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "destination");
    v5 = (HMMediaDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (void)unsetAudioDestination
{
  HMMediaDestination *committedAudioDestination;

  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestination = self->_committedAudioDestination;
  self->_committedAudioDestination = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)mergeAudioDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mergeDestination:", v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory msgDispatcher](v8, "msgDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaAccessory notificationCenter](v8, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory backingStore](v8, "backingStore");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v11 && v12 && v14)
    {
      -[HMDAppleMediaAccessory mediaDestinationManagerFactory](v8, "mediaDestinationManagerFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v4, v12, v13, v15, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"), v8, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationManager:](v8, "setAudioDestinationManager:", v17);

      -[HMDAppleMediaAccessory audioDestinationManager](v8, "audioDestinationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configureWithHome:currentAccessory:", v11, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"));

      -[HMDAppleMediaAccessory audioDestinationManager](v8, "audioDestinationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "messageHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleUpdatedDestination:", v4);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v8;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v26 = v24;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination manager due to no home: %@ messageDispatcher: %@ backing store: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
}

- (void)configureAudioDestinationManager
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
  {
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13
      && (objc_msgSend(v13, "parentIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDAccessory uuid](self, "uuid"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4),
          v4,
          v3,
          (v5 & 1) != 0))
    {
      -[HMDAppleMediaAccessory mediaDestinationManagerFactory](self, "mediaDestinationManagerFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](self, "msgDispatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](self, "backingStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v13, v7, v8, v9, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"), self, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setAudioDestinationManager:](self, "setAudioDestinationManager:", v10);

      -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configureWithHome:currentAccessory:", v12, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"));

      -[HMDAppleMediaAccessory migrateLocalParticipantData](self, "migrateLocalParticipantData");
    }
    else
    {
      -[HMDAppleMediaAccessory createAudioDestination](self, "createAudioDestination");
    }

  }
}

- (void)migrateLocalParticipantData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue")
    && -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "migrateWithExpectedDestinationControllerSupportOptions:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));

    }
    -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](self, "mediaGroupParticipantDataLocalStorage");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "migrateWithExpectedDestinationSupportOptions:", -[HMDAppleMediaAccessory expectedDestinationSupportOptions](self, "expectedDestinationSupportOptions"));

    }
  }
}

- (unint64_t)expectedDestinationSupportOptions
{
  if (-[HMDAppleMediaAccessory isHomePodMini](self, "isHomePodMini"))
    return 36;
  if (-[HMDAppleMediaAccessory isHomePod2ndGen](self, "isHomePod2ndGen"))
    return 192;
  return 17;
}

- (void)createAudioDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAppleMediaAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDAppleMediaAccessory *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationCreation](HMDDeviceCapabilities, "supportsAudioDestinationCreation"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5CC65005-CE51-4781-9F78-3429557B6FD4"));
      v4 = (void *)MEMORY[0x1E0CB3A28];
      -[HMDAccessory uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = -[HMDAppleMediaAccessory expectedDestinationSupportOptions](self, "expectedDestinationSupportOptions");
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationSupportOptionsAsString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543874;
        v35 = v13;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v14;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination with identifier: %@ supportedOptions: %@", (uint8_t *)&v34, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      if (isFeatureHomeTheaterQFAEnabledForTests
        && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
      {
        -[HMDAppleMediaAccessory mediaGroupParticipantDataLocalStorage](v11, "mediaGroupParticipantDataLocalStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "participantData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "destination");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = v11;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543618;
            v35 = v21;
            v36 = 2112;
            v37 = v17;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination: %@", (uint8_t *)&v34, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
        }
        v22 = objc_alloc(MEMORY[0x1E0CBA600]);
        -[HMDAccessory uuid](v11, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory defaultAudioGroupIdentifier](v11, "defaultAudioGroupIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v8, v23, v9, v24);

        objc_msgSend(v15, "updateMediaDestination:", v25);
        -[HMDAppleMediaAccessory mergeAudioDestination:](v11, "mergeAudioDestination:", v25);

      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v11;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543362;
          v35 = v33;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v34, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        -[HMDAppleMediaAccessory legacyCreateAudioDestinationWithIdentifier:supportedOptions:](v31, "legacyCreateAudioDestinationWithIdentifier:supportedOptions:", v8, v9);
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v29;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Skipping creating audio destination manager for unsupported device", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }
  }
}

- (id)defaultAudioGroupIdentifier
{
  return 0;
}

- (void)legacyCreateAudioDestinationWithIdentifier:(id)a3 supportedOptions:(unint64_t)a4
{
  id v6;
  HMDMediaDestinationModel *v7;
  void *v8;
  HMDMediaDestinationModel *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a3;
  v7 = [HMDMediaDestinationModel alloc];
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationModel setSupportedOptions:](v9, "setSupportedOptions:", v10);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke;
  v11[3] = &unk_1E89C2350;
  v11[4] = self;
  -[HMDAccessory runTransactionWithModel:label:completion:](self, "runTransactionWithModel:label:completion:", v9, CFSTR("Create audio destination"), v11);

}

- (id)mediaGroupParticipantDataLocalStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaGroupParticipantDataLocalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups participant data local storage due to dependencies home: %@ homeManager: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6;
}

- (void)removeAudioDestination
{
  void *v3;
  void *v4;
  HMDAppleMediaAccessory *v5;
  NSObject *v6;
  void *v7;
  HMDMediaDestinationModel *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v7;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    if (v3)
    {
      v8 = -[HMDMediaDestinationModel initWithDestination:changeType:]([HMDMediaDestinationModel alloc], "initWithDestination:changeType:", v3, 3);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke;
      v13[3] = &unk_1E89C2350;
      v13[4] = v5;
      -[HMDAccessory runTransactionWithModel:label:completion:](v5, "runTransactionWithModel:label:completion:", v8, CFSTR("Remove audio destination"), v13);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping removing audio destination due to non-current device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

- (id)_createMediaProfile
{
  return -[HMDMediaProfile initWithAccessory:]([HMDAppleMediaProfile alloc], "initWithAccessory:", self);
}

- (void)_fetchMultiUserLanguages
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HMDAppleMediaAccessory *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching multi-user languages.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessory settingsConnectionFactory](v4, "settingsConnectionFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke;
  v10[3] = &unk_1E89C0D18;
  v11 = v8;
  v12 = v4;
  v9 = v8;
  objc_msgSend(v9, "fetchSupportedMultiUserLanguageCodes:", v10);

}

- (void)_fixCloudKeyIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
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
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    return;
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      v25 = "%{public}@No pairing identity yet to fix";
LABEL_17:
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, v25, buf, 0xCu);

    }
LABEL_18:

    objc_autoreleasePoolPop(v21);
    return;
  }
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      v25 = "%{public}@Pairing identity can't be used.";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!-[HMDAppleMediaAccessory fixedPairingIdentityInCloud](self, "fixedPairingIdentityInCloud"))
  {
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing pairing identity", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDAppleMediaAccessory pairingIdentity](v10, "pairingIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "publicPairingIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPairingIdentity:", v14);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAppleMediaAccessoryChangeTag:", v16);

      -[HMDAccessory home](v10, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backingStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transaction:options:", CFSTR("Fix Pairing Identity"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "add:", v8);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke;
      v26[3] = &unk_1E89C2350;
      v26[4] = v10;
      objc_msgSend(v20, "run:", v26);

    }
  }
}

- (void)autoConfigureTargetControllers
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAppleMediaAccessory *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessory targetControlManager](self, "targetControlManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory supports target control - adding to all target controllers", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[HMDAccessory home](v33, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v36;
      *(_QWORD *)&v11 = 138544386;
      v27 = v11;
      v28 = *(_QWORD *)v36;
      do
      {
        v14 = 0;
        v29 = v12;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          if (objc_msgSend(v15, "supportsTargetController", v27))
          {
            v16 = (void *)MEMORY[0x1D17BA0A0]();
            v17 = v33;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDMediaAccessory name](v17, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAccessory uuid](v17, "uuid");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "UUIDString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "uuid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "UUIDString");
              v31 = v16;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v27;
              v40 = v19;
              v41 = 2112;
              v42 = v20;
              v43 = 2112;
              v44 = v21;
              v45 = 2112;
              v46 = v22;
              v47 = 2112;
              v48 = v24;
              _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding accessory %@/%@ as a target to the target controller %@/%@", buf, 0x34u);

              v12 = v29;
              v16 = v31;

              v13 = v28;
            }

            objc_autoreleasePoolPop(v16);
            objc_msgSend(v32, "addObject:", v15);
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v12);
    }

    -[HMDAppleMediaAccessory targetControlManager](v33, "targetControlManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTargetControllers:", v32);

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v26;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Attempt to auto-configure target controllers to an accessory with no target control manager", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (HMAccessoryCapabilities)capabilities
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessory device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessoryCapabilities *)v3;
}

- (HMAccessoryCapabilities)capabilitiesInternal
{
  HMAccessoryCapabilities *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_capabilitiesInternal;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setCapabilitiesInternal:(id)a3
{
  HMAccessoryCapabilities *v4;
  HMAccessoryCapabilities *capabilitiesInternal;

  v4 = (HMAccessoryCapabilities *)a3;
  os_unfair_recursive_lock_lock_with_options();
  capabilitiesInternal = self->_capabilitiesInternal;
  self->_capabilitiesInternal = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSData)rawCapabilities
{
  NSData *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_rawCapabilities;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setRawCapabilities:(id)a3
{
  NSData *v4;
  NSData *rawCapabilities;

  v4 = (NSData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  rawCapabilities = self->_rawCapabilities;
  self->_rawCapabilities = v4;

  os_unfair_recursive_lock_unlock();
}

- (unint64_t)homePodVariant
{
  if (-[HMDAppleMediaAccessory isHomePodMini](self, "isHomePodMini"))
    return 2;
  if (-[HMDAppleMediaAccessory isHomePod2ndGen](self, "isHomePod2ndGen"))
    return 3;
  return -[HMDAppleMediaAccessory isHomePod](self, "isHomePod");
}

- (int64_t)productColor
{
  int64_t productColor;

  os_unfair_recursive_lock_lock_with_options();
  productColor = self->_productColor;
  os_unfair_recursive_lock_unlock();
  return productColor;
}

- (void)setProductColor:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_productColor = a3;
  os_unfair_recursive_lock_unlock();
}

- (NSUUID)idsIdentifier
{
  void *v3;
  NSUUID *v4;

  -[HMDAppleMediaAccessory deviceForDirectMessaging](self, "deviceForDirectMessaging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    v4 = self->_idsIdentifier;
    os_unfair_recursive_lock_unlock();
  }
  return v4;
}

- (id)idsIdentifierInternal
{
  NSUUID *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_idsIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setIdsIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *idsIdentifier;

  v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isCurrentAccessory
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  BOOL v10;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory deviceMediaRouteIdentifierFactory](self, "deviceMediaRouteIdentifierFactory");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v3 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (!objc_msgSend(v6, "isEqualToString:", v5))
    {
      v10 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_9:
    v9 = objc_msgSend(v3, "isCurrentDevice");
    goto LABEL_10;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", v5);
LABEL_10:
  v10 = v9;
LABEL_12:

  return v10;
}

- (BOOL)supportsTargetControl
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsTargetControl");

  return v4;
}

- (BOOL)supportsMultiUser
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMultiUser");

  return v4;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsHomeLevelLocationServiceSetting");

  return v4;
}

- (BOOL)legacyLocationServicesEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_273);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_276);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = objc_msgSend(v11, "BOOLValue");
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get location service enabled value due to unknown class for value: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)supportsAudioReturnChannel
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAudioReturnChannel");

  return v4;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCompanionInitiatedRestart");

  return v4;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCompanionInitiatedObliterate");

  return v4;
}

- (BOOL)supportsMusicAlarm
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMusicAlarm");

  return v4;
}

- (BOOL)supportsThirdPartyMusic
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsThirdPartyMusic") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsThirdPartyMusic");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsPreferredMediaUser
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPreferredMediaUser");

  return v4;
}

- (BOOL)supportsDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsUserMediaSettings
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsUserMediaSettings") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsUserMediaSettings");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsCoordinationDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsCoordinationDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsCoordinationFreeDoorbellChime") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsCoordinationFreeDoorbellChime");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  void *v2;
  _BOOL4 v4;
  char v5;
  void *v6;

  v4 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v4)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "supportsTVOSUpdateManualUpdateAvailableNotification") & 1) != 0)
    {
      v5 = 1;
LABEL_5:

      return v5;
    }
  }
  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "supportsTVOSUpdateManualUpdateAvailableNotification");

  if (v4)
    goto LABEL_5;
  return v5;
}

- (BOOL)supportsAnnounce
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAnnounce");

  return v4;
}

- (BOOL)supportsMediaActions
{
  void *v3;
  char v4;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  else
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMediaActions");

  return v4;
}

- (BOOL)supportsManagedConfigurationProfile
{
  void *v2;
  char v3;

  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsManagedConfigurationProfile");

  return v3;
}

- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor
{
  return 0;
}

- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress
{
  return 0;
}

- (BOOL)supportsMediaContentProfile
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[HMDAccessory category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "supportsLoreto");

  return v5 & ~(_BYTE)v3;
}

- (BOOL)supportsMessagedHomePodSettings
{
  void *v2;
  char v3;

  -[HMDAppleMediaAccessory capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsMessagedHomePodSettings"))
    v3 = _os_feature_enabled_impl();
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportsRMVonAppleTV
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsRMVonAppleTV");

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsRMVonAppleTV");

    if (!v7)
      return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)supportsJustSiri
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsJustSiri");

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {
    -[HMDAppleMediaAccessory capabilities](self, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsJustSiri");

    if (!v7)
      return 0;
  }
  return _os_feature_enabled_impl();
}

- (BOOL)supportsSoftwareUpdateV2
{
  return 0;
}

- (BOOL)isHomePodMini
{
  return 0;
}

- (BOOL)isHomePod2ndGen
{
  return 0;
}

- (HMDDevice)device
{
  void *v2;
  void *v3;

  __HMDAppleMediaAccessoryGetDeviceController(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (HMDMessageRouter)messageRouter
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessory messenger](self, "messenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "router");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDMessageRouter *)v3;
}

- (void)setDeviceController:(id)a3
{
  HMDDeviceController *v4;
  HMDDeviceController *deviceController;

  v4 = (HMDDeviceController *)a3;
  os_unfair_recursive_lock_lock_with_options();
  deviceController = self->_deviceController;
  self->_deviceController = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)updateWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138543618;
      v44 = v8;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with device: %@", (uint8_t *)&v43, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v6, "transactionWithObjectChangeType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDeviceUUID:", v13);

      objc_msgSend(v11, "setDevice:", v4);
      v14 = (void *)MEMORY[0x1E0CBA1D8];
      objc_msgSend(v4, "productInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "categoryForProductInfo:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HMDAccessory category](v6, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = HMFEqualObjects();

        if ((v18 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CBA1D8], "categoryIdentifierForCategory:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAccessoryCategory:", v19);

        }
      }
      -[HMDAccessory manufacturer](v6, "manufacturer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = HMFEqualObjects();

      if ((v21 & 1) == 0)
        objc_msgSend(v11, "setManufacturer:", CFSTR("Apple Inc."));
      objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "model");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "regionInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(v24, "appendString:", v26);
        -[HMDAccessory model](v6, "model");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v24, "isEqual:", v27);

        if ((v28 & 1) == 0)
          objc_msgSend(v11, "setModel:", v24);

      }
      objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serialNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[HMDAccessory serialNumber](v6, "serialNumber");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        if ((v32 & 1) == 0)
          objc_msgSend(v11, "setSerialNumber:", v30);
      }

      objc_msgSend(v4, "productInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        objc_msgSend(v33, "softwareVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          -[HMDAccessory firmwareVersion](v6, "firmwareVersion");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v35, "isEqual:", v36);

          if ((v37 & 1) == 0)
          {
            objc_msgSend(v35, "versionString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setFirmwareVersion:", v38);

          }
        }

      }
      -[HMDAccessory home](v6, "home");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "backingStore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "transaction:options:", CFSTR("updateWithDevice"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "add:withMessage:", v11, 0);
      objc_msgSend(v42, "run");

    }
  }

}

- (BOOL)shouldUpdateWithDevice:(id)a3 initialConfiguration:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;
  void *v35;
  HMDAppleMediaAccessory *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  HMDAppleMediaAccessory *v40;
  HMDAppleMediaAccessory *v41;
  HMDAppleMediaAccessory *v43;
  int v44;
  void *v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDAppleMediaAccessory device](self, "device");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6 && !v4 || !HMFEqualObjects())
    goto LABEL_26;
  objc_msgSend(v6, "productInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "productInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
    {
LABEL_26:
      v34 = 1;
      goto LABEL_27;
    }
    -[HMDAccessory manufacturer](self, "manufacturer");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_22;
    v13 = (void *)v12;
    -[HMDAccessory model](self, "model");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HMDAccessory serialNumber](self, "serialNumber");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HMDAccessory firmwareVersion](self, "firmwareVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          goto LABEL_10;
LABEL_22:
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v41 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543362;
          v45 = v38;
          v39 = "%{public}@Force updating product information";
          goto LABEL_24;
        }
        goto LABEL_25;
      }

    }
    goto LABEL_22;
  }
LABEL_10:
  -[HMDAccessory category](self, "category");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_16;
  v20 = (void *)v19;
  -[HMDAccessory category](self, "category");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CBA1D8];
  objc_msgSend(v6, "productInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "categoryForProductInfo:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "isEqual:", v24);

  if ((v25 & 1) == 0)
  {
LABEL_16:
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v38;
      v39 = "%{public}@Force updating category";
LABEL_24:
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, v39, (uint8_t *)&v44, 0xCu);

    }
LABEL_25:

    objc_autoreleasePoolPop(v35);
    goto LABEL_26;
  }
  objc_msgSend(v6, "capabilities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v38;
      v39 = "%{public}@Force updating capabilities";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  objc_msgSend(v6, "rpIdentity");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v6, "rpIdentity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rpIdentity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v38;
      v39 = "%{public}@Force updating rapport identity";
      goto LABEL_24;
    }
  }
  v34 = 0;
LABEL_27:

  return v34;
}

- (void)handleCurrentDeviceUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v8 = v5;

  if (v8)
  {
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v6)
    {

    }
    else
    {
      v7 = -[HMDAppleMediaAccessory shouldUpdateWithDevice:initialConfiguration:](self, "shouldUpdateWithDevice:initialConfiguration:", v8, 0);

      if (!v7)
        goto LABEL_10;
    }
    -[HMDAppleMediaAccessory updateWithDevice:](self, "updateWithDevice:", v8);
  }
LABEL_10:

}

- (void)handleFetchManagedConfigurationProfiles:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAppleMediaAccessory *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  HMDAppleMediaAccessory *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  void *v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received fetch managed configuration profiles request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory");
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling fetch managed configuration profiles request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v46 = v4;
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "installedProfileIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v11;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v21;
        v59 = 2112;
        v60 = v22;
        v61 = 2112;
        v62 = v17;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetched profile identifiers: %@, %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v24 = v17;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v15, "installedProfileDataWithIdentifier:", v29, v46);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA5F0]), "initWithIdentifier:profileData:", v29, v30);
            objc_msgSend(v23, "addObject:", v31);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v26);
      }

      v32 = (void *)MEMORY[0x1E0CB36F8];
      v33 = (void *)objc_msgSend(v23, "copy");
      v47 = 0;
      objc_msgSend(v32, "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v47;

      if (v34)
      {
        v54 = *MEMORY[0x1E0CB7CC8];
        v55 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v46;
        objc_msgSend(v46, "respondWithPayload:", v36);
      }
      else
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = v19;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v4 = v46;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v45;
          v59 = 2112;
          v60 = v23;
          v61 = 2112;
          v62 = v35;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode profiles %@:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "respondWithError:", v36);
      }

    }
    else
    {
      v38 = (void *)MEMORY[0x1D17BA0A0]();
      v39 = v11;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v41;
        _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to link profile connection", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 14);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v24);
    }

  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v37;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Relaying fetch managed configuration profiles request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke;
    v52[3] = &unk_1E89BFD00;
    v52[4] = v11;
    v53 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v11, "_relayRequestMessage:responseHandler:", v53, v52);

  }
}

- (void)handleRemoveManagedConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received remove managed configuration profile request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB7CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_292;
      v19[3] = &unk_1E89C2350;
      v20 = v4;
      -[HMDAppleMediaAccessory _removeManagedConfigurationProfileWithIdentifier:completion:](v6, "_removeManagedConfigurationProfileWithIdentifier:completion:", v9, v19);
      v10 = v20;
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_1E89BFD00;
    v21[4] = v12;
    v22 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v12, "_relayRequestMessage:responseHandler:", v22, v21);

  }
}

- (void)handleInstallManagedConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received install managed configuration profile request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CB7CC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_293;
      v19[3] = &unk_1E89B86D8;
      v20 = v4;
      -[HMDAppleMediaAccessory _installManagedConfigurationProfileWithData:completion:](v6, "_installManagedConfigurationProfileWithData:completion:", v9, v19);
      v10 = v20;
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@No profile data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_1E89BFD00;
    v21[4] = v12;
    v22 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v12, "_relayRequestMessage:responseHandler:", v22, v21);

  }
}

- (void)_removeManagedConfigurationProfileWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing managed configuration profile: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = v9;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v19 = (void *)v17;
      v7[2](v7, v17);

    }
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil managed configuration profile identifier", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }

}

- (void)_installManagedConfigurationProfileWithData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Installing managed configuration profile", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = v9;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v19 = (void *)v17;
      v7[2](v7, 0, v17);

    }
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Passed nil managed configuration profile data", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }

}

- (void)handleDeviceIsPublishingChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAppleMediaAccessory_handleDeviceIsPublishingChangedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerForPublishingNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HMDDeviceIsPublishingChangedNotification"), 0);

  -[HMDAppleMediaAccessory device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleDeviceIsPublishingChangedNotification_, CFSTR("HMDDeviceIsPublishingChangedNotification"), v6);

  }
  -[HMDAppleMediaAccessory updateReachabilityFromDevicePublishingState](self, "updateReachabilityFromDevicePublishingState");
}

- (void)updateReachabilityFromDevicePublishingState
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Updating reachability to YES as this is the current device", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDAccessory setReachable:](v4, "setReachable:", 1);
  }
  else
  {
    -[HMDAppleMediaAccessory device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      -[HMDAccessory setReachable:](self, "setReachable:", objc_msgSend(v7, "isPublishingOnObservedNetService"));
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Not updating reachability from publishing state as device is nil", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
}

- (BOOL)isDeviceReachable
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_deviceReachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setDeviceReachable:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_deviceReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_deviceReachable = v3;
    os_unfair_recursive_lock_unlock();
    v5 = -[HMDAppleMediaAccessory notifyClientsOfUpdatedAccessoryControllableValue:](self, "notifyClientsOfUpdatedAccessoryControllableValue:", v3);
    if (v3)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0](v5);
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with media accessory due to reachability change.", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDAccessory home](v7, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enableHomeNotificationsForMediaAccessory:", v7);

    }
  }
}

- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory notifyClientsOfUpdatedAccessoryControllableValue:](&v8, sel_notifyClientsOfUpdatedAccessoryControllableValue_);
  if (v3)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("HMDAccessoryNotificationKey");
    v10[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAppleMediaAccessoryDeviceIsReachableNotification"), v6, v7);

  }
}

- (id)deviceMonitor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secureRemoteTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)startMonitoringReachability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAppleMediaAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

  -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

  -[HMDAppleMediaAccessory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleDeviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleDeviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

    -[HMDAppleMediaAccessory deviceMonitor](self, "deviceMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unreachableDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v5);

    -[HMDAppleMediaAccessory setDeviceReachable:](self, "setDeviceReachable:", v10 ^ 1u);
    -[HMDAppleMediaAccessory deviceMonitor](self, "deviceMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startMonitoringDevice:withInitialReachability:forClient:", v5, 0, self);

  }
  -[HMDAppleMediaAccessory device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "isCurrentDevice") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications for media properties directly on the device", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDAccessory home](v15, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enableHomeNotificationsForMediaAccessory:", v15);

  }
}

- (void)handleDeviceIsReachable:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)handleDeviceIsNotReachable:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[HMDAccessory workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)addAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring added advertisement: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)removeAdvertisement:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring removed advertisement: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (BOOL)isRemotelyReachable
{
  BOOL v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_deviceReachable || self->super.super._remotelyReachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setRemotelyReachable:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->super.super._remotelyReachable != v3)
    self->super.super._remotelyReachable = v3;
  os_unfair_recursive_lock_unlock();
}

- (int64_t)reachableTransports
{
  int64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  v3 = -[HMDMediaAccessory reachableTransports](&v5, sel_reachableTransports);
  if (-[HMDAccessory isReachable](self, "isReachable"))
    v3 |= 0x10uLL;
  if (-[HMDAppleMediaAccessory isRemotelyReachable](self, "isRemotelyReachable"))
    return v3 | 8;
  else
    return v3;
}

- (id)runtimeState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory runtimeState](&v9, sel_runtimeState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10 = *MEMORY[0x1E0CB7B88];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAppleMediaAccessory isDeviceReachable](self, "isDeviceReachable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)_handleUpdatedName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory _handleUpdatedName:](&v3, sel__handleUpdatedName_, a3);
}

- (HMFPairingIdentity)pairingIdentity
{
  HMFPairingIdentity *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)notifyFrameworkOfUpdatedPairingIdentity
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D285F8];
  v4 = *MEMORY[0x1E0CB7D78];
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);
  objc_msgSend(v3, "messageWithName:destination:payload:", v4, v7, MEMORY[0x1E0C9AA70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated accessory pairing identity", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAccessory msgDispatcher](v10, "msgDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v8);

}

- (void)_handleTriggerPairingIdentityUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  HMDAppleMediaAccessory *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v4, "respondWithSuccess"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Will trigger notification for updated pairing identity for accessory: %@ with message HMAccessoryPairingIdentityUpdatedNotification", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v6, "notifyFrameworkOfUpdatedPairingIdentity");

}

- (void)setPairingIdentity:(id)a3
{
  HMFPairingIdentity *v4;
  HMFPairingIdentity *pairingIdentity;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v4 = (HMFPairingIdentity *)objc_msgSend(v6, "copy");
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)createPairingIdentity
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *logger;
  _QWORD v19[4];
  id v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Creating pairing identity", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAppleMediaAccessory currentAccessorySetupMetricDispatcher](v7, "currentAccessorySetupMetricDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markSetupBeginStage:error:", 6, 0);

    objc_msgSend(MEMORY[0x1E0D28650], "pairingIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory setLastCreatedPairingIdentity:](v7, "setLastCreatedPairingIdentity:", v11);

    -[HMDAppleMediaAccessory lastCreatedPairingIdentity](v7, "lastCreatedPairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publicPairingIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPairingIdentity:", v13);

    -[HMDAccessory home](v7, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backingStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transaction:options:", CFSTR("Create Pairing Identity"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    logger = v7->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreatePairingIdentity", ", buf, 2u);
    }
    objc_msgSend(v17, "add:", v5);
    objc_initWeak((id *)buf, v7);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__HMDAppleMediaAccessory_createPairingIdentity__block_invoke;
    v19[3] = &unk_1E89B0FB0;
    objc_copyWeak(v20, (id *)buf);
    v20[1] = (id)0xEEEEB0B5B2B2EEEELL;
    objc_msgSend(v17, "run:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak((id *)buf);

  }
}

- (BOOL)supportsUserManagement
{
  return 0;
}

- (void)addUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
}

- (void)removeUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
}

- (void)pairingsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

  }
}

- (BOOL)supportsSettings
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_mediaRouteIdentifier;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productClass");

  if (v6 != 6)
  {
LABEL_5:
    -[HMDAppleMediaAccessory device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "productClass") == 6;

    return v7;
  }
  return 1;
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (v8 && (_os_feature_enabled_impl() & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__HMDAppleMediaAccessory_handleHomeUserRemovedNotification___block_invoke;
    v13[3] = &unk_1E89C2350;
    v14 = v8;
    -[HMDAccessory setDefaultPreferredMediaUserIfRemoved:defaultUser:completion:](v10, "setDefaultPreferredMediaUserIfRemoved:defaultUser:completion:", v14, 0, v13);

  }
}

- (unint64_t)supportedStereoPairVersions
{
  unint64_t supportedStereoPairVersions;

  os_unfair_recursive_lock_lock_with_options();
  supportedStereoPairVersions = self->_supportedStereoPairVersions;
  os_unfair_recursive_lock_unlock();
  return supportedStereoPairVersions;
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_supportedStereoPairVersions != a3)
    self->_supportedStereoPairVersions = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)handleRoomNameChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory handleRoomNameChanged:](&v14, sel_handleRoomNameChanged_, v4);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDAccessory room](self, "room");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (v9)
    {
      if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
      {
        objc_msgSend(v4, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAppleMediaAccessory metricsDispatcher](self, "metricsDispatcher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "submitRoomChangeEvent:previousRoom:", v13, v11);

      }
    }
  }

}

- (void)handleRoomChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory handleRoomChanged:](&v14, sel_handleRoomChanged_, v4);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
    {
LABEL_8:

      goto LABEL_9;
    }
    v10 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");

    if (v10)
    {
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_stringForKey:", CFSTR("kRoomOldNameKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDAppleMediaAccessory metricsDispatcher](self, "metricsDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory room](self, "room");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "submitRoomChangeEvent:previousRoom:", v13, v8);

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)handleCurrentDeviceIRKUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceIRK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAppleMediaAccessory postDeviceIRKIfDifferent:](self, "postDeviceIRKIfDifferent:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@No device IRK in notification", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)postDeviceIRKIfDifferent:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDAppleMediaAccessory *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMDAppleMediaAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAppleMediaAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDAppleMediaAccessory *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v8;
    v48 = 2112;
    v49 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting device IRK: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessory eventForwarder](v6, "eventForwarder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory eventStoreReadHandle](v6, "eventStoreReadHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v4 && v11 && v12 && v10)
  {
    v14 = (void *)MEMORY[0x1E0CBA240];
    v15 = *MEMORY[0x1E0CB7C10];
    -[HMDAccessory uuid](v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topicFromSuffixID:homeUUID:accessoryUUID:", v15, v10, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v17;
    objc_msgSend(v13, "lastEventForTopic:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@No previously cached IRK", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    objc_msgSend(v18, "encodedData");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (!v18 || v23)
    {
      if (v23 && objc_msgSend(v4, "isEqualToData:", v23))
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = v6;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          v48 = 2112;
          v49 = v4;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Skipping posting already cached device IRK: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v37 = v44;
        goto LABEL_25;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = v25;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v28;
        v48 = 2112;
        v49 = v18;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode cached device IRK from event: %@", buf, 0x16u);

        v25 = v43;
      }

      objc_autoreleasePoolPop(v25);
    }
    v38 = objc_alloc(MEMORY[0x1E0D32D38]);
    -[HMDAccessory uuid](v6, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v41 = (void *)objc_msgSend(v38, "initWithSource:cachePolicy:combineType:timestamp:", v40, 2, 2);

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D32D28]), "initWithEventData:metadata:", v4, v41);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke;
    v45[3] = &unk_1E89C2350;
    v45[4] = v6;
    v37 = v44;
    objc_msgSend(v11, "forwardEvent:topic:completion:", v42, v44, v45);

LABEL_25:
    goto LABEL_26;
  }
  v29 = (void *)MEMORY[0x1D17BA0A0]();
  v30 = v6;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v47 = v32;
    v48 = 2112;
    v49 = v4;
    v50 = 2112;
    v51 = v11;
    v52 = 2112;
    v53 = v13;
    v54 = 2112;
    v55 = v10;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to post deviceIRK: %@ due to missing dependencies eventforwarder: %@ event store read handle: %@ homeUUID: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v29);
LABEL_26:

}

- (HMFSoftwareVersion)softwareVersion
{
  HMFSoftwareVersion *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_softwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSoftwareVersion:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_softwareVersion, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessorySoftwareVersionUpdatedNotification"), self);

  }
}

- (void)_updateSoftwareVersion:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "versionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating software version to: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v6, "transactionWithObjectChangeType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "setSoftwareVersion:", v4);
    -[HMDAccessory home](v6, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transaction:options:", CFSTR("Update Software Version"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v12);
    -[HMDAccessory softwareUpdate](v6, "softwareUpdate");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[HMDAccessory softwareUpdate](v6, "softwareUpdate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v4, "isAtLeastVersion:", v20);

      if (v21)
      {
        -[HMDAccessory softwareUpdate](v6, "softwareUpdate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transactionWithObjectChangeType:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setSoftwareVersion:", v4);
        objc_msgSend(v23, "setState:", &unk_1E8B334F8);
        objc_msgSend(v16, "add:", v23);

      }
    }
    objc_msgSend(v16, "run");

  }
}

- (BOOL)supportsSoftwareUpdate
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[HMDAccessory identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_mediaRouteIdentifier;
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "productClass");

    if (v6 == 6)
      return 1;
  }
  else
  {

  }
  return -[HMDAppleMediaAccessory isHomePod](self, "isHomePod");
}

- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  -[HMDAccessory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessory home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transaction:options:", CFSTR("HMDAppleMediaAccessorySoftwareUpdateLabel"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "add:withMessage:", v7, 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HMDAppleMediaAccessory__applySoftwareUpdateModel_completion___block_invoke;
  v14[3] = &unk_1E89C1A48;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "run:", v14);

}

- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3
{
  return 1;
}

- (void)_fetchAvailableUpdate:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  HMDAppleMediaAccessory *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDSoftwareUpdateFetchedEvent eventWasUserInitiated:wasNewUpdateFetched:](HMDSoftwareUpdateFetchedEvent, "eventWasUserInitiated:wasNewUpdateFetched:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received request to fetch available updates", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessory home](v8, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "softwareUpdateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_initWeak((id *)buf, v8);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__HMDAppleMediaAccessory__fetchAvailableUpdate___block_invoke_331;
      v23[3] = &unk_1E89B0FD8;
      objc_copyWeak(&v26, (id *)buf);
      v24 = v5;
      v25 = v4;
      objc_msgSend(v14, "fetchAvailableUpdateWithCompletionHandler:", v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v8;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Software update not supported", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v4, "responseHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v21, 0);

      }
    }

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Requesting accessory to fetch available software updates", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48__HMDAppleMediaAccessory__fetchAvailableUpdate___block_invoke;
    v27[3] = &unk_1E89BB158;
    v27[4] = v8;
    v28 = v5;
    v29 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v8, "_relayRequestMessage:responseHandler:", v29, v27);

  }
}

- (void)_startUpdate:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAppleMediaAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAppleMediaAccessory *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  void (**v47)(_QWORD, _QWORD, _QWORD);
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v8;
    v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting update for message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CB9C88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "deserializeObjectWithData:allowedClass:frameworkClasses:", v9, objc_opt_class(), &unk_1E8B32040);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HMDAccessory home](v6, "home");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isAdminUser") & 1) != 0)
      {
        +[HMDSoftwareUpdateStartedEvent eventUpdateStartedWithAutomaticUpdateEnabled:](HMDSoftwareUpdateStartedEvent, "eventUpdateStartedWithAutomaticUpdateEnabled:", objc_msgSend(v11, "isAutomaticSoftwareUpdateEnabled"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = v6;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v16;
            v51 = 2112;
            v52 = v10;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Received request to start update: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          -[HMDAppleMediaAccessory softwareUpdateInstallProvider](v14, "softwareUpdateInstallProvider");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_initWeak((id *)buf, v14);
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke_338;
            v41[3] = &unk_1E89B94D0;
            objc_copyWeak(&v45, (id *)buf);
            v42 = v10;
            v12 = v12;
            v43 = v12;
            v44 = v4;
            objc_msgSend(v17, "startUpdate:completionHandler:", v42, v41);

            objc_destroyWeak(&v45);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v35 = (void *)MEMORY[0x1D17BA0A0]();
            v36 = v14;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v50 = v38;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Software update install not supported", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v35);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "submitLogEvent:error:", v12, v39);

            objc_msgSend(v4, "respondWithError:", v39);
            v17 = 0;
          }
        }
        else
        {
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke;
          v46[3] = &unk_1E89BFD00;
          v12 = v12;
          v47 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
          v48 = v4;
          -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v6, "_relayRequestMessage:responseHandler:", v48, v46);

          v17 = v47;
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v6;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "currentUser");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v32;
          v51 = 2112;
          v52 = v33;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Only administrators may start updates, current user: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v4, "responseHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, CFSTR("Insufficient privileges."), CFSTR("Current user is not an administrator."), 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v17)[2](v17, v12, 0);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v6;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Invalid software update in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v4, "responseHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v10 = 0;
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, v11, 0);
    }

LABEL_30:
    goto LABEL_31;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v6;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v21;
    v51 = 2112;
    v52 = v22;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized software update from message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v4, "responseHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v10, 0);
    goto LABEL_30;
  }
LABEL_32:

}

- (void)handleDeleteSiriHistoryRequest:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  HMDAppleMediaAccessoryDeleteSiriHistoryOperation *v11;
  void (**v12)(void);
  void *v13;
  HMDAppleMediaAccessoryDeleteSiriHistoryOperation *v14;
  void *v15;
  id v16;
  void *v17;
  HMDAppleMediaAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received delete siri history request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "productClass") == 6;

    if (v10)
    {
      v11 = [HMDAppleMediaAccessoryDeleteSiriHistoryOperation alloc];
      -[HMDAppleMediaAccessory settingsConnectionFactory](v6, "settingsConnectionFactory");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAppleMediaAccessoryDeleteSiriHistoryOperation initWithSettingsConnection:](v11, "initWithSettingsConnection:", v13);

      objc_initWeak((id *)buf, v14);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_340;
      v26[3] = &unk_1E89BD988;
      objc_copyWeak(&v28, (id *)buf);
      v26[4] = v6;
      v27 = v4;
      -[HMDAppleMediaAccessoryDeleteSiriHistoryOperation setCompletionBlock:](v14, "setCompletionBlock:", v26);
      objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "performOperation:", v14);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v6;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attempted to delete siri history on unsupported device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v25);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Relaying delete siri history request to current accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke;
    v29[3] = &unk_1E89BFD00;
    v29[4] = v18;
    v30 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v18, "_relayRequestMessage:responseHandler:", v30, v29);

  }
}

- (void)handleUpdatePreferredMediaUser:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAppleMediaAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  HMDAppleMediaAccessory *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDAppleMediaAccessory *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDAppleMediaAccessory *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "productClass");

    if (v6 == 6)
    {
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB7D90]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "unsignedIntegerValue") == 1)
      {
        objc_msgSend(v4, "uuidForKey:", CFSTR("kUserUUIDKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory home](self, "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userWithUUID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = 1;
LABEL_17:
          v25 = (void *)MEMORY[0x1D17BA0A0]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v56 = v28;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Handling update preferred media user notification", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v25);
          -[HMDAccessory preferredMediaUserUUID](v26, "preferredMediaUserUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = HMFEqualObjects();

          if (v30
            && (-[HMDAccessory preferredMediaUserSelectionTypeNumber](v26, "preferredMediaUserSelectionTypeNumber"),
                (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            && (-[HMDAccessory preferredMediaUserSelectionTypeNumber](v26, "preferredMediaUserSelectionTypeNumber"),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v33 = v11 == objc_msgSend(v32, "unsignedIntegerValue"),
                v32,
                v31,
                v33))
          {
            v34 = (void *)MEMORY[0x1D17BA0A0]();
            v35 = v26;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v56 = v37;
              _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@User already matches.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v34);
            objc_msgSend(v4, "respondWithSuccess");
          }
          else if ((_os_feature_enabled_impl() & 1) != 0)
          {
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            v39 = v26;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v56 = v41;
              _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Messaged HomePod Settings not supported", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v38);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "respondWithError:", v42);

          }
          else
          {
            objc_initWeak((id *)buf, v26);
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke_342;
            v49[3] = &unk_1E89BCB20;
            objc_copyWeak(&v52, (id *)buf);
            v50 = v8;
            v51 = v4;
            -[HMDAccessory setPreferredMediaUser:selectionType:completion:](v26, "setPreferredMediaUser:selectionType:completion:", v50, v11, v49);

            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }

          goto LABEL_35;
        }
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        v44 = self;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessory home](v44, "home");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v46;
          v57 = 2112;
          v58 = v8;
          v59 = 2112;
          v60 = v47;
          _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Did not find user with uuid %@ in home %@.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v48);

      }
      else
      {
        if (!objc_msgSend(v7, "unsignedIntegerValue"))
        {
          v11 = 0;
          v8 = 0;
          goto LABEL_17;
        }
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v24;
          v57 = 2112;
          v58 = v7;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unexpected selection type %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v8);
      }

      goto LABEL_35;
    }
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot set preferred user on device class.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Relaying preferred media user update.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke;
    v53[3] = &unk_1E89BFD00;
    v53[4] = v13;
    v54 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v13, "_relayRequestMessage:responseHandler:", v54, v53);

  }
LABEL_35:

}

- (void)updatePreferredMediaUserWithUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0CBA258]);
  objc_msgSend(v8, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:selectionType:", v11, a4);

  -[HMDAppleMediaAccessory preferredMediaUserEventController](self, "preferredMediaUserEventController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke;
  v16[3] = &unk_1E89B1000;
  objc_copyWeak(v19, &location);
  v14 = v8;
  v17 = v14;
  v19[1] = (id)a4;
  v15 = v9;
  v18 = v15;
  objc_msgSend(v13, "updatePreferredMediaUserWithPrimaryUserInfo:completion:", v12, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

- (void)updatePreferredMediaUser:(id)a3 selectionType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
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
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  -[HMDAccessory setPreferredMediaUserUUID:](self, "setPreferredMediaUserUUID:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory setPreferredMediaUserSelectionTypeNumber:](self, "setPreferredMediaUserSelectionTypeNumber:", v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory preferredMediaUserUUID](v10, "preferredMediaUserUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](v10, "preferredMediaUserSelectionTypeNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)runTransactionWithPreferredMediaUserUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Run transaction and set preferred media user: %@, type: %@.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](v11, "transactionWithObjectChangeType:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "setPreferredMediaUserUUID:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferredUserSelectionType:", v18);

  v20 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessory runTransactionWithModels:label:completion:](v11, "runTransactionWithModels:label:completion:", v19, CFSTR("Update preferred media user"), v9);
}

- (void)_applySoftwareUpdateWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Applying software update with descriptor: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory _softwareUpdateV2FromDescriptor:](v6, "_softwareUpdateV2FromDescriptor:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA328], "softwareUpdateFromSoftwareUpdateV2:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = v6;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v14;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Created HMSoftwareUpdate: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v22 = *MEMORY[0x1E0CB9C88];
  encodeRootObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessory uuid](v12, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", *MEMORY[0x1E0CB9C78], v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke;
  v21[3] = &unk_1E89C0E20;
  v21[4] = v12;
  objc_msgSend(v20, "setResponseHandler:", v21);
  -[HMDAppleMediaAccessory _startUpdate:](v12, "_startUpdate:", v20);

}

- (id)_softwareUpdateV2FromDescriptor:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for descriptor: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CBA8C8], "softwareUpdateFromDescriptor:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_scanForSoftwareUpdateWithRetries
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMDAppleMediaAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retries.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 360.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 900.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 7200.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 21600.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (isInternalBuild()
    && (objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "preferenceForKey:", CFSTR("HMDAppleMediaAccessoryShouldOverrideRepeatScanningIntervals")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "BOOLValue"),
        v14,
        v13,
        v15))
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceForKey:", CFSTR("HMDAppleMediaAccessoryRepeatScanningIntervalsOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v4;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Overriding retries with new retries: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    v20 = v12;
  }
  objc_initWeak((id *)buf, v4);
  v25 = (void *)MEMORY[0x1E0D519C0];
  -[HMDAccessory workQueue](v4, "workQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke;
  v29[3] = &unk_1E89B1028;
  objc_copyWeak(&v30, (id *)buf);
  objc_msgSend(v25, "futureWithRetryIntervals:workQueue:block:", v20, v26, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v30);

  objc_destroyWeak((id *)buf);
  return v27;
}

- (id)_scanForSoftwareUpdate
{
  void *v3;
  HMDAppleMediaAccessory *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessory uuid](v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  v10 = (void *)MEMORY[0x1E0D285F8];
  v22 = *MEMORY[0x1E0CB8020];
  v23 = &unk_1E8B33510;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithName:destination:payload:", *MEMORY[0x1E0CB8028], v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_initWeak((id *)buf, v4);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke;
  v19 = &unk_1E89BF4F0;
  objc_copyWeak(&v21, (id *)buf);
  v14 = v13;
  v20 = v14;
  objc_msgSend(v12, "setResponseHandler:", &v16);
  -[HMDAppleMediaAccessory handleSoftwareUpdateV2Scan:](v4, "handleSoftwareUpdateV2Scan:", v12, v16, v17, v18, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v14;
}

- (void)handleSoftwareUpdateV2Scan:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling SoftwareUpdateV2Scan", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](v6, "isCurrentAccessory"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Relaying SoftwareUpdateV2Scan", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke;
    v13[3] = &unk_1E89BFD00;
    v13[4] = v10;
    v14 = v4;
    -[HMDAppleMediaAccessory _relayRequestMessage:responseHandler:](v10, "_relayRequestMessage:responseHandler:", v14, v13);

  }
}

- (HMFWiFiNetworkInfo)wifiNetworkInfo
{
  HMFWiFiNetworkInfo *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_wifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setWifiNetworkInfo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_wifiNetworkInfo, a3);
    os_unfair_recursive_lock_unlock();
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HMDAppleMediaAccessoryWiFiNetworkInfoUpdatedNotification"), self);

  }
}

- (void)setLastStagedWifiNetworkInfo:(id)a3
{
  HMFWiFiNetworkInfo *v4;
  HMFWiFiNetworkInfo *lastStagedWifiNetworkInfo;

  v4 = (HMFWiFiNetworkInfo *)a3;
  os_unfair_recursive_lock_lock_with_options();
  lastStagedWifiNetworkInfo = self->_lastStagedWifiNetworkInfo;
  self->_lastStagedWifiNetworkInfo = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMFWiFiNetworkInfo)lastStagedWifiNetworkInfo
{
  HMFWiFiNetworkInfo *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_lastStagedWifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)updateWiFiNetworkInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessory workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received current network changed notification: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessory updateWiFiNetworkInfo](v6, "updateWiFiNetworkInfo");

}

- (void)_relayRequestMessage:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isRemote"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot relay a remote message", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v12);
  }
  else
  {
    -[HMDAccessory home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDAppleMediaAccessory remoteMessageDestination](self, "remoteMessageDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v6, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "qualityOfService");
        objc_msgSend(v6, "messagePayload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v16, v17, v15, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, self);
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke;
        v31 = &unk_1E89C1B70;
        objc_copyWeak(&v33, (id *)buf);
        v32 = v7;
        objc_msgSend(v19, "setResponseHandler:", &v28);
        objc_msgSend(v12, "sendMessage:", v19, v28, v29, v30, v31);

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v27;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Cannot send message to unknown remote device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "respondWithError:", v19);
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Not configured to relay messages", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v15);
    }

  }
}

- (id)remoteMessageDestination
{
  void *v3;
  HMDRemoteDeviceMessageDestination *v4;
  void *v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;

  -[HMDAppleMediaAccessory device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAccessory messageTargetUUID](self, "messageTargetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v4, "initWithTarget:device:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)migrateWithCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  id v37;
  void *v38;
  void *v39;
  void *context;
  HMDAppleMediaAccessory *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  NSObject *v61;
  id v62;
  id location;
  _BYTE block[24];
  void *v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v42 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  objc_initWeak(&location, self);
  dispatch_group_enter(v12);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke;
  v58[3] = &unk_1E89B1050;
  objc_copyWeak(&v62, &location);
  v13 = v10;
  v59 = v13;
  v14 = v11;
  v60 = v14;
  v15 = v12;
  v61 = v15;
  -[HMDAppleMediaAccessory migrateAudioDestinationControllerWithCloudZone:migrationQueue:completion:](self, "migrateAudioDestinationControllerWithCloudZone:migrationQueue:completion:", v8, v9, v58);
  dispatch_group_enter(v15);
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_2;
  v53[3] = &unk_1E89B1050;
  objc_copyWeak(&v57, &location);
  v16 = v13;
  v54 = v16;
  v17 = v14;
  v55 = v17;
  v18 = v15;
  v56 = v18;
  -[HMDAppleMediaAccessory migrateAudioDestinationWithCloudZone:migrationQueue:completion:](self, "migrateAudioDestinationWithCloudZone:migrationQueue:completion:", v8, v9, v53);
  dispatch_group_enter(v18);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_3;
  v48[3] = &unk_1E89B1050;
  objc_copyWeak(&v52, &location);
  v19 = v16;
  v49 = v19;
  v20 = v17;
  v50 = v20;
  v21 = v18;
  v51 = v21;
  v43 = v8;
  v22 = v9;
  v23 = v48;
  if (self)
  {
    -[HMDAccessory softwareUpdate](self, "softwareUpdate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory");
    if (v24)
      v26 = v25;
    else
      v26 = 0;
    if (v26 && !objc_msgSend(v24, "downloadSize"))
    {
      -[HMDAccessory uuid](self, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "transactionWithObjectChangeType:forAccessoryUUID:", 1, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x1D17BA0A0]();
      v41 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "uuid");
        v34 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)block = 138544130;
        *(_QWORD *)&block[4] = v39;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v34;
        *(_WORD *)&block[22] = 2112;
        v65 = v32;
        LOWORD(v66) = 2112;
        *(_QWORD *)((char *)&v66 + 2) = v41;
        v38 = (void *)v34;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing up bad software update model with uuid: %@ and 0 download size: %@ for accessory: %@", block, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(v32, "setSoftwareVersion:", 0);
      objc_msgSend(v32, "setState:", 0);
      objc_msgSend(v32, "setInstallDuration:", 0);
      objc_msgSend(v32, "setDownloadSize:", 0);
      objc_msgSend(v32, "setReleaseDate:", 0);
      -[HMDAccessory home](v41, "home");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dropAllChangesWithObjectID:", v27);

      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __87__HMDAppleMediaAccessory_migrateSoftwareUpdateWithCloudZone_migrationQueue_completion___block_invoke_358;
      v65 = &unk_1E89C1D68;
      v36 = v23;
      *(_QWORD *)&v66 = v32;
      *((_QWORD *)&v66 + 1) = v36;
      v37 = v32;
      dispatch_async(v22, block);

    }
    else
    {
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __87__HMDAppleMediaAccessory_migrateSoftwareUpdateWithCloudZone_migrationQueue_completion___block_invoke;
      v65 = &unk_1E89C0870;
      *(_QWORD *)&v66 = v23;
      dispatch_async(v22, block);
      v27 = (void *)v66;
    }

  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_4;
  v44[3] = &unk_1E89C1B48;
  v46 = v20;
  v47 = v42;
  v45 = v19;
  v28 = v20;
  v29 = v19;
  v30 = v42;
  dispatch_group_notify(v21, v22, v44);

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);

}

- (void)migrateAudioDestinationControllerWithCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__HMDAppleMediaAccessory_migrateAudioDestinationControllerWithCloudZone_migrationQueue_completion___block_invoke;
    block[3] = &unk_1E89C0870;
    v16 = v10;
    dispatch_async(v9, block);
    v11 = v16;
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HMDAccessory home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "migrateWithHome:cloudZone:migrationQueue:completion:", v12, v8, v9, v10);

    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __99__HMDAppleMediaAccessory_migrateAudioDestinationControllerWithCloudZone_migrationQueue_completion___block_invoke_2;
      v13[3] = &unk_1E89C0870;
      v14 = v10;
      dispatch_async(v9, v13);

    }
  }

}

- (void)migrateAudioDestinationWithCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__HMDAppleMediaAccessory_migrateAudioDestinationWithCloudZone_migrationQueue_completion___block_invoke;
    block[3] = &unk_1E89C0870;
    v16 = v10;
    dispatch_async(v9, block);
    v11 = v16;
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HMDAccessory home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "migrateWithHome:cloudZone:migrationQueue:completion:", v12, v8, v9, v10);

    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __89__HMDAppleMediaAccessory_migrateAudioDestinationWithCloudZone_migrationQueue_completion___block_invoke_2;
      v13[3] = &unk_1E89C0870;
      v14 = v10;
      dispatch_async(v9, v13);

    }
  }

}

- (id)messageSendPolicy
{
  uint64_t v2;

  if (-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
    v2 = 81;
  else
    v2 = 65;
  return -[HMDHomeManagerXPCMessageSendPolicy initWithEntitlements:options:]([HMDHomeManagerXPCMessageSendPolicy alloc], "initWithEntitlements:options:", 5, v2);
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDAppleMediaAccessory modelDataSource](self, "modelDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelforAccessory:changeType:uuid:parentUUID:", self, a3, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  void *v4;

  -[HMDAppleMediaAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory populateModelObject:version:](self, "populateModelObject:version:", v4, 4);
  return v4;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  HMDDevice *device;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v40.receiver = self;
  v40.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory populateModelObject:version:](&v40, sel_populateModelObject_version_, v8, a4);
  -[HMDAppleMediaAccessory device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("4.0"));
  v12 = objc_msgSend(v10, "isAtLeastVersion:", v11);

  v13 = isWatch();
  if (v13
    && (+[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v10, "supportsCloudDataSync")))
  {
    v15 = 1;
  }
  else
  {
    -[HMDAccessory home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isOwnerUser") ^ 1;

    if (!v13)
    {
      if (!v12)
        goto LABEL_15;
      goto LABEL_11;
    }
  }

  if (!v12)
  {
LABEL_15:
    objc_msgSend(v9, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceUUID:", v19);

    if (v15 && self->_device)
    {
      objc_msgSend(v8, "setDevice:");
      device = self->_device;
      self->_device = 0;

    }
    else
    {
      objc_msgSend(v8, "setDevice:", v9);
    }
    goto LABEL_19;
  }
LABEL_11:
  v16 = objc_msgSend(v9, "isCurrentDevice");
  if (a4 > 3)
    v17 = v16;
  else
    v17 = 0;
  if ((v17 | v15) == 1)
    goto LABEL_15;
LABEL_19:
  -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loggedInAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLoggedInAccount:", v24);

  }
  -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSoftwareVersion:", v26);

  }
  -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWifiNetworkInfo:", v28);

  }
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "publicPairingIdentity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "publicPairingIdentity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPairingIdentity:", v32);

  }
  if (-[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupportedStereoPairVersions:", v33);

  }
  if (-[HMDAppleMediaAccessory supportsPreferredMediaUser](self, "supportsPreferredMediaUser"))
  {
    -[HMDAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredMediaUserUUID:", v34);

  }
  -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[HMDAccessory preferredMediaUserSelectionTypeNumber](self, "preferredMediaUserSelectionTypeNumber");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredUserSelectionType:", v36);

  }
  if (-[HMDAppleMediaAccessory productColor](self, "productColor"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAppleMediaAccessory productColor](self, "productColor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProductColor:", v37);

  }
  -[HMDAppleMediaAccessory idsIdentifier](self, "idsIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[HMDAppleMediaAccessory idsIdentifier](self, "idsIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdsIdentifier:", v39);

  }
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  -[HMDAppleMediaAccessory modelDataSource](self, "modelDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelforAccessory:changeType:uuid:parentUUID:", self, 1, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessory populateModelObject:version:](self, "populateModelObject:version:", v9, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDAppleMediaAccessory settingsController](self, "settingsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelObjectsForSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v10, "addObjectsFromArray:", v13);

  }
  -[HMDAppleMediaAccessory backingStoreObjectForMediaDestination](self, "backingStoreObjectForMediaDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v10, "addObject:", v14);
  -[HMDAppleMediaAccessory backingStoreObjectForMediaDestinationControllerData](self, "backingStoreObjectForMediaDestinationControllerData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v10, "addObject:", v15);
  v19.receiver = self;
  v19.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory backingStoreObjects:](&v19, sel_backingStoreObjects_, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v16);

  v17 = (void *)objc_msgSend(v10, "copy");
  return v17;
}

- (id)backingStoreObjectForMediaDestination
{
  void *v3;
  void *v4;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:](HMDMediaDestinationBackingStoreHandler, "backingStoreObjectForMediaDestination:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)backingStoreObjectForMediaDestinationControllerData
{
  void *v3;
  void *v4;

  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HMDMediaDestinationControllerBackingStoreHandler backingStoreObjectForData:](HMDMediaDestinationControllerBackingStoreHandler, "backingStoreObjectForData:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAppleMediaAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  HMDAppleMediaAccessory *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  void *v76;
  HMDAppleMediaAccessory *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  HMDAppleMediaAccessory *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  HMDAppleMediaAccessory *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  BOOL v106;
  void *v107;
  HMDAppleMediaAccessory *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  char v114;
  void *v115;
  HMDAppleMediaAccessory *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  void *v125;
  HMDAppleMediaAccessory *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  char v136;
  void *v137;
  HMDAppleMediaAccessory *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  char v145;
  void *v146;
  HMDAppleMediaAccessory *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  char v156;
  void *v157;
  HMDAppleMediaAccessory *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  id v164;
  void *v165;
  void (**v166)(_QWORD, _QWORD, _QWORD);
  void *v167;
  objc_super v168;
  _QWORD v169[5];
  objc_super v170;
  _QWORD aBlock[5];
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t (*v175)(uint64_t, uint64_t);
  void (*v176)(uint64_t);
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint8_t v186[4];
  void *v187;
  __int16 v188;
  void *v189;
  _BYTE v190[24];
  void *v191;
  id v192;
  uint8_t v193[128];
  uint8_t buf[4];
  void *v195;
  __int16 v196;
  void *v197;
  uint64_t v198;

  v198 = *MEMORY[0x1E0C80C00];
  v163 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v172 = 0;
    v173 = &v172;
    v174 = 0x3032000000;
    v175 = __Block_byref_object_copy__92037;
    v176 = __Block_byref_object_dispose__92038;
    v177 = 0;
    v167 = v9;
    objc_msgSend(v9, "responseHandler");
    v166 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v166)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_1E89B1078;
      aBlock[4] = &v172;
      v13 = _Block_copy(aBlock);
      objc_msgSend(v9, "setResponseHandler:", v13);

    }
    v170.receiver = self;
    v170.super_class = (Class)HMDAppleMediaAccessory;
    -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v170, sel_transactionObjectUpdated_newValues_message_, 0, v10, v9);
    v14 = self;
    v15 = v12;
    v164 = v167;
    objc_msgSend(v164, "transactionResult");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    __HMDAppleMediaAccessoryGetDeviceController(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (-[HMDAppleMediaAccessory isCurrentAccessory](v14, "isCurrentAccessory"))
      {
        if (!v16)
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = v14;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v195 = v21;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Setting up device controller for ourselves", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          -[HMDAppleMediaAccessory dependencyFactory](v19, "dependencyFactory");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "deviceController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDAppleMediaAccessory setDeviceController:](v19, "setDeviceController:", v16);
          objc_msgSend(v16, "setDelegate:", v19);
          objc_msgSend(v16, "device");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          __HMDAppleMediaAccessoryHandleUpdatedDevice(v19, v23);

          objc_msgSend(v165, "markChanged");
        }
      }
      else
      {
        v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v15, "deviceUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

        objc_msgSend(v16, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v28) = objc_msgSend(v30, "hmf_isEqualToUUID:", v31);

        if ((v28 & 1) != 0)
        {
          v32 = v16;
        }
        else
        {
          v36 = (void *)MEMORY[0x1D17BA0A0]();
          v37 = v14;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v195 = v39;
            v196 = 2112;
            v197 = v40;
            _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Updating the underlying device with identifier: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v36);
          -[HMDAppleMediaAccessory dependencyFactory](v37, "dependencyFactory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "deviceControllerWithDeviceIdentifier:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDAppleMediaAccessory setDeviceController:](v37, "setDeviceController:", v32);
          objc_msgSend(v32, "setDelegate:", v37);
          objc_msgSend(v32, "device");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          __HMDAppleMediaAccessoryHandleUpdatedDevice(v37, v42);

          objc_msgSend(v165, "markChanged");
        }

        v16 = v32;
      }
    }
    objc_msgSend(v15, "device");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v15, "device");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory device](v14, "device");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v44 == v45;

      if (!v46)
      {
        -[HMDAppleMediaAccessory device](v14, "device");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v184 = 0u;
          v185 = 0u;
          v182 = 0u;
          v183 = 0u;
          -[HMDAppleMediaAccessory device](v14, "device");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "backingStoreObjectsWithChangeType:version:", 0, 4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v182, buf, 16);
          if (v50)
          {
            v51 = *(_QWORD *)v183;
            do
            {
              for (i = 0; i != v50; ++i)
              {
                if (*(_QWORD *)v183 != v51)
                  objc_enumerationMutation(v49);
                objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * i), "dumpDebug:", CFSTR(" LOCAL: "));
              }
              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v182, buf, 16);
            }
            while (v50);
          }

        }
        objc_msgSend(v15, "device");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          v180 = 0u;
          v181 = 0u;
          v178 = 0u;
          v179 = 0u;
          objc_msgSend(v15, "device");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "backingStoreObjectsWithChangeType:version:", 0, 4);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v178, v193, 16);
          if (v56)
          {
            v57 = *(_QWORD *)v179;
            do
            {
              for (j = 0; j != v56; ++j)
              {
                if (*(_QWORD *)v179 != v57)
                  objc_enumerationMutation(v55);
                objc_msgSend(*(id *)(*((_QWORD *)&v178 + 1) + 8 * j), "dumpDebug:", CFSTR("REMOTE: "));
              }
              v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v178, v193, 16);
            }
            while (v56);
          }

        }
      }
      if (!v16)
      {
        -[HMDAppleMediaAccessory dependencyFactory](v14, "dependencyFactory");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "device");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "deviceControllerWithDevice:", v60);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAppleMediaAccessory setDeviceController:](v14, "setDeviceController:", v16);
        objc_msgSend(v16, "setDelegate:", v14);
        objc_msgSend(v16, "device");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        __HMDAppleMediaAccessoryHandleUpdatedDevice(v14, v61);

      }
      objc_msgSend(v15, "device");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory device](v14, "device");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v62 == v63;

      if (!v64)
      {
        -[HMDAppleMediaAccessory device](v14, "device");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "device");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "isBackingStorageEqual:", v66);

        if ((v67 & 1) != 0)
          goto LABEL_55;
        objc_msgSend(v15, "device");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateWithDevice:completionHandler:", v68, 0);

      }
      objc_msgSend(v165, "markChanged");
    }
LABEL_55:

    objc_msgSend(v15, "pairingIdentity");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69)
      goto LABEL_91;
    v70 = -[HMDAppleMediaAccessory isCurrentAccessory](v14, "isCurrentAccessory");
    objc_msgSend(v15, "pairingIdentity");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v70)
    {
      -[HMDAppleMediaAccessory pairingIdentity](v14, "pairingIdentity");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v71, "isEqual:", v82) & 1) != 0)
      {
        objc_msgSend(v15, "pairingIdentity");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "privateKey");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (v84)
        {

          goto LABEL_91;
        }
        -[HMDAppleMediaAccessory pairingIdentity](v14, "pairingIdentity");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "privateKey");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v105 == 0;

        if (v106)
        {
LABEL_91:
          objc_msgSend(v15, "softwareVersion");
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          if (v111)
          {
            objc_msgSend(v15, "softwareVersion");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAppleMediaAccessory softwareVersion](v14, "softwareVersion");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v112, "isEqual:", v113);

            if ((v114 & 1) == 0)
            {
              v115 = (void *)MEMORY[0x1D17BA0A0]();
              v116 = v14;
              HMFGetOSLogHandle();
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "softwareVersion");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v190 = 138543618;
                *(_QWORD *)&v190[4] = v118;
                *(_WORD *)&v190[12] = 2112;
                *(_QWORD *)&v190[14] = v119;
                _os_log_impl(&dword_1CD062000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@Updated software version: %@", v190, 0x16u);

              }
              objc_autoreleasePoolPop(v115);
              objc_msgSend(v15, "softwareVersion");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAppleMediaAccessory setSoftwareVersion:](v116, "setSoftwareVersion:", v120);

              objc_msgSend(v165, "markChanged");
              if (-[HMDAppleMediaAccessory isCurrentAccessory](v116, "isCurrentAccessory"))
              {
                -[HMDAppleMediaAccessory softwareVersion](v116, "softwareVersion");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "softwareVersion");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = HMFEqualObjects();

                if ((v124 & 1) == 0)
                {
                  v125 = (void *)MEMORY[0x1D17BA0A0]();
                  v126 = v116;
                  HMFGetOSLogHandle();
                  v127 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMDAppleMediaAccessory softwareVersion](v126, "softwareVersion");
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v130, "softwareVersion");
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v190 = 138543874;
                    *(_QWORD *)&v190[4] = v128;
                    *(_WORD *)&v190[12] = 2112;
                    *(_QWORD *)&v190[14] = v129;
                    *(_WORD *)&v190[22] = 2112;
                    v191 = v131;
                    _os_log_impl(&dword_1CD062000, v127, OS_LOG_TYPE_DEFAULT, "%{public}@Stored software version is incorrect (%@), updating to: (%@)", v190, 0x20u);

                  }
                  objc_autoreleasePoolPop(v125);
                  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v132, "softwareVersion");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDAppleMediaAccessory _updateSoftwareVersion:](v126, "_updateSoftwareVersion:", v133);

                }
              }
            }
          }
          if (objc_msgSend(v15, "propertyWasSet:", CFSTR("supportedStereoPairVersions")))
          {
            objc_msgSend(v15, "supportedStereoPairVersions");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](v14, "supportedStereoPairVersions"));
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = objc_msgSend(v134, "isEqual:", v135);

            if ((v136 & 1) == 0)
            {
              v137 = (void *)MEMORY[0x1D17BA0A0]();
              v138 = v14;
              HMFGetOSLogHandle();
              v139 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "supportedStereoPairVersions");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v190 = 138543618;
                *(_QWORD *)&v190[4] = v140;
                *(_WORD *)&v190[12] = 2112;
                *(_QWORD *)&v190[14] = v141;
                _os_log_impl(&dword_1CD062000, v139, OS_LOG_TYPE_DEFAULT, "%{public}@Updated supported stereo pair versions: %@", v190, 0x16u);

              }
              objc_autoreleasePoolPop(v137);
              objc_msgSend(v15, "supportedStereoPairVersions");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAppleMediaAccessory setSupportedStereoPairVersions:](v138, "setSupportedStereoPairVersions:", objc_msgSend(v142, "unsignedIntegerValue"));

              objc_msgSend(v165, "markChanged");
            }
          }
          if (objc_msgSend(v15, "propertyWasSet:", CFSTR("wifiNetworkInfo"))
            && (!-[HMDAppleMediaAccessory isCurrentAccessory](v14, "isCurrentAccessory")
             || objc_msgSend(v165, "source") != 2))
          {
            objc_msgSend(v15, "wifiNetworkInfo");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAppleMediaAccessory wifiNetworkInfo](v14, "wifiNetworkInfo");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = HMFEqualObjects();

            if ((v145 & 1) == 0)
            {
              v146 = (void *)MEMORY[0x1D17BA0A0]();
              v147 = v14;
              HMFGetOSLogHandle();
              v148 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "wifiNetworkInfo");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v190 = 138543618;
                *(_QWORD *)&v190[4] = v149;
                *(_WORD *)&v190[12] = 2112;
                *(_QWORD *)&v190[14] = v150;
                _os_log_impl(&dword_1CD062000, v148, OS_LOG_TYPE_DEFAULT, "%{public}@Updated WiFi network info: %@", v190, 0x16u);

              }
              objc_autoreleasePoolPop(v146);
              objc_msgSend(v15, "wifiNetworkInfo");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAppleMediaAccessory setWifiNetworkInfo:](v147, "setWifiNetworkInfo:", v151);

              objc_msgSend(v165, "markChanged");
            }
          }
          if (objc_msgSend(v15, "propertyWasSet:", CFSTR("loggedInAccount")))
          {
            -[HMDAppleMediaAccessory remoteLoginHandler](v14, "remoteLoginHandler");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "_handleRemoteLoginAccount:message:", v15, v164);

            objc_msgSend(v165, "markChanged");
          }
          *(_QWORD *)v190 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v190[8] = 3221225472;
          *(_QWORD *)&v190[16] = ____transactionAccessoryUpdated_block_invoke_92051;
          v191 = &unk_1E89C02B8;
          v153 = v165;
          v192 = v153;
          -[HMDAccessory transactionAccessoryUpdatedForPreferredMediaUser:completionHandler:](v14, "transactionAccessoryUpdatedForPreferredMediaUser:completionHandler:", v15, v190);
          if (objc_msgSend(v15, "propertyWasSet:", CFSTR("productColor")))
          {
            objc_msgSend(v15, "productColor");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAppleMediaAccessory productColor](v14, "productColor"));
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = objc_msgSend(v154, "isEqual:", v155);

            if ((v156 & 1) == 0)
            {
              v157 = (void *)MEMORY[0x1D17BA0A0]();
              v158 = v14;
              HMFGetOSLogHandle();
              v159 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "productColor");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v186 = 138543618;
                v187 = v160;
                v188 = 2112;
                v189 = v161;
                _os_log_impl(&dword_1CD062000, v159, OS_LOG_TYPE_DEFAULT, "%{public}@Updated product color: %@", v186, 0x16u);

              }
              objc_autoreleasePoolPop(v157);
              objc_msgSend(v15, "productColor");
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAppleMediaAccessory setProductColor:](v158, "setProductColor:", objc_msgSend(v162, "unsignedIntegerValue"));

              objc_msgSend(v153, "markChanged");
            }
          }
          objc_msgSend(v164, "respondWithPayload:", 0);

          if (v166)
            v166[2](v166, v173[5], 0);

          _Block_object_dispose(&v172, 8);
          v9 = v167;
          goto LABEL_122;
        }
      }
      else
      {

      }
      v96 = (void *)MEMORY[0x1D17BA0A0]();
      v97 = v14;
      HMFGetOSLogHandle();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pairingIdentity");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v190 = 138543618;
        *(_QWORD *)&v190[4] = v99;
        *(_WORD *)&v190[12] = 2112;
        *(_QWORD *)&v190[14] = v100;
        _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity: %@", v190, 0x16u);

      }
      objc_autoreleasePoolPop(v96);
      objc_msgSend(v15, "pairingIdentity");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory setPairingIdentity:](v97, "setPairingIdentity:", v101);

      goto LABEL_76;
    }
    -[HMDAppleMediaAccessory lastCreatedPairingIdentity](v14, "lastCreatedPairingIdentity");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v71, "isEqual:", v72) & 1) != 0)
    {
      -[HMDAppleMediaAccessory lastCreatedPairingIdentity](v14, "lastCreatedPairingIdentity");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "privateKey");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74 == 0;

      if (!v75)
      {
        v76 = (void *)MEMORY[0x1D17BA0A0]();
        v77 = v14;
        HMFGetOSLogHandle();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pairingIdentity");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v190 = 138543618;
          *(_QWORD *)&v190[4] = v79;
          *(_WORD *)&v190[12] = 2112;
          *(_QWORD *)&v190[14] = v80;
          _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity with private info: %@", v190, 0x16u);

        }
        objc_autoreleasePoolPop(v76);
        -[HMDAppleMediaAccessory lastCreatedPairingIdentity](v77, "lastCreatedPairingIdentity");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory setPairingIdentity:](v77, "setPairingIdentity:", v81);

        -[HMDAppleMediaAccessory setFixedPairingIdentityInCloud:](v77, "setFixedPairingIdentityInCloud:", 1);
LABEL_76:
        -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v14, "notifyFrameworkOfUpdatedPairingIdentity");
LABEL_77:
        objc_msgSend(v165, "markChanged");
        goto LABEL_91;
      }
    }
    else
    {

    }
    objc_msgSend(v15, "pairingIdentity");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory pairingIdentity](v14, "pairingIdentity");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "isEqual:", v86))
    {
      -[HMDAppleMediaAccessory pairingIdentity](v14, "pairingIdentity");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "privateKey");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (v88)
      {
        objc_msgSend(v15, "pairingIdentity");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "privateKey");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90 == 0;

        if (v91)
        {
          v92 = (void *)MEMORY[0x1D17BA0A0]();
          v93 = v14;
          HMFGetOSLogHandle();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v190 = 138543362;
            *(_QWORD *)&v190[4] = v95;
            _os_log_impl(&dword_1CD062000, v94, OS_LOG_TYPE_DEFAULT, "%{public}@Pushing a fix to cloud, mark changed", v190, 0xCu);

          }
          objc_autoreleasePoolPop(v92);
          -[HMDAppleMediaAccessory setFixedPairingIdentityInCloud:](v93, "setFixedPairingIdentityInCloud:", 1);
          goto LABEL_77;
        }
LABEL_88:
        v107 = (void *)MEMORY[0x1D17BA0A0]();
        v108 = v14;
        HMFGetOSLogHandle();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v190 = 138543362;
          *(_QWORD *)&v190[4] = v110;
          _os_log_impl(&dword_1CD062000, v109, OS_LOG_TYPE_ERROR, "%{public}@Updated pairing identity does not match lastCreated", v190, 0xCu);

        }
        objc_autoreleasePoolPop(v107);
        goto LABEL_91;
      }

    }
    goto LABEL_88;
  }
  v24 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  if (v26)
  {
    -[HMDAppleMediaAccessory settingsController](self, "settingsController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v169[0] = MEMORY[0x1E0C809B0];
    v169[1] = 3221225472;
    v169[2] = __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke_2;
    v169[3] = &unk_1E89C2350;
    v169[4] = self;
    objc_msgSend(v27, "handleUpdatedGroupModel:completion:", v26, v169);

  }
  else
  {
    v33 = v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;

    if (v35)
    {
      -[HMDAppleMediaAccessory handleUpdatedMediaDestinationControllerModel:message:](self, "handleUpdatedMediaDestinationControllerModel:message:", v35, v9);
    }
    else
    {
      v33 = v33;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v102 = v33;
      else
        v102 = 0;
      v103 = v102;

      if (!v103)
      {
        v168.receiver = self;
        v168.super_class = (Class)HMDAppleMediaAccessory;
        -[HMDMediaAccessory transactionObjectUpdated:newValues:message:](&v168, sel_transactionObjectUpdated_newValues_message_, v163, v33, v9);
        goto LABEL_122;
      }
      -[HMDAppleMediaAccessory handleUpdatedMediaDestinationModel:message:](self, "handleUpdatedMediaDestinationModel:message:", v103, v9);
    }

  }
LABEL_122:

}

- (void)handleTransactionUpdatedPublicPairingIdentity:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDAppleMediaAccessory *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated accessory public pairing identity: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAppleMediaAccessory pairingIdentity](v9, "pairingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v6);

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v9;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping already saved pairing identity", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }
    else
    {
      -[HMDAppleMediaAccessory setPairingIdentity:](v9, "setPairingIdentity:", v6);
      -[HMDAppleMediaAccessory notifyFrameworkOfUpdatedPairingIdentity](v9, "notifyFrameworkOfUpdatedPairingIdentity");
      objc_msgSend(v7, "markChanged");
    }
  }

}

- (void)handleUpdatedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDMediaDestinationController *v35;
  HMDMediaDestinationController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDAppleMediaAccessory *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v11;
      v54 = 2112;
      v55 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping transaction update: %@ due to Home Theater QFA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "backingStoreHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transactionObjectUpdated:newValues:message:", v6, v6, v7);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v18;
        v54 = 2112;
        v55 = v6;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v6, "availableDestinationModelIdentifiers");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = (void *)MEMORY[0x1E0C9AA60];
      if (v19)
        v21 = (void *)v19;
      v22 = v21;

      v23 = objc_alloc(MEMORY[0x1E0CBA610]);
      objc_msgSend(v6, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destinationModelIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportedOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v22;
      v51 = objc_msgSend(v23, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v24, v25, v26, objc_msgSend(v27, "unsignedIntegerValue"), v22);

      -[HMDAccessory home](v16, "home");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory backingStore](v16, "backingStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory msgDispatcher](v16, "msgDispatcher");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaAccessory notificationCenter](v16, "notificationCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logEventSubmitter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v28;
      objc_msgSend(v28, "dailyScheduler");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      v49 = v7;
      if (v29 && v30 && v31 && v32 && v33)
      {
        v35 = [HMDMediaDestinationController alloc];
        LOBYTE(v46) = -[HMDAppleMediaAccessory isCurrentAccessory](v16, "isCurrentAccessory");
        v36 = -[HMDMediaDestinationController initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:](v35, "initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v51, v29, v30, v31, v32, v34, v46, v16, v16);
        -[HMDAppleMediaAccessory setAudioDestinationController:](v16, "setAudioDestinationController:", v36);

        -[HMDAppleMediaAccessory audioDestinationController](v16, "audioDestinationController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v48;
        objc_msgSend(v37, "configureWithHome:", v48);

        objc_msgSend(v7, "transactionResult");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "markChanged");

        objc_msgSend(v7, "transactionResult");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "markSaveToAssistant");

        v41 = v7;
        v42 = (void *)v51;
        objc_msgSend(v41, "respondWithSuccess");
      }
      else
      {
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        v44 = v16;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v53 = v47;
          v54 = 2112;
          v55 = v29;
          v56 = 2112;
          v57 = v30;
          v58 = 2112;
          v59 = v31;
          v60 = 2112;
          v61 = v32;
          v62 = 2112;
          v63 = v34;
          _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new audio destination controller due to missing dependencies backing store: %@ message dispatcher: %@ notification center: %@ log submitter: %@ daily scheduler: %@", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(v43);
        v42 = (void *)v51;
        v38 = v48;
      }

      v7 = v49;
    }

  }
}

- (void)handleUpdatedMediaDestinationModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  HMDMediaDestinationManager *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDMediaDestinationManager *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v11;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping model: %@ due to home theater QFA", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationManager](self, "audioDestinationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "backingStoreHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transactionObjectUpdated:newValues:message:", v6, v6, v7);

    }
    else
    {
      -[HMDAccessory home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        v39 = v15;
        if (v19)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v20;
          v42 = 2112;
          v43 = v6;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination manager with model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v6, "supportedOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        objc_msgSend(v6, "audioGroupIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc(MEMORY[0x1E0CBA600]);
        objc_msgSend(v6, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "parentUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v24, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v25, v26, v22, v23);

        v28 = [HMDMediaDestinationManager alloc];
        -[HMDAccessory msgDispatcher](v17, "msgDispatcher");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaAccessory notificationCenter](v17, "notificationCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessory backingStore](v17, "backingStore");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[HMDMediaDestinationManager initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:](v28, "initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v27, v29, v30, v31, -[HMDAppleMediaAccessory isCurrentAccessory](v17, "isCurrentAccessory"), v17, v17);
        -[HMDAppleMediaAccessory setAudioDestinationManager:](v17, "setAudioDestinationManager:", v32);

        -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v39;
        objc_msgSend(v33, "configureWithHome:currentAccessory:", v39, -[HMDAppleMediaAccessory isCurrentAccessory](v17, "isCurrentAccessory"));

        -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "messageHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleUpdatedDestination:", v27);

        objc_msgSend(v7, "transactionResult");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "markChanged");

        objc_msgSend(v7, "transactionResult");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "markSaveToAssistant");

        objc_msgSend(v7, "respondWithSuccess");
      }
      else
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v38;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination manager due to no home", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "respondWithError:", v23);
      }

    }
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[HMDAppleMediaAccessory handleRemovedMediaDestinationModel:message:](self, "handleRemovedMediaDestinationModel:message:", v9, v7);

  }
  else
  {
    v10 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      -[HMDAppleMediaAccessory handleRemovedMediaDestinationControllerModel:message:](self, "handleRemovedMediaDestinationControllerModel:message:", v12, v7);

    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)HMDAppleMediaAccessory;
      -[HMDAccessory transactionObjectRemoved:message:](&v13, sel_transactionObjectRemoved_message_, v10, v7);
    }
  }

}

- (void)handleRemovedMediaDestinationModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination model: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory audioDestination](v9, "audioDestination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination manager due to removed model transaction", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDAppleMediaAccessory audioDestinationManager](v17, "audioDestinationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory setAudioDestinationManager:](v17, "setAudioDestinationManager:", 0);
    -[HMDAppleMediaAccessory unsetAudioDestination](v17, "unsetAudioDestination");
    objc_msgSend(v20, "messageHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleUpdatedDestination:", 0);

    objc_msgSend(v7, "transactionResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "markSaveToAssistant");

  }
  objc_msgSend(v7, "respondWithSuccess");

}

- (void)handleRemovedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v11;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination controller model: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAppleMediaAccessory audioDestinationController](v9, "audioDestinationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination controller: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDAppleMediaAccessory setAudioDestinationController:](v17, "setAudioDestinationController:", 0);
    -[HMDAppleMediaAccessory unsetAudioDestinationControllerData](v17, "unsetAudioDestinationControllerData");
    objc_msgSend(v7, "transactionResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "markChanged");

    objc_msgSend(v7, "transactionResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markSaveToAssistant");

  }
  objc_msgSend(v7, "respondWithSuccess");

}

- (void)deviceController:(id)a3 didUpdateDevice:(id)a4
{
  __HMDAppleMediaAccessoryHandleUpdatedDevice(self, a4);
}

- (id)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (objc_msgSend((id)-[HMDAppleMediaAccessory superclass](self, "superclass"), "instancesRespondToSelector:", sel_messageReceiverChildren))
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDAppleMediaAccessory;
    -[HMDAccessory messageReceiverChildren](&v9, sel_messageReceiverChildren);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)availableDestinationIdentifiersForMediaDestinationController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaDestinationsInRoom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsHomeTheaterSupportedOptions", (_QWORD)v17))
        {
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (id)mediaDestinationController:(id)a3 destinationManagerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaDestinationManagersWithHomeTheaterSupportedOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke;
  v11[3] = &unk_1E89B10A0;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mediaDestinationController:(id)a3 destinationWithParentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "destinationManagerWithParentIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination from parent identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)mediaDestinationController:(id)a3 rootDestinationWithDecendantIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "rootDestinationManagerWithDescendantDestinationIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive root destination from destination identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (id)mediaGroupLocalDataStorageForMediaDestinationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "mediaGroupParticipantDataLocalStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v23;
          v27 = 2112;
          v28 = v8;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage on home manager: %@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v19;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home manager on home: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v10 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v10 = 0;
  }

  return v10;
}

- (id)currentUserForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)mediaDestinationControllerMetricsEventDispatcher:(id)a3 destinationTypeForDestinationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  HMDAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "destinationTypeForDestinationWithIdentifier:", v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination identifier from parent destination identifier: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessory *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "destinationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAppleMediaAccessory mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:](self, "mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:", v4, v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get controller data for media destination controller metrics", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = &unk_1E8B33528;
  }

  return v8;
}

- (void)mediaDestinationControllerDidUpdateStagedValues:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination controller did update staged values", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *MEMORY[0x1E0CB94C8];
    -[HMDAccessory uuid](v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v11, v12, 1);

    objc_msgSend(v10, "assistantSyncDataChanged:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)mediaDestinationControllerWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDMediaDestinationController *v25;
  uint64_t v27;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  LOBYTE(v27) = a9;
  v25 = -[HMDMediaDestinationController initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:]([HMDMediaDestinationController alloc], "initWithData:backingStore:messageDispatcher:notificationCenter:logEventSubmitter:dailyScheduler:targetDevice:dataSource:delegate:", v24, v23, v22, v21, v20, v19, v27, v18, v17);

  return v25;
}

- (id)mediaDestinationManager:(id)a3 destinationControllerWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationControllerWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rootDestinationManagerForMediaDestinationManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootDestinationManagerWithDescendantDestinationIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mediaGroupParticipantLocalDataStorageForMediaDestinationManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaGroupParticipantDataLocalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mediaDestinationManagerWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDMediaDestinationManager *v21;

  v10 = a7;
  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[HMDMediaDestinationManager initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:]([HMDMediaDestinationManager alloc], "initWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v20, v19, v18, v17, v10, v16, v15);

  return v21;
}

- (void)mediaDestinationManagerDidUpdateStagedValues:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination manager did update staged values", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *MEMORY[0x1E0CB94C8];
    -[HMDAccessory uuid](v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v11, v12, 1);

    objc_msgSend(v10, "assistantSyncDataChanged:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (HMDBackingStore)backingStore
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDBackingStore *)v3;
}

- (HMFActivity)setupActivity
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFActivity *)v4;
}

- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessorySetupMetricDispatcherForAccessoryUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAccessorySetupMetricDispatcher *)v6;
}

- (void)setSetupActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetupActivity:", v4);

}

- (void)setSetupStartTimestamp:(double)a3
{
  void *v5;
  HMDAppleMediaAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessory home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSetupStartTimestamp:", a3);

}

- (double)setupStartTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupStartTimestamp");
  v5 = v4;

  return v5;
}

- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  HMDAccessorySettingsMetadata *v12;
  HMDAccessorySettingsMetadata *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding root settings", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(HMDAccessorySettingsMetadata);
  v13 = v12;
  if (!v12)
    goto LABEL_6;
  -[HMDAccessorySettingsMetadata rootGroup](v12, "rootGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelsWithParentIdentifier:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {

LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (id)modelsToMigrateSettingsForController:(id)a3
{
  HMDAccessorySettingsMetadata *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v4
    && (-[HMDAppleMediaAccessory settingsController](self, "settingsController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[HMDAppleMediaAccessory settingsController](self, "settingsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeWithSettingsMetadata:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v6, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
    v14 = v9 == 0;
  else
    v14 = 0;
  if (v14)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory _removeManagedConfigurationProfileWithIdentifier:completion:](v11, "_removeManagedConfigurationProfileWithIdentifier:completion:", v16, v7);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get managed configuration profile: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[HMDAccessory home](self, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveWithReason:postSyncNotification:objectChange:", v7, 0, a5 != 0);

}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4
{
  id v5;
  void *v6;
  HMDHomeSaveRequest *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDHomeSaveRequest initWithReason:information:saveOptions:]([HMDHomeSaveRequest alloc], "initWithReason:information:saveOptions:", v5, 0, 0);
  objc_msgSend(v9, "saveWithRequest:", v7);
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v5, v8, 1);

}

- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3
{
  void *v3;
  char v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMultiUserEnabled");

  return v4;
}

- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4
{
  id v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  void *v8;
  HMDRemoteDeviceMessageDestination *v9;

  v5 = a4;
  -[HMDAppleMediaAccessory device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAppleMediaAccessory device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v7, "initWithTarget:device:", v5, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantAccessControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantAccessControlModelWithRemovedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)languagesChangedForAccessorySettingsController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDMediaAccessory notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("HMDHomeNotificationKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAppleMediaAccessoryLanguagesChangedNotification"), self, v6);

  }
}

- (id)homeUUID
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  void *v2;
  void *v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMLogEventSubmitting *)v3;
}

- (HMEEventForwarder)eventForwarder
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventForwarder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMEEventForwarder *)v4;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localAndRemoteSubscriptionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMESubscriptionProviding *)v4;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStoreReadHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMELastEventStoreReadHandle *)v4;
}

- (id)controller:(id)a3 topicForKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D17B8E58](v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)eventSourceIdentifierNameForFetchedSettingsController:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessorySetupMetricDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCurrentAccessorySetupMetricDispatcher *)v4;
}

- (id)accessoryInfoControllerTopicForWifiInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CBA240];
  v4 = *MEMORY[0x1E0CB7C58];
  -[HMDAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topicFromSuffixID:homeUUID:accessoryUUID:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventSourceIdentifierNameForAccessoryInfoController:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory uuid](self, "uuid", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessoryInfoControllerSoftwareVersionTopicForController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CBA240];
  v5 = *MEMORY[0x1E0CB7C50];
  -[HMDAccessory home](self, "home", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicFromSuffixID:homeUUID:accessoryUUID:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)currentAccessorySoftwareVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessoryInfoController:(id)a3 didUpdateWifiInfo:(id)a4
{
  HMFWiFiNetworkInfo *v5;
  HMFWiFiNetworkInfo *wifiNetworkInfo;

  v5 = (HMFWiFiNetworkInfo *)a4;
  os_unfair_recursive_lock_lock_with_options();
  wifiNetworkInfo = self->_wifiNetworkInfo;
  self->_wifiNetworkInfo = v5;

  os_unfair_recursive_lock_unlock();
}

- (HMDAppleMediaAccessory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessory *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (HMDAppleMediaAccessory *)-[HMDAppleMediaAccessory _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  HMDAppleMediaAccessory *v5;
  HMDAppleMediaAccessoryDependencyFactory *v6;
  HMDAppleMediaAccessoryDependencyFactory *dependencyFactory;
  id deviceMediaRouteIdentifierFactory;
  id settingsConnectionFactory;
  HMDAppleMediaAccessoryModelDataSource *v10;
  HMDAppleMediaAccessoryModelDataSource *modelDataSource;
  uint64_t v12;
  HMDDevice *device;
  uint64_t v14;
  HMDDeviceController *deviceController;
  uint64_t v16;
  HMFPairingIdentity *pairingIdentity;
  uint64_t v18;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v20;
  HMFWiFiNetworkInfo *wifiNetworkInfo;
  void *v22;
  char v23;
  void *v24;
  HMDAppleMediaAccessory *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDAccessorySettingsController *settingsController;
  HMDAccessorySettingsController *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  HMDAccessorySettingsController *v36;
  uint64_t v37;
  HMDRemoteLoginHandler *remoteLoginHandler;
  HMDRemoteLoginHandler *v39;
  HMDRemoteLoginHandler *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMDAppleMediaAccessory *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  HMMediaDestinationControllerData *committedAudioDestinationControllerData;
  uint64_t v51;
  uint64_t v52;
  HMMediaDestination *committedAudioDestination;
  HMMediaDestination *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  HMDAppleMediaAccessory *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  HMMediaDestination *v69;
  void *v70;
  HMDAppleMediaAccessorySleepWakeStateController *v71;
  void *v72;
  uint64_t v73;
  HMDAppleMediaAccessorySleepWakeStateController *sleepWakeStateController;
  void *v76;
  objc_super v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  HMDAccessorySettingsController *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)HMDAppleMediaAccessory;
  v5 = -[HMDMediaAccessory initWithCoder:](&v77, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v5->_dependencyFactory;
    v5->_dependencyFactory = v6;

    deviceMediaRouteIdentifierFactory = v5->_deviceMediaRouteIdentifierFactory;
    v5->_deviceMediaRouteIdentifierFactory = &__block_literal_global_383;

    settingsConnectionFactory = v5->_settingsConnectionFactory;
    v5->_settingsConnectionFactory = &__block_literal_global_384;

    v10 = objc_alloc_init(HMDAppleMediaAccessoryModelDataSource);
    modelDataSource = v5->_modelDataSource;
    v5->_modelDataSource = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7BB0]);
    v12 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HMDDevice *)v12;

    if (v5->_device)
    {
      -[HMDAppleMediaAccessoryDependencyFactory deviceControllerWithDevice:](v5->_dependencyFactory, "deviceControllerWithDevice:");
      v14 = objc_claimAutoreleasedReturnValue();
      deviceController = v5->_deviceController;
      v5->_deviceController = (HMDDeviceController *)v14;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7D60]);
    v16 = objc_claimAutoreleasedReturnValue();
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB8030]);
    v18 = objc_claimAutoreleasedReturnValue();
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (HMFSoftwareVersion *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB81B0]);
    v20 = objc_claimAutoreleasedReturnValue();
    wifiNetworkInfo = v5->_wifiNetworkInfo;
    v5->_wifiNetworkInfo = (HMFWiFiNetworkInfo *)v20;

    objc_storeStrong((id *)&v5->_lastStagedWifiNetworkInfo, v5->_wifiNetworkInfo);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLForKey:", CFSTR("mi.hh2"));

    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v5;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      settingsController = v25->_settingsController;
      *(_DWORD *)buf = 138543874;
      v79 = v27;
      v80 = 2112;
      v81 = v28;
      v82 = 2112;
      v83 = settingsController;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@hh2SettingsMigrationEnabled: %@, _settingsController: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
    if ((v23 & 1) == 0 && !v25->_settingsController)
    {
      v30 = [HMDAccessorySettingsController alloc];
      -[HMDAccessory workQueue](v25, "workQueue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](v25, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0CB7E18];
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:](v30, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:", v31, v25, v25, v32, v33, v34);
      v36 = v25->_settingsController;
      v25->_settingsController = (HMDAccessorySettingsController *)v35;

    }
    -[HMDAccessorySettingsController decodeWithCoder:](v25->_settingsController, "decodeWithCoder:", v4);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB7DC8]);
    v37 = objc_claimAutoreleasedReturnValue();
    remoteLoginHandler = v25->_remoteLoginHandler;
    v25->_remoteLoginHandler = (HMDRemoteLoginHandler *)v37;

    if (!v25->_remoteLoginHandler)
    {
      v39 = -[HMDRemoteLoginHandler initWithAccessory:loggedInAccountData:]([HMDRemoteLoginHandler alloc], "initWithAccessory:loggedInAccountData:", v25, 0);
      v40 = v25->_remoteLoginHandler;
      v25->_remoteLoginHandler = v39;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.FixedPairingIdentityInCloudCodingKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
      LOBYTE(v41) = objc_msgSend(v41, "BOOLValue");
    v25->_fixedPairingIdentityInCloud = (char)v41;
    v43 = *MEMORY[0x1E0CB79B8];
    if (objc_msgSend(v4, "containsValueForKey:", *MEMORY[0x1E0CB79B8]))
    {
      v44 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v25;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = v42;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v48;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Decoding destination controller data using legacy encoding", buf, 0xCu);

        v42 = v47;
      }

      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("HMDMediaDestinationController"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v43);
      v49 = objc_claimAutoreleasedReturnValue();
      committedAudioDestinationControllerData = v45->_committedAudioDestinationControllerData;
      v45->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v49;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB79C0]);
      v51 = objc_claimAutoreleasedReturnValue();
      committedAudioDestinationControllerData = v25->_committedAudioDestinationControllerData;
      v25->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v51;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB79B0]);
    v52 = objc_claimAutoreleasedReturnValue();
    committedAudioDestination = v25->_committedAudioDestination;
    v25->_committedAudioDestination = (HMMediaDestination *)v52;

    v54 = v25->_committedAudioDestination;
    if (v54)
    {
      -[HMMediaDestination parentIdentifier](v54, "parentIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (!v55
        || (objc_msgSend(v55, "UUIDString"),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v58 = objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0CB9498]),
            v57,
            v58))
      {
        v76 = v42;
        v59 = (void *)MEMORY[0x1D17BA0A0]();
        v60 = v25;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v62;
          _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@No parent identifier given was given - fixing bad legacy encoding state", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v59);
        v63 = objc_alloc(MEMORY[0x1E0CBA600]);
        -[HMMediaDestination uniqueIdentifier](v25->_committedAudioDestination, "uniqueIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessory uuid](v60, "uuid");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = -[HMMediaDestination supportedOptions](v25->_committedAudioDestination, "supportedOptions");
        -[HMMediaDestination audioGroupIdentifier](v25->_committedAudioDestination, "audioGroupIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v63, "initWithUniqueIdentifier:parentIdentifier:supportedOptions:audioGroupIdentifier:", v64, v65, v66, v67);
        v69 = v25->_committedAudioDestination;
        v25->_committedAudioDestination = (HMMediaDestination *)v68;

        v42 = v76;
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9DE0]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v25->_supportedStereoPairVersions = objc_msgSend(v70, "unsignedIntegerValue");

    __bootstrapSupportedStereoPairVersions(v25);
    -[HMDAccessory decodePreferredMediaUser:](v25, "decodePreferredMediaUser:", v4);
    v71 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    -[HMDAccessory uuid](v25, "uuid");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[HMDAppleMediaAccessorySleepWakeStateController initWithAccessoryUUID:dataSource:](v71, "initWithAccessoryUUID:dataSource:", v72, v25);
    sleepWakeStateController = v25->_sleepWakeStateController;
    v25->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v73;

    v25->_productColor = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x1E0CB98C8]);
  }

  return v5;
}

- (void)_encodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (v5 = objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue"), v4 = v8, v5))
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB79C0]);

    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB79B0]);

  }
  else
  {
    -[HMDAppleMediaAccessory _legacyEncodeMediaDestinationAndControllerDataWithCoder:](self, "_legacyEncodeMediaDestinationAndControllerDataWithCoder:", v4);
  }

}

- (void)_legacyEncodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    -[HMDAppleMediaAccessory committedAudioDestinationControllerData](self, "committedAudioDestinationControllerData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory committedAudioDestination](self, "committedAudioDestination");
  }
  else
  {
    -[HMDAppleMediaAccessory audioDestinationControllerData](self, "audioDestinationControllerData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x1E0CB79C0]);
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0CB79B0]);

}

- (void)addHostedAccessory:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  os_unfair_recursive_lock_unlock();
}

- (void)removeHostedAccessory:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  os_unfair_recursive_lock_unlock();
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  -[HMDAppleMediaAccessory _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  _BOOL8 v20;
  _BOOL8 v21;
  _BOOL8 v22;
  _BOOL8 v23;
  _BOOL8 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  _BOOL8 v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  _BOOL8 v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  objc_super v40;

  v4 = a3;
  v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  v7 = objc_msgSend(v4, "hmd_homeManagerOptions");
  v40.receiver = self;
  v40.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory encodeWithCoder:](&v40, sel_encodeWithCoder_, v4);
  -[HMDAppleMediaAccessory pairingIdentity](self, "pairingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x1E0CB7D60]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAppleMediaAccessory fixedPairingIdentityInCloud](self, "fixedPairingIdentityInCloud"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("HM.FixedPairingIdentityInCloudCodingKey");
    }
    else
    {
      if (!v8)
        goto LABEL_7;
      objc_msgSend(v8, "publicPairingIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (const __CFString *)*MEMORY[0x1E0CB7D60];
    }
    objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

  }
LABEL_7:
  if ((v7 & 0x20) != 0)
  {
    if (((objc_msgSend(v4, "hmd_isForRemoteTransport") | v6) & 1) != 0)
    {
LABEL_9:
      -[HMDAppleMediaAccessory settingsController](self, "settingsController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "encodeWithCoder:", v4);

LABEL_10:
      -[HMDAccessory encodePreferredMediaUser:](self, "encodePreferredMediaUser:", v4);
      goto LABEL_15;
    }
    if (v5 && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      if (-[HMDAppleMediaAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
        goto LABEL_10;
      goto LABEL_9;
    }
  }
LABEL_15:
  if ((v7 & 0x841) != 0 || (v7 & 0x10) != 0 && -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"))
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      if (!objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
        goto LABEL_24;
      -[HMDAppleMediaAccessory deviceForDirectMessaging](self, "deviceForDirectMessaging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "idsIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("HM.accountIdentifier"));

      objc_msgSend(v4, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB7BB0]);
      -[HMDAppleMediaAccessory device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rpIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceIRK");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v18, *MEMORY[0x1E0CB7BB8]);

    }
    else
    {
      -[HMDAppleMediaAccessory device](self, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB7BB0]);
    }

  }
LABEL_24:
  if ((v7 & 0x41) != 0 || -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory") && (v7 & 0x10) != 0)
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      v19 = -[HMDAppleMediaAccessory isDeviceReachable](self, "isDeviceReachable");
      objc_msgSend(v4, "encodeBool:forKey:", v19, *MEMORY[0x1E0CB7B80]);
      if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
      {
        v20 = -[HMDAppleMediaAccessory supportsTargetControl](self, "supportsTargetControl");
        objc_msgSend(v4, "encodeBool:forKey:", v20, *MEMORY[0x1E0CB8100]);
        v21 = -[HMDAppleMediaAccessory supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
        objc_msgSend(v4, "encodeBool:forKey:", v21, *MEMORY[0x1E0CB8068]);
        v22 = -[HMDAppleMediaAccessory supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
        objc_msgSend(v4, "encodeBool:forKey:", v22, *MEMORY[0x1E0CB8060]);
        v23 = -[HMDAppleMediaAccessory supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
        objc_msgSend(v4, "encodeBool:forKey:", v23, *MEMORY[0x1E0CB80E0]);
        v24 = -[HMDAppleMediaAccessory supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
        objc_msgSend(v4, "encodeBool:forKey:", v24, *MEMORY[0x1E0CB80C0]);
        v25 = -[HMDAppleMediaAccessory supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime");
        objc_msgSend(v4, "encodeBool:forKey:", v25, *MEMORY[0x1E0CB8070]);
        v26 = -[HMDAppleMediaAccessory supportsMediaContentProfile](self, "supportsMediaContentProfile");
        objc_msgSend(v4, "encodeBool:forKey:", v26, *MEMORY[0x1E0CB80A8]);
        objc_msgSend(v4, "encodeBool:forKey:", 1, *MEMORY[0x1E0CB7C88]);
        if (_os_feature_enabled_impl())
        {
          v27 = -[HMDAppleMediaAccessory supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
          objc_msgSend(v4, "encodeBool:forKey:", v27, *MEMORY[0x1E0CB80D0]);
        }
        if (_os_feature_enabled_impl())
        {
          v28 = -[HMDAppleMediaAccessory supportsJustSiri](self, "supportsJustSiri");
          objc_msgSend(v4, "encodeBool:forKey:", v28, *MEMORY[0x1E0CB8088]);
        }
        os_unfair_recursive_lock_lock_with_options();
        -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_recursive_lock_unlock();
        -[HMDAppleMediaAccessory encodeServicesFromHostedAccessories:coder:](self, "encodeServicesFromHostedAccessories:coder:", v30, v4);
        -[HMDAppleMediaAccessory encodeFlagsFromHostedAccessories:coder:](self, "encodeFlagsFromHostedAccessories:coder:", v30, v4);

      }
      if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory homePodVariant](self, "homePodVariant"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v31, *MEMORY[0x1E0CB91B8]);

      }
      if (-[HMDAppleMediaAccessory isHomePod](self, "isHomePod"))
      {
        v32 = -[HMDAppleMediaAccessory supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
        objc_msgSend(v4, "encodeBool:forKey:", v32, *MEMORY[0x1E0CB8090]);
        v33 = -[HMDAppleMediaAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
        objc_msgSend(v4, "encodeBool:forKey:", v33, *MEMORY[0x1E0CB80B0]);
        v34 = -[HMDAppleMediaAccessory supportsSoftwareUpdateV2](self, "supportsSoftwareUpdateV2");
        objc_msgSend(v4, "encodeBool:forKey:", v34, *MEMORY[0x1E0CB80D8]);
      }
    }
    if (!objc_msgSend(v4, "hmd_isForXPCTransport")
      || objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDAppleMediaAccessory softwareVersion](self, "softwareVersion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v35, *MEMORY[0x1E0CB8030]);

      -[HMDAppleMediaAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v36, *MEMORY[0x1E0CB81B0]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v37, *MEMORY[0x1E0CB9DE0]);

      v38 = -[HMDAppleMediaAccessory productColor](self, "productColor");
      objc_msgSend(v4, "encodeInteger:forKey:", v38, *MEMORY[0x1E0CB98C8]);
      -[HMDAppleMediaAccessory _encodeMediaDestinationAndControllerDataWithCoder:](self, "_encodeMediaDestinationAndControllerDataWithCoder:", v4);
    }
    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0
      || objc_msgSend(v4, "hmd_isForXPCTransport")
      && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      -[HMDAppleMediaAccessory remoteLoginHandler](self, "remoteLoginHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v39, *MEMORY[0x1E0CB7DC8]);

    }
  }

}

- (void)encodeServicesFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "hmd_isForXPCTransport") & 1) != 0)
  {
    objc_msgSend(v13, "na_flatMap:", &__block_literal_global_393);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_firstObjectPassingTest:", &__block_literal_global_396);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hapMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHAPAccessory encodeServices:forXPCCoder:metadata:](HMDHAPAccessory, "encodeServices:forXPCCoder:metadata:", v6, v5, v8);
  }
  else
  {
    v9 = (HMDAppleMediaAccessory *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessory encodeFlagsFromHostedAccessories:coder:](v9, v10, v11, v12);
  }
}

- (void)encodeFlagsFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v5;
  void *v6;
  HMDAppleMediaAccessory *v7;
  SEL v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if ((objc_msgSend(v5, "hmd_isForXPCTransport") & 1) != 0)
  {
    objc_msgSend(v9, "na_reduceWithInitialValue:reducer:", &unk_1E8B33540, &__block_literal_global_400_91957);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("accessoryFlagsCodingKey"));

  }
  else
  {
    v7 = (HMDAppleMediaAccessory *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessory dumpState](v7, v8);
  }
}

- (id)dumpState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory dumpState](&v15, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D27F80];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E0D27F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", device: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_map:", &__block_literal_global_408);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", hosted accessory uuids: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v5);

  return v4;
}

- (id)dumpSimpleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory dumpSimpleState](&v12, sel_dumpSimpleState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0D27F80];
  objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x1E0D27F80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessory device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", device: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v5);
  return v4;
}

- (id)dumpStateLocalSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAppleMediaAccessory *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAppleMediaAccessory *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessory uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventStoreReadHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessory _dumpStateCachedSettingsForHome:accessory:eventStoreReadHandle:](self, "_dumpStateCachedSettingsForHome:accessory:eventStoreReadHandle:", v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Media accessory that has a home but does not have home manager", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      v9 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Media accessory does not have a home", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (id)_dumpStateCachedSettingsForHome:(id)a3 accessory:(id)a4 eventStoreReadHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMDAppleMediaAccessory *v21;
  NSObject *v22;
  HMDAppleMediaAccessory *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingsEventHelper *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(HMDAccessorySettingsEventHelper);
  v28 = v9;
  v29 = v8;
  -[HMDAccessorySettingsEventHelper allTopicsForHome:accessory:](v27, "allTopicsForHome:accessory:", v8, v9);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v31 = v10;
    v32 = *(_QWORD *)v37;
    do
    {
      v14 = 0;
      v33 = v12;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14);
        objc_msgSend(v10, "lastEventForTopic:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v35 = 0;
          objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v16, &v35);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v35;
          if (v18)
          {
            v19 = v18;
            v20 = (void *)MEMORY[0x1D17BA0A0]();
            v21 = self;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v23 = self;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v41 = v24;
              v42 = 2112;
              v43 = v15;
              v44 = 2112;
              v45 = v19;
              _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Error decoding stored setting for topic %@, error: %@", buf, 0x20u);

              self = v23;
              v10 = v31;
            }

            objc_autoreleasePoolPop(v20);
            v13 = v32;
            v12 = v33;
          }
          else
          {
            if (!v17)
              goto LABEL_14;
            objc_msgSend(v17, "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "keyPath");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v19, v25);

          }
        }
LABEL_14:

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v12);
  }

  return v30;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentRoomForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessory room](self, "room", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (int64_t)numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (int64_t)numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[HMDAppleMediaAccessory hostedAccessories](self, "hostedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v6, "na_map:", &__block_literal_global_418);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDAccessory home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "triggers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
    v13[3] = &unk_1E89B1230;
    v14 = v7;
    objc_msgSend(v9, "na_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[5];

  -[HMDAccessory home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke;
  v9[3] = &unk_1E89B8BB8;
  v9[4] = self;
  objc_msgSend(v5, "na_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (void)currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D28690], "productInfo", a3);
}

- (id)appleMediaProfileForAccessoryUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMDMediaAccessory mediaProfile](self, "mediaProfile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)infoSubscriber:(id)a3 didReceiveWiFiInfoUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessory *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Set wifi info to: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAppleMediaAccessory setWifiNetworkInfo:](v9, "setWifiNetworkInfo:", v7);

}

- (id)accessoryBrowserForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryWithUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAppleMediaAccessory *)v7;
}

- (id)homeUUIDForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isResidentConfirmedForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResident");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConfirmed");

  return v5;
}

- (id)notificationCenterForAppleMediaAccessorySensorManager:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
}

- (void)performLocalAddAccessoryWithDescription:(id)a3 progressHandlerDelegate:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[HMDAccessory home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "performLocalAddAccessoryWithDescription:progressHandlerDelegate:completion:", v13, v8, v9);
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

  }
}

- (void)renameService:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessory *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE location[12];
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

    v29[0] = CFSTR("kServiceInstanceID");
    objc_msgSend(v6, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("kServiceName");
    v30[0] = v12;
    v30[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", *MEMORY[0x1E0CBABF0], v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __45__HMDAppleMediaAccessory_renameService_name___block_invoke;
    v24 = &unk_1E89BAE00;
    objc_copyWeak(&v28, (id *)location);
    v25 = v6;
    v15 = v8;
    v26 = v15;
    v27 = v7;
    objc_msgSend(v14, "setResponseHandler:", &v21);
    -[HMDAccessory home](self, "home", v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "isCurrentDevicePrimaryResident");
    objc_msgSend(v15, "_handleRenameService:", v14);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v20;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to rename service %@ to %@ as it has no accessory", location, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)residentNotificationObjectForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessoriesWithHostUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  -[HMDAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke;
  v11[3] = &unk_1E89B53F8;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "na_filter:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isReadyForSensorPairing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke;
  v8[3] = &unk_1E89BD690;
  v9 = v3;
  v6 = v3;
  LOBYTE(v4) = objc_msgSend(v5, "na_any:", v8);

  return (char)v4;
}

- (id)logSubmitterForAppleMediaAccessorySensorManager:(id)a3
{
  return +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter", a3);
}

- (id)fetchSentinelZoneDidFinishFutureForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hh2FrameworkSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSentinelZoneDidFinishFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accountHasSentinelZoneForAppleMediaAccessorySensorManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDAccessory home](self, "home", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hh2FrameworkSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkExistenceOfHH2SentinelZone");

  return v6;
}

- (void)performAfterDelay:(double)a3 block:(id)a4 queue:(id)a5
{
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  dispatch_block_t block;

  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  block = a4;
  v8 = dispatch_time(0, v6);
  dispatch_after(v8, v7, block);

}

- (HMDRemoteLoginHandler)remoteLoginHandler
{
  return (HMDRemoteLoginHandler *)objc_getProperty(self, a2, 536, 1);
}

- (HMDTargetControlManager)targetControlManager
{
  return self->_targetControlManager;
}

- (void)setTargetControlManager:(id)a3
{
  objc_storeStrong((id *)&self->_targetControlManager, a3);
}

- (HMDAccessorySettingsController)settingsController
{
  return (HMDAccessorySettingsController *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSettingsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSArray)supportedMultiUserLanguageCodes
{
  return (NSArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSupportedMultiUserLanguageCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (HMDMediaDestinationManager)audioDestinationManager
{
  return (HMDMediaDestinationManager *)objc_getProperty(self, a2, 632, 1);
}

- (void)setAudioDestinationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (HMDMediaDestinationController)audioDestinationController
{
  return (HMDMediaDestinationController *)objc_getProperty(self, a2, 640, 1);
}

- (void)setAudioDestinationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (HMDAudioAnalysisRequestManager)audioAnalysisRequestManager
{
  return (HMDAudioAnalysisRequestManager *)objc_getProperty(self, a2, 648, 1);
}

- (void)setAudioAnalysisRequestManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (HMDAudioAnalysisEventSubscriber)audioAnalysisEventSubscriber
{
  return (HMDAudioAnalysisEventSubscriber *)objc_getProperty(self, a2, 656, 1);
}

- (void)setAudioAnalysisEventSubscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (int64_t)fallbackMediaUserType
{
  return self->_fallbackMediaUserType;
}

- (HMFPairingIdentity)lastCreatedPairingIdentity
{
  return self->_lastCreatedPairingIdentity;
}

- (void)setLastCreatedPairingIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_lastCreatedPairingIdentity, a3);
}

- (HMDAppleMediaAccessoryModelDataSource)modelDataSource
{
  return (HMDAppleMediaAccessoryModelDataSource *)objc_getProperty(self, a2, 680, 1);
}

- (id)deviceMediaRouteIdentifierFactory
{
  return objc_getProperty(self, a2, 688, 1);
}

- (HMDAppleMediaAccessorySleepWakeStateController)sleepWakeStateController
{
  return (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 696, 1);
}

- (void)setSleepWakeStateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (HMDPreferredMediaUserEventController)preferredMediaUserEventController
{
  return (HMDPreferredMediaUserEventController *)objc_getProperty(self, a2, 704, 1);
}

- (void)setPreferredMediaUserEventController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (HMDAppleMediaAccessoryDependencyFactory)dependencyFactory
{
  return self->_dependencyFactory;
}

- (void)setDependencyFactory:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyFactory, a3);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return self->_darwinNotificationProvider;
}

- (void)setDarwinNotificationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, a3);
}

- (HMDAccessorySymptomHandler)symptomsHandler
{
  return (HMDAccessorySymptomHandler *)objc_getProperty(self, a2, 728, 1);
}

- (void)setSymptomsHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (HMDAppleMediaAccessoryMessenger)messenger
{
  return (HMDAppleMediaAccessoryMessenger *)objc_getProperty(self, a2, 736, 1);
}

- (void)setMessenger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (HMDMediaDestinationControllerFactory)mediaDestinationControllerFactory
{
  return (HMDMediaDestinationControllerFactory *)objc_loadWeakRetained((id *)&self->_mediaDestinationControllerFactory);
}

- (void)setMediaDestinationControllerFactory:(id)a3
{
  objc_storeWeak((id *)&self->_mediaDestinationControllerFactory, a3);
}

- (HMDMediaDestinationManagerFactory)mediaDestinationManagerFactory
{
  return (HMDMediaDestinationManagerFactory *)objc_loadWeakRetained((id *)&self->_mediaDestinationManagerFactory);
}

- (void)setMediaDestinationManagerFactory:(id)a3
{
  objc_storeWeak((id *)&self->_mediaDestinationManagerFactory, a3);
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 760, 1);
}

- (void)setWifiManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (HMDAppleMediaAccessoryMetricsDispatcher)metricsDispatcher
{
  return (HMDAppleMediaAccessoryMetricsDispatcher *)objc_getProperty(self, a2, 768, 1);
}

- (void)setMetricsDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (NSHashTable)hostedAccessories
{
  return (NSHashTable *)objc_getProperty(self, a2, 776, 1);
}

- (HMDSoftwareUpdateEventProvider)softwareUpdateProvider
{
  return (HMDSoftwareUpdateEventProvider *)objc_getProperty(self, a2, 784, 1);
}

- (void)setSoftwareUpdateProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (HMDSoftwareUpdateInstallProvider)softwareUpdateInstallProvider
{
  return (HMDSoftwareUpdateInstallProvider *)objc_getProperty(self, a2, 792, 1);
}

- (void)setSoftwareUpdateInstallProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (BOOL)fixedPairingIdentityInCloud
{
  return self->_fixedPairingIdentityInCloud;
}

- (void)setFixedPairingIdentityInCloud:(BOOL)a3
{
  self->_fixedPairingIdentityInCloud = a3;
}

- (HMDAppleMediaAccessoryDataSource)dataSource
{
  return (HMDAppleMediaAccessoryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDAppleMediaAccessorySensorManager)sensorManager
{
  return (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 808, 1);
}

- (void)setSensorManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (HMDFetchedAccessorySettingsController)currentAccessorySettingsController
{
  return (HMDFetchedAccessorySettingsController *)objc_getProperty(self, a2, 816, 1);
}

- (void)setCurrentAccessorySettingsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (HMDAppleMediaAccessoryInfoController)currentAccessoryInfoController
{
  return (HMDAppleMediaAccessoryInfoController *)objc_getProperty(self, a2, 824, 1);
}

- (void)setCurrentAccessoryInfoController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (HMDAppleMediaAccessoryInfoSubscriber)accessoryInfoSubscriber
{
  return (HMDAppleMediaAccessoryInfoSubscriber *)objc_getProperty(self, a2, 832, 1);
}

- (void)setAccessoryInfoSubscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (id)settingsConnectionFactory
{
  return objc_getProperty(self, a2, 840, 1);
}

- (void)setSettingsConnectionFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 840);
}

- (BOOL)isAudioAnalysisEventNotificationEnabled
{
  return self->_audioAnalysisEventNotificationEnabled;
}

- (void)setAudioAnalysisEventNotificationEnabled:(BOOL)a3
{
  self->_audioAnalysisEventNotificationEnabled = a3;
}

- (NSPredicate)audioAnalysisEventNotificationCondition
{
  return (NSPredicate *)objc_getProperty(self, a2, 848, 1);
}

- (void)setAudioAnalysisEventNotificationCondition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAnalysisEventNotificationCondition, 0);
  objc_storeStrong(&self->_settingsConnectionFactory, 0);
  objc_storeStrong((id *)&self->_accessoryInfoSubscriber, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfoController, 0);
  objc_storeStrong((id *)&self->_currentAccessorySettingsController, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_softwareUpdateInstallProvider, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProvider, 0);
  objc_storeStrong((id *)&self->_hostedAccessories, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_mediaDestinationManagerFactory);
  objc_destroyWeak((id *)&self->_mediaDestinationControllerFactory);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserEventController, 0);
  objc_storeStrong((id *)&self->_sleepWakeStateController, 0);
  objc_storeStrong(&self->_deviceMediaRouteIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_modelDataSource, 0);
  objc_storeStrong((id *)&self->_lastCreatedPairingIdentity, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEventSubscriber, 0);
  objc_storeStrong((id *)&self->_audioAnalysisRequestManager, 0);
  objc_storeStrong((id *)&self->_audioDestinationController, 0);
  objc_storeStrong((id *)&self->_audioDestinationManager, 0);
  objc_storeStrong((id *)&self->_supportedMultiUserLanguageCodes, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_targetControlManager, 0);
  objc_storeStrong((id *)&self->_rawCapabilities, 0);
  objc_storeStrong((id *)&self->_capabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_lastStagedWifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_wifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_remoteLoginHandler, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_committedAudioDestinationControllerData, 0);
  objc_storeStrong((id *)&self->_committedAudioDestination, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

uint64_t __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "hostAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __45__HMDAppleMediaAccessory_renameService_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    v14 = v6;
    v15 = *(_QWORD *)(a1 + 48);
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v15;
    v6 = v14;
    v8 = v13;
    v26 = 2112;
    v27 = v16;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Did complete renaming service %@ on accessory %@ to %@ after sensor pairing with success: %@/%@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v8);

}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
  v6[3] = &unk_1E89B2AC8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_1E89B1258;
    v10[4] = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "characteristicBaseEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_1E89B1208;
    v11 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4;
  v8[3] = &unk_1E89BA910;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

id __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __35__HMDAppleMediaAccessory_dumpState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __65__HMDAppleMediaAccessory_encodeFlagsFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "accessoryFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") | v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hapMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

id __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke_2()
{
  return objc_alloc_init(MEMORY[0x1E0CFE9B0]);
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke()
{
  return (id)_mediaRouteIdentifier;
}

uint64_t __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke_2(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error adding group %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __89__HMDAppleMediaAccessory_migrateAudioDestinationWithCloudZone_migrationQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__HMDAppleMediaAccessory_migrateAudioDestinationWithCloudZone_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__HMDAppleMediaAccessory_migrateAudioDestinationControllerWithCloudZone_migrationQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__HMDAppleMediaAccessory_migrateAudioDestinationControllerWithCloudZone_migrationQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (!a4 && WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (!a4 && WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (!a4 && WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __73__HMDAppleMediaAccessory_migrateWithCloudZone_migrationQueue_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __87__HMDAppleMediaAccessory_migrateSoftwareUpdateWithCloudZone_migrationQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__HMDAppleMediaAccessory_migrateSoftwareUpdateWithCloudZone_migrationQueue_completion___block_invoke_358(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v1 + 16))(v1, MEMORY[0x1E0C9AA60], v2, 0);

}

void __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2;
    block[3] = &unk_1E89C1B48;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentNetworkSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286F0]), "initWithMACAddress:SSID:", v3, v5);
  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToNetworkInfo:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "wifiNetworkInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
        v28 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v13;
        v32 = 2112;
        v33 = v6;
        v34 = 2112;
        v35 = v14;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating WiFi network info to %@, lastCommitedWiFiInfo: %@, lastStagedWiFiInfo %@", buf, 0x2Au);

        v10 = v28;
      }

      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "transactionWithObjectChangeType:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      objc_msgSend(v18, "setWifiNetworkInfo:", v6);
      objc_msgSend(*(id *)(a1 + 32), "lastStagedWifiNetworkInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "SSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "SSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      if ((v22 & 1) != 0)
      {
        v23 = CFSTR("HMDAppleMediaAccessoryWiFiMACLocalOnlyUpdateLabel");
      }
      else
      {
        +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
        v24 = objc_claimAutoreleasedReturnValue();

        v23 = CFSTR("HMDAppleMediaAccessoryWiFiNetworkInfoUpdateLabel");
        v7 = (void *)v24;
      }
      objc_msgSend(*(id *)(a1 + 32), "setLastStagedWifiNetworkInfo:", v6, v28);
      objc_msgSend(*(id *)(a1 + 32), "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "backingStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transaction:options:", v23, v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "add:", v18);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_354;
      v29[3] = &unk_1E89C2350;
      v29[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v27, "run:", v29);

    }
  }

}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_354(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setLastStagedWifiNetworkInfo:", 0));
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Updating WiFi network info backing store transaction failed: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@SoftwareUpdateV2Scan responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@SoftwareUpdateV2Scan responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

void __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  if (WeakRetained)
  {
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Received response for HMAccessorySoftwareUpdateControllerV2ScanMessage", (uint8_t *)&v33, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    if (v5)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v9;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v15;
        v35 = 2112;
        v36 = v5;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Scan message failed with error: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithError:", v17);
      goto LABEL_22;
    }
    objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x1E0CB8018]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (v20)
    {
      v21 = objc_msgSend(v20, "BOOLValue");
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v26;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@SRAISU: scanResultFuture successfully found update", (uint8_t *)&v33, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
        goto LABEL_22;
      }
      if (!v25)
        goto LABEL_21;
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v27;
      v28 = "%{public}@SRAISU: scanResultFuture failed to find update";
      v29 = v24;
      v30 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        objc_autoreleasePoolPop(v22);
        v31 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "finishWithError:", v32);

LABEL_22:
        goto LABEL_23;
      }
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v27;
      v28 = "%{public}@SRAISU: Message did not contain required key in response: HMAccessorySoftwareUpdateControllerV2Mes"
            "sageKeyScanDidFindUpdate";
      v29 = v24;
      v30 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1CD062000, v29, v30, v28, (uint8_t *)&v33, 0xCu);

    goto LABEL_21;
  }
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
LABEL_23:

}

id __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  if (WeakRetained)
  {
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retryIntervalsRemaining: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_scanForSoftwareUpdate");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;

  return v12;
}

void __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v12 = "%{public}@SRAISU: Failed to start software update with error: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v12 = "%{public}@SRAISU: Successfully started software update";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Updated preferred media user to %@ with error: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setPreferredMediaUserUUID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredMediaUserSelectionTypeNumber:", v11);

    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredMediaUserUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredMediaUserSelectionTypeNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v17, 0x20u);

    }
  }

  objc_autoreleasePoolPop(v6);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Got preferred user update response %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v11, "respondWithError:", v5);
  else
    objc_msgSend(v11, "respondWithSuccess");

}

void __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke_342(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to update preferred media User to %@, error: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media User to %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history relay responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Delete siri history relay responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", 0);
  }

}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_340(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history operation completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[5], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history operation completed", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[5], "respondWithPayload:", 0);
  }

}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a2;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:error:", *(_QWORD *)(a1 + 32), v6);

  objc_msgSend(*(id *)(a1 + 40), "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v5)[2](v5, v6, 0);

  }
}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke_338(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@Failed to start update, %@, with error: %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v15;
    v11 = "%{public}@Successfully started update: %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitLogEvent:error:", *(_QWORD *)(a1 + 40), v3);

  objc_msgSend(*(id *)(a1 + 48), "respondWithPayload:error:", 0, v3);
}

void __48__HMDAppleMediaAccessory__fetchAvailableUpdate___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0CB9C88];
  objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x1E0CB9C88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v9)
    {
      objc_msgSend(a1[5], "setNewUpdateFetched:", 1);
      v21 = v7;
      encodeRootObjectForIncomingXPCMessage(v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = a1[4];
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v10;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to unarchive software updata from software update data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submitLogEvent:error:", a1[5], v5);

  objc_msgSend(a1[6], "responseHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(a1[6], "responseHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v19)[2](v19, v5, v12);

  }
}

void __48__HMDAppleMediaAccessory__fetchAvailableUpdate___block_invoke_331(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to start fetch with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
LABEL_5:
    v13 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched update: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(a1[4], "setNewUpdateFetched:", 1);
  v19 = *MEMORY[0x1E0CB9C88];
  encodeRootObject();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitLogEvent:error:", a1[4], v6);

  objc_msgSend(a1[5], "responseHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(a1[5], "responseHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v18)[2](v18, v6, v13);

  }
}

uint64_t __63__HMDAppleMediaAccessory__applySoftwareUpdateModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarded current device IRK error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __60__HMDAppleMediaAccessory_handleHomeUserRemovedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138544130;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = 0;
      v20 = 2112;
      v21 = v3;
      v9 = "%{public}@Updated preferred media user %@ to owner: %@ with error: %@";
      v10 = v6;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 42;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543874;
    v15 = v7;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = 0;
    v9 = "%{public}@Updated preferred media user %@ to owner: %@";
    v10 = v6;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __47__HMDAppleMediaAccessory_createPairingIdentity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[64];
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CreatePairingIdentity", ", (uint8_t *)&v13, 2u);
  }

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Saved pairing identity", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "currentAccessorySetupMetricDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markSetupEndStage:error:", 6, v3);

}

uint64_t __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is no longer reachable", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceReachable:", 0);
}

uint64_t __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is reachable", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceReachable:", 1);
}

uint64_t __70__HMDAppleMediaAccessory_handleDeviceIsPublishingChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received device is publishing notification %@, user info: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "updateReachabilityFromDevicePublishingState");
}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_293(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v5 = a2;
    objc_msgSend(v3, "respondWithError:", a3);
  }
  else
  {
    v8 = *MEMORY[0x1E0CB7CB8];
    v9[0] = a2;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a2;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondWithPayload:", v5);

  }
}

void __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

uint64_t __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_292(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

void __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetch managed configuration profiles responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch managed configuration profiles responded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v6);
  }

}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("enabled"));

  return v3;
}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("locationServices"));

  return v3;
}

void __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fixed pairing identity", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain supported multi-user languages. Error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched multi-user languages %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "setSupportedMultiUserLanguageCodes:", v5);
  }

}

void __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Audio destination removal transaction completed with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Audio destination removal transaction completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Audio destination transaction completed with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Audio destination transaction completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Upload audio destination controller finished with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Upload audio destination controller completed";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __55__HMDAppleMediaAccessory_isDoorbellChimeSettingEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("doorbellChime"));

  if (v4)
  {
    objc_msgSend(v2, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_256);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __55__HMDAppleMediaAccessory_isDoorbellChimeSettingEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("enabled")))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateSoftwareVersion:", v2);

}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_244(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%.3f"), v7 - *(double *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138546434;
      v27 = v5;
      v28 = 2114;
      v29 = CFSTR("accessoryConfigureDone");
      v30 = 2112;
      v31 = CFSTR("Configured accessory");
      v32 = 2114;
      v33 = CFSTR("state");
      v34 = 2112;
      v35 = CFSTR("end");
      v36 = 2114;
      v37 = CFSTR("duration");
      v38 = 2112;
      v39 = v8;
      v40 = 2114;
      v41 = CFSTR("homeUUID");
      v42 = 2112;
      v43 = v9;
      v44 = 2114;
      v45 = CFSTR("accessoryUUID");
      v46 = 2112;
      v47 = v10;
      v48 = 2114;
      v49 = CFSTR("accessoryType");
      v50 = 2112;
      v51 = v12;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x84u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0D334C8]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%.3f"), v16 - *(double *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v14, "initWithTag:data:", CFSTR("accessoryConfigureDone"), v22, CFSTR("state"), CFSTR("end"), CFSTR("duration"), v17, CFSTR("homeUUID"), v18, CFSTR("accessoryUUID"), v19, CFSTR("accessoryType"), v21);
    objc_msgSend(MEMORY[0x1E0D28540], "currentTagProcessorList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitTaggedEvent:processorList:", v23, v24);

  }
  v25 = *(NSObject **)(a1 + 48);
  if (v25)
    dispatch_group_leave(v25);
}

id __30__HMDAppleMediaAccessory_init__block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __30__HMDAppleMediaAccessory_init__block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0CFE9B0]);
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0CFE9B0]);
}

+ (BOOL)shouldAcceptMessage:(id)a3 home:(id)a4 privilege:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isRemote"))
  {
    if ((objc_msgSend(v7, "isSecureRemote") & 1) != 0)
    {
      objc_msgSend(v7, "matchingRemoteIdentityUserForHome:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v7, "responseHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "responseHandler");
        v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v21, 0);

        v10 = 0;
      }
      goto LABEL_30;
    }
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v19;
    v20 = "%{public}@Only secure clients may modify settings";
LABEL_16:
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v32, 0xCu);

    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isEntitledForSPIAccess") & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v19;
    v20 = "%{public}@Only entitled clients may modify settings";
    goto LABEL_16;
  }
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = v9;
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v14;
    v34 = 2112;
    v35 = v7;
    v15 = "%{public}@Unable to determine originator of message: %@";
    goto LABEL_27;
  }
  if (a5 != 3)
  {
    if (a5 == 4 && (objc_msgSend(v9, "isAdministrator") & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = v8;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_28;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v14;
      v34 = 2112;
      v35 = v10;
      v15 = "%{public}@User does not have administrator privilege: %@";
      goto LABEL_27;
    }
LABEL_22:
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v8;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v27;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Accepting message: %@", (uint8_t *)&v32, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    LOBYTE(v24) = 1;
    goto LABEL_31;
  }
  if ((objc_msgSend(v9, "isOwner") & 1) != 0)
    goto LABEL_22;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = v8;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    goto LABEL_28;
  HMFGetLogIdentifier();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 138543618;
  v33 = v14;
  v34 = 2112;
  v35 = v10;
  v15 = "%{public}@User does not have owner privilege: %@";
LABEL_27:
  _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v32, 0x16u);

LABEL_28:
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v7, "responseHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, CFSTR("Insufficient privileges."), CFSTR("User has insufficient privileges for request."), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "responseHandler");
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v29, 0);

LABEL_30:
    LOBYTE(v24) = 0;
  }
LABEL_31:

  return (char)v24;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t287 != -1)
    dispatch_once(&logCategory__hmf_once_t287, &__block_literal_global_414);
  return (id)logCategory__hmf_once_v288;
}

void __37__HMDAppleMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v288;
  logCategory__hmf_once_v288 = v0;

}

- (id)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  id *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  void *v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _QWORD v81[2];
  _QWORD v82[2];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDMediaAccessory assistantObject](&v76, sel_assistantObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAccessory category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CB7A18]);

  if ((v7 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x1E0D88B40];
    v9 = (id *)MEMORY[0x1E0D88BE0];
    goto LABEL_5;
  }
  objc_msgSend(v5, "categoryType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB7A58]);

  if ((v11 & 1) != 0)
  {
    v8 = (id *)MEMORY[0x1E0D88B80];
    v9 = (id *)MEMORY[0x1E0D88C00];
LABEL_5:
    v12 = *v9;
    v13 = *v8;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 1;
    v61 = v13;
    if (!v14)
    {
      v81[0] = CFSTR("objectServiceType");
      v81[1] = CFSTR("objectServiceSubType");
      v82[0] = v12;
      v82[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v15);

    }
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v84 = v18;
    v85 = 2112;
    v86 = v5;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Apple media accessory with invalid accessory category: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v12 = 0;
  v61 = 0;
LABEL_13:
  -[HMDAccessory home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v19, "mediaSystems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  v63 = v19;
  v64 = v4;
  v62 = v5;
  if (v22)
  {
    v23 = v22;
    v24 = v12;
    v25 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v73 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v27, "accessories");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", self);

        if (v29)
        {
          objc_msgSend(v27, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "urlString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v23)
        continue;
      break;
    }
    v30 = 0;
    v31 = 0;
LABEL_23:
    v12 = v24;
    v19 = v63;
    v4 = v64;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }

  -[HMDAppleMediaAccessory audioDestinationController](self, "audioDestinationController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "data");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "destinationIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[HMDMediaAccessory name](self, "name");
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "urlString");
    v36 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v36;
    v31 = (void *)v35;
  }
  -[HMDAppleMediaAccessory audioDestination](self, "audioDestination");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (!v31 && v37)
  {
    v66 = (void *)v37;
    v67 = v30;
    v58 = v33;
    v59 = v32;
    v60 = v12;
    objc_msgSend(v19, "accessories");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "na_map:", &__block_literal_global_111814);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v40;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v41)
    {
      v42 = v41;
      v43 = 0;
      v44 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v69 != v44)
            objc_enumerationMutation(obj);
          v46 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v46, "audioDestinationController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "data");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "destinationIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "uniqueIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v49, "hmf_isEqualToUUID:", v50);

          if (v51)
          {
            objc_msgSend(v46, "name");
            v52 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "urlString");
            v53 = objc_claimAutoreleasedReturnValue();

            v67 = (void *)v53;
            v43 = (void *)v52;
          }

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v42);
    }
    else
    {
      v43 = 0;
    }

    v19 = v63;
    v4 = v64;
    v32 = v59;
    v12 = v60;
    v38 = v66;
    v30 = v67;
    v33 = v58;
    v31 = v43;
  }
  if (v31 && v30)
  {
    v78 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("objectGroups"));

    v77 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("objectGroupIdentifiers"));

  }
  v56 = (void *)objc_msgSend(v4, "copy");

  return v56;
}

id __52__HMDAppleMediaAccessory_Assistant__assistantObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)languageValueList
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HMDAppleMediaAccessory settingsController](self, "settingsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageValueList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)configureAppleMediaAccessoryMessengerWithFactory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDAppleMediaAccessoryMessageRouter *v9;
  HMDAssistantSettingsConnection *v10;
  void *v11;
  HMDAssistantSettingsConnection *v12;
  HMDAppleMediaAccessoryLocalMessageHandler *v13;
  void *v14;
  void *v15;
  HMDAppleMediaAccessory *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessory uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v6)
    goto LABEL_10;
  v8 = (void *)v7;
  if (v7)
  {
    v9 = -[HMDAppleMediaAccessoryMessageRouter initWithIdentifier:messageDispatcher:]([HMDAppleMediaAccessoryMessageRouter alloc], "initWithIdentifier:messageDispatcher:", v5, v6);
    -[HMDAppleMediaAccessoryMessageRouter setDataSource:](v9, "setDataSource:", self);
    v10 = [HMDAssistantSettingsConnection alloc];
    objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDAssistantSettingsConnection initWithScheduler:](v10, "initWithScheduler:", v11);

    -[HMDAssistantSettingsConnection setDataSource:](v12, "setDataSource:", v12);
    v13 = -[HMDAppleMediaAccessoryLocalMessageHandler initWithIdentifier:assistantSettingsConnection:]([HMDAppleMediaAccessoryLocalMessageHandler alloc], "initWithIdentifier:assistantSettingsConnection:", v5, v12);
    -[HMDAppleMediaAccessoryLocalMessageHandler setDataSource:](v13, "setDataSource:", self);
    objc_msgSend(v4, "createAppleMediaAccessoryMessengerWithIdentifier:messageDispatcher:router:localHandler:", v5, v6, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForMessagesWithHome:", v8);
    -[HMDAppleMediaAccessory setMessenger:](self, "setMessenger:", v14);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure apple media accessory due to no home on accessory", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (id)createAppleMediaAccessoryMessengerWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDAppleMediaAccessoryMessenger *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDAppleMediaAccessoryMessenger initWithIdentifier:messageDispatcher:router:localHandler:]([HMDAppleMediaAccessoryMessenger alloc], "initWithIdentifier:messageDispatcher:router:localHandler:", v12, v11, v10, v9);

  return v13;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDAccessory home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevicePrimaryResident");

  return v3;
}

@end
