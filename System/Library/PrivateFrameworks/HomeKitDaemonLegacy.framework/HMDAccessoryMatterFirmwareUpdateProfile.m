@implementation HMDAccessoryMatterFirmwareUpdateProfile

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Matter Firmware Update Profile %@, %@"), v4, v5);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryMatterFirmwareUpdateProfile;
  -[HMDAccessoryMatterFirmwareUpdateProfile dealloc](&v4, sel_dealloc);
}

- (HMDAccessoryMatterFirmwareUpdateProfile)initWithAccessory:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryMatterFirmwareUpdateProfile *v8;
  HMDAccessoryMatterFirmwareUpdateProfile *v9;
  NSNumber *matterFirmwareRevisionNumber;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryMatterFirmwareUpdateProfile;
  v8 = -[HMDAccessoryMatterFirmwareUpdateProfile init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
    matterFirmwareRevisionNumber = v9->_matterFirmwareRevisionNumber;
    v9->_matterFirmwareRevisionNumber = 0;

  }
  return v9;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (void)setMatterFirmwareRevisionNumber:(id)a3
{
  id v5;
  void *v6;
  id *p_matterFirmwareRevisionNumber;
  void *v8;
  HMDAccessoryMatterFirmwareUpdateProfile *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryMatterFirmwareUpdateProfile *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    p_matterFirmwareRevisionNumber = (id *)&self->_matterFirmwareRevisionNumber;
    if (!self->_matterFirmwareRevisionNumber || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *p_matterFirmwareRevisionNumber;
        v19 = 138543874;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Matter firmware revision number from %@ to %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_storeStrong(p_matterFirmwareRevisionNumber, a3);
      -[HMDAccessoryMatterFirmwareUpdateProfile notificationCenter](v9, "notificationCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryMatterFirmwareUpdateProfile accessory](v9, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"), v14, 0);

    }
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
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not setting matter firmware revision number to nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)configureWithMatterSoftwareUpdateProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_matterSoftwareUpdateProviderDelegate, a3);
}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryMatterFirmwareUpdateProfile *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  HMDAccessoryMatterFirmwareUpdateProfile *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryMatterFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);

    -[HMDAccessoryMatterFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v3);

    -[HMDAccessoryMatterFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleVIDPIDUpdatedNotification_, CFSTR("HMDAccessoryVendorIDProductIDUpdatedNotification"), v3);

    -[HMDAccessoryMatterFirmwareUpdateProfile notificationCenter](self, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleDisplayableFirmwareVersionUpdatedNotification_, CFSTR("HMDAccessoryFirmwareDisplayableVersionUpdatedNotification"), v3);

    v8 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryMatterFirmwareUpdateProfile _enableCharacteristicsNotifications:](self, "_enableCharacteristicsNotifications:", 1));
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Registered for Matter firmware update notifications";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@Not registering for notifications as accessory is nil";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v8);
}

- (void)_enableCharacteristicsNotifications:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryMatterFirmwareUpdateProfile characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v6, CFSTR("com.apple.HomeKitDaemon.accessoryMatterFirmwareUpdate"));

  if (v3)
  {
    -[HMDAccessoryMatterFirmwareUpdateProfile characteristics](self, "characteristics");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryMatterFirmwareUpdateProfile readAndProcessCharacteristics:withCompletion:](self, "readAndProcessCharacteristics:withCompletion:", v7, &__block_literal_global_29_133079);

  }
}

- (void)handleAccessoryIsReachable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryMatterFirmwareUpdateProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessoryMatterFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleVIDPIDUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryMatterFirmwareUpdateProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryMatterFirmwareUpdateProfile_handleVIDPIDUpdatedNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleDisplayableFirmwareVersionUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryMatterFirmwareUpdateProfile workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__HMDAccessoryMatterFirmwareUpdateProfile_handleDisplayableFirmwareVersionUpdatedNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)__handleAccessoryIsReachable
{
  -[HMDAccessoryMatterFirmwareUpdateProfile _enableCharacteristicsNotifications:](self, "_enableCharacteristicsNotifications:", 1);
}

- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
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
  id v23;
  void *v24;
  HMDAccessoryMatterFirmwareUpdateProfile *val;
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

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "supportsCHIP"))
  {
    v10 = objc_msgSend(v6, "count") == 0;
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    val = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No characteristics to read and process", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
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
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
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
            +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19), val);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v17);
      }

      objc_initWeak((id *)buf, val);
      objc_msgSend(v9, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v15, "copy");
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke;
      v26[3] = &unk_1E89BCDD0;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v7;
      v23 = v15;
      v27 = v23;
      objc_msgSend(v21, "readCharacteristicValues:source:qualityOfService:withCompletionHandler:", v22, 7, -1, v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (void)readMatterFirmwareUpdateCharacteristics
{
  id v3;

  -[HMDAccessoryMatterFirmwareUpdateProfile characteristics](self, "characteristics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryMatterFirmwareUpdateProfile readAndProcessCharacteristics:withCompletion:](self, "readAndProcessCharacteristics:withCompletion:", v3, &__block_literal_global_34_133064);

}

- (id)characteristics
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryMatterFirmwareUpdateProfile *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryMatterFirmwareUpdateProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("0000026D-0000-1000-8000-0026BB765291"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("0000026E-0000-1000-8000-0026BB765291"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findCharacteristicsByTypes:forServiceType:", v6, CFSTR("00000236-0000-1000-8000-0026BB765291"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    objc_msgSend(v3, "findCharacteristicsByTypes:forServiceType:", v5, CFSTR("0000003E-0000-1000-8000-0026BB765291"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

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
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v4 = 0;
  }

  return v4;
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryMatterFirmwareUpdateProfile *v9;

  v4 = a3;
  -[HMDAccessoryMatterFirmwareUpdateProfile workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__HMDAccessoryMatterFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleCharacteristicChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("0000026D-0000-1000-8000-0026BB765291"));

        if (v11)
        {
          -[HMDAccessoryMatterFirmwareUpdateProfile __handleMatterFirmwareRevisionNumberUpdate:](self, "__handleMatterFirmwareRevisionNumberUpdate:", v9);
        }
        else
        {
          objc_msgSend(v9, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("0000026E-0000-1000-8000-0026BB765291"));

          if (v13)
            -[HMDAccessoryMatterFirmwareUpdateProfile __handleMatterFirmwareUpdateStatusUpdate:](self, "__handleMatterFirmwareUpdateStatusUpdate:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_processIdleStateWithCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDAccessoryMatterFirmwareUpdateProfile *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryMatterFirmwareUpdateProfile *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDAccessoryMatterFirmwareUpdateProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDAccessoryMatterFirmwareUpdateProfile *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  HMDAccessoryMatterFirmwareUpdateProfile *v41;
  NSObject *v42;
  void *v43;
  HMDAccessoryMatterFirmwareUpdateProfile *v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  HMDAccessoryMatterFirmwareUpdateProfile *v48;
  void *v49;
  HMDAccessoryMatterFirmwareUpdateProfile *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  HMDAccessoryMatterFirmwareUpdateProfile *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMDAccessoryMatterFirmwareUpdateProfile *v58;
  NSObject *v59;
  void *v60;
  void *contexta;
  void *context;
  void *contextb;
  void *contextc;
  void *v65;
  void *v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "previousValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v67 = 0;
    objc_msgSend(MEMORY[0x1E0D16520], "parsedFromData:error:", v7, &v67);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v67;
    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        objc_autoreleasePoolPop(v10);
LABEL_10:

        goto LABEL_14;
      }
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previousValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v69 = v13;
      v70 = 2112;
      v71 = v4;
      v72 = 2112;
      v73 = v14;
      v74 = 2112;
      v75 = v7;
      v76 = 2112;
      v77 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse matter firmware update status previous value (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_8:
      goto LABEL_9;
    }
    objc_msgSend(v8, "OTAProviderState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Missing OTA Provider state previous value in Matter Firmware Update Status TLV", buf, 0xCu);
      goto LABEL_8;
    }
    objc_msgSend(v8, "OTAProviderState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "value");

    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HAPOTAProviderStateAsString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v25;
      v70 = 2112;
      v71 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update state previous value : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    if (v21 == 1 || v21 == 6)
      goto LABEL_10;
    -[HMDAccessoryMatterFirmwareUpdateProfile accessory](v23, "accessory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = v23;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v43;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil. Cannot process initial state from accessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      goto LABEL_46;
    }
    objc_msgSend(v27, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "homeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accessoryFirmwareUpdateManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "isCurrentDevicePrimaryResident")
      && objc_msgSend(v29, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
    {
      objc_msgSend(v31, "sessionForAccessory:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v31;
      if (!v32)
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = v23;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          contexta = v33;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v69 = v36;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@No active firmware update session, attempting to create one", buf, 0xCu);

          v33 = contexta;
        }

        objc_autoreleasePoolPop(v33);
        v31 = v65;
        objc_msgSend(v65, "registerAndCreateSessionForAccessory:updateUARPParameters:", v28, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v57 = (void *)MEMORY[0x1D17BA0A0]();
          v58 = v34;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v60;
            _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to register and create a firmware update session", buf, 0xCu);

            v31 = v65;
          }

          objc_autoreleasePoolPop(v57);
          goto LABEL_45;
        }
      }
      if (objc_msgSend(v32, "isMatterFirmwareUpdateRetryAllowed"))
      {
        -[HMDAccessoryMatterFirmwareUpdateProfile matterSoftwareUpdateProviderDelegate](v23, "matterSoftwareUpdateProviderDelegate");
        v37 = objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          v53 = (void *)MEMORY[0x1D17BA0A0]();
          v54 = v23;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            contextc = v53;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v56;
            _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v53 = contextc;
          }

          objc_autoreleasePoolPop(v53);
          v31 = v65;
          goto LABEL_45;
        }
        v38 = (void *)v37;
        objc_msgSend(v32, "incrementMatterFirmwareUpdateRetryCount");
        objc_msgSend(v38, "notifyUpdateRequestedForHMDHAPAccessory:isUserTriggered:", v28, 0);

      }
      else
      {
        v49 = (void *)MEMORY[0x1D17BA0A0]();
        v50 = v23;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          contextb = v49;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v69 = v52;
          _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Maximum matter firmware update retries reached", buf, 0xCu);

          v49 = contextb;
        }

        objc_autoreleasePoolPop(v49);
        v31 = v65;
      }
LABEL_44:

LABEL_45:
LABEL_46:

      goto LABEL_10;
    }
    objc_msgSend(v28, "softwareUpdate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v39;
    if (v39)
    {
      if (objc_msgSend(v39, "state"))
      {
        objc_msgSend(v32, "updateLocalState:", 0);
        goto LABEL_44;
      }
      v66 = v31;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v48 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v46;
        v47 = "%{public}@Software update state is available, no action needed";
        goto LABEL_42;
      }
    }
    else
    {
      v66 = v31;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v44 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v69 = v46;
        v47 = "%{public}@Software update object is nil. Cannot process idle state from accessory";
LABEL_42:
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, v47, buf, 0xCu);

      }
    }
    v31 = v66;

    objc_autoreleasePoolPop(context);
    goto LABEL_44;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Not processing idle state as previous value is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
