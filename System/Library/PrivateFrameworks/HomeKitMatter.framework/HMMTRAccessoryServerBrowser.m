@implementation HMMTRAccessoryServerBrowser

- (HMMTRAccessoryServerBrowser)initWithQueue:(id)a3 storeDirectoryURL:(id)a4
{
  id v6;
  id v7;
  HMMTRAccessoryServerBrowser *v8;
  uint64_t v9;
  NSMutableSet *discoveredAccessoryServers;
  uint64_t v11;
  NSMutableSet *stagedAccessoryServers;
  HMMTRStorage *v13;
  HMMTRStorage *storage;
  HMMTRResidentStateManager *v15;
  HMMTRResidentStateManager *residentStateManager;
  NSNumber *currentFabricID;
  uint64_t v18;
  NSMutableSet *fabricsWithActiveClients;
  uint64_t v20;
  NSMutableSet *fabricsWithActiveSecondaryClients;
  uint64_t v22;
  NSMutableOrderedSet *fabricsWithActiveConnections;
  uint64_t v24;
  NSMutableOrderedSet *fabricsWithPendingConnections;
  uint64_t v26;
  NSMutableSet *allowedNodeIDsForConnectionRequests;
  HMMTRThreadRadioManager *v28;
  HMMTRThreadRadioManager *threadRadioManager;
  void *v30;
  uint64_t v31;
  HMMTRVendorMetadataFileStore *v32;
  HMMTRVendorMetadataStore *vendorMetadataStore;
  void *v34;
  void *v35;
  HMMTRAttestationDataStore *v36;
  HMMTRAttestationDataStore *attestationDataStore;
  HMMTRUIDialogPresenter *v38;
  HMMTRUIDialogPresenter *uiDialogPresenter;
  HMMTRAttestationStatus *v40;
  HMMTRAttestationStatus *attestationStatus;
  HMMTRSoftwareUpdateProvider *v42;
  HMMTRSoftwareUpdateProvider *softwareUpdateProvider;
  HMMTROTAProviderDelegate *v44;
  HMMTROTAProviderDelegate *otaProviderDelegate;
  HMMTRThreadSoftwareUpdateController *v46;
  HMMTRThreadSoftwareUpdateController *threadSoftwareUpdateController;
  HMMTRSystemCommissionerPairingManager *v48;
  HMMTRSystemCommissionerPairingManager *systemCommissionerPairingManager;
  uint64_t v50;
  NSMutableSet *nodesWithPendingACLOverwrite;
  HMMTRMatterKeypair *v52;
  HMMTRMatterKeypair *nocSigner;
  HMMTRMatterKeypair *v54;
  void *v55;
  HMMTRAccessoryServerBrowser *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMMTRMatterKeypair *v62;
  HMMTRMatterKeypair *ownerSharedOperationalKeyPair;
  HMMTRMatterKeypair *v64;
  HMMTRMatterKeypair *ownerLocalOperationalKeyPair;
  HMMTRRegulatoryInfo *v66;
  HMMTRRegulatoryInfo *regulatoryInfo;
  uint64_t v68;
  NSMutableSet *nodesAddedToHome;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  HMMTRControllerFactory *v74;
  dispatch_queue_t v75;
  void *v76;
  uint64_t v77;
  HMMTRControllerFactory *controllerFactory;
  HMMTRFabricControllerStore *v79;
  dispatch_queue_t v80;
  uint64_t v81;
  HMMTRFabricControllerStore *homeFabricControllers;
  HMMTRSystemCommissionerControllerParams *v83;
  dispatch_queue_t v84;
  uint64_t v85;
  HMMTRSystemCommissionerControllerParams *systemCommissionerControllerParams;
  void *v87;
  void *v88;
  HMMTRPairingWindowInfoTable *v89;
  HMMTRPairingWindowInfoTable *pairingWindowInfoTable;
  uint64_t v91;
  NSMutableArray *deviceControllerHandlers;
  HMMTRUserAuthorizationForPairing *v94;
  void *v95;
  id v96;
  objc_super v97;
  uint8_t buf[4];
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v97.receiver = self;
  v97.super_class = (Class)HMMTRAccessoryServerBrowser;
  v8 = -[HAPAccessoryServerBrowser initWithQueue:](&v97, sel_initWithQueue_, v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    discoveredAccessoryServers = v8->_discoveredAccessoryServers;
    v8->_discoveredAccessoryServers = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    stagedAccessoryServers = v8->_stagedAccessoryServers;
    v8->_stagedAccessoryServers = (NSMutableSet *)v11;

    v13 = -[HMMTRStorage initWithQueue:]([HMMTRStorage alloc], "initWithQueue:", v6);
    storage = v8->_storage;
    v8->_storage = v13;

    -[HMMTRStorage setDelegate:](v8->_storage, "setDelegate:", v8);
    v15 = objc_alloc_init(HMMTRResidentStateManager);
    residentStateManager = v8->_residentStateManager;
    v8->_residentStateManager = v15;

    currentFabricID = v8->_currentFabricID;
    v8->_currentFabricID = 0;

    v8->_browserState = 0;
    -[HMMTRResidentStateManager setDelegate:](v8->_residentStateManager, "setDelegate:", v8);
    *((_DWORD *)&v8->_fabricSetLock + 1) = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    fabricsWithActiveClients = v8->_fabricsWithActiveClients;
    v8->_fabricsWithActiveClients = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    fabricsWithActiveSecondaryClients = v8->_fabricsWithActiveSecondaryClients;
    v8->_fabricsWithActiveSecondaryClients = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v22 = objc_claimAutoreleasedReturnValue();
    fabricsWithActiveConnections = v8->_fabricsWithActiveConnections;
    v8->_fabricsWithActiveConnections = (NSMutableOrderedSet *)v22;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v24 = objc_claimAutoreleasedReturnValue();
    fabricsWithPendingConnections = v8->_fabricsWithPendingConnections;
    v8->_fabricsWithPendingConnections = (NSMutableOrderedSet *)v24;

    v8->_connectionRequestSuspended = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    allowedNodeIDsForConnectionRequests = v8->_allowedNodeIDsForConnectionRequests;
    v8->_allowedNodeIDsForConnectionRequests = (NSMutableSet *)v26;

    v28 = -[HMMTRThreadRadioManager initWithBrowser:]([HMMTRThreadRadioManager alloc], "initWithBrowser:", v8);
    threadRadioManager = v8->_threadRadioManager;
    v8->_threadRadioManager = v28;

    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("chip-vendor-metadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URLByAppendingPathExtension:", CFSTR("plist"));
    v31 = objc_claimAutoreleasedReturnValue();

    v95 = (void *)v31;
    v32 = -[HMMTRVendorMetadataFileStore initWithFileURL:]([HMMTRVendorMetadataFileStore alloc], "initWithFileURL:", v31);
    vendorMetadataStore = v8->_vendorMetadataStore;
    v8->_vendorMetadataStore = (HMMTRVendorMetadataStore *)v32;

    v96 = v7;
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("chip-attestation-data-store"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "URLByAppendingPathExtension:", CFSTR("plist"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = -[HMMTRAttestationDataStore initWithFileURL:]([HMMTRAttestationDataStore alloc], "initWithFileURL:", v35);
    attestationDataStore = v8->_attestationDataStore;
    v8->_attestationDataStore = v36;

    v38 = -[HMMTRUIDialogPresenter initWithQueue:context:]([HMMTRUIDialogPresenter alloc], "initWithQueue:context:", v6, v8);
    uiDialogPresenter = v8->_uiDialogPresenter;
    v8->_uiDialogPresenter = v38;

    v40 = -[HMMTRAttestationStatus initWithQueue:uiDialogPresenter:failSafeExpiryTimeoutSecs:]([HMMTRAttestationStatus alloc], "initWithQueue:uiDialogPresenter:failSafeExpiryTimeoutSecs:", v6, v8->_uiDialogPresenter, &unk_250F3F8E8);
    attestationStatus = v8->_attestationStatus;
    v8->_attestationStatus = v40;

    v94 = -[HMMTRUserAuthorizationForPairing initWithUiDialogPresenter:]([HMMTRUserAuthorizationForPairing alloc], "initWithUiDialogPresenter:", v8->_uiDialogPresenter);
    -[HMMTRAttestationStatus setUserAuthorizationDelegate:](v8->_attestationStatus, "setUserAuthorizationDelegate:");
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v42 = -[HMMTRSoftwareUpdateProvider initWithQueue:browser:]([HMMTRSoftwareUpdateProvider alloc], "initWithQueue:browser:", v6, v8);
      softwareUpdateProvider = v8->_softwareUpdateProvider;
      v8->_softwareUpdateProvider = v42;

      v44 = -[HMMTROTAProviderDelegate initWithQueue:browser:]([HMMTROTAProviderDelegate alloc], "initWithQueue:browser:", v6, v8);
      otaProviderDelegate = v8->_otaProviderDelegate;
      v8->_otaProviderDelegate = v44;

      v46 = -[HMMTRThreadSoftwareUpdateController initWithQueue:browser:]([HMMTRThreadSoftwareUpdateController alloc], "initWithQueue:browser:", v6, v8);
      threadSoftwareUpdateController = v8->_threadSoftwareUpdateController;
      v8->_threadSoftwareUpdateController = v46;

    }
    v48 = -[HMMTRSystemCommissionerPairingManager initWithQueue:accessoryServerBrowser:]([HMMTRSystemCommissionerPairingManager alloc], "initWithQueue:accessoryServerBrowser:", v6, v8);
    systemCommissionerPairingManager = v8->_systemCommissionerPairingManager;
    v8->_systemCommissionerPairingManager = v48;

    v8->_requestedBLEScan = 0;
    v8->_bleScanActive = 0;
    v8->_restartCount = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v50 = objc_claimAutoreleasedReturnValue();
    nodesWithPendingACLOverwrite = v8->_nodesWithPendingACLOverwrite;
    v8->_nodesWithPendingACLOverwrite = (NSMutableSet *)v50;

    v52 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeopcerts.CA:0"));
    nocSigner = v8->_nocSigner;
    v8->_nocSigner = v52;

    v8->_systemCommissionerFeatureEnabled = -[HMMTRAccessoryServerBrowser _isSystemCommissionerFeaturePreferenceEnabled](v8, "_isSystemCommissionerFeaturePreferenceEnabled");
    v54 = v8->_nocSigner;
    if (!v54)
    {
      v55 = (void *)MEMORY[0x242656984]();
      v56 = v8;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v99 = v58;
        _os_log_impl(&dword_23E95B000, v57, OS_LOG_TYPE_ERROR, "%{public}@!!! NOC Signer keypair failed to load, browser may not be operational !!!", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v55);
      v54 = v8->_nocSigner;
    }
    -[HMMTRStorage setNocSigner:](v8->_storage, "setNocSigner:", v54);
    v59 = (void *)MEMORY[0x24BDD16E0];
    -[HMMTRAccessoryServerBrowser appleHomeFabricRootPublicKey](v8, "appleHomeFabricRootPublicKey");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "numberWithUnsignedInteger:", objc_msgSend(v60, "hash"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRStorage setCertificateIssuerID:](v8->_storage, "setCertificateIssuerID:", v61);

    v62 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeOperationalKeyPair.CA:0"));
    ownerSharedOperationalKeyPair = v8->_ownerSharedOperationalKeyPair;
    v8->_ownerSharedOperationalKeyPair = v62;

    -[HMMTRStorage setOperationalKeyPair:](v8->_storage, "setOperationalKeyPair:", v8->_ownerSharedOperationalKeyPair);
    v64 = -[HMMTRMatterKeypair initAsDeviceLocal]([HMMTRMatterKeypair alloc], "initAsDeviceLocal");
    ownerLocalOperationalKeyPair = v8->_ownerLocalOperationalKeyPair;
    v8->_ownerLocalOperationalKeyPair = v64;

    v66 = objc_alloc_init(HMMTRRegulatoryInfo);
    regulatoryInfo = v8->_regulatoryInfo;
    v8->_regulatoryInfo = v66;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v68 = objc_claimAutoreleasedReturnValue();
    nodesAddedToHome = v8->_nodesAddedToHome;
    v8->_nodesAddedToHome = (NSMutableSet *)v68;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = *MEMORY[0x24BE1B8B8];
    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObserver:selector:name:object:", v8, sel_handleSystemKeychainStoreUpdatedNotification_, v71, v72);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObserver:selector:name:object:", v8, sel_handleThreadNetworkStateChangedNotification_, CFSTR("HMMTRThreadRadioStateChangedNotification"), 0);

    v74 = [HMMTRControllerFactory alloc];
    v75 = dispatch_queue_create("HMMTRControllerFactory queue", 0);
    -[HMMTRAccessoryServerBrowser _populateControllerFactoryParams](v8, "_populateControllerFactoryParams");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[HMMTRControllerFactory initWithWorkQueue:factoryParams:](v74, "initWithWorkQueue:factoryParams:", v75, v76);
    controllerFactory = v8->_controllerFactory;
    v8->_controllerFactory = (HMMTRControllerFactory *)v77;

    v79 = [HMMTRFabricControllerStore alloc];
    v80 = dispatch_queue_create("HMMTRFabricControllerStore queue", 0);
    v81 = -[HMMTRFabricControllerStore initWithQueue:controllerFactory:](v79, "initWithQueue:controllerFactory:", v80, v8->_controllerFactory);
    homeFabricControllers = v8->_homeFabricControllers;
    v8->_homeFabricControllers = (HMMTRFabricControllerStore *)v81;

    if (-[HMMTRAccessoryServerBrowser _isSystemCommissionerFeaturePreferenceEnabled](v8, "_isSystemCommissionerFeaturePreferenceEnabled"))
    {
      v83 = [HMMTRSystemCommissionerControllerParams alloc];
      v84 = dispatch_queue_create("HMMTRSystemCommissionerControllerParams queue", 0);
      v85 = -[HMMTRSystemCommissionerControllerParams initWithQueue:controllerFactory:](v83, "initWithQueue:controllerFactory:", v84, v8->_controllerFactory);
      systemCommissionerControllerParams = v8->_systemCommissionerControllerParams;
      v8->_systemCommissionerControllerParams = (HMMTRSystemCommissionerControllerParams *)v85;

      if (-[HMMTRAccessoryServerBrowser _isPerControllerStorageEnabled](v8, "_isPerControllerStorageEnabled"))
      {
        -[HMMTRAttestationDataStore paaCertificates](v8->_attestationDataStore, "paaCertificates");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSystemCommissionerControllerParams setProductAttestationAuthorityCertificates:](v8->_systemCommissionerControllerParams, "setProductAttestationAuthorityCertificates:", v87);

        -[HMMTRAttestationDataStore cdCertificates](v8->_attestationDataStore, "cdCertificates");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSystemCommissionerControllerParams setCertificationDeclarationCertificates:](v8->_systemCommissionerControllerParams, "setCertificationDeclarationCertificates:", v88);

      }
    }
    v89 = objc_alloc_init(HMMTRPairingWindowInfoTable);
    pairingWindowInfoTable = v8->_pairingWindowInfoTable;
    v8->_pairingWindowInfoTable = v89;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v91 = objc_claimAutoreleasedReturnValue();
    deviceControllerHandlers = v8->_deviceControllerHandlers;
    v8->_deviceControllerHandlers = (NSMutableArray *)v91;

    v7 = v96;
  }

  return v8;
}

- (id)_populateControllerFactoryParams
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HMMTRAccessoryServerBrowser _isPerControllerStorageEnabled](self, "_isPerControllerStorageEnabled"))
  {
    v3 = 0;
  }
  else
  {
    +[HMMTRControllerFactory factoryParamsWithCommonStorage](HMMTRControllerFactory, "factoryParamsWithCommonStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAttestationDataStore paaCertificates](self->_attestationDataStore, "paaCertificates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProductAttestationAuthorityCertificates:", v4);

    -[HMMTRAttestationDataStore cdCertificates](self->_attestationDataStore, "cdCertificates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCertificationDeclarationCertificates:", v5);

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      objc_msgSend(v3, "setOtaProviderDelegate:", self->_otaProviderDelegate);
    }
  }
  return v3;
}

- (NSSet)fabricsWithActiveClients
{
  os_unfair_lock_s *v3;
  void *v4;

  v3 = &self->_fabricSetLock + 1;
  os_unfair_lock_lock(&self->_fabricSetLock + 1);
  v4 = (void *)-[NSMutableSet copy](self->_fabricsWithActiveClients, "copy");
  os_unfair_lock_unlock(v3);
  return (NSSet *)v4;
}

- (NSSet)fabricsWithActiveSecondaryClients
{
  os_unfair_lock_s *v3;
  void *v4;

  v3 = &self->_fabricSetLock + 1;
  os_unfair_lock_lock(&self->_fabricSetLock + 1);
  v4 = (void *)-[NSMutableSet copy](self->_fabricsWithActiveSecondaryClients, "copy");
  os_unfair_lock_unlock(v3);
  return (NSSet *)v4;
}

- (void)addFabricWithActiveClients:(id)a3
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = &self->_fabricSetLock + 1;
  v5 = a3;
  os_unfair_lock_lock(v4);
  -[NSMutableSet addObject:](self->_fabricsWithActiveClients, "addObject:", v5);

  os_unfair_lock_unlock(v4);
}

- (void)removeFabricWithActiveClients:(id)a3
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = &self->_fabricSetLock + 1;
  v5 = a3;
  os_unfair_lock_lock(v4);
  -[NSMutableSet removeObject:](self->_fabricsWithActiveClients, "removeObject:", v5);

  os_unfair_lock_unlock(v4);
}

- (void)addFabricWithActiveSecondaryClients:(id)a3
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = &self->_fabricSetLock + 1;
  v5 = a3;
  os_unfair_lock_lock(v4);
  -[NSMutableSet addObject:](self->_fabricsWithActiveSecondaryClients, "addObject:", v5);

  os_unfair_lock_unlock(v4);
}

- (void)removeFabricWithActiveSecondaryClients:(id)a3
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = &self->_fabricSetLock + 1;
  v5 = a3;
  os_unfair_lock_lock(v4);
  -[NSMutableSet removeObject:](self->_fabricsWithActiveSecondaryClients, "removeObject:", v5);

  os_unfair_lock_unlock(v4);
}

- (void)configure
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  HMMTRAccessoryServerBrowser *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HMMTRAccessoryServerBrowser *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HMMTRAccessoryServerBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  HMMTRAccessoryServerBrowser *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  HMMTRAccessoryServerBrowser *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  HMMTRAccessoryServerBrowser *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  BOOL v44;
  HMMTRAccessoryServerBrowser *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  HMMTRAccessoryServerBrowser *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint32_t v59;
  void *v60;
  HMMTRAccessoryServerBrowser *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  BOOL v66;
  HMMTRAccessoryServerBrowser *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  _QWORD handler[4];
  id v75;
  id location;
  int out_token;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  uint32_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "productClass");

    if (v4 == 3)
    {
      v5 = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForIPadEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
      v6 = (void *)MEMORY[0x242656984]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v9)
        {
          HMFGetLogIdentifier();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v70;
          _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature for iPad is enabled", buf, 0xCu);

        }
      }
      else if (v9)
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v10;
        _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature for iPad is enabled through profile", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "productPlatform");

      if (v24 == 1)
      {
        v25 = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForMacEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
        v6 = (void *)MEMORY[0x242656984]();
        v26 = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        if (v25)
        {
          if (v27)
          {
            HMFGetLogIdentifier();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v79 = v71;
            _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature for Mac is enabled", buf, 0xCu);

          }
        }
        else if (v27)
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v28;
          _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature for Mac is enabled through profile", buf, 0xCu);

        }
      }
      else
      {
        v66 = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
        v6 = (void *)MEMORY[0x242656984]();
        v67 = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v68 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v68)
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v79 = v72;
            _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature is enabled", buf, 0xCu);

          }
        }
        else if (v68)
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v79 = v69;
          _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature is enabled through profile", buf, 0xCu);

        }
      }
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v12;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@iPhoneOnly Pairing and Control feature is disabled", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v6);
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    v13 = CFPreferencesGetAppBooleanValue(CFSTR("ThreadServiceEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v29;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ThreadService feature is enabled", buf, 0xCu);

      }
    }
    else if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v18;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ThreadService feature is enabled through profile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v30 = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
    v31 = (void *)MEMORY[0x242656984]();
    v32 = v15;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v34)
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v36;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWake feature is disabled", buf, 0xCu);

      }
    }
    else if (v34)
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v35;
      _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWake feature is enabled through profile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    v37 = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWakeBypassAccessoryRequirement"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
    v38 = (void *)MEMORY[0x242656984]();
    v39 = v32;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v41)
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v43;
        _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWakeBypassAccessoryRequirement feature is disabled", buf, 0xCu);

      }
    }
    else if (v41)
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v42;
      _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWakeBypassAccessoryRequirement feature is enabled through profile", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    v44 = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWakeAllowHomeThreadStop"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
    v19 = (void *)MEMORY[0x242656984]();
    v45 = v39;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      if (v46)
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v79 = v48;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWakeAllowHomeThreadStop feature is disabled", buf, 0xCu);

      }
    }
    else if (v46)
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v47;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@StartThreadOnWakeAllowHomeThreadStop feature is enabled through profile", buf, 0xCu);

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v22;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ThreadService feature is disabled", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "productPlatform") == 4
    && !-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](self, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (!v51)
      goto LABEL_42;
    v52 = (void *)MEMORY[0x242656984]();
    v53 = self;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v55;
      _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_INFO, "%{public}@Disable controller factory operation while not a primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v52);
    -[HMMTRAccessoryServerBrowser controllerFactory](v53, "controllerFactory");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "disableNormalOperation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser setControllerFactoryEnablePerPrimaryResidentConfirmationToken:](v53, "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", v56);

  }
LABEL_42:
  out_token = 0;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __40__HMMTRAccessoryServerBrowser_configure__block_invoke;
  handler[3] = &unk_250F219E0;
  objc_copyWeak(&v75, &location);
  v59 = notify_register_dispatch("com.apple.springboard.lockstate", &out_token, v57, handler);

  v60 = (void *)MEMORY[0x242656984]();
  v61 = self;
  if (v59)
  {
    HMFGetOSLogHandle();
    v62 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v63;
      v80 = 1024;
      v81 = v59;
      _os_log_impl(&dword_23E95B000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to register a handler for lock state notification with status: %u", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v60);
  }
  else
  {
    HMFGetOSLogHandle();
    v64 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v65;
      _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_INFO, "%{public}@Registered lock state notification handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v60);
    -[HMMTRAccessoryServerBrowser setLockStateNotificationRegistrationToken:](v61, "setLockStateNotificationRegistrationToken:", out_token);
  }
  -[HMMTRAccessoryServerBrowser setLockStateNotificationRegistered:](v61, "setLockStateNotificationRegistered:", v59 == 0);
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    && CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v73[0] = v58;
    v73[1] = 3221225472;
    v73[2] = __40__HMMTRAccessoryServerBrowser_configure__block_invoke_90;
    v73[3] = &unk_250F23DF0;
    v73[4] = v61;
    -[HMMTRAccessoryServerBrowser dispatchAfter:block:](v61, "dispatchAfter:block:", dispatch_time(0, 150000000), v73);
  }
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int homeKeychainReadyNotificationToken;
  int mtsKeychainReadyNotificationToken;
  objc_super v5;

  homeKeychainReadyNotificationToken = self->_homeKeychainReadyNotificationToken;
  if (homeKeychainReadyNotificationToken)
    notify_cancel(homeKeychainReadyNotificationToken);
  mtsKeychainReadyNotificationToken = self->_mtsKeychainReadyNotificationToken;
  if (mtsKeychainReadyNotificationToken)
    notify_cancel(mtsKeychainReadyNotificationToken);
  if (self->_lockStateNotificationRegistered)
    notify_cancel(self->_lockStateNotificationRegistrationToken);
  v5.receiver = self;
  v5.super_class = (Class)HMMTRAccessoryServerBrowser;
  -[HMMTRAccessoryServerBrowser dealloc](&v5, sel_dealloc);
}

- (NSData)systemCommissionerFabricRootPublicKey
{
  void *v3;
  uint64_t v4;
  void *v5;
  CFDataRef v6;
  void *v7;
  HMMTRAccessoryServerBrowser *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  HMMTRAccessoryServerBrowser *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser systemCommissionerNocSigner](self, "systemCommissionerNocSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "publicKey");

  if (!v4)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      v11 = "%{public}@Failed to fetch system commissioner fabric public key; Key-pair doesn't exist";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v7);
    v6 = 0;
    return (NSData *)v6;
  }
  -[HMMTRAccessoryServerBrowser systemCommissionerNocSigner](self, "systemCommissionerNocSigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SecKeyCopyExternalRepresentation((SecKeyRef)objc_msgSend(v5, "publicKey"), 0);

  if (!v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      v11 = "%{public}@Failed to fetch system commissioner fabric public key";
LABEL_7:
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return (NSData *)v6;
}

- (NSData)appleHomeFabricRootPublicKey
{
  CFDataRef v3;
  void *v4;
  HMMTRAccessoryServerBrowser *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  HMMTRAccessoryServerBrowser *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!-[HMMTRMatterKeypair publicKey](self->_nocSigner, "publicKey"))
  {
    v4 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      v8 = "%{public}@Failed to fetch Apple Home fabric public key; Key-pair doesn't exist";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v4);
    v3 = 0;
    return (NSData *)v3;
  }
  v3 = SecKeyCopyExternalRepresentation(-[HMMTRMatterKeypair publicKey](self->_nocSigner, "publicKey"), 0);
  if (!v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      v8 = "%{public}@Failed to fetch Apple Home fabric public key";
LABEL_7:
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return (NSData *)v3;
}

- (BOOL)_isSystemCommissionerFeaturePreferenceEnabled
{
  return 1;
}

- (BOOL)_isPerControllerStorageEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!isFeatureMatteriPhoneOnlyPairingControlEnabled())
    return 0;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("hmmtr.feature.PerControllerStorageAPIEnabled"), (CFStringRef)*MEMORY[0x24BDBD580]);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Per controller storage API enabled = %@ (pref value %@)", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (id)currentFabric
{
  void *v3;
  void *v4;

  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser appleHomeFabricWithID:](self, "appleHomeFabricWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appleHomeFabricWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleHomeFabricWithID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)appleHomeFabricWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appleHomeFabricWithUUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)linkType
{
  return 1;
}

- (NSMutableSet)discoveredAccessoryServers
{
  NSObject *v3;
  int *specific;
  NSObject *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  int context;
  int key;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  context = 1;
  key = 0;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_set_specific(v3, &key, &context, 0);

  specific = (int *)dispatch_get_specific(&key);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_set_specific(v5, &key, 0, 0);

  if (specific == &context)
  {
    -[HMMTRAccessoryServerBrowser _cleanupDiscoveredServers](self, "_cleanupDiscoveredServers");
  }
  else
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@discoveredAccessoryServers was not called from workQueue", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HAPAccessoryServerBrowser workQueue](v7, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__HMMTRAccessoryServerBrowser_discoveredAccessoryServers__block_invoke;
    v12[3] = &unk_250F23DF0;
    v12[4] = v7;
    dispatch_sync(v10, v12);

  }
  return self->_discoveredAccessoryServers;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__HMMTRAccessoryServerBrowser_setDelegate_queue___block_invoke;
  v11[3] = &unk_250F21A08;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling system keychain store updated notification", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMMTRAccessoryServerBrowser_handleSystemKeychainStoreUpdatedNotification___block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (BOOL)systemCommissionerMode
{
  return self->_systemCommissionerMode;
}

- (void)setSystemCommissionerMode:(BOOL)a3
{
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_systemCommissionerMode != a3)
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Changing System Commissioner Mode from %@ to %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    self->_systemCommissionerMode = a3;
  }
}

- (int)_initializeAndStartBonjourBrowser
{
  void *v3;
  BOOL v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *bonjour_service;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  HMMTRAccessoryServerBrowser *v20;
  NSObject *v21;
  void *v22;
  _QWORD handler[4];
  id v25;
  _QWORD state_changed_handler[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser bonjourBrowser](self, "bonjourBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3 == 0;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting Bonjour Browser...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[HMMTRAccessoryServerBrowser setBonjourBrowserChanges:](v6, "setBonjourBrowserChanges:", v12);

    bonjour_service = nw_browse_descriptor_create_bonjour_service("_matterc._udp", "local");
    nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
    v14 = nw_browser_create(bonjour_service, 0);
    if (v14)
    {
      -[HMMTRAccessoryServerBrowser setBonjourBrowser:](v6, "setBonjourBrowser:", v14);
      -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      nw_browser_set_queue(v14, v15);

      objc_initWeak((id *)buf, v6);
      v16 = MEMORY[0x24BDAC760];
      state_changed_handler[0] = MEMORY[0x24BDAC760];
      state_changed_handler[1] = 3221225472;
      state_changed_handler[2] = __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke;
      state_changed_handler[3] = &unk_250F21A30;
      objc_copyWeak(&v28, (id *)buf);
      v27 = v14;
      nw_browser_set_state_changed_handler(v27, state_changed_handler);
      -[HMMTRAccessoryServerBrowser bonjourBrowser](v6, "bonjourBrowser");
      v17 = objc_claimAutoreleasedReturnValue();
      handler[0] = v16;
      handler[1] = 3221225472;
      handler[2] = __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke_99;
      handler[3] = &unk_250F21A58;
      objc_copyWeak(&v25, (id *)buf);
      nw_browser_set_browse_results_changed_handler(v17, handler);

      -[HMMTRAccessoryServerBrowser bonjourBrowser](v6, "bonjourBrowser");
      v18 = objc_claimAutoreleasedReturnValue();
      nw_browser_start(v18);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
      v10 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x242656984]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v22;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@nw_browser_create failed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v10 = -6728;
    }

  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Bonjour Browser already active", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    return 0;
  }
  return v10;
}

- (void)_queueBonjourBrowserOldResult:(id)a3 newResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Queued bonjour old result: %@, new result: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRAccessoryServerBrowser bonjourBrowserChanges](v9, "bonjourBrowserChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v13;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v16[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

  if (!v7)
  {

    if (v6)
      goto LABEL_9;
LABEL_11:

    goto LABEL_9;
  }
  if (!v6)
    goto LABEL_11;
LABEL_9:

}

- (void)_handleBonjourBrowserBatchResults
{
  void *v3;
  HMMTRAccessoryServerBrowser *v4;
  NSObject *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  __int128 v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  HMMTRAccessoryServerBrowser *v19;
  NSObject *v20;
  void *v21;
  char changes;
  nw_txt_record_t v23;
  void *v24;
  HMMTRAccessoryServerBrowser *v25;
  NSObject *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  nw_txt_record_t v34;
  void *v35;
  HMMTRAccessoryServerBrowser *v36;
  NSObject *v37;
  void *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  id obj;
  HMMTRAccessoryServerBrowser *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  NSObject *v67;
  __int16 v68;
  NSObject *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Handle bonjour results batch", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[HMMTRAccessoryServerBrowser bonjourBrowserChanges](v4, "bonjourBrowserChanges");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v61;
    v9 = 0x24BDBC000uLL;
    *(_QWORD *)&v8 = 138543874;
    v45 = v8;
    v47 = v4;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0, v45);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 3832), "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSObject isEqual:](v12, "isEqual:", v14);

        if (v15)
        {

          v12 = 0;
        }
        objc_msgSend(*(id *)(v9 + 3832), "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NSObject isEqual:](v13, "isEqual:", v16);

        if (v17)
        {

          v13 = 0;
        }
        v18 = (void *)MEMORY[0x242656984]();
        v19 = v7;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v45;
          v65 = v21;
          v66 = 2112;
          v67 = v12;
          v68 = 2112;
          v69 = v13;
          _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Batch result: %@ -> %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        changes = nw_browse_result_get_changes(v12, v13);
        v51 = v12;
        if ((changes & 0x22) != 0)
        {
          v23 = nw_browse_result_copy_txt_record_object(v13);
          v24 = (void *)MEMORY[0x242656984]();
          v25 = v19;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v65 = v27;
            v66 = 2112;
            v67 = v23;
            _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_DEBUG, "%{public}@New txt record: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
          if (v23)
          {
            v48 = v13;
            v58 = 0;
            v59 = 0;
            v56 = 0;
            v57 = 0;
            v28 = -[HMMTRAccessoryServerBrowser _discriminator:vendorID:productID:CM:fromTXTRecord:](v25, "_discriminator:vendorID:productID:CM:fromTXTRecord:", &v59, &v58, &v57, &v56, v23);
            v29 = v59;
            v30 = v58;
            v31 = v57;
            v32 = v56;
            v33 = v32;
            if (!v28)
            {
              if (objc_msgSend(v32, "isEqual:", &unk_250F3F900))
                -[HMMTRAccessoryServerBrowser _handleBonjourRemoveWithDiscriminator:vendorID:productID:txtRecordRemove:](v25, "_handleBonjourRemoveWithDiscriminator:vendorID:productID:txtRecordRemove:", v29, v30, v31, 0);
              else
                -[HMMTRAccessoryServerBrowser _handleBonjourAddOrUpdateWithDiscriminator:vendorID:productID:](v25, "_handleBonjourAddOrUpdateWithDiscriminator:vendorID:productID:", v29, v30, v31);
            }

            v7 = v47;
            v13 = v48;
          }

          v9 = 0x24BDBC000;
          v12 = v51;
        }
        if ((changes & 4) != 0)
        {
          v34 = nw_browse_result_copy_txt_record_object(v12);
          v35 = (void *)MEMORY[0x242656984]();
          v36 = v19;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v65 = v38;
            v66 = 2112;
            v67 = v34;
            _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Removed txt record: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          if (v34)
          {
            v54 = 0;
            v55 = 0;
            v52 = 0;
            v53 = 0;
            v39 = -[HMMTRAccessoryServerBrowser _discriminator:vendorID:productID:CM:fromTXTRecord:](v36, "_discriminator:vendorID:productID:CM:fromTXTRecord:", &v55, &v54, &v53, &v52, v34);
            v40 = v55;
            v41 = v54;
            v42 = v53;
            v43 = v52;
            if (!v39)
              -[HMMTRAccessoryServerBrowser _handleBonjourRemoveWithDiscriminator:vendorID:productID:txtRecordRemove:](v36, "_handleBonjourRemoveWithDiscriminator:vendorID:productID:txtRecordRemove:", v40, v41, v42, 1);

            v7 = v47;
            v9 = 0x24BDBC000;
          }

          v12 = v51;
        }

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v50);
  }

  -[HMMTRAccessoryServerBrowser bonjourBrowserChanges](v7, "bonjourBrowserChanges");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "removeAllObjects");

}

- (int)_discriminator:(id *)a3 vendorID:(id *)a4 productID:(id *)a5 CM:(id *)a6 fromTXTRecord:(id)a7
{
  NSObject *v12;
  uint64_t v13;
  int v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD access_value[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a7;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__7018;
  v41 = __Block_byref_object_dispose__7019;
  v42 = &unk_250F3F900;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__7018;
  v35 = __Block_byref_object_dispose__7019;
  v36 = &unk_250F3F900;
  v13 = MEMORY[0x24BDAC760];
  access_value[0] = MEMORY[0x24BDAC760];
  access_value[1] = 3221225472;
  access_value[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke;
  access_value[3] = &unk_250F21A80;
  access_value[4] = self;
  access_value[5] = &v37;
  access_value[6] = &v31;
  if (nw_txt_record_access_key(v12, "VP", access_value))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__7018;
    v28 = __Block_byref_object_dispose__7019;
    v29 = &unk_250F3F900;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_109;
    v23[3] = &unk_250F21AA8;
    v23[4] = self;
    v23[5] = &v24;
    if (nw_txt_record_access_key(v12, "D", v23))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__7018;
      v21 = __Block_byref_object_dispose__7019;
      v22 = &unk_250F3F900;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_111;
      v16[3] = &unk_250F21AA8;
      v16[4] = self;
      v16[5] = &v17;
      nw_txt_record_access_key(v12, "CM", v16);
      *a4 = objc_retainAutorelease((id)v38[5]);
      *a5 = objc_retainAutorelease((id)v32[5]);
      *a3 = objc_retainAutorelease((id)v25[5]);
      *a6 = objc_retainAutorelease((id)v18[5]);
      _Block_object_dispose(&v17, 8);

      v14 = 0;
    }
    else
    {
      v14 = -6737;
    }
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v14 = -6737;
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v14;
}

- (id)_discoveredServerWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
  id v8;
  id v9;
  NSMutableSet *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_discoveredAccessoryServers;
  v11 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "removalInProgress") & 1) == 0)
        {
          objc_msgSend(v14, "vendorID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "isEqual:", v8))
            goto LABEL_12;
          objc_msgSend(v14, "productID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqual:", v9) & 1) == 0)
          {

LABEL_12:
            continue;
          }
          v17 = objc_msgSend(v14, "doesMatchDiscriminator:", v19);

          if (v17)
          {
            v11 = v14;
            goto LABEL_15;
          }
        }
      }
      v11 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
LABEL_15:

  return v11;
}

- (void)_setReachability:(BOOL)a3 forServer:(id)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a4, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setReachable:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_handleAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 overBLE:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke;
  v17[3] = &unk_250F21AD0;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[HMMTRAccessoryServerBrowser _cleanupDiscoveredServersWithReason:completion:](self, "_cleanupDiscoveredServersWithReason:completion:", v13, v17);

}

- (void)_handleBonjourAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
  -[HMMTRAccessoryServerBrowser _handleAddOrUpdateWithDiscriminator:vendorID:productID:overBLE:](self, "_handleAddOrUpdateWithDiscriminator:vendorID:productID:overBLE:", a3, a4, a5, 0);
}

