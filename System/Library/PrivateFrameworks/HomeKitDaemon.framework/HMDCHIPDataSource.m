@implementation HMDCHIPDataSource

- (HMDCHIPDataSource)initWithHomeManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMDCHIPDataSource *v12;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE3F298]);
  v8 = (void *)objc_msgSend(v7, "initWithTimeInterval:options:", 4, *(double *)&vendorInfoFetchPeriod);
  v9 = objc_alloc(MEMORY[0x24BE3F298]);
  v10 = (void *)objc_msgSend(v9, "initWithTimeInterval:options:", 4, *(double *)&attestationInfoFetchPeriod);
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDCHIPDataSource initWithHomeManager:notificationCenter:vendorMetadataRefreshTimer:attestationDataRefreshTimer:dialogPresenter:](self, "initWithHomeManager:notificationCenter:vendorMetadataRefreshTimer:attestationDataRefreshTimer:dialogPresenter:", v5, v6, v8, v10, v11);

  return v12;
}

- (HMDCHIPDataSource)initWithHomeManager:(id)a3 notificationCenter:(id)a4 vendorMetadataRefreshTimer:(id)a5 attestationDataRefreshTimer:(id)a6 dialogPresenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCHIPDataSource *v17;
  HMDCHIPDataSource *v18;
  HMDFileManager *v19;
  HMDFileManager *fileManager;
  void *v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDCHIPDataSource;
  v17 = -[HMDCHIPDataSource init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_homeManager, v12);
    objc_storeStrong((id *)&v18->_notificationCenter, a4);
    objc_storeStrong((id *)&v18->_vendorMetadataRefreshTimer, a5);
    objc_storeStrong((id *)&v18->_attestationDataRefreshTimer, a6);
    objc_storeStrong((id *)&v18->_dialogPresenter, a7);
    v19 = objc_alloc_init(HMDFileManager);
    fileManager = v18->_fileManager;
    v18->_fileManager = v19;

    v18->_pnExistsOnCurrentNetwork = 0;
    v18->_geo_lock._os_unfair_lock_opaque = 0;
    +[HMDLocation sharedManager](HMDLocation, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_locationAuthorization = objc_msgSend(v21, "locationAuthorized");

    v18->_pendingRadioStateChangeNotification = 0;
    v18->_threadNetworkShouldRestartOnNetworkChange = 0;
    v18->_startThreadOnWakeEnabled = 0;
    v18->_threadPairingOverride = 0;
    -[HMDCHIPDataSource _getPreferredNetworkExists](v18, "_getPreferredNetworkExists");
  }

  return v18;
}

- (void)configureWithAccessoryServerBrowser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "setAccessoryServerBrowserDelegate:", self);
  objc_msgSend(v10, "residentStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithResidentStateManager:](self, "configureWithResidentStateManager:", v4);

  objc_msgSend(v10, "threadRadioManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithThreadRadioManager:](self, "configureWithThreadRadioManager:", v5);

  -[HMDCHIPDataSource setMatterAccessoryServerBrowser:](self, "setMatterAccessoryServerBrowser:", v10);
  if (CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDCHIPDataSource setStartThreadOnWakeEnabled:](self, "setStartThreadOnWakeEnabled:", 1);
  }
  objc_msgSend(v10, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithStorage:](self, "configureWithStorage:", v6);

  objc_msgSend(v10, "vendorMetadataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithVendorMetadataStore:](self, "configureWithVendorMetadataStore:", v7);

  objc_msgSend(v10, "attestationDataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithAttestationDataStore:](self, "configureWithAttestationDataStore:", v8);

  objc_msgSend(v10, "uiDialogPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource configureWithUIDialogPresenter:](self, "configureWithUIDialogPresenter:", v9);

}

- (void)configureWithResidentStateManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCHIPDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDCHIPDataSource chipResidentStateManager](self, "chipResidentStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_9;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v10;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with resident state manager: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCHIPDataSource setChipResidentStateManager:](v8, "setChipResidentStateManager:", v5);
  -[HMDCHIPDataSource chipResidentStateManager](v8, "chipResidentStateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataSource:", v8);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel_handlePrimaryResidentUpdatedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel_handlePrimaryResidentUpdatedNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel_handleResidentReachabilityNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);

    -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel_handleResidentReachabilityNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

  }
  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_handleDataReadyAfterBecomingPrimaryNotification_, CFSTR("HMDHomeDataReadyAfterBecomingPrimaryNotification"), 0);

}

- (void)configureWithThreadRadioManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCHIPDataSource *v7;
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
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring with thread radio manager: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCHIPDataSource setMatterThreadRadioManager:](v7, "setMatterThreadRadioManager:", v5);
  objc_msgSend(v5, "setDelegate:", v7);
  -[HMDCHIPDataSource notificationCenter](v7, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_handleThreadNetworkStateChangedNotification_, CFSTR("HMDHomeThreadNetworkConnectionStateChangeNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v7, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_handleThreadNetworkStateChangedNotification_, CFSTR("HMDHomeThreadNetworkNodeTypeChangeNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v7, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_handleThreadNetworkWakeOnConnectionStateChangedNotification_, CFSTR("HMDHomeThreadNetworkWakeOnConnectionStateChangeNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v7, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_handleThreadNetworkPeripheralDeviceNodeTypeChangedNotification_, CFSTR("HMDHomeThreadNetworkPeripheralDeviceNodeTypeChangedNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v7, "notificationCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_handleCurrentWiFiNetworkChangedNotification_, *MEMORY[0x24BE3F130], 0);

  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsThreadService");

    if (v16)
      objc_msgSend(v5, "setDeviceSupportsThreadService:", 1);
  }

}

- (void)configureWithStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCHIPDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDCHIPDataSource chipStorage](self, "chipStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v10;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with storage: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCHIPDataSource setChipStorage:](v8, "setChipStorage:", v5);
  -[HMDCHIPDataSource chipStorage](v8, "chipStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataSource:", v8);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel_handleHomeCHIPStorageChangedNotification_, CFSTR("HMDHomeCHIPStorageUpdatedNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel_handleAccessoryCHIPStorageChangedNotification_, CFSTR("HMDAccessoryCHIPStorageUpdatedNotification"), 0);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource homeManager](v8, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), v15);

  -[HMDCHIPDataSource notificationCenter](v8, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

}

- (void)configureWithVendorMetadataStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCHIPDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDCHIPDataSource vendorMetadataStore](self, "vendorMetadataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with vendor metadata store: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCHIPDataSource setVendorMetadataStore:](v8, "setVendorMetadataStore:", v5);
  -[HMDCHIPDataSource vendorMetadataStore](v8, "vendorMetadataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchCloudMetadata");

  -[HMDCHIPDataSource vendorMetadataRefreshTimer](v8, "vendorMetadataRefreshTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v8);

  -[HMDCHIPDataSource vendorMetadataRefreshTimer](v8, "vendorMetadataRefreshTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

- (void)configureWithAttestationDataStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCHIPDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDCHIPDataSource attestationDataStore](self, "attestationDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with attestation data store: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCHIPDataSource setAttestationDataStore:](v8, "setAttestationDataStore:", v5);
  -[HMDCHIPDataSource attestationDataStore](v8, "attestationDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchCloudAttestationData");

  -[HMDCHIPDataSource attestationDataRefreshTimer](v8, "attestationDataRefreshTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v8);

  -[HMDCHIPDataSource attestationDataRefreshTimer](v8, "attestationDataRefreshTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

}

- (void)configureWithUIDialogPresenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCHIPDataSource *v8;
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
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v5 = v4;
  -[HMDCHIPDataSource uiDialogPresenter](self, "uiDialogPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
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
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with UI dialog presenter: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCHIPDataSource setUiDialogPresenter:](v8, "setUiDialogPresenter:", v5);
  -[HMDCHIPDataSource uiDialogPresenter](v8, "uiDialogPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDialogDelegate:", v8);

}

- (id)home
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDCHIPDataSource *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_136031);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_85_136032);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v14 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __25__HMDCHIPDataSource_home__block_invoke_3;
      v28[3] = &unk_24E796248;
      v15 = v4;
      v29 = v15;
      objc_msgSend(v6, "na_firstObjectPassingTest:", v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v9 = v16;
      }
      else
      {
        v23 = v14;
        v24 = 3221225472;
        v25 = __25__HMDCHIPDataSource_home__block_invoke_4;
        v26 = &unk_24E796248;
        v27 = v15;
        objc_msgSend(v6, "na_firstObjectPassingTest:", &v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v9 = v18;
        }
        else
        {
          objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_87, v23, v24, v25, v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            v21 = v9;

        }
      }

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (id)homeWithCHIPFabric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCHIPDataSource *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v5, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__HMDCHIPDataSource_homeWithCHIPFabric___block_invoke;
    v14[3] = &unk_24E796248;
    v15 = v4;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home manager or fabric reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  void *v4;
  HMDCHIPDataSource *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638](self, a2, a3);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying CHIP storage of updated home CHIP storage with both isLocalChange: NO and isLocalChange: YES", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCHIPDataSource chipStorage](v5, "chipStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleUpdatedDataWithIsLocalChange:", 0);

  -[HMDCHIPDataSource chipStorage](v5, "chipStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleUpdatedDataWithIsLocalChange:", 1);

}

