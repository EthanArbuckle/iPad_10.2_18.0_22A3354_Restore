@implementation HMDAccessoryFirmwareUpdateManager

- (HMDAccessoryFirmwareUpdateManager)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3
{
  return -[HMDAccessoryFirmwareUpdateManager initWithHomeManager:wingman:](self, "initWithHomeManager:wingman:", a3, 0);
}

- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3 wingman:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryFirmwareUpdateManager *v8;
  HMDAccessoryFirmwareUpdateManager *v9;
  HMDAccessoryFirmwareUpdateManagerWingman *v10;
  HMDAccessoryFirmwareUpdateManagerWingman *wingman;
  HMDDefaultUARPControllerDelegate *v12;
  HMDDefaultUARPControllerDelegate *defaultUARPControllerDelegate;
  HMDDefaultUARPControllerDelegate *v14;
  void *v15;
  HMDMatterUARPControllerDelegate *v16;
  HMDMatterUARPControllerDelegate *matterUARPControllerDelegate;
  HMDMatterUARPControllerDelegate *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *activeSessions;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *logEventManager;
  uint64_t v27;
  NSMapTable *registeredAccessories;
  NSMutableDictionary *v29;
  NSMutableDictionary *accessoryRetries;
  uint64_t v31;
  OS_dispatch_queue *workQueue;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  HMDAccessoryFirmwareUpdateManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  HMDAccessoryFirmwareUpdateManager *v51;
  NSObject *v52;
  void *v53;
  id v55;
  objc_super v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HMDAccessoryFirmwareUpdateManager;
  v8 = -[HMDAccessoryFirmwareUpdateManager init](&v56, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    if (v7)
      v10 = (HMDAccessoryFirmwareUpdateManagerWingman *)v7;
    else
      v10 = objc_alloc_init(HMDAccessoryFirmwareUpdateManagerWingman);
    wingman = v9->_wingman;
    v9->_wingman = v10;

    v12 = -[HMDDefaultUARPControllerDelegate initWithAccessoryFirmwareUpdateManager:]([HMDDefaultUARPControllerDelegate alloc], "initWithAccessoryFirmwareUpdateManager:", v9);
    defaultUARPControllerDelegate = v9->_defaultUARPControllerDelegate;
    v9->_defaultUARPControllerDelegate = v12;

    v14 = v9->_defaultUARPControllerDelegate;
    -[HMDAccessoryFirmwareUpdateManagerWingman defaultUARPController](v9->_wingman, "defaultUARPController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v14);

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v16 = -[HMDMatterUARPControllerDelegate initWithAccessoryFirmwareUpdateManager:]([HMDMatterUARPControllerDelegate alloc], "initWithAccessoryFirmwareUpdateManager:", v9);
      matterUARPControllerDelegate = v9->_matterUARPControllerDelegate;
      v9->_matterUARPControllerDelegate = v16;

      v18 = v9->_matterUARPControllerDelegate;
      -[HMDAccessoryFirmwareUpdateManagerWingman matterUARPController](v9->_wingman, "matterUARPController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", v18);

    }
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeSessions = v9->_activeSessions;
    v9->_activeSessions = v20;

    v22 = [HMDAccessoryFirmwareUpdateConcurrencyLogEventManager alloc];
    objc_msgSend(v6, "metricsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "legacyCountersManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager initWithCountersManager:](v22, "initWithCountersManager:", v24);
    logEventManager = v9->_logEventManager;
    v9->_logEventManager = (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)v25;

    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    registeredAccessories = v9->_registeredAccessories;
    v9->_registeredAccessories = (NSMapTable *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessoryRetries = v9->_accessoryRetries;
    v9->_accessoryRetries = v29;

    objc_msgSend(v6, "workQueue");
    v31 = objc_claimAutoreleasedReturnValue();
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v31;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v9, sel_handleAccessoryFirmwareVersionUpdateNotification_, CFSTR("HMDAccessoryFirmwareVersionUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v9, sel_handleHomeAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObserver:selector:name:object:", v9, sel_handleMatterSettingsUpdateNotification_, CFSTR("HMDAccessoryVendorIDProductIDUpdatedNotification"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObserver:selector:name:object:", v9, sel_handleMatterSettingsUpdateNotification_, CFSTR("HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"), 0);

    }
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "preferenceForKey:", CFSTR("firmwareUpdateUARPCapturePath"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "stringValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v55 = v7;
      v40 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v40, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
      v41 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringFromDate:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@_%@"), v39, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDAccessoryFirmwareUpdateManager defaultUARPController](v9, "defaultUARPController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = objc_msgSend(v45, "startPacketCapture:", v44);

      if ((v43 & 1) == 0)
      {
        v46 = (void *)MEMORY[0x227676638]();
        v47 = v9;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v49;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Error starting UARP packet capture for UARP Controller", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v46);
      }
      v50 = (void *)MEMORY[0x227676638]();
      v51 = v9;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v53;
        v59 = 2112;
        v60 = v44;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@Started UARP packet capture for UARP Controller in: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v50);

      v7 = v55;
    }
    -[HMDAccessoryFirmwareUpdateManager startStatusTimer](v9, "startStatusTimer");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDAccessoryFirmwareUpdateManager defaultUARPController](self, "defaultUARPController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopPacketCapture");

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateManager;
  -[HMDAccessoryFirmwareUpdateManager dealloc](&v4, sel_dealloc);
}

- (BOOL)supportsFirmwareUpdate
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFirmwareUpdate");

  return v3;
}

- (id)availableSoftwareAssetForMatterAccessory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDAccessoryFirmwareUpdateManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  HMDAccessoryFirmwareUpdateManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessoryFirmwareUpdateManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDAccessoryFirmwareUpdateManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v20;
    v42 = 2112;
    v43 = v21;
    v44 = 2080;
    v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
    v22 = "%{public}@[%@] %s: Matter Accessory Software Update not enabled.";
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "supportsCHIP") & 1) != 0)
  {
    -[HMDAccessoryFirmwareUpdateManager sessionForAccessory:](self, "sessionForAccessory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "uarpAssetID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v9, "updateAvailabilityStatus"))
      {
        case 0:
        case 4:
        case 5:
          v10 = (void *)MEMORY[0x227676638]();
          v11 = self;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "shortDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "updateAvailabilityStatus");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v41 = v13;
            v42 = 2112;
            v43 = v14;
            v44 = 2080;
            v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
            v46 = 2114;
            v47 = v15;
            _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: These statuses should never be seen, ignore status %{public}@.", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v10);

          v9 = 0;
          v16 = 1;
          break;
        case 1:
        case 2:
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "shortDescription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v37;
            v42 = 2112;
            v43 = v38;
            v44 = 2080;
            v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: Image is busy downloading", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v34);

          v9 = 0;
          v16 = 2;
          break;
        case 3:
          v16 = 3;
          break;
        case 6:
        case 7:
        case 8:
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "shortDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "updateAvailabilityStatus");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v41 = v31;
            v42 = 2112;
            v43 = v32;
            v44 = 2080;
            v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
            v46 = 2114;
            v47 = v33;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: Image is not available %{public}@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v28);

          v9 = 0;
          v16 = 4;
          break;
        default:
          v16 = 0;
          break;
      }
      if (!a4)
        goto LABEL_31;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v26;
        v42 = 2112;
        v43 = v27;
        v44 = 2080;
        v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[%@] %s: no session", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      v9 = 0;
      if (!a4)
        goto LABEL_31;
      v16 = 4;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDAccessoryMatterUARPAssetErrorDomain"), v16, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

    goto LABEL_32;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v20;
    v42 = 2112;
    v43 = v21;
    v44 = 2080;
    v45 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
    v22 = "%{public}@[%@] %s: Accessory does not support Matter.";
