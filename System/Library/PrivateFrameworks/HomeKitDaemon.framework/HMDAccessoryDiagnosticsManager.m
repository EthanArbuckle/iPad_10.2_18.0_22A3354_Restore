@implementation HMDAccessoryDiagnosticsManager

- (HMDAccessoryDiagnosticsManager)initWithAccessory:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  HMDAccessoryDiagnosticsManager *v10;
  HMDAccessoryDiagnosticsManager *v11;
  HMDAccessoryDiagnosticsManager *v13;
  SEL v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v8 && (isKindOfClass & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDAccessoryDiagnosticsManager;
    v10 = -[HMDAccessoryDiagnosticsManagerInternal initWithAccessory:](&v15, sel_initWithAccessory_, v8);
    v11 = v10;
    if (v10)
      objc_storeStrong((id *)&v10->_diagnosticsService, a4);

    return v11;
  }
  else
  {
    v13 = (HMDAccessoryDiagnosticsManager *)_HMFPreconditionFailure();
    return (HMDAccessoryDiagnosticsManager *)-[HMDAccessoryDiagnosticsManager attributeDescriptions](v13, v14);
  }
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryDiagnosticsManager;
  -[HMDAccessoryDiagnosticsManagerInternal attributeDescriptions](&v16, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDiagnosticsManager diagnosticsSettings](self, "diagnosticsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Diagnostics Settings"), v5);
  v17[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](self, "currentDiagnosticsSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Diagnostics Session"), v8);
  v17[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDiagnosticsManager didShutDown](self, "didShutDown");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("didShutDown"), v11);
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryDiagnosticsManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAccessoryDiagnosticsManager *v13;
  NSObject *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  HMDAccessoryDiagnosticsManager *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD59F8], *MEMORY[0x24BDD6B90]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v21[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsManagerInternal clientIdentifier](self, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v6, v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not disabling notification since diagnostics snapshot characteristic is not present", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v15;
    v19 = 2048;
    v20 = v13;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory diagnostics manager: %p destroyed", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

  v16.receiver = v13;
  v16.super_class = (Class)HMDAccessoryDiagnosticsManager;
  -[HMDAccessoryDiagnosticsManager dealloc](&v16, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__HMDAccessoryDiagnosticsManager_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)shutDown
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDAccessoryDiagnosticsManager_shutDown__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleCharacteristicsUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryDiagnosticsManager_handleCharacteristicsUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleCharacteristicValueUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDAccessoryDiagnosticsManager_handleCharacteristicValueUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryDiagnosticsManager *v9;

  v4 = a3;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
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
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleDiagnosticsTransferWithOptions:(id)a3 completion:(id)a4
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
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferWithOptions_completion___block_invoke;
  v11[3] = &unk_24E799B20;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  -[HMDAccessoryDiagnosticsManager _readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:](self, "_readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_start
{
  NSObject *v3;
  void *v4;
  HMDAccessoryDiagnosticsManager *v5;
  NSObject *v6;
  void *v7;
  HMDAccessoryDiagnosticsSettings *v8;
  void *v9;
  HMDAccessoryDiagnosticsSettings *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryDiagnosticsManager didShutDown](self, "didShutDown"))
    _HMFPreconditionFailure();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryDiagnosticsManager _registerForMessagesAndNotifications](v5, "_registerForMessagesAndNotifications");
  v8 = [HMDAccessoryDiagnosticsSettings alloc];
  -[HMDAccessoryDiagnosticsManager diagnosticsService](v5, "diagnosticsService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDAccessoryDiagnosticsSettings initWithService:](v8, "initWithService:", v9);
  -[HMDAccessoryDiagnosticsManager setDiagnosticsSettings:](v5, "setDiagnosticsSettings:", v10);

  -[HMDAccessoryDiagnosticsManager _updateDiagnosticSettings](v5, "_updateDiagnosticSettings");
  -[HMDAccessoryDiagnosticsManager _fetchCloudDiagnosticsMetadata](v5, "_fetchCloudDiagnosticsMetadata");
}