- (void)_handleBonjourRemoveWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5 txtRecordRemove:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMMTRAccessoryServerBrowser *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMMTRAccessoryServerBrowser _discoveredServerWithDiscriminator:vendorID:productID:](self, "_discoveredServerWithDiscriminator:vendorID:productID:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "locallyDiscovered"))
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v18 = "remove";
      else
        v18 = "non-commissioning";
      objc_msgSend(v13, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2080;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Received bonjour %s for server id %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "setLocallyDiscovered:", 0);
    if ((objc_msgSend(v13, "isPairingInProgress") & 1) == 0
      && (!objc_msgSend(v13, "pairedState") || objc_msgSend(v13, "isDisabled")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser invalidateAccessoryServer:reason:](v15, "invalidateAccessoryServer:reason:", v13, v20);

    }
  }

}

- (void)_handleBLEAddOrUpdateWithDiscriminator:(id)a3 vendorID:(id)a4 productID:(id)a5
{
  -[HMMTRAccessoryServerBrowser _handleAddOrUpdateWithDiscriminator:vendorID:productID:overBLE:](self, "_handleAddOrUpdateWithDiscriminator:vendorID:productID:overBLE:", a3, a4, a5, 1);
}

- (void)_cleanupLocallyDiscoveredServers
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  HMMTRAccessoryServerBrowser *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  __int128 v26;
  NSMutableSet *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = self->_discoveredAccessoryServers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v34;
    *(_QWORD *)&v6 = 138543618;
    v26 = v6;
    v27 = v4;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v10, "locallyDiscovered", v26)
          && (!objc_msgSend(v10, "pairedState") || objc_msgSend(v10, "isDisabled")))
        {
          v11 = (void *)MEMORY[0x242656984]();
          v12 = self;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = self;
            v15 = v3;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v17 = v7;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v39 = v16;
            v40 = 2112;
            v41 = v18;
            _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Invalidating only locally discovered server, id %@", buf, 0x16u);

            v7 = v17;
            v3 = v15;
            self = v14;
            v4 = v27;
            v8 = v28;
          }

          objc_autoreleasePoolPop(v11);
          objc_msgSend(v10, "setLocallyDiscovered:", 0);
          objc_msgSend(v3, "addObject:", v10);
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v7);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v3;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser invalidateAccessoryServer:reason:](self, "invalidateAccessoryServer:reason:", v24, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

}

- (void)_prepareServerForBLEDiscovery
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_discoveredAccessoryServers;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "discoveredOverBLE", (_QWORD)v8))
          objc_msgSend(v7, "setBleScanPending:", 1);
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_cleanupDisappearedServersOverBLE
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = self->_discoveredAccessoryServers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138543874;
    v23 = v6;
    v24 = v3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v10, "discoveredOverBLE", v23))
        {
          if (objc_msgSend(v10, "bleScanPending"))
          {
            objc_msgSend(v10, "setLocallyDiscovered:", 0);
            if ((objc_msgSend(v10, "isPairingInProgress") & 1) == 0
              && (!objc_msgSend(v10, "pairedState") || objc_msgSend(v10, "isDisabled")))
            {
              v11 = (void *)MEMORY[0x242656984]();
              v12 = self;
              HMFGetOSLogHandle();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "identifier");
                v25 = v11;
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v23;
                v36 = v14;
                v37 = 2112;
                v38 = v15;
                v39 = 1024;
                v40 = 0;
                _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Invalidating server disappeared from BLE, id %@, pairingInProgress %d", buf, 0x1Cu);

                v11 = v25;
                v3 = v24;
              }

              objc_autoreleasePoolPop(v11);
              objc_msgSend(v3, "addObject:", v10);
            }
          }
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v7);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v3;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser invalidateAccessoryServer:reason:](self, "invalidateAccessoryServer:reason:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

}

- (void)_clearLocallyDiscoveredFlags
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

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMMTRAccessoryServerBrowser discoveredAccessoryServers](self, "discoveredAccessoryServers", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setLocallyDiscovered:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)startDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke;
  v4[3] = &unk_250F223E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke;
  block[3] = &unk_250F21B98;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)discoverAccessoryServerWithNodeID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke;
  v11[3] = &unk_250F21BE8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  HMMTRAccessoryServerBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification from accessory server with nodeID %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __98__HMMTRAccessoryServerBrowser_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_250F21E58;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  -[HMMTRAccessoryServerBrowser dispatchBlock:](self, "dispatchBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 completionHandler:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[HMMTRAccessoryServerBrowser stageAccessoryServerWithSetupPayload:fabricID:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:completionHandler:](self, "stageAccessoryServerWithSetupPayload:fabricID:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:completionHandler:", a3, a4, 0, 0, 0, 0, 0, v5, a5);
}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 hasPriorSuccessfulPairing:(BOOL)a4 category:(id)a5 completionHandler:(id)a6
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

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
  block[3] = &unk_250F229D8;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)stageAccessoryServerWithSetupPayload:(id)a3 fabricID:(id)a4 deviceCredentialHandler:(id)a5 wifiScanResultsHandler:(id)a6 threadScanResultsHandler:(id)a7 readyToCancelHandler:(id)a8 progressUpdateHandler:(id)a9 scanningNetworks:(BOOL)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __227__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_fabricID_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_completionHandler___block_invoke;
  block[3] = &unk_250F21C10;
  block[4] = self;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v39 = a10;
  v37 = v21;
  v38 = v22;
  v24 = v22;
  v25 = v21;
  v26 = v20;
  v27 = v19;
  v28 = v18;
  v29 = v17;
  v30 = v16;
  dispatch_async(v23, block);

}

- (void)_stageAccessoryServerWithSetupPayload:(id)a3 deviceCredentialHandler:(id)a4 wifiScanResultsHandler:(id)a5 threadScanResultsHandler:(id)a6 readyToCancelHandler:(id)a7 progressUpdateHandler:(id)a8 scanningNetworks:(BOOL)a9 hasPriorSuccessfulPairing:(BOOL)a10 category:(id)a11 completionHandler:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMMTRAccessoryServerBrowser *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMMTRAccessoryServerBrowser *v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  BOOL v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v48 = a4;
  v18 = a5;
  v19 = a6;
  v49 = a7;
  v51 = a8;
  v20 = a11;
  v21 = a12;
  LODWORD(a7) = -[HMMTRAccessoryServerBrowser isSystemCommissionerFeatureEnabled](self, "isSystemCommissionerFeatureEnabled");
  v22 = (void *)MEMORY[0x242656984]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if ((_DWORD)a7)
  {
    v47 = v19;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v26;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Received request for staging. Enabling system commissioner mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v23, "setSystemCommissionerMode:", 1);
    -[HMMTRAccessoryServerBrowser systemCommissionerControllerParams](v23, "systemCommissionerControllerParams");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v62 = 0;
    v28 = objc_msgSend(v27, "fetchControllerParamsAllowingNew:nocSigner:controllerWrapper:", 1, &v62, &v61);
    v29 = v62;
    v30 = v61;

    objc_msgSend(v30, "startupParams");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fabricID");
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (v28 && v32)
    {
      -[HMMTRAccessoryServerBrowser storage](v23, "storage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setSystemCommissionerNocSigner:", v29);

      -[HMMTRAccessoryServerBrowser storage](v23, "storage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSystemCommissionerFabric:", 1);

      -[HMMTRAccessoryServerBrowser storage](v23, "storage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "prepareStorageForFabricID:", v32);

      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
      v52[3] = &unk_250F21C88;
      v52[4] = v23;
      v53 = v32;
      v54 = v21;
      v36 = v48;
      v55 = v48;
      v56 = v18;
      v57 = v47;
      v37 = v49;
      v58 = v49;
      v59 = v51;
      v60 = a9;
      v19 = v47;
      v32 = v32;
      v38 = v50;
      -[HMMTRAccessoryServerBrowser _prepareForPairingWithSetupPayload:fabricID:controllerWrapper:hasPriorSuccessfulPairing:category:completionHandler:](v23, "_prepareForPairingWithSetupPayload:fabricID:controllerWrapper:hasPriorSuccessfulPairing:category:completionHandler:", v50, v32, v30, a10, v20, v52);

    }
    else
    {
      v40 = (void *)MEMORY[0x242656984]();
      v41 = v23;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = v20;
        v44 = v18;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v45;
        _os_log_impl(&dword_23E95B000, v42, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller is not ready to start. Aborting staging.", buf, 0xCu);

        v18 = v44;
        v20 = v43;
      }

      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v46);

      v37 = v49;
      v38 = v50;
      v19 = v47;
      v36 = v48;
    }
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v39;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Staging is no longer supported when system commissioner feature is disabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v21 + 2))(v21, 0, 0, v32);
    v37 = v49;
    v38 = v50;
    v36 = v48;
  }

}

- (id)stagedAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Looking for staged server with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__7018;
  v18 = __Block_byref_object_dispose__7019;
  v19 = 0;
  -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMMTRAccessoryServerBrowser_stagedAccessoryServerWithIdentifier___block_invoke;
  block[3] = &unk_250F235D0;
  block[4] = v6;
  v14 = v4;
  v15 = buf;
  v10 = v4;
  dispatch_sync(v9, block);

  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v11;
}

- (void)discardStagedAccessoryServerWithIdentifier:(id)a3 completionHandler:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  void (**v10)(void *, void *);
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRAccessoryServerBrowser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMTRAccessoryServerBrowser *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[HMMTRAccessoryServerBrowser stagedAccessoryServerWithIdentifier:](self, "stagedAccessoryServerWithIdentifier:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = MEMORY[0x242656B10](v7);
    if (v9)
      v10 = (void (**)(void *, void *))v9;
    else
      v10 = (void (**)(void *, void *))&__block_literal_global_7060;
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v14;
      v31 = 2114;
      v32 = CFSTR("hmmtrAccessoryServerMetricsStagedPairingCancelled");
      v33 = 2112;
      v34 = CFSTR("Pairing Cancelled");
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v17 = (void *)objc_msgSend(v16, "initWithTag:data:", CFSTR("hmmtrAccessoryServerMetricsStagedPairingCancelled"), MEMORY[0x24BDBD1B8]);
    -[__CFString activity](v8, "activity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tagProcessorList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitTaggedEvent:processorList:", v17, v19);

    v20 = (void *)MEMORY[0x242656984]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Attempting to discard staged server: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[__CFString nodeID](v8, "nodeID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser removeSystemCommissionerFabricAccessoryWithNodeID:completionHandler:](v21, "removeSystemCommissionerFabricAccessoryWithNodeID:completionHandler:", v24, v10);
    goto LABEL_14;
  }
  v25 = (void *)MEMORY[0x242656984]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v28;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_INFO, "%{public}@Did not find staged accessory server to discard with identifier: %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  v10 = (void (**)(void *, void *))MEMORY[0x242656B10](v7);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v24);
LABEL_14:

  }
}

- (void)removeSystemCommissionerFabricAccessoryWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMMTRAccessoryServerBrowser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTRAccessoryServerBrowser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  void (**v40)(id, void *);
  _BYTE *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[4];
  void *v47;
  __int16 v48;
  id v49;
  uint8_t v50[128];
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to remove node (%@) from System Commissioner Fabric", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v9, "systemCommissionerFabricID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    v32 = (void *)MEMORY[0x242656984]();
    v33 = v9;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@System Commissioner Fabric is not set up yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    -[HMMTRAccessoryServerBrowser storage](v33, "storage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeRecordsForSystemCommissionerFabricNode:", v6);

    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v37);

  }
  else
  {
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v9, "setSystemCommissionerMode:", 1);
    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSystemCommissionerFabric:", 1);

    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v9, "systemCommissionerFabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareStorageForFabricID:", v16);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__7018;
    v53 = __Block_byref_object_dispose__7019;
    v54 = 0;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[HMMTRAccessoryServerBrowser _allServers](v9, "_allServers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v21, "nodeID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToNumber:", v6);

          if (v23)
          {
            objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v21);
            goto LABEL_14;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_14:

    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:](v9, "_createCHIPAccessoryForNodeID:", objc_msgSend(v6, "unsignedLongLongValue"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v24;

    }
    v26 = -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v9, "setSystemCommissionerMode:", 0);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v27 = (void *)MEMORY[0x242656984](v26);
      v28 = v9;
      HMFGetOSLogHandle();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v46 = 138543618;
        v47 = v30;
        v48 = 2112;
        v49 = v6;
        _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@Found paired device (%@) in System Commissioner Storage", v46, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setRemovalInProgress:", 1);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke;
    v38[3] = &unk_250F238B8;
    v38[4] = v9;
    v39 = v6;
    v41 = buf;
    v40 = v7;
    -[HMMTRAccessoryServerBrowser invalidateAllDiscoveredServersWithReason:completion:](v9, "invalidateAllDiscoveredServersWithReason:completion:", v31, v38);

    _Block_object_dispose(buf, 8);
  }

}

- (void)fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to fetch connected services for node (%@)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __109__HMMTRAccessoryServerBrowser_fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v14[3] = &unk_250F21CF0;
  v15 = v6;
  v16 = v7;
  v14[4] = v9;
  v12 = v6;
  v13 = v7;
  -[HMMTRAccessoryServerBrowser _fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:](v9, "_fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:", v12, v14);

}

- (void)removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID:(id)a3 fabric:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMMTRAccessoryServerBrowser *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v15;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to remove connected service with UUID %@ for node (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke;
  v26[3] = &unk_250F23CD0;
  v26[4] = v13;
  v27 = v10;
  v17 = v10;
  v18 = (void *)MEMORY[0x242656B10](v26);
  -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v13, "setSystemCommissionerMode:", 1);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_2;
  v22[3] = &unk_250F21D40;
  v22[4] = v13;
  v23 = v9;
  v24 = v8;
  v25 = v18;
  v19 = v8;
  v20 = v18;
  v21 = v9;
  -[HMMTRAccessoryServerBrowser _fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:](v13, "_fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:", v19, v22);

}

- (void)_accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
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
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  HMMTRAccessoryServerBrowser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMMTRAccessoryServerBrowser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTRAccessoryServerBrowser *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __103__HMMTRAccessoryServerBrowser__accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
    v41[3] = &unk_250F21D68;
    v41[4] = self;
    v42 = v7;
    v36 = MEMORY[0x242656B10](v41);
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](self, "setSystemCommissionerMode:", 1);
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSystemCommissionerFabric:", 1);

    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareStorageForFabricID:", v11);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[HMMTRAccessoryServerBrowser _allServers](self, "_allServers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
        objc_msgSend(v17, "nodeID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToNumber:", v6);

        if ((v19 & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v20 = v17;

      if (v20)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
    -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:](self, "_createCHIPAccessoryForNodeID:", objc_msgSend(v6, "unsignedLongLongValue"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
LABEL_13:
      v21 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v36;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        v45 = 2112;
        v46 = v6;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Found paired device (%@) in System Commissioner Storage", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v20, "setBlockInvalidation:", 1);
      -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](v22, "systemCommissionerControllerWrapper");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setControllerWrapper:", v26);

      (*(void (**)(uint64_t, id, _QWORD))(v36 + 16))(v36, v20, 0);
    }
    else
    {
      v32 = (void *)MEMORY[0x242656984]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v36;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v35;
        v45 = 2112;
        v46 = v6;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to create server with node ID (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v36 + 16))(v36, 0, v20);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x242656984]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v30;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@System Commissioner Fabric is not set up yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v31);

  }
}

- (void)_fetchDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v10[3] = &unk_250F21DE0;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[HMMTRAccessoryServerBrowser _accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:](self, "_accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:", v8, v10);

}

- (void)removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to remove node (%@) from System Commissioner Fabric", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  v15[3] = &unk_250F240D8;
  v15[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  -[HMMTRAccessoryServerBrowser invalidateAllDiscoveredServersWithReason:completion:](v9, "invalidateAllDiscoveredServersWithReason:completion:", v12, v15);

}

- (void)openCommissioningWindowForSystemCommissionerDeviceWithNodeID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMTRAccessoryServerBrowser *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  double v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2112;
    v24 = v8;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to open commissioning window for node (%@) from System Commissioner Fabric, for %fs", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HAPAccessoryServerBrowser workQueue](v11, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke;
  v17[3] = &unk_250F228E8;
  v17[4] = v11;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  dispatch_async(v14, v17);

}

- (void)readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to read commissioning window status for node (%@) from System Commissioner Fabric", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HAPAccessoryServerBrowser workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)accessoryServerForSystemCommissionerDeviceWithNodeID:(id)a3 completionHandler:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__HMMTRAccessoryServerBrowser_accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)nodeIDForFabricID:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7018;
  v21 = __Block_byref_object_dispose__7019;
  v22 = 0;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__HMMTRAccessoryServerBrowser_nodeIDForFabricID_deviceIdentifier___block_invoke;
  v13[3] = &unk_250F21E30;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)handleHomeAddedAccessoryWithNodeID:(id)a3 fabric:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_handleHomeAddedAccessoryWithNodeID_fabric___block_invoke;
  block[3] = &unk_250F224F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)invalidateAllDiscoveredServersWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__HMMTRAccessoryServerBrowser_invalidateAllDiscoveredServersWithReason_completion___block_invoke;
  v11[3] = &unk_250F21BE8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMMTRAccessoryServerBrowser_invalidateAccessoryServer_reason_withCompletion___block_invoke;
  block[3] = &unk_250F21E58;
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

- (void)_invalidateAccessoryServer:(id)a3 reason:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  HMMTRAccessoryServerBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMMTRAccessoryServerBrowser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  HMMTRAccessoryServerBrowser *v30;
  NSObject *v31;
  void *v32;
  _QWORD block[4];
  id v34;
  HMMTRAccessoryServerBrowser *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v8, "removeReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingEndContextWhenRemove");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!v12 || !v13)
    {
      v15 = v9;

      +[HMMTRAccessoryPairingEndContext hmmtrContextWithCancelledError:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithCancelledError:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
      v12 = v15;
    }
    v17 = (void *)MEMORY[0x242656984]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v20;
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v12;
      v45 = 2112;
      v46 = v14;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Invalidating accessory Server: %@ for reason: %@ context: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v8, "setRemoveReason:pairingEndContextWhenRemove:", 0, 0);
    if ((objc_msgSend(v8, "locallyDiscovered") & 1) == 0)
      -[NSMutableSet removeObject:](v18->_discoveredAccessoryServers, "removeObject:", v8);
    -[NSMutableSet removeObject:](v18->_stagedAccessoryServers, "removeObject:", v8);
    if (objc_msgSend(v8, "locallyDiscovered"))
    {
      v21 = (void *)MEMORY[0x242656984]();
      v22 = v18;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2112;
        v42 = v8;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Keeping the locally discovered server: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
    }
    else
    {
      objc_msgSend(v8, "setReachable:", 0);
      objc_msgSend(v8, "setControllerWrapper:", 0);
    }
    objc_msgSend(v8, "setSecuritySessionOpen:", 0);
    if ((objc_msgSend(v8, "locallyDiscovered") & 1) == 0)
    {
      -[HMMTRAccessoryServerBrowser delegate](v18, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "conformsToProtocol:", &unk_256DFDA38))
        v26 = v25;
      else
        v26 = 0;
      v27 = v26;

      if (v27)
      {
        -[HMMTRAccessoryServerBrowser delegateQueue](v18, "delegateQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __80__HMMTRAccessoryServerBrowser__invalidateAccessoryServer_reason_withCompletion___block_invoke;
        block[3] = &unk_250F21E80;
        v34 = v27;
        v35 = v18;
        v36 = v8;
        v37 = v12;
        v38 = v14;
        dispatch_async(v28, block);

      }
      else
      {
        v29 = (void *)MEMORY[0x242656984]();
        v30 = v18;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v32;
          _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to find delegate conforming to HMMTRHAPAccessoryServerBrowserPairingDelegate", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
      }

    }
    if (v11)
      v11[2](v11);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

- (void)invalidateAccessoryServer:(id)a3 reason:(id)a4
{
  -[HMMTRAccessoryServerBrowser invalidateAccessoryServer:reason:withCompletion:](self, "invalidateAccessoryServer:reason:withCompletion:", a3, a4, 0);
}

- (void)commitStagedAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMMTRAccessoryServerBrowser_commitStagedAccessoryServer___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_loadFabricKeyPairs
{
  void *v3;
  HMMTRMatterKeypair *v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRMatterKeypair *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeopcerts.CA:0"));
    -[HMMTRAccessoryServerBrowser setNocSigner:](self, "setNocSigner:", v4);

    -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNocSigner:", v5);

  }
  -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeOperationalKeyPair.CA:0"));
    -[HMMTRAccessoryServerBrowser setOwnerSharedOperationalKeyPair:](self, "setOwnerSharedOperationalKeyPair:", v8);

    -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOperationalKeyPair:", v9);

  }
  -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_createFabricKeyPairsIfAbsent
{
  void *v3;
  HMMTRMatterKeypair *v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRMatterKeypair *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[HMMTRMatterKeypair initWithAccount:]([HMMTRMatterKeypair alloc], "initWithAccount:", CFSTR("CHIPPlugin.nodeopcerts.CA:0"));
    -[HMMTRAccessoryServerBrowser setNocSigner:](self, "setNocSigner:", v4);

    -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNocSigner:", v5);

  }
  -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[HMMTRMatterKeypair initWithAccount:]([HMMTRMatterKeypair alloc], "initWithAccount:", CFSTR("CHIPPlugin.nodeOperationalKeyPair.CA:0"));
    -[HMMTRAccessoryServerBrowser setOwnerSharedOperationalKeyPair:](self, "setOwnerSharedOperationalKeyPair:", v8);

    -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](self, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOperationalKeyPair:", v10);

    }
  }
  -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_createOperationalKeyPairIfAbsent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationalKeyPair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMMTRAccessoryServerBrowser ownerLocalOperationalKeyPair](self, "ownerLocalOperationalKeyPair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOperationalKeyPair:", v5);

  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationalKeyPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (void)createMatterOperationalKeyPairIfAbsentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__HMMTRAccessoryServerBrowser_createMatterOperationalKeyPairIfAbsentWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory
{
  void *v3;
  void *v4;
  char v5;

  -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsCommissioningCertificateRetrievalForHomeUUID:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)registerPairingWindowWithSetupPayload:(id)a3 duration:(double)a4 accessoryServer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[HMMTRAccessoryServerBrowser pairingWindowInfoTable](self, "pairingWindowInfoTable");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerPairingWindowWithSetupPayload:currentDate:duration:accessoryServer:", v9, v10, v8, a4);

}

- (id)fabricsWithActiveConnections
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_fabricsWithActiveConnections, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v3);
  return v6;
}

- (void)_addToActiveFabrics:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  if ((-[NSMutableOrderedSet containsObject:](self->_fabricsWithActiveConnections, "containsObject:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_fabricsWithActiveConnections, "addObject:", v4);
    os_unfair_lock_unlock(v5);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding active connection for fabric: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "startOperations");
  }

}

- (void)_removeFromActiveFabrics:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  if (-[NSMutableOrderedSet containsObject:](self->_fabricsWithActiveConnections, "containsObject:", v4))
  {
    -[NSMutableOrderedSet removeObject:](self->_fabricsWithActiveConnections, "removeObject:", v4);
    os_unfair_lock_unlock(v5);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed active connection for fabric: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "stopOperations");
  }
  else
  {
    os_unfair_lock_unlock(v5);
  }

}

- (BOOL)_tryAddAccessoryConnectionRequestToExistingFabric:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSMutableOrderedSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  os_unfair_lock_s *lock;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  lock = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_fabricsWithActiveConnections;
  v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "fabricID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fabricID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = HMFEqualObjects();

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = self->_fabricsWithPendingConnections;
  v14 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v17, "fabricID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fabricID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = HMFEqualObjects();

        if (v20)
        {
          v21 = v17;

          v6 = v21;
          goto LABEL_21;
        }
      }
      v14 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_21:

  os_unfair_lock_unlock(lock);
  if (v6)
    objc_msgSend(v6, "connectToAccessoryWhenAllowed:", v4);

  return v6 != 0;
}

- (id)fabricsWithPendingConnections
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[NSMutableOrderedSet array](self->_fabricsWithPendingConnections, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v3);
  return v6;
}

- (void)_addToPendingFabrics:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  if ((-[NSMutableOrderedSet containsObject:](self->_fabricsWithPendingConnections, "containsObject:", v4) & 1) != 0)
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_fabricsWithPendingConnections, "addObject:", v4);
    os_unfair_lock_unlock(v5);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Pending connection to fabric: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_removeFromPendingFabrics:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  if (-[NSMutableOrderedSet containsObject:](self->_fabricsWithPendingConnections, "containsObject:", v4))
  {
    -[NSMutableOrderedSet removeObject:](self->_fabricsWithPendingConnections, "removeObject:", v4);
    os_unfair_lock_unlock(v5);
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection for fabric: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(v5);
  }

}

- (void)connectToAccessoryWhenAllowed:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__HMMTRAccessoryServerBrowser_connectToAccessoryWhenAllowed_highPriority_completion___block_invoke;
    v12[3] = &unk_250F21F90;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    dispatch_async(v11, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)abortOperationsForAccessoryServer:(id)a3 reason:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMMTRAccessoryServerBrowser_abortOperationsForAccessoryServer_reason___block_invoke;
  block[3] = &unk_250F224F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setConnectionRequestSuspended:(BOOL)a3
{
  if (self->_connectionRequestSuspended != a3)
    self->_connectionRequestSuspended = a3;
}

- (BOOL)isOperationAllowedForAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
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

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRAccessoryServerBrowser connectionRequestSuspended](self, "connectionRequestSuspended"))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](v6, "allowedNodeIDsForConnectionRequests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection requests are currently suspended. Only allowing nodeIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](v6, "allowedNodeIDsForConnectionRequests", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v4, "nodeID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v14) = objc_msgSend(v14, "isEqualToNumber:", v15);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v11) = 1;
            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)abortAndSuspendAllOperationsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMMTRAccessoryServerBrowser_abortAndSuspendAllOperationsWithReason___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)resumeAllOperations
{
  void *v3;
  void *v4;
  HMMTRAccessoryServerBrowser *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](self, "allowedNodeIDsForConnectionRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)MEMORY[0x242656984](-[HMMTRAccessoryServerBrowser setConnectionRequestSuspended:](self, "setConnectionRequestSuspended:", 0));
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Connection requests resumed", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)enableUnrestrictedOperationsForAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRAccessoryServerBrowser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRAccessoryServerBrowser setConnectionRequestSuspended:](self, "setConnectionRequestSuspended:", 1);
  -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](self, "allowedNodeIDsForConnectionRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](v8, "allowedNodeIDsForConnectionRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection requests: Allowed NodeIDs: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)disableUnrestrictedOperationsForAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRAccessoryServerBrowser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](self, "allowedNodeIDsForConnectionRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](v8, "allowedNodeIDsForConnectionRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection requests: Allowed NodeIDs: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)_establishConnectionWhenAllowedWithAccessoryConnectionRequest:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  HMMTRFabricConnectionRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRFabricConnectionRequest *v18;
  void *v19;
  HMMTRAccessoryServerBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](v6, "fabricsWithActiveConnections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    -[HMMTRAccessoryServerBrowser fabricsWithPendingConnections](v6, "fabricsWithPendingConnections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138544130;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    v29 = 2048;
    v30 = v10;
    v31 = 2048;
    v32 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection request for accessory %@. Current active fabric count: %tu, Pending: %tu", (uint8_t *)&v25, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMMTRAccessoryServerBrowser isOperationAllowedForAccessoryServer:](v6, "isOperationAllowedForAccessoryServer:", v12);

  if (!v13)
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nodeID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser allowedNodeIDsForConnectionRequests](v20, "allowedNodeIDsForConnectionRequests");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = (uint64_t)v24;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Connection requests rejected for nodeID %@: Allowed NodeIDs: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 9, 0);
    v18 = (HMMTRFabricConnectionRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "abortAllPendingOperations:", v18);
    goto LABEL_9;
  }
  if (!-[HMMTRAccessoryServerBrowser _tryAddAccessoryConnectionRequestToExistingFabric:](v6, "_tryAddAccessoryConnectionRequestToExistingFabric:", v4))
  {
    v14 = [HMMTRFabricConnectionRequest alloc];
    -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "server");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMMTRFabricConnectionRequest initWithQueue:browser:fabricID:systemCommissionerFabric:](v14, "initWithQueue:browser:fabricID:systemCommissionerFabric:", v15, v6, v16, objc_msgSend(v17, "knownToSystemCommissioner"));

    -[HMMTRAccessoryServerBrowser _establishConnectionWhenAllowedWithFabricConnectionRequest:](v6, "_establishConnectionWhenAllowedWithFabricConnectionRequest:", v18);
    -[HMMTRFabricConnectionRequest connectToAccessoryWhenAllowed:](v18, "connectToAccessoryWhenAllowed:", v4);
LABEL_9:

  }
}

- (void)_establishConnectionWhenAllowedWithFabricConnectionRequest:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMMTRAccessoryServerBrowser *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMMTRAccessoryServerBrowser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  HMMTRAccessoryServerBrowser *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](v6, "fabricsWithActiveConnections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[HMMTRAccessoryServerBrowser fabricsWithPendingConnections](v6, "fabricsWithPendingConnections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v54 = v8;
    v55 = 2112;
    v56 = v9;
    v57 = 2048;
    v58 = v11;
    v59 = 2048;
    v60 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection request for fabric %@, Current active fabric count: %tu, Pending: %tu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](v6, "fabricsWithActiveConnections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = (void *)MEMORY[0x242656984]();
  v16 = v6;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v19;
      v55 = 2112;
      v56 = v4;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@establishConnectionWhenAllowedWithFabricConnectionRequest add to pending %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMMTRAccessoryServerBrowser _addToPendingFabrics:](v16, "_addToPendingFabrics:", v4);
    objc_msgSend(v4, "fabricID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v16, "currentFabricID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = HMFEqualObjects();

    if ((v22 & 1) != 0
      || (objc_msgSend(v4, "fabricID"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v16, "systemCommissionerFabricID"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = HMFEqualObjects(),
          v24,
          v23,
          v25))
    {
      v26 = (void *)MEMORY[0x242656984]();
      v27 = v16;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fabricID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v29;
        v55 = 2112;
        v56 = v30;
        _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@Making room for fabricID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](v27, "fabricsWithActiveConnections", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v49 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v4, "fabricID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "fabricID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = HMFEqualObjects();

            if ((v39 & 1) == 0)
            {
              v41 = (void *)MEMORY[0x242656984]();
              v42 = v27;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "fabricID");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v54 = v44;
                v55 = 2112;
                v56 = v45;
                _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Evicting fabricID: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v41);
              objc_msgSend(v36, "fabricID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 5);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRAccessoryServerBrowser _abortAllOperationsForFabricID:reason:](v42, "_abortAllOperationsForFabricID:reason:", v46, v47);

              goto LABEL_25;
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (v33)
            continue;
          break;
        }
      }
LABEL_25:

    }
  }
  else
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v40;
      v55 = 2112;
      v56 = v4;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@establishConnectionWhenAllowedWithFabricConnectionRequest add to active %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMMTRAccessoryServerBrowser _addToActiveFabrics:](v16, "_addToActiveFabrics:", v4);
  }

}

- (void)operationsStartedForFabricConnectionRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting operations for fabric: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (objc_msgSend(v4, "systemCommissionerFabric"))
  {
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v7, "setSystemCommissionerMode:", 1);
  }
  else
  {
    objc_msgSend(v4, "fabricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser _setupStorageStateIfNotFabricID:rediscoverAccessories:](v7, "_setupStorageStateIfNotFabricID:rediscoverAccessories:", v11, 0);

  }
  if (objc_msgSend(v4, "systemCommissionerFabric"))
  {
    -[HMMTRAccessoryServerBrowser threadRadioManager](v7, "threadRadioManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startThreadRadioForSystemCommissionerFabricID:", v13);
LABEL_11:

    goto LABEL_12;
  }
  -[HMMTRAccessoryServerBrowser currentFabric](v7, "currentFabric");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:](v7, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", v12))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[HMMTRAccessoryServerBrowser threadRadioManager](v7, "threadRadioManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser currentFabricID](v7, "currentFabricID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "hasMatterThreadAccessoryInHomeWithFabricID:", v15);

  if (v16)
  {
    -[HMMTRAccessoryServerBrowser threadRadioManager](v7, "threadRadioManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v7, "currentFabricID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startThreadRadioForHomeWithFabricID:", v13);
    goto LABEL_11;
  }
LABEL_13:

}

- (void)_operationsCompletedForFabricConnectionRequest:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fabricID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Marking operation complete for fabric: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRAccessoryServerBrowser _removeFromActiveFabrics:](v9, "_removeFromActiveFabrics:", v6);
  objc_msgSend(v6, "fabricID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser _disconnectFromIdleFabric:reason:](v9, "_disconnectFromIdleFabric:reason:", v13, v7);

  -[HMMTRAccessoryServerBrowser _connectPendingFabricConnections](v9, "_connectPendingFabricConnections");
}

- (void)_connectPendingFabricConnections
{
  void *v3;
  HMMTRAccessoryServerBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  HMMTRAccessoryServerBrowser *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithPendingConnections](v4, "fabricsWithPendingConnections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](v4, "fabricsWithActiveConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %@, Connected/Connecting: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAccessoryServerBrowser fabricsWithPendingConnections](v4, "fabricsWithPendingConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HMMTRAccessoryServerBrowser fabricsWithPendingConnections](v4, "fabricsWithPendingConnections", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!v14)
            v14 = v17;
          if (objc_msgSend(v17, "hasPendingHighPriorityConnectionRequest"))
          {
            v18 = v17;

            v14 = v18;
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          continue;
        break;
      }
LABEL_16:

      if (v14)
      {
        -[HMMTRAccessoryServerBrowser _removeFromPendingFabrics:](v4, "_removeFromPendingFabrics:", v14);
        -[HMMTRAccessoryServerBrowser _establishConnectionWhenAllowedWithFabricConnectionRequest:](v4, "_establishConnectionWhenAllowedWithFabricConnectionRequest:", v14);

        return;
      }
    }
    else
    {

    }
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      v23 = "%{public}@No fabric to connect";
      v24 = v21;
      v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_23;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      v23 = "%{public}@No more pending fabric connection requests";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEBUG;
LABEL_23:
      _os_log_impl(&dword_23E95B000, v24, v25, v23, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v19);
}

- (void)_suspendOperationsForFabricID:(id)a3
{
  id v4;
  os_unfair_lock_s *v5;
  NSMutableOrderedSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMMTRAccessoryServerBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_fabricsWithActiveConnections;
  v7 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "fabricID", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = HMFEqualObjects();

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(v5);
  if (v7)
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fabricID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Suspending operations for fabric: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v7, "suspendOperations");
  }
  -[HMMTRAccessoryServerBrowser threadSoftwareUpdateController](self, "threadSoftwareUpdateController", (_QWORD)v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suspendOperationsForFabricID:", v4);

}

- (void)_connectPendingFabricConnectionsForFabricID:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v8;
    v55 = 2112;
    v56 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@_connectPendingFabricConnectionsForFabricID for fabricID - %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)MEMORY[0x242656984]();
  v10 = v6;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fabricsWithPendingConnections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fabricsWithActiveConnections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v12;
    v55 = 2112;
    v56 = v13;
    v57 = 2112;
    v58 = v14;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %@, Connected/Connecting: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = (os_unfair_lock_s *)((char *)v10 + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = v10[10];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v20, "fabricID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = HMFEqualObjects();

        if (v22)
        {
          v42 = v20;
          goto LABEL_15;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v17)
        continue;
      break;
    }
  }
  v42 = 0;
LABEL_15:

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = v10[11];
  v24 = (id)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v44;
    while (2)
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v27, "fabricID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = HMFEqualObjects();

        if (v29)
        {
          v24 = v27;
          goto LABEL_25;
        }
      }
      v24 = (id)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_25:

  os_unfair_lock_unlock(v15);
  if (v42)
  {
    v30 = (void *)MEMORY[0x242656984]();
    v31 = v10;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "fabricID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v33;
      v55 = 2112;
      v56 = v34;
      _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_INFO, "%{public}@Re-starting operations for fabric: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(v42, "startOperations");
  }
  else
  {
    v35 = (void *)MEMORY[0x242656984]();
    v36 = v10;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fabricID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v39;
        v55 = 2112;
        v56 = v40;
        _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_INFO, "%{public}@Connecting pending fabric fabric: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(v36, "_removeFromPendingFabrics:", v24);
      objc_msgSend(v36, "_establishConnectionWhenAllowedWithFabricConnectionRequest:", v24);
    }
    else
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v41;
        v55 = 2112;
        v56 = v4;
        _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_INFO, "%{public}@fabric %@ not found in either lists", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
    }
  }

}

- (void)_abortAllOperationsForFabricID:(id)a3 reason:(id)a4
{
  id v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSMutableOrderedSet *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMMTRAccessoryServerBrowser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *lock;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = a4;
  lock = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x24BE1BC78]);
  os_unfair_lock_lock_with_options();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = self->_fabricsWithActiveConnections;
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      objc_msgSend(v11, "fabricID", lock);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_12;
    os_unfair_lock_unlock(lock);
    goto LABEL_23;
  }
LABEL_9:

LABEL_12:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_fabricsWithPendingConnections;
  v14 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v15);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "fabricID", lock);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fabricID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = HMFEqualObjects();

        if (v21)
        {
          v14 = v18;
          goto LABEL_22;
        }
      }
      v14 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_22:

  os_unfair_lock_unlock(lock);
  if (v14)
  {
LABEL_23:
    v22 = (void *)MEMORY[0x242656984]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fabricID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v25;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Aborting operations for fabric: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v14, "abortAllOperationsWithReason:", v28);

  }
}