LABEL_13:
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0x20u);

  }
LABEL_14:

  objc_autoreleasePoolPop(v17);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDAccessoryMatterUARPAssetErrorDomain"), 1, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_32:

  return v9;
}

- (id)registerAndCreateSessionForAccessory:(id)a3 updateUARPParameters:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  HMDAccessoryFirmwareUpdateManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAccessoryFirmwareUpdateManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessoryFirmwareUpdateManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  const char *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[HMDAccessoryFirmwareUpdateManager supportsFirmwareUpdate](self, "supportsFirmwareUpdate"))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v18;
      v40 = 2112;
      v41 = v19;
      v20 = "%{public}@[CHECK_AFU_SESSION][%@] Firmware Update not enabled on this device; ignoring";
      v21 = v17;
      v22 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_2218F0000, v21, v22, v20, (uint8_t *)&v38, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "supportsCHIP") & 1) == 0)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v18;
    v40 = 2112;
    v41 = v19;
    v20 = "%{public}@[CHECK_AFU_SESSION][%@] Matter firmware update not supported";
LABEL_17:
    v21 = v17;
    v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  if (!-[HMDAccessoryFirmwareUpdateManager registerAccessory:](self, "registerAccessory:", v6))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v18;
    v40 = 2112;
    v41 = v19;
    v20 = "%{public}@[CHECK_AFU_SESSION][%@] Failed to register accessory";
    goto LABEL_17;
  }
  if (-[HMDAccessoryFirmwareUpdateManager isAccessoryRegistered:](self, "isAccessoryRegistered:", v6))
  {
    -[HMDAccessoryFirmwareUpdateManager sessionForAccessory:](self, "sessionForAccessory:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (id)v7;
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543874;
        v39 = v12;
        v40 = 2112;
        v41 = v13;
        v42 = 2112;
        v43 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[CHECK_AFU_SESSION][%@] Do not need to establish a new session, existing session found: %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      v14 = 0;
      goto LABEL_35;
    }
    -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](self, "UARPAccessoryForHMDAccessory:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[HMDAccessoryFirmwareUpdateManager addSessionForUARPAccessory:](self, "addSessionForUARPAccessory:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = v25;
        if (v4)
        {
          objc_msgSend(v25, "updateAccessoryVendorIDAndProductID");
          objc_msgSend(v26, "updateAccessoryFirmwareVersion");
        }
        v27 = (void *)MEMORY[0x227676638]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543618;
          v39 = v30;
          v40 = 2112;
          v41 = v31;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@[CHECK_AFU_SESSION][%@] Firmware update registration and session creation complete", (uint8_t *)&v38, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v8 = v26;
        goto LABEL_34;
      }
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v35;
        v40 = 2112;
        v41 = v36;
        v37 = "%{public}@[CHECK_AFU_SESSION][%@] Failed to establish session for accessory";
        goto LABEL_32;
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v35;
        v40 = 2112;
        v41 = v36;
        v37 = "%{public}@[CHECK_AFU_SESSION][%@] UARP accessory is not found for accessory";
LABEL_32:
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v38, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v32);
    v8 = 0;
LABEL_34:

    v14 = v8;
LABEL_35:

    goto LABEL_20;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v18;
    v40 = 2112;
    v41 = v19;
    v20 = "%{public}@[CHECK_AFU_SESSION][%@] accessory not registered";
    goto LABEL_17;
  }
LABEL_19:

  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)UARPControllerForAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryFirmwareUpdateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDAccessoryFirmwareUpdateManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] UARPControllerForAccessory: Returning Matter UARP Controller", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessoryFirmwareUpdateManager matterUARPController](v6, "matterUARPController");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] UARPControllerForAccessory: Returning default UARP Controller", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDAccessoryFirmwareUpdateManager defaultUARPController](v12, "defaultUARPController");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v10;

  return v16;
}

- (UARPController)defaultUARPController
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateManager wingman](self, "wingman");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultUARPController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UARPController *)v3;
}

- (id)matterUARPController
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateManager wingman](self, "wingman");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matterUARPController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessoryRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager registeredAccessories](self, "registeredAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)handleAccessoryFirmwareVersionUpdateNotification:(id)a3
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
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__HMDAccessoryFirmwareUpdateManager_handleAccessoryFirmwareVersionUpdateNotification___block_invoke;
  block[3] = &unk_24E7972B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleAccessoryFirmwareVersionUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAccessoryFirmwareUpdateManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAccessoryFirmwareUpdateManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessoryFirmwareUpdateManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAccessoryFirmwareUpdateManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAccessoryFirmwareUpdateManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  HMDAccessoryFirmwareUpdateManager *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDAccessoryFirmwareUpdateManager *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessoryFirmwareUpdateManager supportsFirmwareUpdate](self, "supportsFirmwareUpdate"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (!v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 138543362;
        v58 = v29;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version update notification", (uint8_t *)&v57, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_opt_class();
      v36 = v35;
      v37 = objc_opt_class();
      v57 = 138543874;
      v58 = v33;
      v59 = 2112;
      v60 = v35;
      v61 = 2112;
      v62 = v37;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@The notification object of type %@ is not of expected type %@", (uint8_t *)&v57, 0x20u);

      goto LABEL_28;
    }
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 138543618;
      v58 = v12;
      v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received accessory firmware version update notification", (uint8_t *)&v57, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (-[HMDAccessoryFirmwareUpdateManager registerAccessory:](v9, "registerAccessory:", v7))
    {
      if (-[HMDAccessoryFirmwareUpdateManager isAccessoryRegistered:](v9, "isAccessoryRegistered:", v7))
      {
        -[HMDAccessoryFirmwareUpdateManager sessionForAccessory:](v9, "sessionForAccessory:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)MEMORY[0x227676638]();
          v17 = v9;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "shortDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 138543874;
            v58 = v19;
            v59 = 2112;
            v60 = v20;
            v61 = 2112;
            v62 = (uint64_t)v15;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Do not need to establish a new session with existing session: %@", (uint8_t *)&v57, 0x20u);

          }
          objc_autoreleasePoolPop(v16);
          goto LABEL_48;
        }
        -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](v9, "UARPAccessoryForHMDAccessory:", v7);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          -[HMDAccessoryFirmwareUpdateManager addSessionForUARPAccessory:](v9, "addSessionForUARPAccessory:", v40);
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v15 = (void *)v41;
            v42 = objc_msgSend(v7, "supportsCHIP");
            v43 = (void *)MEMORY[0x227676638]();
            v44 = v9;
            HMFGetOSLogHandle();
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = v45;
            if (v42)
            {
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "shortDescription");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = 138543618;
                v58 = v47;
                v59 = 2112;
                v60 = v48;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@[%@] Ignoring this notification for updating UARP with firmware version", (uint8_t *)&v57, 0x16u);

              }
              objc_autoreleasePoolPop(v43);
            }
            else
            {
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "shortDescription");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = 138543874;
                v58 = v55;
                v59 = 2112;
                v60 = v56;
                v61 = 2112;
                v62 = (uint64_t)v15;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating accessory firmware version with new session %@", (uint8_t *)&v57, 0x20u);

              }
              objc_autoreleasePoolPop(v43);
              objc_msgSend(v15, "updateAccessoryFirmwareVersion");
            }
            goto LABEL_47;
          }
          v49 = (void *)MEMORY[0x227676638]();
          v50 = v9;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "shortDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 138543618;
            v58 = v52;
            v59 = 2112;
            v60 = v53;
            v54 = "%{public}@[%@] Failed to start update for accessory because a session could not be established";
            goto LABEL_42;
          }
        }
        else
        {
          v49 = (void *)MEMORY[0x227676638]();
          v50 = v9;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "shortDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 138543618;
            v58 = v52;
            v59 = 2112;
            v60 = v53;
            v54 = "%{public}@[%@] UARP accessory is not found for accessory";
LABEL_42:
            _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, v54, (uint8_t *)&v57, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v49);
        v15 = 0;
