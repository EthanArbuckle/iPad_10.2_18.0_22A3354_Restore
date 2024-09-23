@implementation HMDSiriEndpointSettingsSyncManager

- (HMDSiriEndpointSettingsSyncManager)initWithDataSource:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDSiriEndpointSettingsSyncManager *v14;
  HMDSiriEndpointSettingsSyncManager *v15;
  uint64_t v16;
  NSMutableSet *homeUUIDsManagedByCurrentDevice;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDSiriEndpointSettingsSyncManager;
  v14 = -[HMDSiriEndpointSettingsSyncManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeStrong((id *)&v15->_subscriptionProvider, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    homeUUIDsManagedByCurrentDevice = v15->_homeUUIDsManagedByCurrentDevice;
    v15->_homeUUIDsManagedByCurrentDevice = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (void)configure
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
  NSObject *v12;
  _QWORD block[5];

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleSiriEndPointAddedNotification_, CFSTR("HMDSiriEndpointProfileAddedNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleCompositeSettingsControllerDidConfigureNotification_, CFSTR("HMDCompositeSettingsControllerDidConfigureNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleHomeAddedNotification_, CFSTR("HMDHomeAddedNotification"), 0);

  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDSiriEndpointSettingsSyncManager_configure__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v12, block);

}

- (void)_beginManagingHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "hapAccessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "siriEndpointProfile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[HMDSiriEndpointSettingsSyncManager _beginManagingAccessory:forHome:](self, "_beginManagingAccessory:forHome:", v11, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_stopManagingHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "hapAccessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "siriEndpointProfile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          -[HMDSiriEndpointSettingsSyncManager _stopManagingAccessory:forHome:](self, "_stopManagingAccessory:forHome:", v11, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_beginManagingAccessory:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths](HMDSiriEndpointSettingsSyncManager, "siriEndPointHomeKitBackedKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke;
  v22[3] = &unk_24E78F378;
  v11 = v7;
  v23 = v11;
  v12 = v6;
  v24 = v12;
  objc_msgSend(v9, "na_map:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSiriEndpointSettingsSyncManager unregisterFromAccessoryNotificationsOnHapAccessory:](self, "unregisterFromAccessoryNotificationsOnHapAccessory:", v12);
  -[HMDSiriEndpointSettingsSyncManager registerForAccessoryNotificationsOnHapAccessory:](self, "registerForAccessoryNotificationsOnHapAccessory:", v12);
  -[HMDSiriEndpointSettingsSyncManager subscriptionProvider](self, "subscriptionProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke_2;
  v18[3] = &unk_24E79A0C0;
  v18[4] = self;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  objc_msgSend(v14, "registerConsumer:topicFilters:completion:", self, v17, v18);

}

- (void)_stopManagingAccessory:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths](HMDSiriEndpointSettingsSyncManager, "siriEndPointHomeKitBackedKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke;
  v16[3] = &unk_24E78F378;
  v17 = v7;
  v18 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "na_map:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSiriEndpointSettingsSyncManager subscriptionProvider](self, "subscriptionProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke_2;
  v15[3] = &unk_24E79BD80;
  v15[4] = self;
  objc_msgSend(v14, "unregisterConsumer:topicFilters:completion:", self, v13, v15);

  -[HMDSiriEndpointSettingsSyncManager unregisterFromAccessoryNotificationsOnHapAccessory:](self, "unregisterFromAccessoryNotificationsOnHapAccessory:", v11);
}

- (void)registerForAccessoryNotificationsOnHapAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryIsReachableNotification_, CFSTR("HMDAccessoryIsReachableNotification"), v4);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleHAPMediaProfileAddedNotification_, CFSTR("HMDHAPMediaProfileAddedNotification"), v4);

}

- (void)unregisterFromAccessoryNotificationsOnHapAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("HMDAccessoryIsReachableNotification"), v4);

  -[HMDSiriEndpointSettingsSyncManager notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("HMDHAPMediaProfileAddedNotification"), v4);

}