- (void)_shutDown
{
  NSObject *v3;
  void *v4;
  HMDAccessoryDiagnosticsManager *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryDiagnosticsManager didShutDown](self, "didShutDown"))
    _HMFPreconditionFailure();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryDiagnosticsManager _clearCurrentDiagnosticsSession:](v5, "_clearCurrentDiagnosticsSession:", 0);
  -[HMDAccessoryDiagnosticsManager setDiagnosticsSettings:](v5, "setDiagnosticsSettings:", 0);
  -[HMDAccessoryDiagnosticsManager setDidShutDown:](v5, "setDidShutDown:", 1);
  -[HMDAccessoryDiagnosticsManager _notifyClientsOfDiagnosticsTransferSupportUpdated](v5, "_notifyClientsOfDiagnosticsTransferSupportUpdated");
  -[HMDAccessoryDiagnosticsManager _invalidateCloudDiagnosticsMetadata](v5, "_invalidateCloudDiagnosticsMetadata");
}

- (void)_registerForMessagesAndNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryDiagnosticsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCharacteristicsUpdatedNotification_, CFSTR("kHMDNotificationCharacteristicsUpdated"), v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleCharacteristicValueUpdatedNotification_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryConfiguredNotification_, CFSTR("HMDAccessoryConnectedNotification"), v3);

  objc_msgSend(v3, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD59F8], *MEMORY[0x24BDD6B90]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v24[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsManagerInternal clientIdentifier](self, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v9, v10);

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
      objc_msgSend(v3, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Expected diagnostics characteristic not present for accessory(%@/%@)", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_updateDiagnosticSettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDAccessoryDiagnosticsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAccessoryDiagnosticsManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessoryDiagnosticsManager *v37;
  NSObject *v38;
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
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDiagnosticsManager diagnosticsService](self, "diagnosticsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findCharacteristicWithType:", *MEMORY[0x24BDD59F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE1BBF8];
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v7, "parsedFromData:error:", v8, &v52);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v52;

    objc_msgSend(v9, "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (objc_msgSend(v9, "type"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v9, "options"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v9, "audioDiagnostics");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v36 = (void *)MEMORY[0x227676638]();
        v37 = self;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = v10;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryDiagnosticsManagerInternal accessory](v37, "accessory");
          v49 = v36;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryDiagnosticsManagerInternal accessory](v37, "accessory");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "uuid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "UUIDString");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v39;
          v55 = 2112;
          v56 = v41;
          v57 = 2112;
          v58 = (uint64_t)v44;
          v59 = 2112;
          v60 = v51;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse accessory supported diagnostics snapshot (%@/%@) with error: %@", buf, 0x2Au);

          v36 = v49;
          v10 = v51;
        }

        objc_autoreleasePoolPop(v36);
        goto LABEL_10;
      }
    }
    -[HMDAccessoryDiagnosticsManager diagnosticsSettings](self, "diagnosticsSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v9);

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsManagerInternal accessory](v16, "accessory");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsManagerInternal accessory](v16, "accessory");
        v48 = v15;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsManager diagnosticsSettings](v16, "diagnosticsSettings");
        v50 = v10;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentSnapshot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v54 = v45;
        v55 = 2112;
        v56 = v18;
        v57 = 2112;
        v58 = v20;
        v23 = (void *)v20;
        v59 = 2112;
        v60 = v22;
        v61 = 2112;
        v62 = v9;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating accessory diagnostics snapshot for %@/%@: %@ -> %@", buf, 0x34u);

        v10 = v50;
        v15 = v48;

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsManager _clearCurrentDiagnosticsSession:](v16, "_clearCurrentDiagnosticsSession:", v24);

      -[HMDAccessoryDiagnosticsManager diagnosticsSettings](v16, "diagnosticsSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCurrentSnapshot:", v9);

      -[HMDAccessoryDiagnosticsManager _notifyClientsOfDiagnosticsTransferSupportUpdated](v16, "_notifyClientsOfDiagnosticsTransferSupportUpdated");
    }