LABEL_47:

LABEL_48:
        goto LABEL_30;
      }
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 138543618;
        v58 = v33;
        v59 = 2112;
        v60 = v38;
        v39 = "%{public}@[%@] Accessory not registered with FirmwareUpdateManager";
        goto LABEL_27;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 138543618;
        v58 = v33;
        v59 = 2112;
        v60 = v38;
        v39 = "%{public}@[%@] Failed to register accessory with FirmwareUpdateManager";
LABEL_27:
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_DEBUG, v39, (uint8_t *)&v57, 0x16u);

LABEL_28:
      }
    }
LABEL_29:

    objc_autoreleasePoolPop(v30);
LABEL_30:

    goto LABEL_31;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 138543362;
    v58 = v24;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version update notification", (uint8_t *)&v57, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  v25 = (void *)MEMORY[0x227676638]();
  v26 = v22;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 138543362;
    v58 = v28;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not enabled on this device; ignoring",
      (uint8_t *)&v57,
      0xCu);

  }
  objc_autoreleasePoolPop(v25);
LABEL_31:

}

- (void)handleMatterSettingsUpdateNotification:(id)a3
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
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDAccessoryFirmwareUpdateManager_handleMatterSettingsUpdateNotification___block_invoke;
  block[3] = &unk_24E7972B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleMatterSettingsUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAccessoryFirmwareUpdateManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAccessoryFirmwareUpdateManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMDAccessoryFirmwareUpdateManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HMDAccessoryFirmwareUpdateManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  HMDAccessoryFirmwareUpdateManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDAccessoryFirmwareUpdateManager *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDAccessoryFirmwareUpdateManager *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  HMDAccessoryFirmwareUpdateManager *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  HMDAccessoryFirmwareUpdateManager *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543362;
      v85 = v34;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received matter settings update notification", (uint8_t *)&v84, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v35 = MEMORY[0x227676638]();
    v36 = v9;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_opt_class();
    v41 = v40;
    v42 = objc_opt_class();
    v84 = 138543874;
    v85 = v38;
    v86 = 2112;
    v87 = v40;
    v88 = 2112;
    v89 = v42;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@The notification object of type %@ is not of expected type %@", (uint8_t *)&v84, 0x20u);

    goto LABEL_30;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 138543618;
    v85 = v12;
    v86 = 2112;
    v87 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received matter settings update notification", (uint8_t *)&v84, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!-[HMDAccessoryFirmwareUpdateManager supportsFirmwareUpdate](v9, "supportsFirmwareUpdate"))
  {
    v35 = MEMORY[0x227676638]();
    v36 = v9;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543618;
      v85 = v38;
      v86 = 2112;
      v87 = v43;
      v44 = "%{public}@[%@] Firmware Update not enabled on this device; ignoring";
      v45 = v37;
      v46 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
      _os_log_impl(&dword_2218F0000, v45, v46, v44, (uint8_t *)&v84, 0x16u);

LABEL_30:
    }
LABEL_31:

    v33 = (void *)v35;
    goto LABEL_32;
  }
  if ((objc_msgSend(v7, "supportsCHIP") & 1) == 0)
  {
    v35 = MEMORY[0x227676638]();
    v36 = v9;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543618;
      v85 = v38;
      v86 = 2112;
      v87 = v43;
      v44 = "%{public}@[%@] Matter firmware update not supported";
      v45 = v37;
      v46 = OS_LOG_TYPE_DEBUG;
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("HMDAccessoryVendorIDProductIDUpdatedNotification"));

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543618;
      v85 = v19;
      v86 = 2112;
      v87 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Received VID/PID update notification", (uint8_t *)&v84, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v7, "matterVendorID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_17;
    v22 = (void *)v21;
    objc_msgSend(v7, "matterProductID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_16;
    v24 = (void *)v23;
    objc_msgSend(v7, "matterVendorID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToNumber:", &unk_24E96C080))
    {

LABEL_16:
LABEL_17:
      v26 = MEMORY[0x227676638]();
      v27 = v17;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
LABEL_20:

        v33 = (void *)v26;
LABEL_32:
        objc_autoreleasePoolPop(v33);
        goto LABEL_33;
      }
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "matterVendorID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "matterProductID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138544130;
      v85 = v29;
      v86 = 2112;
      v87 = v30;
      v88 = 2112;
      v89 = (uint64_t)v31;
      v90 = 2112;
      v91 = v32;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Ignoring invalid VID: %@, PID: %@", (uint8_t *)&v84, 0x2Au);