- (void)_updateManagedHomes
{
  NSObject *v3;
  void *v4;
  HMDSiriEndpointSettingsSyncManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  HMDSiriEndpointSettingsSyncManager *v38;
  NSObject *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating homes for siri endpoint settings sync", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointSettingsSyncManager dataSource](v5, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homesForSiriEndpointSettingsSyncManager:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v15, "isCurrentDeviceConfirmedPrimaryResident"))
          objc_msgSend(v8, "addObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v12);
  }

  os_unfair_lock_lock_with_options();
  -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v5, "homeUUIDsManagedByCurrentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  os_unfair_lock_unlock(&v5->_lock);
  v18 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke;
  v53[3] = &unk_24E796248;
  v19 = v17;
  v54 = v19;
  objc_msgSend(v8, "na_filter:", v53);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "na_map:", &__block_literal_global_36_149967);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCF20];
  v50[0] = v18;
  v50[1] = 3221225472;
  v50[2] = __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_3;
  v50[3] = &unk_24E7961F0;
  v23 = v19;
  v51 = v23;
  v41 = v8;
  v52 = v41;
  objc_msgSend(v11, "na_filter:", v50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "na_map:", &__block_literal_global_38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v5, "homeUUIDsManagedByCurrentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unionSet:", v21);

  -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v5, "homeUUIDsManagedByCurrentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minusSet:", v26);

  os_unfair_lock_unlock(&v5->_lock);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = v20;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v29);
        -[HMDSiriEndpointSettingsSyncManager _beginManagingHome:](v5, "_beginManagingHome:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
    }
    while (v30);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v25;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(v33);
        -[HMDSiriEndpointSettingsSyncManager _stopManagingHome:](v5, "_stopManagingHome:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
    }
    while (v34);
  }

  v37 = (void *)MEMORY[0x227676638]();
  v38 = v5;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v60 = v40;
    v61 = 2112;
    v62 = v33;
    v63 = 2112;
    v64 = v29;
    v65 = 2112;
    v66 = v23;
    _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Updated homes for siri endpoint setting sync by removing: %@ and adding: %@ to existing homes: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v37);

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  os_unfair_lock_s *p_lock;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  HMDSiriEndpointSettingsSyncManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDSiriEndpointSettingsSyncManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDSiriEndpointSettingsSyncManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDSiriEndpointSettingsSyncManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD block[5];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "accessorySettingKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "homeUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "accessoryUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v59 = 0;
          objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v6, &v59);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v59;
          if (v13)
          {
            +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths](HMDSiriEndpointSettingsSyncManager, "siriEndPointHomeKitBackedKeyPaths");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "accessorySettingKeyPath");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "containsObject:", v15);

            if ((v16 & 1) != 0)
            {
              -[HMDSiriEndpointSettingsSyncManager dataSource](self, "dataSource");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "homesForSiriEndpointSettingsSyncManager:", self);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v57[0] = MEMORY[0x24BDAC760];
              v57[1] = 3221225472;
              v57[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke;
              v57[3] = &unk_24E796248;
              v19 = v9;
              v58 = v19;
              objc_msgSend(v18, "na_firstObjectPassingTest:", v57);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              p_lock = &self->_lock;
              os_unfair_lock_lock_with_options();
              -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](self, "homeUUIDsManagedByCurrentDevice");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "containsObject:", v22);

              if ((v23 & 1) != 0)
              {
                os_unfair_lock_unlock(&self->_lock);
                objc_msgSend(v49, "hapAccessories");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v55[0] = MEMORY[0x24BDAC760];
                v55[1] = 3221225472;
                v55[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_41;
                v55[3] = &unk_24E7928E0;
                v25 = v19;
                v56 = v25;
                objc_msgSend(v24, "na_firstObjectPassingTest:", v55);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26
                  || (objc_msgSend(v26, "siriEndpointProfile"),
                      v27 = (void *)objc_claimAutoreleasedReturnValue(),
                      v28 = v27 == 0,
                      v27,
                      v28))
                {
                  v45 = (void *)MEMORY[0x227676638]();
                  v46 = self;
                  HMFGetOSLogHandle();
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v61 = v48;
                    v62 = 2112;
                    v63 = v49;
                    v64 = 2112;
                    v65 = v6;
                    v66 = 2112;
                    v67 = v7;
                    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching siri endpoint enabled accessory in home (%@) for settings update event: %@ topic: %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v45);
                }
                else
                {
                  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
                  v29 = objc_claimAutoreleasedReturnValue();
                  block[0] = MEMORY[0x24BDAC760];
                  block[1] = 3221225472;
                  block[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_43;
                  block[3] = &unk_24E79A910;
                  block[4] = self;
                  v52 = v13;
                  v53 = v26;
                  v54 = v25;
                  dispatch_async(v29, block);

                }
              }
              else
              {
                v41 = (void *)MEMORY[0x227676638]();
                v42 = self;
                HMFGetOSLogHandle();
                v43 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v61 = v44;
                  v62 = 2112;
                  v63 = v6;
                  v64 = 2112;
                  v65 = v7;
                  _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Received settings update event: %@ topic: %@ for unmanaged home", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v41);
                os_unfair_lock_unlock(p_lock);
              }

              goto LABEL_34;
            }
            v36 = (void *)MEMORY[0x227676638]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v61 = v40;
              v62 = 2112;
              v63 = v6;
              v64 = 2112;
              v65 = v7;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Did recieve settings value event for an unwatched keypath. Event: %@ Topic: %@", buf, 0x20u);

            }
          }
          else
          {
            v36 = (void *)MEMORY[0x227676638]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v61 = v39;
              v62 = 2112;
              v63 = v6;
              v64 = 2112;
              v65 = v7;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);

            }
          }

          objc_autoreleasePoolPop(v36);