LABEL_10:

    goto LABEL_14;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsManagerInternal accessory](v27, "accessory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDiagnosticsManagerInternal accessory](v27, "accessory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v29;
    v55 = 2112;
    v56 = v31;
    v57 = 2112;
    v58 = (uint64_t)v34;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@No diagnostics supported configuration (%@/%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v26);
LABEL_14:

}

- (void)_notifyClientsOfDiagnosticsTransferSupportUpdated
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDiagnosticsManager diagnosticsSettings](self, "diagnosticsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  objc_msgSend(v8, "supportedDiagnostics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDiagnosticsManagerInternal notifyClientsOfDiagnosticsTransferSupport:supportDiagnosticsTransfer:](self, "notifyClientsOfDiagnosticsTransferSupport:supportDiagnosticsTransfer:", v6, v7);

}

- (BOOL)_isRequestSupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDAccessoryDiagnosticsManager *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  HMDAccessoryDiagnosticsManager *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  HMDAccessoryDiagnosticsManager *v27;
  void *v28;
  HMDAccessoryDiagnosticsManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  HMDAccessoryDiagnosticsManager *v34;
  void *v35;
  char v36;
  HMDAccessoryDiagnosticsManager *v37;
  void *v38;
  char v39;
  HMDAccessoryDiagnosticsManager *v40;
  void *v41;
  char v42;
  HMDAccessoryDiagnosticsManager *v43;
  int v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryDiagnosticsManager diagnosticsSettings](self, "diagnosticsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
    {
      -[HMDAccessoryDiagnosticsManager diagnosticsSettings](self, "diagnosticsSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "logSize");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9
        || (v10 = (void *)v9,
            objc_msgSend(v8, "options"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "value"),
            v11,
            v10,
            (v12 & 2) != 0))
      {
        objc_msgSend(v4, "delay");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23
          || (v24 = (void *)v23,
              objc_msgSend(v8, "options"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v25, "value"),
              v25,
              v24,
              (v26 & 1) != 0))
        {
          if (!objc_msgSend(v4, "recordAudio")
            || (objc_msgSend(v8, "audioDiagnostics"),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v33 = objc_msgSend(v32, "value"),
                v32,
                (v33 & 1) != 0))
          {
            if (!objc_msgSend(v4, "enableAudioClips")
              || (objc_msgSend(v8, "audioDiagnostics"),
                  v35 = (void *)objc_claimAutoreleasedReturnValue(),
                  v36 = objc_msgSend(v35, "value"),
                  v35,
                  (v36 & 2) != 0))
            {
              if (objc_msgSend(v4, "snapshotType") != 1
                || (objc_msgSend(v8, "type"),
                    v38 = (void *)objc_claimAutoreleasedReturnValue(),
                    v39 = objc_msgSend(v38, "value"),
                    v38,
                    (v39 & 1) != 0))
              {
                if (objc_msgSend(v4, "snapshotType") != 2
                  || (objc_msgSend(v8, "type"),
                      v41 = (void *)objc_claimAutoreleasedReturnValue(),
                      v42 = objc_msgSend(v41, "value"),
                      v41,
                      (v42 & 2) != 0))
                {
                  v22 = 1;
                  goto LABEL_35;
                }
                v13 = (void *)MEMORY[0x227676638]();
                v43 = self;
                HMFGetOSLogHandle();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = 138543362;
                  v46 = v16;
                  v17 = "%{public}@ADK snapshot requested, but not supported on the accessory.";
                  goto LABEL_33;
                }
              }
              else
              {
                v13 = (void *)MEMORY[0x227676638]();
                v40 = self;
                HMFGetOSLogHandle();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = 138543362;
                  v46 = v16;
                  v17 = "%{public}@Manufacturer snapshot requested, but not supported on the accessory.";
                  goto LABEL_33;
                }
              }
            }
            else
            {
              v13 = (void *)MEMORY[0x227676638]();
              v37 = self;
              HMFGetOSLogHandle();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = 138543362;
                v46 = v16;
                v17 = "%{public}@Audio clips requested, but not supported on the accessory.";
                goto LABEL_33;
              }
            }
          }
          else
          {
            v13 = (void *)MEMORY[0x227676638]();
            v34 = self;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = 138543362;
              v46 = v16;
              v17 = "%{public}@Audio recording requested, but not supported on the accessory.";
              goto LABEL_33;
            }
          }
        }
        else
        {
          v13 = (void *)MEMORY[0x227676638]();
          v27 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 138543362;
            v46 = v16;
            v17 = "%{public}@Delay requested, but not supported on the accessory.";
            goto LABEL_33;
          }
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
          v45 = 138543362;
          v46 = v16;
          v17 = "%{public}@Custom max log size requested, but not supported on the accessory.";