- (void)handleThreadRadioStateChanged
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](self, "fabricsWithActiveConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "retryOperations", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)handleThreadNetworkStateChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMMTRAccessoryServerBrowser_handleThreadNetworkStateChangedNotification___block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_cleanupDiscoveredServers
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser _cleanupDiscoveredServersWithReason:completion:](self, "_cleanupDiscoveredServersWithReason:completion:", v3, 0);

}

- (void)_cleanupDiscoveredServersWithReason:(id)a3 completion:(id)a4
{
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  HMMTRAccessoryServerBrowser *v17;
  NSObject *v18;
  NSMutableSet *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  _QWORD block[5];
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = self->_discoveredAccessoryServers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    v34 = *(_QWORD *)v46;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "isKnownToSystemCommissioner") & 1) == 0)
        {
          -[HMMTRAccessoryServerBrowser stagedAccessoryServers](self, "stagedAccessoryServers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v11);

          v14 = objc_msgSend(v11, "isPairedInStorage");
          if (!objc_msgSend(v11, "pairedState")
            || ((objc_msgSend(v11, "storageUpdatePending") | v14 | v13) & 1) != 0
            || (objc_msgSend(v11, "removalInProgress") & 1) != 0)
          {
            v15 = 0;
          }
          else
          {
            v15 = objc_msgSend(v11, "blockInvalidation") ^ 1;
          }
          if ((objc_msgSend(v11, "isDisabled") & 1) != 0 || v15)
          {
            v16 = (void *)MEMORY[0x242656984]();
            v17 = self;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = v6;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v11, "isDisabled");
              *(_DWORD *)buf = 138544130;
              v51 = v20;
              v52 = 1024;
              v53 = v21;
              v54 = 1024;
              v55 = v15;
              v56 = 2112;
              v57 = v11;
              _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Invalidating server because it is disabled(%d) or was removed from storage(%d). Server:%@", buf, 0x22u);

              v6 = v19;
              v9 = v34;
            }

            objc_autoreleasePoolPop(v16);
            objc_msgSend(v35, "addObject:", v11);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      v8 = v22;
    }
    while (v22);
  }

  v23 = dispatch_group_create();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = v35;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  v26 = MEMORY[0x24BDAC760];
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        dispatch_group_enter(v23);
        v39[0] = v26;
        v39[1] = 3221225472;
        v39[2] = __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke;
        v39[3] = &unk_250F23DF0;
        v40 = v23;
        -[HMMTRAccessoryServerBrowser invalidateAccessoryServer:reason:withCompletion:](self, "invalidateAccessoryServer:reason:withCompletion:", v30, v36, v39);

      }
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v27);
  }

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v31 = objc_claimAutoreleasedReturnValue();
  block[0] = v26;
  block[1] = 3221225472;
  block[2] = __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke_2;
  block[3] = &unk_250F22768;
  block[4] = self;
  v38 = v33;
  v32 = v33;
  dispatch_group_notify(v23, v31, block);

}

- (void)_updateLocallyDiscoveredServerPairedStates
{
  NSMutableSet *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  HMMTRAccessoryServerBrowser *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_discoveredAccessoryServers;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138543874;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "locallyDiscovered", v17, (_QWORD)v18))
        {
          -[HMMTRAccessoryServerBrowser stagedAccessoryServers](self, "stagedAccessoryServers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v9);

          v12 = objc_msgSend(v9, "isPairedInStorage");
          if (objc_msgSend(v9, "pairedState"))
          {
            if (((objc_msgSend(v9, "storageUpdatePending") | v12 | v11) & 1) == 0
              && (objc_msgSend(v9, "removalInProgress") & 1) == 0
              && (objc_msgSend(v9, "blockInvalidation") & 1) == 0)
            {
              v13 = (void *)MEMORY[0x242656984]();
              v14 = self;
              HMFGetOSLogHandle();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v17;
                v23 = v16;
                v24 = 1024;
                v25 = 1;
                v26 = 2112;
                v27 = v9;
                _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating server paired state because it was removed from storage(%d). Server:%@", buf, 0x1Cu);

              }
              objc_autoreleasePoolPop(v13);
              objc_msgSend(v9, "setPairedState:", 0);
            }
          }
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }

}

- (id)_currentHomeFabricDeviceControllerStartupParams
{
  if (-[HMMTRAccessoryServerBrowser _isPerControllerStorageEnabled](self, "_isPerControllerStorageEnabled"))
    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceControllerStartupParams2](self, "_currentHomeFabricDeviceControllerStartupParams2");
  else
    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceControllerStartupParams1](self, "_currentHomeFabricDeviceControllerStartupParams1");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentHomeFabricDeviceControllerStartupParams1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  HMMTRControllerParameters *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  HMMTROperationalCertificateIssuer *v16;
  void *v17;
  HMMTROperationalCertificateIssuer *v18;
  void *v19;
  void *v20;
  HMMTRAccessoryServerBrowser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTRAccessoryServerBrowser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMMTRAccessoryServerBrowser *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMMTRAccessoryServerBrowser *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  HMMTRControllerParameters *v55;
  void *v56;
  HMMTRAccessoryServerBrowser *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootCertForCurrentFabric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationalCertForCurrentFabric");
  v6 = objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser ownerLocalOperationalKeyPair](self, "ownerLocalOperationalKeyPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident")
    && v8
    && objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v8, v6))
  {
    v9 = v8;

    v7 = v9;
  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ipkForCurrentFabric");
  v11 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v11;
  v12 = -[HMMTRControllerParameters initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:]([HMMTRControllerParameters alloc], "initWithIPK:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v11, v7, v6, 0, v4);
  -[HMMTRControllerParameters setVendorID:](v12, "setVendorID:", &unk_250F3F918);
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isSharedAdmin") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == 0;

  }
  v63 = (void *)v6;
  if (!-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident") && v14)
  {

    v4 = 0;
  }
  v16 = [HMMTROperationalCertificateIssuer alloc];
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMMTROperationalCertificateIssuer initWithQueue:rootCertificate:browser:](v16, "initWithQueue:rootCertificate:browser:", v17, v4, self);
  -[HMMTRControllerParameters setOperationalCertificateIssuer:](v12, "setOperationalCertificateIssuer:", v18);

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setOperationalCertificateIssuerQueue:](v12, "setOperationalCertificateIssuerQueue:", v19);

  v20 = (void *)MEMORY[0x242656984]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters rootCertificate](v12, "rootCertificate", v63);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalCertificate](v12, "operationalCertificate");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = "shared";
    *(_DWORD *)buf = 138544386;
    v66 = v23;
    v28 = "local";
    if (v7 == v8)
      v27 = "local";
    v67 = 2112;
    v69 = 2112;
    v68 = v24;
    if (!v4)
      v28 = "remote";
    v70 = v25;
    v71 = 2080;
    v72 = v27;
    v73 = 2080;
    v74 = v28;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting root and operational cert in start up params %@ %@ for current home controller using %s operational key and %s NOC issuer", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMMTRControllerParameters rootCertificate](v12, "rootCertificate");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29
    && (v30 = (void *)v29,
        -[HMMTRControllerParameters operationalCertificate](v12, "operationalCertificate"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    v32 = (void *)MEMORY[0x242656984]();
    v33 = v21;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRControllerParameters rootCertificate](v12, "rootCertificate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shortDescriptionForX509Certificate:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v35;
      v67 = 2112;
      v68 = v38;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Controller Root certificate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v39 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRControllerParameters rootCertificate](v12, "rootCertificate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "printX509Certificate:", v40);

    v41 = (void *)MEMORY[0x242656984]();
    v42 = v33;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRControllerParameters operationalCertificate](v12, "operationalCertificate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "shortDescriptionForX509Certificate:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v44;
      v67 = 2112;
      v68 = v47;
      _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Controller NOC: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
    v48 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRControllerParameters operationalCertificate](v12, "operationalCertificate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "printX509Certificate:", v49);

    v50 = (void *)MEMORY[0x242656984]();
    v51 = v42;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "hmmtr_sha256hash");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v53;
      v67 = 2112;
      v68 = v54;
      _os_log_impl(&dword_23E95B000, v52, OS_LOG_TYPE_INFO, "%{public}@IPK: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v55 = v12;
  }
  else
  {
    v56 = (void *)MEMORY[0x242656984]();
    v57 = v21;
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "description");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v59;
      v67 = 2112;
      v68 = v61;
      _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_ERROR, "%{public}@Bad params: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v56);
    v55 = 0;
  }

  return v55;
}

- (id)_currentHomeFabricDeviceControllerStartupParams2
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  HMMTRPerControllerStorage *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  HMMTRControllerParameters *v18;
  void *v19;
  HMMTRControllerParameters *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  HMMTROperationalCertificateIssuer *v24;
  void *v25;
  HMMTROperationalCertificateIssuer *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMMTRAccessoryServerBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMMTRAccessoryServerBrowser *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  HMMTRAccessoryServerBrowser *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HMMTRAccessoryServerBrowser *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HMMTRAccessoryServerBrowser *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  HMMTRControllerParameters *v78;
  void *v79;
  HMMTRAccessoryServerBrowser *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v86;
  void *v87;
  dispatch_queue_t v88;
  void *v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  const char *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootCertForCurrentFabric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationalCertForCurrentFabric");
  v6 = objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](self, "ownerSharedOperationalKeyPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser ownerLocalOperationalKeyPair](self, "ownerLocalOperationalKeyPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v8;
  if (!-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident")
    && v8
    && objc_msgSend(MEMORY[0x24BDDB5B0], "keypair:matchesCertificate:", v8, v6))
  {
    v9 = v8;

    v7 = v9;
  }
  v10 = dispatch_queue_create("HMMTRPerControllerStorage queue", 0);
  v11 = [HMMTRPerControllerStorage alloc];
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fabricID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser appleHomeFabricWithID:](self, "appleHomeFabricWithID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMMTRPerControllerStorage initWithQueue:fabric:](v11, "initWithQueue:fabric:", v10, v14);

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ipkForCurrentFabric");
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = [HMMTRControllerParameters alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v10;
  v89 = (void *)v6;
  v86 = (void *)v17;
  v87 = (void *)v15;
  v20 = -[HMMTRControllerParameters initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:](v18, "initWithStorageDelegate:storageDelegateQueue:uniqueIdentifier:ipk:vendorID:operationalKeypair:operationalCertificate:intermediateCertificate:rootCertificate:", v15, v10, v19, v17, &unk_250F3F918, v7, v6, 0, v4);

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isSharedAdmin") & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    -[HMMTRAccessoryServerBrowser nocSigner](self, "nocSigner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23 == 0;

  }
  if (!-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident") && v22)
  {

    v4 = 0;
  }
  v24 = [HMMTROperationalCertificateIssuer alloc];
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMMTROperationalCertificateIssuer initWithQueue:rootCertificate:browser:](v24, "initWithQueue:rootCertificate:browser:", v25, v4, self);
  -[HMMTRControllerParameters setOperationalCertificateIssuer:](v20, "setOperationalCertificateIssuer:", v26);

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setOperationalCertificateIssuerQueue:](v20, "setOperationalCertificateIssuerQueue:", v27);

  -[HMMTRAccessoryServerBrowser otaProviderDelegate](self, "otaProviderDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setOtaProviderDelegate:](v20, "setOtaProviderDelegate:", v28);

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setOtaProviderDelegateQueue:](v20, "setOtaProviderDelegateQueue:", v29);

  -[HMMTRAccessoryServerBrowser attestationDataStore](self, "attestationDataStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "cdCertificates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setCertificationDeclarationCertificates:](v20, "setCertificationDeclarationCertificates:", v31);

  -[HMMTRAccessoryServerBrowser attestationDataStore](self, "attestationDataStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "paaCertificates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerParameters setProductAttestationAuthorityCertificates:](v20, "setProductAttestationAuthorityCertificates:", v33);

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "productPlatform");

  if (v35 == 4)
  {
    v36 = (void *)MEMORY[0x242656984](-[HMMTRControllerParameters setShouldAdvertiseOperational:](v20, "setShouldAdvertiseOperational:", 1));
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v92 = v39;
      _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Requesting operational discovery for current controller node", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
  }
  v40 = v7;
  v41 = (void *)MEMORY[0x242656984]();
  v42 = self;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters rootCertificate](v20, "rootCertificate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters operationalCertificate](v20, "operationalCertificate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerParameters uniqueIdentifier](v20, "uniqueIdentifier");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    *(_DWORD *)buf = 138544642;
    v49 = "shared";
    v92 = v44;
    v50 = "local";
    if (v40 == v90)
      v49 = "local";
    if (!v4)
      v50 = "remote";
    v93 = 2112;
    v94 = v45;
    v95 = 2112;
    v96 = v46;
    v97 = 2112;
    v98 = v47;
    v99 = 2080;
    v100 = v49;
    v101 = 2080;
    v102 = v50;
    _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting root and operational cert in start up params %@ %@ for current home controller with UUID %@ using %s operational key and %s NOC issuer", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v41);
  -[HMMTRControllerParameters rootCertificate](v20, "rootCertificate");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51
    && (v52 = (void *)v51,
        -[HMMTRControllerParameters operationalCertificate](v20, "operationalCertificate"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v53,
        v52,
        v53))
  {
    v54 = (void *)MEMORY[0x242656984]();
    v55 = v42;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRControllerParameters rootCertificate](v20, "rootCertificate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "shortDescriptionForX509Certificate:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v57;
      v93 = 2112;
      v94 = v60;
      _os_log_impl(&dword_23E95B000, v56, OS_LOG_TYPE_INFO, "%{public}@Controller Root certificate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    v61 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRControllerParameters rootCertificate](v20, "rootCertificate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "printX509Certificate:", v62);

    v63 = (void *)MEMORY[0x242656984]();
    v64 = v55;
    HMFGetOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x24BDDB5B0];
      -[HMMTRControllerParameters operationalCertificate](v20, "operationalCertificate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "shortDescriptionForX509Certificate:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v66;
      v93 = 2112;
      v94 = v69;
      _os_log_impl(&dword_23E95B000, v65, OS_LOG_TYPE_INFO, "%{public}@Controller NOC: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v63);
    v70 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRControllerParameters operationalCertificate](v20, "operationalCertificate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "printX509Certificate:", v71);

    v72 = (void *)MEMORY[0x242656984]();
    v73 = v64;
    HMFGetOSLogHandle();
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v86;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "hmmtr_sha256hash");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v76;
      v93 = 2112;
      v94 = v77;
      _os_log_impl(&dword_23E95B000, v74, OS_LOG_TYPE_INFO, "%{public}@IPK: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v72);
    v78 = v20;
  }
  else
  {
    v79 = (void *)MEMORY[0x242656984]();
    v80 = v42;
    HMFGetOSLogHandle();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "description");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v82;
      v93 = 2112;
      v94 = v84;
      _os_log_impl(&dword_23E95B000, v81, OS_LOG_TYPE_ERROR, "%{public}@Bad params: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v79);
    v78 = 0;
    v75 = v86;
  }

  return v78;
}

- (id)currentHomeFabricDeviceControllerWrapper
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

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceControllerStartupParams](self, "_currentHomeFabricDeviceControllerStartupParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMMTRAccessoryServerBrowser homeFabricControllers](self, "homeFabricControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](self, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fabricID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](self, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allFabricIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "wrapperWithFabricID:startupParams:allFabricIDs:", v8, v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

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

- (id)_currentHomeFabricDeviceController
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

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceControllerStartupParams](self, "_currentHomeFabricDeviceControllerStartupParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMMTRAccessoryServerBrowser homeFabricControllers](self, "homeFabricControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](self, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fabricID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](self, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allFabricIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "wrapperWithFabricID:startupParams:allFabricIDs:", v8, v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "controller");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (MTRDeviceController)deviceController
{
  void *v3;
  void *v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (-[HMMTRAccessoryServerBrowser isSystemCommissionerMode](self, "isSystemCommissionerMode"))
  {
    -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](self, "systemCommissionerControllerWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return (MTRDeviceController *)v4;
  }
  else
  {
    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceController](self, "_currentHomeFabricDeviceController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __47__HMMTRAccessoryServerBrowser_deviceController__block_invoke;
      v10[3] = &unk_250F22458;
      v10[4] = self;
      v9 = v7;
      v11 = v9;
      dispatch_async(v8, v10);

      return (MTRDeviceController *)v9;
    }
    else
    {
      return (MTRDeviceController *)0;
    }
  }
}

- (void)waitForDeviceControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMMTRAccessoryServerBrowser_waitForDeviceControllerWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMMTRControllerWrapper)systemCommissionerControllerWrapper
{
  void *v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10;
  id v11;

  -[HMMTRAccessoryServerBrowser systemCommissionerControllerParams](self, "systemCommissionerControllerParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = 0;
  v4 = objc_msgSend(v3, "fetchControllerParamsAllowingNew:nocSigner:controllerWrapper:", 0, &v11, &v10);
  v5 = v11;
  v6 = v10;

  v7 = 0;
  if (v4)
  {
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSystemCommissionerNocSigner:", v5);

    v7 = v6;
  }

  return (HMMTRControllerWrapper *)v7;
}

- (HMMTRMatterKeypair)systemCommissionerNocSigner
{
  void *v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10;
  id v11;

  -[HMMTRAccessoryServerBrowser systemCommissionerControllerParams](self, "systemCommissionerControllerParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = 0;
  v4 = objc_msgSend(v3, "fetchControllerParamsAllowingNew:nocSigner:controllerWrapper:", 0, &v11, &v10);
  v5 = v11;
  v6 = v10;

  v7 = 0;
  if (v4)
  {
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSystemCommissionerNocSigner:", v5);

    v7 = v5;
  }

  return (HMMTRMatterKeypair *)v7;
}

- (NSNumber)systemCommissionerFabricID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](self, "systemCommissionerControllerWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startupParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)_cleanupStagedServers
{
  void *v3;
  HMMTRAccessoryServerBrowser *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting staged accessory pairings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerBrowser workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (BOOL)_isDevicePaired:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fabricDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allNodeIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  objc_msgSend(v8, "pairedNodeIDsOnSystemCommissionerFabric:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "containsObject:", v12);

  }
  return v9;
}

- (BOOL)_isDeviceIDPaired:(id)a3 nodeID:(id *)a4 fabricID:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__HMMTRAccessoryServerBrowser__isDeviceIDPaired_nodeID_fabricID___block_invoke;
  v13[3] = &unk_250F21F18;
  v11 = v8;
  v16 = a4;
  v17 = a5;
  v14 = v11;
  v15 = &v18;
  objc_msgSend(v10, "forAllStorageDataSourcesDo:", v13);

  LOBYTE(a5) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

- (BOOL)_isNodeIDPaired:(id)a3 fabricID:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__HMMTRAccessoryServerBrowser__isNodeIDPaired_fabricID___block_invoke;
  v11[3] = &unk_250F21F40;
  v9 = v6;
  v12 = v9;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v8, "forAllStorageDataSourcesDo:", v11);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (void)setupPairedDevices
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMMTRAccessoryServerBrowser_setupPairedDevices__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_setupPairedDevices
{
  void *v3;
  void *v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRAccessoryServerBrowser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMMTRAccessoryServerBrowser *v30;
  NSObject *v31;
  void *v32;
  id v33;
  __int128 v34;
  uint64_t j;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  HMMTRAccessoryServerBrowser *v47;
  NSObject *v48;
  void *v49;
  const char *v50;
  __int128 v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  id v55;
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
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (!-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident")
    && !-[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](self, "isCurrentDeviceMobileAndAllowedAccessoryControl"))
  {
    v46 = (void *)MEMORY[0x242656984]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v49;
      v50 = "%{public}@Not the primary Resident, not restoring previously paired accessories...";
      goto LABEL_44;
    }
LABEL_45:

    objc_autoreleasePoolPop(v46);
    -[HMMTRAccessoryServerBrowser nodesAddedToHome](v47, "nodesAddedToHome");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllObjects");
    goto LABEL_46;
  }
  -[HMMTRAccessoryServerBrowser nodesAddedToHome](self, "nodesAddedToHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](self, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x242656984]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v8;
        _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Voting to enable controller factory when setting up paired devices", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      -[HMMTRAccessoryServerBrowser controllerFactory](v6, "controllerFactory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](v6, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enableNormalOperationWithToken:", v10);

      -[HMMTRAccessoryServerBrowser setControllerFactoryEnablePerPrimaryResidentConfirmationToken:](v6, "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", 0);
    }
  }
  else
  {

  }
  -[HMMTRAccessoryServerBrowser deviceController](self, "deviceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRunning");

  if ((v12 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x242656984]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v49;
      v50 = "%{public}@CHIP Controller hasn't been setup, maybe storage isn't available yet?";
LABEL_44:
      _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_INFO, v50, buf, 0xCu);

      goto LABEL_45;
    }
    goto LABEL_45;
  }
  if (-[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](self, "isCurrentDeviceMobileAndAllowedAccessoryControl")&& !-[HMMTRAccessoryServerBrowser isSystemCommissionerMode](self, "isSystemCommissionerMode"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fabricDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allNodeIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v61 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (v20)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "isEqual:", &unk_250F3F900) & 1) == 0)
            {
              -[HMMTRAccessoryServerBrowser accessoryServerWithNodeID:](self, "accessoryServerWithNodeID:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                -[HMMTRAccessoryServerBrowser nodesAddedToHome](self, "nodesAddedToHome");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObject:", v20);

              }
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v17);
    }

  }
  v23 = (void *)MEMORY[0x242656984]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v66 = v26;
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Checking for new devices in storage...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  -[HMMTRAccessoryServerBrowser nodesAddedToHome](v24, "nodesAddedToHome");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");

  v29 = (void *)MEMORY[0x242656984]();
  v30 = v24;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v66 = v32;
    v67 = 2112;
    v68 = v28;
    _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Looking through all paired NodeIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v33 = v28;
  v54 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v57;
    *(_QWORD *)&v34 = 138543618;
    v51 = v34;
    obj = v33;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v57 != v53)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        v37 = (void *)MEMORY[0x242656984]();
        v38 = objc_msgSend(v36, "unsignedLongLongValue");
        v55 = 0;
        -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:ifPaired:fatalError:](v30, "_createCHIPAccessoryForNodeID:ifPaired:fatalError:", v38, 0, &v55);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v55;
        if (v39)
        {
          v41 = (void *)MEMORY[0x242656984]();
          v42 = v30;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v51;
            v66 = v44;
            v67 = 2112;
            v68 = v36;
            _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Found new device(%@) in storage...", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v41);
          objc_msgSend(v42[16], "addObject:", v39);
        }
        -[HMMTRAccessoryServerBrowser nodesAddedToHome](v30, "nodesAddedToHome", v51);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "removeObject:", v36);

        objc_autoreleasePoolPop(v37);
      }
      v33 = obj;
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v54);
  }

LABEL_46:
}

- (void)_reenumeratePairedDevices
{
  HMMTRAccessoryServerBrowser *v2;
  NSMutableSet *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  uint64_t v14;
  NSMutableSet *v15;
  HMMTRAccessoryServerBrowser *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_discoveredAccessoryServers;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138543618;
    v19 = v5;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "removalInProgress", v19) & 1) == 0)
        {
          v11 = (void *)MEMORY[0x242656984]();
          v12 = v2;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = v7;
            v15 = v3;
            v16 = v2;
            v17 = v8;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v27 = v18;
            v28 = 2112;
            v29 = v10;
            _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Re-enumerating server %@", buf, 0x16u);

            v8 = v17;
            v2 = v16;
            v3 = v15;
            v7 = v14;
            v6 = v20;
          }

          objc_autoreleasePoolPop(v11);
          v21[0] = v8;
          v21[1] = 3221225472;
          v21[2] = __56__HMMTRAccessoryServerBrowser__reenumeratePairedDevices__block_invoke;
          v21[3] = &unk_250F23E18;
          v21[4] = v12;
          v21[5] = v10;
          objc_msgSend(v10, "enumerateHAPServices:", v21);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

}

- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3
{
  return -[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:ifPaired:fatalError:](self, "_createCHIPAccessoryForNodeID:ifPaired:fatalError:", a3, 1, 0);
}

- (id)_createCHIPAccessoryForNodeID:(unint64_t)a3 ifPaired:(BOOL)a4 fatalError:(id *)a5
{
  unint64_t v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  char v37;
  void *v38;
  HMMTRAccessoryServerBrowser *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  HMMTRAccessoryServerBrowser *v44;
  NSObject *v45;
  void *v46;
  HMMTRAccessoryServerFactory *v47;
  void *v48;
  HMMTRAccessoryServerFactory *v49;
  void *v50;
  id v51;
  void *v52;
  HMMTRAccessoryServerBrowser *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMMTRAccessoryServerBrowser *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  HMMTRAccessoryServerBrowser *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  HMMTRAccessoryServerBrowser *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  HMMTRAccessoryServerBrowser *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  void *v98;
  void *v99;
  HMMTRAccessoryServerBrowser *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  HMMTRAccessoryServerBrowser *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  HMMTRAccessoryServerBrowser *v108;
  NSObject *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  HMMTRAccessoryServerBrowser *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  HMMTRAccessoryServerBrowser *v128;
  NSObject *v129;
  void *v130;
  _BOOL4 v131;
  uint64_t v132;
  id v133;
  void *v134;
  HMMTRAccessoryServerBrowser *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  unint64_t v140;
  void *v141;
  char v142;
  HMMTRAccessoryServerBrowser *v143;
  void *v144;
  id *v145;
  HMMTRAccessoryServerFactory *v146;
  void *v147;
  void *v148;
  void *v149;
  _QWORD v150[5];
  id v151;
  _QWORD v152[5];
  _QWORD v153[5];
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t v160[128];
  uint8_t buf[4];
  void *v162;
  __int16 v163;
  unint64_t v164;
  __int16 v165;
  id v166;
  __int16 v167;
  void *v168;
  __int16 v169;
  void *v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  void *v176;
  uint64_t v177;

  v6 = a3;
  v177 = *MEMORY[0x24BDAC8D0];
  if (a4 && !-[HMMTRAccessoryServerBrowser _isDevicePaired:](self, "_isDevicePaired:", a3))
  {
    v62 = (void *)MEMORY[0x242656984]();
    v63 = self;
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v162 = v65;
      v163 = 2048;
      v164 = v6;
      _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_INFO, "%{public}@No CHIP accessory for nodeID %llu, skipping...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v62);
    return 0;
  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isStagedForNode:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v162 = v14;
      v163 = 2048;
      v164 = v6;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Found staged accessory %llu in storage, skipping...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  v145 = a5;
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "vendorIDForNode:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "productIDForNode:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "categoryForNode:", v23);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configNumberForNode:", v25);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 || !v21)
  {
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fabricDataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "storageDataSourceForDeviceWithNodeID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "vendorID");
    v30 = objc_claimAutoreleasedReturnValue();

    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fabricDataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "storageDataSourceForDeviceWithNodeID:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "productID");
    v35 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v35;
    v18 = (void *)v30;
  }
  if (v18)
    v36 = v21 == 0;
  else
    v36 = 1;
  v37 = !v36;
  if (v36 || !v149 || !v148)
  {
    v38 = (void *)MEMORY[0x242656984]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v162 = v41;
      v163 = 2112;
      v164 = (unint64_t)v18;
      v165 = 2112;
      v166 = v21;
      v167 = 2112;
      v168 = v149;
      v169 = 2112;
      v170 = v148;
      v171 = 2112;
      v172 = v42;
      _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, "%{public}@vendorID = %@, productID = %@, category = %@, configNumber = %@, nodeID = %@", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v38);
    v43 = (void *)MEMORY[0x242656984]();
    v44 = v39;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v162 = v46;
      _os_log_impl(&dword_23E95B000, v45, OS_LOG_TYPE_INFO, "%{public}@All parameters are not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
  }
  v47 = [HMMTRAccessoryServerFactory alloc];
  -[HAPAccessoryServerBrowser keyStore](self, "keyStore");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[HMMTRAccessoryServerFactory initWithKeystore:browser:](v47, "initWithKeystore:browser:", v48, self);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v49;
  v147 = v18;
  -[HMMTRAccessoryServerFactory vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:](v49, "vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:", v50, 0, 0, v149, v18, v21, 0, CFSTR("1.0.0"));
  v51 = (id)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {
    v66 = (void *)MEMORY[0x242656984]();
    v67 = self;
    HMFGetOSLogHandle();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v162 = v69;
      v163 = 2048;
      v164 = v6;
      _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to recover stored accessory for NodeID %llu...skipping", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v66);
    if (v145)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
      v51 = 0;
      *v145 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    goto LABEL_85;
  }
  v52 = (void *)MEMORY[0x242656984](objc_msgSend(v51, "setConfigNumber:", objc_msgSend(v148, "integerValue")));
  v53 = self;
  HMFGetOSLogHandle();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v51, "configNumber");
    *(_DWORD *)buf = 138543618;
    v162 = v55;
    v163 = 2048;
    v164 = v56;
    _os_log_impl(&dword_23E95B000, v54, OS_LOG_TYPE_DEBUG, "%{public}@Loading with config number %tu", buf, 0x16u);

  }
  v144 = v21;

  objc_autoreleasePoolPop(v52);
  if (!objc_msgSend(v51, "knownToSystemCommissioner"))
  {
    -[HMMTRAccessoryServerBrowser storage](v53, "storage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "fabricDataSource");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "storageDataSourceForDeviceWithNodeID:", v72);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "setWedDevice:", objc_msgSend(v59, "wedSupport"));
    objc_msgSend(v59, "extendedMACAddress");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setEMACAddress:", v73);

    objc_msgSend(v59, "supportedLinkLayerTypes");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setSupportedLinkLayerTypes:", v74);

    objc_msgSend(v59, "softwareVersionNumber");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v75 = (void *)MEMORY[0x242656984]();
      v76 = v53;
      HMFGetOSLogHandle();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v162 = v78;
        v163 = 2112;
        v164 = (unint64_t)v60;
        _os_log_impl(&dword_23E95B000, v77, OS_LOG_TYPE_INFO, "%{public}@Accessory software version number = %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v75);
      objc_msgSend(v51, "updateSoftwareVersion:", v60);
      objc_msgSend(v51, "notifyMatterFirmwareRevisionNumberCharacteristicChanged");
    }
    goto LABEL_43;
  }
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMMTRAccessoryServerBrowser storage](v53, "storage");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWedDevice:", objc_msgSend(v57, "wedSupportedForSystemCommissionerFabricNode:", v58));

    -[HMMTRAccessoryServerBrowser storage](v53, "storage");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "extendedMACAddressForSystemCommissionerFabricNode:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setEMACAddress:", v61);

LABEL_43:
  }
  objc_msgSend(v51, "supportedLinkLayerTypes");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "unsignedIntValue");

  objc_msgSend(v51, "supportedLinkLayerTypes");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "unsignedIntValue");

  objc_msgSend(v51, "supportedLinkLayerTypes");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "unsignedIntValue");

  v82 = (void *)MEMORY[0x242656984]();
  v83 = v53;
  HMFGetOSLogHandle();
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    v143 = v83;
    v141 = v82;
    HMFGetLogIdentifier();
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v140 = v6;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "isWEDDevice");
    HMFBooleanToString();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "eMACAddress");
    v142 = v37;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "supportedLinkLayerTypes");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v162 = v85;
    v163 = 2112;
    v164 = (unint64_t)v86;
    v165 = 2112;
    v166 = v87;
    v167 = 2112;
    v168 = v88;
    v169 = 2112;
    v170 = v89;
    v171 = 2112;
    v172 = v90;
    v173 = 2112;
    v174 = v91;
    v175 = 2112;
    v176 = v92;
    _os_log_impl(&dword_23E95B000, v84, OS_LOG_TYPE_INFO, "%{public}@nodeID: %@ WED: %@ eMAC: %@, supportedLinkLayerTypes: %@ [WiFi:%@, Ethernet:%@, Thread:%@]", buf, 0x52u);

    v37 = v142;
    v6 = v140;

    v83 = v143;
    v82 = v141;

  }
  objc_autoreleasePoolPop(v82);
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  -[HMMTRAccessoryServerBrowser _allServers](v83, "_allServers");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
  if (!v94)
    goto LABEL_70;
  v95 = v94;
  v96 = *(_QWORD *)v157;
  while (2)
  {
    for (i = 0; i != v95; ++i)
    {
      if (*(_QWORD *)v157 != v96)
        objc_enumerationMutation(v93);
      v98 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
      if (objc_msgSend(v98, "isEqual:", v51))
      {
        if (-[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](v83, "isCurrentDeviceMobileAndAllowedAccessoryControl"))
        {
          if (objc_msgSend(v98, "delayDiscovery"))
          {
            v99 = (void *)MEMORY[0x242656984]();
            v100 = v83;
            HMFGetOSLogHandle();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v162 = v102;
              v163 = 2048;
              v164 = v6;
              v165 = 2112;
              v166 = v98;
              _os_log_impl(&dword_23E95B000, v101, OS_LOG_TYPE_INFO, "%{public}@Found existing server for nodeID %llu in unpaired state, but discovery is delayed for server %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v99);
LABEL_66:

            v51 = 0;
            v21 = v144;
            goto LABEL_85;
          }
          if (objc_msgSend(v98, "pairedState") != 3)
          {
            v107 = (void *)MEMORY[0x242656984]();
            v108 = v83;
            HMFGetOSLogHandle();
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v162 = v110;
              v163 = 2048;
              v164 = v6;
              v165 = 2112;
              v166 = v51;
              _os_log_impl(&dword_23E95B000, v109, OS_LOG_TYPE_INFO, "%{public}@Found existing server for nodeID %llu in unpaired state, using it instead of new server = %@ ", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v107);
            v111 = v98;

            v51 = v111;
            goto LABEL_70;
          }
        }
        v103 = (void *)MEMORY[0x242656984]();
        v104 = v83;
        HMFGetOSLogHandle();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v162 = v106;
          v163 = 2048;
          v164 = v6;
          _os_log_impl(&dword_23E95B000, v105, OS_LOG_TYPE_ERROR, "%{public}@Found existing server for node %llu...skipping", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v103);
        if (v145)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 18);
          *v145 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_66;
      }
    }
    v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
    if (v95)
      continue;
    break;
  }
LABEL_70:

  v21 = v144;
  if ((v37 & 1) != 0)
  {
    -[HMMTRAccessoryServerBrowser storage](v83, "storage");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "fabricDataSource");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "storageDataSourceForDeviceWithNodeID:", v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = MEMORY[0x24BDAC760];
    v153[1] = 3221225472;
    v153[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke;
    v153[3] = &unk_250F21EC8;
    v153[4] = v83;
    v154 = v147;
    v155 = v144;
    objc_msgSend(v115, "updateVendorID:productID:completion:", v154, v155, v153);

  }
  objc_msgSend(v51, "setPairedState:", 3);
  if (-[HMMTRAccessoryServerBrowser isSystemCommissionerMode](v83, "isSystemCommissionerMode"))
  {
    v116 = (void *)MEMORY[0x242656984]();
    v117 = v83;
    HMFGetOSLogHandle();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v162 = v119;
      v163 = 2112;
      v164 = (unint64_t)v51;
      v165 = 2112;
      v166 = v120;
      _os_log_impl(&dword_23E95B000, v118, OS_LOG_TYPE_INFO, "%{public}@Created %@ for System Commissioner Fabric Node %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v116);
    -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](v117, "systemCommissionerControllerWrapper");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setControllerWrapper:", v121);

  }
  else
  {
    -[HMMTRAccessoryServerBrowser currentHomeFabricDeviceControllerWrapper](v83, "currentHomeFabricDeviceControllerWrapper");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setControllerWrapper:", v122);

    -[HMMTRAccessoryServerBrowser storage](v83, "storage");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "topologyForNode:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTopology:", v125);

    objc_msgSend(v51, "topology");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v126)
    {
      v127 = (void *)MEMORY[0x242656984]();
      v128 = v83;
      HMFGetOSLogHandle();
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v162 = v130;
        _os_log_impl(&dword_23E95B000, v129, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch topology from storage. This would require rebuilding topology again from resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v127);
    }
    v131 = -[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](v83, "isCurrentDevicePrimaryResident");
    v132 = MEMORY[0x24BDAC760];
    if (v131)
    {
      v152[0] = MEMORY[0x24BDAC760];
      v152[1] = 3221225472;
      v152[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_270;
      v152[3] = &unk_250F223C0;
      v152[4] = v83;
      -[HMMTRAccessoryServerBrowser _updateAccessoryControlListForServer:completion:](v83, "_updateAccessoryControlListForServer:completion:", v51, v152);
    }
    v150[0] = v132;
    v150[1] = 3221225472;
    v150[2] = __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_271;
    v150[3] = &unk_250F23E18;
    v150[4] = v83;
    v133 = v51;
    v151 = v133;
    v134 = (void *)MEMORY[0x242656984](objc_msgSend(v133, "enumerateHAPServices:", v150));
    v135 = v83;
    HMFGetOSLogHandle();
    v136 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "identifier");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v162 = v137;
      v163 = 2112;
      v164 = (unint64_t)v138;
      _os_log_impl(&dword_23E95B000, v136, OS_LOG_TYPE_INFO, "%{public}@Adding previously paired server with Identifier %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v134);
    v139 = v151;
    v51 = v133;

  }
LABEL_85:

  return v51;
}