LABEL_34:

          goto LABEL_35;
        }
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v35;
          v62 = 2112;
          v63 = v6;
          v64 = 2112;
          v65 = v7;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil accessoryUUID for settings update event: %@ topic: %@", buf, 0x20u);

        }
      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v34;
          v62 = 2112;
          v63 = v6;
          v64 = 2112;
          v65 = v7;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil homeUUID for settings update event: %@ topic: %@", buf, 0x20u);

        }
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v33;
        v62 = 2112;
        v63 = v6;
        v64 = 2112;
        v65 = v7;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil Keypath for settings update event: %@ topic: %@", buf, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v30);
  }
LABEL_35:

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointSettingsSyncManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling %@ notification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSiriEndpointSettingsSyncManager workQueue](v6, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HMDSiriEndpointSettingsSyncManager_handlePrimaryResidentUpdateNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v10, block);

}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointSettingsSyncManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  HMDSiriEndpointSettingsSyncManager *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Settings sync manager received home removed notification: %@", buf, 0x16u);

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

  if (v12)
  {
    os_unfair_lock_lock_with_options();
    -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v6, "homeUUIDsManagedByCurrentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (v15)
    {
      -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v6, "homeUUIDsManagedByCurrentDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v17);

      os_unfair_lock_unlock(&v6->_lock);
      -[HMDSiriEndpointSettingsSyncManager workQueue](v6, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __68__HMDSiriEndpointSettingsSyncManager_handleHomeRemovedNotification___block_invoke;
      v23[3] = &unk_24E79C268;
      v23[4] = v6;
      v24 = v12;
      dispatch_async(v18, v23);

    }
    else
    {
      os_unfair_lock_unlock(&v6->_lock);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@No home found for home removed notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleHomeAddedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointSettingsSyncManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Settings sync manager received home added notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSiriEndpointSettingsSyncManager workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDSiriEndpointSettingsSyncManager_handleHomeAddedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (void)handleSiriEndPointAddedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  HMDSiriEndpointSettingsSyncManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDSiriEndpointSettingsSyncManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](self, "homeUUIDsManagedByCurrentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      os_unfair_lock_unlock(&self->_lock);
      if ((v11 & 1) != 0)
      {
        -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __74__HMDSiriEndpointSettingsSyncManager_handleSiriEndPointAddedNotification___block_invoke;
        block[3] = &unk_24E79BBD0;
        block[4] = self;
        v22 = v7;
        v23 = v8;
        dispatch_async(v12, block);

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
        *(_DWORD *)buf = 138543874;
        v25 = v20;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint added notification with no home for HAP accessory: %@. %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v16;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint added notification with no HAP accessory. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)handleCompositeSettingsControllerDidConfigureNotification:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointSettingsSyncManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  HMDSiriEndpointSettingsSyncManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDSiriEndpointSettingsSyncManager *v24;
  NSObject *v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Did handle CompositeSettingsControllerDidConfigure notification", buf, 0xCu);

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
    p_lock = &v6->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](v6, "homeUUIDsManagedByCurrentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v13);

    if ((v17 & 1) != 0)
    {
      os_unfair_lock_unlock(&v6->_lock);
      -[HMDSiriEndpointSettingsSyncManager workQueue](v6, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __96__HMDSiriEndpointSettingsSyncManager_handleCompositeSettingsControllerDidConfigureNotification___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = v6;
      v28 = v14;
      v29 = v13;
      dispatch_async(v18, block);

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v6;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home:%@ not managed", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v22;
      v32 = 2112;
      v33 = v14;
      v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil hapAccessoryUUID:%@ or homeUUID:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleHAPMediaProfileAddedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  HMDSiriEndpointSettingsSyncManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDSiriEndpointSettingsSyncManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointSettingsSyncManager *v23;
  NSObject *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](self, "homeUUIDsManagedByCurrentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if ((v12 & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_lock);
        -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __77__HMDSiriEndpointSettingsSyncManager_handleHAPMediaProfileAddedNotification___block_invoke;
        block[3] = &unk_24E79BBD0;
        block[4] = self;
        v27 = v7;
        v28 = v8;
        dispatch_async(v13, block);

      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v25;
          v31 = 2112;
          v32 = v8;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received HAPMediaProfileAdded notification for unmanaged home %@ accessory %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        os_unfair_lock_unlock(p_lock);
      }
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
        *(_DWORD *)buf = 138543874;
        v30 = v21;
        v31 = 2112;
        v32 = v7;
        v33 = 2112;
        v34 = v4;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving HAPMediaProfile notification with no home for HAP accessory: %@. %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
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
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving HAPMediaProfile added notification with no HAP accessory. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)handleAccessoryIsReachableNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  HMDSiriEndpointSettingsSyncManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDSiriEndpointSettingsSyncManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDSiriEndpointSettingsSyncManager *v23;
  NSObject *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      -[HMDSiriEndpointSettingsSyncManager homeUUIDsManagedByCurrentDevice](self, "homeUUIDsManagedByCurrentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if ((v12 & 1) != 0)
      {
        os_unfair_lock_unlock(&self->_lock);
        -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __77__HMDSiriEndpointSettingsSyncManager_handleAccessoryIsReachableNotification___block_invoke;
        block[3] = &unk_24E79BBD0;
        block[4] = self;
        v27 = v7;
        v28 = v8;
        dispatch_async(v13, block);

      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v25;
          v31 = 2112;
          v32 = v8;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received accessory reachability notification for unmanaged home %@ accessory %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        os_unfair_lock_unlock(p_lock);
      }
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
        *(_DWORD *)buf = 138543874;
        v30 = v21;
        v31 = 2112;
        v32 = v7;
        v33 = 2112;
        v34 = v4;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint reachable notification with no home for HAP accessory: %@. %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
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
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint reachable notification with no HAP accessory. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_synchronizeSettingsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDSiriEndpointSettingsSyncManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDSiriEndpointSettingsSyncManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDSiriEndpointSettingsSyncManager *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543874;
    v38 = v12;
    v39 = 2112;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Synchronizing homekit backed siri endpoint settings for accessoryUUID: %@, homeUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDSiriEndpointSettingsSyncManager dataSource](v10, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homesForSiriEndpointSettingsSyncManager:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke;
  v35[3] = &unk_24E796248;
  v16 = v7;
  v36 = v16;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "hapAccessories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_2;
  v33[3] = &unk_24E7928E0;
  v19 = v6;
  v34 = v19;
  objc_msgSend(v18, "na_firstObjectPassingTest:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "compositeSettingsControllerManagerForSiriEndpointSettingsSyncManager:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths](HMDSiriEndpointSettingsSyncManager, "siriEndPointHomeKitBackedKeyPaths");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_47;
      v31[3] = &unk_24E7898B0;
      v31[4] = v10;
      v32 = v20;
      objc_msgSend(v21, "localFetchSettingsForUUID:homeUUID:withKeyPaths:completion:", v19, v16, v22, v31);

    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v10;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v30;
        v39 = 2112;
        v40 = v17;
        v41 = 2112;
        v42 = v19;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to data source settings manager to sync settings for home: %@, accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v10;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      v39 = 2112;
      v40 = v17;
      v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (void)_writeSetting:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDSiriEndpointSettingsSyncManager *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7968]), "initWithBoolValue:", objc_msgSend(v13, "BOOLValue"));
    -[HMDSiriEndpointSettingsSyncManager _writeSettingValue:toAccessory:forKeyPath:](self, "_writeSettingValue:toAccessory:forKeyPath:", v14, v9, v10);

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
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type received.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5
{
  -[HMDSiriEndpointSettingsSyncManager _writeSettingValue:toAccessory:forKeyPath:completionHandler:](self, "_writeSettingValue:toAccessory:forKeyPath:completionHandler:", a3, a4, a5, 0);
}

- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDSiriEndpointSettingsSyncManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  HMDSiriEndpointSettingsSyncManager *v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  HMDSiriEndpointSettingsSyncManager *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDSiriEndpointSettingsSyncManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  HMDSiriEndpointSettingsSyncManager *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  id v86;
  id v87;
  _QWORD v88[5];
  id v89;
  id v90;
  id v91;
  _QWORD v92[5];
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDSiriEndpointSettingsSyncManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v18;
    v98 = 2112;
    v99 = v10;
    v100 = 2112;
    v101 = v11;
    v102 = 2112;
    v103 = v12;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Writing setting value: %@ to siri endpoint accessory: %@ for keypath: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
  {
    v19 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      v22 = objc_msgSend(v21, "BOOLValue");
      objc_msgSend(v11, "siriEndpointProfile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x24BDAC760];
      v92[1] = 3221225472;
      v92[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke;
      v92[3] = &unk_24E79C0D0;
      v92[4] = v16;
      v93 = v11;
      v24 = v21;
      v94 = v24;
      v95 = v13;
      objc_msgSend(v23, "setListening:completionHandler:", v22, v92);

      v25 = v93;
LABEL_29:

LABEL_70:
      goto LABEL_71;
    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v16;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    v98 = 2112;
    v99 = v19;
    v100 = 2112;
    v101 = v12;
    v102 = 2112;
    v103 = v11;
    v40 = "%{public}@heySiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.siri.tapToAccess")))
  {
    v26 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    if (v28)
    {
      v29 = objc_msgSend(v28, "BOOLValue");
      objc_msgSend(v11, "siriEndpointProfile");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_52;
      v88[3] = &unk_24E79C0D0;
      v88[4] = v16;
      v89 = v11;
      v24 = v28;
      v90 = v24;
      v91 = v13;
      objc_msgSend(v30, "setTouchToUse:completionHandler:", v29, v88);

      v25 = v89;
      goto LABEL_29;
    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v16;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    v98 = 2112;
    v99 = v26;
    v100 = 2112;
    v101 = v12;
    v102 = 2112;
    v103 = v11;
    v40 = "%{public}@tapToAccessSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.siri.lightWhenUsingSiri")))
  {
    v31 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v33)
    {
      v34 = objc_msgSend(v33, "BOOLValue");
      objc_msgSend(v11, "siriEndpointProfile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_53;
      v84[3] = &unk_24E79C0D0;
      v84[4] = v16;
      v85 = v11;
      v24 = v33;
      v86 = v24;
      v87 = v13;
      objc_msgSend(v35, "setLightOnUse:completionHandler:", v34, v84);

      v25 = v85;
      goto LABEL_29;
    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v16;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    v98 = 2112;
    v99 = v31;
    v100 = 2112;
    v101 = v12;
    v102 = 2112;
    v103 = v11;
    v40 = "%{public}@lightWhenUsingSiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.siri.soundAlert")))
  {
    v41 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v41;
    else
      v42 = 0;
    v43 = v42;

    if (v43)
    {
      v44 = objc_msgSend(v43, "BOOLValue");
      objc_msgSend(v11, "siriEndpointProfile");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_54;
      v80[3] = &unk_24E79C0D0;
      v80[4] = v16;
      v81 = v11;
      v24 = v43;
      v82 = v24;
      v83 = v13;
      objc_msgSend(v45, "setSoundOnUse:completionHandler:", v44, v80);

      v25 = v81;
      goto LABEL_29;
    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v16;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    v98 = 2112;
    v99 = v41;
    v100 = 2112;
    v101 = v12;
    v102 = 2112;
    v103 = v11;
    v40 = "%{public}@soundWhenUsingSiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.airPlay.airPlayEnabled")))
  {
    v46 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = v46;
    else
      v47 = 0;
    v24 = v47;

    if (v24)
    {
      objc_msgSend(v11, "mediaProfile");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      v50 = v49;

      if (v50)
      {
        v51 = objc_msgSend(v24, "BOOLValue");
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_56;
        v76[3] = &unk_24E79C0D0;
        v76[4] = v16;
        v77 = v11;
        v78 = v24;
        v79 = v13;
        objc_msgSend(v50, "setEnable:completionHandler:", v51, v76);

      }
      else
      {
        v65 = (void *)MEMORY[0x227676638]();
        v66 = v16;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v71 = v65;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v97 = v68;
          v98 = 2112;
          v99 = v46;
          v100 = 2112;
          v101 = v12;
          v102 = 2112;
          v103 = v11;
          _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize airplayEnabledSettingValue (%@) for keypath %@, accessory: %@, as accessory does not have a hapMediaProfile", buf, 0x2Au);

          v65 = v71;
        }

        objc_autoreleasePoolPop(v65);
        v50 = 0;
      }
    }
    else
    {
      v61 = (void *)MEMORY[0x227676638]();
      v62 = v16;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v70 = v61;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v97 = v64;
        v98 = 2112;
        v99 = v46;
        v100 = 2112;
        v101 = v12;
        v102 = 2112;
        v103 = v11;
        _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@airplayEnabledSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type", buf, 0x2Au);

        v61 = v70;
      }

      objc_autoreleasePoolPop(v61);
      if (!v13)
        goto LABEL_69;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v13 + 2))(v13, v50);
    }

    goto LABEL_70;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("root.siri.siriEnabled")))
  {
    v52 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v53 = v52;
    else
      v53 = 0;
    v54 = v53;

    if (v54)
    {
      v55 = objc_msgSend(v54, "BOOLValue");
      objc_msgSend(v11, "siriEndpointProfile");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_57;
      v72[3] = &unk_24E79C0D0;
      v72[4] = v16;
      v73 = v11;
      v24 = v54;
      v74 = v24;
      v75 = v13;
      objc_msgSend(v56, "setEnable:completionHandler:", v55, v72);

      v25 = v73;
      goto LABEL_29;
    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v16;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    v98 = 2112;
    v99 = v52;
    v100 = 2112;
    v101 = v12;
    v102 = 2112;
    v103 = v11;
    v40 = "%{public}@siriEnabledSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
LABEL_66:
    _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, v40, buf, 0x2Au);

LABEL_67:
    objc_autoreleasePoolPop(v36);
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v69);

    }
