@implementation UARPSupportedAccessory

- (UARPSupportedAccessory)init
{
  UARPSupportedAccessory *v2;
  NSMutableSet *v3;
  NSMutableSet *bsdNotificationsInternal;
  NSMutableSet *v5;
  NSMutableSet *serviceBsdNotificationsInternal;
  NSMutableSet *v7;
  NSMutableSet *supplementalAssetsInternal;
  NSMutableSet *v9;
  NSMutableSet *downstreamAppleModelNumbers;
  NSMutableSet *v11;
  NSMutableSet *alternativeAppleModelNumbers;
  NSMutableSet *v13;
  NSMutableSet *sysdiagnoseApprovedMetrics;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessory;
  v2 = -[UARPSupportedAccessory init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    bsdNotificationsInternal = v2->_bsdNotificationsInternal;
    v2->_bsdNotificationsInternal = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    serviceBsdNotificationsInternal = v2->_serviceBsdNotificationsInternal;
    v2->_serviceBsdNotificationsInternal = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    supplementalAssetsInternal = v2->_supplementalAssetsInternal;
    v2->_supplementalAssetsInternal = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    downstreamAppleModelNumbers = v2->_downstreamAppleModelNumbers;
    v2->_downstreamAppleModelNumbers = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    alternativeAppleModelNumbers = v2->_alternativeAppleModelNumbers;
    v2->_alternativeAppleModelNumbers = v11;

    *(_OWORD *)&v2->_uploaderResponseTimeout = xmmword_212D8B140;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sysdiagnoseApprovedMetrics = v2->_sysdiagnoseApprovedMetrics;
    v2->_sysdiagnoseApprovedMetrics = v13;

  }
  return v2;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 capabilities:(unint64_t)a4
{
  id v7;
  UARPSupportedAccessory *v8;
  UARPSupportedAccessory *v9;

  v7 = a3;
  v8 = -[UARPSupportedAccessory init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_hardwareID, a3);
    v9->_capabilities = a4;
  }

  return v9;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 appleModelNumber:(id)a4 capabilities:(unint64_t)a5
{
  id v9;
  UARPSupportedAccessory *v10;
  UARPSupportedAccessory *v11;

  v9 = a4;
  v10 = -[UARPSupportedAccessory initWithHardwareID:capabilities:](self, "initWithHardwareID:capabilities:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_appleModelNumber, a4);

  return v11;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 capabilities:(unint64_t)a6
{
  id v11;
  id v12;
  UARPSupportedAccessory *v13;
  UARPSupportedAccessory *v14;

  v11 = a4;
  v12 = a5;
  v13 = -[UARPSupportedAccessory initWithHardwareID:capabilities:](self, "initWithHardwareID:capabilities:", a3, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_productGroup, a4);
    objc_storeStrong((id *)&v14->_productNumber, a5);
  }

  return v14;
}

- (UARPSupportedAccessory)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  UARPSupportedAccessory *v6;
  UARPSupportedAccessory *v7;
  void *v8;
  uint64_t v9;
  NSString *modelName;
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
  NSString *updaterName;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *fusingOverrideUnfused;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  NSString *personalizationNotification;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Transport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Bluetooth")))
  {
    v6 = -[UARPSupportedAccessory initWithBluetoothDictionary:](self, "initWithBluetoothDictionary:", v4);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("HDS")))
  {
    v6 = -[UARPSupportedAccessory initWithHDSDictionary:](self, "initWithHDSDictionary:", v4);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("HID")))
  {
    v6 = -[UARPSupportedAccessory initWithHIDDictionary:](self, "initWithHIDDictionary:", v4);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("USB-PD")))
  {
    v6 = -[UARPSupportedAccessory initWithUSBPDDictionary:](self, "initWithUSBPDDictionary:", v4);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("IIC")))
  {
    v6 = -[UARPSupportedAccessory initWithIICDictionary:](self, "initWithIICDictionary:", v4);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("USB")))
    {

      v7 = 0;
      goto LABEL_57;
    }
    v6 = -[UARPSupportedAccessory initWithUSBDictionary:](self, "initWithUSBDictionary:", v4);
  }
  v7 = v6;
  if (v6)
  {
    v73 = v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModelName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    modelName = v7->_modelName;
    v7->_modelName = (NSString *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsPowerlog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsPowerLogging = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsHeySiriCompact"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsHeySiriCompact = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsVoiceAssist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsVoiceAssist = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsLogs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsLogs = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsAnalytics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsAnalytics = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsMappedAnalytics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsMappedAnalytics = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsFriendlyName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsFriendlyName = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoAppliesStagedFirmware"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_autoAppliesStagedFirmware = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsAccMode7"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsAccMode7 = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReofferFirmwareOnSync"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_reofferFirmwareOnSync = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsInternalSettings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsInternalSettings = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsDeveloperSettings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsDeveloperSettings = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsVersions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsVersions = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowDownloadOnCellular"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_allowDownloadOnCellular = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TtrSolicitLogs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_ttrSolicitLogs = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpdateRequiresPowerAssertion"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_updateRequiresPowerAssertion = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsSimulator"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isSimulator = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DFUMode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_dfuMode = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UploaderResponseTimeout"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_uploaderResponseTimeout = objc_msgSend(v29, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UploaderRetryLimit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_uploaderRetryLimit = objc_msgSend(v30, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpdaterName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    updaterName = v7->_updaterName;
    v7->_updaterName = (NSString *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MobileAssetsModelNumber"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v7, "setMobileAssetAppleModelNumber:", v34);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FusingOverrideUnfused"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    fusingOverrideUnfused = v7->_fusingOverrideUnfused;
    v7->_fusingOverrideUnfused = (NSString *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupplementalAssetsModelNumber"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setSupplementalMobileAssetAppleModelNumber:](v7, "setSupplementalMobileAssetAppleModelNumber:", v38);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupplementalAssets"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v96;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v96 != v42)
            objc_enumerationMutation(v39);
          -[UARPSupportedAccessory addSupplementalAssetName:](v7, "addSupplementalAssetName:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v43++));
        }
        while (v41 != v43);
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
      }
      while (v41);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownstreamAppleModelNumbers"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v92;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v92 != v47)
            objc_enumerationMutation(v44);
          -[UARPSupportedAccessory addDownstreamAppleModelNumber:](v7, "addDownstreamAppleModelNumber:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v48++));
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
      }
      while (v46);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlternativeAppleModelNumbers"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v88;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v88 != v52)
            objc_enumerationMutation(v49);
          -[UARPSupportedAccessory addAlternativeAppleModelNumber:](v7, "addAlternativeAppleModelNumber:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v53++));
        }
        while (v51 != v53);
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      }
      while (v51);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BSDNotifications"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v84;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v84 != v57)
            objc_enumerationMutation(v54);
          -[UARPSupportedAccessory addBSDNotificationName:](v7, "addBSDNotificationName:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v58++));
        }
        while (v56 != v58);
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
      }
      while (v56);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ServiceBSDNotifications"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v80;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v80 != v62)
            objc_enumerationMutation(v59);
          -[UARPSupportedAccessory addServiceBSDNotificationName:](v7, "addServiceBSDNotificationName:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v63++));
        }
        while (v61 != v63);
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
      }
      while (v61);
    }
    v74 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sysdiagnoseApprovedMetrics"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v76;
      do
      {
        v68 = 0;
        do
        {
          if (*(_QWORD *)v76 != v67)
            objc_enumerationMutation(v64);
          -[UARPSupportedAccessory addSysdiagnoseApprovedMetric:](v7, "addSysdiagnoseApprovedMetric:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v68++));
        }
        while (v66 != v68);
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
      }
      while (v66);
    }
    v4 = v74;
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("PersonalizationNotification"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "copy");
    personalizationNotification = v7->_personalizationNotification;
    v7->_personalizationNotification = (NSString *)v70;

    v5 = v73;
  }