LABEL_33:
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v45, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v13);
      v22 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543362;
      v46 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@No options selected, default request will be issued.", (uint8_t *)&v45, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v22 = 1;
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
      v45 = 138543362;
      v46 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Diagnostic settings not configured yet", (uint8_t *)&v45, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = 0;
  }
LABEL_36:

  return v22;
}

- (void)_readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryDiagnosticsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsManager diagnosticsService](self, "diagnosticsService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findCharacteristicWithType:", *MEMORY[0x24BDD59F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMDAccessoryDiagnosticsManager _updateDiagnosticSettings](self, "_updateDiagnosticSettings");
    }
    else if (objc_msgSend(v8, "isReachable"))
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempting to read and update the diagnostic settings for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v12);
      v22 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsManagerInternal workQueue](v12, "workQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __95__HMDAccessoryDiagnosticsManager__readRequiredDiagnosticCharacteristicsIfNeededWithCompletion___block_invoke;
      v19[3] = &unk_24E79AC58;
      objc_copyWeak(&v21, (id *)buf);
      v20 = v4;
      objc_msgSend(v8, "readCharacteristicValues:source:queue:completionHandler:", v17, 7, v18, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);

      goto LABEL_10;
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v10);

LABEL_11:
}

- (void)_handleDiagnosticsTransferRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  HMDAccessoryDiagnosticsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  BOOL v15;
  void *v16;
  void *v17;
  HMDAccessoryDiagnosticsManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessoryDiagnosticsManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessoryDiagnosticsManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDAccessoryDiagnosticsSession *v33;
  void *v34;
  void *v35;
  HMDAccessoryDiagnosticsSession *v36;
  void *v37;
  HMDAccessoryDiagnosticsManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDAccessoryDiagnosticsManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  void (**v50)(id, void *, _QWORD);
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Attempting to start diagnostics transfer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  if (-[HMDAccessoryDiagnosticsManager _isRequestSupported:](v10, "_isRequestSupported:", v6))
  {
    -[HMDAccessoryDiagnosticsManager diagnosticsSettings](v10, "diagnosticsSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transport");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == CFSTR("DataStream");

    if (v15)
    {
      -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](v10, "currentDiagnosticsSession");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = v10;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v31;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@A session is already opened", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v32, 0);

      }
      else if (-[HMDAccessoryDiagnosticsManager cloudFetchCompleted](v10, "cloudFetchCompleted"))
      {
        v33 = [HMDAccessoryDiagnosticsSession alloc];
        -[HMDAccessoryDiagnosticsManagerInternal accessory](v10, "accessory");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryDiagnosticsManager diagnosticsSettings](v10, "diagnosticsSettings");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[HMDAccessoryDiagnosticsSession initWithAccessory:settings:](v33, "initWithAccessory:settings:", v34, v35);
        -[HMDAccessoryDiagnosticsManagerInternal setCurrentDiagnosticsSession:](v10, "setCurrentDiagnosticsSession:", v36);

        v37 = (void *)MEMORY[0x227676638]();
        v38 = v10;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](v38, "currentDiagnosticsSession");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v40;
          v54 = 2112;
          v55 = v41;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Setting up a diagnostics transfer session: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        objc_initWeak((id *)buf, v38);
        -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](v38, "currentDiagnosticsSession");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __90__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferRequestWithOptions_completion___block_invoke;
        v48[3] = &unk_24E796558;
        objc_copyWeak(&v51, (id *)buf);
        v50 = v7;
        v49 = v6;
        objc_msgSend(v42, "setUpWithOptions:completion:", v49, v48);

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v10;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v46;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Diagnostic cloud metadata not available", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v43);
        if (!-[HMDAccessoryDiagnosticsManager cloudFetchInProgress](v44, "cloudFetchInProgress"))
          -[HMDAccessoryDiagnosticsManager _fetchCloudDiagnosticsMetadata](v44, "_fetchCloudDiagnosticsMetadata");
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v47, 0);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v10;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v20;
        v54 = 2112;
        v55 = v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Transport is not data stream, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v21, 0);

    }
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v10;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer failed as the request is not supported.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v26, 0);

  }
}