- (void)_updateAccessoryControlListForServer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMMTRAccessoryServerBrowser *v15;
  NSObject *v16;
  void *v17;
  id *v18;
  id *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "populateACLEntriesAfterPairing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adminNodesForPairing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("regularNodesForPairing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser nodesWithPendingACLOverwrite](self, "nodesWithPendingACLOverwrite");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Overwriting ACL on accessory to remove node ID of shared Admin controller", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke;
    v25[3] = &unk_250F228C0;
    v18 = &v26;
    v25[4] = v15;
    v26 = v6;
    v19 = &v27;
    v27 = v7;
    v20 = v7;
    objc_msgSend(v6, "updateAccessoryControlToAdministratorNodes:sharedUserNodes:completion:", v9, v10, v25);
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke_272;
    v22[3] = &unk_250F228C0;
    v18 = &v23;
    v22[4] = self;
    v23 = v6;
    v19 = &v24;
    v24 = v7;
    v21 = v7;
    objc_msgSend(v6, "updateAccessoryControlToIncludeAdministratorNodes:sharedUserNodes:completion:", v9, v10, v22);
  }

}

- (void)announceOtaProviderForNodeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMTRAccessoryServerBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMMTRAccessoryServerBrowser *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident")
    || -[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](self, "isCurrentDeviceMobileAndAllowedAccessoryControl")|| -[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResident](self, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResident"))
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      -[HMMTRAccessoryServerBrowser accessoryServerWithNodeID:](self, "accessoryServerWithNodeID:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "matterFirmwareUpdateStatus");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateFirmwareUpdateStatus:", 3);

        -[HMMTRAccessoryServerBrowser deviceController](self, "deviceController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "controllerNodeId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __60__HMMTRAccessoryServerBrowser_announceOtaProviderForNodeID___block_invoke;
        v18[3] = &unk_250F23E18;
        v18[4] = self;
        v19 = v6;
        objc_msgSend(v19, "announceOtaProvider:providerEndpoint:immediateAnnouncement:completionHandler:", v9, &unk_250F3F900, 0, v18);

      }
      else
      {
        v10 = (void *)MEMORY[0x242656984]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v13;
          v22 = 2112;
          v23 = v4;
          _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for announceOtaProviderForNodeID:%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
      }

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Current device cannot be an OTA provider", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)_allServers
{
  void *v3;
  void *v4;
  void *v5;

  -[HMMTRAccessoryServerBrowser discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMMTRAccessoryServerBrowser stagedAccessoryServers](self, "stagedAccessoryServers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  return v4;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMMTRAccessoryServerBrowser delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
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

- (unint64_t)_generateNodeID
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  HMMTRAccessoryServerBrowser *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allNodeIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  do
  {
    v6 = +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "containsObject:", v7);

  }
  while ((v8 & 1) != 0);
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Picking nodeID = %llu for the pairing request", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

  return v6;
}

- (unint64_t)_getRandomFabricId
{
  HMMTRAccessoryServerBrowser *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  HMMTRAccessoryServerBrowser *v15;
  void *v16;

  v2 = self;
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allFabricIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v2;
  do
  {
    v6 = +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v7))
    {
      do
      {

        v6 = +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while ((objc_msgSend(v5, "containsObject:", v7) & 1) != 0);
    }
    -[HMMTRAccessoryServerBrowser storage](v2, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToNumber:", v10) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v2, "systemCommissionerFabricID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v16 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "isEqualToNumber:", v13) ^ 1;

      v8 = v16;
      v2 = v15;
    }

  }
  while (!v11);

  return v6;
}

- (void)createNewFabricIDWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__HMMTRAccessoryServerBrowser_createNewFabricIDWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)createNewFabricDataForFabricID:(id)a3 completion:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)createNewFabricDataForFabric:(id)a3 completion:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setupStorageStateForHomeFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setupStorageStateForHomeFabricID:(id)a3 completion:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID_completion___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__HMMTRAccessoryServerBrowser_setupStorageStateAfterCertFetchForHomeFabricID_completion___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setupStorageStateAndRediscoverAccessoriesForHomeFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__HMMTRAccessoryServerBrowser_setupStorageStateAndRediscoverAccessoriesForHomeFabricID___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95__HMMTRAccessoryServerBrowser_setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3
{
  -[HMMTRAccessoryServerBrowser _setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:](self, "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:", a3, 1);
}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4
{
  -[HMMTRAccessoryServerBrowser _setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:](self, "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:", a3, a4, 0);
}

- (void)_setupStorageStateForUpdatedHomeFabricID:(id)a3 rediscoverAccessories:(BOOL)a4 overrideAccessoryControlAllowed:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  HMMTRAccessoryServerBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  HMMTRAccessoryServerBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  HMMTRAccessoryServerBrowser *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMMTRAccessoryServerBrowser *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  HMMTRAccessoryServerBrowser *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v6 = a4;
  v72 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 138543874;
    v67 = v12;
    v68 = 2112;
    v69 = v8;
    v70 = 2112;
    v71 = v13;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting up controller wrapper for Home FabricID = %@, currentFabricID = %@", (uint8_t *)&v66, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", v16) & 1) != 0)
    {
      -[HMMTRAccessoryServerBrowser storage](v10, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fabricID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v8, "isEqual:", v18);

      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HMMTRAccessoryServerBrowser storage](v10, "storage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRootCert:", 0);

    -[HMMTRAccessoryServerBrowser storage](v10, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setOperationalCert:", 0);

    -[HMMTRAccessoryServerBrowser storage](v10, "storage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setOwnerNodeID:", 0);

    -[HMMTRAccessoryServerBrowser storage](v10, "storage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOwnerIPK:", 0);

  }
LABEL_9:
  if (v8)
  {
    -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToNumber:", v8);

      if (v27)
        -[HMMTRAccessoryServerBrowser setPreventThreadStopDuringStackRestart:](v10, "setPreventThreadStopDuringStackRestart:", 1);
    }
  }
  if (!-[HMMTRAccessoryServerBrowser preventThreadStopDuringStackRestart](v10, "preventThreadStopDuringStackRestart"))
  {
    -[HMMTRAccessoryServerBrowser threadRadioManager](v10, "threadRadioManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v10, "systemCommissionerFabricID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stopThreadRadioForSystemCommissionerFabricID:", v29);

    -[HMMTRAccessoryServerBrowser threadRadioManager](v10, "threadRadioManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stopThreadRadioForHomeWithFabricID:", v31);

  }
  -[HMMTRAccessoryServerBrowser setPreventThreadStopDuringStackRestart:](v10, "setPreventThreadStopDuringStackRestart:", 0);
  -[HMMTRAccessoryServerBrowser _setupStorageStateForHomeFabricID:](v10, "_setupStorageStateForHomeFabricID:", v8);
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if (!v8)
    {
      -[HMMTRAccessoryServerBrowser threadRadioManager](v10, "threadRadioManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allowDisconnect");

      -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v10, "fabricsWithActiveClients");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v10, "fabricsWithActiveClients");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "anyObject");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x242656984]();
        v37 = v10;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 138543618;
          v67 = v39;
          v68 = 2112;
          v69 = v8;
          _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@no fabricID was provided, restarting with fabric with active client: %@", (uint8_t *)&v66, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        -[HMMTRAccessoryServerBrowser _setupStorageStateForHomeFabricID:](v37, "_setupStorageStateForHomeFabricID:", v8);
      }
      else
      {
        v8 = 0;
      }
    }
    -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      if (a5
        || (-[HMMTRAccessoryServerBrowser currentFabric](v10, "currentFabric"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            v42 = -[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:](v10, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", v41), v41, v42))
      {
        if (v6
          && (-[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v10, "fabricsWithActiveClients"),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID"),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              v45 = objc_msgSend(v43, "containsObject:", v44),
              v44,
              v43,
              v45))
        {
          v46 = (void *)MEMORY[0x242656984]();
          v47 = v10;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRAccessoryServerBrowser currentFabricID](v47, "currentFabricID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = 138543618;
            v67 = v49;
            v68 = 2112;
            v69 = v50;
            _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for fabricID %@ because there are active clients", (uint8_t *)&v66, 0x16u);

          }
          objc_autoreleasePoolPop(v46);
          -[HMMTRAccessoryServerBrowser _restartDiscovery](v47, "_restartDiscovery");
        }
        else
        {
          -[HMMTRAccessoryServerBrowser threadRadioManager](v10, "threadRadioManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRAccessoryServerBrowser currentFabricID](v10, "currentFabricID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v55, "hasMatterThreadAccessoryInHomeWithFabricID:", v56);

          if (v57)
          {
            v58 = (void *)MEMORY[0x242656984]();
            v59 = v10;
            HMFGetOSLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRAccessoryServerBrowser currentFabricID](v59, "currentFabricID");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = 138543618;
              v67 = v61;
              v68 = 2112;
              v69 = v62;
              _os_log_impl(&dword_23E95B000, v60, OS_LOG_TYPE_INFO, "%{public}@Starting thread for fabricID %@ because it became the current fabric", (uint8_t *)&v66, 0x16u);

            }
            objc_autoreleasePoolPop(v58);
            -[HMMTRAccessoryServerBrowser threadRadioManager](v59, "threadRadioManager");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRAccessoryServerBrowser currentFabricID](v59, "currentFabricID");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "startThreadRadioForHomeWithFabricID:", v64);

          }
        }
        goto LABEL_40;
      }
      v51 = (void *)MEMORY[0x242656984]();
      v52 = v10;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser currentFabricID](v52, "currentFabricID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 138543618;
        v67 = v54;
        v68 = 2112;
        v69 = v65;
        _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_INFO, "%{public}@Not starting local discovery for fabricID %@, resident available", (uint8_t *)&v66, 0x16u);

        goto LABEL_38;
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x242656984]();
      v52 = v10;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 138543362;
        v67 = v54;
        _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_INFO, "%{public}@Fabric not provided and no active clients, not configuring any controller wrapper", (uint8_t *)&v66, 0xCu);
LABEL_38:

      }
    }

    objc_autoreleasePoolPop(v51);
  }
LABEL_40:

}

- (void)_setupStorageStateIfNotFabricID:(id)a3 rediscoverAccessories:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v8);

  if ((v7 & 1) == 0)
    -[HMMTRAccessoryServerBrowser _setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:](self, "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:", v8, v4);

}

- (void)addFabricWithActiveClientForFabricID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMMTRAccessoryServerBrowser_addFabricWithActiveClientForFabricID___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handlePairingForThreadAccessoryWithFabricID:(id)a3 nodeID:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMMTRAccessoryServerBrowser_handlePairingForThreadAccessoryWithFabricID_nodeID___block_invoke;
  block[3] = &unk_250F224F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_stopMatterStackWithReason:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v6, "currentFabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v8;
    v41 = 2112;
    v42 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the matter stack for FabricID = %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v6->_discoveredAccessoryServers;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "fabricID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser currentFabricID](v6, "currentFabricID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 == v18)
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v13);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v24, "disable", (_QWORD)v29);
        -[HMMTRAccessoryServerBrowser _invalidateAccessoryServer:reason:withCompletion:](v6, "_invalidateAccessoryServer:reason:withCompletion:", v24, v4, 0);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  -[HMMTRAccessoryServerBrowser currentFabricID](v6, "currentFabricID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser _suspendOperationsForFabricID:](v6, "_suspendOperationsForFabricID:", v25);

  if (!-[HMMTRAccessoryServerBrowser preventThreadStopDuringStackRestart](v6, "preventThreadStopDuringStackRestart"))
  {
    -[HMMTRAccessoryServerBrowser threadRadioManager](v6, "threadRadioManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v6, "currentFabricID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stopThreadRadioForHomeWithFabricID:", v27);

  }
  -[HMMTRAccessoryServerBrowser setPreventThreadStopDuringStackRestart:](v6, "setPreventThreadStopDuringStackRestart:", 0, (_QWORD)v29);
  -[HMMTRAccessoryServerBrowser currentHomeFabricDeviceControllerWrapper](v6, "currentHomeFabricDeviceControllerWrapper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shutdown");

  -[HMMTRAccessoryServerBrowser setCurrentFabricID:](v6, "setCurrentFabricID:", 0);
}

- (void)restartDiscovery
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__HMMTRAccessoryServerBrowser_restartDiscovery__block_invoke;
  v4[3] = &unk_250F223E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_restartDiscovery
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRAccessoryServerBrowser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser currentFabric](self, "currentFabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:](self, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", v3);

  if (!v4)
    return;
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser _connectPendingFabricConnectionsForFabricID:](self, "_connectPendingFabricConnectionsForFabricID:", v5);

  v6 = -[HMMTRAccessoryServerBrowser isSystemCommissionerMode](self, "isSystemCommissionerMode");
  -[HMMTRAccessoryServerBrowser threadRadioManager](self, "threadRadioManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startThreadRadioForSystemCommissionerFabricID:", v8);
  }
  else
  {
    -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hasMatterThreadAccessoryInHomeWithFabricID:", v9);

    if (!v10)
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser currentFabricID](v12, "currentFabricID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Not starting thread because fabric %@ has no thread accessories", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      goto LABEL_10;
    }
    -[HMMTRAccessoryServerBrowser threadRadioManager](self, "threadRadioManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startThreadRadioForHomeWithFabricID:", v8);
  }

LABEL_10:
  if (!-[HMMTRAccessoryServerBrowser isSystemCommissionerMode](self, "isSystemCommissionerMode"))
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser currentFabricID](v17, "currentFabricID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for fabric %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMMTRAccessoryServerBrowser storage](v17, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fabricDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "keyValueStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMMTRStorage matterItemsFromDictionary:](HMMTRStorage, "matterItemsFromDictionary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser setMatterStorageItems:](v17, "setMatterStorageItems:", v24);

    -[HMMTRAccessoryServerBrowser setupPairedDevices](v17, "setupPairedDevices");
    -[HMMTRAccessoryServerBrowser startDiscoveringAccessoryServers](v17, "startDiscoveringAccessoryServers");
  }
}

- (void)didFinishPairingAccessoryServer:(id)a3 operationDisabled:(BOOL)a4
{
  void *v6;
  _QWORD v7[5];

  -[HMMTRAccessoryServerBrowser disableUnrestrictedOperationsForAccessoryServer:](self, "disableUnrestrictedOperationsForAccessoryServer:", a3);
  -[HMMTRAccessoryServerBrowser resumeAllOperations](self, "resumeAllOperations");
  -[HMMTRAccessoryServerBrowser threadRadioManager](self, "threadRadioManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__HMMTRAccessoryServerBrowser_didFinishPairingAccessoryServer_operationDisabled___block_invoke;
  v7[3] = &unk_250F223C0;
  v7[4] = self;
  objc_msgSend(v6, "stopAccessoryPairingWithCompletion:", v7);

  if (!a4)
    -[HMMTRAccessoryServerBrowser restartDiscovery](self, "restartDiscovery");
}

- (void)_setupStorageStateForHomeFabricID:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRAccessoryServerBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMMTRAccessoryServerBrowser *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state for Home Fabric ID = %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    -[HMMTRAccessoryServerBrowser setCurrentFabricID:](v6, "setCurrentFabricID:", v4);
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v6, "setSystemCommissionerMode:", 0);
    v9 = -[HMMTRAccessoryServerBrowser isSystemCommissionerMode](v6, "isSystemCommissionerMode");
    -[HMMTRAccessoryServerBrowser storage](v6, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSystemCommissionerFabric:", v9);

    -[HMMTRAccessoryServerBrowser storage](v6, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareStorageForFabricID:", v4);

    -[HMMTRAccessoryServerBrowser deviceController](v6, "deviceController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)MEMORY[0x242656984]();
      v14 = v6;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser storage](v14, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fabricID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to start matter stack for fabric ID: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    -[HMMTRAccessoryServerBrowser setPreWarmedFabricID:](v6, "setPreWarmedFabricID:", 0);
    -[HMMTRAccessoryServerBrowser setBrowserState:](v6, "setBrowserState:", 1);
  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Storage state cannot be setup without fabric ID", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)_setupStorageStateAfterCertFetchForHomeFabricID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMMTRAccessoryServerBrowser *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v11;
    v27 = 2112;
    v28 = (uint64_t)v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state after cert fetch for Home Fabric ID = %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v6 || objc_msgSend(v6, "isEqual:", &unk_250F3F900))
  {
    v12 = (void *)MEMORY[0x24BDDB5B0];
    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootCertForCurrentFabric");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertX509Certificate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v15);
    objc_msgSend(v16, "issuer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fabricID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedLongLongValue");

    v20 = (void *)MEMORY[0x242656984]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v23;
      v27 = 2048;
      v28 = v19;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Using fabricID = %lld for pairing. Root Certificate %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
    v24 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v24;
  }
  -[HMMTRAccessoryServerBrowser _setupStorageStateForHomeFabricID:](v9, "_setupStorageStateForHomeFabricID:", v6);
  v7[2](v7, v6);

}

- (void)_setupAndPersistStorageStateForHomeFabricID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
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
  void *v24;
  uint64_t v25;
  void *v26;
  HMMTRAccessoryServerBrowser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMMTRAccessoryServerBrowser *v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v11;
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting up storage state to persist for Home Fabric ID = %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    -[HMMTRAccessoryServerBrowser setCurrentFabricID:](v9, "setCurrentFabricID:", v6);
    -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v9, "setSystemCommissionerMode:", 0);
    v12 = -[HMMTRAccessoryServerBrowser isSystemCommissionerMode](v9, "isSystemCommissionerMode");
    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSystemCommissionerFabric:", v12);

    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "prepareStorageForFabricID:forInitialSetup:", v6, 1);

    -[HMMTRAccessoryServerBrowser _currentHomeFabricDeviceControllerStartupParams](v9, "_currentHomeFabricDeviceControllerStartupParams");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser ownerSharedOperationalKeyPair](v9, "ownerSharedOperationalKeyPair");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serialize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMMTRAccessoryServerBrowser controllerFactory](v9, "controllerFactory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stackStorageWithStartupParams:operationalKeyPairTLV:", v15, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMMTRAccessoryServerBrowser storage](v9, "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "persistLegacyControllerNodeWithDictionary:", v19);

      -[HMMTRAccessoryServerBrowser storage](v9, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fabricDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keyValueStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMTRStorage matterItemsFromDictionary:](HMMTRStorage, "matterItemsFromDictionary:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser setMatterStorageItems:](v9, "setMatterStorageItems:", v24);

      v25 = 0;
    }
    else
    {
      v30 = (void *)MEMORY[0x242656984]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v33;
        _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize operational key pair for new fabric. Aborting pairing prep.", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 4, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v25;
    }
    v7[2](v7, v25);

  }
  else
  {
    v26 = (void *)MEMORY[0x242656984]();
    v27 = v9;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v29;
      _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Storage state cannot be setup without fabric ID", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }

}

- (void)_deleteOldPairings
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  HMMTRAccessoryServerBrowser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMMTRAccessoryServerBrowser *v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemCommissionerFabric");

  if ((v4 & 1) == 0)
  {
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fabricDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allNodeIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairedNodeIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x242656984]();
    v30 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v13;
        v39 = 2112;
        v40 = v9;
        v41 = 2112;
        v42 = v7;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Preparing for cleanup: comparing paired node IDs %@ vs all node IDs %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      if (v7)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v9;
        v14 = v9;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              if ((objc_msgSend(v7, "containsObject:", v19) & 1) == 0)
              {
                v20 = (void *)MEMORY[0x242656984]();
                v21 = v30;
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v38 = v23;
                  v39 = 2112;
                  v40 = v19;
                  _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Cleaning up unpaired server with nodeID:%@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v20);
                -[HMMTRAccessoryServerBrowser deviceController](v21, "deviceController");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v19, "unsignedLongLongValue");
                -[HAPAccessoryServerBrowser workQueue](v21, "workQueue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v31[0] = MEMORY[0x24BDAC760];
                v31[1] = 3221225472;
                v31[2] = __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke;
                v31[3] = &unk_250F21EF0;
                v31[4] = v21;
                v31[5] = v19;
                objc_msgSend(v24, "getBaseDevice:queue:completionHandler:", v25, v26, v31);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v16);
        }

        -[HMMTRAccessoryServerBrowser storage](v30, "storage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeAndSyncAllKeysNotIncludedInActiveNodeIDs:", v7);

        v9 = v29;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v28;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@No paired nodeIDs... Is this the first pairing?", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
}

- (void)prepareForPairingWithSetupPayload:(id)a3 fabric:(id)a4 fabricID:(id)a5 owner:(BOOL)a6 ownerCertFetchSupported:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMMTRAccessoryServerBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  HMMTRAccessoryServerBrowser *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  HMMTRAccessoryServerBrowser *v39;
  NSObject *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *context;
  _BOOL4 v45;
  _BOOL4 v46;
  _QWORD v47[5];
  id v48;
  id v49;
  BOOL v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v46 = a7;
  v9 = a6;
  v68 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v45 = v9;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v59 = v20;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v15;
    v64 = 2112;
    v65 = v21;
    v66 = 2112;
    v67 = v22;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Prepare pairing with setup payload: %@, fabric ID: %@, owner: %@, ownerCertFetchSupported: %@", buf, 0x34u);

    v9 = v45;
  }

  objc_autoreleasePoolPop(v17);
  v23 = !v9;
  -[HMMTRAccessoryServerBrowser storage](v18, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSharedAdmin:", v23);

  v25 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke;
  v54[3] = &unk_250F21F68;
  v54[4] = v18;
  v26 = v16;
  v57 = v26;
  v27 = v13;
  v55 = v27;
  v28 = v14;
  v56 = v28;
  v29 = (void *)MEMORY[0x242656B10](v54);
  if (-[HMMTRAccessoryServerBrowser _createOperationalKeyPairIfAbsent](v18, "_createOperationalKeyPairIfAbsent"))
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
    {
      v51[0] = v25;
      v51[1] = 3221225472;
      v51[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_281;
      v51[3] = &unk_250F228C0;
      v51[4] = v18;
      v53 = v29;
      v15 = v15;
      v52 = v15;
      objc_msgSend(v28, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 1, v23 | v46, v51);

      v30 = v53;
    }
    else
    {
      if (v15)
        v36 = 1;
      else
        v36 = v46;
      v37 = v36 | v23;
      if (!v36)
        v15 = 0;
      if (!(v36 | v23))
      {
        v38 = -[HMMTRAccessoryServerBrowser _getRandomFabricId](v18, "_getRandomFabricId");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v38);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        context = (void *)MEMORY[0x242656984]();
        v39 = v18;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v43;
          v60 = 2112;
          v61 = v15;
          _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
      }
      v41 = !v37;
      -[HMMTRAccessoryServerBrowser storage](v18, "storage", v43);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v25;
      v47[1] = 3221225472;
      v47[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_282;
      v47[3] = &unk_250F21FB8;
      v47[4] = v18;
      v49 = v29;
      v15 = v15;
      v48 = v15;
      v50 = v41;
      objc_msgSend(v42, "fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:", v15, v45, 1, v46, v47);

      v30 = v49;
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x242656984]();
    v32 = v18;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v34;
      _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Key pair creation failed. Cannot move on with pairing preparation.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v26 + 2))(v26, 0, 0, v35);

  }
}

- (void)_prepareForPairingWithSetupPayload:(id)a3 fabricID:(id)a4 controllerWrapper:(id)a5 hasPriorSuccessfulPairing:(BOOL)a6 category:(id)a7 completionHandler:(id)a8
{
  _BOOL4 v10;
  id v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMMTRAccessoryServerBrowser *v23;
  NSObject *v24;
  void *v25;
  char *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unsigned __int16 v34;
  unsigned __int16 v35;
  HMMTRAccessoryServerFactory *v36;
  void *v37;
  HMMTRAccessoryServerFactory *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMMTRAccessoryServerBrowser *v52;
  NSObject *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  id *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  HMMTRAccessoryServerBrowser *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  HMMTRAccessoryServerBrowser *v69;
  NSObject *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  id v74;
  HMMTRAccessoryServerFactory *v75;
  id v76;
  char *v77;
  id v78;
  _QWORD block[5];
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v10 = a6;
  v89 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (char *)a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v78 = v16;
    v22 = (void *)MEMORY[0x242656984](-[HMMTRAccessoryServerBrowser addFabricWithActiveClients:](self, "addFabricWithActiveClients:", v15));
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v23, "fabricsWithActiveClients");
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v82 = v25;
      v83 = 2112;
      v84 = v15;
      v85 = 2112;
      v86 = v26;
      _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Added active client for pairing into fabric ID %@, currently active clients: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v23, "systemCommissionerFabricID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = HMFEqualObjects();

    if ((v28 & 1) == 0)
      -[HMMTRAccessoryServerBrowser setSystemCommissionerMode:](v23, "setSystemCommissionerMode:", 0);
    v72 = v10;
    v74 = v18;
    v77 = v15;
    -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](v23, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[HMMTRAccessoryServerBrowser controllerFactory](v23, "controllerFactory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](v23, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "enableNormalOperationWithToken:", v31);

      -[HMMTRAccessoryServerBrowser setControllerFactoryEnablePerPrimaryResidentConfirmationToken:](v23, "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", 0);
    }
    -[HMMTRAccessoryServerBrowser _deleteOldPairings](v23, "_deleteOldPairings");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMMTRAccessoryServerBrowser _generateNodeID](v23, "_generateNodeID"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "discriminator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedShortValue");

    if (objc_msgSend(v14, "hasShortDiscriminator"))
      v35 = v34 << 8;
    else
      v35 = v34;
    v36 = [HMMTRAccessoryServerFactory alloc];
    -[HAPAccessoryServerBrowser keyStore](v23, "keyStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMMTRAccessoryServerFactory initWithKeystore:browser:](v36, "initWithKeystore:browser:", v37, v23);

    objc_msgSend(v14, "setupCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "vendorID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "productID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialNumber");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v38;
    v76 = v17;
    v73 = (void *)v32;
    -[HMMTRAccessoryServerFactory vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:](v38, "vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:", v32, v39, v40, v17, v41, v42, v43, CFSTR("1.0.0"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v44, "setHasPriorSuccessfulPairing:", v72);
      objc_msgSend(v44, "setDiscriminatorIsOriginatedFromShort:", objc_msgSend(v14, "hasShortDiscriminator"));
      objc_msgSend(v14, "setupPayloadString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setSetupPayloadString:", v45);

      objc_msgSend(v44, "setControllerWrapper:", v78);
      -[HMMTRAccessoryServerBrowser pairingWindowInfoTable](v23, "pairingWindowInfoTable");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setupPayloadString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "retrieveAccessoryServerForPairingWindowWithSetupPayload:currentDate:", v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v74;
      if (v49)
      {
        if (objc_msgSend(v49, "isWEDDevice"))
        {
          objc_msgSend(v44, "setWedDevice:", 1);
          objc_msgSend(v49, "eMACAddress");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setEMACAddress:", v50);

        }
        v51 = (void *)MEMORY[0x242656984](objc_msgSend(v44, "setLinkLayerType:", objc_msgSend(v49, "linkLayerType")));
        v52 = v23;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "isWEDDevice"))
            v55 = " WED";
          else
            v55 = "";
          v56 = objc_msgSend(v44, "linkLayerType");
          v57 = "non-Thread";
          *(_DWORD *)buf = 138544130;
          v82 = v54;
          v83 = 2080;
          if (v56 == 4)
            v57 = "Thread";
          v84 = v55;
          v85 = 2080;
          v86 = v57;
          v87 = 2112;
          v88 = v44;
          _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_INFO, "%{public}@Pairing with%s %s accessory %@ via locally opened pairing window", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v51);
      }
      v58 = (void *)MEMORY[0x242656984]();
      v59 = v23;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v61;
        v83 = 2112;
        v84 = (const char *)v44;
        _os_log_impl(&dword_23E95B000, v60, OS_LOG_TYPE_INFO, "%{public}@Ready to pair with Accessory %@.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v58);
      objc_msgSend(v59[16], "addObject:", v44);
      (*((void (**)(id, _QWORD, void *, _QWORD))v74 + 2))(v74, 0, v44, 0);
      if (objc_msgSend(v59, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
      {
        objc_msgSend(v59, "delegateQueue");
        v62 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __146__HMMTRAccessoryServerBrowser__prepareForPairingWithSetupPayload_fabricID_controllerWrapper_hasPriorSuccessfulPairing_category_completionHandler___block_invoke;
        block[3] = &unk_250F22458;
        block[4] = v59;
        v80 = v44;
        dispatch_async(v62, block);

      }
    }
    else
    {
      v68 = (void *)MEMORY[0x242656984]();
      v69 = v23;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      v18 = v74;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v82 = v71;
        _os_log_impl(&dword_23E95B000, v70, OS_LOG_TYPE_ERROR, "%{public}@Unable to create server...pairing won't work.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v68);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v74 + 2))(v74, 0, 0, v49);
    }
    v15 = v77;
    v16 = v78;
    v67 = v73;

    v17 = v76;
  }
  else
  {
    v63 = (void *)MEMORY[0x242656984]();
    v64 = self;
    HMFGetOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v66;
      _os_log_impl(&dword_23E95B000, v65, OS_LOG_TYPE_ERROR, "%{public}@CHIP Storage has not been initialized...pairing won't work", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v63);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, v67);
  }

}

- (void)finishSystemCommissionerFabricCommissioningWithFabricID:(id)a3 rootCACert:(id)a4 ipk:(id)a5 controllerNodeID:(id)a6 commissioneeNodeID:(id)a7 queue:(id)a8 completion:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a7;
  v14 = a8;
  v15 = a9;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke;
  block[3] = &unk_250F23378;
  block[4] = self;
  v22 = v12;
  v24 = v13;
  v25 = v15;
  v23 = v14;
  v17 = v13;
  v18 = v15;
  v19 = v14;
  v20 = v12;
  dispatch_async(v16, block);

}

- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[HMMTRAccessoryServerBrowser systemCommissionerPairingManager](self, "systemCommissionerPairingManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:vendorID:productID:serialNumber:setupPayload:", v16, v15, v14, v13, v12);

}

- (void)_reportAccessoriesKnownToSystemCommissioner
{
  void *v3;
  HMMTRAccessoryServerBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Reporting accessories known to System Commissioner", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAccessoryServerBrowser systemCommissionerPairingManager](v4, "systemCommissionerPairingManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke;
  v8[3] = &unk_250F23198;
  v8[4] = v4;
  objc_msgSend(v7, "fetchSystemCommissionerPairingsWithCompletionHandler:", v8);

}

- (void)fetchCertificatesForMatterNodeWithCommissionerNodeID:(id)a3 commissioneeNodeID:(id)a4 forOwner:(BOOL)a5 publicKey:(id)a6 fabricID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke;
  block[3] = &unk_250F220A8;
  block[4] = self;
  v26 = v15;
  v31 = a5;
  v27 = v16;
  v28 = v17;
  v29 = v14;
  v30 = v18;
  v20 = v14;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v18;
  dispatch_async(v19, block);

}

- (void)fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID:(id)a3 forOwner:(BOOL)a4 publicKey:(id)a5 fabricID:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  HMMTRAccessoryServerBrowser *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMMTRAccessoryServerBrowser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMTRAccessoryServerBrowser *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  id v45;
  const char *v46;
  BOOL v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v10 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v10)
    v16 = "Owner";
  else
    v16 = "Shared Admin";
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v20)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v21;
      v50 = 2080;
      v51 = (uint64_t)v16;
      v52 = 2112;
      v53 = v12;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational Certificate for Node ID %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    if (v20)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v22;
      v50 = 2080;
      v51 = (uint64_t)v16;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational certificate for itself", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (!v14 || objc_msgSend(v14, "isEqualToNumber:", &unk_250F3F900))
    {
      -[HMMTRAccessoryServerBrowser storage](v18, "storage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fabricID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[HMMTRAccessoryServerBrowser storage](v18, "storage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fabricID");
        v26 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = (void *)MEMORY[0x242656984]();
        v28 = v18;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v30;
          _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@This resident is not configured for any fabric as fabricID is nil", buf, 0xCu);

          v27 = v40;
        }

        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMMTRAccessoryServerBrowser _getRandomFabricId](v28, "_getRandomFabricId"));
        v26 = objc_claimAutoreleasedReturnValue();

        v31 = (void *)MEMORY[0x242656984]();
        v32 = v28;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v34;
          v50 = 2112;
          v51 = v26;
          _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", buf, 0x16u);

          v31 = v40;
        }

        objc_autoreleasePoolPop(v31);
      }
      v14 = (id)v26;
    }
  }
  -[HAPAccessoryServerBrowser workQueue](v18, "workQueue", v40);
  v35 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __138__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke;
  block[3] = &unk_250F220D0;
  block[4] = v18;
  v42 = v14;
  v43 = v12;
  v44 = v13;
  v47 = v10;
  v45 = v15;
  v46 = v16;
  v36 = v15;
  v37 = v13;
  v38 = v12;
  v39 = v14;
  dispatch_async(v35, block);

}

- (void)fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey:(id)a3 rootCertificate:(id)a4 completionHandler:(id)a5
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
  HMMTRAccessoryServerBrowser *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)notifyPairingCompletionForAccessoryServer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServerBrowser:didFinishPairingForAccessoryServer:", self, v4);

}

- (void)handlePairingCompletionForAccessoryWithNodeID:(id)a3 fabricID:(id)a4 vendorID:(id)a5 productID:(id)a6 configNumber:(id)a7 category:(id)a8 topology:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMMTRAccessoryServerBrowser *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  HMMTRAccessoryServerBrowser *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMMTRAccessoryServerBrowser *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  _QWORD block[5];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v57 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v55 = a9;
  v20 = (void *)MEMORY[0x242656984]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v67 = v23;
    v68 = 2112;
    v69 = v15;
    v70 = 2112;
    v71 = v16;
    v72 = 2112;
    v73 = v57;
    v74 = 2112;
    v75 = v17;
    v76 = 2112;
    v77 = v18;
    v78 = 2112;
    v79 = v19;
    _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Handling pairing completion for Accessory with Node ID %@, Fabric ID %@, Vendor ID %@, Product ID %@, Config Number %@, Category %@", buf, 0x48u);

  }
  v56 = v18;
  v24 = v17;

  objc_autoreleasePoolPop(v20);
  -[HMMTRAccessoryServerBrowser storage](v21, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fabricID");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {

    goto LABEL_7;
  }
  v27 = (void *)v26;
  -[HMMTRAccessoryServerBrowser storage](v21, "storage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fabricID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqual:", &unk_250F3F900);

  if (v30)
  {
LABEL_7:
    -[HMMTRAccessoryServerBrowser storage](v21, "storage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "prepareStorageForFabricID:", v16);

  }
  -[HMMTRAccessoryServerBrowser storage](v21, "storage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "fabricID");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[HMMTRAccessoryServerBrowser storage](v21, "storage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fabricID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = HMFEqualObjects();

    v38 = v24;
    if ((v37 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x242656984]();
      v40 = v21;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser storage](v40, "storage");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "fabricID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v42;
        v68 = 2112;
        v69 = v44;
        v70 = 2112;
        v71 = v16;
        _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Current Matter stack is running for fabric Index %@ and therefore request to handle pairing on fabric ID %@ cannot be processed", buf, 0x20u);

        v38 = v24;
      }

      objc_autoreleasePoolPop(v39);
      v46 = v56;
      v45 = v57;
      v47 = v55;
      goto LABEL_17;
    }
  }
  else
  {

    v38 = v24;
  }
  -[HMMTRAccessoryServerBrowser nodesWithPendingACLOverwrite](v21, "nodesWithPendingACLOverwrite");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v15);

  v49 = (void *)MEMORY[0x242656984]();
  v50 = v21;
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v52;
    _os_log_impl(&dword_23E95B000, v51, OS_LOG_TYPE_INFO, "%{public}@Updating storage with information for newly paired accessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v49);
  -[HMMTRAccessoryServerBrowser storage](v50, "storage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "workQueue");
  v54 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __136__HMMTRAccessoryServerBrowser_handlePairingCompletionForAccessoryWithNodeID_fabricID_vendorID_productID_configNumber_category_topology___block_invoke;
  block[3] = &unk_250F22120;
  block[4] = v50;
  v59 = v15;
  v45 = v57;
  v60 = v57;
  v61 = v16;
  v62 = v38;
  v63 = v19;
  v46 = v56;
  v64 = v56;
  v47 = v55;
  v65 = v55;
  dispatch_async(v54, block);

LABEL_17:
}

- (id)accessoryServerWithNodeID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_discoveredAccessoryServers;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "nodeID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToNumber:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_serverFromMTSDevicePairing:(id)a3
{
  id v4;
  HMMTRAccessoryServerFactory *v5;
  void *v6;
  HMMTRAccessoryServerFactory *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  HMMTRAccessoryServerFactory *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [HMMTRAccessoryServerFactory alloc];
  -[HAPAccessoryServerBrowser keyStore](self, "keyStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRAccessoryServerFactory initWithKeystore:browser:](v5, "initWithKeystore:browser:", v6, self);

  objc_msgSend(v4, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)v9;
  else
    v10 = &unk_250F40698;
  objc_msgSend(v4, "nodeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  -[HMMTRAccessoryServerFactory vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:](v7, "vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:", v11, 0, 0, v12, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fabricDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storageDataSourceForDeviceWithNodeID:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __59__HMMTRAccessoryServerBrowser__serverFromMTSDevicePairing___block_invoke;
  v35[3] = &unk_250F23E18;
  v35[4] = self;
  v23 = v4;
  v36 = v23;
  objc_msgSend(v20, "updateVendorID:productID:completion:", v21, v22, v35);

  objc_msgSend(v16, "setPairedState:", 3);
  objc_msgSend(v16, "setKnownToSystemCommissioner:", 1);
  -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFabricID:", v24);

  objc_msgSend(v23, "uuid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCommissioningID:", v25);

  -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](self, "systemCommissionerControllerWrapper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setControllerWrapper:", v26);

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "nodeID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWedDevice:", objc_msgSend(v27, "wedSupportedForSystemCommissionerFabricNode:", v28));

    -[HMMTRAccessoryServerBrowser storage](self, "storage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "nodeID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "extendedMACAddressForSystemCommissionerFabricNode:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEMACAddress:", v31);

  }
  -[HMMTRAccessoryServerBrowser discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v16);

  return v16;
}