LABEL_57:

  return v7;
}

- (UARPSupportedAccessory)initWithBluetoothDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UARPAccessoryHardwareBluetooth *v9;
  void *v10;
  UARPSupportedAccessory *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VendorID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BluetoothVendorIDSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BluetoothProductVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", objc_msgSend(v7, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v6, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v8, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v9, v10, 0);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UARPSupportedAccessory)initWithHDSDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  UARPAccessoryHardwareHDS *v9;
  void *v10;
  UARPSupportedAccessory *v11;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  v9 = -[UARPAccessoryHardwareHDS initWithUUID:]([UARPAccessoryHardwareHDS alloc], "initWithUUID:", v8);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v9, v10, 0);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UARPSupportedAccessory)initWithHIDDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  UARPAccessoryHardwareHID *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  UARPAccessoryHIDPersonality *v11;
  void *v12;
  void *v13;
  UARPSupportedAccessory *v14;
  UARPSupportedAccessory *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Personalities"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VendorID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ProductID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v11 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", (unsigned __int16)objc_msgSend(v9, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"));
          -[UARPAccessoryHardwareHID addPersonality:](v5, "addPersonality:", v11);

        }
        else
        {
          v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", (unsigned __int16)objc_msgSend(v9, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"));
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("isPowerSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v5, v12, objc_msgSend(v13, "BOOLValue"));
    v15 = v14;
  }
  else
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ProductGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ProductNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v13)
      v18 = v16 == 0;
    else
      v18 = 1;
    v14 = self;
    if (v18)
    {
      v15 = 0;
    }
    else
    {
      v14 = -[UARPSupportedAccessory initWithHardwareID:productGroup:productNumber:capabilities:](self, "initWithHardwareID:productGroup:productNumber:capabilities:", v5, v13, v16, 0);
      v15 = v14;
    }

  }
  return v15;
}

