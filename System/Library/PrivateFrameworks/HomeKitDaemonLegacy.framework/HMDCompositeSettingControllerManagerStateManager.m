@implementation HMDCompositeSettingControllerManagerStateManager

- (HMDCompositeSettingControllerManagerStateManager)initWithDataSource:(id)a3 notificationRegistrationProvider:(id)a4 subscribeWithOptions:(unint64_t)a5 delegate:(id)a6 uuid:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMDCompositeSettingControllerManagerStateManager *v16;
  HMDCompositeSettingControllerManagerStateManager *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *homeUUIDToState;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDCompositeSettingControllerManagerStateManager;
  v16 = -[HMDCompositeSettingControllerManagerStateManager init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v17->_notificationRegistrationProvider, a4);
    v17->_notificationOptions = a5;
    objc_storeStrong((id *)&v17->_uuid, a7);
    v17->_lock._os_unfair_lock_opaque = 0;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    homeUUIDToState = v17->_homeUUIDToState;
    v17->_homeUUIDToState = v18;

    objc_storeWeak((id *)&v17->_dataSource, v12);
    -[HMDCompositeSettingControllerManagerStateManager _unregisterForNotifications](v17, "_unregisterForNotifications");
    -[HMDCompositeSettingControllerManagerStateManager _registerForNotifications](v17, "_registerForNotifications");
  }

  return v17;
}

- (void)_registerForNotifications
{
  void *v3;
  HMDCompositeSettingControllerManagerStateManager *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDCompositeSettingControllerManagerStateManager notificationOptions](v4, "notificationOptions");
    v8 = CFSTR("HMDCompositeSettingControllerRunStateResidentNotification");
    switch(v7)
    {
      case 1:
        break;
      case 2:
        v8 = CFSTR("HMDCompositeSettingControllerRunStateHomeNotification");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        v8 = CFSTR("HMDCompositeSettingControllerRunStateSidekickNotification");
        break;
      case 8:
        v8 = CFSTR("HMDCompositeSettingControllerRunStateAccessoryNotification");
        break;
      default:
        if (v7 == 15)
          v8 = CFSTR("HMDCompositeSettingControllerRunStateAllNotification");
        else
LABEL_6:
          v8 = CFSTR("HMDCompositeSettingControllerRunStateUnkownNotification");
        break;
    }
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Register for notification with option: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if ((-[HMDCompositeSettingControllerManagerStateManager notificationOptions](v4, "notificationOptions") & 1) != 0)
  {
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleResidentDeviceUpdated_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);
  }
  if ((-[HMDCompositeSettingControllerManagerStateManager notificationOptions](v4, "notificationOptions") & 2) != 0)
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleHomeAdded_, CFSTR("HMDHomeAddedNotification"), 0);
  if ((-[HMDCompositeSettingControllerManagerStateManager notificationOptions](v4, "notificationOptions") & 4) != 0)
  {
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleSiriEndpointProfileCreation_, CFSTR("HMDSiriEndpointProfileAddedNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleSiriEndpointProfileSettingsUpdate_, CFSTR("HMDSiriEndpointProfileSettingsUpdatedNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleCompositeSettingsControllerConfiguredNotification_, CFSTR("HMDCompositeSettingsControllerDidConfigureNotification"), 0);
  }
  if ((-[HMDCompositeSettingControllerManagerStateManager notificationOptions](v4, "notificationOptions") & 8) != 0)
  {
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleAccessoryLanguagesChangedNotification_, CFSTR("HMDAppleMediaAccessoryLanguagesChangedNotification"), 0);
    -[HMDCompositeSettingNotificationRegistrationProviding addObserver:selector:name:object:](v4->_notificationRegistrationProvider, "addObserver:selector:name:object:", v4, sel__handleAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);
  }
}

- (void)_unregisterForNotifications
{
  id v3;

  -[HMDCompositeSettingControllerManagerStateManager notificationRegistrationProvider](self, "notificationRegistrationProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_createStateForHomeUUIDIfNotExist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCompositeSettingControllerManagerStateManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_homeUUIDToState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = CFSTR("HMDCompositeSettingControllerManagerRunStateRegular");
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing state for home %@ as %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_homeUUIDToState, "setObject:forKeyedSubscript:", &unk_1E8B340E0, v4);
  }

}

- (void)_handleCompositeSettingsControllerConfiguredNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
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
  HMDCompositeSettingControllerManagerStateManager *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Did handle CompositeSettingsControllerDidConfigure notification", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDHomeUUIDOwnerUUIDKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "hmf_UUIDForKey:", CFSTR("HMDCompositeSettingControllerHomeUUIDNotificationKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_UUIDForKey:", CFSTR("HMDCompositeSettingControllerOwnerUUIDNotificationKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v13)
  {
    -[HMDCompositeSettingControllerManagerStateManager delegate](v6, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "didConfigureCompositeSettingsControllerForHomeUUID:accessoryUUID:", v13, v14);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v19;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil hapAccessoryUUID:%@ or homeUUID:%@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_handleHomeAdded:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@received notification:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMDCompositeSettingControllerManagerStateManager dataSource](v6, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HMDCompositeSettingControllerManagerStateManager__handleHomeAdded___block_invoke;
  v11[3] = &unk_1E89B68B8;
  v11[4] = v6;
  objc_msgSend(v10, "na_each:", v11);

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)_handleSiriEndpointProfileSettingsUpdate:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCompositeSettingControllerManagerStateManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@received notification:%@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        objc_msgSend(v12, "uuid"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v20;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil home:%@ or accessory:%@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }
  -[HMDCompositeSettingControllerManagerStateManager delegate](v6, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "didUpdateSiriEndpointSettingForHomeUUID:accessoryUUID:", v22, v23);

  }
}