- (id)getDefaultThreadNetworkMetadataStore
{
  return +[HMDThreadNetworkMetadataStore defaultStore](HMDThreadNetworkMetadataStore, "defaultStore");
}

- (id)getSharedThreadResidentCommissioner
{
  return +[HMDThreadResidentCommissioner sharedCommissioner](HMDThreadResidentCommissioner, "sharedCommissioner");
}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying CHIP data sources of updated resident state", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPDataSource chipResidentStateManager](v6, "chipResidentStateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleResidentStateUpdated");

  -[HMDCHIPDataSource chipStorage](v6, "chipStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleUpdatedCurrentFabricIndex");

}

- (void)handleDataReadyAfterBecomingPrimaryNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying HomeKitMatter of primary resident data ready", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPDataSource chipStorage](v6, "chipStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handlePrimaryResidentDataReady");

}

- (void)handleResidentReachabilityNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCHIPDataSource *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_homeWithUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fabric");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying HomeKitMatter of resident reachability change for Home %@ with fabricID %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDCHIPDataSource chipResidentStateManager](v13, "chipResidentStateManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleResidentReachabilityChangeForFabric:", v11);

}

- (void)updateNotificationsEnabled:(BOOL)a3 forHome:(id)a4 keepAliveOnly:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCHIPDataSource *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v6 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "fabric");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fabricID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "fabric");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fabricID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_24E96B930);

    if ((v14 & 1) == 0)
    {
      -[HMDCHIPDataSource chipResidentStateManager](self, "chipResidentStateManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fabric");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleUpdateNotificationsEnabled:forFabric:keepAliveOnly:", v6, v16, v5);

      goto LABEL_8;
    }
  }
  else
  {

  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fabric");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fabricID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v20;
    v25 = 2112;
    v26 = v22;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping notifications as fabricID is %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_8:

}

- (void)handleHomeCHIPStorageChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDCHIPDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDHomeCHIPStorageIsLocalChangeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = CFSTR("HMDHomeCHIPStorageIsLocalChangeNotificationKey");
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not find %@ in notification userInfo. Defaulting isLocalChange to %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 1;
  }
  -[HMDCHIPDataSource handleUpdatedDataWithIsLocalChange:](self, "handleUpdatedDataWithIsLocalChange:", v7);

}

- (void)handleAccessoryCHIPStorageChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDCHIPDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDAccessoryCHIPStorageIsLocalChangeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = CFSTR("HMDAccessoryCHIPStorageIsLocalChangeNotificationKey");
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not find %@ in notification userInfo. Defaulting isLocalChange to %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 1;
  }
  -[HMDCHIPDataSource handleUpdatedDataWithIsLocalChange:](self, "handleUpdatedDataWithIsLocalChange:", v7);

}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
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
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling home removal by notifying CHIP storage", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("HMDHomeNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryBrowser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "chipAccessoryServerBrowser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fabric");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "handleHomeDeletionWithFabric:", v16);
  -[HMDCHIPDataSource chipStorage](v6, "chipStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleUpdatedDataWithIsLocalChange:", 0);

}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDCHIPDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevicePrimaryResident");

  return v3;
}

- (NSSet)allPairedHAPServerIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  HMDCHIPDataSource *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v3;
    objc_msgSend(v3, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v10, "hapAccessories");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v16);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    v17 = (void *)objc_msgSend(v4, "copy");
    v3 = v23;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v17;
}

- (NSSet)allFabricIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCHIPDataSource *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_96_136014);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v8;
}

- (NSNumber)currentFabricID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCHIPDataSource *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_97_136010);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_98_136011);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "matterFabricID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return (NSNumber *)v9;
}

- (id)appleHomeFabricWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  HMDCHIPDataSource *v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "homes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "fabric");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fabricID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v12, "fabric");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (id)appleHomeFabricWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  HMDCHIPDataSource *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "homes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v12, "fabric");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)storageDataSourceForFabricWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  HMDCHIPDataSource *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  HMDCHIPHomeDataSource *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "homes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "matterFabricID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToNumber:", v4) & 1) != 0)
          {
            v22 = -[HMDCHIPHomeDataSource initWithFabricID:home:]([HMDCHIPHomeDataSource alloc], "initWithFabricID:home:", v4, v12);

            goto LABEL_17;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
          continue;
        break;
      }
    }

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2112;
      v31 = v4;
      v18 = "%{public}@Could not find home with CHIP fabric ID: %@";
      v19 = v16;
      v20 = OS_LOG_TYPE_DEFAULT;
      v21 = 22;
LABEL_15:
      _os_log_impl(&dword_2218F0000, v19, v20, v18, buf, v21);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      v18 = "%{public}@Home manager reference is nil";
      v19 = v16;
      v20 = OS_LOG_TYPE_ERROR;
      v21 = 12;
      goto LABEL_15;
    }
  }

  objc_autoreleasePoolPop(v14);
  v22 = 0;
LABEL_17:

  return v22;
}

- (void)forAllStorageDataSourcesDo:(id)a3
{
  uint64_t (**v4)(id, HMDCHIPHomeDataSource *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  HMDCHIPHomeDataSource *v15;
  char v16;
  void *v17;
  HMDCHIPDataSource *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, HMDCHIPHomeDataSource *))a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v5;
    objc_msgSend(v5, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "matterFabricID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            if ((objc_msgSend(v13, "isEqualToNumber:", &unk_24E96B930) & 1) == 0)
            {
              v15 = -[HMDCHIPHomeDataSource initWithFabricID:home:]([HMDCHIPHomeDataSource alloc], "initWithFabricID:home:", v14, v12);
              v16 = v4[2](v4, v15);

              if ((v16 & 1) == 0)
              {

                goto LABEL_17;
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

    v6 = v21;
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@forAllStorageDataSourcesDo: Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDCHIPDataSource *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDCHIPDataSource *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource vendorMetadataRefreshTimer](self, "vendorMetadataRefreshTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Vendor metadata refresh timer fired; fetching vendor metadata from cloud",
        (uint8_t *)&v17,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCHIPDataSource vendorMetadataStore](v7, "vendorMetadataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchCloudMetadata");

  }
  -[HMDCHIPDataSource attestationDataRefreshTimer](self, "attestationDataRefreshTimer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Attestation data refresh timer fired; fetching attestation data from cloud",
        (uint8_t *)&v17,
        0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDCHIPDataSource attestationDataStore](v13, "attestationDataStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchCloudAttestationData");

  }
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
  v21 = v12;
  v22 = v13;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  dispatch_async(v14, block);

}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
  v21 = v12;
  v22 = v13;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  dispatch_async(v14, block);

}