- (id)_getSystemCommissionerFabricRootCertificateWithIndex:(id)a3 ipk:(id *)a4 controllerNodeID:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  HMMTRAccessoryServerBrowser *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  HMMTRAccessoryServerBrowser *v23;
  NSObject *v24;
  void *v25;
  id v26;
  HMMTRAccessoryServerBrowser *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMMTRAccessoryServerBrowser *v50;
  NSObject *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  HMMTRAccessoryServerBrowser *v57;
  NSObject *v58;
  void *v59;
  int v60;
  void *v61;
  HMMTRAccessoryServerBrowser *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  HMMTRAccessoryServerBrowser *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  HMMTRAccessoryServerBrowser *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  HMMTRAccessoryServerBrowser *v80;
  NSObject *v81;
  void *v82;
  int v83;
  id v84;
  void *v85;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  _BYTE v102[14];
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDDB880]);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "storedValueForKey:", CFSTR("IPK"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v13, 0));
      *a4 = v14;

      if (*a4)
      {
        v15 = (void *)MEMORY[0x242656984]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v100 = v18;
          v19 = "%{public}@IPK retrieved from MatterSupport storage";
          v20 = v17;
          v21 = OS_LOG_TYPE_DEBUG;
LABEL_15:
          _os_log_impl(&dword_23E95B000, v20, v21, v19, buf, 0xCu);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else
    {
      *a4 = 0;
    }
    v15 = (void *)MEMORY[0x242656984]();
    v27 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v18;
      v19 = "%{public}@No IPK in MatterSupport storage";
      v20 = v17;
      v21 = OS_LOG_TYPE_INFO;
      goto LABEL_15;
    }
LABEL_16:

    objc_autoreleasePoolPop(v15);
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("f/%x/r"), objc_msgSend(v8, "unsignedIntValue"));
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("f/%x/n"), objc_msgSend(v8, "unsignedIntValue"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (void *)v28;
      objc_msgSend(v10, "storedValueForKey:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32
        && (v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v32, 0)) != 0)
      {
        v34 = (void *)v33;
        v93 = a5;
        v97 = v29;
        objc_msgSend(MEMORY[0x24BDDB5B0], "convertMatterCertificate:", v33);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDDB5B0];
        -[HMMTRAccessoryServerBrowser systemCommissionerNocSigner](self, "systemCommissionerNocSigner");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)v35;
        LOBYTE(v36) = objc_msgSend(v36, "keypair:matchesCertificate:", v37, v35);

        if ((v36 & 1) != 0)
        {
          objc_msgSend(v10, "storedValueForKey:", v97);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v39 = v38;
          else
            v39 = 0;
          v40 = v39;

          if (v40
            && (v41 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v40, 0)) != 0)
          {
            v42 = (void *)v41;
            v89 = v34;
            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v41);
            objc_msgSend(v43, "subject");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "fabricID");
            v45 = objc_claimAutoreleasedReturnValue();

            -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = (void *)v45;
            LOBYTE(v45) = objc_msgSend((id)v45, "isEqual:", v46);

            v87 = v43;
            v88 = v42;
            if ((v45 & 1) != 0)
            {
              v91 = v40;
              objc_msgSend(v43, "subject");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "nodeID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v49 = (void *)MEMORY[0x242656984]();
              v50 = self;
              HMFGetOSLogHandle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v8, "unsignedIntValue");
                *(_DWORD *)buf = 138544130;
                v100 = v52;
                v101 = 2112;
                *(_QWORD *)v102 = v90;
                *(_WORD *)&v102[8] = 1024;
                *(_DWORD *)&v102[10] = v53;
                v103 = 2112;
                v104 = v48;
                _os_log_impl(&dword_23E95B000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Retrieved root cert for fabric ID %@ with fabric index 0x%x. Controller node ID is %@.", buf, 0x26u);

              }
              objc_autoreleasePoolPop(v49);
              v54 = objc_retainAutorelease(v48);
              v55 = v96;
              *v93 = v54;
              v26 = v96;

              v34 = v89;
              v40 = v91;
            }
            else
            {
              v79 = (void *)MEMORY[0x242656984]();
              v80 = self;
              HMFGetOSLogHandle();
              v81 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = objc_msgSend(v8, "unsignedIntValue");
                -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](v80, "systemCommissionerFabricID");
                v95 = v79;
                v84 = v40;
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v100 = v82;
                v101 = 1024;
                *(_DWORD *)v102 = v83;
                *(_WORD *)&v102[4] = 2112;
                *(_QWORD *)&v102[6] = v90;
                v103 = 2112;
                v104 = v85;
                _os_log_impl(&dword_23E95B000, v81, OS_LOG_TYPE_DEBUG, "%{public}@f/%x/n fabric ID %@ doesn't match system commissioner fabric ID %@", buf, 0x26u);

                v40 = v84;
                v79 = v95;

              }
              objc_autoreleasePoolPop(v79);
              v26 = 0;
              v34 = v89;
              v55 = v96;
            }

            v29 = v97;
          }
          else
          {
            v92 = v40;
            v72 = (void *)MEMORY[0x242656984]();
            v73 = self;
            HMFGetOSLogHandle();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = v34;
              v77 = objc_msgSend(v8, "unsignedIntValue");
              v78 = objc_msgSend(v8, "unsignedIntValue");
              *(_DWORD *)buf = 138543874;
              v100 = v75;
              v101 = 1024;
              *(_DWORD *)v102 = v77;
              v34 = v76;
              *(_WORD *)&v102[4] = 1024;
              *(_DWORD *)&v102[6] = v78;
              _os_log_impl(&dword_23E95B000, v74, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't have matching f/%x/n", buf, 0x18u);

            }
            objc_autoreleasePoolPop(v72);
            v26 = 0;
            v55 = v96;
            v29 = v97;
            v40 = v92;
          }

        }
        else
        {
          v65 = (void *)MEMORY[0x242656984]();
          v66 = self;
          HMFGetOSLogHandle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v65;
            v69 = v34;
            v70 = objc_msgSend(v8, "unsignedIntValue");
            -[HMMTRAccessoryServerBrowser systemCommissionerNocSigner](v66, "systemCommissionerNocSigner");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v100 = v68;
            v101 = 1024;
            *(_DWORD *)v102 = v70;
            v34 = v69;
            v65 = v94;
            *(_WORD *)&v102[4] = 2112;
            *(_QWORD *)&v102[6] = v71;
            _os_log_impl(&dword_23E95B000, v67, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r doesn't match system commissioner keypair %@", buf, 0x1Cu);

          }
          objc_autoreleasePoolPop(v65);
          v26 = 0;
          v55 = v96;
          v29 = v97;
        }

      }
      else
      {
        v56 = (void *)MEMORY[0x242656984]();
        v57 = self;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v8, "unsignedIntValue");
          *(_DWORD *)buf = 138543618;
          v100 = v59;
          v101 = 1024;
          *(_DWORD *)v102 = v60;
          _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_ERROR, "%{public}@f/%x/r isn't base64 encoded", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v56);
        v26 = 0;
      }

    }
    else
    {
      v61 = (void *)MEMORY[0x242656984]();
      v62 = self;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v100 = v64;
        _os_log_impl(&dword_23E95B000, v63, OS_LOG_TYPE_DEBUG, "%{public}@Not fetching root cert since fabric index is unknown", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v61);
      v26 = 0;
    }

    goto LABEL_52;
  }
  v22 = (void *)MEMORY[0x242656984]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v100 = v25;
    _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Couldn't access MatterSupport key store", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v26 = 0;
LABEL_52:

  return v26;
}

- (void)fetchSystemCommissionerRootCertificateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__HMMTRAccessoryServerBrowser_fetchSystemCommissionerRootCertificateWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)createNewSystemCommissionerFabricNodeIDWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __85__HMMTRAccessoryServerBrowser_createNewSystemCommissionerFabricNodeIDWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)createSystemCommissionerFabricNOCWithSigningCertificate:(id)a3 operationalPublicKey:(__SecKey *)a4 fabricID:(id)a5 nodeID:(id)a6 caseAuthenticatedTags:(id)a7 error:(id *)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = (void *)MEMORY[0x24BDDB5B0];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[HMMTRAccessoryServerBrowser systemCommissionerNocSigner](self, "systemCommissionerNocSigner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v19, v18, a4, v17, v16, v15, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_notifyDelegateOfPairingStep:(unint64_t)a3
{
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMMTRAccessoryPairingStepAsString(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying matter petric pairing step %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRAccessoryServerBrowser delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_256DFDA38))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "notifyMatterAccessoryPairingStep:", a3);
}

- (void)storageDidBecomeAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRAccessoryServerBrowser *v17;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  HMMTRAccessoryServerBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v41;
      v42 = "%{public}@Updated storage doesn't contain fabric ID; ignoring the update";
LABEL_26:
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, v42, buf, 0xCu);

    }
LABEL_27:

    objc_autoreleasePoolPop(v8);
    goto LABEL_28;
  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fabricDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v41;
      v42 = "%{public}@CHIP Storage updated for other fabric; ignoring";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](v9, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fabricDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyValueStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v12;
    v50 = 2112;
    v51 = v15;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage is available. Currently contains %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v16 = (void *)MEMORY[0x242656984]();
  v17 = v9;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](v17, "storage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pairedNodeIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v19;
    v50 = 2112;
    v51 = v21;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](v17, "isCurrentDevicePrimaryResident")
    || -[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](v17, "isCurrentDeviceMobileAndAllowedAccessoryControl"))
  {
    objc_msgSend(v4, "fabricID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser _setupStorageStateForHomeFabricID:](v17, "_setupStorageStateForHomeFabricID:", v22);

    -[HMMTRAccessoryServerBrowser storage](v17, "storage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fabricDataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "keyValueStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMMTRStorage matterItemsFromDictionary:](HMMTRStorage, "matterItemsFromDictionary:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser setMatterStorageItems:](v17, "setMatterStorageItems:", v26);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMMTRAccessoryServerBrowser storage](v17, "storage", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fabricDataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allNodeIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (v34 && (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "isEqual:", &unk_250F3F900) & 1) == 0)
          {
            -[HMMTRAccessoryServerBrowser nodesAddedToHome](v17, "nodesAddedToHome");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v34);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v31);
    }

    v36 = (void *)MEMORY[0x242656984]();
    v37 = v17;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser nodesAddedToHome](v37, "nodesAddedToHome");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v39;
      v50 = 2112;
      v51 = v40;
      _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@All nodes to add when storage became available: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    -[HMMTRAccessoryServerBrowser setupPairedDevices](v37, "setupPairedDevices");
    -[HMMTRAccessoryServerBrowser startDiscoveringAccessoryServers](v37, "startDiscoveringAccessoryServers");
  }
  else
  {
    -[HMMTRAccessoryServerBrowser _cleanupStagedServers](v17, "_cleanupStagedServers");
  }
LABEL_28:

}

- (void)_disconnectFromIdleFabric:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMMTRAccessoryServerBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v12) & 1) != 0)
    {
      -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](self, "fabricsWithActiveClients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v6);

      if ((v14 & 1) == 0)
      {
        -[HMMTRAccessoryServerBrowser _stopSystemCommissionerFabricID:reason:](self, "_stopSystemCommissionerFabricID:reason:", v6, v7);
        goto LABEL_16;
      }
    }
    else
    {

    }
    v18 = (void *)MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser currentFabricID](v19, "currentFabricID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v19, "fabricsWithActiveClients");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v21;
      v35 = 2112;
      v36 = v6;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Fabric %@ has become idle, but current FabricID is %@, not stopping current matter stack. fabrics with active clients:%@", (uint8_t *)&v33, 0x2Au);
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](self, "fabricsWithActiveClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsObject:", v11))
  {

    goto LABEL_8;
  }
  -[HMMTRAccessoryServerBrowser fabricsWithActiveSecondaryClients](self, "fabricsWithActiveSecondaryClients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if ((v17 & 1) != 0)
  {
LABEL_8:
    v18 = (void *)MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser currentFabricID](v19, "currentFabricID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v19, "fabricsWithActiveClients");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser fabricsWithActiveSecondaryClients](v19, "fabricsWithActiveSecondaryClients");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v23;
      v39 = 2112;
      v40 = v24;
      v25 = "%{public}@Connection has become idle but there are still active clients, keeping matter stack active for fab"
            "ricID %@. Fabrics with active clients: %@, secondary clients: %@";
LABEL_10:
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, 0x2Au);

LABEL_14:
    }
LABEL_15:

    objc_autoreleasePoolPop(v18);
    goto LABEL_16;
  }
  -[HMMTRAccessoryServerBrowser threadSoftwareUpdateController](self, "threadSoftwareUpdateController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isFirmwareUpdateInProgressForFabricID:", v27);

  v18 = (void *)MEMORY[0x242656984]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (!v29)
      goto LABEL_15;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v19, "currentFabricID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v19, "fabricsWithActiveClients");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveSecondaryClients](v19, "fabricsWithActiveSecondaryClients");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138544130;
    v34 = v21;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    v25 = "%{public}@Connection has become idle, but FW update is active, keeping matter stack active for fabricID %@. Fa"
          "brics with active clients: %@, secondary clients: %@";
    goto LABEL_10;
  }
  if (v29)
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser currentFabricID](v19, "currentFabricID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v19, "fabricsWithActiveClients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543874;
    v34 = v30;
    v35 = 2112;
    v36 = v31;
    v37 = 2112;
    v38 = v32;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Connection has become idle, shutting down matter stack for fabricID %@. Fabrics with active clients: %@", (uint8_t *)&v33, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMMTRAccessoryServerBrowser _stopMatterStackWithReason:](v19, "_stopMatterStackWithReason:", v7);
LABEL_16:

}

- (void)_stopSystemCommissionerFabricID:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping operation with system commissioner fabric ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v9->_discoveredAccessoryServers;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "fabricID");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        if (v19 == v6)
          objc_msgSend(v12, "addObject:", v18);
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v15);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v12;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v25, "disable", (_QWORD)v27);
        -[HMMTRAccessoryServerBrowser _invalidateAccessoryServer:reason:withCompletion:](v9, "_invalidateAccessoryServer:reason:withCompletion:", v25, v7, 0);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v22);
  }

  -[HMMTRAccessoryServerBrowser _suspendOperationsForFabricID:](v9, "_suspendOperationsForFabricID:", v6);
  -[HMMTRAccessoryServerBrowser threadRadioManager](v9, "threadRadioManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stopThreadRadioForSystemCommissionerFabricID:", v6);

}

- (void)storageDidUpdateData:(id)a3 isLocalChange:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRAccessoryServerBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRAccessoryServerBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  HMMTRAccessoryServerBrowser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMMTRAccessoryServerBrowser *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  HMMTRAccessoryServerBrowser *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  dispatch_time_t v57;
  NSObject *v58;
  void *v59;
  void *context;
  _BOOL4 v61;
  _QWORD block[4];
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v61 = a4;
  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v32 = (void *)MEMORY[0x242656984]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v35;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@Updated storage doesn't contain fabric ID; ignoring the update",
        buf,
        0xCu);

    }
    goto LABEL_23;
  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fabricDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v32 = (void *)MEMORY[0x242656984]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v36;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated for other fabric; ignoring the update",
        buf,
        0xCu);

    }
LABEL_23:

    objc_autoreleasePoolPop(v32);
    goto LABEL_45;
  }
  if (!v61)
  {
    context = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fabricID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser storage](v9, "storage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fabricDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyValueStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v59;
      v72 = 2112;
      v73 = v11;
      v74 = 2112;
      v75 = v16;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated for fabric ID = %@. Currently contains %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);
  }
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](v18, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pairedNodeIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v71 = v20;
    v72 = 2112;
    v73 = v22;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Currently paired nodes %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[HMMTRAccessoryServerBrowser storage](v18, "storage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fabricDataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allNodeIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v66 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if (v29 && (objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "isEqual:", &unk_250F3F900) & 1) == 0)
        {
          -[HMMTRAccessoryServerBrowser accessoryServerWithNodeID:](v18, "accessoryServerWithNodeID:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v37 = (void *)MEMORY[0x242656984]();
            v38 = v18;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v40;
              v72 = 2112;
              v73 = v29;
              _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Storage has a node that is not yet discovered: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v37);
            v31 = 1;
            goto LABEL_30;
          }

        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v26)
        continue;
      break;
    }
  }
  v31 = 0;
LABEL_30:

  if ((-[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](v18, "isCurrentDevicePrimaryResident")
     || -[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndAllowedAccessoryControl](v18, "isCurrentDeviceMobileAndAllowedAccessoryControl"))&& (((v31 | !v61) & 1) != 0 || objc_msgSend(v5, "caseAuthenticatedTagsUpdated")))
  {
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
      && objc_msgSend(v5, "caseAuthenticatedTagsUpdated"))
    {
      -[HMMTRAccessoryServerBrowser setPendingMatterStackRestart:](v18, "setPendingMatterStackRestart:", 1);
      objc_msgSend(v5, "setCaseAuthenticatedTagsUpdated:", 0);
    }
    -[HMMTRAccessoryServerBrowser matterStorageItems](v18, "matterStorageItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser storage](v18, "storage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fabricDataSource");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "keyValueStore");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMTRStorage matterItemsFromDictionary:](HMMTRStorage, "matterItemsFromDictionary:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser setMatterStorageItems:](v18, "setMatterStorageItems:", v45);

    v46 = -[HMMTRAccessoryServerBrowser pendingMatterStackRestart](v18, "pendingMatterStackRestart")
       || +[HMMTRStorage didUpdateMatterItems:oldStorage:](HMMTRStorage, "didUpdateMatterItems:oldStorage:", v44, v41);
    -[HMMTRAccessoryServerBrowser setPendingMatterStackRestart:](v18, "setPendingMatterStackRestart:", v46);
    -[HMMTRAccessoryServerBrowser setRestartCount:](v18, "setRestartCount:", -[HMMTRAccessoryServerBrowser restartCount](v18, "restartCount") + 1);
    objc_initWeak((id *)buf, v18);
    v57 = dispatch_time(0, 500000000);
    -[HAPAccessoryServerBrowser workQueue](v18, "workQueue");
    v58 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke;
    block[3] = &unk_250F21B98;
    objc_copyWeak(&v64, (id *)buf);
    v63 = v5;
    dispatch_after(v57, v58, block);

    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v47 = (void *)MEMORY[0x242656984]();
    v48 = v18;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser isCurrentDevicePrimaryResident](v48, "isCurrentDevicePrimaryResident");
      HMFBooleanToString();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v71 = v50;
      v72 = 2112;
      v73 = v51;
      v74 = 2112;
      v75 = v52;
      _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, "%{public}@Partially handling data storage update as isPrimaryResident = %@, isLocalChange = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v47);
    -[HMMTRAccessoryServerBrowser storage](v48, "storage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "fabricDataSource");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "keyValueStore");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMMTRStorage matterItemsFromDictionary:](HMMTRStorage, "matterItemsFromDictionary:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser setMatterStorageItems:](v48, "setMatterStorageItems:", v56);

    if (!v61)
      -[HMMTRAccessoryServerBrowser _updateLocallyDiscoveredServerPairedStates](v48, "_updateLocallyDiscoveredServerPairedStates");
  }
LABEL_45:

}

- (void)handleDeviceNoLongerPrimaryResidentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__HMMTRAccessoryServerBrowser_handleDeviceNoLongerPrimaryResidentWithCompletion___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HMMTRAccessoryServerBrowser invalidateAllDiscoveredServersWithReason:completion:](self, "invalidateAllDiscoveredServersWithReason:completion:", v5, v7);

}

- (void)handlePrimaryResidentDataReady
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__HMMTRAccessoryServerBrowser_handlePrimaryResidentDataReady__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isCurrentDevicePrimaryResident
{
  return 0;
}

- (BOOL)isCurrentDeviceMobileAndAllowedAccessoryControl
{
  HMMTRAccessoryServerBrowser *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[HMMTRAccessoryServerBrowser currentFabric](self, "currentFabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMMTRAccessoryServerBrowser currentFabricID](v2, "currentFabricID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v2) = 0;
    if (v4 && v3)
    {
      objc_msgSend(v3, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = objc_msgSend(v5, "isPrimaryResidentNodeReachable") ^ 1;

    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }

  return (char)v2;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  LOBYTE(v5) = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isPrimaryResidentNodeReachableAndThreadCapable") ^ 1;

  }
  return v5;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:(id)a3
{
  BOOL result;

  result = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  if (!a3)
    return 0;
  return result;
}

- (BOOL)isCurrentDeviceAllowedAccessoryControlDespiteReachableResident
{
  HMMTRAccessoryServerBrowser *v2;
  void *v3;

  v2 = self;
  -[HMMTRAccessoryServerBrowser currentFabric](self, "currentFabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:](v2, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", v3);

  return (char)v2;
}

- (BOOL)isCurrentDeviceMobileAndResidentReachable
{
  void *v2;
  void *v3;
  char v4;

  -[HMMTRAccessoryServerBrowser currentFabric](self, "currentFabric");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPrimaryResidentNodeReachable");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentDeviceMobileAndResidentReachableAndThreadCapableForFabric:(id)a3
{
  id v3;
  int v4;
  char v5;
  void *v6;

  v3 = a3;
  v4 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
  v5 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isPrimaryResidentNodeReachableAndThreadCapable");

  }
  return v5;
}

- (BOOL)canEstablishConnectionForNodeID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  HMMTRAccessoryServerBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    goto LABEL_7;
  -[HMMTRAccessoryServerBrowser threadRadioManager](self, "threadRadioManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceSupportsThreadService");

  if (!v6
    || !-[HMMTRAccessoryServerBrowser isCurrentDeviceAllowedAccessoryControlDespiteReachableResident](self, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResident"))
  {
    goto LABEL_7;
  }
  -[HMMTRAccessoryServerBrowser accessoryServerWithNodeID:](self, "accessoryServerWithNodeID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7 != 0;
  if (!v7)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for canEstablishConnectionForNodeID:%@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    goto LABEL_12;
  }
  if ((objc_msgSend(v7, "linkLayerType") & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
LABEL_12:

    goto LABEL_8;
  }

LABEL_7:
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)isOwnerForHomeWithFabric:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentUserOwner");

  return v4;
}

- (void)updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke;
  v7[3] = &unk_250F22458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateACLOnPairedAccessories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMMTRAccessoryServerBrowser discoveredAccessoryServers](self, "discoveredAccessoryServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "removalInProgress") & 1) == 0)
        {
          v11[0] = v8;
          v11[1] = 3221225472;
          v11[2] = __60__HMMTRAccessoryServerBrowser__updateACLOnPairedAccessories__block_invoke;
          v11[3] = &unk_250F23E18;
          v11[4] = self;
          v11[5] = v10;
          -[HMMTRAccessoryServerBrowser _updateAccessoryControlListForServer:completion:](self, "_updateAccessoryControlListForServer:completion:", v10, v11);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)getNOCFromResidentForSharedUserForFabric:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMMTRAccessoryServerBrowser *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRAccessoryServerBrowser isOwnerForHomeWithFabric:](self, "isOwnerForHomeWithFabric:", v4))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (!-[HMMTRAccessoryServerBrowser isCurrentDeviceMobileAndResidentReachable](self, "isCurrentDeviceMobileAndResidentReachable"))
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident is not yet reachable to get NOC", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__HMMTRAccessoryServerBrowser_getNOCFromResidentForSharedUserForFabric___block_invoke;
    v13[3] = &unk_250F223C0;
    v13[4] = self;
    objc_msgSend(v4, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v13);
  }

}

- (void)handleResidentReachabilityChangeForFabric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRAccessoryServerBrowser *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if (-[HMMTRAccessoryServerBrowser isOwnerForHomeWithFabric:](self, "isOwnerForHomeWithFabric:", v4))
    {
      v6 = (void *)MEMORY[0x242656984]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke;
      v10[3] = &unk_250F23E18;
      v10[4] = self;
      v11 = v5;
      objc_msgSend(v4, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v10);

    }
  }

}

- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  HMMTRAccessoryServerBrowser *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "fabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser currentFabricID](v11, "currentFabricID");
        v22 = a5;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HMMTRAccessoryServerBrowser browserState](v11, "browserState");
        -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](v11, "fabricsWithActiveClients");
        v23 = v10;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRAccessoryServerBrowser fabricsWithActiveSecondaryClients](v11, "fabricsWithActiveSecondaryClients");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v30 = v21;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v20;
        v35 = 2112;
        v36 = v14;
        v37 = 2112;
        v38 = v15;
        v39 = 2048;
        v40 = v19;
        v41 = 2112;
        v42 = v16;
        v43 = 2112;
        v44 = v17;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@UpdateNotifications received for fabricID:%@ enabled:%@ keepAliveOnly:%@. currentFabricID %@, browserState = %lu, fabricsWithActiveClients = %@, fabricWithActiveSecondaryClients = %@", buf, 0x52u);

        v10 = v23;
        a5 = v22;

      }
      objc_autoreleasePoolPop(v10);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke;
      v24[3] = &unk_250F22148;
      v27 = a5;
      v28 = a3;
      v24[4] = v11;
      v25 = v9;
      v26 = v8;
      objc_msgSend(v26, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v24);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v18;
        v31 = 2112;
        v32 = v8;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@UpdateNotifications received nil fabricID for fabric: %@. Ignoring request", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
  }

}

- (void)removeActiveClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  if (a3)
  {
    v5 = a4;
    v8 = a5;
    v9 = a3;
    -[HMMTRAccessoryServerBrowser removeFabricWithActiveClients:](self, "removeFabricWithActiveClients:", v9);
    -[HMMTRAccessoryServerBrowser _handleClientsRemovedWithFabricID:updateConnectionIdleTimeout:reason:](self, "_handleClientsRemovedWithFabricID:updateConnectionIdleTimeout:reason:", v9, v5, v8);

  }
}

- (void)removeActiveSecondaryClientWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  if (a3)
  {
    v5 = a4;
    v8 = a5;
    v9 = a3;
    -[HMMTRAccessoryServerBrowser removeFabricWithActiveSecondaryClients:](self, "removeFabricWithActiveSecondaryClients:", v9);
    -[HMMTRAccessoryServerBrowser _handleClientsRemovedWithFabricID:updateConnectionIdleTimeout:reason:](self, "_handleClientsRemovedWithFabricID:updateConnectionIdleTimeout:reason:", v9, v5, v8);

  }
}

- (void)_handleClientsRemovedWithFabricID:(id)a3 updateConnectionIdleTimeout:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  HMMTRAccessoryServerBrowser *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  HMMTRAccessoryServerBrowser *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  HMMTRAccessoryServerBrowser *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _QWORD block[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v6 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    -[HMMTRAccessoryServerBrowser fabricsWithActiveClients](self, "fabricsWithActiveClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if (v11)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v15;
        v49 = 2112;
        v50 = v8;
        v16 = "%{public}@Not shutting down stack for fabricID %@ because there is an active client";
LABEL_8:
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    -[HMMTRAccessoryServerBrowser fabricsWithActiveSecondaryClients](self, "fabricsWithActiveSecondaryClients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v8);

    if (v18)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v15;
        v49 = 2112;
        v50 = v8;
        v16 = "%{public}@Not shutting down stack for fabricID %@ because there is an active secondary client";
        goto LABEL_8;
      }
LABEL_9:

      objc_autoreleasePoolPop(v12);
      goto LABEL_10;
    }
    -[HMMTRAccessoryServerBrowser currentFabricID](self, "currentFabricID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToNumber:", v8);

    if (v20)
    {
      v39 = v9;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      -[HMMTRAccessoryServerBrowser fabricsWithActiveConnections](self, "fabricsWithActiveConnections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v26, "fabricID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = HMFEqualObjects();

            if (v28)
            {
              if (v6)
                v29 = objc_msgSend(v26, "updateAllConnectionIdleTimeoutsToMinimum");
              v35 = (void *)MEMORY[0x242656984](v29);
              v36 = self;
              HMFGetOSLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v48 = v38;
                v49 = 2112;
                v50 = v8;
                _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_INFO, "%{public}@Not shutting down stack for fabricID %@ because there is an active connection", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v35);

              v9 = v39;
              goto LABEL_10;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v23)
            continue;
          break;
        }
      }

      v30 = (void *)MEMORY[0x242656984]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v33;
        v49 = 2112;
        v50 = v8;
        _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_INFO, "%{public}@Shutting down stack for fabricID %@ because there are no active clients", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      -[HAPAccessoryServerBrowser workQueue](v31, "workQueue");
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __100__HMMTRAccessoryServerBrowser__handleClientsRemovedWithFabricID_updateConnectionIdleTimeout_reason___block_invoke;
      block[3] = &unk_250F22458;
      block[4] = v31;
      v9 = v39;
      v41 = v39;
      dispatch_async(v34, block);

    }
  }
LABEL_10:

}

- (void)_handleLockStateNotification
{
  void *v3;
  void *v4;
  HMMTRAccessoryServerBrowser *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMMTRAccessoryServerBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  if (-[HMMTRAccessoryServerBrowser _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_getLockedState_))
  {
    -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessoryServerBrowser:getLockedState:", self, &v16);

  }
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Lock state changed: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    if (v16)
    {
      -[HMMTRAccessoryServerBrowser currentFabricID](v5, "currentFabricID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x242656984]();
      v11 = v5;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing fabricID %@ from active clients and aborting operations", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRAccessoryServerBrowser removeActiveClientWithFabricID:updateConnectionIdleTimeout:reason:](v11, "removeActiveClientWithFabricID:updateConnectionIdleTimeout:reason:", v9, 1, v14);

    }
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
      if (CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
      {
        -[HMMTRAccessoryServerBrowser threadRadioManager](v5, "threadRadioManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleDeviceLockStateChange:", v16);

      }
    }
  }
}

- (void)handleHomeDeletionWithFabric:(id)a3
{
  id v4;
  void *v5;
  HMMTRAccessoryServerBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
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
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Home with fabric %@ has been deleted, cleaning up state", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "fabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__HMMTRAccessoryServerBrowser_handleHomeDeletionWithFabric___block_invoke;
    v11[3] = &unk_250F22458;
    v11[4] = v6;
    v12 = v4;
    dispatch_async(v10, v11);

  }
}

- (void)fetchCommissioningCertificatesFromOwnerForPublicKey:(id)a3 fabricID:(id)a4 completionHandler:(id)a5
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
  -[HMMTRAccessoryServerBrowser delegateQueue](self, "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)cacheOperationalCertificate:(id)a3 fabricID:(id)a4
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
  -[HMMTRAccessoryServerBrowser delegateQueue](self, "delegateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMMTRAccessoryServerBrowser_cacheOperationalCertificate_fabricID___block_invoke;
  block[3] = &unk_250F224F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)fetchCachedOperationalCertificateForFabricID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMMTRAccessoryServerBrowser delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__HMMTRAccessoryServerBrowser_fetchCachedOperationalCertificateForFabricID_completionHandler___block_invoke;
  v10[3] = &unk_250F22170;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "accessoryServerBrowser:getCachedOperationalCertificateDataForFabricID:completion:", self, v7, v10);

}

- (void)fetchPreferredThreadCredentialsForServer:(id)a3 withCompletion:(id)a4
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
  -[HMMTRAccessoryServerBrowser delegateQueue](self, "delegateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setPreWarmTargetToFabricWithID:(id)a3 isOwner:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMMTRAccessoryServerBrowser_setPreWarmTargetToFabricWithID_isOwner___block_invoke;
  block[3] = &unk_250F23558;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)setPreWarmTargetToSystemCommissionerFabric
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMMTRAccessoryServerBrowser_setPreWarmTargetToSystemCommissionerFabric__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)clearPreWarmTarget
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMMTRAccessoryServerBrowser_clearPreWarmTarget__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_preWarmCommissioningSession
{
  void *v3;
  void *v4;
  HMMTRAccessoryServerBrowser *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HMMTRAccessoryServerBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRAccessoryServerBrowser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  BOOL v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[HMMTRAccessoryServerBrowser preWarmedFabricID](self, "preWarmedFabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      objc_autoreleasePoolPop(v4);
      return;
    }
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    v8 = "%{public}@Commissioning session was already pre-warmed";
LABEL_4:
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    goto LABEL_5;
  }
  -[HMMTRAccessoryServerBrowser configuredPreWarmTargetFabricID](self, "configuredPreWarmTargetFabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if (!-[HMMTRAccessoryServerBrowser preWarmTargetIsSystemCommissionerFabric](self, "preWarmTargetIsSystemCommissionerFabric"))
  {
    return;
  }
  -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](self, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRAccessoryServerBrowser controllerFactory](self, "controllerFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser controllerFactoryEnablePerPrimaryResidentConfirmationToken](self, "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enableNormalOperationWithToken:", v12);

    -[HMMTRAccessoryServerBrowser setControllerFactoryEnablePerPrimaryResidentConfirmationToken:](self, "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", 0);
  }
  if (-[HMMTRAccessoryServerBrowser preWarmTargetIsSystemCommissionerFabric](self, "preWarmTargetIsSystemCommissionerFabric"))
  {
    goto LABEL_13;
  }
  -[HMMTRAccessoryServerBrowser storage](self, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fabricID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessoryServerBrowser configuredPreWarmTargetFabricID](self, "configuredPreWarmTargetFabricID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
LABEL_13:
    v17 = (void *)MEMORY[0x242656984]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v20;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Storage is already configured. Prewarming Matter device controller.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMMTRAccessoryServerBrowser deviceController](v18, "deviceController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preWarmCommissioningSession");
LABEL_16:

    return;
  }
  if (-[HMMTRAccessoryServerBrowser preWarmTargetIsSystemCommissionerFabric](self, "preWarmTargetIsSystemCommissionerFabric"))
  {
    -[HMMTRAccessoryServerBrowser systemCommissionerFabricID](self, "systemCommissionerFabricID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x242656984]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Pre-warming system commissioning device controller", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      -[HMMTRAccessoryServerBrowser systemCommissionerControllerWrapper](v24, "systemCommissionerControllerWrapper");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "controller");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "preWarmCommissioningSession");

      goto LABEL_16;
    }
  }
  v28 = -[HMMTRAccessoryServerBrowser preWarmTargetIsSystemCommissionerFabric](self, "preWarmTargetIsSystemCommissionerFabric");
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (!v29)
      goto LABEL_5;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    v8 = "%{public}@Could not pre-warm commissioning session when fabric was never created";
    goto LABEL_4;
  }
  if (v29)
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser configuredPreWarmTargetFabricID](v5, "configuredPreWarmTargetFabricID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v30;
    v41 = 2112;
    v42 = v31;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting up controller for Home fabric %@ in order to pre-warm commissioning session", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMMTRAccessoryServerBrowser configuredPreWarmTargetFabricID](v5, "configuredPreWarmTargetFabricID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser appleHomeFabricWithID:](v5, "appleHomeFabricWithID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke;
    v38[3] = &unk_250F223C0;
    v38[4] = v5;
    objc_msgSend(v33, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v38);

  }
  else
  {
    -[HMMTRAccessoryServerBrowser storage](v5, "storage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser configuredPreWarmTargetFabricID](v5, "configuredPreWarmTargetFabricID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HMMTRAccessoryServerBrowser userOwnsConfiguredPreWarmTargetFabric](v5, "userOwnsConfiguredPreWarmTargetFabric");
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke_333;
    v37[3] = &unk_250F223C0;
    v37[4] = v5;
    objc_msgSend(v34, "fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:", v35, v36, 0, 0, v37);

  }
}