LABEL_69:
    v24 = 0;
    goto LABEL_70;
  }
  v57 = (void *)MEMORY[0x227676638]();
  v58 = v16;
  HMFGetOSLogHandle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v97 = v60;
    v98 = 2112;
    v99 = v12;
    v100 = 2112;
    v101 = v10;
    v102 = 2112;
    v103 = v11;
    _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unknown keypath (%@) for homekit backed siri endpoint setting value (%@) accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v57);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 43);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v13 + 2))(v13, v24);
    goto LABEL_70;
  }
LABEL_71:

}

- (void)writeSettingValue:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 forKeyPath:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDSiriEndpointSettingsSyncManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  HMDSiriEndpointSettingsSyncManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v38 = v20;
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v14;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Writing endpoint settings for accessoryUUID: %@, homeUUID: %@, settingValue: %@, keyPath: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v17);
  v35 = 0;
  v36 = 0;
  -[HMDSiriEndpointSettingsSyncManager _matchingHomeforUUID:accessoryUUID:home:accessory:](v18, "_matchingHomeforUUID:accessoryUUID:home:accessory:", v14, v13, &v36, &v35);
  v21 = v36;
  v22 = v35;
  if (v22)
  {
    -[HMDSiriEndpointSettingsSyncManager workQueue](v18, "workQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __108__HMDSiriEndpointSettingsSyncManager_writeSettingValue_accessoryUUID_homeUUID_forKeyPath_completionHandler___block_invoke;
    block[3] = &unk_24E799A68;
    block[4] = v18;
    v31 = v12;
    v32 = v22;
    v33 = v15;
    v34 = v16;
    dispatch_async(v23, block);

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v18;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = v24;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v27;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);

      v24 = v29;
    }

    objc_autoreleasePoolPop(v24);
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v28);

    }
  }

}