- (void)browser:(id)a3 didRemoveAccessoryPairingWithNodeID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDCHIPDataSource *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCHIPDataSource *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HMDCHIPDataSource *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v6 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = self;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    v33 = v8;
    v31 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v32 = v13;
        objc_msgSend(v13, "hapAccessories");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v39;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v39 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_msgSend(v19, "matterNodeID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToNumber:", v6);

              if (v21)
              {
                v26 = (void *)MEMORY[0x227676638]();
                v27 = v34;
                HMFGetOSLogHandle();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "shortDescription");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v47 = v29;
                  v48 = 2112;
                  v49 = v6;
                  v50 = 2112;
                  v51 = v30;
                  _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Found accessory to remove from Apple Home with Matter node ID %@: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v26);
                v36[0] = MEMORY[0x24BDAC760];
                v36[1] = 3221225472;
                v36[2] = __65__HMDCHIPDataSource_browser_didRemoveAccessoryPairingWithNodeID___block_invoke;
                v36[3] = &unk_24E79BCC8;
                v36[4] = v27;
                v37 = v6;
                objc_msgSend(v32, "handleRemoveAccessory:completion:", v19, v36);

                goto LABEL_22;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
            if (v16)
              continue;
            break;
          }
        }

        v8 = v33;
        v11 = v31;
      }
      v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v10);
  }

  v22 = (void *)MEMORY[0x227676638]();
  v23 = v34;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v25;
    v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No accessory found in any homes with matter node id %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
LABEL_22:

}

- (void)handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDCHIPDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCHIPDataSource *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "integerValue");
    if (-[HMDCHIPDataSource locationAuthorization](self, "locationAuthorization") != v7)
    {
      v8 = (void *)MEMORY[0x227676638](-[HMDCHIPDataSource setLocationAuthorization:](self, "setLocationAuthorization:", v7));
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLocationAuthorizationAsString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Location Authorization is changing to %@, stopping thread network", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDCHIPDataSource activeThreadHome](v9, "activeThreadHome");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[HMDCHIPDataSource activeThreadHome](v9, "activeThreadHome");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stopThreadNetwork:", 1);

        -[HMDCHIPDataSource setActiveThreadHome:](v9, "setActiveThreadHome:", 0);
      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)handleHomeDidLeaveHomeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCHIPDataSource *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCHIPDataSource activeThreadHome](self, "activeThreadHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource setActiveThreadHome:](self, "setActiveThreadHome:", 0);
  -[HMDCHIPDataSource unregisterForLeaveNotifications:](self, "unregisterForLeaveNotifications:", v5);
  -[HMDCHIPDataSource unprotectedRegisterForArrivalNotifications:](self, "unprotectedRegisterForArrivalNotifications:", v5);
  os_unfair_lock_unlock(&self->_geo_lock);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fabric");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fabricID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@User left home, stopping thread network for fabric ID: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "stopThreadNetwork:", 1);
  if (-[HMDCHIPDataSource startThreadOnWakeEnabled](v7, "startThreadOnWakeEnabled"))
    -[HMDCHIPDataSource _startNetworkListenerForUserPreferredNetwork:](v7, "_startNetworkListenerForUserPreferredNetwork:", 1);

}

- (void)handleHomeDidArriveHomeNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDCHIPDataSource *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCHIPDataSource pendingThreadHome](self, "pendingThreadHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource setPendingThreadHome:](self, "setPendingThreadHome:", 0);
  -[HMDCHIPDataSource unregisterForArrivalNotifications:](self, "unregisterForArrivalNotifications:", v5);
  -[HMDCHIPDataSource unprotectedRegisterForLeaveNotifications:](self, "unprotectedRegisterForLeaveNotifications:", v5);
  os_unfair_lock_unlock(&self->_geo_lock);
  v6 = -[HMDCHIPDataSource startThreadOnWakeEnabled](self, "startThreadOnWakeEnabled");
  if ((v6 & 1) != 0)
    v6 = -[HMDCHIPDataSource _stopNetworkListenerForUserPreferredNetwork](self, "_stopNetworkListenerForUserPreferredNetwork");
  v7 = (void *)MEMORY[0x227676638](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fabric");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fabricID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@User arrived home, starting thread network for fabric ID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "startThreadNetwork:", 1);

}

- (void)unprotectedRegisterForLeaveNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDCHIPDataSource *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource activeThreadHome](self, "activeThreadHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v4 && (v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for leave notifications.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCHIPDataSource activeThreadHome](v10, "activeThreadHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDCHIPDataSource activeThreadHome](v10, "activeThreadHome");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPDataSource unregisterForLeaveNotifications:](v10, "unregisterForLeaveNotifications:", v14);

    }
    -[HMDCHIPDataSource notificationCenter](v10, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel_handleHomeDidLeaveHomeNotification_, CFSTR("HMDHomeDidLeaveHomeNotificationKey"), v4);

    -[HMDCHIPDataSource setActiveThreadHome:](v10, "setActiveThreadHome:", v4);
  }

}

- (void)registerForLeaveNotifications:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCHIPDataSource unprotectedRegisterForLeaveNotifications:](self, "unprotectedRegisterForLeaveNotifications:", v4);
  os_unfair_lock_unlock(&self->_geo_lock);

}

- (void)unregisterForLeaveNotifications:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering leave notifications.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPDataSource notificationCenter](v6, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v6, CFSTR("HMDHomeDidLeaveHomeNotificationKey"), v4);

}

- (void)unprotectedRegisterForArrivalNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDCHIPDataSource *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource pendingThreadHome](self, "pendingThreadHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v4 && (v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for arrival notifications.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCHIPDataSource pendingThreadHome](v10, "pendingThreadHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDCHIPDataSource pendingThreadHome](v10, "pendingThreadHome");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPDataSource unregisterForArrivalNotifications:](v10, "unregisterForArrivalNotifications:", v14);

    }
    -[HMDCHIPDataSource notificationCenter](v10, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel_handleHomeDidArriveHomeNotification_, CFSTR("HMDHomeDidArriveHomeNotificationKey"), v4);

    -[HMDCHIPDataSource setPendingThreadHome:](v10, "setPendingThreadHome:", v4);
  }

}

- (void)registerForArrivalNotifications:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCHIPDataSource unprotectedRegisterForArrivalNotifications:](self, "unprotectedRegisterForArrivalNotifications:", v4);
  os_unfair_lock_unlock(&self->_geo_lock);

}

- (void)unregisterForArrivalNotifications:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering arrival notifications.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPDataSource notificationCenter](v6, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v6, CFSTR("HMDHomeDidArriveHomeNotificationKey"), v4);

}

- (void)unregisterPresenceNotificationsForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDCHIPDataSource activeThreadHome](self, "activeThreadHome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[HMDCHIPDataSource unregisterForLeaveNotifications:](self, "unregisterForLeaveNotifications:", v12);
    -[HMDCHIPDataSource setActiveThreadHome:](self, "setActiveThreadHome:", 0);
  }
  -[HMDCHIPDataSource pendingThreadHome](self, "pendingThreadHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[HMDCHIPDataSource unregisterForArrivalNotifications:](self, "unregisterForArrivalNotifications:", v12);
    -[HMDCHIPDataSource setPendingThreadHome:](self, "setPendingThreadHome:", 0);
  }
  os_unfair_lock_unlock(&self->_geo_lock);

}

