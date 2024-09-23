@implementation HMDAccessoryFirmwareUpdateCameraPolicy

- (void)configure
{
  -[HMDAccessoryFirmwareUpdateCameraPolicy registerForNotifications](self, "registerForNotifications");
  -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", -[HMDAccessoryFirmwareUpdateCameraPolicy evaluate](self, "evaluate"));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryFirmwareUpdateCameraPolicy *v4;
  HMDAccessoryFirmwareUpdateCameraPolicy *v5;
  HMDAccessoryFirmwareUpdateCameraPolicy *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessoryFirmwareUpdateCameraPolicy *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdatePolicy accessory](v6, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccessoryConfiguredNotification_, CFSTR("HMDAccessoryConnectedNotification"), v7);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleAccessoryUnconfiguredNotification_, CFSTR("HMDAccessoryDisconnectedNotification"), v7);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleSettingsChange_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v7);

  if (objc_msgSend(v7, "isReachable"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v7);

  }
}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAccessoryUnconfiguredNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryUnconfiguredNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)monitorStreamStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "findCharacteristicsByType:forServiceType:", *MEMORY[0x24BE1B5E8], *MEMORY[0x24BDD6B68]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableNotification:forCharacteristics:message:clientIdentifier:", v3, v5, 0, CFSTR("com.apple.HomeKitDaemon.firmwareUpdateCameraPolicy"));

    v4 = v6;
  }

}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryFirmwareUpdateCameraPolicy *v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__HMDAccessoryFirmwareUpdateCameraPolicy_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleStreamStatusCharacteristicChanges
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findCharacteristicsByType:forServiceType:", *MEMORY[0x24BE1B5E8], *MEMORY[0x24BDD6B68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "value", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[HMDAccessoryFirmwareUpdateCameraPolicy _processStreamingStatus:](self, "_processStreamingStatus:", v6);
}

- (void)handleSettingsChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy_handleSettingsChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_checkStreamingStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryFirmwareUpdateCameraPolicy *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id location[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findCharacteristicsByType:forServiceType:", *MEMORY[0x24BE1B5E8], *MEMORY[0x24BDD6B68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_initWeak(location, self);
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateCameraPolicy description](self, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke;
    v20[3] = &unk_24E798D90;
    objc_copyWeak(&v22, location);
    v21 = v3;
    objc_msgSend(v14, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v21, 7, v15, -1, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);

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
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the stream status characteristic from any of the stream services", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_processStreamingStatus:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  HMDStreamingStatus *v13;
  HMDStreamingStatus *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateCameraPolicy *v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  HMDAccessoryFirmwareUpdateCameraPolicy *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDAccessoryFirmwareUpdateCameraPolicy *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
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
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v8 = 0x24BDBC000uLL;
    while (2)
    {
      v9 = 0;
      v29 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v10 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {
          v13 = -[HAPTLVBase initWithTLVData:]([HMDStreamingStatus alloc], "initWithTLVData:", v12);
          v14 = v13;
          if (v13 && -[HMDStreamingStatus streamingStatus](v13, "streamingStatus") == 1)
          {

            v23 = 0;
            goto LABEL_20;
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
            v18 = v7;
            v19 = v8;
            v20 = v4;
            v21 = self;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v22;
            v36 = 2112;
            v37 = v10;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid value type: %@", buf, 0x16u);

            self = v21;
            v4 = v20;
            v8 = v19;
            v7 = v18;
            v6 = v29;
          }

          objc_autoreleasePoolPop(v15);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v6)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_20:

  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v27;
    v36 = 2112;
    v37 = v28;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  if ((_DWORD)v23 != -[HMDAccessoryFirmwareUpdatePolicy status](v25, "status"))
  {
    -[HMDAccessoryFirmwareUpdatePolicy setStatus:](v25, "setStatus:", v23);
    -[HMDAccessoryFirmwareUpdatePolicy notify:](v25, "notify:", v23);
  }

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateCameraPolicy *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  HMDAccessoryFirmwareUpdateCameraPolicy *v11;
  HMDAccessoryFirmwareUpdateCameraPolicy *v12;
  BOOL v13;
  void *v14;
  const char *v15;
  HMDAccessoryFirmwareUpdateCameraPolicy *v16;
  uint64_t v18;
  HMDAccessoryFirmwareUpdateCameraPolicy *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraProfileSettingsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v9;
      v10 = "%{public}@Invalid settings, policy status evaluated to NO";
      goto LABEL_13;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "currentAccessMode"))
  {
    if (HMIsRecordingAllowedForCameraAccessMode())
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v9;
        v10 = "%{public}@Recording enabled, policy status evaluated to NO";
LABEL_13:
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v20, 0xCu);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    if (HMIsStreamingAllowedForCameraAccessMode())
    {
      v6 = (void *)MEMORY[0x227676638](-[HMDAccessoryFirmwareUpdateCameraPolicy _checkStreamingStatus](self, "_checkStreamingStatus"));
      v16 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v9;
        v10 = "%{public}@Checking streaming status, policy status temporarily set to NO";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v18 = HMIsMotionDetectionAllowedForCameraAccessMode();
    v6 = (void *)MEMORY[0x227676638](v18);
    v19 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v13 = 1;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v14;
    v15 = "%{public}@Policy status evaluated to YES";
LABEL_18:
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0xCu);

    goto LABEL_15;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v14;
    v15 = "%{public}@Camera access mode is OFF, policy status evaluated to YES";
    goto LABEL_18;
  }
