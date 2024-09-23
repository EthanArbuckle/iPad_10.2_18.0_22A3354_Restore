@implementation HMDAccessoryFirmwareUpdateProfile

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory Firmware Update Profile %@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)privateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryFirmwareUpdateProfile *v4;
  HMDAccessoryFirmwareUpdateProfile *v5;
  HMDAccessoryFirmwareUpdateProfile *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMDAccessoryFirmwareUpdateProfile *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      -[HMDAccessoryFirmwareUpdateProfile service](self, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateProfile service](v7, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateProfile;
  -[HMDAccessoryFirmwareUpdateProfile dealloc](&v4, sel_dealloc);
}

- (HMDAccessoryFirmwareUpdateProfile)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAccessoryFirmwareUpdateProfile *v11;
  HMDAccessoryFirmwareUpdateProfile *v12;
  uint64_t v13;
  HMFSoftwareVersion *currentVersion;
  HMDAccessoryMatterFirmwareUpdateProfile *v15;
  HMDAccessoryMatterFirmwareUpdateProfile *matterFirmwareUpdateProfile;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateProfile;
  v11 = -[HMDAccessoryFirmwareUpdateProfile init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeWeak((id *)&v12->_service, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    objc_msgSend(v8, "firmwareVersion");
    v13 = objc_claimAutoreleasedReturnValue();
    currentVersion = v12->_currentVersion;
    v12->_currentVersion = (HMFSoftwareVersion *)v13;

    v15 = -[HMDAccessoryMatterFirmwareUpdateProfile initWithAccessory:workQueue:]([HMDAccessoryMatterFirmwareUpdateProfile alloc], "initWithAccessory:workQueue:", v8, v10);
    matterFirmwareUpdateProfile = v12->_matterFirmwareUpdateProfile;
    v12->_matterFirmwareUpdateProfile = v15;

  }
  return v12;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDAccessoryFirmwareUpdateProfile matterFirmwareUpdateProfile](self, "matterFirmwareUpdateProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configure");

  }
  -[HMDAccessoryFirmwareUpdateProfile _registerForNotifications](self, "_registerForNotifications");
  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isReachable"))
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v10[0] = CFSTR("00000234-0000-1000-8000-0026BB765291");
    v10[1] = CFSTR("00000235-0000-1000-8000-0026BB765291");
    v10[2] = CFSTR("00000249-0000-1000-8000-0026BB765291");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "findCharacteristicsByTypes:forServiceType:", v8, CFSTR("00000236-0000-1000-8000-0026BB765291"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile _handleCharacteristicChanges:](self, "_handleCharacteristicChanges:", v9);

  }
}