- (UARPSupportedAccessory)initWithUSBPDDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UARPAccessoryHardwareUSBPD *v13;
  void *v14;
  void *v15;
  UARPSupportedAccessory *v16;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VendorID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB-PD Device Class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("MagSafe Cable")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Power Adapter")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("USB-C to Lightning")))
    {
      v16 = 0;
      goto LABEL_18;
    }
    v7 = 2;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("USB-PD Location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SOP")) & 1) != 0)
  {
    v9 = 0;
LABEL_13:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SupportsAccMode7"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = v5;
    v13 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v18, "unsignedIntegerValue"), v7, v9, v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPowerSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v13, v14, objc_msgSend(v15, "BOOLValue"));

      v16 = self;
    }
    else
    {
      v16 = 0;
    }
    v5 = v12;

    goto LABEL_17;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SOP Prime")) & 1) != 0)
  {
    v9 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SOP Double Prime")))
  {
    v9 = 2;
    goto LABEL_13;
  }
  v16 = 0;
LABEL_17:

LABEL_18:
  return v16;
}

- (UARPSupportedAccessory)initWithIICDictionary:(id)a3
{
  id v4;
  UARPAccessoryHardwareIIC *v5;
  void *v6;
  UARPSupportedAccessory *v7;

  v4 = a3;
  v5 = objc_alloc_init(UARPAccessoryHardwareIIC);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v5, v6, 0);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UARPSupportedAccessory)initWithUSBDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UARPAccessoryHardwareUSB *v7;
  void *v8;
  UARPSupportedAccessory *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VendorID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v6, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v7, v8, 0);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isMFi
{
  return self->_productGroup && self->_productNumber;
}

- (NSString)identifier
{
  NSString *productGroup;
  NSString *productNumber;
  __CFString *v4;
  NSString *appleModelNumber;

  productGroup = self->_productGroup;
  if (productGroup && (productNumber = self->_productNumber) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), productGroup, productNumber);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    appleModelNumber = self->_appleModelNumber;
    if (appleModelNumber)
      return appleModelNumber;
    v4 = CFSTR("unknown");
  }
  return (NSString *)v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = v3;
  if (self->_appleModelNumber)
    objc_msgSend(v3, "appendFormat:", CFSTR("Apple Model Number = %@"), self->_appleModelNumber);
  if (self->_productCode)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Product Code = %@"), self->_productCode);
  objc_msgSend(v4, "appendFormat:", CFSTR(", HardwareID = %@"), self->_hardwareID);
  if (self->_mobileAssetAppleModelNumber)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Mobile Assets ModelNumber = %@"), self->_mobileAssetAppleModelNumber);
  if (self->_productGroup)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Product Group = %@"), self->_productGroup);
  if (self->_productNumber)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Product Number = %@"), self->_productNumber);
  if (self->_supportsHeySiriCompact)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Supports HSML = YES"));
  if (self->_supportsAnalytics)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Supports TICS = YES"));
  if (self->_supportsMappedAnalytics)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Supports MTIC = YES"));
  if (self->_supportsFriendlyName)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Supports Friendly Name = YES"));
  if (-[NSMutableSet count](self->_downstreamAppleModelNumbers, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(", Downstream Apple Model Numbers = %@"), self->_downstreamAppleModelNumbers);
  if (-[NSMutableSet count](self->_alternativeAppleModelNumbers, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR(", Alternative Apple Model Numbers = %@"), self->_alternativeAppleModelNumbers);
  if (self->_mobileAssetAppleModelNumber)
    objc_msgSend(v4, "appendFormat:", CFSTR(", Mobile Asset Apple Model Numbers = %@"), self->_mobileAssetAppleModelNumber);
  -[UARPSupportedAccessory bsdNotifications](self, "bsdNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[UARPSupportedAccessory bsdNotifications](self, "bsdNotifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", BSD Notifications = %@"), v7);

  }
  -[UARPSupportedAccessory serviceBsdNotifications](self, "serviceBsdNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[UARPSupportedAccessory serviceBsdNotifications](self, "serviceBsdNotifications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", Service BSD Notifications = %@"), v10);

  }
  return v4;
}