- (void)startBluetoothScan
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke;
  v4[3] = &unk_250F223E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stopBluetoothScan
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMMTRAccessoryServerBrowser_stopBluetoothScan__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_updateCentralManager
{
  void *v3;
  HMMTRAccessoryServerBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  HMMTRAccessoryServerBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMMTRAccessoryServerBrowser *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  _QWORD v33[4];
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerBrowser cbCentral](v4, "cbCentral");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v6;
    v37 = 2048;
    v38 = objc_msgSend(v7, "state");
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@CBCentralManager state: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAccessoryServerBrowser cbCentral](v4, "cbCentral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state") == 5;

  if (v9)
  {
    v10 = -[HMMTRAccessoryServerBrowser bleScanActive](v4, "bleScanActive");
    v11 = -[HMMTRAccessoryServerBrowser requestedBLEScan](v4, "requestedBLEScan");
    if (v10)
    {
      if (v11)
      {
        objc_initWeak((id *)buf, v4);
        v12 = dispatch_time(0, 60000000000);
        -[HAPAccessoryServerBrowser workQueue](v4, "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __52__HMMTRAccessoryServerBrowser__updateCentralManager__block_invoke;
        v30[3] = &unk_250F223E8;
        objc_copyWeak(&v31, (id *)buf);
        dispatch_after(v12, v13, v30);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v24 = (void *)MEMORY[0x242656984]();
        v25 = v4;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v27;
          _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Stopping BLE scan", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        -[HMMTRAccessoryServerBrowser cbCentral](v25, "cbCentral");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stopScan");

        -[HMMTRAccessoryServerBrowser cbCentral](v25, "cbCentral");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDelegate:", 0);

        -[HMMTRAccessoryServerBrowser setCbCentral:](v25, "setCbCentral:", 0);
        -[HMMTRAccessoryServerBrowser setBleScanActive:](v25, "setBleScanActive:", 0);
        -[HMMTRAccessoryServerBrowser _cleanupDisappearedServersOverBLE](v25, "_cleanupDisappearedServersOverBLE");
      }
    }
    else if (v11)
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = v4;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v17;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting BLE scan", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      -[HMMTRAccessoryServerBrowser _prepareServerForBLEDiscovery](v15, "_prepareServerForBLEDiscovery");
      -[HMMTRAccessoryServerBrowser setBleScanActive:](v15, "setBleScanActive:", 1);
      -[HMMTRAccessoryServerBrowser cbCentral](v15, "cbCentral");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("FFF6"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BDBB050];
      v32[0] = *MEMORY[0x24BDBB058];
      v32[1] = v21;
      v33[0] = MEMORY[0x24BDBD1C8];
      v33[1] = MEMORY[0x24BDBD1C0];
      v22 = *MEMORY[0x24BDBB0D0];
      v32[2] = *MEMORY[0x24BDBB0E0];
      v32[3] = v22;
      v33[2] = &unk_250F3F948;
      v33[3] = &unk_250F3F960;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scanForPeripheralsWithServices:options:", v20, v23);

      -[HMMTRAccessoryServerBrowser _updateCentralManager](v15, "_updateCentralManager");
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  NSObject *v4;

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMMTRAccessoryServerBrowser _updateCentralManager](self, "_updateCentralManager");
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v7;
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
  void *v19;
  int v20;
  void *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  HMMTRAccessoryServerBrowser *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v32 = self;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "BOOLValue"))
  {
    v30 = v9;
    v31 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBAFE0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v16, "data");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", CFSTR("FFF6"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "data");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v17, "isEqual:", v19);

            if (v20)
            {
              objc_msgSend(v11, "objectForKey:", v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "length") == 8)
              {
                v22 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v21), "bytes");
                v23 = *(unsigned __int16 *)(v22 + 3);
                v24 = *(unsigned __int16 *)(v22 + 5);
                if (*v22 <= 1u && (_DWORD)v23 != 0 && (_DWORD)v24 != 0)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v22[1] | ((v22[2] & 0xF) << 8));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v23);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMMTRAccessoryServerBrowser _handleBLEAddOrUpdateWithDiscriminator:vendorID:productID:](v32, "_handleBLEAddOrUpdateWithDiscriminator:vendorID:productID:", v27, v28, v29);

                }
              }

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v13);
      }
    }

    v9 = v30;
    v7 = v31;
  }

}

- (void)dispatchBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(a3, v7, v6);

}

- (id)logIdentifier
{
  return CFSTR("HMMTRAccessoryServerBrowser");
}

- (BOOL)connectionRequestSuspended
{
  return self->_connectionRequestSuspended;
}

- (NSMutableSet)allowedNodeIDsForConnectionRequests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)isSystemCommissionerMode
{
  return self->_systemCommissionerMode;
}

- (BOOL)isSystemCommissionerFeatureEnabled
{
  return self->_systemCommissionerFeatureEnabled;
}

- (HMMTRStorage)storage
{
  return self->_storage;
}

- (HMMTRResidentStateManager)residentStateManager
{
  return self->_residentStateManager;
}

- (HMMTRVendorMetadataStore)vendorMetadataStore
{
  return self->_vendorMetadataStore;
}

- (HMMTRAttestationDataStore)attestationDataStore
{
  return self->_attestationDataStore;
}

- (HMMTRAttestationStatus)attestationStatus
{
  return self->_attestationStatus;
}

- (HMMTRUserAuthorizationForPairing)userAuthorizationForPairing
{
  return self->_userAuthorizationForPairing;
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (HMMTRSystemCommissionerPairingManager)systemCommissionerPairingManager
{
  return self->_systemCommissionerPairingManager;
}

- (HMMTRAccessoryServerBrowserDelegate)accessoryServerBrowserDelegate
{
  return (HMMTRAccessoryServerBrowserDelegate *)objc_loadWeakRetained((id *)&self->_accessoryServerBrowserDelegate);
}

- (void)setAccessoryServerBrowserDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryServerBrowserDelegate, a3);
}

- (HMMTRThreadRadioManager)threadRadioManager
{
  return self->_threadRadioManager;
}

- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider
{
  return self->_softwareUpdateProvider;
}

- (HMMTRThreadSoftwareUpdateController)threadSoftwareUpdateController
{
  return self->_threadSoftwareUpdateController;
}

- (NSNumber)currentFabricID
{
  return self->_currentFabricID;
}

- (void)setCurrentFabricID:(id)a3
{
  objc_storeStrong((id *)&self->_currentFabricID, a3);
}

- (NSMutableSet)stagedAccessoryServers
{
  return self->_stagedAccessoryServers;
}

- (HMMTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (HAPAccessoryServerBrowserDelegate)delegate
{
  return (HAPAccessoryServerBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (unint64_t)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(unint64_t)a3
{
  self->_restartCount = a3;
}

- (BOOL)pendingMatterStackRestart
{
  return self->_pendingMatterStackRestart;
}

- (void)setPendingMatterStackRestart:(BOOL)a3
{
  self->_pendingMatterStackRestart = a3;
}

- (HAPPowerManager)powerManager
{
  return self->_powerManager;
}

- (void)setPowerManager:(id)a3
{
  objc_storeStrong((id *)&self->_powerManager, a3);
}

- (OS_nw_browser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setBonjourBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourBrowser, a3);
}

- (NSMutableArray)bonjourBrowserChanges
{
  return self->_bonjourBrowserChanges;
}

- (void)setBonjourBrowserChanges:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourBrowserChanges, a3);
}

- (CBCentralManager)cbCentral
{
  return self->_cbCentral;
}

- (void)setCbCentral:(id)a3
{
  objc_storeStrong((id *)&self->_cbCentral, a3);
}

- (BOOL)bleScanActive
{
  return self->_bleScanActive;
}

- (void)setBleScanActive:(BOOL)a3
{
  self->_bleScanActive = a3;
}

- (BOOL)requestedBLEScan
{
  return self->_requestedBLEScan;
}

- (void)setRequestedBLEScan:(BOOL)a3
{
  self->_requestedBLEScan = a3;
}

- (HMFTimer)diagnosticsTimer
{
  return self->_diagnosticsTimer;
}

- (void)setDiagnosticsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsTimer, a3);
}

- (NSDate)diagnosticTimerStart
{
  return self->_diagnosticTimerStart;
}

- (void)setDiagnosticTimerStart:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticTimerStart, a3);
}

- (unint64_t)browserState
{
  return self->_browserState;
}

- (void)setBrowserState:(unint64_t)a3
{
  self->_browserState = a3;
}

- (BOOL)preventThreadStopDuringStackRestart
{
  return self->_preventThreadStopDuringStackRestart;
}

- (void)setPreventThreadStopDuringStackRestart:(BOOL)a3
{
  self->_preventThreadStopDuringStackRestart = a3;
}

- (NSDictionary)matterStorageItems
{
  return (NSDictionary *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMatterStorageItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSNumber)configuredPreWarmTargetFabricID
{
  return self->_configuredPreWarmTargetFabricID;
}

- (void)setConfiguredPreWarmTargetFabricID:(id)a3
{
  objc_storeStrong((id *)&self->_configuredPreWarmTargetFabricID, a3);
}

- (BOOL)userOwnsConfiguredPreWarmTargetFabric
{
  return self->_userOwnsConfiguredPreWarmTargetFabric;
}

- (void)setUserOwnsConfiguredPreWarmTargetFabric:(BOOL)a3
{
  self->_userOwnsConfiguredPreWarmTargetFabric = a3;
}

- (NSNumber)preWarmedFabricID
{
  return self->_preWarmedFabricID;
}

- (void)setPreWarmedFabricID:(id)a3
{
  objc_storeStrong((id *)&self->_preWarmedFabricID, a3);
}

- (BOOL)preWarmTargetIsSystemCommissionerFabric
{
  return self->_preWarmTargetIsSystemCommissionerFabric;
}

- (void)setPreWarmTargetIsSystemCommissionerFabric:(BOOL)a3
{
  self->_preWarmTargetIsSystemCommissionerFabric = a3;
}

- (int)homeKeychainReadyNotificationToken
{
  return self->_homeKeychainReadyNotificationToken;
}

- (void)setHomeKeychainReadyNotificationToken:(int)a3
{
  self->_homeKeychainReadyNotificationToken = a3;
}

- (int)mtsKeychainReadyNotificationToken
{
  return self->_mtsKeychainReadyNotificationToken;
}

- (void)setMtsKeychainReadyNotificationToken:(int)a3
{
  self->_mtsKeychainReadyNotificationToken = a3;
}

- (id)controllerFactoryEnablePerPrimaryResidentConfirmationToken
{
  return self->_controllerFactoryEnablePerPrimaryResidentConfirmationToken;
}

- (void)setControllerFactoryEnablePerPrimaryResidentConfirmationToken:(id)a3
{
  objc_storeStrong(&self->_controllerFactoryEnablePerPrimaryResidentConfirmationToken, a3);
}

- (NSMutableSet)nodesWithPendingACLOverwrite
{
  return (NSMutableSet *)objc_getProperty(self, a2, 368, 1);
}

- (void)setNodesWithPendingACLOverwrite:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSMutableArray)deviceControllerHandlers
{
  return self->_deviceControllerHandlers;
}

- (int)lockStateNotificationRegistrationToken
{
  return self->_lockStateNotificationRegistrationToken;
}

- (void)setLockStateNotificationRegistrationToken:(int)a3
{
  self->_lockStateNotificationRegistrationToken = a3;
}

- (BOOL)lockStateNotificationRegistered
{
  return self->_lockStateNotificationRegistered;
}

- (void)setLockStateNotificationRegistered:(BOOL)a3
{
  self->_lockStateNotificationRegistered = a3;
}

- (HMMTRMatterKeypair)nocSigner
{
  return self->_nocSigner;
}

- (void)setNocSigner:(id)a3
{
  objc_storeStrong((id *)&self->_nocSigner, a3);
}

- (HMMTRMatterKeypair)ownerSharedOperationalKeyPair
{
  return self->_ownerSharedOperationalKeyPair;
}

- (void)setOwnerSharedOperationalKeyPair:(id)a3
{
  objc_storeStrong((id *)&self->_ownerSharedOperationalKeyPair, a3);
}

- (HMMTRMatterKeypair)ownerLocalOperationalKeyPair
{
  return self->_ownerLocalOperationalKeyPair;
}

- (void)setOwnerLocalOperationalKeyPair:(id)a3
{
  objc_storeStrong((id *)&self->_ownerLocalOperationalKeyPair, a3);
}

- (HMMTRRegulatoryInfo)regulatoryInfo
{
  return self->_regulatoryInfo;
}

- (HMMTRAccessoryServer)commissioneeAccessoryServer
{
  return self->_commissioneeAccessoryServer;
}

- (void)setCommissioneeAccessoryServer:(id)a3
{
  objc_storeStrong((id *)&self->_commissioneeAccessoryServer, a3);
}

- (HMMTRPairingWindowInfoTable)pairingWindowInfoTable
{
  return (HMMTRPairingWindowInfoTable *)objc_getProperty(self, a2, 424, 1);
}

- (HMMTRControllerFactory)controllerFactory
{
  return self->_controllerFactory;
}

- (HMMTRSystemCommissionerControllerParams)systemCommissionerControllerParams
{
  return self->_systemCommissionerControllerParams;
}

- (HMMTRFabricControllerStore)homeFabricControllers
{
  return (HMMTRFabricControllerStore *)objc_getProperty(self, a2, 448, 1);
}

- (NSMutableSet)nodesAddedToHome
{
  return self->_nodesAddedToHome;
}

- (void)setNodesAddedToHome:(id)a3
{
  objc_storeStrong((id *)&self->_nodesAddedToHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesAddedToHome, 0);
  objc_storeStrong((id *)&self->_homeFabricControllers, 0);
  objc_storeStrong((id *)&self->_systemCommissionerControllerParams, 0);
  objc_storeStrong((id *)&self->_controllerFactory, 0);
  objc_storeStrong((id *)&self->_pairingWindowInfoTable, 0);
  objc_storeStrong((id *)&self->_commissioneeAccessoryServer, 0);
  objc_storeStrong((id *)&self->_regulatoryInfo, 0);
  objc_storeStrong((id *)&self->_ownerLocalOperationalKeyPair, 0);
  objc_storeStrong((id *)&self->_ownerSharedOperationalKeyPair, 0);
  objc_storeStrong((id *)&self->_nocSigner, 0);
  objc_storeStrong((id *)&self->_deviceControllerHandlers, 0);
  objc_storeStrong((id *)&self->_nodesWithPendingACLOverwrite, 0);
  objc_storeStrong(&self->_controllerFactoryEnablePerPrimaryResidentConfirmationToken, 0);
  objc_storeStrong((id *)&self->_preWarmedFabricID, 0);
  objc_storeStrong((id *)&self->_configuredPreWarmTargetFabricID, 0);
  objc_storeStrong((id *)&self->_matterStorageItems, 0);
  objc_storeStrong((id *)&self->_diagnosticTimerStart, 0);
  objc_storeStrong((id *)&self->_diagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_cbCentral, 0);
  objc_storeStrong((id *)&self->_bonjourBrowserChanges, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_stagedAccessoryServers, 0);
  objc_storeStrong((id *)&self->_currentFabricID, 0);
  objc_storeStrong((id *)&self->_threadSoftwareUpdateController, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProvider, 0);
  objc_storeStrong((id *)&self->_threadRadioManager, 0);
  objc_destroyWeak((id *)&self->_accessoryServerBrowserDelegate);
  objc_storeStrong((id *)&self->_systemCommissionerPairingManager, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_userAuthorizationForPairing, 0);
  objc_storeStrong((id *)&self->_attestationStatus, 0);
  objc_storeStrong((id *)&self->_attestationDataStore, 0);
  objc_storeStrong((id *)&self->_vendorMetadataStore, 0);
  objc_storeStrong((id *)&self->_residentStateManager, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryServers, 0);
  objc_storeStrong((id *)&self->_allowedNodeIDsForConnectionRequests, 0);
  objc_storeStrong((id *)&self->_fabricsWithPendingConnections, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveConnections, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveSecondaryClients, 0);
  objc_storeStrong((id *)&self->_fabricsWithActiveClients, 0);
}

void __52__HMMTRAccessoryServerBrowser__updateCentralManager__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x242656984]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Refreshing BLE discovered servers", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(v3, "_cleanupDisappearedServersOverBLE");
  objc_msgSend(v3, "_prepareServerForBLEDiscovery");
  objc_msgSend(v3, "_updateCentralManager");

}

void __48__HMMTRAccessoryServerBrowser_stopBluetoothScan__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setRequestedBLEScan:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateCentralManager");
  objc_msgSend(*(id *)(a1 + 32), "bonjourBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bonjourBrowser");
    v3 = objc_claimAutoreleasedReturnValue();
    nw_browser_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "powerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deRegisterFromSleepWake:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "_cleanupLocallyDiscoveredServers");
  objc_msgSend(*(id *)(a1 + 32), "_clearLocallyDiscoveredFlags");
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productPlatform");

  if ((unint64_t)(v6 - 1) <= 1 && isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Resume all thread connection requests due to BLE scan end", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "resumeAllOperations");
  }
}

void __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  int v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  if ((unint64_t)(v3 - 1) <= 1)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
      v4 = (void *)MEMORY[0x242656984]();
      v5 = WeakRetained;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v7;
        _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Aborting all thread connection requests due to BLE scan", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "abortAndSuspendAllOperationsWithReason:", v8);

    }
    objc_msgSend(WeakRetained, "_preWarmCommissioningSession");
    objc_msgSend(WeakRetained, "_cleanupLocallyDiscoveredServers");
    objc_msgSend(WeakRetained, "setRequestedBLEScan:", 1);
    objc_msgSend(WeakRetained, "cbCentral");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDBB220]);
      objc_msgSend(WeakRetained, "workQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithDelegate:queue:", WeakRetained, v11);
      objc_msgSend(WeakRetained, "setCbCentral:", v12);

    }
    objc_msgSend(WeakRetained, "_updateCentralManager");
    v13 = objc_msgSend(WeakRetained, "_initializeAndStartBonjourBrowser");
    if (objc_msgSend(WeakRetained, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
    {
      objc_msgSend(WeakRetained, "delegateQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke_336;
      v18[3] = &unk_250F221C0;
      v18[4] = WeakRetained;
      v19 = v13;
      dispatch_async(v14, v18);

    }
    objc_msgSend(MEMORY[0x24BE1BBB8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPowerManager:", v15);

    objc_msgSend(WeakRetained, "powerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerForSleepWake:queue:", WeakRetained, v17);

    objc_msgSend(WeakRetained, "_reportAccessoriesKnownToSystemCommissioner");
  }

}

void __49__HMMTRAccessoryServerBrowser_startBluetoothScan__block_invoke_336(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  HMErrorFromOSStatus();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryServerBrowser:didStartDiscoveringWithError:", v2, v3);

}

void __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not pre-warm due to failure to fetch root cert for fabricID %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSystemCommissionerMode:", 0);
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareStorageForFabricID:", v10);

    objc_msgSend(*(id *)(a1 + 32), "deviceController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isRunning");

    if ((_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPreWarmedFabricID:", v12);

      v13 = (void *)MEMORY[0x242656984]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Prewarming Matter device controller", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 32), "deviceController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preWarmCommissioningSession");

    }
  }

}

void __59__HMMTRAccessoryServerBrowser__preWarmCommissioningSession__block_invoke_333(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not pre-warm due to failure to fetch root cert for fabricID %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSystemCommissionerMode:", 0);
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareStorageForFabricID:", v10);

    objc_msgSend(*(id *)(a1 + 32), "deviceController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isRunning");

    if ((_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "configuredPreWarmTargetFabricID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPreWarmedFabricID:", v12);

      v13 = (void *)MEMORY[0x242656984]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Prewarming Matter device controller", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 32), "deviceController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preWarmCommissioningSession");

    }
  }

}

uint64_t __49__HMMTRAccessoryServerBrowser_clearPreWarmTarget__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfiguredPreWarmTargetFabricID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPreWarmedFabricID:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPreWarmTargetIsSystemCommissionerFabric:", 0);
}

uint64_t __73__HMMTRAccessoryServerBrowser_setPreWarmTargetToSystemCommissionerFabric__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfiguredPreWarmTargetFabricID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPreWarmedFabricID:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPreWarmTargetIsSystemCommissionerFabric:", 1);
}

uint64_t __70__HMMTRAccessoryServerBrowser_setPreWarmTargetToFabricWithID_isOwner___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConfiguredPreWarmTargetFabricID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setUserOwnsConfiguredPreWarmTargetFabric:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setPreWarmedFabricID:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPreWarmTargetIsSystemCommissionerFabric:", 0);
}

void __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  objc_msgSend(a1[5], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke_2;
  v5[3] = &unk_250F22198;
  v5[4] = a1[4];
  v6 = a1[6];
  objc_msgSend(v2, "accessoryServerBrowser:getThreadNetworkCredentialsForAccessoryWithIdentifier:withCompletion:", v3, v4, v5);

}

void __87__HMMTRAccessoryServerBrowser_fetchPreferredThreadCredentialsForServer_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void (*v20)(void);
  int v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5 && !v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Preferred Thread Credentials from owner.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "currentFabric");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", v13);

    if (!(_DWORD)v12)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 32), "threadRadioManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overrideLocationCheckForPairingForFabricID:", v15);

    v16 = objc_msgSend(*(id *)(a1 + 32), "isSystemCommissionerMode");
    objc_msgSend(*(id *)(a1 + 32), "threadRadioManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v17, "startThreadRadioForSystemCommissionerFabricID:", v18);
    }
    else
    {
      v21 = objc_msgSend(v17, "hasMatterThreadAccessoryInHomeWithFabricID:", v18);

      if (!v21)
      {
LABEL_14:
        v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_15;
      }
      objc_msgSend(*(id *)(a1 + 32), "threadRadioManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startThreadRadioForHomeWithFabricID:", v18);
    }

    goto LABEL_14;
  }
  if (v10)
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v19;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch Preferred Thread Credentials from owner with error %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v20 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_15:
  v20();

}

uint64_t __94__HMMTRAccessoryServerBrowser_fetchCachedOperationalCertificateForFabricID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__HMMTRAccessoryServerBrowser_cacheOperationalCertificate_fabricID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:cacheOperationalCertData:forFabricID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke_2;
  v6[3] = &unk_250F220F8;
  v6[4] = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "accessoryServerBrowser:getCommissioningCertificatesForNodeID:fabricID:publicKey:completion:", v3, 0, v4, v5, v6);

}

void __110__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesFromOwnerForPublicKey_fabricID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x242656984]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch commissioning certificates from owner with error %@", (uint8_t *)&v22, 0x16u);

    }
  }
  else if (v19)
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v21;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched commissioning certificates from owner. Root Certificate %@, Operational certificate %@, Owner NodeID %@", (uint8_t *)&v22, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__HMMTRAccessoryServerBrowser_handleHomeDeletionWithFabric___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFabricWithActiveClients:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFabricWithActiveSecondaryClients:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fabricID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_abortAllOperationsForFabricID:reason:", v8, v7);

}

void __100__HMMTRAccessoryServerBrowser__handleClientsRemovedWithFabricID_updateConnectionIdleTimeout_reason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentFabricID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_disconnectFromIdleFabric:reason:", v3, *(_QWORD *)(a1 + 40));

}

void __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  _QWORD block[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 32), "addFabricWithActiveSecondaryClients:", *(_QWORD *)(a1 + 40));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeActiveSecondaryClientWithFabricID:updateConnectionIdleTimeout:reason:", v4, 0, v16);
LABEL_12:

    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeActiveClientWithFabricID:updateConnectionIdleTimeout:reason:", v4, 0, v16);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "addFabricWithActiveClients:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v3 | v6;

  if (!v7)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting stack for fabricID %@ because there are active clients and local stack is unconfigured", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_328;
    block[3] = &unk_250F22458;
    v14 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v33 = v14;
    dispatch_async(v13, block);

    v15 = v33;
LABEL_9:

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

  if (!v18)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isPrimaryResidentNodeReachable");

    if ((v26 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_2;
    v29[3] = &unk_250F22458;
    v28 = *(void **)(a1 + 40);
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = v28;
    dispatch_async(v27, v29);

    v15 = v30;
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceAllowedAccessoryControlDespiteReachableResidentForFabric:", *(_QWORD *)(a1 + 48))&& objc_msgSend(*(id *)(a1 + 32), "browserState") != 2)
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting discovery stack for fabricID %@ because there are active clients", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_329;
    v31[3] = &unk_250F23DF0;
    v31[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v24, v31);

  }
LABEL_13:

}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_328(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForUpdatedHomeFabricID:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_329(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartDiscovery");
}

uint64_t __88__HMMTRAccessoryServerBrowser_handleUpdateNotificationsEnabled_forFabric_keepAliveOnly___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentFabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_suspendOperationsForFabricID:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForUpdatedHomeFabricID:", *(_QWORD *)(a1 + 40));
}

void __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "currentFabricID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

    if ((v7 & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceMobileAndAllowedAccessoryControl")
        || objc_msgSend(*(id *)(a1 + 32), "browserState") == 2)
      {
        goto LABEL_17;
      }
      objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveClients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 40)))
      {

LABEL_19:
        v24 = (void *)MEMORY[0x242656984]();
        v25 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          v35 = 2112;
          v36 = v28;
          _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@No resident reachable for fabricID %@ and there are active clients, start local stack", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke_327;
        block[3] = &unk_250F23DF0;
        block[4] = *(_QWORD *)(a1 + 32);
        dispatch_async(v29, block);

        goto LABEL_17;
      }
      objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveSecondaryClients");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", *(_QWORD *)(a1 + 40));

      if (v23)
        goto LABEL_19;
      v10 = (void *)MEMORY[0x242656984]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveClients");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v13;
        v35 = 2112;
        v36 = v30;
        v37 = 2112;
        v38 = v31;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Fabric %@ does not have active clients, fabricsWithActiveClients - %@", buf, 0x20u);

        goto LABEL_11;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x242656984]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v13;
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Resident reachability changed for non-current fabricID %@, ignoring", buf, 0x16u);
LABEL_11:

      }
    }

    objc_autoreleasePoolPop(v10);
    goto LABEL_17;
  }
  objc_msgSend(v5, "fabricsWithActiveClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40)))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveSecondaryClients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", *(_QWORD *)(a1 + 40));

    if (!v16)
      goto LABEL_17;
  }
  v17 = (void *)MEMORY[0x242656984]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v34 = v20;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting stack for fabricID %@ because there are active clients and local stack is unconfigured", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForUpdatedHomeFabricID:", *(_QWORD *)(a1 + 40));
LABEL_17:

}

void __73__HMMTRAccessoryServerBrowser_handleResidentReachabilityChangeForFabric___block_invoke_327(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "currentFabricID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setupStorageStateForUpdatedHomeFabricID:", v2);

}

void __72__HMMTRAccessoryServerBrowser_getNOCFromResidentForSharedUserForFabric___block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@#### Failed fetching NOC for shared user with error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __60__HMMTRAccessoryServerBrowser__updateACLOnPairedAccessories__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated ACL after user CAT update on server %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
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
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isOwnerForHomeWithFabric:", *(_QWORD *)(a1 + 40)))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Owner user - No need to request NOC", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    if (objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident"))
      objc_msgSend(*(id *)(a1 + 32), "_updateACLOnPairedAccessories");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "currentDeviceNodeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "operationalCertificate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v8);
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    objc_msgSend(v9, "subject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "caseAuthenticatedTags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryOperatePrivilegeCATID:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && !objc_msgSend(v11, "containsObject:", v13))
    {
      v18 = (void *)MEMORY[0x242656984]();
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v21;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@New operation privilege CAT %@ missing from current NOC: %@, fetching a new NOC.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(*(id *)(a1 + 40), "invalidateCachedData");
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke_326;
      v23[3] = &unk_250F23E18;
      v22 = *(void **)(a1 + 40);
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = v22;
      objc_msgSend(v24, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v23);

    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@No need to fetch NOC again for updated operate privilege CAT: %@ as current NOC contains %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

void __93__HMMTRAccessoryServerBrowser_updateAccessoryACLAndGetNOCFromResidentForSharedUserForFabric___block_invoke_326(uint64_t a1, void *a2)
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
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to load NOC for shared user with error %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "fabricID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setupStorageStateForHomeFabricID:", v12);

    }
  }

}

void __61__HMMTRAccessoryServerBrowser_handlePrimaryResidentDataReady__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceMobileAndAllowedAccessoryControl"))
  {
    objc_msgSend(*(id *)(a1 + 32), "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enableNormalOperationWithToken:", v5);

      v3 = objc_msgSend(*(id *)(a1 + 32), "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", 0);
    }
    v6 = (void *)MEMORY[0x242656984](v3);
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Primary resident data is ready. Re-enumerating accessories from storage", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (objc_msgSend(*(id *)(a1 + 32), "pendingMatterStackRestart"))
    {
      v10 = (void *)MEMORY[0x242656984]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Matter stack restart is pending. Deferring re-enumeration", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reenumeratePairedDevices");
    }
  }
}

void __81__HMMTRAccessoryServerBrowser_handleDeviceNoLongerPrimaryResidentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeFabricControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllGetters");

    objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disableNormalOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", v5);

  }
}

void __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setRestartCount:", objc_msgSend(WeakRetained, "restartCount") - 1);
  if (objc_msgSend(WeakRetained, "restartCount"))
  {
    v3 = (void *)MEMORY[0x242656984]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      objc_autoreleasePoolPop(v3);
      goto LABEL_30;
    }
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v6;
    v51 = 2048;
    v52 = objc_msgSend(v4, "restartCount");
    v7 = "%{public}@Storage update handling was deferred - count down %lu";
    v8 = v5;
    v9 = 22;
LABEL_4:
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);

    goto LABEL_5;
  }
  if (objc_msgSend(WeakRetained, "pendingMatterStackRestart"))
  {
    v10 = (void *)MEMORY[0x242656984](objc_msgSend(WeakRetained, "setPendingMatterStackRestart:", 0));
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v13;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Some Matter Items updated in storage, reload the matter stack...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x242656984]();
    v15 = v11;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalidating all local servers to force reload them...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke_325;
    v47[3] = &unk_250F22458;
    v47[4] = v15;
    v48 = *(id *)(a1 + 32);
    objc_msgSend(v15, "invalidateAllDiscoveredServersWithReason:completion:", v18, v47);

  }
  else
  {
    objc_msgSend(WeakRetained, "storage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fabricDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allNodeIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
      v3 = (void *)MEMORY[0x242656984]();
      v4 = WeakRetained;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_5;
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v6;
      v7 = "%{public}@No paired devices found. Not restarting matter stack";
      v8 = v5;
      v9 = 12;
      goto LABEL_4;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(WeakRetained, "storage", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fabricDataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allNodeIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (v30 && (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "isEqual:", &unk_250F3F900) & 1) == 0)
          {
            objc_msgSend(WeakRetained, "nodesAddedToHome");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v30);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v27);
    }

    v32 = (void *)MEMORY[0x242656984]();
    v33 = WeakRetained;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "nodesAddedToHome");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v35;
      v51 = 2112;
      v52 = (uint64_t)v36;
      _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_INFO, "%{public}@CHIP Storage updated. All nodes to add: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v33, "deviceController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isRunning");

    if ((v38 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x242656984]();
      v40 = v33;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v42;
        _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Matter device controller is unexpectedly inactive when storage is updated", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v39);
    }
    objc_msgSend(v33, "setupPairedDevices");
    objc_msgSend(v33, "startDiscoveringAccessoryServers");
  }
LABEL_30:

}

void __66__HMMTRAccessoryServerBrowser_storageDidUpdateData_isLocalChange___block_invoke_325(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "storage", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fabricDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allNodeIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        if (v9 && (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8), "isEqual:", &unk_250F3F900) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "nodesAddedToHome");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v6);
  }

  v11 = (void *)MEMORY[0x242656984]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nodesAddedToHome");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@All nodes to add back after reloading Matter stack: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 32), "nodesAddedToHome");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeFabricControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllGetters");

    objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disableNormalOperation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "enableNormalOperationWithToken:", v20);

    v22 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "fabricID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setupStorageStateForUpdatedHomeFabricID:", v23);

    objc_msgSend(*(id *)(a1 + 32), "setupPairedDevices");
    objc_msgSend(*(id *)(a1 + 32), "startDiscoveringAccessoryServers");
LABEL_15:

    return;
  }
  v24 = (void *)MEMORY[0x242656984]();
  v25 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v27;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Shutting down the stack", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(*(id *)(a1 + 32), "controllerFactoryEnablePerPrimaryResidentConfirmationToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend(*(id *)(a1 + 32), "controllerFactory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "disableNormalOperation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setControllerFactoryEnablePerPrimaryResidentConfirmationToken:", v29);

    goto LABEL_15;
  }
}

void __85__HMMTRAccessoryServerBrowser_createNewSystemCommissionerFabricNodeIDWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "systemCommissionerFabricID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "systemCommissionerFabricID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storageDataSourceForFabricWithID:", v5);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "allNodeIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v7 = +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "containsObject:", v8);

    }
    while ((v9 & 1) != 0);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
  }

}

void __84__HMMTRAccessoryServerBrowser_fetchSystemCommissionerRootCertificateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "systemCommissionerControllerParams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = 0;
  v3 = objc_msgSend(v2, "fetchControllerParamsAllowingNew:nocSigner:controllerWrapper:", 1, &v45, &v44);
  v4 = v45;
  v5 = v44;

  if ((v3 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller parameters could not be fetched. No certs are fetched.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, 0, v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSystemCommissionerNocSigner:", v4);

  objc_msgSend(v5, "startupParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x24BDDB5A8]);
    v15 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(v13, "operationalCertificate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertX509Certificate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v14, "initWithTLVBytes:", v17);

    objc_msgSend(v18, "subject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "nodeID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x242656984]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v20)
    {
      v43 = v5;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fabricID");
        v42 = v4;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "nodeID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v25;
        v48 = 2112;
        v49 = v26;
        v50 = 2112;
        v51 = v28;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Fetching system commissioner certs for fabric ID %@ and controller node ID %@", buf, 0x20u);

        v4 = v42;
      }

      objc_autoreleasePoolPop(v21);
      v29 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "rootCertificate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fabricID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ipk");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "nodeID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *, void *, _QWORD))(v29 + 16))(v29, v30, v31, v32, v34, 0);

      v5 = v43;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v40;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@System commissioner operational cert missing controller node ID. No certs are fetched.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v41 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v41 + 16))(v41, 0, 0, 0, 0, v30);
    }

  }
  else
  {
    v35 = (void *)MEMORY[0x242656984]();
    v36 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v38;
      _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_ERROR, "%{public}@System commissioner controller parameters are not available. No certs are fetched.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    v39 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v39 + 16))(v39, 0, 0, 0, 0, v18);
  }

}

void __59__HMMTRAccessoryServerBrowser__serverFromMTSDevicePairing___block_invoke(uint64_t a1, void *a2)
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
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "vendorID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "productID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544386;
      v11 = v7;
      v12 = 2080;
      v13 = "-[HMMTRAccessoryServerBrowser _serverFromMTSDevicePairing:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Failed to update vendorID to %@ and productID to %@ with error: %@", (uint8_t *)&v10, 0x34u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __136__HMMTRAccessoryServerBrowser_handlePairingCompletionForAccessoryWithNodeID_fabricID_vendorID_productID_configNumber_category_topology___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startLocalStorageMode");

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addPairedNodeID:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorID:forNode:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFabricID:forNode:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProductID:forNode:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCategory:forNode:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfigNumber:forNode:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStaged:forNode:", 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTopology:forNode:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endLocalStorageModeBySyncingToRemote:", 1);

}

void __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  SecKeyRef v5;
  SecKeyRef v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFError *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __CFError *v23;
  CFErrorRef v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  __CFError *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  CFErrorRef error;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  CFErrorRef v60;
  _QWORD v61[2];
  _QWORD v62[3];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE9050];
  v61[0] = *MEMORY[0x24BDE9028];
  v61[1] = v2;
  v3 = *MEMORY[0x24BDE9060];
  v62[0] = *MEMORY[0x24BDE9038];
  v62[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v5 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 32), v4, &error);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v8 = (void *)MEMORY[0x24BDDB5B0];
        objc_msgSend(*(id *)(a1 + 40), "nocSigner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fabricID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nodeID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        objc_msgSend(v8, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v9, v10, v6, v12, v14, 0, &v55);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (__CFError *)v55;

        v17 = (void *)MEMORY[0x242656984]();
        v18 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v15)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "nodeID");
            v23 = (__CFError *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v21;
            v59 = 2112;
            v60 = v23;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for accessory with Node ID %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v50;
            v59 = 2112;
            v60 = v16;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to Generate Operational Certificate for Accessory getting commissioned with error %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          v51 = *(_QWORD *)(a1 + 56);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v51 + 16))(v51, 0, 0, v52);

        }
      }
      else
      {
        v37 = (void *)MEMORY[0x242656984]();
        v38 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "nodeID");
          v42 = (__CFError *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v40;
          v59 = 2112;
          v60 = v42;
          _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Requesting signed operational certificate from Resident device for commissionee with node ID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(void **)(a1 + 40);
        objc_msgSend(v44, "commissioneeAccessoryServer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "nodeID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "commissioneeAccessoryServer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "fabricID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke_314;
        v53[3] = &unk_250F220F8;
        v49 = *(_QWORD *)(a1 + 32);
        v53[4] = *(_QWORD *)(a1 + 40);
        v54 = *(id *)(a1 + 56);
        objc_msgSend(v43, "accessoryServerBrowser:getCommissioningCertificatesForNodeID:fabricID:publicKey:completion:", v44, v46, v48, v49, v53);

      }
    }
    else
    {
      v31 = (void *)MEMORY[0x242656984]();
      v32 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v34;
        _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory getting paired", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      v35 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v35 + 16))(v35, 0, 0, v36);

    }
  }
  else
  {
    v24 = error;
    v25 = (void *)MEMORY[0x242656984]();
    v26 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v28;
      v59 = 2112;
      v60 = v24;
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, v30);

  }
}