LABEL_19:
      goto LABEL_20;
    }
    objc_msgSend(v7, "matterProductID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToNumber:", &unk_24E96C080);

    if ((v48 & 1) != 0)
      goto LABEL_17;
  }
  objc_msgSend(v4, "name");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"));

  if (v50)
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = v9;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543618;
      v85 = v54;
      v86 = 2112;
      v87 = v55;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@[%@] Received matter firmware revision number update notification", (uint8_t *)&v84, 0x16u);

    }
    objc_autoreleasePoolPop(v51);
    objc_msgSend(v7, "firmwareUpdateProfile");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "matterFirmwareUpdateProfile");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "matterFirmwareRevisionNumber");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)MEMORY[0x227676638]();
    v60 = v52;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543874;
      v85 = v62;
      v86 = 2112;
      v87 = v63;
      v88 = 2112;
      v89 = (uint64_t)v58;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@[%@] Firmware Update Manager: Received matter firmware revision number update notification, request change to %@", (uint8_t *)&v84, 0x20u);

    }
    objc_autoreleasePoolPop(v59);
    if (!v58)
    {
      v26 = MEMORY[0x227676638]();
      v27 = v60;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543874;
      v85 = v29;
      v86 = 2112;
      v87 = v30;
      v88 = 2112;
      v89 = 0;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Ignoring invalid matterFirmwareRevisionNumber: %@", (uint8_t *)&v84, 0x20u);
      goto LABEL_19;
    }

  }
  -[HMDAccessoryFirmwareUpdateManager registerAndCreateSessionForAccessory:updateUARPParameters:](v9, "registerAndCreateSessionForAccessory:updateUARPParameters:", v7, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)MEMORY[0x227676638]();
    v66 = v9;
    HMFGetOSLogHandle();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 138543618;
      v85 = v68;
      v86 = 2112;
      v87 = v69;
      _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_ERROR, "%{public}@Failed to register and create session for accessory: %@", (uint8_t *)&v84, 0x16u);

    }
    objc_autoreleasePoolPop(v65);
  }
  else
  {
    objc_msgSend(v4, "name");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("HMDAccessoryVendorIDProductIDUpdatedNotification"));

    if (v71)
    {
      v72 = (void *)MEMORY[0x227676638]();
      v73 = v9;
      HMFGetOSLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 138543874;
        v85 = v75;
        v86 = 2112;
        v87 = v76;
        v88 = 2112;
        v89 = 0;
        _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating accessory vendor ID and product ID with new session %@", (uint8_t *)&v84, 0x20u);

      }
      objc_autoreleasePoolPop(v72);
      objc_msgSend(0, "updateAccessoryVendorIDAndProductID");
    }
    else
    {
      objc_msgSend(v4, "name");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"));

      if (v78)
      {
        v79 = (void *)MEMORY[0x227676638]();
        v80 = v9;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "shortDescription");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = 138543874;
          v85 = v82;
          v86 = 2112;
          v87 = v83;
          v88 = 2112;
          v89 = 0;
          _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating matter firmware version number with new session %@", (uint8_t *)&v84, 0x20u);

        }
        objc_autoreleasePoolPop(v79);
        objc_msgSend(0, "updateAccessoryFirmwareVersion");
      }
    }
  }

LABEL_33:
}

- (int64_t)defaultUpdateAssetSourceWithAccessory:(id)a3
{
  int64_t result;

  result = objc_msgSend(a3, "identityType");
  if (result)
  {
    if (result == 3)
    {
      if ((_os_feature_enabled_impl() & 1) != 0)
        return 8;
      else
        return 8
             * (CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) != 0);
    }
    else if (result == 1)
    {
      return -[HMDAccessoryFirmwareUpdateManager defaultProductDataUpdateAssetSource](self, "defaultProductDataUpdateAssetSource");
    }
    else
    {
      return 7;
    }
  }
  return result;
}

- (int64_t)defaultProductDataUpdateAssetSource
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDAccessoryFirmwareUpdateManager_defaultProductDataUpdateAssetSource__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  if (defaultProductDataUpdateAssetSource_onceToken != -1)
    dispatch_once(&defaultProductDataUpdateAssetSource_onceToken, block);
  return defaultProductDataUpdateAssetSource_updateAssetSource;
}

- (BOOL)registerAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HMDAccessoryFirmwareUpdateManager_registerAccessory___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(v5, v8);

  return 1;
}

- (BOOL)_registerAccessory:(id)a3 source:(int64_t)a4 path:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  HMDAccessoryFirmwareUpdateManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  char v38;
  char v39;
  void *v40;
  HMDAccessoryFirmwareUpdateManager *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  HMDAccessoryFirmwareUpdateManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDAccessoryFirmwareUpdateManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  HMDAccessoryFirmwareUpdateManager *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  HMDAccessoryFirmwareUpdateManager *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  HMDAccessoryFirmwareUpdateManager *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  HMDAccessoryFirmwareUpdateManager *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  HMDAccessoryFirmwareUpdateManager *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  HMDAccessoryFirmwareUpdateManager *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  HMDAccessoryFirmwareUpdateManager *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  HMDAccessoryFirmwareUpdateManager *v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  HMDAccessoryFirmwareUpdateManager *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v143;
  void *v144;
  void *v145;
  HMDAccessoryFirmwareUpdateManager *v146;
  int v147;
  _BOOL4 v148;
  void *v149;
  int v150;
  void *context;
  void *contexta;
  char v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  int v160;
  void *v161;
  void *v162;
  int64_t v163;
  void *v164;
  void *v165;
  id v166;
  id v167;
  id v168;
  uint8_t buf[4];
  void *v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  void *v176;
  __int16 v177;
  void *v178;
  __int16 v179;
  void *v180;
  __int16 v181;
  __CFString *v182;
  __int16 v183;
  id v184;
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isOwnerUser");

  objc_msgSend(v8, "firmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firmwareUpdateProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[HMDAccessoryFirmwareUpdateManager isAccessoryRegistered:](self, "isAccessoryRegistered:", v8))
  {
    v163 = a4;
    if (((_os_feature_enabled_impl() & 1) != 0
       || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v8, "supportsCHIP"))
    {
      objc_msgSend(v8, "matterVendorID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v8, "matterVendorID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToNumber:", &unk_24E96C080) ^ 1;

      }
      else
      {
        v23 = 0;
      }

      objc_msgSend(v8, "matterProductID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v8, "matterProductID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = objc_msgSend(v25, "isEqualToNumber:", &unk_24E96C080) ^ 1;

      }
      else
      {
        v160 = 0;
      }

      objc_msgSend(v8, "name");
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      v153 = v12;
      if (v14)
      {
        objc_msgSend(v8, "firmwareUpdateProfile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "matterFirmwareUpdateProfile");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v8, "firmwareUpdateProfile");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "matterFirmwareUpdateProfile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "matterFirmwareRevisionNumber");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29 != 0;

          v31 = v30;
          LODWORD(v27) = 1;
        }
        else
        {
          v31 = 0;
        }
      }
      else
      {
        v31 = 0;
        LODWORD(v27) = 0;
      }
      context = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v150 = v23;
        HMFGetLogIdentifier();
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v146 = v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v166 = v9;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v147 = (int)v27;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v148 = v31;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v170 = v145;
        v171 = 2112;
        v172 = v149;
        v173 = 2112;
        v174 = v34;
        v175 = 2112;
        v176 = v35;
        v177 = 2112;
        v178 = v27;
        v179 = 2112;
        v180 = v36;
        v181 = 2112;
        v182 = v37;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@[%@] Matter AFU Settings: hasMatterFirmwareUpdateProfile: %@, hasMatterFirmwareRevisionNumber: %@, hasMatterVendorID: %@, hasMatterProductID: %@, hasHapAccessoryName: %@", buf, 0x48u);

        v23 = v150;
        v31 = v148;

        LODWORD(v27) = v147;
        v9 = v166;

        v32 = v146;
      }

      objc_autoreleasePoolPop(context);
      v12 = v153;
      if ((v27 & v31 & v23 & v160) != 1 || !v157)
      {
        v61 = (void *)MEMORY[0x227676638]();
        v62 = v32;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
LABEL_56:

          objc_autoreleasePoolPop(v61);
LABEL_57:
          v20 = 0;
          goto LABEL_97;
        }
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v170 = v64;
        v171 = 2112;
        v172 = v65;
        _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering with FirmwareUpdateManager due to invalid matter AFU settings", buf, 0x16u);
LABEL_55:

        goto LABEL_56;
      }
    }
    if (!objc_msgSend(v8, "identityType"))
    {
      objc_msgSend(v8, "matterVendorID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matterProductID");
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x227676638]();
      v54 = self;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "manufacturer");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "model");
        v168 = v9;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "productData");
        v164 = v53;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v170 = v56;
        v171 = 2112;
        v172 = v57;
        v173 = 2112;
        v174 = v58;
        v175 = 2112;
        v176 = v59;
        v177 = 2112;
        v178 = v60;
        v179 = 2112;
        v180 = v51;
        v181 = 2112;
        v182 = v52;
        v183 = 2112;
        v184 = v8;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering with FirmwareUpdateManager due to unknown identity type for manufacturer: %@ model: %@ productData: %@ vendorID: %@ productID: %@ accessory: %@", buf, 0x52u);

        v53 = v164;
        v9 = v168;

      }
      objc_autoreleasePoolPop(v53);

      goto LABEL_57;
    }
    v167 = v9;
    if (v14)
      v38 = v12;
    else
      v38 = 0;
    if (v13)
      v39 = v38;
    else
      v39 = 0;
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
LABEL_46:

      objc_autoreleasePoolPop(v40);
      if ((v39 & 1) != 0)
      {
        objc_msgSend(v8, "softwareUpdate");
        v67 = objc_claimAutoreleasedReturnValue();
        v9 = v167;
        if (!v67)
          goto LABEL_60;
        v68 = (void *)v67;
        objc_msgSend(v8, "softwareUpdate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v69, "state") == 2)
        {
          objc_msgSend(v8, "firmwareVersion");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "softwareUpdate");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "version");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v70, "isAtLeastVersion:", v72);

          if (!v73)
            goto LABEL_60;
          v74 = (void *)MEMORY[0x227676638]();
          v75 = v41;
          HMFGetOSLogHandle();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "shortDescription");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v170 = v77;
            v171 = 2112;
            v172 = v78;
            _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Verifying pending firmware version on registered accessory", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v74);
          objc_msgSend(v8, "softwareUpdate");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "updateLocalState:", 4);
        }
        else
        {

        }