- (void)_readDiagnosticsDataWithCloudKitMetadataRequirement:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDAccessoryDiagnosticsManager *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](self, "currentDiagnosticsSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Read diagnostics data for session: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_initWeak((id *)buf, v12);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke;
  v16[3] = &unk_24E78DCF0;
  objc_copyWeak(&v18, (id *)buf);
  v15 = v6;
  v17 = v15;
  v19 = a3;
  objc_msgSend(v10, "readDataWithCompletion:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

- (void)_clearCurrentDiagnosticsSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessoryDiagnosticsManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](self, "currentDiagnosticsSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](v8, "currentDiagnosticsSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Clear current session: %@ with error: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessoryDiagnosticsManagerInternal currentDiagnosticsSession](v8, "currentDiagnosticsSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shutDown");

    -[HMDAccessoryDiagnosticsManagerInternal setCurrentDiagnosticsSession:](v8, "setCurrentDiagnosticsSession:", 0);
  }

}

- (HMDService)diagnosticsService
{
  return (HMDService *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessoryDiagnosticsSettings)diagnosticsSettings
{
  return (HMDAccessoryDiagnosticsSettings *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDiagnosticsSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)didShutDown
{
  return self->_didShutDown;
}

- (void)setDidShutDown:(BOOL)a3
{
  self->_didShutDown = a3;
}

- (BOOL)cloudFetchInProgress
{
  return self->_cloudFetchInProgress;
}

- (void)setCloudFetchInProgress:(BOOL)a3
{
  self->_cloudFetchInProgress = a3;
}

- (BOOL)cloudFetchCompleted
{
  return self->_cloudFetchCompleted;
}

- (void)setCloudFetchCompleted:(BOOL)a3
{
  self->_cloudFetchCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_diagnosticsService, 0);
}

void __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (v7)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v15;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics data read failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v13, "_clearCurrentDiagnosticsSession:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke_33;
    v26[3] = &unk_24E78DCC8;
    objc_copyWeak(&v30, (id *)(a1 + 40));
    v29 = *(id *)(a1 + 32);
    v27 = v8;
    v28 = v9;
    objc_msgSend(WeakRetained, "_fetchModelDiagnosticsMetadataForAccessory:withCompletion:", v16, v26);

    objc_destroyWeak(&v30);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = WeakRetained;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentDiagnosticsSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Diagnostics metadata not required for session:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v22 = objc_alloc(MEMORY[0x24BDD7390]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E79DB48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E79DB48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v8, v9, v23, v24, &unk_24E96C368, &unk_24E96C368);

    objc_msgSend(v18, "_clearCurrentDiagnosticsSession:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __97__HMDAccessoryDiagnosticsManager__readDiagnosticsDataWithCloudKitMetadataRequirement_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching cloud metadata from model failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "_clearCurrentDiagnosticsSession:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x24BDD7390]);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "privacyPolicyURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uploadDestination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "consentVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "uploadType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v25, "initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v13, v14, v15, v16, v17, v18);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = WeakRetained;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentDiagnosticsSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data read completed for session:%@ metadata:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v21, "_clearCurrentDiagnosticsSession:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    v5 = v26;
  }

}