LABEL_14:

}

- (void)__handleMatterFirmwareRevisionNumberUpdate:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryMatterFirmwareUpdateProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update for %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[HMDAccessoryMatterFirmwareUpdateProfile setMatterFirmwareRevisionNumber:](v6, "setMatterFirmwareRevisionNumber:", v11);
}

- (void)__handleMatterFirmwareUpdateStatusUpdate:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryMatterFirmwareUpdateProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDAccessoryMatterFirmwareUpdateProfile *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMDAccessoryMatterFirmwareUpdateProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMDAccessoryMatterFirmwareUpdateProfile *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDAccessoryMatterFirmwareUpdateProfile *v37;
  NSObject *v38;
  void *v39;
  HMDAccessoryMatterFirmwareUpdateProfile *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  HMDAccessoryMatterFirmwareUpdateProfile *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  HMDAccessoryMatterFirmwareUpdateProfile *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
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
    v66 = v8;
    v67 = 2112;
    v68 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v64 = 0;
  objc_msgSend(MEMORY[0x1E0D16520], "parsedFromData:error:", v11, &v64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v64;
  if (!v13)
  {
    objc_msgSend(v12, "OTAProviderState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v6;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing OTA Provider state in Matter Firmware Update Status TLV", buf, 0xCu);
      goto LABEL_9;
    }
    objc_msgSend(v12, "OTAProviderState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "value");

    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v6;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HAPOTAProviderStateAsString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v25;
      v67 = 2112;
      v68 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update state : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDAccessoryMatterFirmwareUpdateProfile accessory](v23, "accessory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v23;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v35;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil. Cannot handle matter firmware update status characteristic value change", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      goto LABEL_51;
    }
    -[HMDAccessoryMatterFirmwareUpdateProfile matterSoftwareUpdateProviderDelegate](v23, "matterSoftwareUpdateProviderDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "softwareUpdate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v23;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = v28;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v39;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Software update object is nil. Cannot update HMDSoftwareUpdate", buf, 0xCu);

        v28 = v56;
      }

      objc_autoreleasePoolPop(v36);
      v29 = 0;
      if (v21 == 6 && v28)
        objc_msgSend(v28, "resetOTAProviderStateForHMDHAPAccessory:", v27);
      goto LABEL_50;
    }
    objc_msgSend(v27, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isCurrentDevicePrimaryResident"))
    {
      if (v21 == 6)
      {
        v31 = objc_msgSend(v29, "updateLocalState:", 4);
        if (v28)
        {
          objc_msgSend(v28, "resetOTAProviderStateForHMDHAPAccessory:", v27);
          objc_msgSend(v29, "updateLocalState:", 4);
LABEL_45:
          objc_msgSend(v28, "resetOTAProviderStateForHMDHAPAccessory:", v27);
        }
        else
        {
          v59 = v30;
          v62 = v29;
          v45 = (void *)MEMORY[0x1D17BA0A0](v31);
          v46 = v23;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v66 = v48;
            _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v28 = 0;
          }

          objc_autoreleasePoolPop(v45);
          v29 = v62;
          v49 = objc_msgSend(v62, "updateLocalState:", 4);
          v30 = v59;
LABEL_46:
          v60 = v30;
          v63 = v29;
          v50 = (void *)MEMORY[0x1D17BA0A0](v49);
          v51 = v23;
          HMFGetOSLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = v28;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v66 = v54;
            _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v28 = v53;
          }

          objc_autoreleasePoolPop(v50);
          v30 = v60;
          v29 = v63;
        }
LABEL_49:

LABEL_50:
LABEL_51:

        goto LABEL_52;
      }
      v58 = v30;
      v61 = v29;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v40 = v23;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v57 = v28;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v66 = v42;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Not updating software update model states on primary resident", buf, 0xCu);

        v28 = v57;
      }

      objc_autoreleasePoolPop(context);
      v30 = v58;
      v29 = v61;
    }
    switch(v21)
    {
      case 0:
        if (objc_msgSend(v30, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
          goto LABEL_35;
        goto LABEL_36;
      case 1:
        -[HMDAccessoryMatterFirmwareUpdateProfile _processIdleStateWithCharacteristic:](v23, "_processIdleStateWithCharacteristic:", v4);
        goto LABEL_49;
      case 2:
LABEL_35:
        v43 = v29;
        v44 = 2;
        goto LABEL_43;
      case 3:
LABEL_36:
        v43 = v29;
        v44 = 5;
        goto LABEL_43;
      case 4:
        v43 = v29;
        v44 = 1;
        goto LABEL_43;
      case 5:
        v43 = v29;
        v44 = 3;
LABEL_43:
        objc_msgSend(v43, "updateLocalState:", v44);
        break;
      case 6:
        v49 = objc_msgSend(v29, "updateLocalState:", 4);
        if (v28)
          goto LABEL_45;
        goto LABEL_46;
      default:
        goto LABEL_49;
    }
    goto LABEL_49;
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v6;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v66 = v17;
    v67 = 2112;
    v68 = v4;
    v69 = 2112;
    v70 = v18;
    v71 = 2112;
    v72 = v11;
    v73 = 2112;
    v74 = v13;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse matter firmware update status (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_9:
  }
LABEL_10:

  objc_autoreleasePoolPop(v14);
LABEL_52:

}

- (NSNumber)matterFirmwareRevisionNumber
{
  return self->_matterFirmwareRevisionNumber;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDMatterSoftwareUpdateProviderDelegate)matterSoftwareUpdateProviderDelegate
{
  return (HMDMatterSoftwareUpdateProviderDelegate *)objc_loadWeakRetained((id *)&self->_matterSoftwareUpdateProviderDelegate);
}

- (void)setMatterSoftwareUpdateProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_matterSoftwareUpdateProviderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_matterSoftwareUpdateProviderDelegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_matterFirmwareRevisionNumber, 0);
}