LABEL_60:
        -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](v41, "UARPAccessoryForHMDAccessory:", v8);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v82)
        {
          v83 = (void *)MEMORY[0x227676638]();
          v84 = v41;
          HMFGetOSLogHandle();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "shortDescription");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v170 = v86;
            v171 = 2112;
            v172 = v87;
            _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not registering accessory with FirmwareUpdateManager - unsupported accessory type", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v83);
          v20 = 0;
          goto LABEL_96;
        }
        if (v167)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v167, 0);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v162 = 0;
        }
        v88 = objc_alloc(MEMORY[0x24BE28A00]);
        if ((unint64_t)(v163 - 1) > 8)
          v89 = 1;
        else
          v89 = qword_2226A0E90[v163 - 1];
        v90 = (void *)objc_msgSend(v88, "initWithLocationType:remoteURL:", v89, v162);
        -[HMDAccessoryFirmwareUpdateManager UARPControllerForAccessory:](v41, "UARPControllerForAccessory:", v8);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)MEMORY[0x227676638]();
        v93 = v41;
        HMFGetOSLogHandle();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v170 = v95;
          v171 = 2112;
          v172 = v96;
          v173 = 2112;
          v174 = v82;
          v175 = 2112;
          v176 = v90;
          _os_log_impl(&dword_2218F0000, v94, OS_LOG_TYPE_INFO, "%{public}@[%@] Registering UARP Accessory %@ with AssetID %@", buf, 0x2Au);

          v9 = v167;
        }

        objc_autoreleasePoolPop(v92);
        if ((objc_msgSend(v91, "addAccessory:assetID:", v82, v90) & 1) != 0)
        {
          objc_msgSend(v8, "firmwareVersion");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "versionString");
          v98 = objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v8, "supportsCHIP"))
            goto LABEL_75;
          objc_msgSend(v8, "firmwareUpdateProfile");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "matterFirmwareUpdateProfile");
          v100 = v90;
          v101 = v91;
          v102 = (void *)v98;
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "matterFirmwareRevisionNumber");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "stringValue");
          v105 = objc_claimAutoreleasedReturnValue();

          v91 = v101;
          v90 = v100;

          v9 = v167;
          v98 = v105;
          if (v105)
          {
LABEL_75:
            v165 = (void *)v98;
            v106 = (void *)MEMORY[0x227676638]();
            v107 = v93;
            HMFGetOSLogHandle();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "shortDescription");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "name");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v170 = v109;
              v171 = 2112;
              v172 = v110;
              v173 = 2112;
              v174 = v111;
              v175 = 2112;
              v176 = v82;
              v177 = 2112;
              v178 = v165;
              _os_log_impl(&dword_2218F0000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Registered accessory %@ %@, version %@ with FirmwareUpdateManager", buf, 0x34u);

              v9 = v167;
            }

            objc_autoreleasePoolPop(v106);
            if ((objc_msgSend(v91, "updateProperty:value:forAccessory:", 4, v165, v82) & 1) == 0)
            {
              v112 = (void *)MEMORY[0x227676638]();
              v113 = v107;
              HMFGetOSLogHandle();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "shortDescription");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v170 = v115;
                v171 = 2112;
                v172 = v116;
                _os_log_impl(&dword_2218F0000, v114, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to update UARP accessory firmware version property for accessory", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v112);
              v9 = v167;
            }
            if (objc_msgSend(v8, "isAppleAccessory"))
            {
              -[HMDAccessoryFirmwareUpdateManager sessionForUARPAccessory:](v107, "sessionForUARPAccessory:", v82);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              if (v117)
              {
                v118 = (void *)MEMORY[0x227676638]();
                v119 = v107;
                HMFGetOSLogHandle();
                v120 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v158 = v117;
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "shortDescription");
                  v155 = v118;
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "uuid");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v170 = v121;
                  v171 = 2112;
                  v172 = v122;
                  v173 = 2112;
                  v174 = v123;
                  _os_log_impl(&dword_2218F0000, v120, OS_LOG_TYPE_ERROR, "%{public}@[%@] Session already created when trying to register accessory %@ with FirmwareUpdateSession", buf, 0x20u);

                  v118 = v155;
                  v117 = v158;
                }

                objc_autoreleasePoolPop(v118);
              }
              v124 = (void *)MEMORY[0x227676638]();
              v125 = v107;
              HMFGetOSLogHandle();
              v126 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v159 = v117;
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "shortDescription");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "uuid");
                v156 = v124;
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v170 = v127;
                v171 = 2112;
                v172 = v128;
                v173 = 2112;
                v174 = v129;
                _os_log_impl(&dword_2218F0000, v126, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Creating session to register accessory %@ with FirmwareUpdateSession", buf, 0x20u);

                v124 = v156;
                v117 = v159;
              }

              objc_autoreleasePoolPop(v124);
              -[HMDAccessoryFirmwareUpdateManager addSessionForUARPAccessory:](v125, "addSessionForUARPAccessory:", v82);
              v130 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v130, "registerAccessory");
              v9 = v167;
            }
            v131 = (void *)MEMORY[0x227676638]();
            v132 = v107;
            HMFGetOSLogHandle();
            v133 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "shortDescription");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "firmwareVersion");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v170 = v134;
              v171 = 2112;
              v172 = v135;
              v173 = 2112;
              v174 = v136;
              v175 = 2112;
              v176 = v165;
              _os_log_impl(&dword_2218F0000, v133, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory firmware version updated to %@ (%@)", buf, 0x2Au);

              v9 = v167;
            }

            objc_autoreleasePoolPop(v131);
            v20 = 1;
            goto LABEL_95;
          }
          v137 = (void *)MEMORY[0x227676638]();
          v138 = v93;
          HMFGetOSLogHandle();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "shortDescription");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v170 = v143;
            v171 = 2112;
            v172 = v144;
            v173 = 2112;
            v174 = 0;
            _os_log_impl(&dword_2218F0000, v139, OS_LOG_TYPE_ERROR, "%{public}@[%@] Matter firmware version is invalid: %@", buf, 0x20u);

          }
        }
        else
        {
          v137 = (void *)MEMORY[0x227676638]();
          v138 = v93;
          HMFGetOSLogHandle();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "shortDescription");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v170 = v140;
            v171 = 2112;
            v172 = v141;
            v173 = 2112;
            v174 = v82;
            _os_log_impl(&dword_2218F0000, v139, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to register UARP accessory %@", buf, 0x20u);

            v9 = v167;
          }
        }

        objc_autoreleasePoolPop(v137);
        v20 = 0;