- (int64_t)checkPresenceForHome:(id)a3
{
  return objc_msgSend(a3, "homeLocation");
}

- (BOOL)hasValidGeoOrPreferredNetworkForHome:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  HMDCHIPDataSource *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  const char *v11;
  int64_t v12;
  _BOOL4 v13;
  HMDCHIPDataSource *v14;
  HMDCHIPDataSource *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = -[HMDCHIPDataSource checkPresenceForHome:](self, "checkPresenceForHome:", v4);
    if (v5 == 1)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v10;
        v23 = 2112;
        v24 = v4;
        v11 = "%{public}@Allowing geo as user is at home for: %@";
LABEL_5:
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v21, 0x16u);

      }
    }
    else
    {
      v12 = v5;
      v13 = -[HMDCHIPDataSource _getLocationAuthorized](self, "_getLocationAuthorized");
      if (v12 || !-[HMDCHIPDataSource pnExistsOnCurrentNetwork](self, "pnExistsOnCurrentNetwork") || !v13)
      {
        v6 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          HMStringFromHomeLocation();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCHIPDataSource pnExistsOnCurrentNetwork](v15, "pnExistsOnCurrentNetwork");
          HMFBooleanToString();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138544386;
          v22 = v16;
          v23 = 2112;
          v24 = v17;
          v25 = 2112;
          v26 = v18;
          v27 = 2112;
          v28 = v19;
          v29 = 2112;
          v30 = v4;
          _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Denying geo due to presence: %@, location authorization: %@, preferred network: %@ for: %@", (uint8_t *)&v21, 0x34u);

        }
        v9 = 0;
        goto LABEL_14;
      }
      v6 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v10;
        v23 = 2112;
        v24 = v4;
        v11 = "%{public}@Allowing geo due to valid preferred network for: %@";
        goto LABEL_5;
      }
    }
LABEL_14:

    objc_autoreleasePoolPop(v6);
    goto LABEL_15;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)_scheduleThreadNetworkRestart
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = dispatch_time(0, 2000000000);
  -[HMDCHIPDataSource setNetworkChangedLastUpdatedTime:](self, "setNetworkChangedLastUpdatedTime:", v3);
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__HMDCHIPDataSource__scheduleThreadNetworkRestart__block_invoke;
  v5[3] = &unk_24E797C10;
  v5[4] = self;
  v5[5] = v3;
  dispatch_after(v3, v4, v5);

}

- (void)startThreadRadioForHomeWithFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDCHIPDataSource *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCHIPDataSource *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  HMDCHIPDataSource *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCHIPDataSource *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      v24 = "%{public}@Home manager reference is nil";
LABEL_23:
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);

    }
LABEL_24:

    objc_autoreleasePoolPop(v20);
    goto LABEL_32;
  }
  if (!v4)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      v24 = "%{public}@fabricID is nil";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = v5;
  objc_msgSend(v5, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v35 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v12, "fabric");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fabricID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

      if (v15)
      {
        v6 = v33;
        if (!-[HMDCHIPDataSource threadPairingOverride](self, "threadPairingOverride"))
        {
          if ((-[HMDCHIPDataSource checkPresenceForHome:](self, "checkPresenceForHome:", v12) & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v25 = (void *)MEMORY[0x227676638]();
            v26 = self;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v28;
              v40 = 2112;
              v41 = v4;
              _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Not calling thread start for home with fabricID: %@ as user is not home", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v25);
            -[HMDCHIPDataSource registerForArrivalNotifications:](v26, "registerForArrivalNotifications:", v12);
LABEL_31:

            goto LABEL_32;
          }
          -[HMDCHIPDataSource registerForLeaveNotifications:](self, "registerForLeaveNotifications:", v12);
        }
        if (-[HMDCHIPDataSource startThreadOnWakeEnabled](self, "startThreadOnWakeEnabled"))
          -[HMDCHIPDataSource _stopNetworkListenerForUserPreferredNetwork](self, "_stopNetworkListenerForUserPreferredNetwork");
        v29 = (void *)MEMORY[0x227676638](-[HMDCHIPDataSource registerForLeaveNotifications:](self, "registerForLeaveNotifications:", v12));
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v32;
          v40 = 2112;
          v41 = v4;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Calling thread start for home with fabricID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v12, "startThreadNetwork:", 1);
        goto LABEL_31;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v9)
      continue;
    break;
  }
LABEL_11:

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v19;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v6 = v33;
LABEL_32:

}

- (void)stopThreadRadioForHomeWithFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDCHIPDataSource *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCHIPDataSource *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  HMDCHIPDataSource *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      v24 = "%{public}@Home manager reference is nil";
LABEL_23:
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);

    }
LABEL_24:

    objc_autoreleasePoolPop(v20);
    goto LABEL_25;
  }
  if (!v4)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      v24 = "%{public}@fabricID is nil";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = v5;
  objc_msgSend(v5, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "fabric");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fabricID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

        if (v15)
        {
          v25 = (void *)MEMORY[0x227676638]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v28;
            v36 = 2112;
            v37 = v4;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Calling thread stop for home with fabricID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          objc_msgSend(v12, "stopThreadNetwork:", 1);
          -[HMDCHIPDataSource unregisterPresenceNotificationsForHome:](v26, "unregisterPresenceNotificationsForHome:", v12);
          v6 = v29;
          if (-[HMDCHIPDataSource startThreadOnWakeEnabled](v26, "startThreadOnWakeEnabled"))
            -[HMDCHIPDataSource _startNetworkListenerForUserPreferredNetwork:](v26, "_startNetworkListenerForUserPreferredNetwork:", 1);

          goto LABEL_25;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v19;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v6 = v29;
LABEL_25:

}

- (void)handleThreadBTCallStateChange:(BOOL)a3
{
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received thread call state change - isInCall = %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (!a3)
    -[HMDCHIPDataSource startThreadRadioForUserPreferredNetwork](v6, "startThreadRadioForUserPreferredNetwork");
}

- (void)handleNetworkStateChange
{
  void *v3;
  HMDCHIPDataSource *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Received network state change from Thread network event listener", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCHIPDataSource matterThreadRadioManager](v4, "matterThreadRadioManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](v4, "userPreferredThreadNetworkEventListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "threadNetworkConnectionState");
  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](v4, "userPreferredThreadNetworkEventListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyThreadRadioStateChanged:nodeType:fabricID:", v9, objc_msgSend(v10, "threadNetworkNodeType"), 0);

}

- (BOOL)_getLocationAuthorized
{
  void *v2;
  BOOL v3;

  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationAuthorized") == 1;

  return v3;
}