- (id)hashIdentifier
{
  __CFString **v3;
  char isKindOfClass;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = kUARPSupportedAccessoryKeyTransportBluetooth;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = kUARPSupportedAccessoryKeyTransportB2PHID;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = kUARPSupportedAccessoryKeyTransportHID;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = kUARPSupportedAccessoryKeyTransportUSBPD;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v3 = kUARPSupportedAccessoryKeyTransportUSB;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v3 = kUARPSupportedAccessoryKeyTransportHDS;
            }
            else
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v3 = kUARPSupportedAccessoryKeyTransport;
              if ((isKindOfClass & 1) != 0)
                v3 = kUARPSupportedAccessoryKeyTransportIIC;
            }
          }
        }
      }
    }
  }
  v5 = *v3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[UARPSupportedAccessory identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UARPSupportedAccessory hashIdentifier](self, "hashIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UARPSupportedAccessory *v4;
  UARPSupportedAccessory *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UARPSupportedAccessory *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v8 = 1;
    }
    else
    {
      v5 = v4;
      -[UARPSupportedAccessory hashIdentifier](self, "hashIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPSupportedAccessory hashIdentifier](v5, "hashIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = nullableObjectsEqual(v6, (uint64_t)v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addBSDNotificationName:(id)a3
{
  -[NSMutableSet addObject:](self->_bsdNotificationsInternal, "addObject:", a3);
}

- (void)addServiceBSDNotificationName:(id)a3
{
  -[NSMutableSet addObject:](self->_serviceBsdNotificationsInternal, "addObject:", a3);
}

- (void)addSysdiagnoseApprovedMetric:(id)a3
{
  -[NSMutableSet addObject:](self->_sysdiagnoseApprovedMetrics, "addObject:", a3);
}

- (void)addSupplementalAssetName:(id)a3
{
  NSString *v5;
  void *v6;
  NSString *v7;

  v5 = self->_supplementalMobileAssetAppleModelNumber;
  if (!v5)
    v5 = self->_appleModelNumber;
  v7 = v5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_supplementalAssetsInternal, "addObject:", v6);

}

- (void)addDownstreamAppleModelNumber:(id)a3
{
  NSMutableSet *downstreamAppleModelNumbers;
  id v4;

  downstreamAppleModelNumbers = self->_downstreamAppleModelNumbers;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableSet addObject:](downstreamAppleModelNumbers, "addObject:", v4);

}

- (void)removeDownstreamAppleModelNumbers
{
  -[NSMutableSet removeAllObjects](self->_downstreamAppleModelNumbers, "removeAllObjects");
}

- (void)addAlternativeAppleModelNumber:(id)a3
{
  NSMutableSet *alternativeAppleModelNumbers;
  id v4;

  alternativeAppleModelNumbers = self->_alternativeAppleModelNumbers;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableSet addObject:](alternativeAppleModelNumbers, "addObject:", v4);

}

- (void)removeAlternativeAppleModelNumber:(id)a3
{
  -[NSMutableSet removeAllObjects](self->_alternativeAppleModelNumbers, "removeAllObjects", a3);
}

- (NSString)mobileAssetAppleModelNumber
{
  NSString *mobileAssetAppleModelNumber;

  mobileAssetAppleModelNumber = self->_mobileAssetAppleModelNumber;
  if (!mobileAssetAppleModelNumber)
    mobileAssetAppleModelNumber = self->_appleModelNumber;
  return mobileAssetAppleModelNumber;
}