LABEL_95:

LABEL_96:
        goto LABEL_97;
      }
      v61 = (void *)MEMORY[0x227676638]();
      v62 = v41;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      v9 = v167;
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        goto LABEL_56;
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v170 = v64;
      v171 = 2112;
      v172 = v65;
      v173 = 2112;
      v174 = v79;
      v175 = 2112;
      v176 = v80;
      v177 = 2112;
      v178 = v81;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering accessory %@ with FirmwareUpdateManager. Details: validAFUSettings = %@, validDynamicAssetUpdateSettings = %@", buf, 0x34u);

      goto LABEL_55;
    }
    HMFGetLogIdentifier();
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    contexta = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v43 = objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v44 = objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v45 = objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v8, "identityType");
    v154 = (void *)v45;
    v48 = (void *)v44;
    if (!v47)
      goto LABEL_44;
    if (v47 != 3)
    {
      v49 = (void *)v43;
      v50 = CFSTR("AppleModelNumber");
      if (v47 == 1)
        v50 = CFSTR("ProductData");
      goto LABEL_45;
    }
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v49 = (void *)v43;
      v50 = CFSTR("VendorProductID");
    }
    else
    {
LABEL_44:
      v49 = (void *)v43;
      v50 = CFSTR("Unknown");
    }
LABEL_45:
    v66 = v50;
    *(_DWORD *)buf = 138544898;
    v170 = v161;
    v171 = 2112;
    v172 = contexta;
    v173 = 2112;
    v174 = v49;
    v175 = 2112;
    v176 = v48;
    v177 = 2112;
    v178 = v154;
    v179 = 2112;
    v180 = v46;
    v181 = 2112;
    v182 = v66;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@[%@] Valid AFU settings = %@ : isOwner = %@, hasFirmwareUpdateProfile = %@, hasFirmwareVersion = %@, identityType = %@", buf, 0x48u);

    goto LABEL_46;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v170 = v18;
    v171 = 2112;
    v172 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Accessory already registered with FirmwareUpdateManager", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = 1;
LABEL_97:

  return v20;
}

- (id)changeAccessory:(id)a3 source:(int64_t)a4 path:(id)a5 documentationPath:(id)a6 userInitiatedStaging:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryFirmwareUpdateManager *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessoryFirmwareUpdateManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDAccessoryFirmwareUpdateManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  HMDAccessoryFirmwareUpdateManager *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  HMDAccessoryFirmwareUpdateManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v7 = a7;
  v91 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[HMDAccessoryFirmwareUpdateManager UARPControllerForAccessory:](self, "UARPControllerForAccessory:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](self, "UARPAccessoryForHMDAccessory:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16)
  {
    v74 = v14;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v75 = v12;
      v71 = v16;
      v22 = v15;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v24 = a4;
      v25 = v13;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v78 = v21;
      v79 = 2112;
      v80 = v23;
      v81 = 2112;
      v82 = v26;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Setting userInitiatedFirmwareStaging to %@", buf, 0x20u);

      v13 = v25;
      a4 = v24;

      v15 = v22;
      v16 = v71;
      v12 = v75;

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v16, "setUserInitiatedFirmwareStaging:", v7);
    v76 = v15;
    objc_msgSend(v15, "accessoryList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", v16);

    if ((v28 & 1) == 0)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v18;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v40;
        v79 = 2112;
        v80 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot change source for unregistered accessory", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      v42 = (void *)MEMORY[0x227676638]();
      v43 = v38;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "accessoryList");
        v47 = v13;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v78 = v45;
        v79 = 2112;
        v80 = v46;
        v81 = 2112;
        v82 = v16;
        v83 = 2112;
        v84 = v48;
        _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Looking for %@ in accessoryList %@", buf, 0x2Au);

        v13 = v47;
      }

      objc_autoreleasePoolPop(v42);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v74;
      goto LABEL_33;
    }
    if (a4 == 2)
    {
      v14 = v74;
      if (!objc_msgSend(v13, "length"))
      {
        v61 = (void *)MEMORY[0x227676638]();
        v62 = v18;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "shortDescription");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          HMSoftwareUpdateAssetSourceAsString();
          v66 = v13;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v78 = v64;
          v79 = 2112;
          v80 = v65;
          v81 = 2112;
          v82 = v67;
          _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Invalid path for asset source %@", buf, 0x20u);

          v13 = v66;
          v14 = v74;

        }
        objc_autoreleasePoolPop(v61);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      v29 = objc_alloc(MEMORY[0x24BE28A00]);
      v30 = 0;
    }
    else
    {
      v29 = objc_alloc(MEMORY[0x24BE28A00]);
      v30 = 1;
      v14 = v74;
      switch(a4)
      {
        case 1:
          v30 = 2;
          break;
        case 3:
          v30 = 5;
          break;
        case 4:
          v30 = 6;
          break;
        case 5:
          v30 = 7;
          break;
        case 6:
          v30 = 8;
          break;
        case 7:
          v30 = 3;
          break;
        case 8:
          v30 = 15;
          break;
        case 9:
          v30 = 16;
          break;
        default:
          break;
      }
    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v13, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v14, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v29, "initWithLocationType:remoteURL:releaseNotesRemoteURL:", v30, v31, v32);