void __90__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferRequestWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(WeakRetained, "currentDiagnosticsSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data transfer session with error: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "_clearCurrentDiagnosticsSession:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v20;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Diagnostics transfer session was setup successfully", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v21 = *(void **)(a1 + 32);
      if (v21)
        v22 = objc_msgSend(v21, "metadataRequired");
      else
        v22 = 1;
      objc_msgSend(v11, "_readDiagnosticsDataWithCloudKitMetadataRequirement:completion:", v22, *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = WeakRetained;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data transfer session, current diagnostics session is nil", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], -1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_clearCurrentDiagnosticsSession:", v19);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __95__HMDAccessoryDiagnosticsManager__readRequiredDiagnosticCharacteristicsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(v11, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(v4, "_updateDiagnosticSettings");
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }

}

void __83__HMDAccessoryDiagnosticsManager__handleDiagnosticsTransferWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required diagnostic characteristics. Error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "_handleDiagnosticsTransferRequestWithOptions:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_2;
  v3[3] = &unk_24E78DCA0;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_handleDiagnosticsTransferWithOptions:completion:", v2, v3);

}

void __79__HMDAccessoryDiagnosticsManager_handleDiagnosticsTransferWithOptions_message___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
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
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer request failed for message: %@. Error: %@.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  if (v6)
  {
    v14 = *MEMORY[0x24BDD4B48];
    encodeRootObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", v13, v5, v14);

}

void __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "diagnosticsService");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "supportedDiagnostics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = *(void **)(a1 + 40);
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke_2;
        v9[3] = &unk_24E79BD80;
        v9[4] = v8;
        objc_msgSend(v8, "_readRequiredDiagnosticCharacteristicsIfNeededWithCompletion:", v9);
      }
    }
  }

}

void __72__HMDAccessoryDiagnosticsManager_handleAccessoryConfiguredNotification___block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to read the required diagnostic characteristics with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __79__HMDAccessoryDiagnosticsManager_handleCharacteristicValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDiagnosticSettings");
}

uint64_t __75__HMDAccessoryDiagnosticsManager_handleCharacteristicsUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDiagnosticSettings");
}

uint64_t __42__HMDAccessoryDiagnosticsManager_shutDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutDown");
}

uint64_t __39__HMDAccessoryDiagnosticsManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_fetchCloudDiagnosticsMetadata
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[HMDAccessoryDiagnosticsManager setCloudFetchInProgress:](self, "setCloudFetchInProgress:", 1);
  objc_initWeak(&location, self);
  -[HMDAccessoryDiagnosticsManagerInternal accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke;
  v4[3] = &unk_24E799B48;
  objc_copyWeak(&v5, &location);
  -[HMDAccessoryDiagnosticsManager __fetchCloudDiagnosticsMetadataForAccessory:completion:](self, "__fetchCloudDiagnosticsMetadataForAccessory:completion:", v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)__fetchCloudDiagnosticsMetadataForAccessory:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a4;
  +[HMDNetworkRouterFirewallRuleManager sharedInstance](HMDNetworkRouterFirewallRuleManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke;
  v9[3] = &unk_24E79AB68;
  v10 = v6;
  v11 = v5;
  v9[4] = self;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "startupForClient:completion:", self, v9);

}