- (void)_matchingHomeforUUID:(id)a3 accessoryUUID:(id)a4 home:(id *)a5 accessory:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMDSiriEndpointSettingsSyncManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDSiriEndpointSettingsSyncManager *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[HMDSiriEndpointSettingsSyncManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    objc_msgSend(v12, "homesForSiriEndpointSettingsSyncManager:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke;
    v29[3] = &unk_24E796248;
    v30 = v10;
    objc_msgSend(v14, "na_firstObjectPassingTest:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v17 = objc_retainAutorelease(v16);
      *a5 = v17;
      objc_msgSend(v17, "hapAccessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke_58;
      v27[3] = &unk_24E7928E0;
      v28 = v11;
      objc_msgSend(v18, "na_firstObjectPassingTest:", v27);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Nil out hap accessory passed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil out parameter home passed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (id)readValueValueForAccessoryUUID:(id)a3 homeUUID:(id)a4 forKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSiriEndpointSettingsSyncManager *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDSiriEndpointSettingsSyncManager *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v32 = v14;
    v33 = 2112;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing endpoint settings for accessoryUUID: %@, homeUUID: %@, keyPath: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v29 = 0;
  v30 = 0;
  -[HMDSiriEndpointSettingsSyncManager _matchingHomeforUUID:accessoryUUID:home:accessory:](v12, "_matchingHomeforUUID:accessoryUUID:home:accessory:", v9, v8, &v30, &v29);
  v15 = v30;
  v16 = v29;
  if (!v16)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v8;
    v23 = "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings";
    v24 = v21;
    v25 = 32;
LABEL_17:
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);

    goto LABEL_18;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
  {
    objc_msgSend(v16, "siriEndpointProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "siriListening");

    if (v18 == -1)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v12;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("root.siri.tapToAccess")))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    v33 = 2112;
    v34 = v10;
    v23 = "%{public}@Invalid or unrecongnized keyPath: %@";
    v24 = v21;
    v25 = 22;
    goto LABEL_17;
  }
  objc_msgSend(v16, "siriEndpointProfile");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v26, "siriTouchToUse");

  if (v18 == -1)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v22;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v10;
      v23 = "%{public}@Unknown value for home:%@, accessory:%@, keyPath:%@";
      v24 = v21;
      v25 = 42;
      goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(v19);
    v27 = 0;
    goto LABEL_19;
  }