- (void)_handleSiriEndpointProfileCreation:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMDCompositeSettingControllerManagerStateManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCompositeSettingControllerManagerStateManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
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
    v21 = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling HMDSiriEndpointProfileAddedNotification:%@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDCompositeSettingControllerManagerStateManager _computeResidentStateChangeForHome:](v6, "_computeResidentStateChangeForHome:", v12);
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@HomeUUID or home are null, will not update state after siri endpoint profile creation", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = 0;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAPAccessory", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)_handleResidentDeviceUpdated:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDCompositeSettingControllerManagerStateManager *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification for resident update: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey");
  else
    v12 = CFSTR("HMDResidentDeviceResidentNotificationKey");
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "home");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v15)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v21;
      v22 = "%{public}@Couldn't find resident, will not process resident update";
LABEL_16:
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 0xCu);

    }
LABEL_17:

    objc_autoreleasePoolPop(v18);
    goto LABEL_18;
  }
  if (!v16)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v21;
      v22 = "%{public}@Couldn't find home to work with, will not process resident update";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  -[HMDCompositeSettingControllerManagerStateManager _computeResidentStateChangeForHome:](v6, "_computeResidentStateChangeForHome:", v16);
LABEL_18:

}

- (void)_computeResidentStateChangeForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  HMDCompositeSettingControllerManagerStateManager *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  HMDCompositeSettingControllerManagerStateManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCurrentDeviceAvailableResident") & 1) != 0)
  {
    os_unfair_lock_lock_with_options();
    -[HMDCompositeSettingControllerManagerStateManager _createStateForHomeUUIDIfNotExist:](self, "_createStateForHomeUUIDIfNotExist:", v5);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_homeUUIDToState, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    v8 = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");
    if (v8)
      v9 = 3;
    else
      v9 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_homeUUIDToState, "setObject:forKeyedSubscript:", v10, v5);

    os_unfair_lock_unlock(&self->_lock);
    if ((unint64_t)(v7 - 1) > 3)
      v11 = CFSTR("HMDCompositeSettingControllerManagerRunStatePrimaryResidentUnknown");
    else
      v11 = off_1E89B68F8[v7 - 1];
    v16 = CFSTR("HMDCompositeSettingControllerManagerRunStateResident");
    if (v8)
      v16 = CFSTR("HMDCompositeSettingControllerManagerRunStatePrimaryResident");
    v17 = v16;
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@updated device is a resident and is the current device, state: %@ -> %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDCompositeSettingControllerManagerStateManager delegate](v19, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didUpdateCurrentRunState:updatedState:forHome:", v7, v9, v5);

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
      v23 = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = CFSTR("HMDCompositeSettingControllerManagerRunStateRegular");
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Current device is not a resident, will update current state to %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    os_unfair_lock_lock_with_options();
    -[HMDCompositeSettingControllerManagerStateManager _createStateForHomeUUIDIfNotExist:](v13, "_createStateForHomeUUIDIfNotExist:", v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13->_homeUUIDToState, "setObject:forKeyedSubscript:", &unk_1E8B340E0, v5);
    os_unfair_lock_unlock(&v13->_lock);
  }

}

- (void)_handleAccessoryLanguagesChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingControllerManagerStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCompositeSettingControllerManagerStateManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification for language list change: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDHomeNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCompositeSettingControllerManagerStateManager delegate](v6, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "languagesDidChangeForHome:", v14);

    }
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
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home to work with, will not process language change", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_handleAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCompositeSettingControllerManagerStateManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDAccessoryNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8 && objc_msgSend(v8, "isHomePod"))
  {
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      -[HMDCompositeSettingControllerManagerStateManager delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "languagesDidChangeForHome:", v13);

      }
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
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home for removed accessory, will not process language change", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCompositeSettingControllerManagerStateManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)stateForHomeUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_homeUUIDToState, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &unk_1E8B340F8;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  if (objc_msgSend(v9, "integerValue") <= 3)
    v10 = objc_msgSend(v9, "integerValue");
  else
    v10 = 4;

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (HMDCompositeSettingControllerManagerStateTransitionDelegate)delegate
{
  return (HMDCompositeSettingControllerManagerStateTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCompositeSettingNotificationRegistrationProviding)notificationRegistrationProvider
{
  return (HMDCompositeSettingNotificationRegistrationProviding *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)notificationOptions
{
  return self->_notificationOptions;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCompositeSettingControllerManagerStateManagerDataSource)dataSource
{
  return (HMDCompositeSettingControllerManagerStateManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_notificationRegistrationProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeUUIDToState, 0);
}

void __69__HMDCompositeSettingControllerManagerStateManager__handleHomeAdded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_createStateForHomeUUIDIfNotExist:", v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_131435 != -1)
    dispatch_once(&logCategory__hmf_once_t29_131435, &__block_literal_global_131436);
  return (id)logCategory__hmf_once_v30_131437;
}

void __63__HMDCompositeSettingControllerManagerStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30_131437;
  logCategory__hmf_once_v30_131437 = v0;

}

@end