LABEL_15:

  objc_autoreleasePoolPop(v6);
  return v13;
}

void __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;
  void *v35;
  _QWORD block[5];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v33 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v32 = v6;
    if (v6)
    {
      v30 = WeakRetained;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for read of stream status", buf, 0xCu);

      }
      v31 = v5;

      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = *(id *)(a1 + 32);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v13 = v6;
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v17, "characteristic", v30);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0;
            objc_msgSend(v13, "hmd_valueOfCharacteristic:error:", v18, &v38);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v38;

            if (v19)
            {
              objc_msgSend(v35, "addObject:", v19);
            }
            else
            {
              v21 = (void *)MEMORY[0x227676638]();
              v22 = v33;
              HMFGetOSLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "characteristic");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v45 = v24;
                v46 = 2112;
                v47 = v25;
                _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);

                v13 = v32;
              }

              objc_autoreleasePoolPop(v21);
            }

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v14);
      }

      objc_msgSend(v33, "workQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke_14;
      block[3] = &unk_24E79C268;
      block[4] = v33;
      v37 = v35;
      v6 = v13;
      v27 = v35;
      dispatch_async(v26, block);

      WeakRetained = v30;
      v5 = v31;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v45 = v28;
        v46 = 2112;
        v47 = v29;
        v48 = 2112;
        v49 = v5;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v6 = 0;
    }
  }

}

uint64_t __63__HMDAccessoryFirmwareUpdateCameraPolicy__checkStreamingStatus__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processStreamingStatus:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__HMDAccessoryFirmwareUpdateCameraPolicy_handleSettingsChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Settings changed, updating policy status", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "evaluateAndNotify");
}

void __76__HMDAccessoryFirmwareUpdateCameraPolicy_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v16 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      v8 = *MEMORY[0x24BE1B5E8];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 40), "accessory", v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "accessory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = HMFEqualObjects();

          if (v13)
          {
            objc_msgSend(v10, "type");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v8);

            if (v15)
              objc_msgSend(v17, "addObject:", v10);
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v17, "count"))
      objc_msgSend(*(id *)(a1 + 40), "_handleStreamStatusCharacteristicChanges");

    v3 = v16;
  }

}

uint64_t __82__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryUnconfiguredNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is unconfigured, disabling stream status monitoring...", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v7, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v8);

  return objc_msgSend(*(id *)(a1 + 32), "monitorStreamStatus:", 0);
}

uint64_t __80__HMDAccessoryFirmwareUpdateCameraPolicy_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is configured, enabling stream status monitoring...", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel_handleCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v8);

  return objc_msgSend(*(id *)(a1 + 32), "monitorStreamStatus:", 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_26890 != -1)
    dispatch_once(&logCategory__hmf_once_t0_26890, &__block_literal_global_26891);
  return (id)logCategory__hmf_once_v1_26892;
}

void __53__HMDAccessoryFirmwareUpdateCameraPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_26892;
  logCategory__hmf_once_v1_26892 = v0;

}

@end