LABEL_12:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7968]), "initWithBoolValue:", v18 == 1);
LABEL_19:

  return v27;
}

- (int64_t)siriEndpointCertificationReasonForAccessoryUUID:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  HMDSiriEndpointSettingsSyncManager *v15;
  NSObject *v16;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = 0;
  -[HMDSiriEndpointSettingsSyncManager _matchingHomeforUUID:accessoryUUID:home:accessory:](self, "_matchingHomeforUUID:accessoryUUID:home:accessory:", v9, v8, &v20, &v19);
  v10 = v20;
  v11 = v19;
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "computeSiriEndpointCertification");
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
      *(_DWORD *)buf = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (HMDSiriEndpointSettingsSyncManagerDataSource)dataSource
{
  return (HMDSiriEndpointSettingsSyncManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)homeUUIDsManagedByCurrentDevice
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_homeUUIDsManagedByCurrentDevice, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke_58(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __108__HMDSiriEndpointSettingsSyncManager_writeSettingValue_accessoryUUID_homeUUID_forKeyPath_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeSettingValue:toAccessory:forKeyPath:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized hey siri enabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_52(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized tap to access on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_53(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized light on use on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_54(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized sound on use on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_56(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized airplayEnabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_57(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544386;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized siriEnabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

uint64_t __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_47(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  uint32_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v54 = a3;
  v53 = a4;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
  if (v9)
  {
    v10 = v9;
    v55 = *(_QWORD *)v57;
    v52 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v57 != v55)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v11);
        +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths](HMDSiriEndpointSettingsSyncManager, "siriEndPointHomeKitBackedKeyPaths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsObject:", v14);

        if ((v15 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "keyPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v61 = v20;
            v62 = 2112;
            v63 = v21;
            v64 = 2112;
            v65 = v54;
            v66 = 2112;
            v67 = v53;
            v23 = v19;
            v24 = OS_LOG_TYPE_INFO;
            v25 = "%{public}@Did fetch settings value event for an unexpected keypath %@, uuid: %@, homeUUID: %@";
            v26 = 42;
            goto LABEL_12;
          }
LABEL_14:

          objc_autoreleasePoolPop(v17);
          goto LABEL_15;
        }
        objc_msgSend(v12, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v61 = v20;
          v62 = 2112;
          v63 = v21;
          v64 = 2112;
          v65 = v54;
          v66 = 2112;
          v67 = v53;
          v68 = 2112;
          v69 = v22;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching settings value event for keypath %@, uuid: %@, homeUUID: %@ error: %@", buf, 0x34u);

          v8 = v52;
LABEL_13:

          goto LABEL_14;
        }
        objc_msgSend(v12, "setting");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v61 = v20;
          v62 = 2112;
          v63 = v21;
          v64 = 2112;
          v65 = v54;
          v66 = 2112;
          v67 = v53;
          v68 = 2112;
          v69 = v12;
          v23 = v19;
          v24 = OS_LOG_TYPE_ERROR;
          v25 = "%{public}@Error fetching settings value event for keypath %@, uuid: %@, homeUUID: %@ no setting returned in result: %@";
          v26 = 52;
LABEL_12:
          _os_log_impl(&dword_2218F0000, v23, v24, v25, buf, v26);
          goto LABEL_13;
        }
        objc_msgSend(v12, "setting");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v30 = v29;
        if (v30)
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7968]), "initWithBoolValue:", objc_msgSend(v30, "BOOLValue"));
        }
        else
        {
          v32 = v28;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v33 = v32;
          else
            v33 = 0;
          v34 = v33;

          if (v34)
          {
            v35 = objc_alloc(MEMORY[0x24BDD7980]);
            objc_msgSend(v34, "stringValue");
            v36 = (id)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v35, "initWithStringValue:", v36);
          }
          else
          {
            v37 = v32;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v38 = v37;
            else
              v38 = 0;
            v36 = v38;

            if (v36)
            {
              v39 = objc_alloc(MEMORY[0x24BDD7970]);
              objc_msgSend(v36, "numberValue");
              v40 = (id)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v39, "initWithIntegerValue:", objc_msgSend(v40, "integerValue"));
            }
            else
            {
              v41 = v37;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v42 = v41;
              else
                v42 = 0;
              v40 = v42;

              if (v40)
              {
                v49 = objc_alloc(MEMORY[0x24BDD7978]);
                objc_msgSend(v40, "inputLanguageCode");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "outputVoiceLanguageCode");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "outputVoiceGenderCode");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "voiceName");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)objc_msgSend(v49, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v51, v50, v48, v47);

              }
              else
              {
                v31 = 0;
              }
            }

          }
          v8 = v52;
        }

        v43 = *(void **)(a1 + 32);
        v44 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v12, "keyPath");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "_writeSettingValue:toAccessory:forKeyPath:", v31, v44, v45);