- (void)_getPreferredNetworkExists
{
  void *v3;
  void *v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCHIPDataSource *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  int v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v3 = (void *)WiFiCopyCurrentNetworkInfoEx();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ssid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 1024;
    v22 = v16;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking if preferred network exists for SSID: %@ error: %d", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCHIPDataSource setPnExistsOnCurrentNetwork:](v6, "setPnExistsOnCurrentNetwork:", 0);
  -[HMDCHIPDataSource getDefaultThreadNetworkMetadataStore](v6, "getDefaultThreadNetworkMetadataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_initWeak((id *)buf, v6);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__HMDCHIPDataSource__getPreferredNetworkExists__block_invoke;
    v14[3] = &unk_24E787CA8;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v9, "retrievePreferredNetwork:completion:", 0, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCHIPDataSource *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  HMDCHIPDataSource *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCHIPDataSource *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  HMDCHIPDataSource *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  HMDCHIPDataSource *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  id v52;
  id obj;
  HMDCHIPDataSource *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v54 = self;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting Thread network for user preferred network with GEO and BR check", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCHIPDataSource getDefaultThreadNetworkMetadataStore](v54, "getDefaultThreadNetworkMetadataStore");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v50 = -[HMDCHIPDataSource _getLocationAuthorized](v54, "_getLocationAuthorized");
    -[HMDCHIPDataSource homeManager](v54, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v6;
    if (v6)
      v7 = v50;
    else
      v7 = 0;
    if (v7)
    {
      objc_msgSend(v6, "homes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_116_135932);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      obj = v9;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      if (v10)
      {
        v52 = 0;
        v11 = 0;
        v55 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v63 != v55)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(v13, "fabric");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "fabricID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v13, "matterAccessories");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "count")
                && -[HMDCHIPDataSource hasValidGeoOrPreferredNetworkForHome:](v54, "hasValidGeoOrPreferredNetworkForHome:", v13))
              {
                v17 = (void *)MEMORY[0x227676638]();
                v18 = v54;
                HMFGetOSLogHandle();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "fabric");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "fabricID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v67 = v20;
                  v68 = 2112;
                  v69 = v22;
                  v70 = 2112;
                  v71 = v13;
                  _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Is in Geo for home with fabricID %@ - %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v17);
                if (!v52)
                {
                  objc_msgSend(v13, "threadOperationalDataset");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = v23 == 0;

                  if (v24)
                    v52 = 0;
                  else
                    v52 = v13;
                }
                v11 = 1;
              }

            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        }
        while (v10);
      }
      else
      {
        v52 = 0;
        v11 = 0;
      }

      v33 = v11 & 1;
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v54;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil - skipping in-geo && matter check", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      v52 = 0;
      v33 = 0;
    }
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v54;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v67 = v37;
      v68 = 2112;
      v69 = v38;
      v70 = 2112;
      v71 = v39;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@startThreadRadioForUserPreferredNetwork: isLocationAuthorized = %@. isInGeoForAnyHome = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
    if (((!v50 | v33) & 1) == 0)
    {
      v40 = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWakeBypassAccessoryRequirement"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v35;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
      if (v40)
      {
        if (v44)
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v67 = v48;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Not in-geo for any home and no accessories in matter locker, not starting thread", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v41);
        goto LABEL_43;
      }
      if (v44)
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v45;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Not in-geo for any home and no accessories in matter locker, allowing thread start anyways", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
    }
    -[HMDCHIPDataSource getSharedThreadResidentCommissioner](v35, "getSharedThreadResidentCommissioner");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCHIPDataSource _startNetworkListenerForUserPreferredNetwork:](v35, "_startNetworkListenerForUserPreferredNetwork:", 1);
    objc_initWeak((id *)buf, v35);
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_119;
    v56[3] = &unk_24E787D18;
    objc_copyWeak(&v60, (id *)buf);
    v57 = v51;
    v58 = v52;
    v47 = v46;
    v59 = v47;
    v61 = v33;
    objc_msgSend(v57, "retrieveBorderRouterPreferredNetworkWithCompletion:", v56);

    objc_destroyWeak(&v60);
    objc_destroyWeak((id *)buf);

LABEL_43:
    goto LABEL_44;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = v54;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v28;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
LABEL_44:

}

- (void)startThreadRadioForUserPreferredNetwork
{
  void *v3;
  HMDCHIPDataSource *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDCHIPDataSource *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[HMDCHIPDataSource startThreadOnWakeEnabled](self, "startThreadOnWakeEnabled"))
  {
    -[HMDCHIPDataSource startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck](self, "startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck");
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting Thread network for user preferred network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDCHIPDataSource getDefaultThreadNetworkMetadataStore](v4, "getDefaultThreadNetworkMetadataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMDCHIPDataSource getSharedThreadResidentCommissioner](v4, "getSharedThreadResidentCommissioner");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPDataSource _startNetworkListenerForUserPreferredNetwork:](v4, "_startNetworkListenerForUserPreferredNetwork:", 0);
      objc_initWeak((id *)buf, v4);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke;
      v14[3] = &unk_24E787D40;
      objc_copyWeak(&v16, (id *)buf);
      v9 = v8;
      v15 = v9;
      objc_msgSend(v7, "retrievePreferredNetwork:completion:", 0, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
}

- (void)stopThreadRadioForUserPreferredNetwork
{
  void *v3;
  HMDCHIPDataSource *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Thread network for user preferred network", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCHIPDataSource _stopNetworkListenerForUserPreferredNetwork](v4, "_stopNetworkListenerForUserPreferredNetwork");
  -[HMDCHIPDataSource getSharedThreadResidentCommissioner](v4, "getSharedThreadResidentCommissioner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__HMDCHIPDataSource_stopThreadRadioForUserPreferredNetwork__block_invoke;
  v8[3] = &unk_24E79BD80;
  v8[4] = v4;
  objc_msgSend(v7, "stopThreadNetworkWithCompletion:", v8);

}

- (void)_startNetworkListenerForUserPreferredNetwork:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  HMDCHIPThreadNetworkEventListener *v7;
  void *v8;

  v3 = a3;
  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDCHIPDataSource getSharedThreadResidentCommissioner](self, "getSharedThreadResidentCommissioner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDCHIPThreadNetworkEventListener initWithThreadResidentCommissioner:]([HMDCHIPThreadNetworkEventListener alloc], "initWithThreadResidentCommissioner:", v6);
    -[HMDCHIPDataSource setUserPreferredThreadNetworkEventListener:](self, "setUserPreferredThreadNetworkEventListener:", v7);

    -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEventListenerDelegate:", self);

  }
  -[HMDCHIPDataSource setThreadNetworkShouldRestartOnNetworkChange:](self, "setThreadNetworkShouldRestartOnNetworkChange:", v3);
}

- (void)_stopNetworkListenerForUserPreferredNetwork
{
  void *v3;

  -[HMDCHIPDataSource setThreadNetworkShouldRestartOnNetworkChange:](self, "setThreadNetworkShouldRestartOnNetworkChange:", 0);
  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopListeningForEvents");

  -[HMDCHIPDataSource setUserPreferredThreadNetworkEventListener:](self, "setUserPreferredThreadNetworkEventListener:", 0);
}

- (void)stopThreadRadioOnDeviceLock
{
  void *v3;
  HMDCHIPDataSource *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Thread network after device lock", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCHIPDataSource getSharedThreadResidentCommissioner](v4, "getSharedThreadResidentCommissioner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__HMDCHIPDataSource_stopThreadRadioOnDeviceLock__block_invoke;
  v8[3] = &unk_24E79BD80;
  v8[4] = v4;
  objc_msgSend(v7, "stopThreadNetworkOnDeviceLockWithCompletion:", v8);

}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 withFabricID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDCHIPDataSource *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCHIPDataSource *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  void *v32;
  _QWORD v33[5];
  id v34;
  void (**v35)(_QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v31 = (void (**)(_QWORD, _QWORD))v10;
    v32 = v8;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v11;
    objc_msgSend(v11, "homes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          if (v9)
          {
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v18, "fabric");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fabricID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToNumber:", v9);

            if (v21)
            {
              v33[0] = MEMORY[0x24BDAC760];
              v33[1] = 3221225472;
              v33[2] = __86__HMDCHIPDataSource_connectToAccessoryWithExtendedMACAddress_withFabricID_completion___block_invoke;
              v33[3] = &unk_24E79AB68;
              v33[4] = self;
              v8 = v32;
              v34 = v32;
              v10 = v31;
              v35 = v31;
              objc_msgSend(v18, "connectToThreadAccessoryWithExtendedMACAddress:completion:", v34, v33);

              goto LABEL_18;
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v15)
          continue;
        break;
      }
    }

    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v25;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    ((void (**)(_QWORD, void *))v31)[2](v31, v13);
    v8 = v32;
LABEL_18:
    v12 = v30;
  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