LABEL_23:
        if (v13)

        v49 = objc_msgSend(v76, "changeAssetLocation:assetID:", v16, v33);
        v50 = (void *)MEMORY[0x227676638]();
        v51 = v18;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v49)
        {
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "shortDescription");
            v72 = v50;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            HMSoftwareUpdateAssetSourceAsString();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "assetVersion");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v78 = v54;
            v79 = 2112;
            v80 = v55;
            v81 = 2112;
            v82 = v56;
            v83 = 2112;
            v84 = v57;
            v85 = 2112;
            v86 = v13;
            v87 = 2112;
            v88 = v12;
            v89 = 2112;
            v90 = v33;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@[%@] Successfully changed source to %@ %@ %@ for accessory <%@> asset <%@>", buf, 0x48u);

            v14 = v74;
            v50 = v72;

          }
          objc_autoreleasePoolPop(v50);
          v36 = 0;
        }
        else
        {
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "shortDescription");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            HMSoftwareUpdateAssetSourceAsString();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "assetVersion");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "name");
            v73 = v13;
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v78 = v70;
            v79 = 2112;
            v80 = v68;
            v81 = 2112;
            v82 = v69;
            v83 = 2112;
            v84 = v58;
            v85 = 2112;
            v86 = v73;
            v87 = 2112;
            v88 = v59;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to change source to %@ %@ %@ for accessory %@", buf, 0x3Eu);

            v13 = v73;
            v14 = v74;

          }
          objc_autoreleasePoolPop(v50);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }

LABEL_33:
        v15 = v76;
        goto LABEL_34;
      }
    }
    else
    {
      v31 = 0;
      if (v14)
        goto LABEL_10;
    }
    v33 = (void *)objc_msgSend(v29, "initWithLocationType:remoteURL:releaseNotesRemoteURL:", v30, v31, 0);
    goto LABEL_23;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v78 = v34;
    v79 = 2112;
    v80 = v35;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot change source for unsupported accessory", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v36;
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
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
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HMDAccessoryFirmwareUpdateManager_handleHomeAccessoryRemovedNotification___block_invoke;
  block[3] = &unk_24E7972B0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleHomeAccessoryRemovedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  v7 = v8;
  if (v8)
  {
    -[HMDAccessoryFirmwareUpdateManager unregisterAccessory:](self, "unregisterAccessory:", v8);
    v7 = v8;
  }

}

- (void)unregisterAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  HMDAccessoryFirmwareUpdateManager *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  HMDAccessoryFirmwareUpdateManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[24];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager UARPControllerForAccessory:](self, "UARPControllerForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](self, "UARPAccessoryForHMDAccessory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDAccessoryFirmwareUpdateManager sessionForAccessory:](self, "sessionForAccessory:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "unregisterAccessory");
      -[HMDAccessoryFirmwareUpdateManager removeSession:](self, "removeSession:", v8);
    }
    objc_msgSend(v5, "accessoryList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v6);

    if (!v10)
      goto LABEL_15;
    v11 = objc_msgSend(v5, "removeAccessory:", v6);
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543874;
        *(_QWORD *)&v28[4] = v16;
        *(_WORD *)&v28[12] = 2112;
        *(_QWORD *)&v28[14] = v17;
        *(_WORD *)&v28[22] = 2112;
        v29 = v6;
        v18 = "%{public}@[%@] Unregistering accessory %@";
        v19 = v15;
        v20 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_2218F0000, v19, v20, v18, v28, 0x20u);

      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = v16;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v17;
      *(_WORD *)&v28[22] = 2112;
      v29 = v6;
      v18 = "%{public}@[%@] Not unregistering accessory %@ - failed";
      v19 = v15;
      v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    objc_autoreleasePoolPop(v12);
LABEL_15:
    -[HMDAccessoryFirmwareUpdateManager registeredAccessories](self, "registeredAccessories", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObjectForKey:", v4);

    goto LABEL_16;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138543874;
    *(_QWORD *)&v28[4] = v24;
    *(_WORD *)&v28[12] = 2112;
    *(_QWORD *)&v28[14] = v25;
    *(_WORD *)&v28[22] = 2112;
    v29 = v26;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not unregistering accessory %@ - unsupported", v28, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
LABEL_16:

}

- (BOOL)checkForUpdateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDAccessoryFirmwareUpdateManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager UARPControllerForAccessory:](self, "UARPControllerForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateManager UARPAccessoryForHMDAccessory:](self, "UARPAccessoryForHMDAccessory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "checkForUpdate:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Cannot check for update for accessory - unsupported", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)startStatusTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 13, 86400.0);
  -[HMDAccessoryFirmwareUpdateManager setStatusTimer:](self, "setStatusTimer:", v3);

  -[HMDAccessoryFirmwareUpdateManager statusTimer](self, "statusTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateManager statusTimer](self, "statusTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegateQueue:", v5);

  -[HMDAccessoryFirmwareUpdateManager statusTimer](self, "statusTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateManager *v7;
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
  -[HMDAccessoryFirmwareUpdateManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateManager defaultProductDataUpdateAssetSource](v7, "defaultProductDataUpdateAssetSource");
    HMSoftwareUpdateAssetSourceAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Default asset source: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryFirmwareUpdateManager activeSessions](v7, "activeSessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_80_170396);

}

- (void)removeSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessoryFirmwareUpdateManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hapAccessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing session %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    p_lock = &v8->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDAccessoryFirmwareUpdateManager activeSessions](v8, "activeSessions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v6);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@removeSession: No accessory UUID exists", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)sessionForAccessory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryFirmwareUpdateManager activeSessions](self, "activeSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)addSessionForUARPAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryFirmwareUpdateManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryFirmwareUpdateManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessoryFirmwareUpdateManager *v22;
  NSObject *v23;
  void *v24;
  HMDAccessoryFirmwareUpdateManager *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessoryFirmwareUpdateManager supportsFirmwareUpdate](self, "supportsFirmwareUpdate"))
  {
    -[HMDAccessoryFirmwareUpdateManager findHMDHAPAccessoryWithUARPAccessory:](self, "findHMDHAPAccessoryWithUARPAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMDAccessoryFirmwareUpdateManager wingman](self, "wingman");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateManager logEventManager](self, "logEventManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "newAccessoryFirmwareUpdateSessionWithHAPAccessory:uarpAccessory:accessoryFirmwareUpdateManager:logEventManager:", v5, v4, self, v7);

      objc_msgSend(v8, "configure");
      os_unfair_lock_lock_with_options();
      -[HMDAccessoryFirmwareUpdateManager activeSessions](self, "activeSessions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

      os_unfair_lock_unlock(&self->_lock);
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v14;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v4;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] Created session %@ for accessory", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v12;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v19;
        v30 = 2112;
        v31 = v20;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] New firmwareUpdateSession %@", (uint8_t *)&v28, 0x20u);

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v26;
        v30 = 2112;
        v31 = v4;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find HAPAccessory from UARPHomeKitAccessory %@", (uint8_t *)&v28, 0x16u);

      }
      v8 = 0;
    }

    objc_autoreleasePoolPop(v16);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not enabled on this device; ignoring",
        (uint8_t *)&v28,
        0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v8 = 0;
  }

  return v8;
}