- (void)setMobileAssetAppleModelNumber:(id)a3
{
  NSString *v4;
  NSString *mobileAssetAppleModelNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mobileAssetAppleModelNumber = self->_mobileAssetAppleModelNumber;
  self->_mobileAssetAppleModelNumber = v4;

}

- (NSString)supplementalMobileAssetAppleModelNumber
{
  NSString *supplementalMobileAssetAppleModelNumber;

  supplementalMobileAssetAppleModelNumber = self->_supplementalMobileAssetAppleModelNumber;
  if (!supplementalMobileAssetAppleModelNumber)
    supplementalMobileAssetAppleModelNumber = self->_appleModelNumber;
  return supplementalMobileAssetAppleModelNumber;
}

- (void)setSupplementalMobileAssetAppleModelNumber:(id)a3
{
  NSString *v4;
  NSString *supplementalMobileAssetAppleModelNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  supplementalMobileAssetAppleModelNumber = self->_supplementalMobileAssetAppleModelNumber;
  self->_supplementalMobileAssetAppleModelNumber = v4;

}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  NSString *v4;
  NSString *modelName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  modelName = self->_modelName;
  self->_modelName = v4;

}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  NSString *v4;
  NSString *vendorName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  vendorName = self->_vendorName;
  self->_vendorName = v4;

}

- (BOOL)autoAppliesStagedFirmware
{
  return self->_autoAppliesStagedFirmware;
}

- (void)setAutoAppliesStagedFirmware:(BOOL)a3
{
  self->_autoAppliesStagedFirmware = a3;
}

- (NSSet)bsdNotifications
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_bsdNotificationsInternal);
}

- (NSSet)serviceBsdNotifications
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_serviceBsdNotificationsInternal);
}

- (NSSet)supplementalAssets
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_supplementalAssetsInternal);
}

- (NSSet)downstreamAppleModelNumbers
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_downstreamAppleModelNumbers);
}

- (NSSet)alternativeAppleModelNumbers
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_alternativeAppleModelNumbers);
}

- (NSSet)sysdiagnoseApprovedMetrics
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_sysdiagnoseApprovedMetrics);
}

- (NSString)productCode
{
  return self->_productCode;
}

- (void)setProductCode:(id)a3
{
  NSString *v4;
  NSString *productCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  productCode = self->_productCode;
  self->_productCode = v4;

}

- (id)generatePlist
{
  UARPSupportedAccessory *v2;
  _BOOL4 v3;
  void *v4;
  UARPAccessoryHardwareID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString **v10;
  __CFString **v11;
  void *v12;
  __CFString **v13;
  uint64_t v14;
  NSString *modelName;
  const __CFString *vendorName;
  _BOOL4 supportsVoiceAssist;
  id v18;
  id v19;
  NSString *fusingOverrideUnfused;
  void *v21;
  void *v22;
  NSString *mobileAssetAppleModelNumber;
  NSString *supplementalMobileAssetAppleModelNumber;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *updaterName;
  NSString *personalizationNotification;
  void *v33;
  void *v34;
  void *v35;
  UARPAccessoryHardwareID *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString **v51;
  void *v52;
  UARPAccessoryHardwareID *v53;
  _BOOL4 v54;
  UARPSupportedAccessory *v55;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v2 = self;
  v63 = *MEMORY[0x24BDAC8D0];
  if (self->_productGroup)
    v3 = self->_productNumber != 0;
  else
    v3 = 0;
  v4 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v2->_hardwareID;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Bluetooth"), CFSTR("Transport"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("VendorID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("ProductID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UARPAccessoryHardwareID vendorIDSource](v5, "vendorIDSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("BluetoothVendorIDSource"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productVersion](v5, "productVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = kUARPSupportedAccessoryKeyBluetoothProductVersion;
LABEL_9:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *v10);
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v2->_hardwareID;
    v11 = kUARPSupportedAccessoryKeyTransportB2PHID;
LABEL_8:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *v11, CFSTR("Transport"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("VendorID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = kUARPSupportedAccessoryKeyProductID;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = v3;
    v55 = v2;
    v37 = v2->_hardwareID;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HID"), CFSTR("Transport"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v37, "vendorID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("VendorID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v37, "productID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v4;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("ProductID"));

    v40 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v53 = v37;
    -[UARPAccessoryHardwareID personalities](v37, "personalities");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v59 != v43)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v46 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v45, "vendorID"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, CFSTR("VendorID"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v45, "productID"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v48, CFSTR("ProductID"));

          objc_msgSend(v40, "addObject:", v46);
        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v42);
    }

    v4 = v56;
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v40, CFSTR("Personalities"));

    v2 = v55;
    v3 = v54;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v2->_hardwareID;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("USB-PD"), CFSTR("Transport"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("VendorID"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("ProductID"));

      if (-[UARPAccessoryHardwareID supportsAccMode7](v5, "supportsAccMode7"))
        objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsAccMode7"));
      if (-[UARPAccessoryHardwareID isMagSafeCable](v5, "isMagSafeCable"))
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("MagSafe Cable"), CFSTR("USB-PD Device Class"));
      if (-[UARPAccessoryHardwareID isPowerAdapter](v5, "isPowerAdapter"))
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Power Adapter"), CFSTR("USB-PD Device Class"));
      if (-[UARPAccessoryHardwareID isUSBCLightning](v5, "isUSBCLightning"))
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("USB-C to Lightning"), CFSTR("USB-PD Device Class"));
      if (-[UARPAccessoryHardwareID location](v5, "location"))
      {
        if (-[UARPAccessoryHardwareID location](v5, "location") == 1)
        {
          v51 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOPPrime;
        }
        else
        {
          if (-[UARPAccessoryHardwareID location](v5, "location") != 2)
            goto LABEL_11;
          v51 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOPDoublePrime;
        }
      }
      else
      {
        v51 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOP;
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *v51, CFSTR("USB-PD Location"));
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v2->_hardwareID;
      v11 = kUARPSupportedAccessoryKeyTransportUSB;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v2->_hardwareID;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HDS"), CFSTR("Transport"));
      -[UARPAccessoryHardwareID uuid](v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("UUID"));

      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("IIC"), CFSTR("Transport"));
  }