- (void)monitorCharacteristics:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__HMDAccessoryFirmwareUpdateProfile_monitorCharacteristics___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_enableCharacteristicsNotifications:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDAccessoryFirmwareUpdateProfile characteristics](self, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateProfile firmwareVersionCharacteristic](self, "firmwareVersionCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  v10 = objc_msgSend(v14, "supportsCHIP");
  v11 = v14;
  if (v10)
  {
    -[HMDAccessoryFirmwareUpdateProfile matterFirmwareVersionCharacteristic](self, "matterFirmwareVersionCharacteristic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "addObject:", v12);

    v11 = v14;
  }
  objc_msgSend(v11, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", v3, v8, CFSTR("com.apple.HomeKitDaemon.accessoryfirmwareUpdate"));
  -[HMDAccessoryFirmwareUpdateProfile setNotificationsEnabled:](self, "setNotificationsEnabled:", v3);
  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateProfile characteristics](self, "characteristics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile readAndProcessCharacteristics:withCompletion:](self, "readAndProcessCharacteristics:withCompletion:", v13, &__block_literal_global_36_209359);

  }
}

- (id)readinessCharacteristic
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicType:forServiceType:", CFSTR("00000234-0000-1000-8000-0026BB765291"), CFSTR("00000236-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)firmwareVersionCharacteristic
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD58C0], *MEMORY[0x24BDD6B38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)matterFirmwareVersionCharacteristic
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsCHIP"))
  {
    objc_msgSend(v2, "findCharacteristicType:forServiceType:", *MEMORY[0x24BE1B568], *MEMORY[0x24BDD6B38]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)statusCharacteristic
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicType:forServiceType:", CFSTR("00000235-0000-1000-8000-0026BB765291"), CFSTR("00000236-0000-1000-8000-0026BB765291"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)characteristics
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("00000235-0000-1000-8000-0026BB765291"), CFSTR("00000234-0000-1000-8000-0026BB765291"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findCharacteristicsByTypes:forServiceType:", v3, CFSTR("00000236-0000-1000-8000-0026BB765291"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithStagedFirmwareVersion:(id)a3
{
  NSObject *v4;
  HMDAccessoryFirmwareUpdateProfile *result;
  id v6;

  v6 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateState:](self, "_updateFirmwareUpdateState:", 3);
  -[HMDAccessoryFirmwareUpdateProfile _updateStagedFirmwareVersion:](self, "_updateStagedFirmwareVersion:", v6);

  return result;
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  HMDAccessoryFirmwareUpdateProfile *result;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating accessory firmware update profile", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryFirmwareUpdateProfile characteristics](v7, "characteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16++), (_QWORD)v23);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  -[HMDAccessoryFirmwareUpdateProfile firmwareVersionCharacteristic](v7, "firmwareVersionCharacteristic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v11, "addObject:", v17);
  -[HMDAccessoryFirmwareUpdateProfile accessory](v7, "accessory", (_QWORD)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsCHIP");

  if (v19)
  {
    -[HMDAccessoryFirmwareUpdateProfile matterFirmwareVersionCharacteristic](v7, "matterFirmwareVersionCharacteristic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v11, "addObject:", v20);

  }
  objc_msgSend(v11, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateProfile readAndProcessCharacteristics:withCompletion:](v7, "readAndProcessCharacteristics:withCompletion:", v21, v4);

  return result;
}

- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  HMDAccessoryFirmwareUpdateProfile *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(_QWORD);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v6, "count") == 0;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No characteristics to read and process", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v7[2](v7);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v14;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v31;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

    objc_initWeak((id *)buf, v11);
    -[HMDAccessoryFirmwareUpdateProfile accessory](v11, "accessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(v15, "copy");
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke;
    v26[3] = &unk_24E796558;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v7;
    v24 = v15;
    v27 = v24;
    objc_msgSend(v22, "readCharacteristicValues:source:qualityOfService:withCompletionHandler:", v23, 7, -1, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_updateFirmwareUpdateState:(int64_t)a3
{
  int64_t v5;
  void *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = -[HMDAccessoryFirmwareUpdateProfile updateState](self, "updateState");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateProfile updateState](v7, "updateState");
      HAPFirmwareUpdateStateAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@State not changed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateProfile updateState](v7, "updateState");
      HAPFirmwareUpdateStateAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HAPFirmwareUpdateStateAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating firmware update state from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryFirmwareUpdateProfile setUpdateState:](v7, "setUpdateState:", a3);
    -[HMDAccessoryFirmwareUpdateProfile notificationCenter](v7, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3, CFSTR("HMDAccessoryFirmwareUpdateStateKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryFirmwareUpdateStateChangedNotification"), v7, v17);

  }
}

- (void)_updateFirmwareStagingNotReadyReasons:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDAccessoryFirmwareUpdateProfile stagingNotReadyReasons](self, "stagingNotReadyReasons") == a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateProfile stagingNotReadyReasons](v7, "stagingNotReadyReasons");
      HAPStagingNotReadyReasonsAsString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Staging Not Ready Reasons not changed: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateProfile setStagingNotReadyReasons:](self, "setStagingNotReadyReasons:", a3);
    -[HMDAccessoryFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification"), self, 0);

  }
}

- (void)_updateFirmwareUpdateNotReadyReasons:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDAccessoryFirmwareUpdateProfile updateNotReadyReasons](self, "updateNotReadyReasons") == a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateProfile updateNotReadyReasons](v7, "updateNotReadyReasons");
      HAPUpdateNotReadyReasonsAsString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Update Not Ready Reasons not changed: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateProfile setUpdateNotReadyReasons:](self, "setUpdateNotReadyReasons:", a3);
    -[HMDAccessoryFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification"), self, 0);

  }
}