LABEL_15:
        ++v11;
      }
      while (v10 != v11);
      v46 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      v10 = v46;
    }
    while (v46);
  }

}

void __77__HMDSiriEndpointSettingsSyncManager_handleAccessoryIsReachableNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_synchronizeSettingsForAccessoryUUID:homeUUID:", v4, v3);

}

void __77__HMDSiriEndpointSettingsSyncManager_handleHAPMediaProfileAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_synchronizeSettingsForAccessoryUUID:homeUUID:", v4, v3);

}

uint64_t __96__HMDSiriEndpointSettingsSyncManager_handleCompositeSettingsControllerDidConfigureNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronizeSettingsForAccessoryUUID:homeUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74__HMDSiriEndpointSettingsSyncManager_handleSiriEndPointAddedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginManagingAccessory:forHome:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__HMDSiriEndpointSettingsSyncManager_handleHomeAddedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateManagedHomes");
}

uint64_t __68__HMDSiriEndpointSettingsSyncManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopManagingHome:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__HMDSiriEndpointSettingsSyncManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateManagedHomes");
}

uint64_t __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_41(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

void __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_43(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "accessorySettingKeyPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeSetting:toAccessory:forKeyPath:", v2, v3, v4);

}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
    v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) ^ 1;
  else
    v6 = 0;

  return v6;
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