- (id)sessionForUARPAccessory:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryFirmwareUpdateManager activeSessions](self, "activeSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)findHMDHAPAccessoryWithUARPAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HMDAccessoryFirmwareUpdateManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessoryFirmwareUpdateManager *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    objc_opt_class();
    v9 = objc_opt_isKindOfClass() & 1;
    if (v9)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    if (v9)
    {
      v12 = v8;
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory %@ is not a HAPAccessory", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v12 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory %@ not found in homes", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)UARPAccessoryForHMDAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessoryFirmwareUpdateManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryFirmwareUpdateManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "identityType"))
  {
    -[HMDAccessoryFirmwareUpdateManager registeredAccessories](self, "registeredAccessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE289E8]), "initWithHMDHAPAccessory:", v4);
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138544130;
        v22 = v10;
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Initialized UARP Accessory %@ from HAP Accessory %@", (uint8_t *)&v21, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);
      if (v6)
      {
        -[HMDAccessoryFirmwareUpdateManager registeredAccessories](v8, "registeredAccessories");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v6, v4);

      }
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
      objc_msgSend(v4, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unknown identity type for %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasReachedMaximumFirmwareUpdateRetriesForAccessory:(id)a3 assetID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(a3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateManager accessoryRetries](self, "accessoryRetries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = objc_msgSend(v13, "intValue") > 0xA;
  return (char)v12;
}

- (BOOL)isFirmwareUpdateRetryAllowedForAccessory:(id)a3 forAsset:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateManager accessoryRetries](self, "accessoryRetries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateManager accessoryRetries](self, "accessoryRetries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

  LOBYTE(self) = -[HMDAccessoryFirmwareUpdateManager hasReachedMaximumFirmwareUpdateRetriesForAccessory:assetID:](self, "hasReachedMaximumFirmwareUpdateRetriesForAccessory:assetID:", v8, v7);
  return self ^ 1;
}

- (void)resetFirmwareUpdateAccessoryRetryTracking:(id)a3 forAsset:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(a3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateManager accessoryRetries](self, "accessoryRetries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

}

- (BOOL)startUARPPacketCapture:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateManager defaultUARPController](self, "defaultUARPController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "startPacketCapture:", v4);

  return v6;
}

- (void)stopUARPPacketCapture
{
  id v2;

  -[HMDAccessoryFirmwareUpdateManager defaultUARPController](self, "defaultUARPController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPacketCapture");

}

- (void)rescindStagedAsset:(id)a3 completion:(id)a4
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
  objc_msgSend(v6, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke;
  v11[3] = &unk_24E78C1B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSURL)documentationPath
{
  return self->_documentationPath;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)setActiveSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessions, a3);
}

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager
{
  return self->_logEventManager;
}

- (HMDAccessoryFirmwareUpdateManagerWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateManagerWingman *)objc_getProperty(self, a2, 56, 1);
}

- (NSMapTable)registeredAccessories
{
  return self->_registeredAccessories;
}

- (void)setRegisteredAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_registeredAccessories, a3);
}

- (NSMutableDictionary)accessoryRetries
{
  return self->_accessoryRetries;
}

- (void)setAccessoryRetries:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRetries, a3);
}

- (HMDDefaultUARPControllerDelegate)defaultUARPControllerDelegate
{
  return self->_defaultUARPControllerDelegate;
}

- (HMDMatterUARPControllerDelegate)matterUARPControllerDelegate
{
  return self->_matterUARPControllerDelegate;
}

- (HMFTimer)statusTimer
{
  return self->_statusTimer;
}

- (void)setStatusTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_matterUARPControllerDelegate, 0);
  objc_storeStrong((id *)&self->_defaultUARPControllerDelegate, 0);
  objc_storeStrong((id *)&self->_accessoryRetries, 0);
  objc_storeStrong((id *)&self->_registeredAccessories, 0);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_storeStrong((id *)&self->_logEventManager, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_documentationPath, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ((objc_msgSend(WeakRetained, "isAccessoryRegistered:", a1[4]) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sessionForAccessory:", a1[4]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke_89;
      v15[3] = &unk_24E79A050;
      v16 = a1[5];
      objc_msgSend(v3, "rescindStagedAsset:", v15);
      v4 = v16;
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not available session for accessory", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, 0, CFSTR("Invalid state: session not available for accessory"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))a1[5] + 2))();
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%@] Accessory not registered", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, 0, CFSTR("accessory not registered"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[5] + 2))();
  }

}

uint64_t __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__HMDAccessoryFirmwareUpdateManager_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "logDebugStates");
}

void __76__HMDAccessoryFirmwareUpdateManager_handleHomeAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleHomeAccessoryRemovedNotification:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __55__HMDAccessoryFirmwareUpdateManager_registerAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Registering accessory with FirmwareUpdateManager", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "_registerAccessory:source:path:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "defaultUpdateAssetSourceWithAccessory:", *(_QWORD *)(a1 + 40)), 0) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] FirmwareUpdateManager Registration failed for accessory", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
}

void __72__HMDAccessoryFirmwareUpdateManager_defaultProductDataUpdateAssetSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("firmwareUpdateiCloudContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && isValidHMSoftwareUpdateAssetSourceString())
    defaultProductDataUpdateAssetSource_updateAssetSource = stringToHMSoftwareUpdateAssetSource();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMSoftwareUpdateAssetSourceAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting MFi default container to: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __76__HMDAccessoryFirmwareUpdateManager_handleMatterSettingsUpdateNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleMatterSettingsUpdateNotification:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __86__HMDAccessoryFirmwareUpdateManager_handleAccessoryFirmwareVersionUpdateNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleAccessoryFirmwareVersionUpdateNotification:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t80 != -1)
    dispatch_once(&logCategory__hmf_once_t80, &__block_literal_global_170505);
  return (id)logCategory__hmf_once_v81;
}

void __48__HMDAccessoryFirmwareUpdateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v81;
  logCategory__hmf_once_v81 = v0;

}

@end