- (void)connectToAccessoryForUserPreferredNetworkWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCHIPDataSource getSharedThreadResidentCommissioner](self, "getSharedThreadResidentCommissioner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectToThreadAccessoryWithExtendedMACAddress:completion:", v7, v6);

}

- (void)handleThreadNetworkStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  HMDCHIPDataSource *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    if (!-[HMDCHIPDataSource pendingRadioStateChangeNotification](self, "pendingRadioStateChangeNotification"))
    {
      -[HMDCHIPDataSource setPendingRadioStateChangeNotification:](self, "setPendingRadioStateChangeNotification:", 1);
      objc_initWeak(location, self);
      v8 = dispatch_time(0, 50000000);
      dispatch_get_global_queue(21, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __65__HMDCHIPDataSource_handleThreadNetworkStateChangedNotification___block_invoke;
      v14[3] = &unk_24E7972B0;
      objc_copyWeak(&v16, location);
      v15 = v7;
      dispatch_after(v8, v9, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No home associated with network connection state change notification", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleThreadNetworkWakeOnConnectionStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDCHIPDataSource *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    -[HMDCHIPDataSource matterThreadRadioManager](self, "matterThreadRadioManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "connectionState");
    objc_msgSend(v7, "eMACAddressAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notifyWakeOnDeviceConnectionChanged:eMACAddress:", v9, v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Event not of type thread wake on connection state changed", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleThreadNetworkPeripheralDeviceNodeTypeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDCHIPDataSource *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    -[HMDCHIPDataSource matterThreadRadioManager](self, "matterThreadRadioManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notifyPeripheralDeviceNodeTypeChanged:", objc_msgSend(v7, "peripheralDeviceNodeType"));

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Event not of type HMDThreadNetworkPeripheralDeviceNodeTypeEvent", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (int64_t)getThreadNetworkConnectionStateWithFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMDCHIPDataSource *v17;
  NSObject *v18;
  void *v19;
  int64_t v20;
  void *v21;
  HMDCHIPDataSource *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      v25 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    }
LABEL_21:

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_22;
  }
  if (!v4)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      v25 = "%{public}@fabricID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v5;
  objc_msgSend(v5, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "fabric");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fabricID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

        if ((v15 & 1) != 0)
        {
          v20 = objc_msgSend(v12, "threadNetworkConnectionState");

          goto LABEL_17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@No home found with fabricID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_17:
  v6 = v27;
LABEL_22:

  return v20;
}

- (int64_t)getThreadNetworkNodeTypeWithFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMDCHIPDataSource *v17;
  NSObject *v18;
  void *v19;
  int64_t v20;
  void *v21;
  HMDCHIPDataSource *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      v25 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    }
LABEL_21:

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_22;
  }
  if (!v4)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      v25 = "%{public}@fabricID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v5;
  objc_msgSend(v5, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "fabric");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fabricID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

        if ((v15 & 1) != 0)
        {
          v20 = objc_msgSend(v12, "threadNetworkNodeType");

          goto LABEL_17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@No home found with fabricID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = 0;
LABEL_17:
  v6 = v27;
LABEL_22:

  return v20;
}

- (int64_t)getUserPreferredThreadNetworkConnectionStateWithError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *a3 = 0;
    -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "threadNetworkConnectionState");

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
}

- (int64_t)getUserPreferredThreadNetworkNodeTypeWithError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;

  -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *a3 = 0;
    -[HMDCHIPDataSource userPreferredThreadNetworkEventListener](self, "userPreferredThreadNetworkEventListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "threadNetworkNodeType");

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
}

- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  HMDCHIPDataSource *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDCHIPDataSource *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  _BOOL4 v33;
  void *v34;
  void (**v35)(id, void *);
  void *v36;
  _QWORD v37[5];
  id v38;
  void (**v39)(id, void *);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      v32 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);

    }
LABEL_21:

    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v15);
    goto LABEL_22;
  }
  if (!v11)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      v32 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v33 = v7;
  v35 = v12;
  v36 = v10;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v13;
  objc_msgSend(v13, "homes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v20, "fabric");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fabricID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToNumber:", v11);

        if (v23)
        {
          -[HMDCHIPDataSource overrideLocationCheckForPairingForFabricID:](self, "overrideLocationCheckForPairingForFabricID:", v11);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __97__HMDCHIPDataSource_startAccessoryPairingWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke;
          v37[3] = &unk_24E79AB68;
          v37[4] = self;
          v10 = v36;
          v38 = v36;
          v12 = v35;
          v39 = v35;
          objc_msgSend(v20, "startThreadAccessoryPairingWithExtendedMACAddress:isWedDevice:completion:", v38, v33, v37);

          goto LABEL_17;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v17)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    v46 = 2112;
    v47 = v11;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;
  v35[2](v35, v15);
  v10 = v36;
LABEL_17:
  v14 = v34;
LABEL_22:

}

- (void)overrideLocationCheckForPairingForFabricID:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDCHIPDataSource *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDCHIPDataSource setThreadPairingOverride:](self, "setThreadPairingOverride:", 1);
    v5 = (void *)MEMORY[0x227676638](-[HMDCHIPDataSource setThreadPairingFabricID:](self, "setThreadPairingFabricID:", v4));
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCHIPDataSource threadPairingFabricID](v6, "threadPairingFabricID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Allowing thread start for pairing with fabricID: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Not setting pairing override as fabricID is null.", (uint8_t *)&v12, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)stopAccessoryPairingWithFabricID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDCHIPDataSource *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCHIPDataSource *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  void *v28;
  HMDCHIPDataSource *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void (**v33)(id, void *);
  _QWORD v34[5];
  void (**v35)(id, void *);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      v27 = "%{public}@Home manager reference is nil";
LABEL_22:
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    }
LABEL_23:

    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    goto LABEL_24;
  }
  if (!v6)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      v27 = "%{public}@Fabric ID is nil";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v32 = v8;
  v33 = v7;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v8, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "fabric");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fabricID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToNumber:", v6);

        if (v18)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __65__HMDCHIPDataSource_stopAccessoryPairingWithFabricID_completion___block_invoke;
          v34[3] = &unk_24E79B3A0;
          v34[4] = self;
          v7 = v33;
          v35 = v33;
          objc_msgSend(v15, "stopThreadAccessoryPairingWithCompletion:", v34);
          -[HMDCHIPDataSource setThreadPairingOverride:](self, "setThreadPairingOverride:", 0);
          v28 = (void *)MEMORY[0x227676638](-[HMDCHIPDataSource setThreadPairingFabricID:](self, "setThreadPairingFabricID:", 0));
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v31;
            v42 = 2112;
            v43 = v15;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting thread start pairing override to NO for home %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);

          goto LABEL_19;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v22;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v33;
  v33[2](v33, v10);
LABEL_19:
  v9 = v32;
LABEL_24:

}

- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  HMDCHIPDataSource *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDCHIPDataSource *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  _BOOL4 v33;
  void *v34;
  void (**v35)(id, void *);
  void *v36;
  _QWORD v37[5];
  id v38;
  void (**v39)(id, void *);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      v32 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);

    }
LABEL_21:

    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v15);
    goto LABEL_22;
  }
  if (!v11)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      v32 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v33 = v7;
  v35 = v12;
  v36 = v10;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v13;
  objc_msgSend(v13, "homes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v20, "fabric");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fabricID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToNumber:", v11);

        if (v23)
        {
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __104__HMDCHIPDataSource_startAccessoryFirmwareUpdateWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke;
          v37[3] = &unk_24E79AB68;
          v37[4] = self;
          v10 = v36;
          v38 = v36;
          v12 = v35;
          v39 = v35;
          objc_msgSend(v20, "startThreadAccessoryFirmwareUpdateWithExtendedMACAddress:isWedDevice:completion:", v38, v33, v37);

          goto LABEL_17;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v17)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    v46 = 2112;
    v47 = v11;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;
  v35[2](v35, v15);
  v10 = v36;