LABEL_12:
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2->_productGroup, CFSTR("ProductGroup"));
    v13 = kUARPSupportedAccessoryKeyProductNumber;
    v14 = 144;
  }
  else
  {
    v13 = kUARPSupportedAccessoryKeyAppleModelNumber;
    v14 = 128;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(Class *)((char *)&v2->super.isa + v14), *v13);
  modelName = v2->_modelName;
  if (modelName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", modelName, CFSTR("ModelName"));
  vendorName = (const __CFString *)v2->_vendorName;
  if (!vendorName)
    vendorName = CFSTR("Apple Inc.");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", vendorName, CFSTR("VendorName"));
  if ((v2->_capabilities & 1) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isPowerSource"));
  if (v2->_supportsPowerLogging)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsPowerlog"));
  if (v2->_supportsHeySiriCompact)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsHeySiriCompact"));
  supportsVoiceAssist = v2->_supportsVoiceAssist;
  if (v2->_supportsVoiceAssist)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsVoiceAssist"));
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v18, "addObject:", CFSTR("VoiceAssist"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("SupplementalAssets"));

    supportsVoiceAssist = v2->_supportsVoiceAssist;
  }
  if (supportsVoiceAssist || v2->_supportsHeySiriCompact)
  {
    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v19, "addObject:", CFSTR("com.apple.corespeech.voicetriggerassetchange"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("BSDNotifications"));

  }
  if (v2->_reofferFirmwareOnSync)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("ReofferFirmwareOnSync"));
  if (v2->_supportsLogs)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsLogs"));
  if (v2->_supportsAnalytics)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsAnalytics"));
  if (v2->_supportsMappedAnalytics)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsMappedAnalytics"));
  if (v2->_supportsFriendlyName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsFriendlyName"));
  if (v2->_supportsInternalSettings)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsInternalSettings"));
  if (v2->_supportsDeveloperSettings)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsDeveloperSettings"));
  if (v2->_supportsVersions)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportsVersions"));
  if (v2->_allowDownloadOnCellular)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("AllowDownloadOnCellular"));
  if (v2->_isSimulator)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IsSimulator"));
  if (v2->_dfuMode)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("DFUMode"));
  if (v2->_updateRequiresPowerAssertion)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("UpdateRequiresPowerAssertion"));
    if (v2->_updateRequiresPowerAssertion)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("UpdateRequiresPowerAssertion"));
  }
  if (v2->_autoAppliesStagedFirmware)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("AutoAppliesStagedFirmware"));
  if (v2->_ttrSolicitLogs)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("TtrSolicitLogs"));
  fusingOverrideUnfused = v2->_fusingOverrideUnfused;
  if (fusingOverrideUnfused)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", fusingOverrideUnfused, CFSTR("FusingOverrideUnfused"));
  if (v2->_uploaderResponseTimeout)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("UploaderResponseTimeout"));

  }
  if (v2->_uploaderRetryLimit)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("UploaderRetryLimit"));

  }
  mobileAssetAppleModelNumber = v2->_mobileAssetAppleModelNumber;
  if (mobileAssetAppleModelNumber)
  {
    if (-[NSString caseInsensitiveCompare:](mobileAssetAppleModelNumber, "caseInsensitiveCompare:", v2->_appleModelNumber)&& !v3)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v2->_mobileAssetAppleModelNumber, CFSTR("MobileAssetsModelNumber"));
    }
  }
  supplementalMobileAssetAppleModelNumber = v2->_supplementalMobileAssetAppleModelNumber;
  if (supplementalMobileAssetAppleModelNumber)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", supplementalMobileAssetAppleModelNumber, CFSTR("SupplementalAssetsModelNumber"));
  if (-[NSMutableSet count](v2->_downstreamAppleModelNumbers, "count"))
  {
    -[NSMutableSet allObjects](v2->_downstreamAppleModelNumbers, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("DownstreamAppleModelNumbers"));

  }
  if (-[NSMutableSet count](v2->_alternativeAppleModelNumbers, "count"))
  {
    -[NSMutableSet allObjects](v2->_alternativeAppleModelNumbers, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("AlternativeAppleModelNumbers"));

  }
  if (-[NSMutableSet count](v2->_bsdNotificationsInternal, "count"))
  {
    -[NSMutableSet allObjects](v2->_bsdNotificationsInternal, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("BSDNotifications"));

  }
  if (-[NSMutableSet count](v2->_serviceBsdNotificationsInternal, "count"))
  {
    -[NSMutableSet allObjects](v2->_serviceBsdNotificationsInternal, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("ServiceBSDNotifications"));

  }
  if (-[NSMutableSet count](v2->_sysdiagnoseApprovedMetrics, "count"))
  {
    -[NSMutableSet allObjects](v2->_sysdiagnoseApprovedMetrics, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("sysdiagnoseApprovedMetrics"));

  }
  updaterName = v2->_updaterName;
  if (updaterName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", updaterName, CFSTR("UpdaterName"));
  personalizationNotification = v2->_personalizationNotification;
  if (personalizationNotification)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", personalizationNotification, CFSTR("PersonalizationNotification"));
  v33 = (void *)objc_opt_new();
  -[UARPSupportedAccessory identifier](v2, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v4, v34);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)plistFilename
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[UARPSupportedAccessory hashIdentifier](self, "hashIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.plist"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)supportedAccessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[UARPSupportedAccessoryManager defaultManager](UARPSupportedAccessoryManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOfAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedAccessoriesByTransport:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[UARPSupportedAccessory supportedAccessories](UARPSupportedAccessory, "supportedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "hardwareID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "transport");

        if (v13 == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)findByHardwareID:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[UARPSupportedAccessory supportedAccessories](UARPSupportedAccessory, "supportedAccessories");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "hardwareID", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)findByAppleModelNumber:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[UARPSupportedAccessory supportedAccessories](UARPSupportedAccessory, "supportedAccessories");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if (v11)
        {
          v17 = v9;
          goto LABEL_20;
        }
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "alternativeAppleModelNumbers", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "isEqualToString:", v3) & 1) != 0)
              {
                v17 = v9;

                goto LABEL_20;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_20:

  return v17;
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAppleModelNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setProductGroup:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setProductNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (UARPAccessoryHardwareID)hardwareID
{
  return (UARPAccessoryHardwareID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setHardwareID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)supportsPowerLogging
{
  return self->_supportsPowerLogging;
}

- (void)setSupportsPowerLogging:(BOOL)a3
{
  self->_supportsPowerLogging = a3;
}

- (BOOL)supportsVoiceAssist
{
  return self->_supportsVoiceAssist;
}

- (void)setSupportsVoiceAssist:(BOOL)a3
{
  self->_supportsVoiceAssist = a3;
}

- (BOOL)supportsHeySiriCompact
{
  return self->_supportsHeySiriCompact;
}

- (void)setSupportsHeySiriCompact:(BOOL)a3
{
  self->_supportsHeySiriCompact = a3;
}

- (BOOL)supportsLogs
{
  return self->_supportsLogs;
}

- (void)setSupportsLogs:(BOOL)a3
{
  self->_supportsLogs = a3;
}

- (BOOL)supportsAnalytics
{
  return self->_supportsAnalytics;
}

- (void)setSupportsAnalytics:(BOOL)a3
{
  self->_supportsAnalytics = a3;
}

- (BOOL)supportsMappedAnalytics
{
  return self->_supportsMappedAnalytics;
}

- (void)setSupportsMappedAnalytics:(BOOL)a3
{
  self->_supportsMappedAnalytics = a3;
}

- (BOOL)supportsFriendlyName
{
  return self->_supportsFriendlyName;
}

- (void)setSupportsFriendlyName:(BOOL)a3
{
  self->_supportsFriendlyName = a3;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

- (void)setSupportsAccMode7:(BOOL)a3
{
  self->_supportsAccMode7 = a3;
}

- (BOOL)reofferFirmwareOnSync
{
  return self->_reofferFirmwareOnSync;
}

- (void)setReofferFirmwareOnSync:(BOOL)a3
{
  self->_reofferFirmwareOnSync = a3;
}

- (BOOL)supportsInternalSettings
{
  return self->_supportsInternalSettings;
}

- (void)setSupportsInternalSettings:(BOOL)a3
{
  self->_supportsInternalSettings = a3;
}

- (BOOL)supportsDeveloperSettings
{
  return self->_supportsDeveloperSettings;
}

- (void)setSupportsDeveloperSettings:(BOOL)a3
{
  self->_supportsDeveloperSettings = a3;
}

- (BOOL)supportsVersions
{
  return self->_supportsVersions;
}

- (void)setSupportsVersions:(BOOL)a3
{
  self->_supportsVersions = a3;
}

- (BOOL)allowDownloadOnCellular
{
  return self->_allowDownloadOnCellular;
}

- (void)setAllowDownloadOnCellular:(BOOL)a3
{
  self->_allowDownloadOnCellular = a3;
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (void)setIsSimulator:(BOOL)a3
{
  self->_isSimulator = a3;
}

- (BOOL)dfuMode
{
  return self->_dfuMode;
}

- (void)setDfuMode:(BOOL)a3
{
  self->_dfuMode = a3;
}

- (BOOL)updateRequiresPowerAssertion
{
  return self->_updateRequiresPowerAssertion;
}

- (void)setUpdateRequiresPowerAssertion:(BOOL)a3
{
  self->_updateRequiresPowerAssertion = a3;
}

- (BOOL)ttrSolicitLogs
{
  return self->_ttrSolicitLogs;
}

- (void)setTtrSolicitLogs:(BOOL)a3
{
  self->_ttrSolicitLogs = a3;
}

- (NSString)fusingOverrideUnfused
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFusingOverrideUnfused:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)updaterName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUpdaterName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSString)personalizationNotification
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPersonalizationNotification:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (unint64_t)uploaderResponseTimeout
{
  return self->_uploaderResponseTimeout;
}

- (void)setUploaderResponseTimeout:(unint64_t)a3
{
  self->_uploaderResponseTimeout = a3;
}

- (unint64_t)uploaderRetryLimit
{
  return self->_uploaderRetryLimit;
}

- (void)setUploaderRetryLimit:(unint64_t)a3
{
  self->_uploaderRetryLimit = a3;
}

- (BOOL)postStagingNotifications
{
  return self->_postStagingNotifications;
}

- (void)setPostStagingNotifications:(BOOL)a3
{
  self->_postStagingNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationNotification, 0);
  objc_storeStrong((id *)&self->_updaterName, 0);
  objc_storeStrong((id *)&self->_fusingOverrideUnfused, 0);
  objc_storeStrong((id *)&self->_hardwareID, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseApprovedMetrics, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_supplementalMobileAssetAppleModelNumber, 0);
  objc_storeStrong((id *)&self->_mobileAssetAppleModelNumber, 0);
  objc_storeStrong((id *)&self->_alternativeAppleModelNumbers, 0);
  objc_storeStrong((id *)&self->_downstreamAppleModelNumbers, 0);
  objc_storeStrong((id *)&self->_supplementalAssetsInternal, 0);
  objc_storeStrong((id *)&self->_serviceBsdNotificationsInternal, 0);
  objc_storeStrong((id *)&self->_bsdNotificationsInternal, 0);
}

@end