- (void)_updateAccessoryFirmwareVersion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateProfile *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isGreaterThanVersion:", v7);

  if (v8)
  {
    if (objc_msgSend(v6, "supportsCHIP"))
    {
      v30[0] = CFSTR("kModifiedCharacteristicsKey");
      -[HMDAccessoryFirmwareUpdateProfile matterFirmwareVersionCharacteristic](self, "matterFirmwareVersionCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = CFSTR("HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey");
      v31[0] = v10;
      v31[1] = MEMORY[0x24BDBD1C8];
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v31;
      v13 = v30;
    }
    else
    {
      v27[0] = CFSTR("kModifiedCharacteristicsKey");
      -[HMDAccessoryFirmwareUpdateProfile firmwareVersionCharacteristic](self, "firmwareVersionCharacteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = CFSTR("HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey");
      v28[0] = v10;
      v28[1] = MEMORY[0x24BDBD1C8];
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v28;
      v13 = v27;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firmwareVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory version=%@ is different than fetched version=%@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    logAndPostNotification(CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v6, v14);

  }
}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateProfile *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);

    -[HMDAccessoryFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v3);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not registering for notifications as accessory is nil", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryFirmwareUpdateProfile *v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryIsReachable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDAccessoryFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)__handleAccessoryIsReachable
{
  NSObject *v3;

  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryFirmwareUpdateProfile notificationsEnabled](self, "notificationsEnabled"))
    -[HMDAccessoryFirmwareUpdateProfile _enableCharacteristicsNotifications:](self, "_enableCharacteristicsNotifications:", 1);
}

- (void)_handleCharacteristicChanges:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  HMDAccessoryFirmwareUpdateProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    v34 = *MEMORY[0x24BDD58C0];
    v33 = *MEMORY[0x24BE1B568];
    *(_QWORD *)&v9 = 138543362;
    v31 = v9;
    v32 = v6;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v13, "type", v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("00000235-0000-1000-8000-0026BB765291"));

        if (v15)
        {
          -[HMDAccessoryFirmwareUpdateProfile __handleFirmwareUpdateStatusUpdate:](self, "__handleFirmwareUpdateStatusUpdate:", v13);
          continue;
        }
        objc_msgSend(v13, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("00000234-0000-1000-8000-0026BB765291"));

        if (v17)
        {
          -[HMDAccessoryFirmwareUpdateProfile __handleFirmwareUpdateReadinessUpdate:](self, "__handleFirmwareUpdateReadinessUpdate:", v13);
          continue;
        }
        objc_msgSend(v13, "type");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("00000249-0000-1000-8000-0026BB765291"));

        if (v19)
        {
          -[HMDAccessoryFirmwareUpdateProfile __handleStagedFirmwareVersionUpdate:](self, "__handleStagedFirmwareVersionUpdate:", v13);
          continue;
        }
        objc_msgSend(v13, "type");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v34);

        if (v21)
        {
          v22 = (void *)MEMORY[0x227676638]();
          v23 = self;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v31;
            v40 = v25;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Firmware Update Profile _handleCharacteristicChanges: characteristic update for HMCharacteristicTypeFirmwareVersion", buf, 0xCu);

            v6 = v32;
          }

          objc_autoreleasePoolPop(v22);
          if (objc_msgSend(v6, "supportsHAP"))
            goto LABEL_21;
        }
        else
        {
          objc_msgSend(v13, "type");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", v33);

          if (v27)
          {
            v28 = (void *)MEMORY[0x227676638]();
            v23 = self;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v40 = v30;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Firmware Update Profile _handleCharacteristicChanges: characteristic update for HAPCharacteristicUUID_MatterFirmwareRevisionNumber", buf, 0xCu);

              v6 = v32;
            }

            objc_autoreleasePoolPop(v28);
            if (objc_msgSend(v6, "supportsCHIP"))
            {
LABEL_21:
              -[HMDAccessoryFirmwareUpdateProfile __handleFirmwareVersionUpdate:](v23, "__handleFirmwareVersionUpdate:", v13);
              continue;
            }
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v10);
  }

}

- (void)__handleFirmwareUpdateStatusUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDAccessoryFirmwareUpdateProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v28 = 0;
  objc_msgSend(MEMORY[0x24BE1BAE8], "parsedFromData:error:", v8, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v30 = v14;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse firmware update status (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_15:
    }
LABEL_16:

    objc_autoreleasePoolPop(v11);
    goto LABEL_17;
  }
  objc_msgSend(v9, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v14;
    v19 = "%{public}@Missing update state in Firmware Update Status TLV";
    v20 = v13;
    v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  objc_msgSend(v9, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "value") == 3)
  {
    objc_msgSend(v9, "stagedFirmwareVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      v19 = "%{public}@Dropping Firmware Staging Status Success without a Staged Firmware Version";
      v20 = v13;
      v21 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_2218F0000, v20, v21, v19, buf, 0xCu);
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v9, "state");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateState:](self, "_updateFirmwareUpdateState:", objc_msgSend(v23, "value"));

  }
  objc_msgSend(v9, "updateDuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v9, "updateDuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateDuration:](self, "_updateFirmwareUpdateDuration:", objc_msgSend(v26, "unsignedIntegerValue"));
  }
  objc_msgSend(v9, "stagedFirmwareVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateProfile _updateStagedFirmwareVersion:](self, "_updateStagedFirmwareVersion:", v27);

LABEL_17:
}

- (void)__handleFirmwareUpdateReadinessUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDAccessoryFirmwareUpdateProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v18 = 0;
  objc_msgSend(MEMORY[0x24BE1BAE0], "parsedFromData:error:", v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v20 = v14;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse firmware update readiness (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    objc_msgSend(v9, "stagingNotReadyReasons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareStagingNotReadyReasons:](self, "_updateFirmwareStagingNotReadyReasons:", objc_msgSend(v16, "value"));

    objc_msgSend(v9, "updateNotReadyReasons");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateNotReadyReasons:](self, "_updateFirmwareUpdateNotReadyReasons:", objc_msgSend(v17, "value"));

  }
}

- (void)__handleStagedFirmwareVersionUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDAccessoryFirmwareUpdateProfile _updateStagedFirmwareVersion:](self, "_updateStagedFirmwareVersion:", v8);
}

- (void)_updateStagedFirmwareVersion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  HMDAccessoryFirmwareUpdateProfile *v12;
  NSObject *v13;
  void *v14;
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
  v5 = a3;
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F270]), "initWithVersionString:", v5);
  else
    v6 = 0;
  -[HMDAccessoryFirmwareUpdateProfile stagedFirmwareVersion](self, "stagedFirmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[HMDAccessoryFirmwareUpdateProfile stagedFirmwareVersion](self, "stagedFirmwareVersion"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "isEqualToVersion:", v6) & 1) != 0))
  {
    -[HMDAccessoryFirmwareUpdateProfile stagedFirmwareVersion](self, "stagedFirmwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = v6 == 0;
    v10 = !v9;

    if (v7)
    {

      if ((v10 & 1) == 0)
        goto LABEL_20;
    }
    else if (!v10)
    {
      goto LABEL_20;
    }
  }
  else
  {

  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateProfile stagedFirmwareVersion](v12, "stagedFirmwareVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@StagedFirmwareVersion changed from %@ to %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAccessoryFirmwareUpdateProfile setStagedFirmwareVersion:](v12, "setStagedFirmwareVersion:", v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("HMDAccessoryStagedFirmwareVersionChangedNotification"), v12);

LABEL_20:
}

- (void)__handleFirmwareVersionUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateProfile *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F270]), "initWithVersionString:", v8);
    -[HMDAccessoryFirmwareUpdateProfile setCurrentVersion:](self, "setCurrentVersion:", v9);

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
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Update fetched firmware version not available for accessory %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (unint64_t)updateDuration
{
  return self->_updateDuration;
}

- (void)setUpdateDuration:(unint64_t)a3
{
  self->_updateDuration = a3;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (unint64_t)stagingNotReadyReasons
{
  return self->_stagingNotReadyReasons;
}

- (void)setStagingNotReadyReasons:(unint64_t)a3
{
  self->_stagingNotReadyReasons = a3;
}

- (unint64_t)updateNotReadyReasons
{
  return self->_updateNotReadyReasons;
}

- (void)setUpdateNotReadyReasons:(unint64_t)a3
{
  self->_updateNotReadyReasons = a3;
}

- (HMFSoftwareVersion)stagedFirmwareVersion
{
  return self->_stagedFirmwareVersion;
}

- (void)setStagedFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, a3);
}