void __132__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForAccessoryWithOperationalPublicKey_rootCertificate_completionHandler___block_invoke_314(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x242656984]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v11 && v12)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "commissioneeAccessoryServer");
      v25 = v13;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "nodeID");
      v24 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully received signed Operational Certificate %@ for Accessory with node ID %@ from Owner", buf, 0x20u);

      v14 = v24;
      v13 = v25;

    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v23;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to Get Root/Operational Certificate for accessory from Owner with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __138__HMMTRAccessoryServerBrowser_fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
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
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const __CFDictionary *v100;
  SecKeyRef v101;
  SecKeyRef v102;
  void *v103;
  id v104;
  CFErrorRef v105;
  void *v106;
  id v107;
  NSObject *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  id v131;
  void *v132;
  id v133;
  NSObject *v134;
  void *v135;
  uint64_t v136;
  const __CFDictionary *v137;
  void *v138;
  void *v139;
  id v140;
  NSObject *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  __SecKey *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  NSObject *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  __SecKey *v157;
  const __CFDictionary *v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  CFErrorRef error;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  uint8_t buf[4];
  void *v178;
  __int16 v179;
  uint64_t v180;
  __int16 v181;
  id v182;
  __int16 v183;
  id v184;
  __int16 v185;
  __SecKey *v186;
  __int16 v187;
  uint64_t v188;
  __int16 v189;
  id v190;
  _QWORD v191[2];
  _QWORD v192[4];

  v192[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fabricID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0x24BDDB000uLL;
  if (!v3)
  {
    v164 = 0;
    v166 = 0;
    v11 = 0;
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storageDataForKey:", CFSTR("HMD.MTRPlugin.RootCert"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storageDataForKey:", CFSTR("HMD.MTRPlugin.OperationalCert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v8);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v163);
  objc_msgSend(v9, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = v9;
  objc_msgSend(v9, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fabricID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMFEqualObjects();

  if (!v14)
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "subject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fabricID");
      v22 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v178 = v20;
      v179 = 2112;
      v180 = (uint64_t)v23;
      v181 = 2112;
      v182 = v24;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Cached root/NOC in storage has invalid fabric ID %@ vs expected %@", buf, 0x20u);

      v11 = v22;
    }

    objc_autoreleasePoolPop(v17);
    v3 = 0;
    v6 = 0;
    v8 = 0;
    v11 = 0;
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "keypair:matchesCertificate:", v16, v8);

  if ((v15 & 1) != 0)
  {
    v3 = 0;
    if (!v6)
      goto LABEL_10;
LABEL_17:
    if (v11 && v8)
      goto LABEL_22;
    goto LABEL_10;
  }
  v42 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "publicKey");
  v46 = *(_QWORD *)(a1 + 40);
  v176 = 0;
  v47 = v11;
  objc_msgSend(v42, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v43, v6, v45, v46, v11, 0, &v176);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v176;

  v50 = (void *)MEMORY[0x242656984]();
  v51 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (!v48)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v156;
      v179 = 2112;
      v180 = (uint64_t)v49;
      _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v50);
    v8 = 0;
    v11 = v47;
    v3 = v49;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v178 = v54;
    _os_log_impl(&dword_23E95B000, v53, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate using Root Certificate from storage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v50);
  v8 = (void *)v48;
  v11 = v47;
  v3 = v49;
  if (v6)
    goto LABEL_17;
LABEL_10:
  v161 = v3;
  v25 = v8;
  v26 = v6;
  v27 = v11;
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fabricDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "keyValueStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v26;
  v175 = v27;
  objc_msgSend(v28, "knownFabricInStorage:fabricID:keyPair:controllerNodeID:rootCertificate:", v31, v32, v33, &v175, &v174);
  v34 = v175;

  v6 = v174;
  v8 = v25;
  if (v6)
  {
    v11 = v34;
    if (v34)
    {
      v35 = (void *)MEMORY[0x24BDDB5B0];
      objc_msgSend(*(id *)(a1 + 32), "nocSigner");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "publicKey");
      v39 = *(_QWORD *)(a1 + 40);
      v173 = v161;
      objc_msgSend(v35, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v36, v6, v38, v39, v34, 0, &v173);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v173;

      v8 = (void *)v40;
      v3 = v41;
      goto LABEL_22;
    }
  }
  else
  {
    v11 = v34;
  }
  v3 = v161;
LABEL_22:

  if (v6)
  {
    v4 = 0x24BDDB000;
    if (v11 && v8)
    {
      v55 = v6;
      v56 = (void *)MEMORY[0x242656984]();
      v57 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v178 = v59;
        _os_log_impl(&dword_23E95B000, v58, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Root certificate from storage", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v56);
      if (*(_QWORD *)(a1 + 48))
      {
        v159 = v11;
        v160 = 0;
        v162 = 0;
      }
      else
      {
        v160 = v11;
        v60 = (void *)MEMORY[0x242656984]();
        v61 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v178 = v63;
          _os_log_impl(&dword_23E95B000, v62, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Owner Node ID from storage", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v60);
        v162 = v8;
        v64 = (void *)MEMORY[0x242656984]();
        v65 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v178 = v67;
          _os_log_impl(&dword_23E95B000, v66, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched Owner NOC from storage", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v64);
        v8 = v162;
        v159 = v160;
      }
      v68 = v55;
      goto LABEL_48;
    }
    v164 = v6;
    v166 = v8;
  }
  else
  {
    v164 = 0;
    v166 = v8;
    v4 = 0x24BDDB000;
  }
LABEL_37:
  v69 = (void *)MEMORY[0x242656984]();
  v70 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "certificateIssuerID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v178 = v72;
    v179 = 2112;
    v180 = (uint64_t)v74;
    _os_log_impl(&dword_23E95B000, v71, OS_LOG_TYPE_INFO, "%{public}@Root Certificate not found in storage; generating a new one using issuer ID %@",
      buf,
      0x16u);

    v4 = 0x24BDDB000uLL;
  }

  objc_autoreleasePoolPop(v69);
  v75 = *(void **)(v4 + 1456);
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "certificateIssuerID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = *(_QWORD *)(a1 + 40);
  v172 = v3;
  objc_msgSend(v75, "createRootCertificate:issuerID:fabricID:error:", v76, v78, v79, &v172);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = v172;

  v159 = v11;
  if (*(_QWORD *)(a1 + 48))
  {
    v160 = 0;
    v162 = 0;
    v8 = v166;
    v55 = (id)v80;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)MEMORY[0x242656984]();
    v84 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v86;
      v179 = 2112;
      v180 = v82;
      _os_log_impl(&dword_23E95B000, v85, OS_LOG_TYPE_INFO, "%{public}@Generating a random Node ID %@ for Owner", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v83);
    v87 = (void *)MEMORY[0x24BDDB5B0];
    objc_msgSend(*(id *)(a1 + 32), "nocSigner");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "publicKey");
    v91 = *(_QWORD *)(a1 + 40);
    v171 = v81;
    v55 = (id)v80;
    v160 = (id)v82;
    objc_msgSend(v87, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v88, v80, v90, v91, v82, 0, &v171);
    v162 = (id)objc_claimAutoreleasedReturnValue();
    v92 = v171;

    v93 = (void *)MEMORY[0x242656984]();
    v94 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v95 = objc_claimAutoreleasedReturnValue();
    v8 = v166;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v96;
      v179 = 2112;
      v180 = (uint64_t)v162;
      _os_log_impl(&dword_23E95B000, v95, OS_LOG_TYPE_INFO, "%{public}@Generating NOC for Owner %@", buf, 0x16u);

      v55 = (id)v80;
    }

    objc_autoreleasePoolPop(v93);
    v81 = v92;
  }
  v68 = v164;
  if (!v55)
  {
    v110 = 0;
    goto LABEL_72;
  }
  v3 = v81;
  v4 = 0x24BDDB000;
LABEL_48:
  v97 = *MEMORY[0x24BDE9038];
  v98 = *MEMORY[0x24BDE9050];
  v191[0] = *MEMORY[0x24BDE9028];
  v191[1] = v98;
  v99 = *MEMORY[0x24BDE9060];
  v192[0] = v97;
  v192[1] = v99;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v192, v191, 2);
  v100 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v101 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 56), v100, &error);
  v164 = v68;
  v167 = v55;
  v158 = v100;
  if (!v101)
  {
    v105 = error;
    v106 = (void *)MEMORY[0x242656984]();
    v107 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v109;
      v179 = 2112;
      v180 = (uint64_t)v105;
      _os_log_impl(&dword_23E95B000, v108, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v106);

    goto LABEL_68;
  }
  v102 = v101;
  v103 = *(void **)(a1 + 48);
  if (v103)
  {
    v104 = v103;
  }
  else
  {
    if (*(_BYTE *)(a1 + 80))
    {
      v111 = v160;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
      v111 = (id)objc_claimAutoreleasedReturnValue();
    }
    v104 = v111;
    v112 = (void *)MEMORY[0x242656984]();
    v113 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      v178 = v115;
      v179 = 2080;
      v180 = v116;
      v181 = 2112;
      v182 = v104;
      _os_log_impl(&dword_23E95B000, v114, OS_LOG_TYPE_INFO, "%{public}@Generating a Random Node ID for %s Controller as %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v112);
  }
  v117 = (void *)MEMORY[0x242656984]();
  v118 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v102;
    v121 = v117;
    v122 = v104;
    v123 = v3;
    v124 = v8;
    v125 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "nocSigner");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544898;
    v178 = v120;
    v179 = 2080;
    v180 = v125;
    v8 = v124;
    v3 = v123;
    v104 = v122;
    v117 = v121;
    v102 = v157;
    v181 = 2112;
    v182 = v126;
    v183 = 2112;
    v184 = v167;
    v185 = 2112;
    v186 = v157;
    v187 = 2112;
    v188 = v127;
    v189 = 2112;
    v190 = v104;
    _os_log_impl(&dword_23E95B000, v119, OS_LOG_TYPE_INFO, "%{public}@Generating a OP cert for %s Controller with nocSigner %@, rootCert = %@, pubKeyAsSecKey %@, fabricID %@, nodeID %@", buf, 0x48u);

    v4 = 0x24BDDB000uLL;
  }

  objc_autoreleasePoolPop(v117);
  v128 = *(void **)(v4 + 1456);
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = *(_QWORD *)(a1 + 40);
  v169 = v3;
  objc_msgSend(v128, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v129, v167, v102, v130, v104, 0, &v169);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v169;

  if (!v110)
  {
    v3 = v131;
LABEL_68:
    v132 = (void *)MEMORY[0x242656984]();
    v133 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v134 = objc_claimAutoreleasedReturnValue();
    v137 = v158;
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v138;
      v179 = 2112;
      v180 = (uint64_t)v3;
      _os_log_impl(&dword_23E95B000, v134, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate %@", buf, 0x16u);

    }
    v110 = 0;
    goto LABEL_71;
  }
  v132 = (void *)MEMORY[0x242656984]();
  v133 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v134 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    v178 = v135;
    v179 = 2080;
    v180 = v136;
    _os_log_impl(&dword_23E95B000, v134, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for %s Controller", buf, 0x16u);

  }
  v3 = v131;
  v137 = v158;
LABEL_71:

  objc_autoreleasePoolPop(v132);
  v81 = v3;
  v55 = v167;
LABEL_72:
  v168 = v8;
  if (*(_QWORD *)(a1 + 48))
  {
    v139 = (void *)MEMORY[0x242656984]();
    v140 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138544130;
      v178 = v142;
      v179 = 2112;
      v180 = (uint64_t)v55;
      v181 = 2112;
      v182 = v110;
      v183 = 2080;
      v184 = v143;
      _os_log_impl(&dword_23E95B000, v141, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@ to %s Controller", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v139);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v144 = v160;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "ipkForFabricID:forPairing:", *(_QWORD *)(a1 + 40), 1);
    v146 = (__SecKey *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setRootCert:", v55);

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setOperationalCert:", v162);

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v160;
    objc_msgSend(v149, "setControllerNodeID:", v160);

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setOwnerIPK:", v146);

    v151 = (void *)MEMORY[0x242656984]();
    v152 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v153 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138544642;
      v178 = v154;
      v179 = 2112;
      v180 = (uint64_t)v55;
      v181 = 2112;
      v182 = v110;
      v183 = 2112;
      v184 = v160;
      v185 = 2112;
      v186 = v146;
      v187 = 2080;
      v188 = v155;
      _os_log_impl(&dword_23E95B000, v153, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@, Owner NodeID %@, and IPK %@ to %s Controller", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v151);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke(uint64_t a1)
{
  const char *v2;
  BOOL v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  char *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  const char *v39;
  char v40;
  BOOL v41;
  _QWORD v42[4];
  char *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_loadFabricKeyPairs") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Fabric key pairs are missing. Declining to fetch certificates.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(_QWORD *)(a1 + 72);
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 1);
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 36, 0, 0, 0, v4);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((isFeatureMatteriPhoneOnlyPairingControlEnabled() & 1) == 0)
  {
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(unsigned __int8 *)(a1 + 80);
    v23 = *(_QWORD *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 56);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_300;
    v42[3] = &unk_250F22030;
    v43 = (char *)*(id *)(a1 + 72);
    objc_msgSend(v20, "fetchCommissioningCertificatesForSharedAdminWithDeviceNodeID:forOwner:publicKey:fabricID:completionHandler:", v21, v22, v23, v24, v42);
    v4 = v43;
    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 80))
    v2 = "Owner";
  else
    v2 = "non-owner";
  v3 = *(_QWORD *)(a1 + 40) != 0;
  objc_msgSend(*(id *)(a1 + 32), "appleHomeFabricWithID:", *(_QWORD *)(a1 + 56));
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v25;
      v46 = 2080;
      v47 = v2;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational certificate for itself", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if (v4)
    {
      v26 = *(void **)(a1 + 56);
      if (v26)
      {
        if (!objc_msgSend(v26, "isEqualToNumber:", &unk_250F3F900))
          goto LABEL_10;
      }
    }
    v27 = (void *)MEMORY[0x242656984]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v45 = v30;
      v46 = 2112;
      v47 = v4;
      v48 = 2112;
      v49 = v31;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot process request without fabric data created for fabric %@, fabricID %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v16 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v19 = (void *)v18;
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v16 + 16))(v16, 0, 0, 0, 0, v18);

    goto LABEL_16;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v45 = v10;
    v46 = 2080;
    v47 = v2;
    v48 = 2112;
    v49 = v11;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Received request from %s controller to generate Operational Certificate for Node ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
LABEL_10:
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_304;
  v32[3] = &unk_250F22080;
  v32[4] = *(_QWORD *)(a1 + 32);
  v4 = v4;
  v33 = v4;
  v38 = *(id *)(a1 + 72);
  v40 = *(_BYTE *)(a1 + 80);
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 48);
  v36 = *(id *)(a1 + 64);
  v39 = v2;
  v41 = v3;
  v37 = *(id *)(a1 + 56);
  objc_msgSend(v4, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v32);

LABEL_16:
}

uint64_t __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_300(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_304(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  char v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot process request without fabric data for fabric %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(_QWORD *)(a1 + 80);
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 36, 0, 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, 0, 0, v12);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceMobileAndAllowedAccessoryControl")
      && *(_BYTE *)(a1 + 96)
      && !*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_305;
      block[3] = &unk_250F240D8;
      v18 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v31 = v18;
      v32 = *(id *)(a1 + 80);
      dispatch_async(v17, block);

      v16 = v31;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_306;
      v19[3] = &unk_250F22058;
      v20 = *(id *)(a1 + 40);
      v21 = *(id *)(a1 + 56);
      v22 = *(id *)(a1 + 48);
      v14 = *(id *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 32);
      v23 = v14;
      v24 = v15;
      v27 = *(_QWORD *)(a1 + 88);
      v28 = *(_BYTE *)(a1 + 97);
      v29 = *(_BYTE *)(a1 + 96);
      v25 = *(id *)(a1 + 72);
      v26 = *(id *)(a1 + 80);
      dispatch_async(v13, v19);

      v16 = v20;
    }

  }
}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_305(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rootCert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentDeviceNodeData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "operationalCertificate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "residentNodeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "fabricData");
    v22 = v2;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ipk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Returning certificates fetched from disk: Root Certificate %@, Operational Certificate %@, Resident NodeID %@, and IPK %@", buf, 0x34u);

    v2 = v22;
  }

  objc_autoreleasePoolPop(v2);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "fabricData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rootCert");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "currentDeviceNodeData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "operationalCertificate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fabricData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "residentNodeID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fabricData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ipk");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, void *, _QWORD))(v12 + 16))(v12, v14, v16, v18, v20, 0);

}

void __149__HMMTRAccessoryServerBrowser_fetchCertificatesForMatterNodeWithCommissionerNodeID_commissioneeNodeID_forOwner_publicKey_fabricID_completionHandler___block_invoke_306(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  SecKeyRef v8;
  SecKeyRef v9;
  void *v10;
  id v11;
  void *v12;
  __CFError *v13;
  CFErrorRef v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  __CFError *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  __SecKey *v40;
  __CFError *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  __CFError *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  __SecKey *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const __CFDictionary *v69;
  id v70;
  CFErrorRef error;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  CFErrorRef v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  SecKeyRef v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  id v85;
  __int16 v86;
  void *v87;
  _QWORD v88[2];
  _QWORD v89[4];

  v89[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "fabricData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootCert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_33;
  }
  v4 = *MEMORY[0x24BDE9038];
  v5 = *MEMORY[0x24BDE9050];
  v88[0] = *MEMORY[0x24BDE9028];
  v88[1] = v5;
  v6 = *MEMORY[0x24BDE9060];
  v89[0] = v4;
  v89[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v8 = SecKeyCreateWithData(*(CFDataRef *)(a1 + 40), v7, &error);
  if (!v8)
  {
    v14 = error;
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v18;
      v74 = 2112;
      v75 = v14;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert Public Key Data to SecKey with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);

    v13 = 0;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = *(void **)(a1 + 48);
  if (v10)
    goto LABEL_4;
  v19 = *(void **)(a1 + 56);
  if (v19)
  {
    if ((objc_msgSend(v19, "isEqualToNumber:", &unk_250F3F900) & 1) == 0)
    {
      v20 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "fabricData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "residentNodeID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v20, "isEqualToNumber:", v22);

      if ((v20 & 1) == 0)
      {
        v10 = *(void **)(a1 + 56);
LABEL_4:
        v11 = v10;
        goto LABEL_15;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", +[HMMTRUtilities randomNodeID](HMMTRUtilities, "randomNodeID"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x242656984]();
  v25 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(__CFError **)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    v73 = v27;
    v74 = 2080;
    v75 = v28;
    v76 = 2112;
    v77 = v23;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Generating a Random Node ID for %s Controller as %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v24);
  v11 = (id)v23;
LABEL_15:
  v69 = v7;
  if (*(_BYTE *)(a1 + 96))
  {
    v29 = 0;
LABEL_17:
    v30 = 0;
    goto LABEL_23;
  }
  v31 = *(unsigned __int8 *)(a1 + 97);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v31)
    objc_msgSend(v32, "accessoryAdministerPrivilegeCATID:", 0);
  else
    objc_msgSend(v32, "accessoryOperatePrivilegeCATID:", 0);
  v29 = objc_claimAutoreleasedReturnValue();

  if (!v29)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  v68 = (void *)v29;
  v34 = (void *)MEMORY[0x242656984]();
  v35 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v67 = v34;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v11;
    v39 = v3;
    v40 = v9;
    v41 = *(__CFError **)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 64), "nocSigner");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138545154;
    v73 = v37;
    v74 = 2080;
    v75 = v41;
    v9 = v40;
    v3 = v39;
    v11 = v38;
    v76 = 2112;
    v77 = (uint64_t)v42;
    v78 = 2112;
    v79 = v3;
    v80 = 2112;
    v81 = v9;
    v82 = 2112;
    v83 = v43;
    v84 = 2112;
    v85 = v38;
    v86 = 2112;
    v87 = v30;
    _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Generating a OP cert for %s with nocSigner %@, rootCert = %@, pubKeyAsSecKey %@, fabricID %@, nodeID %@ CATs = %@", buf, 0x52u);

    v34 = v67;
  }

  objc_autoreleasePoolPop(v34);
  v44 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(*(id *)(a1 + 64), "nocSigner");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *(_QWORD *)(a1 + 72);
  v70 = 0;
  objc_msgSend(v44, "createOperationalCertificate:signingCertificate:operationalPublicKey:fabricID:nodeID:caseAuthenticatedTags:error:", v45, v3, v9, v46, v11, v30, &v70);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFError *)v70;

  if (!v12)
  {
    v7 = v69;
LABEL_29:
    v47 = (void *)MEMORY[0x242656984]();
    v48 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v52;
      v74 = 2112;
      v75 = v13;
      _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate Operational Certificate %@", buf, 0x16u);

    }
    v12 = 0;
    goto LABEL_32;
  }
  v47 = (void *)MEMORY[0x242656984]();
  v48 = *(id *)(a1 + 64);
  HMFGetOSLogHandle();
  v49 = objc_claimAutoreleasedReturnValue();
  v7 = v69;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *(__CFError **)(a1 + 88);
    *(_DWORD *)buf = 138543618;
    v73 = v50;
    v74 = 2080;
    v75 = v51;
    _os_log_impl(&dword_23E95B000, v49, OS_LOG_TYPE_INFO, "%{public}@Successfully generated Operational Certificate for %s Controller", buf, 0x16u);

  }
LABEL_32:

  objc_autoreleasePoolPop(v47);
LABEL_33:
  if (*(_QWORD *)(a1 + 48))
  {
    v53 = (void *)MEMORY[0x242656984]();
    v54 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(void **)(a1 + 88);
      *(_DWORD *)buf = 138544130;
      v73 = v56;
      v74 = 2112;
      v75 = (CFErrorRef)v3;
      v76 = 2112;
      v77 = (uint64_t)v12;
      v78 = 2080;
      v79 = v57;
      _os_log_impl(&dword_23E95B000, v55, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@ to %s Controller", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v53);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "ipk");
    v59 = (__SecKey *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fabricData");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "residentNodeID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = (void *)MEMORY[0x242656984]();
    v63 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 138544642;
      v73 = v65;
      v74 = 2112;
      v75 = (CFErrorRef)v3;
      v76 = 2112;
      v77 = (uint64_t)v12;
      v78 = 2112;
      v79 = v61;
      v80 = 2112;
      v81 = v59;
      v82 = 2080;
      v83 = v66;
      _os_log_impl(&dword_23E95B000, v64, OS_LOG_TYPE_INFO, "%{public}@Returning Root Certificate %@, Operational Certificate %@, Resident NodeID %@, and IPK %@ to %s Controller", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v62);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

void __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke_2;
  v7[3] = &unk_250F22458;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __74__HMMTRAccessoryServerBrowser__reportAccessoriesKnownToSystemCommissioner__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  id obj;
  id obja;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v48 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "_serverFromMTSDevicePairing:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v5);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "discoveredAccessoryServers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v44;
    *(_QWORD *)&v12 = 138543618;
    v35 = v12;
    obj = v2;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        if (objc_msgSend(v16, "isKnownToSystemCommissioner", v35)
          && (objc_msgSend(v2, "containsObject:", v16) & 1) == 0)
        {
          v17 = v10;
          v18 = (void *)MEMORY[0x242656984]();
          v19 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v35;
            v53 = v21;
            v54 = 2112;
            v55 = v16;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Invalidating stale discovered server %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v22 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "invalidateAccessoryServer:reason:", v16, v23);

          v10 = v17;
          v2 = obj;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v13);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obja = v2;
  v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v40;
    *(_QWORD *)&v25 = 138543618;
    v36 = v25;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
        if (objc_msgSend(*(id *)(a1 + 40), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_, v36))
        {
          v30 = (void *)MEMORY[0x242656984]();
          v31 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v53 = v33;
            v54 = 2112;
            v55 = v29;
            _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_INFO, "%{public}@Reporting SC server %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), v29, 0, 0);

        }
      }
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v26);
  }

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD v34[2];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD block[5];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "systemCommissionerControllerWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x242656984]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Connecting to the commissionee to complete commissioning...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDDB598], "deviceWithNodeID:controller:", *(_QWORD *)(a1 + 56), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x24BDDB580]);
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDevice:endpointID:queue:", v10, &unk_250F3F900, v12);

      if (v13)
      {
        v14 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPairingStep:", 21));
        v15 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v17;
          _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending commissioning complete...", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_293;
        v33[3] = &unk_250F22008;
        v33[4] = *(_QWORD *)(a1 + 32);
        v18 = (id *)v34;
        v34[0] = *(id *)(a1 + 48);
        v34[1] = v2;
        v36 = *(id *)(a1 + 64);
        v35 = v10;
        objc_msgSend(v13, "commissioningCompleteWithCompletion:", v33);

      }
      else
      {
        v28 = (void *)MEMORY[0x242656984]();
        v29 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v31;
          _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create GeneralCommissioning cluster object", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        v32 = *(NSObject **)(a1 + 48);
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_292;
        v37[3] = &unk_250F22768;
        v37[4] = v2;
        v18 = &v38;
        v38 = *(id *)(a1 + 64);
        dispatch_async(v32, v37);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x242656984]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v44 = v25;
        v45 = 2112;
        v46 = v26;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device (%@) to complete commissioning", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v27 = *(NSObject **)(a1 + 48);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_290;
      v39[3] = &unk_250F22768;
      v39[4] = v2;
      v40 = *(id *)(a1 + 64);
      dispatch_async(v27, v39);

    }
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v44 = v19;
      v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to start system commissioner controller for fabric ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v21 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_288;
    block[3] = &unk_250F22768;
    block[4] = v2;
    v42 = *(id *)(a1 + 64);
    dispatch_async(v21, block);

  }
}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_288(uint64_t a1)
{
  id v2;

  +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 20, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_290(uint64_t a1)
{
  id v2;

  +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 20, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_292(uint64_t a1)
{
  id v2;

  +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 20, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_293(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_2;
  objc_msgSend(v5, "errorCode");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_7;
  v18 = (void *)v17;
  objc_msgSend(v5, "errorCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", &unk_250F3F900);

  if ((v20 & 1) == 0)
  {
LABEL_2:
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v10;
      v37 = 2112;
      v38 = v6;
      v39 = 2112;
      v40 = v11;
      v41 = 2112;
      v42 = v12;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Commissioning complete failed with %@ (%@: %@)", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_294;
    block[3] = &unk_250F240D8;
    v14 = v6;
    v15 = *(_QWORD *)(a1 + 48);
    v32 = v14;
    v33 = v15;
    v34 = *(id *)(a1 + 64);
    dispatch_async(v13, block);

    v16 = v32;
  }
  else
  {
LABEL_7:
    v21 = (void *)MEMORY[0x242656984]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v24;
      _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Commissioning complete responded. Fetching serial number.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_295;
    v28[3] = &unk_250F21FE0;
    v27 = *(void **)(a1 + 40);
    v28[4] = *(_QWORD *)(a1 + 32);
    v29 = v27;
    v30 = *(id *)(a1 + 64);
    objc_msgSend(v25, "fetchSerialNumberWithCallbackQueue:completionHandler:", v26, v28);

    v16 = v29;
  }

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_294(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (a1[4])
    +[HMMTRAccessoryPairingEndContext mtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "mtrContextWithStep:error:", 21);
  else
    +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 21, a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  if (!v3)
    v3 = a1[5];
  v4 = (id)v2;
  (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], 0, v3);

}

void __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory returned Serial Number as %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_297;
    block[3] = &unk_250F22768;
    v12 = &v18;
    v13 = *(NSObject **)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v17 = v5;
    dispatch_async(v13, block);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve serial number: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_296;
    v19[3] = &unk_250F22988;
    v12 = &v20;
    v15 = *(NSObject **)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    dispatch_async(v15, v19);
  }

}

uint64_t __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_296(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __155__HMMTRAccessoryServerBrowser_finishSystemCommissionerFabricCommissioningWithFabricID_rootCACert_ipk_controllerNodeID_commissioneeNodeID_queue_completion___block_invoke_297(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

void __146__HMMTRAccessoryServerBrowser__prepareForPairingWithSetupPayload_fabricID_controllerWrapper_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke(id *a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (!v8)
  {
    if (a3)
    {
      v13 = a1[4];
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_279;
      v41[3] = &unk_250F229B0;
      v41[4] = v13;
      v44 = a1[7];
      v42 = v7;
      v43 = a1[5];
      objc_msgSend(v13, "_setupAndPersistStorageStateForHomeFabricID:completion:", v42, v41);

      goto LABEL_28;
    }
    v14 = v7;
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToNumber:", &unk_250F3F900))
    {
      v21 = (uint64_t)v15;
    }
    else
    {
      if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
      {
        objc_msgSend(a1[6], "fabricData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rootCert");
      }
      else
      {
        objc_msgSend(a1[4], "storage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "rootCertForCurrentFabric");
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v18);
      objc_msgSend(v19, "issuer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fabricID");
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x242656984]();
      v23 = a1[4];
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v21)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v37;
          v47 = 2112;
          v48 = (uint64_t)v19;
          _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain fabric ID for pairing from root cert %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v38 = a1[7];
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v38 + 2))(v38, 0, 0, v39);

        goto LABEL_27;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v26;
        v47 = 2112;
        v48 = v21;
        _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@Using fabric ID %@ for pairing from retrieved cert", buf, 0x16u);

        v22 = v40;
      }

      objc_autoreleasePoolPop(v22);
    }
    objc_msgSend(a1[4], "storage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "prepareStorageForFabricID:", v21);

    objc_msgSend(a1[4], "_currentHomeFabricDeviceControllerStartupParams");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_20;
    objc_msgSend(a1[4], "homeFabricControllers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "storage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allFabricIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wrapperWithFabricID:startupParams:allFabricIDs:", v21, v18, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(a1[4], "_prepareForPairingWithSetupPayload:fabricID:controllerWrapper:hasPriorSuccessfulPairing:category:completionHandler:", a1[5], v21, v19, 0, 0, a1[7]);
    }
    else
    {
LABEL_20:
      v32 = (void *)MEMORY[0x242656984]();
      v33 = a1[4];
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v35;
        v47 = 2112;
        v48 = v21;
        _os_log_impl(&dword_23E95B000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to get controller wrapper for the fabric ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v36 = a1[7];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v36 + 2))(v36, 0, 0, v19);
    }
    v17 = (void *)v21;
LABEL_27:

    goto LABEL_28;
  }
  v9 = (void *)MEMORY[0x242656984]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v12;
    v47 = 2112;
    v48 = (uint64_t)v8;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch certificates required for pairing with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  (*((void (**)(void))a1[7] + 2))();
LABEL_28:

}

void __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_281(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2;
  block[3] = &unk_250F240D8;
  v9 = a1[6];
  v7 = a1[5];
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_282(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2_283;
  v7[3] = &unk_250F21F90;
  v10 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 56);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2_283(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __129__HMMTRAccessoryServerBrowser_prepareForPairingWithSetupPayload_fabric_fabricID_owner_ownerCertFetchSupported_completionHandler___block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup storage for new fabric. Aborting pairing prep.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_currentHomeFabricDeviceControllerStartupParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeFabricControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allFabricIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wrapperWithFabricID:startupParams:allFabricIDs:", v10, v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_prepareForPairingWithSetupPayload:fabricID:controllerWrapper:hasPriorSuccessfulPairing:category:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v14, 0, 0, *(_QWORD *)(a1 + 56));
  }

}

void __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device(%@), cleaning up locally", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke_278;
    v13[3] = &unk_250F21EC8;
    v14 = *(_OWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v5, "unpairDevice:completionHandler:", v12, v13);

  }
}

void __49__HMMTRAccessoryServerBrowser__deleteOldPairings__block_invoke_278(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Notified device(%@) of removal, cleaning up locally. Error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __81__HMMTRAccessoryServerBrowser_didFinishPairingAccessoryServer_operationDisabled___block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@stopAccessoryPairingWithCompletion completed, error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __47__HMMTRAccessoryServerBrowser_restartDiscovery__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restartDiscovery");

}

void __82__HMMTRAccessoryServerBrowser_handlePairingForThreadAccessoryWithFabricID_nodeID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateIfNotFabricID:rediscoverAccessories:", *(_QWORD *)(a1 + 40), 0);
  if (objc_msgSend(*(id *)(a1 + 32), "canEstablishConnectionForNodeID:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "threadRadioManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentFabricID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startThreadRadioForHomeWithFabricID:", v2);

  }
}

void __68__HMMTRAccessoryServerBrowser_addFabricWithActiveClientForFabricID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "addFabricWithActiveClients:", *(_QWORD *)(a1 + 40)));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Added active client for pairing into fabric ID %@, currently active clients: %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __95__HMMTRAccessoryServerBrowser_setupStorageStateWithoutRediscoveringAccessoriesForHomeFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __88__HMMTRAccessoryServerBrowser_setupStorageStateAndRediscoverAccessoriesForHomeFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForUpdatedHomeFabricID:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__HMMTRAccessoryServerBrowser_setupStorageStateAfterCertFetchForHomeFabricID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateAfterCertFetchForHomeFabricID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForHomeFabricID:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __64__HMMTRAccessoryServerBrowser_setupStorageStateForHomeFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupStorageStateForHomeFabricID:", *(_QWORD *)(a1 + 40));
}

void __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating new fabric data for fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "_createFabricKeyPairsIfAbsent") & 1) != 0)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_275;
    v14[3] = &unk_250F228C0;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v15, "createNewFabricIdentityWithCompletion:", v14);

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Key pairs are not present. Cannot move forward.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_275(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cert for fabric ID: %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  v9 = (void *)MEMORY[0x242656984]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully created fabric data for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_276;
  v17[3] = &unk_250F22768;
  v15 = *(id *)(a1 + 48);
  v18 = v3;
  v19 = v15;
  v16 = v3;
  dispatch_async(v14, v17);

}

uint64_t __71__HMMTRAccessoryServerBrowser_createNewFabricDataForFabric_completion___block_invoke_276(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Creating new fabric data for fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "_createFabricKeyPairsIfAbsent") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharedAdmin:", 0);

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFabricCreationInProgress:", 1);

    objc_msgSend(*(id *)(a1 + 32), "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_273;
    v17[3] = &unk_250F228C0;
    v10 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v9, "fetchCertForFabricWithID:isOwner:forPairing:forceFetchFromResident:completion:", v18, 1, 1, 0, v17);

  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Key pairs are not present. Cannot move forward.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_273(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cert for fabric ID: %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFabricCreationInProgress:", 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_274;
    v12[3] = &unk_250F23CD0;
    v12[4] = v10;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "_setupAndPersistStorageStateForHomeFabricID:completion:", v11, v12);

  }
}

void __73__HMMTRAccessoryServerBrowser_createNewFabricDataForFabricID_completion___block_invoke_274(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFabricCreationInProgress:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__HMMTRAccessoryServerBrowser_createNewFabricIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_getRandomFabricId");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Generated new fabric ID: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__HMMTRAccessoryServerBrowser_announceOtaProviderForNodeID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@OTA Announce failed for server %@: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@OTA Announce completed for server: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Access Control List on the accessory with error %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated Access Control List on accessory %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "nodesWithPendingACLOverwrite");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "nodeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __79__HMMTRAccessoryServerBrowser__updateAccessoryControlListForServer_completion___block_invoke_272(uint64_t a1, void *a2)
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v9 = "%{public}@Failed to update Access Control List on the accessory with error %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v15, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v12;
    v9 = "%{public}@Updated Access Control List on accessory %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v13, v14);

}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138544386;
      v11 = v7;
      v12 = 2080;
      v13 = "-[HMMTRAccessoryServerBrowser _createCHIPAccessoryForNodeID:ifPaired:fatalError:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Failed to update vendorID to %@ and productID to %@ with error: %@", (uint8_t *)&v10, 0x34u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_270(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
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
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update ACL on accessory with error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __81__HMMTRAccessoryServerBrowser__createCHIPAccessoryForNodeID_ifPaired_fatalError___block_invoke_271(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Enumerated HAP Services for server :%@ with Error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Not sending an OTA announcement or setting this device as a OTA provider", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __56__HMMTRAccessoryServerBrowser__reenumeratePairedDevices__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Re-enumeration completed for server %@, error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __49__HMMTRAccessoryServerBrowser_setupPairedDevices__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupPairedDevices");
}

uint64_t __56__HMMTRAccessoryServerBrowser__isNodeIDPaired_fabricID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "allNodeIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(v3, "fabricID");
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  return v5 ^ 1u;
}

uint64_t __65__HMMTRAccessoryServerBrowser__isDeviceIDPaired_nodeID_fabricID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "allNodeIDs");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", v9, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v10, "hasPrefix:", v11);

        if ((_DWORD)v10)
        {
          **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v9);
          objc_msgSend(v3, "fabricID");
          v12 = 0;
          **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedNodeIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138543618;
    v22 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "storage", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isStagedForNode:", v10);

        if (v12)
        {
          v13 = (void *)MEMORY[0x242656984]();
          v14 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v30 = v16;
            v31 = 2112;
            v32 = v10;
            _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Deleting staged accessory for nodeID %@...", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          objc_msgSend(*(id *)(a1 + 32), "deviceController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v10, "unsignedLongLongValue");
          objc_msgSend(*(id *)(a1 + 32), "workQueue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_266;
          v24[3] = &unk_250F21EF0;
          v24[4] = *(_QWORD *)(a1 + 32);
          v24[5] = v10;
          objc_msgSend(v17, "getBaseDevice:queue:completionHandler:", v18, v19, v24);

          objc_msgSend(v23, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeRecordsForNodeIDs:systemCommissionerFabric:", v23, objc_msgSend(v21, "isSystemCommissionerFabric"));

}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_266(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to get connected device(%@), cleaning up locally", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_267;
    v13[3] = &unk_250F21EC8;
    v14 = *(_OWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v5, "unpairDevice:completionHandler:", v12, v13);

  }
}

void __52__HMMTRAccessoryServerBrowser__cleanupStagedServers__block_invoke_267(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Notified device(%@) of removal, cleaning up locally. Error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __69__HMMTRAccessoryServerBrowser_waitForDeviceControllerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSystemCommissionerMode") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "storage"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "fabricID"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v2,
        !v8))
  {
    v4 = 0;
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "homeFabricControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedWrapperWithFabricID:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRunning"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceControllerHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x242656B10](*(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __47__HMMTRAccessoryServerBrowser_deviceController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "deviceControllerHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "deviceControllerHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__HMMTRAccessoryServerBrowser__cleanupDiscoveredServersWithReason_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 128);
      v12 = 138543618;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Discovered Servers: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 240);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Staged Servers: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __75__HMMTRAccessoryServerBrowser_handleThreadNetworkStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling thread network state changed notification", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "handleThreadRadioStateChanged");
}

void __70__HMMTRAccessoryServerBrowser_abortAndSuspendAllOperationsWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "connectionRequestSuspended"))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v5;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Connection requests already suspended", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnectionRequestSuspended:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveConnections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10++), "abortAllOperationsWithReason:", *(_QWORD *)(a1 + 40));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "fabricsWithPendingConnections", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "abortAllOperationsWithReason:", *(_QWORD *)(a1 + 40));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "threadSoftwareUpdateController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suspendOperations");

  }
}