LABEL_17:
  v14 = v34;
LABEL_22:

}

- (void)stopAccessoryFirmwareUpdateWithFabricID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDCHIPDataSource *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCHIPDataSource *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  void *v28;
  void (**v29)(id, void *);
  _QWORD v30[5];
  void (**v31)(id, void *);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      v27 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    }
LABEL_21:

    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    goto LABEL_22;
  }
  if (!v6)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      v27 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v28 = v8;
  v29 = v7;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v8, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v15, "fabric");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fabricID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToNumber:", v6);

        if (v18)
        {
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __72__HMDCHIPDataSource_stopAccessoryFirmwareUpdateWithFabricID_completion___block_invoke;
          v30[3] = &unk_24E79B3A0;
          v30[4] = self;
          v7 = v29;
          v31 = v29;
          objc_msgSend(v15, "stopThreadAccessoryFirmwareUpdateWithCompletion:", v30);

          goto LABEL_17;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v22;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  v29[2](v29, v10);
LABEL_17:
  v9 = v28;
LABEL_22:

}

- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  HMDCHIPDataSource *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPDataSource homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      v31 = "%{public}@Home manager reference is nil";
LABEL_29:
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);

    }
LABEL_30:

    objc_autoreleasePoolPop(v27);
    goto LABEL_31;
  }
  if (!v4)
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      v31 = "%{public}@Fabric ID is nil";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v5, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    v36 = v7;
    v34 = *(_QWORD *)v42;
    do
    {
      v11 = 0;
      v35 = v9;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        objc_msgSend(v12, "fabric");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fabricID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

        if (v15)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v12, "hapAccessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                if (objc_msgSend(v21, "supportsCHIP"))
                {
                  objc_msgSend(v21, "supportedLinkLayerTypes");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v22)
                    goto LABEL_26;
                  objc_msgSend(v21, "supportedLinkLayerTypes");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "unsignedIntValue");

                  objc_msgSend(v21, "supportedLinkLayerTypes");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "unsignedIntValue");

                  if ((v24 & 0x10) != 0 || !v26)
                  {
LABEL_26:

                    v32 = 1;
                    goto LABEL_32;
                  }
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v18)
                continue;
              break;
            }
          }

          v9 = v35;
          v7 = v36;
          v10 = v34;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v9);
  }

LABEL_31:
  v32 = 0;
LABEL_32:

  return v32;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMMTRVendorMetadataStore)vendorMetadataStore
{
  return (HMMTRVendorMetadataStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVendorMetadataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMMTRAttestationDataStore)attestationDataStore
{
  return (HMMTRAttestationDataStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttestationDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return (HMMTRUIDialogPresenter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUiDialogPresenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMFTimer)vendorMetadataRefreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (HMFTimer)attestationDataRefreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (HMDUIDialogPresenter)dialogPresenter
{
  return (HMDUIDialogPresenter *)objc_getProperty(self, a2, 88, 1);
}

- (HMMTRResidentStateManager)chipResidentStateManager
{
  return (HMMTRResidentStateManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setChipResidentStateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMMTRStorage)chipStorage
{
  return (HMMTRStorage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChipStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (HMMTRAccessoryServerBrowser)matterAccessoryServerBrowser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_matterAccessoryServerBrowser);
}

- (void)setMatterAccessoryServerBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_matterAccessoryServerBrowser, a3);
}

- (HMMTRThreadRadioManager)matterThreadRadioManager
{
  return (HMMTRThreadRadioManager *)objc_loadWeakRetained((id *)&self->_matterThreadRadioManager);
}

- (void)setMatterThreadRadioManager:(id)a3
{
  objc_storeWeak((id *)&self->_matterThreadRadioManager, a3);
}

- (HMDHome)activeThreadHome
{
  return (HMDHome *)objc_getProperty(self, a2, 128, 1);
}

- (void)setActiveThreadHome:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (HMDHome)pendingThreadHome
{
  return (HMDHome *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPendingThreadHome:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (BOOL)pendingRadioStateChangeNotification
{
  return self->_pendingRadioStateChangeNotification;
}

- (void)setPendingRadioStateChangeNotification:(BOOL)a3
{
  self->_pendingRadioStateChangeNotification = a3;
}

- (BOOL)threadPairingOverride
{
  return self->_threadPairingOverride;
}

- (void)setThreadPairingOverride:(BOOL)a3
{
  self->_threadPairingOverride = a3;
}

- (NSNumber)threadPairingFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setThreadPairingFabricID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (HMDCHIPThreadNetworkEventListener)userPreferredThreadNetworkEventListener
{
  return (HMDCHIPThreadNetworkEventListener *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUserPreferredThreadNetworkEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)pnExistsOnCurrentNetwork
{
  return self->_pnExistsOnCurrentNetwork;
}

- (void)setPnExistsOnCurrentNetwork:(BOOL)a3
{
  self->_pnExistsOnCurrentNetwork = a3;
}

- (unint64_t)networkChangedLastUpdatedTime
{
  return self->_networkChangedLastUpdatedTime;
}

- (void)setNetworkChangedLastUpdatedTime:(unint64_t)a3
{
  self->_networkChangedLastUpdatedTime = a3;
}

- (BOOL)threadNetworkShouldRestartOnNetworkChange
{
  return self->_threadNetworkShouldRestartOnNetworkChange;
}

- (void)setThreadNetworkShouldRestartOnNetworkChange:(BOOL)a3
{
  self->_threadNetworkShouldRestartOnNetworkChange = a3;
}

- (BOOL)startThreadOnWakeEnabled
{
  return self->_startThreadOnWakeEnabled;
}

- (void)setStartThreadOnWakeEnabled:(BOOL)a3
{
  self->_startThreadOnWakeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferredThreadNetworkEventListener, 0);
  objc_storeStrong((id *)&self->_threadPairingFabricID, 0);
  objc_storeStrong((id *)&self->_pendingThreadHome, 0);
  objc_storeStrong((id *)&self->_activeThreadHome, 0);
  objc_destroyWeak((id *)&self->_matterThreadRadioManager);
  objc_destroyWeak((id *)&self->_matterAccessoryServerBrowser);
  objc_storeStrong((id *)&self->_chipStorage, 0);
  objc_storeStrong((id *)&self->_chipResidentStateManager, 0);
  objc_storeStrong((id *)&self->_dialogPresenter, 0);
  objc_storeStrong((id *)&self->_attestationDataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_vendorMetadataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_attestationDataStore, 0);
  objc_storeStrong((id *)&self->_vendorMetadataStore, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __72__HMDCHIPDataSource_stopAccessoryFirmwareUpdateWithFabricID_completion___block_invoke(uint64_t a1, void *a2)
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
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread accessory firmware update, error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __104__HMDCHIPDataSource_startAccessoryFirmwareUpdateWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread accessory firmware update with emac %@, error %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __65__HMDCHIPDataSource_stopAccessoryPairingWithFabricID_completion___block_invoke(uint64_t a1, void *a2)
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
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread accessory pairing, error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __97__HMDCHIPDataSource_startAccessoryPairingWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread accessory pairing with emac %@, error %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __65__HMDCHIPDataSource_handleThreadNetworkStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPendingRadioStateChangeNotification:", 0);
  objc_msgSend(WeakRetained, "matterThreadRadioManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "threadNetworkConnectionState");
  v4 = objc_msgSend(*(id *)(a1 + 32), "threadNetworkNodeType");
  objc_msgSend(*(id *)(a1 + 32), "fabric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyThreadRadioStateChanged:nodeType:fabricID:", v3, v4, v6);

}

void __86__HMDCHIPDataSource_connectToAccessoryWithExtendedMACAddress_withFabricID_completion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory with emac %@, error %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __48__HMDCHIPDataSource_stopThreadRadioOnDeviceLock__block_invoke(uint64_t a1, void *a2)
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

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v9 = "%{public}@Failed to stop Thread network with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully stopped Thread network";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __59__HMDCHIPDataSource_stopThreadRadioForUserPreferredNetwork__block_invoke(uint64_t a1, void *a2)
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

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v9 = "%{public}@Failed to stop Thread network with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully stopped Thread network";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = WeakRetained;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v11 || v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve operationalDataset for thread network: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v15, "_stopNetworkListenerForUserPreferredNetwork");
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v18;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v11;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ from network metadata store", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 32), "setGeoAvailable:", 0);
      v19 = *(void **)(a1 + 32);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke_123;
      v24[3] = &unk_24E79BCC8;
      v24[4] = v15;
      v25 = v10;
      objc_msgSend(v19, "startThreadNetworkWithOperationalDataset:threadNetworkID:isOwnerUser:completion:", v11, v25, 0, v24);

    }
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

void __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
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
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to attach to user preferred thread network %@: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_stopNetworkListenerForUserPreferredNetwork");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Attached to thread network %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "userPreferredThreadNetworkEventListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v5 || v6)
      {
        objc_initWeak((id *)buf, v8);
        v18 = *(void **)(a1 + 32);
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_120;
        v19[3] = &unk_24E787CF0;
        objc_copyWeak(&v24, (id *)buf);
        v20 = v6;
        v21 = *(id *)(a1 + 40);
        v22 = v5;
        v23 = *(id *)(a1 + 48);
        v25 = *(_BYTE *)(a1 + 64);
        objc_msgSend(v18, "retrievePreferredNetwork:completion:", 0, v19);

        objc_destroyWeak(&v24);
        objc_destroyWeak((id *)buf);
        goto LABEL_15;
      }
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v8;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Border router present on network - not starting thread", buf, 0xCu);

      }
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v8;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v17;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Aborting thread start after border router check - thread was started for a home", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
LABEL_15:

}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_120(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v14 = WeakRetained;
  if (!WeakRetained)
  {
    v32 = MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v36 = (void *)v32;
      goto LABEL_18;
    }
    HMFGetLogIdentifier();
    v34 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v34;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(WeakRetained, "userPreferredThreadNetworkEventListener");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v32 = MEMORY[0x227676638]();
    v33 = v14;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Aborting thread start after getting preferred network - thread was started for a home", buf, 0xCu);

    }
    goto LABEL_16;
  }
  if (!v11 || *(_QWORD *)(a1 + 32))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = v9;
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "fabric");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fabricID");
        v39 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v43 = v21;
        v44 = 2112;
        v45 = v23;
        v46 = 2112;
        v47 = v24;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Using cached AOD from home with fabricID %@ - %@", buf, 0x20u);

        v17 = v39;
        v9 = v38;
      }

      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "threadOperationalDataset");
      v25 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v25;
      goto LABEL_9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v37;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@No cached AOD available as a fallback, aborting thread start", buf, 0xCu);

    }
    v36 = v17;