- (void)_fetchModelDiagnosticsMetadataForAccessory:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryDiagnosticsManager *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDNetworkRouterFirewallRuleManager sharedInstance](HMDNetworkRouterFirewallRuleManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Fetching diagnostics parameters locally for accessory with identifier %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_initWeak((id *)buf, v12);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __99__HMDAccessoryDiagnosticsManager_Cloud___fetchModelDiagnosticsMetadataForAccessory_withCompletion___block_invoke;
    v19[3] = &unk_24E78EEB8;
    objc_copyWeak(&v22, (id *)buf);
    v20 = v10;
    v21 = v7;
    objc_msgSend(v9, "fetchPairedMetadataVersionConfigurationsForAccessories:completion:", v16, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get cloud diagnostics parameters due to failure to derive identifier for accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

  }
}

- (void)_callCompletionHandler:(id)a3 diagnostics:(id)a4 error:(id)a5
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryDiagnosticsManagerInternal workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryDiagnosticsManager_Cloud___callCompletionHandler_diagnostics_error___block_invoke;
  block[3] = &unk_24E79B440;
  v17 = v10;
  v18 = v8;
  v16 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

}

- (void)_invalidateCloudDiagnosticsMetadata
{
  id v3;

  +[HMDNetworkRouterFirewallRuleManager sharedInstance](HMDNetworkRouterFirewallRuleManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shutdownForClient:", self);

}

uint64_t __82__HMDAccessoryDiagnosticsManager_Cloud___callCompletionHandler_diagnostics_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __99__HMDAccessoryDiagnosticsManager_Cloud___fetchModelDiagnosticsMetadataForAccessory_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      v39 = 138543874;
      v40 = v11;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetched accessory metadata for %@ failed with error %@", (uint8_t *)&v39, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "_callCompletionHandler:diagnostics:error:", *(_QWORD *)(a1 + 40), 0, v6);
  }
  else if (v5)
  {
    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "diagnostics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x227676638]();
    v17 = WeakRetained;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "diagnostics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 32);
        v39 = 138543874;
        v40 = v20;
        v41 = 2112;
        v42 = v21;
        v43 = 2112;
        v44 = v22;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched diagnostics metadata %@ from model for accessory with identifier %@", (uint8_t *)&v39, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "diagnostics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v26 = v23;
      v27 = v24;
      v28 = 0;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(a1 + 32);
        v39 = 138543618;
        v40 = v36;
        v41 = 2112;
        v42 = v37;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics metadata not present in version configuration for accessory %@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v38 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v26 = v38;
      v27 = 0;
      v28 = v24;
    }
    objc_msgSend(v25, "_callCompletionHandler:diagnostics:error:", v26, v27, v28);

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = WeakRetained;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 32);
      v39 = 138543618;
      v40 = v32;
      v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Fetched accessory metadata for %@ failed due to nil metadata", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    v34 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_callCompletionHandler:diagnostics:error:", v34, 0, v35);

  }
}

void __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
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
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up firewall rule manager: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke_4;
    v9[3] = &unk_24E78EE90;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v8, "fetchCloudChangesWithCompletion:", v9);

  }
}

void __96__HMDAccessoryDiagnosticsManager_Cloud____fetchCloudDiagnosticsMetadataForAccessory_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch changes from firewall rule manager: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

void __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
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
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = v5;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v9;
        v15 = 2112;
        v16 = v3;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud diagnostics metadata with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7, "setCloudFetchInProgress:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke_1;
      v11[3] = &unk_24E79C268;
      v11[4] = v5;
      v12 = 0;
      dispatch_async(v10, v11);

    }
  }

}

uint64_t __71__HMDAccessoryDiagnosticsManager_Cloud___fetchCloudDiagnosticsMetadata__block_invoke_1(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
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
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@fetching diagnostics cloud metadata for accessory %@ completed with error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setCloudFetchCompleted:", 1);
}

@end