void __72__HMMTRAccessoryServerBrowser_abortOperationsForAccessoryServer_reason___block_invoke(uint64_t a1)
{
  HMMTRAccessoryConnectionRequest *v2;
  void *v3;
  HMMTRAccessoryConnectionRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = [HMMTRAccessoryConnectionRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMTRAccessoryConnectionRequest initWithQueue:server:highPriority:completion:](v2, "initWithQueue:server:highPriority:completion:", v3, *(_QWORD *)(a1 + 40), 0, &__block_literal_global_254);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "fabricsWithActiveConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "abortOperationsForConnectionRequest:reason:", v4, *(_QWORD *)(a1 + 48)) & 1) != 0)break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "fabricsWithPendingConnections", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
LABEL_11:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13), "abortOperationsForConnectionRequest:reason:", v4, *(_QWORD *)(a1 + 48)) & 1) != 0)break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v11)
            goto LABEL_11;
          break;
        }
      }
    }
  }

}

void __85__HMMTRAccessoryServerBrowser_connectToAccessoryWhenAllowed_highPriority_completion___block_invoke(uint64_t a1)
{
  HMMTRAccessoryConnectionRequest *v2;
  void *v3;
  HMMTRAccessoryConnectionRequest *v4;

  v2 = [HMMTRAccessoryConnectionRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMTRAccessoryConnectionRequest initWithQueue:server:highPriority:completion:](v2, "initWithQueue:server:highPriority:completion:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_establishConnectionWhenAllowedWithAccessoryConnectionRequest:", v4);
}

void __84__HMMTRAccessoryServerBrowser_createMatterOperationalKeyPairIfAbsentWithCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_createOperationalKeyPairIfAbsent");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hapErrorWithCode:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

void __59__HMMTRAccessoryServerBrowser_commitStagedAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Committing staged server: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "commitStagedPairing");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerPairedAccessoryWithIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "stagedAccessoryServers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __80__HMMTRAccessoryServerBrowser__invalidateAccessoryServer_reason_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowser:didRemoveAccessoryServer:error:matterPairingEndContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __79__HMMTRAccessoryServerBrowser_invalidateAccessoryServer_reason_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_invalidateAccessoryServer:reason:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __83__HMMTRAccessoryServerBrowser_invalidateAllDiscoveredServersWithReason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = (void *)MEMORY[0x242656984]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Disabling and invalidating all servers...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "_allServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isKnownToSystemCommissioner") & 1) == 0)
        {
          if (objc_msgSend(v11, "pairedState") && (objc_msgSend(v11, "removalInProgress") & 1) == 0)
          {
            v16 = (void *)MEMORY[0x242656984]();
            v17 = v3;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v26 = v19;
              v27 = 2112;
              v28 = v11;
              _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Disabling server: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v16);
            objc_msgSend(v11, "disable");
          }
          else
          {
            v12 = (void *)MEMORY[0x242656984]();
            v13 = v3;
            HMFGetOSLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v26 = v15;
              v27 = 2112;
              v28 = v11;
              _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring unpaired server: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v12);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "_cleanupDiscoveredServersWithReason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HMMTRAccessoryServerBrowser_handleHomeAddedAccessoryWithNodeID_fabric___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nodesAddedToHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory with node ID %@ was added to home with fabric %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  result = objc_msgSend(*(id *)(a1 + 32), "_setupPairedDevices");
  if (*(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "getNOCFromResidentForSharedUserForFabric:");
  return result;
}

void __66__HMMTRAccessoryServerBrowser_nodeIDForFabricID_deviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeIDForFabricID:deviceIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __102__HMMTRAccessoryServerBrowser_accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
  v7[3] = &unk_250F21DE0;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v7[4] = v5;
  v8 = v6;
  objc_msgSend(v2, "_accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:", v3, v7);

}

void __116__HMMTRAccessoryServerBrowser_readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "readPairingWindowStatusWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve accessory server for node %@ to read commissioning window status, error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_2;
  v4[3] = &unk_250F21E08;
  v7 = *(_QWORD *)(a1 + 56);
  v4[4] = v2;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:", v3, v4);

}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(double *)(a1 + 56);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_3;
    v13[3] = &unk_250F22AA0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "openPairingWindowWithPINForDuration:completionHandler:", v13, v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve accessory server for node %@ to open commissioning window, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __119__HMMTRAccessoryServerBrowser_openCommissioningWindowForSystemCommissionerDeviceWithNodeID_duration_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (*v10)(void);
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_5;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDDB810], "setupPayloadWithOnboardingPayload:error:", v5, &v15);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7)
  {

    v9 = (void *)v7;
LABEL_5:
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x242656984]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v14;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert onboarding payload to setup payload", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_9:
  v10();

}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
  v4[3] = &unk_250F21DE0;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_accessoryServerForSystemCommissionerDeviceWithNodeID:completionHandler:", v5, v4);

}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeRecordsForSystemCommissionerFabricNode:", *(_QWORD *)(a1 + 40));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v3)
  {
    objc_msgSend(v3, "setRemovalInProgress:", 1);
    v5 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_3;
    v15[3] = &unk_250F22458;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v16 = v6;
    v17 = v7;
    v8 = (void *)MEMORY[0x242656B10](v15);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_4;
    v11[3] = &unk_250F21DB8;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v6;
    v14 = v8;
    v10 = v8;
    objc_msgSend(v13, "fetchPairingsWithCompletionHandler:", v11);

  }
}

uint64_t __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "disable");
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateAccessoryServer:reason:", v4, v5);

  }
  return objc_msgSend(*(id *)(a1 + 40), "setSystemCommissionerMode:", 0);
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v33 = a3;
  v8 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__7018;
  v46 = __Block_byref_object_dispose__7019;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "vendorID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue") == 4937;

        if (v15)
        {
          v16 = (void *)v43[5];
          objc_msgSend(v13, "nodeID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);

          v18 = (void *)MEMORY[0x242656984]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "nodeID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            v49 = v21;
            v50 = 2112;
            v51 = v22;
            v52 = 2112;
            v53 = v23;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Found Apple Home pairing with node id %@ during removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  v24 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 48), "setBlockInvalidation:", 1));
  v25 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v49 = v27;
    v50 = 2112;
    v51 = v28;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@Now removing all connected services for %@ ...", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_155;
  v34[3] = &unk_250F241F0;
  v29 = *(void **)(a1 + 48);
  v30 = *(id *)(a1 + 56);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(a1 + 40);
  v36 = v30;
  v34[4] = v31;
  v35 = v32;
  v37 = &v42;
  objc_msgSend(v29, "removeAllPairingsWithCompletionHandler:", v34);

  _Block_object_dispose(&v42, 8);
}

void __110__HMMTRAccessoryServerBrowser_removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = (void *)MEMORY[0x242656984](v4);
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    v33 = 2112;
    v34 = v3;
    v10 = "%{public}@Failed remove all connected services for node (%@) with error";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    v33 = 2112;
    v34 = v13;
    v10 = "%{public}@Successfully removed all connected services for node (%@)";
    v11 = v8;
    v12 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_23E95B000, v11, v12, v10, buf, 0x16u);

LABEL_7:
  v25 = v3;

  objc_autoreleasePoolPop(v5);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x242656984]();
        v21 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v23;
          v33 = 2112;
          v34 = v19;
          _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Apple Home pairing is present. Removing accessory from Apple Home with node ID %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(*(id *)(a1 + 32), "accessoryServerBrowserDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "browser:didRemoveAccessoryPairingWithNodeID:", *(_QWORD *)(a1 + 32), v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

}

void __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2;
    v23[3] = &unk_250F21D90;
    v24 = *(id *)(a1 + 48);
    v8 = (void *)MEMORY[0x242656B10](v23);
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Now fetching connected services for %@ ...", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_153;
    v18[3] = &unk_250F21DB8;
    v14 = v5;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v19 = v14;
    v20 = v15;
    v22 = v8;
    v21 = v16;
    v17 = v8;
    objc_msgSend(v14, "fetchPairingsWithCompletionHandler:", v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__HMMTRAccessoryServerBrowser__fetchDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "setBlockInvalidation:", 0));
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch connected services for node (%@) with error", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v15 + 16))(v15, 0, v16, v17);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 48);
      v20 = 138543874;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched connected services for node (%@) %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __103__HMMTRAccessoryServerBrowser__accessoryServerForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setSystemCommissionerMode:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setSystemCommissionerMode:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id obj;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v59 = a1;
    v54 = v7;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    v55 = v8;
    if (v17)
    {
      v18 = v17;
      v58 = 0;
      obj = v16;
      v57 = *(_QWORD *)v68;
LABEL_7:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v68 != v57)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
        v21 = objc_alloc(MEMORY[0x24BDDB868]);
        objc_msgSend(v20, "vendorID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "vendorName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v21, "initWithIdentifier:displayName:", v22, v23);

        v25 = objc_alloc(MEMORY[0x24BDDB850]);
        objc_msgSend(v20, "rootPublicKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithRootPublicKey:vendor:", v26, v24);

        v28 = objc_alloc(MEMORY[0x24BDDB858]);
        objc_msgSend(v20, "fabricID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fabricID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fabricLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v28, "initWithIdentifier:index:displayName:ecosystem:", v29, v30, v31, v27);

        v33 = objc_alloc(MEMORY[0x24BDDB848]);
        objc_msgSend(v20, "nodeID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v33, "initWithNodeID:fabric:", v34, v32);

        objc_msgSend(v35, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqual:", *(_QWORD *)(v59 + 40));

        if (v37)
        {
          v38 = v20;

          v58 = v38;
        }

        if ((v37 & 1) != 0)
          break;
        if (v18 == ++v19)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
          if (v18)
            goto LABEL_7;
          break;
        }
      }

      if (v58)
      {
        v39 = (void *)MEMORY[0x242656984]();
        v40 = *(id *)(v59 + 32);
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(v59 + 40);
          *(_DWORD *)buf = 138543618;
          v73 = v42;
          v74 = 2112;
          v75 = v43;
          _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_INFO, "%{public}@Now removing connected service (%@)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(v55, "setBlockInvalidation:", 1);
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_151;
        v60[3] = &unk_250F21D18;
        v44 = v55;
        v45 = *(_QWORD *)(v59 + 32);
        v46 = *(void **)(v59 + 40);
        v61 = v44;
        v62 = v45;
        v63 = v46;
        v66 = *(id *)(v59 + 56);
        v64 = *(id *)(v59 + 48);
        v65 = v58;
        v47 = v58;
        objc_msgSend(v44, "removePairing:completionHandler:", v47, v60);

LABEL_23:
        v7 = v54;
        v8 = v55;
        v9 = 0;
        goto LABEL_24;
      }
    }
    else
    {

    }
    v48 = (void *)MEMORY[0x242656984]();
    v49 = *(id *)(v59 + 32);
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = *(_QWORD *)(v59 + 40);
      *(_DWORD *)buf = 138543874;
      v73 = v51;
      v74 = 2112;
      v75 = v52;
      v76 = 2112;
      v77 = 0;
      _os_log_impl(&dword_23E95B000, v50, OS_LOG_TYPE_INFO, "%{public}@Couldn't find connected service (%@) to remove for node (%@) with error", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v48);
    v53 = *(_QWORD *)(v59 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v53 + 16))(v53, v47);
    goto LABEL_23;
  }
  v10 = (void *)MEMORY[0x242656984]();
  v11 = a1;
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(v11 + 40);
    *(_DWORD *)buf = 138543874;
    v73 = v14;
    v74 = 2112;
    v75 = v15;
    v76 = 2112;
    v77 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove connected service (%@) for node (%@) with error", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  (*(void (**)(void))(*(_QWORD *)(v11 + 56) + 16))();
LABEL_24:

}

void __119__HMMTRAccessoryServerBrowser_removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID_fabric_completionHandler___block_invoke_151(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setBlockInvalidation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "disable");
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAccessoryServer:reason:", v5, v6);

  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      v28 = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove connected service (%@) for node (%@) with error", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 48);
      v17 = *(void **)(a1 + 56);
      v28 = 138543874;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed connected services (%@) for node (%@)", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 64), "vendorID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    if (v19 == 4937)
    {
      v20 = (void *)MEMORY[0x242656984]();
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "nodeID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v23;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Apple Home pairing has been removed. Removing accessory from Apple Home with node ID %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(*(id *)(a1 + 40), "accessoryServerBrowserDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 64), "nodeID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "browser:didRemoveAccessoryPairingWithNodeID:", v26, v27);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __109__HMMTRAccessoryServerBrowser_fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  id obj;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "disable");
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateAccessoryServer:reason:", v8, v11);

  if (v9)
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v15;
      v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch connected services for node (%@) with error", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16);
    v19 = v16;
    v20 = (void *)v17;
    v18(v19, 0, v17);
  }
  else
  {
    v46 = a1;
    v47 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v48 = v7;
    obj = v7;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v21)
    {
      v22 = v21;
      v50 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          v24 = v20;
          if (*(_QWORD *)v52 != v50)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v26 = objc_alloc(MEMORY[0x24BDDB868]);
          objc_msgSend(v25, "vendorID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "vendorName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v26, "initWithIdentifier:displayName:", v27, v28);

          v30 = objc_alloc(MEMORY[0x24BDDB850]);
          objc_msgSend(v25, "rootPublicKey");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v30, "initWithRootPublicKey:vendor:", v31, v29);

          v33 = objc_alloc(MEMORY[0x24BDDB858]);
          objc_msgSend(v25, "fabricID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fabricID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fabricLabel");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v33, "initWithIdentifier:index:displayName:ecosystem:", v34, v35, v36, v32);

          v38 = objc_alloc(MEMORY[0x24BDDB848]);
          objc_msgSend(v25, "nodeID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v38, "initWithNodeID:fabric:", v39, v37);

          v20 = v24;
          objc_msgSend(v24, "addObject:", v40);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v22);
    }

    v41 = (void *)MEMORY[0x242656984]();
    v42 = *(id *)(v46 + 32);
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *(void **)(v46 + 40);
      *(_DWORD *)buf = 138543874;
      v56 = v44;
      v57 = 2112;
      v58 = v45;
      v59 = 2112;
      v60 = v20;
      _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched connected services for node (%@) as %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v41);
    (*(void (**)(void))(*(_QWORD *)(v46 + 48) + 16))();
    v8 = v47;
    v7 = v48;
    v9 = 0;
  }

}

void __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeRecordsForSystemCommissionerFabricNode:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setBlockInvalidation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_2;
  block[3] = &unk_250F22988;
  v13 = *(id *)(a1 + 48);
  dispatch_async(v3, block);

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_3;
  v9[3] = &unk_250F23EB8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  v9[4] = v7;
  v10 = v8;
  objc_msgSend(v5, "removePairingForCurrentControllerOnQueue:completion:", v6, v9);

}

uint64_t __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__HMMTRAccessoryServerBrowser_removeSystemCommissionerFabricAccessoryWithNodeID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setBlockInvalidation:", 0);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmmtrErrorWithCode:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAccessoryServer:reason:", v5, v6);

  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove node (%@) from System Commissioner Fabric with error", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed node (%@) from System Commissioner Fabric", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

void __67__HMMTRAccessoryServerBrowser_stagedAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v1 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isSystemCommissionerFeatureEnabled"))
  {
    v40 = 0uLL;
    v41 = 0uLL;
    v38 = 0uLL;
    v39 = 0uLL;
    objc_msgSend(*(id *)(v1 + 32), "discoveredAccessoryServers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v2)
    {
      v4 = v2;
      v5 = *(_QWORD *)v39;
      *(_QWORD *)&v3 = 138544130;
      v30 = v3;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v39 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v7, "removalInProgress", v30) & 1) == 0)
          {
            v8 = (void *)MEMORY[0x242656984]();
            v9 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "pairedState"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "knownToSystemCommissioner");
              HMFBooleanToString();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v30;
              v44 = v11;
              v45 = 2112;
              v46 = v7;
              v47 = 2112;
              v48 = v12;
              v49 = 2112;
              v50 = v13;
              _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Found staged server: %@, state = %@, knownToSystemCommissioner %@", buf, 0x2Au);

              v1 = a1;
            }

            objc_autoreleasePoolPop(v8);
            if (objc_msgSend(v7, "pairedState") == 3)
            {
              objc_msgSend(v7, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(v1 + 40)) & 1) != 0)
              {
                v15 = objc_msgSend(v7, "knownToSystemCommissioner");

                if ((v15 & 1) != 0)
                  goto LABEL_31;
              }
              else
              {

              }
            }
          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      }
      while (v4);
    }
  }
  else
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    objc_msgSend(*(id *)(v1 + 32), "stagedAccessoryServers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v35;
      *(_QWORD *)&v17 = 138543618;
      v31 = v17;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((objc_msgSend(v7, "removalInProgress", v31) & 1) == 0)
          {
            v21 = (void *)MEMORY[0x242656984]();
            v22 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v44 = v24;
              v45 = 2112;
              v46 = v7;
              _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Found staged server: %@", buf, 0x16u);

              v1 = a1;
            }

            objc_autoreleasePoolPop(v21);
            if (objc_msgSend(v7, "pairedState") == 2)
            {
              objc_msgSend(v7, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", *(_QWORD *)(v1 + 40));

              if ((v26 & 1) != 0)
              {
LABEL_31:
                v27 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
                v28 = v7;
                v29 = *(void **)(v27 + 40);
                *(_QWORD *)(v27 + 40) = v28;

                goto LABEL_32;
              }
            }
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v18)
          continue;
        break;
      }
    }
  }
LABEL_32:

}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_2;
  block[3] = &unk_250F21C60;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v10 = *(id *)(a1 + 48);
  v16 = v7;
  v17 = v10;
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v21 = *(id *)(a1 + 80);
  v22 = *(id *)(a1 + 88);
  v23 = *(_BYTE *)(a1 + 96);
  v11 = v7;
  v12 = v6;
  dispatch_async(v8, block);

}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Staging server: %@ with fabric ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunning");

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "systemCommissionerControllerParams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCommissioneeNodeID:", v10);

      v12 = *(_QWORD *)(a1 + 80);
      v13 = *(_QWORD *)(a1 + 88);
      v14 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 104);
      v16 = *(unsigned __int8 *)(a1 + 112);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_140;
      v28[3] = &unk_250F21C38;
      v17 = *(void **)(a1 + 40);
      v28[4] = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 72);
      v29 = *(id *)(a1 + 64);
      objc_msgSend(v17, "startStagedPairingWithDeviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:completion:", v18, v12, v13, v14, v15, v16, v28);
      objc_msgSend(*(id *)(a1 + 32), "stagedAccessoryServers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v21 = (void *)MEMORY[0x242656984]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@CHIP Stack is not running. Aborting pairing.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v25 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v25 + 16))(v25, 0, 0, v26);

    }
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 64);
    if (*(_QWORD *)(a1 + 56))
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v20 + 16))(*(_QWORD *)(a1 + 64), 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDDB490], 6, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v27);

    }
  }
}

void __254__HMMTRAccessoryServerBrowser__stageAccessoryServerWithSetupPayload_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_hasPriorSuccessfulPairing_category_completionHandler___block_invoke_140(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isSystemCommissionerMode"))
  {
    v8 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "setSystemCommissionerMode:", 0));
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Staging is complete. Disabling system commissioner mode", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "systemCommissionerControllerParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCommissioneeNodeID:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __227__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_fabricID_deviceCredentialHandler_wifiScanResultsHandler_threadScanResultsHandler_readyToCancelHandler_progressUpdateHandler_scanningNetworks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  LOWORD(v2) = *(unsigned __int8 *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "_stageAccessoryServerWithSetupPayload:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:hasPriorSuccessfulPairing:category:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2, 0, *(_QWORD *)(a1 + 88));
}

uint64_t __121__HMMTRAccessoryServerBrowser_stageAccessoryServerWithSetupPayload_hasPriorSuccessfulPairing_category_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  BYTE1(v2) = *(_BYTE *)(a1 + 64);
  LOBYTE(v2) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_stageAccessoryServerWithSetupPayload:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:hasPriorSuccessfulPairing:category:completionHandler:", *(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __98__HMMTRAccessoryServerBrowser_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 48))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(WeakRetained, "_allServers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v8, "matchesSetupID:serverIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40))&& (objc_msgSend(v8, "removalInProgress") & 1) == 0)
          {
            objc_msgSend(v8, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v3, "isPaired:", v10);

            v12 = objc_msgSend(v8, "hasPairings");
            v13 = (void *)MEMORY[0x242656984]();
            v14 = v3;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v16 = objc_claimAutoreleasedReturnValue();
              v19 = *(_QWORD *)(a1 + 32);
              v20 = (void *)v16;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v26 = v20;
              v27 = 2112;
              v28 = v8;
              v29 = 2112;
              v30 = v19;
              v31 = 2112;
              v32 = v17;
              v33 = 2112;
              v34 = v18;
              _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@CHIP Accessory server %@ matches setupID %@ and is paired/hasPairings: (%@/%@)", buf, 0x34u);

            }
            objc_autoreleasePoolPop(v13);
            v9 = v8;
            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
        if (v5)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_15:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[6];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = (void *)MEMORY[0x242656984]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    *(_DWORD *)buf = 138543618;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@discoverAccessoryServerWithNideId %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v4, "discoveredAccessoryServers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v14 = a1[4];
        objc_msgSend(v13, "nodeID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v15) && (objc_msgSend(v13, "isDisabled") & 1) == 0)
        {
          v16 = objc_msgSend(v13, "serviceEnumerationFailed");

          if ((v16 & 1) == 0)
          {
            v33[0] = MEMORY[0x24BDAC760];
            v33[1] = 3221225472;
            v33[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_136;
            v33[3] = &unk_250F22BB8;
            v33[4] = v4;
            v33[5] = v13;
            v34 = a1[5];
            objc_msgSend(v13, "isDiscoverableWithCompletion:", v33);

            goto LABEL_21;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = a1[4];
  v32 = 0;
  v18 = objc_msgSend(v4, "_isNodeIDPaired:fabricID:", v17, &v32);
  v8 = v32;
  if (v18 && isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMTRUtilities identifierStringWithCHIPNodeID:](HMMTRUtilities, "identifierStringWithCHIPNodeID:", a1[4]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a1[4];
      *(_DWORD *)buf = 138543874;
      v40 = v22;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v24;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Paired device %@ with node ID %@ fakes discovery for local fallback", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v20, "appleHomeFabricWithID:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_138;
    v27[3] = &unk_250F21BC0;
    v27[4] = v20;
    v8 = v8;
    v28 = v8;
    v29 = v25;
    v30 = a1[4];
    v31 = a1[5];
    v26 = v25;
    objc_msgSend(v26, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v27);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
LABEL_21:

}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_136(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  __int128 v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2;
  v5[3] = &unk_250F21F90;
  v8 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2_139;
  v8[3] = &unk_250F23FD0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2_139(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void (*v13)(void);
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certificates for fabric ID %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
  }
  objc_msgSend(*(id *)(a1 + 40), "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:", *(_QWORD *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:", *(_QWORD *)(a1 + 56)));
  v8 = *(void **)(a1 + 40);
  v9 = objc_msgSend(*(id *)(a1 + 64), "unsignedLongLongValue");
  v18 = 0;
  objc_msgSend(v8, "_createCHIPAccessoryForNodeID:ifPaired:fatalError:", v9, 1, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "discoveredAccessoryServers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not create server for local try: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
  }
  v13();

}

uint64_t __76__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithNodeID_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (v6)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[6];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v44 = v6;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@discoverAccessoryServerWithIdentifier %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "discoveredAccessoryServers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v15) && (objc_msgSend(v13, "isDisabled") & 1) == 0)
        {
          v16 = objc_msgSend(v13, "serviceEnumerationFailed");

          if ((v16 & 1) == 0)
          {
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_125;
            v37[3] = &unk_250F21B20;
            v37[4] = v4;
            v37[5] = v13;
            v38 = *(id *)(a1 + 32);
            objc_msgSend(v13, "isDiscoverableWithCompletion:", v37);

            goto LABEL_23;
          }
        }
        else
        {

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = *(_QWORD *)(a1 + 32);
  v35 = 0;
  v36 = 0;
  v18 = objc_msgSend(v4, "_isDeviceIDPaired:nodeID:fabricID:", v17, &v36, &v35);
  v8 = v36;
  v19 = v35;
  if (v18 && isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    v20 = (void *)MEMORY[0x242656984]();
    v21 = v4;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v44 = v23;
      v45 = 2112;
      v46 = v24;
      v47 = 2112;
      v48 = v8;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Paired device %@ with node ID %@ fakes discovery for local fallback", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v21, "appleHomeFabricWithID:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_130;
    v30[3] = &unk_250F21B70;
    v30[4] = v21;
    v31 = v19;
    v32 = v25;
    v33 = v8;
    v34 = *(id *)(a1 + 32);
    v26 = v25;
    objc_msgSend(v26, "loadFabricAndControllerDataForPairing:fetchFromResident:completion:", 0, 0, v30);

  }
  else if (objc_msgSend(v4, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
  {
    objc_msgSend(v4, "delegateQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_135;
    v28[3] = &unk_250F22458;
    v28[4] = v4;
    v29 = *(id *)(a1 + 32);
    dispatch_async(v27, v28);

  }
LABEL_23:

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_125(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  __int128 v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2;
  v5[3] = &unk_250F21AF8;
  v8 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_131;
  v8[3] = &unk_250F21B48;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_135(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server with identifier: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_131(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x242656984]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to load certificates for fabric ID %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
  }
  objc_msgSend(*(id *)(a1 + 40), "_setupStorageStateForUpdatedHomeFabricID:rediscoverAccessories:overrideAccessoryControlAllowed:", *(_QWORD *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceAllowedAccessoryControlPerExplicitRequestDespiteReachableResidentForFabric:", *(_QWORD *)(a1 + 56)));
  v8 = *(void **)(a1 + 40);
  v9 = objc_msgSend(*(id *)(a1 + 64), "unsignedLongLongValue");
  v24 = 0;
  objc_msgSend(v8, "_createCHIPAccessoryForNodeID:ifPaired:fatalError:", v9, 1, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "discoveredAccessoryServers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

    if (objc_msgSend(*(id *)(a1 + 40), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_133;
      v20[3] = &unk_250F22458;
      v20[4] = *(_QWORD *)(a1 + 40);
      v14 = &v21;
      v21 = v10;
      v15 = v20;
LABEL_12:
      dispatch_async(v13, v15);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not create server for local try: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    if (objc_msgSend(*(id *)(a1 + 40), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_132;
      block[3] = &unk_250F22458;
      block[4] = *(_QWORD *)(a1 + 40);
      v14 = &v23;
      v23 = *(id *)(a1 + 72);
      v15 = block;
      goto LABEL_12;
    }
  }

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_132(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2_133(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  __int128 v7;
  NSObject *v8;
  _QWORD block[4];
  __int128 v10;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))return;
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_3;
    block[3] = &unk_250F22458;
    v10 = *(_OWORD *)(a1 + 32);
    dispatch_async(v4, block);
  }
  else
  {
    if (!objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))return;
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_128;
    v6[3] = &unk_250F224F8;
    v7 = *(_OWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);

    v4 = v8;
  }

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Found server %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __69__HMMTRAccessoryServerBrowser_discoverAccessoryServerWithIdentifier___block_invoke_128(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to discover server: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping browse for CHIP accessories", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStopDiscoveringWithError_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke_124;
    block[3] = &unk_250F23DF0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __62__HMMTRAccessoryServerBrowser_stopDiscoveringAccessoryServers__block_invoke_124(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD block[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  if (v3 == 4)
  {
LABEL_6:
    v25 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    objc_msgSend(WeakRetained, "discoveredAccessoryServers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "pairedState")
            && (objc_msgSend(v16, "isDisabled") & 1) == 0
            && (objc_msgSend(v16, "removalInProgress") & 1) == 0
            && (!objc_msgSend(WeakRetained, "isCurrentDeviceMobileAndAllowedAccessoryControl")
             || (objc_msgSend(v16, "delayDiscovery") & 1) == 0))
          {
            objc_msgSend(WeakRetained, "delegateQueue");
            v17 = objc_claimAutoreleasedReturnValue();
            block[0] = v12;
            block[1] = 3221225472;
            block[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_121;
            block[3] = &unk_250F22458;
            block[4] = WeakRetained;
            block[5] = v16;
            dispatch_async(v17, block);

          }
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(WeakRetained, "setBrowserState:", 2);
    if (objc_msgSend(WeakRetained, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStopDiscoveringWithError_))
    {
      objc_msgSend(WeakRetained, "delegateQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_2;
      v20[3] = &unk_250F23DF0;
      v20[4] = WeakRetained;
      dispatch_async(v18, v20);

    }
    goto LABEL_24;
  }
  v4 = objc_msgSend(WeakRetained, "isCurrentDeviceMobileAndAllowedAccessoryControl");
  v5 = (void *)MEMORY[0x242656984]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v9;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@startDiscoveringAccessoryServers invoked while resident is down - allowing discovery", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    goto LABEL_6;
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v19;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@startDiscoveringAccessoryServers: resident is up - preventing discovery of all accessory servers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
LABEL_24:

}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_121(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __63__HMMTRAccessoryServerBrowser_startDiscoveringAccessoryServers__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  HMMTRAccessoryServerFactory *v12;
  void *v13;
  HMMTRAccessoryServerFactory *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  const char *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  HMMTRAccessoryServerFactory *v42;
  _QWORD block[5];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_discoveredServerWithDiscriminator:vendorID:productID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "pairedState") && !objc_msgSend(v3, "isDisabled"))
    {
      v30 = (void *)MEMORY[0x242656984]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        v36 = *(unsigned __int8 *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        v46 = v33;
        if (v36)
          v37 = "BLE";
        else
          v37 = "Bonjour";
        v47 = 2114;
        v48 = v34;
        v49 = 2080;
        v50 = (uint64_t)v37;
        _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@CHIP accessory server %{public}@ paired or being paired was unexpectedly discovered over %s", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
    }
    else
    {
      if (!*(_BYTE *)(a1 + 64)
        || !objc_msgSend(v3, "locallyDiscovered")
        || !objc_msgSend(v3, "discoveredOverBLE")
        || objc_msgSend(v3, "bleScanPending"))
      {
        v4 = (void *)MEMORY[0x242656984]();
        v5 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "identifier");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v8;
          v10 = *(unsigned __int8 *)(a1 + 64);
          *(_DWORD *)buf = 138543874;
          v46 = v7;
          if (v10)
            v11 = "BLE";
          else
            v11 = "Bonjour";
          v47 = 2114;
          v48 = v8;
          v49 = 2080;
          v50 = (uint64_t)v11;
          _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Updating CHIP accessory server %{public}@ with new discovery over %s", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v4);
      }
      objc_msgSend(v3, "setLocallyDiscovered:", 1);
      objc_msgSend(v3, "setDiscoveredOverBLE:", *(unsigned __int8 *)(a1 + 64));
      objc_msgSend(v3, "setBleScanPending:", 0);
    }
  }
  else
  {
    v12 = [HMMTRAccessoryServerFactory alloc];
    objc_msgSend(*(id *)(a1 + 32), "keyStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMMTRAccessoryServerFactory initWithKeystore:browser:](v12, "initWithKeystore:browser:", v13, *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "_generateNodeID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessoryServerFactory vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:](v14, "vendAccessoryServerWithNodeID:setupCode:discriminator:category:vendorID:productID:serialNumber:firmwareRevision:", v15, 0, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, CFSTR("1.0.0"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "setFabricID:", 0);
      v18 = (void *)MEMORY[0x242656984](objc_msgSend(v17, "setKnownToSystemCommissioner:", 0));
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = v14;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = *(unsigned __int8 *)(a1 + 64);
        v26 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        if (v25)
          v27 = "BLE";
        else
          v27 = "Bonjour";
        v46 = v21;
        v47 = 2112;
        v48 = (uint64_t)v22;
        v49 = 2114;
        v50 = v23;
        v51 = 2080;
        v52 = v27;
        v53 = 2112;
        v54 = v26;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory server %@/%{public}@ with new discovery over %s, D=%@", buf, 0x34u);

        v14 = v42;
      }

      objc_autoreleasePoolPop(v18);
      objc_msgSend(v17, "setLocallyDiscovered:", 1);
      objc_msgSend(v17, "setDiscoveredOverBLE:", *(unsigned __int8 *)(a1 + 64));
      objc_msgSend(v17, "setBleScanPending:", 0);
      objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryServers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v17);

      if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke_118;
        block[3] = &unk_250F22458;
        block[4] = *(_QWORD *)(a1 + 32);
        v44 = v17;
        dispatch_async(v29, block);

      }
      objc_msgSend(v17, "registerForNotifications:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v38 = (void *)MEMORY[0x242656984]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v41;
        _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to create an accessory server from a new discovery", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
    }

  }
}

void __94__HMMTRAccessoryServerBrowser__handleAddOrUpdateWithDiscriminator_vendorID_productID_overBLE___block_invoke_118(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

uint64_t __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a3 == 4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 1);
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("+"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x242656984]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543874;
      v35 = v11;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@VP value: %@, split int components: %@", (uint8_t *)&v34, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if (objc_msgSend(v7, "count") == 2)
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", &unk_250F3F900) & 1) == 0
        && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqual:", &unk_250F3F900))
      {
        v32 = 1;
        goto LABEL_16;
      }
      v22 = (void *)MEMORY[0x242656984]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v7;
        v26 = "%{public}@Invalid VP values in TXT record: %@";
LABEL_14:
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v34, 0x16u);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x242656984]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v6;
        v26 = "%{public}@Invalid VP value format in TXT record: %@";
        goto LABEL_14;
      }
    }

    objc_autoreleasePoolPop(v22);
    v32 = 0;
LABEL_16:

    return v32;
  }
  v28 = (void *)MEMORY[0x242656984]();
  v29 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v31;
    v36 = 1024;
    LODWORD(v37) = a3;
    _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Missing VP value in TXT record: %d", (uint8_t *)&v34, 0x12u);

  }
  objc_autoreleasePoolPop(v28);
  return 0;
}

uint64_t __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_109(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3 == 4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", &unk_250F3F900);
    if (v10)
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v22 = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid discriminator value in TXT record: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    v16 = v10 ^ 1u;

  }
  else
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Missing discriminator value in TXT record", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    return 0;
  }
  return v16;
}

BOOL __82__HMMTRAccessoryServerBrowser__discriminator_vendorID_productID_CM_fromTXTRecord___block_invoke_111(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 == 4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a4, a5, 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Missing CM value in TXT record", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  return a3 == 4;
}

void __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)MEMORY[0x242656984]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Bonjour browser state: %d, error: %@", (uint8_t *)&v11, 0x1Cu);

  }
  objc_autoreleasePoolPop(v7);
  if (a2 == 2)
    goto LABEL_6;
  if (a2 == 3)
  {
    nw_browser_set_browse_results_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
    nw_browser_set_state_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
LABEL_6:
    objc_msgSend(v8, "setBonjourBrowser:", 0);
  }

}

void __64__HMMTRAccessoryServerBrowser__initializeAndStartBonjourBrowser__block_invoke_99(uint64_t a1, void *a2, void *a3, int a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_queueBonjourBrowserOldResult:newResult:", v8, v7);

  if (a4)
    objc_msgSend(WeakRetained, "_handleBonjourBrowserBatchResults");

}

void __76__HMMTRAccessoryServerBrowser_handleSystemKeychainStoreUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  HMMTRMatterKeypair *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  HMMTRMatterKeypair *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v10 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeopcerts.CA:0"));
    objc_msgSend(*(id *)(a1 + 32), "setNocSigner:", v10);

    objc_msgSend(*(id *)(a1 + 32), "nocSigner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v15;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Apple Home fabrics root key pair is loaded", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 32), "nocSigner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNocSigner:", v16);

    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "nocSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reload");

  if (!v4)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v5 = (void *)MEMORY[0x242656984]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Apple Home fabrics root keypair has changed.", (uint8_t *)&v34, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = 1;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "reload");

    v9 |= v20;
    if (v20)
    {
      v21 = (void *)MEMORY[0x242656984]();
      v22 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Operational keypair for Apple Home fabrics has changed.", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }
  }
  else
  {
    v25 = -[HMMTRMatterKeypair initWithV0Account:]([HMMTRMatterKeypair alloc], "initWithV0Account:", CFSTR("CHIPPlugin.nodeOperationalKeyPair.CA:0"));
    objc_msgSend(*(id *)(a1 + 32), "setOwnerSharedOperationalKeyPair:", v25);

    if (v25)
    {
      v26 = (void *)MEMORY[0x242656984]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v29;
        _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@Operational key pair for Apple Home fabrics is loaded.", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(*(id *)(a1 + 32), "ownerSharedOperationalKeyPair");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setOperationalKeyPair:", v30);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "systemCommissionerControllerParams");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleKeyPairDataChanged");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeFabricControllers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllGetters");

  }
}

void __49__HMMTRAccessoryServerBrowser_setDelegate_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x242656984]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Setting Delegate...", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setDelegateQueue:", *(_QWORD *)(a1 + 40));

}

uint64_t __57__HMMTRAccessoryServerBrowser_discoveredAccessoryServers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupDiscoveredServers");
}

void __40__HMMTRAccessoryServerBrowser_configure__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLockStateNotification");

}

uint64_t __40__HMMTRAccessoryServerBrowser_configure__block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLockStateNotification");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t415 != -1)
    dispatch_once(&logCategory__hmf_once_t415, &__block_literal_global_342);
  return (id)logCategory__hmf_once_v416;
}

void __42__HMMTRAccessoryServerBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v416;
  logCategory__hmf_once_v416 = v0;

}

@end