void __77__HMDAccessoryMatterFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 40), "accessory");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "accessory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = HMFEqualObjects();

          if (v13)
            objc_msgSend(v4, "addObject:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleCharacteristicChanges:", v4);
    v3 = v14;
  }

}

void __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v52 = *MEMORY[0x1E0C80C00];
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
      v49 = __Block_byref_object_copy__133069;
      v50 = __Block_byref_object_dispose__133070;
      v31 = a1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
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
              v17 = (void *)MEMORY[0x1D17BA0A0]();
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
                _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);

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
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_32;
      block[3] = &unk_1E89BD0A0;
      block[4] = v33;
      v37 = v48;
      v36 = *(id *)(v31 + 40);
      dispatch_async(v22, block);

      _Block_object_dispose(v48, 8);
    }
    else
    {
      v25 = a1;
      v26 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", v48, 0x20u);

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

uint64_t __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_32(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Read succeeded for %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
  objc_msgSend(v7, "_handleCharacteristicChanges:", v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __95__HMDAccessoryMatterFirmwareUpdateProfile_handleDisplayableFirmwareVersionUpdatedNotification___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Matter firmware version string updated", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

uint64_t __75__HMDAccessoryMatterFirmwareUpdateProfile_handleVIDPIDUpdatedNotification___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@VID/PID updated", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

void __70__HMDAccessoryMatterFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke(uint64_t a1)
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
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is now reachable", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryFirmwareUpdateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "registerAndCreateSessionForAccessory:updateUARPParameters:", v7, 1);

    objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_133100 != -1)
    dispatch_once(&logCategory__hmf_once_t0_133100, &__block_literal_global_133101);
  return (id)logCategory__hmf_once_v1_133102;
}

void __54__HMDAccessoryMatterFirmwareUpdateProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_133102;
  logCategory__hmf_once_v1_133102 = v0;

}

@end