LABEL_18:
    objc_autoreleasePoolPop(v36);
    goto LABEL_19;
  }
LABEL_9:
  v26 = (void *)MEMORY[0x227676638]();
  v27 = v14;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v43 = v29;
    v44 = 2112;
    v45 = v30;
    v46 = 2112;
    v47 = v10;
    v48 = 2112;
    v49 = v11;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ from network metadata store", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(*(id *)(a1 + 56), "setGeoAvailable:", *(unsigned __int8 *)(a1 + 72));
  v31 = *(void **)(a1 + 56);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_121;
  v40[3] = &unk_24E79BCC8;
  v40[4] = v27;
  v41 = v10;
  objc_msgSend(v31, "startThreadNetworkWithOperationalDataset:threadNetworkID:isOwnerUser:completion:", v11, v41, 0, v40);

LABEL_19:
}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_121(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x227676638]();
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
      v10 = "%{public}@Failed to attach to user preferred thread network %@: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

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
    v10 = "%{public}@Attached to thread network %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "reachableAccessoriesCount");
  if (v6 == objc_msgSend(v5, "reachableAccessoriesCount"))
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "compare:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "reachableAccessoriesCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "reachableAccessoriesCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "compare:", v8);
  }

  return v11;
}

void __47__HMDCHIPDataSource__getPreferredNetworkExists__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v14 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      objc_autoreleasePoolPop(v14);
      goto LABEL_12;
    }
    HMFGetLogIdentifier();
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", (uint8_t *)&v20, 0xCu);
LABEL_10:

    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x227676638]();
  v15 = WeakRetained;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@No thread network found for current Wifi", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_10;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v18;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ for current network", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[NSObject setPnExistsOnCurrentNetwork:](v15, "setPnExistsOnCurrentNetwork:", 1);
LABEL_12:

}

void __50__HMDCHIPDataSource__scheduleThreadNetworkRestart__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "networkChangedLastUpdatedTime"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring Wifi network changed as newer request is queued.", (uint8_t *)&v13, 0xCu);

    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_getPreferredNetworkExists");
  v3 = objc_msgSend(*(id *)(a1 + 32), "threadNetworkShouldRestartOnNetworkChange");
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring WiFi network changed notification when Thread is not up", (uint8_t *)&v13, 0xCu);

    }
LABEL_12:
    objc_autoreleasePoolPop(v4);
    return;
  }
  if (v7)
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Restarting Thread network for user preferred network upon WiFi network changed notification", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "startThreadRadioForUserPreferredNetwork");
}

void __65__HMDCHIPDataSource_browser_didRemoveAccessoryPairingWithNodeID___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x227676638]();
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
      v10 = "%{public}@Failed to remove accessory from Apple Home with Matter node ID %@: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

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
    v10 = "%{public}@Successfully removed accessory from Apple Home with Matter node ID: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dialogPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSkipAuthPromptDialog");

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Defaults write set - skipping auth prompt for bridge accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Presenting user with auth prompt for bridge accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "dialogPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_107;
    v14[3] = &unk_24E7935F0;
    v13 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v10, "requestUserPermissionForBridgeAccessory:withContext:queue:completionHandler:", v11, v12, v13, v14);

  }
}

uint64_t __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dialogPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSkipAuthPromptDialog");

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Defaults write set - skipping auth prompt for unauthenticated accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Presenting user with auth prompt for unauthenticated accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "dialogPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_105;
    v14[3] = &unk_24E7935F0;
    v13 = *(_QWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v10, "requestUserPermissionForUnauthenticatedAccessory:withContext:queue:completionHandler:", v11, v12, v13, v14);

  }
}

uint64_t __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__HMDCHIPDataSource_currentFabricID__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "reachableAccessoriesCount");
  if (v6 == objc_msgSend(v5, "reachableAccessoriesCount"))
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "compare:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "reachableAccessoriesCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "reachableAccessoriesCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "compare:", v8);
  }

  return v11;
}

uint64_t __36__HMDCHIPDataSource_currentFabricID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDeviceConfirmedPrimaryResident");
}

uint64_t __33__HMDCHIPDataSource_allFabricIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matterFabricID");
}

BOOL __40__HMDCHIPDataSource_homeWithCHIPFabric___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "fabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentHomeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "primaryHomeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

BOOL __25__HMDCHIPDataSource_home__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "chipStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOwnerUser");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_136083 != -1)
    dispatch_once(&logCategory__hmf_once_t26_136083, &__block_literal_global_102);
  return (id)logCategory__hmf_once_v27_136084;
}

void __32__HMDCHIPDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27_136084;
  logCategory__hmf_once_v27_136084 = v0;

}

@end