id __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2276752E8](v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke_2(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed endpoint setting sync manager with result: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

id __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2276752E8](v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Subscribed endpoint setting sync manager for changed topics (%@) with result: %@ (%@)", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_synchronizeSettingsForAccessoryUUID:homeUUID:", v14, v15);

}

uint64_t __47__HMDSiriEndpointSettingsSyncManager_configure__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateManagedHomes");
}

+ (NSArray)siriEndPointHomeKitBackedKeyPaths
{
  if (siriEndPointHomeKitBackedKeyPaths_onceToken != -1)
    dispatch_once(&siriEndPointHomeKitBackedKeyPaths_onceToken, &__block_literal_global_149994);
  return (NSArray *)(id)siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_149989 != -1)
    dispatch_once(&logCategory__hmf_once_t0_149989, &__block_literal_global_23_149990);
  return (id)logCategory__hmf_once_v1_149991;
}

void __49__HMDSiriEndpointSettingsSyncManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_149991;
  logCategory__hmf_once_v1_149991 = v0;

}

void __71__HMDSiriEndpointSettingsSyncManager_siriEndPointHomeKitBackedKeyPaths__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("root.siri.lightWhenUsingSiri");
  v2[1] = CFSTR("root.siri.soundAlert");
  v2[2] = CFSTR("root.airPlay.airPlayEnabled");
  v2[3] = CFSTR("root.siri.siriEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths;
  siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths = v0;

}

@end