- (HMFSoftwareVersion)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentVersion, a3);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDService)service
{
  return (HMDService *)objc_loadWeakRetained((id *)&self->_service);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (HMDAccessoryMatterFirmwareUpdateProfile)matterFirmwareUpdateProfile
{
  return self->_matterFirmwareUpdateProfile;
}

- (void)setMatterFirmwareUpdateProfile:(id)a3
{
  objc_storeStrong((id *)&self->_matterFirmwareUpdateProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterFirmwareUpdateProfile, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
}

uint64_t __64__HMDAccessoryFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is now reachable", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

void __71__HMDAccessoryFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_BOOLForKey:", CFSTR("HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey"));

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Already handled updated accessory firmware version", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
            objc_msgSend(*(id *)(a1 + 40), "accessory");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "accessory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = HMFEqualObjects();

            if (v19)
              objc_msgSend(v10, "addObject:", v16);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v13);
      }

      objc_msgSend(*(id *)(a1 + 40), "_handleCharacteristicChanges:", v10);
      v9 = v20;
    }

  }
}

void __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  id obj;
  _QWORD block[5];
  id v36;
  _BYTE *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint8_t v47[128];
  _BYTE v48[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v32 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v33 = WeakRetained;
    if (v5)
    {
      *(_QWORD *)v48 = 0;
      *(_QWORD *)&v48[8] = v48;
      *(_QWORD *)&v48[16] = 0x3032000000;
      v49 = __Block_byref_object_copy__209352;
      v50 = __Block_byref_object_dispose__209353;
      v31 = a1;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = *(id *)(a1 + 32);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v40 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v11, "characteristic");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0;
            objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v12, &v38);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v38;

            if (v13)
            {
              v15 = *(void **)(*(_QWORD *)&v48[8] + 40);
              objc_msgSend(v11, "characteristic");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v16);

            }
            else
            {
              v17 = (void *)MEMORY[0x227676638]();
              v18 = v33;
              HMFGetOSLogHandle();
              v19 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v20 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "characteristic");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v44 = v20;
                v45 = 2112;
                v46 = v21;
                _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v17);
            }

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v8);
      }

      objc_msgSend(v33, "workQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_39;
      block[3] = &unk_24E792600;
      block[4] = v33;
      v37 = v48;
      v36 = *(id *)(v31 + 40);
      dispatch_async(v22, block);

      _Block_object_dispose(v48, 8);
    }
    else
    {
      v25 = a1;
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v7;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(v25 + 32);
        *(_DWORD *)v48 = 138543874;
        *(_QWORD *)&v48[4] = v29;
        *(_WORD *)&v48[12] = 2112;
        *(_QWORD *)&v48[14] = v30;
        *(_WORD *)&v48[22] = 2112;
        v49 = v32;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", v48, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      (*(void (**)(void))(*(_QWORD *)(v25 + 40) + 16))();
    }
    v7 = v33;
  }
  else
  {
    v23 = _Block_copy(*(const void **)(a1 + 40));
    v24 = v23;
    if (v23)
      (*((void (**)(void *))v23 + 2))(v23);

  }
}

uint64_t __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_39(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "copy");
  objc_msgSend(v2, "_handleCharacteristicChanges:", v3);

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __60__HMDAccessoryFirmwareUpdateProfile_monitorCharacteristics___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t result;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Monitoring characteristics set to %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "notificationsEnabled");
  v8 = *(unsigned __int8 *)(a1 + 40);
  if (v8 != (_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_enableCharacteristicsNotifications:", v8 != 0);
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_209379 != -1)
    dispatch_once(&logCategory__hmf_once_t1_209379, &__block_literal_global_209380);
  return (id)logCategory__hmf_once_v2_209381;
}

void __48__HMDAccessoryFirmwareUpdateProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_209381;
  logCategory__hmf_once_v2_209381 = v0;

}

@end
