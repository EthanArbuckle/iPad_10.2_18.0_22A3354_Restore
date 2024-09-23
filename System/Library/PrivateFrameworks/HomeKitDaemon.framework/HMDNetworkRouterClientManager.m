@implementation HMDNetworkRouterClientManager

- (HMDNetworkRouterClientManager)initWithNetworkRouterAccessory:(id)a3 workQueue:(id)a4 firewallRuleManager:(id)a5 notificationCenter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDNetworkRouterClientManager *v14;
  void *v15;
  HMDNetworkRouterClientManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableSet *accessoriesInReconfiguration;
  HMDNetworkRouterClientManager *v22;
  id v24;
  id v25;
  void *context;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDNetworkRouterClientManager;
  v14 = -[HMDNetworkRouterClientManager init](&v27, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "networkRouterController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v22 = 0;
      goto LABEL_8;
    }
    context = (void *)MEMORY[0x227676638]();
    v16 = v14;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v10);
      v24 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Initializing with network router accessory %@", buf, 0x16u);

      v12 = v24;
      v11 = v25;
    }

    objc_autoreleasePoolPop(context);
    objc_storeWeak((id *)&v16->_networkRouterAccessory, v10);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_notificationCenter, a6);
    objc_storeStrong((id *)&v16->_firewallRuleManager, a5);
    *(_DWORD *)&v16->_started = 0x10000;
    v16->_startPending = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoriesInReconfiguration = v16->_accessoriesInReconfiguration;
    v16->_accessoriesInReconfiguration = (NSMutableSet *)v20;

  }
  v22 = v14;
LABEL_8:

  return v22;
}

- (HMDHAPAccessory)networkRouterAccessory
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_networkRouterAccessory);
  os_unfair_lock_unlock(p_lock);
  return (HMDHAPAccessory *)WeakRetained;
}

- (BOOL)started
{
  HMDNetworkRouterClientManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)evaluateManagement
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDNetworkRouterClientManager_evaluateManagement__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDNetworkRouterClientManager_stop__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)replaceActiveNetworkRouterAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMDNetworkRouterClientManager_replaceActiveNetworkRouterAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)migrateAccessory:(id)a3 toCredentialType:(int64_t)a4 rotate:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke;
  block[3] = &unk_24E78E7E0;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a4;
  v19 = a5;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, block);

}

- (HMDNetworkRouterController)routerController
{
  void *v2;
  void *v3;

  -[HMDNetworkRouterClientManager networkRouterAccessory](self, "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkRouterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDNetworkRouterController *)v3;
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterClientManager firewallRuleManager](self, "firewallRuleManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[HMDNetworkRouterClientManager home](self, "home", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "supportsNetworkProtection"))
          {
            objc_msgSend(v14, "metadataIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v7, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v6 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setStarted:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_started = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNetworkRouterAccessory:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_networkRouterAccessory, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDHome)home
{
  void *v2;
  void *v3;

  -[HMDNetworkRouterClientManager networkRouterAccessory](self, "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHome *)v3;
}

- (void)__registerForNetworkRouterAccessoryReachable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleRouterAccessoryReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v4);

}

- (void)__deregisterForNetworkRouterAccessoryReachable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("HMDAccessoryIsReachableNotification"), v4);

}

- (void)_evaluateManagement
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  HMDNetworkRouterClientManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterClientManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isResidentSupported");
  v5 = objc_msgSend(v4, "isCurrentDevicePrimaryResident");
  objc_msgSend(v4, "primaryNetworkRouterManagingDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterClientManager started](v8, "started");
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544386;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Evaluating network router management responsibility. Resident Available: %@, Current Device Primary Resident: %@, Current Device Management Active: %@, Primary Managing Device: %@", (uint8_t *)&v15, 0x34u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
    v14 = 0;
  else
    v14 = v5;
  if (v14 == 1)
  {
    -[HMDNetworkRouterClientManager _resetStaleClientIdentifiersBeforeStart](v8, "_resetStaleClientIdentifiersBeforeStart");
  }
  else
  {
    -[HMDNetworkRouterClientManager setStartPending:](v8, "setStartPending:", 0);
    -[HMDNetworkRouterClientManager _stop](v8, "_stop");
  }

}

- (void)_resetStaleClientIdentifiersBeforeStart
{
  NSObject *v3;
  void *v4;
  HMDNetworkRouterClientManager *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  HMDNetworkRouterClientManager *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDNetworkRouterClientManager started](self, "started"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8 = -[HMDNetworkRouterClientManager staleClientIdentifiersResetInProgress](self, "staleClientIdentifiersResetInProgress");
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Stale network client identifiers reset is already in progress", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientManager home](v10, "home");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting stale network client identifiers for accessories in the home %@ before starting", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDNetworkRouterClientManager setStaleClientIdentifiersResetNeeded:](v10, "setStaleClientIdentifiersResetNeeded:", 0);
      -[HMDNetworkRouterClientManager setStaleClientIdentifiersResetInProgress:](v10, "setStaleClientIdentifiersResetInProgress:", 1);
      -[HMDNetworkRouterClientManager setStartPending:](v10, "setStartPending:", 1);
      objc_initWeak((id *)buf, v10);
      -[HMDNetworkRouterClientManager _transactionBlockForAccessoriesWithStaleClientIdentifier](v10, "_transactionBlockForAccessoriesWithStaleClientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke;
      v18[3] = &unk_24E799B48;
      objc_copyWeak(&v19, (id *)buf);
      objc_msgSend(v17, "run:", v18);
      objc_destroyWeak(&v19);

      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_start
{
  NSObject *v3;
  void *v4;
  HMDNetworkRouterClientManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDNetworkRouterClientManager *v10;
  NSObject *v11;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  HMDNetworkRouterClientManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDNetworkRouterClientManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterClientManager setStartPending:](self, "setStartPending:", 0);
  if (-[HMDNetworkRouterClientManager started](self, "started"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDNetworkRouterClientManager networkRouterAccessory](self, "networkRouterAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v12;
      v45 = 2112;
      v46 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting network router client manager with network router accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDNetworkRouterClientManager __registerForNetworkRouterAccessoryReachable:](v10, "__registerForNetworkRouterAccessoryReachable:", v8);
    -[HMDNetworkRouterClientManager home](v10, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel_handleAccessoryAdded_, CFSTR("HMDNotificationHomeAddedAccessory"), v14);

      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel_handleAccessoryRemoved_, CFSTR("HMDHomeAccessoryRemovedNotification"), v14);

      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel_handleHomeNetworkProtectionChanged_, CFSTR("HMDHomeNetworkProtectionUpdatedNotificationKey"), v14);

      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v10, sel_handleFirewallRulesUpdated_, CFSTR("HMDNotificationNetworkRouterFirewallRulesUpdated"), 0);

      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkProtectionGroupRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel_handleNetworkProtectionGroupActivated_, CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeActivated"), v20);

      -[HMDNetworkRouterClientManager notificationCenter](v10, "notificationCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkProtectionGroupRegistry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel_handleNetworkProtectionGroupDeactivated_, CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeDeactivated"), v22);

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v14, "networkProtectionGroupRegistry", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activeGroups");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v39 != v27)
              objc_enumerationMutation(v24);
            -[HMDNetworkRouterClientManager _registerForNetworkProtectionChangesToGroup:](v10, "_registerForNetworkProtectionChangesToGroup:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v26);
      }

      if (objc_msgSend(v8, "isReachable"))
      {
        -[HMDNetworkRouterClientManager _handleRouterAccessoryReachable:](v10, "_handleRouterAccessoryReachable:", v8);
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = v10;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v36;
          v45 = 2112;
          v46 = v37;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Network router: %@ is not reachable, waiting until it is", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
      }
      -[HMDNetworkRouterClientManager setStarted:](v10, "setStarted:", 1);
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = v10;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v32;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@No home to register for notifications on", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
    }

  }
}

- (void)_stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDNetworkRouterClientManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterClientManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDNetworkRouterClientManager started](self, "started"))
  {
    -[HMDNetworkRouterClientManager networkRouterAccessory](self, "networkRouterAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping network router client manager - active network router accessory %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDNetworkRouterClientManager notificationCenter](v6, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:", v6);

    -[HMDNetworkRouterClientManager setStarted:](v6, "setStarted:", 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Client manager is already stopped", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
}

- (void)handleRouterAccessoryReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDNetworkRouterClientManager_handleRouterAccessoryReachable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleRouterAccessoryReachable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  HMDNetworkRouterClientManager *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNetworkRouterClientManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActiveNetworkRouterInitialSetupNeeded");
  v8 = -[HMDNetworkRouterClientManager managedNetworkEnabled](self, "managedNetworkEnabled");
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v8 & (v7 ^ 1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Managed network enabled assume to be %@ for network router accessory %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (v12)
  {
    -[HMDNetworkRouterClientManager _updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:](v10, "_updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:", 0);
  }
  else
  {
    objc_initWeak((id *)buf, v10);
    -[HMDNetworkRouterClientManager routerController](v10, "routerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke;
    v17[3] = &unk_24E78E808;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v4;
    v21 = v7;
    v19 = v6;
    objc_msgSend(v16, "writeManagedNetworkEnable:completion:", 1, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (void)handleAccessoryAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDNetworkRouterClientManager_handleAccessoryAdded___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryFirmwareVersionUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterClientManager_handleAccessoryFirmwareVersionUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDNetworkRouterClientManager_handleAccessoryConfigured___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleNetworkProtectionGroupActivated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDNetworkRouterClientManager *v9;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterClientManager_handleNetworkProtectionGroupActivated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleNetworkProtectionGroupDeactivated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDNetworkRouterClientManager *v9;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__HMDNetworkRouterClientManager_handleNetworkProtectionGroupDeactivated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleNetworkProtectionGroupProtectionChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HMDNetworkRouterClientManager_handleNetworkProtectionGroupProtectionChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeNetworkProtectionChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDNetworkRouterClientManager_handleHomeNetworkProtectionChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleFirewallRulesUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDNetworkRouterClientManager_handleFirewallRulesUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startManagingAccessory:(id)a3 initialHomeSetup:(BOOL)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDNetworkRouterClientManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Managing accessory %@ as a Network Router client", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDNetworkRouterClientManager _registerForChangesToManagedAccessory:](v11, "_registerForChangesToManagedAccessory:", v9);
    -[HMDNetworkRouterClientManager _updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:](v11, "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", v9, 1, 0);
  }

}

- (void)_reconcileClientConfigurationForReachableAccessory:(id)a3 clientReconfigurationAllowed:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDNetworkRouterClientStatusIdentifier *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  HMDNetworkRouterClientStatusIdentifier *v24;
  void *v25;
  HMDNetworkRouterClientManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDNetworkRouterClientStatusIdentifier *v33;
  id v34;
  void *v35;
  HMDNetworkRouterClientManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  HMDNetworkRouterClientStatusIdentifier *v42;
  id v43;
  id v44;
  BOOL v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  HMDNetworkRouterClientStatusIdentifier *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = v6;
  objc_msgSend(v8, "primaryIPServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peerAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v46 = 0;
    +[HMDNetworkRouterIPAddress ipAddressFromNetAddress:error:](HMDNetworkRouterIPAddress, "ipAddressFromNetAddress:error:", v10, &v46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v46;
    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v8);
        v16 = (HMDNetworkRouterClientStatusIdentifier *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v48 = v15;
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v16;
        v53 = 2112;
        v54 = v12;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get translate IP address %@ for accessory %@ because of %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v19;
      v49 = 2112;
      v50 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to get IP address for accessory %@ because we don't have a connection", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v11 = 0;
  }

  objc_msgSend(v11, "v4");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

LABEL_13:
    v24 = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
    v25 = (void *)MEMORY[0x227676638](-[HMDNetworkRouterClientStatusIdentifier setIpAddress:](v24, "setIpAddress:", v11));
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v28;
      v49 = 2112;
      v50 = v29;
      v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Querying the router for the status of accessory %@ with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_initWeak((id *)buf, v26);
    -[HMDNetworkRouterClientManager networkRouterAccessory](v26, "networkRouterAccessory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDNetworkRouterClientManager routerController](v26, "routerController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke;
    v40[3] = &unk_24E78E858;
    objc_copyWeak(&v44, (id *)buf);
    v41 = v8;
    v33 = v24;
    v42 = v33;
    v34 = v31;
    v43 = v34;
    v45 = a4;
    objc_msgSend(v32, "getClientStatusWithIdentifier:completion:", v33, v40);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);

    goto LABEL_16;
  }
  objc_msgSend(v11, "v6");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
    goto LABEL_13;
  v35 = (void *)MEMORY[0x227676638]();
  v36 = self;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v38;
    v49 = 2112;
    v50 = v39;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract any IP address for accessory %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
LABEL_16:

}

- (void)_reconcileClientConfigurationForAccessory:(id)a3 clientStatus:(id)a4 networkRouterUUID:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDNetworkRouterClientManager *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  HMDNetworkRouterClientManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v6 = a6;
  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend(v11, "macAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v19;
      v46 = 2112;
      v47 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Reconciling client configuration for accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v10, "networkClientIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v11, "clientIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22)
      {
        objc_msgSend(v23, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v21, "isEqualToNumber:", v25);

        if ((v26 & 1) != 0)
        {
          -[HMDNetworkRouterClientManager _updateExistingClientConfiguration:forAccessory:clientStatus:clientReconfigurationAllowed:](v16, "_updateExistingClientConfiguration:forAccessory:clientStatus:clientReconfigurationAllowed:", v21, v10, v11, v6);
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v11, "clientIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "value");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientManager _replaceNetworkClientIdentifierForAccessory:networkClientIdentifier:networkRouterUUID:clientStatus:clientReconfigurationAllowed:](v16, "_replaceNetworkClientIdentifierForAccessory:networkClientIdentifier:networkRouterUUID:clientStatus:clientReconfigurationAllowed:", v10, v41, v12, v11, v6);

LABEL_19:
        goto LABEL_22;
      }

      if (!v24)
      {
        objc_msgSend(v11, "macAddress");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        networkRouterCredentialForAccessory(v10, v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDNetworkRouterClientManager _replaceClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:](v16, "_replaceClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:", v10, v40, v11, v6);
        goto LABEL_21;
      }
    }
    else if (v22)
    {
      -[HMDNetworkRouterClientManager networkRouterAccessory](v16, "networkRouterAccessory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqual:", v12);

      if (!v31)
        goto LABEL_22;
      objc_msgSend(v11, "clientIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x227676638]();
      v35 = v16;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v10);
        v43 = v34;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v37;
        v46 = 2112;
        v47 = v33;
        v48 = 2112;
        v49 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Saving found network client identifier %@ for %@", buf, 0x20u);

        v34 = v43;
      }

      objc_autoreleasePoolPop(v34);
      objc_msgSend(v10, "saveNetworkClientIdentifier:networkRouterUUID:clearProfileFingerprint:", v33, v12, 1);
      -[HMDNetworkRouterClientManager _updateClientConfiguration:forAccessory:protectionMode:clientStatus:skipIfFingerprintMatches:clientReconfigurationAllowed:](v35, "_updateClientConfiguration:forAccessory:protectionMode:clientStatus:skipIfFingerprintMatches:clientReconfigurationAllowed:", v33, v10, getProtectionModeForAccessory(v10), v11, 0, v6);
      goto LABEL_19;
    }
    objc_msgSend(v11, "macAddress");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    networkRouterCredentialForAccessory(v10, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDNetworkRouterClientManager _createClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:](v16, "_createClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:", v10, v40, v11, v6);
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    v46 = 2112;
    v47 = v28;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Router failed to report MAC address for accessory %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_23:

}

- (void)_replaceNetworkClientIdentifierForAccessory:(id)a3 networkClientIdentifier:(id)a4 networkRouterUUID:(id)a5 clientStatus:(id)a6 clientReconfigurationAllowed:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDNetworkRouterClientManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "networkClientIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v18;
    v37 = 2112;
    v38 = v19;
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v20;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Replacing saved network client identifier %@ with %@ found on router for %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  objc_initWeak((id *)buf, v16);
  -[HMDNetworkRouterClientManager routerController](v16, "routerController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "networkClientIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke;
  v28[3] = &unk_24E78E8A8;
  objc_copyWeak(&v33, (id *)buf);
  v23 = v13;
  v29 = v23;
  v24 = v11;
  v30 = v24;
  v25 = v12;
  v31 = v25;
  v26 = v14;
  v32 = v26;
  v34 = a7;
  objc_msgSend(v21, "removeClientConfigurationWithClientIdentifier:completion:", v22, v28);

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (void)_replaceClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDNetworkRouterClientManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "networkClientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Replacing client configuration with identifier %@ with a new client configuration for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_initWeak((id *)buf, v14);
  -[HMDNetworkRouterClientManager routerController](v14, "routerController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "networkClientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke;
  v24[3] = &unk_24E78E8D0;
  objc_copyWeak(&v28, (id *)buf);
  v21 = v10;
  v25 = v21;
  v22 = v11;
  v26 = v22;
  v23 = v12;
  v27 = v23;
  v29 = a6;
  objc_msgSend(v19, "removeClientConfigurationWithClientIdentifier:completion:", v20, v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)_createClientConfigurationForAccessory:(id)a3 credential:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDNetworkRouterClientManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *ProtectionModeForAccessory;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HMDNetworkRouterClientManager *v25;
  id v26;
  id v27;
  id v28[2];
  BOOL v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Creating new client configuration for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  ProtectionModeForAccessory = (void *)getProtectionModeForAccessory(v10);
  objc_initWeak((id *)buf, v15);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke;
  v23[3] = &unk_24E78E968;
  v20 = v11;
  v24 = v20;
  v25 = v15;
  objc_copyWeak(v28, (id *)buf);
  v21 = v10;
  v29 = a6;
  v26 = v21;
  v28[1] = ProtectionModeForAccessory;
  v22 = v12;
  v27 = v22;
  -[HMDNetworkRouterClientManager _getNetworkConfigurationForAccessory:targetProtectionMode:completion:](v15, "_getNetworkConfigurationForAccessory:targetProtectionMode:completion:", v21, ProtectionModeForAccessory, v23);

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);

}

- (void)_updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDNetworkRouterClientManager home](self, "home", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (shouldManageAccessory(v12))
          -[HMDNetworkRouterClientManager _updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:](self, "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", v12, 0, v3);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_updateOrCreateClientConfigurationForAccessory:(id)a3 preferReconcile:(BOOL)a4 clientReconfigurationAllowed:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDNetworkRouterCredential *v16;
  void *v17;
  void *v18;
  HMDNetworkRouterClientManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "networkClientIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v6)
  {
    if (v13)
      goto LABEL_9;
    if (!objc_msgSend(v12, "isReachable"))
      goto LABEL_12;
LABEL_11:
    -[HMDNetworkRouterClientManager _reconcileClientConfigurationForReachableAccessory:clientReconfigurationAllowed:](self, "_reconcileClientConfigurationForReachableAccessory:clientReconfigurationAllowed:", v12, v5);
    goto LABEL_17;
  }
  if (objc_msgSend(v12, "isReachable"))
    goto LABEL_11;
  if (v14)
  {
LABEL_9:
    -[HMDNetworkRouterClientManager _updateExistingClientConfiguration:forAccessory:clientStatus:clientReconfigurationAllowed:](self, "_updateExistingClientConfiguration:forAccessory:clientStatus:clientReconfigurationAllowed:", v14, v12, 0, v5);
    goto LABEL_17;
  }
LABEL_12:
  objc_msgSend(v10, "wiFiUniquePreSharedKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc_init(HMDNetworkRouterCredential);
    objc_msgSend(v10, "wiFiUniquePreSharedKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterCredential setPsk:](v16, "setPsk:", v17);

    -[HMDNetworkRouterClientManager _createClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:](self, "_createClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:", v10, v16, 0, 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Unable to apply client configuration for unreachable accessory %@ with no prior client configuration and no saved PSK", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
LABEL_17:

}

- (void)_updateExistingClientConfiguration:(id)a3 forAccessory:(id)a4 clientStatus:(id)a5 clientReconfigurationAllowed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t ProtectionModeForAccessory;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  HMDNetworkRouterClientManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  HMDNetworkRouterClientManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v6 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  ProtectionModeForAccessory = getProtectionModeForAccessory(v11);
  v15 = v11;
  v16 = getProtectionModeForAccessory(v15);
  if (v16 < 2)
  {

LABEL_5:
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMAccessoryNetworkProtectionModeAsString();
      v34 = v18;
      v23 = ProtectionModeForAccessory;
      v24 = v12;
      v25 = v10;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v27;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating existing client configuration for accessory %@ to comply with target network protection mode %@", buf, 0x20u);

      v6 = v26;
      v10 = v25;
      v12 = v24;
      ProtectionModeForAccessory = v23;
      v18 = v34;

    }
    objc_autoreleasePoolPop(v18);
    -[HMDNetworkRouterClientManager _updateClientConfiguration:forAccessory:protectionMode:clientStatus:skipIfFingerprintMatches:clientReconfigurationAllowed:](v19, "_updateClientConfiguration:forAccessory:protectionMode:clientStatus:skipIfFingerprintMatches:clientReconfigurationAllowed:", v10, v15, ProtectionModeForAccessory, v12, 1, v6);
    goto LABEL_12;
  }
  if (v16 == 3)
  {
    v17 = objc_msgSend(v15, "currentNetworkProtectionMode");

    if (v17 != 3)
      goto LABEL_5;
  }
  else
  {

  }
  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    logDescriptionForAccessory(v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    HMAccessoryNetworkProtectionModeAsString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v31;
    v37 = 2112;
    v38 = v32;
    v39 = 2112;
    v40 = v33;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@No network configuration update necessary for accessory %@ with protection mode %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v28);
LABEL_12:

}

- (void)_updateClientConfiguration:(id)a3 forAccessory:(id)a4 protectionMode:(int64_t)a5 clientStatus:(id)a6 skipIfFingerprintMatches:(BOOL)a7 clientReconfigurationAllowed:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  HMDNetworkRouterClientManager *v23;
  id v24;
  id v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke;
  v21[3] = &unk_24E78EA40;
  v27 = a7;
  v22 = v15;
  v23 = self;
  v25 = v14;
  v26 = a5;
  v28 = a8;
  v24 = v16;
  v18 = v14;
  v19 = v16;
  v20 = v15;
  -[HMDNetworkRouterClientManager _getNetworkConfigurationForAccessory:targetProtectionMode:completion:](self, "_getNetworkConfigurationForAccessory:targetProtectionMode:completion:", v20, a5, v21);

}

- (void)_migrateAccessory:(id)a3 withConfiguration:(id)a4 clientStatus:(id)a5 fromCredentialType:(int64_t)a6 toCredentialType:(int64_t)a7 rotate:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  HMDNetworkRouterClientManager *v36;
  NSObject *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  id *v47;
  id *v48;
  id *v49;
  void *v50;
  HMDNetworkRouterClientManager *v51;
  NSObject *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id *v59;
  id *v60;
  void *v61;
  HMDNetworkRouterCredential *context;
  void *contexta;
  void *v64;
  void *v65;
  id *v66;
  void (**v67)(id, _QWORD);
  void *v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[2];
  id v74;
  id v75;
  void (**v76)(id, _QWORD);
  id v77[2];
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[2];
  void (**v82)(id, _QWORD);
  id v83[3];
  BOOL v84;
  id location;
  uint8_t buf[4];
  id *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (void (**)(id, _QWORD))a9;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  objc_msgSend(v16, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7 == 3)
  {
    if (a6 != 3 || a8)
      goto LABEL_8;
LABEL_7:
    v18[2](v18, 0);
    goto LABEL_20;
  }
  if (a7 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v34 = (void *)v33;
    v18[2](v18, v33);

    goto LABEL_20;
  }
  if (a6 != 3)
    goto LABEL_7;
LABEL_8:
  if ((objc_msgSend(v15, "supportsWiFiReconfiguration") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ((objc_msgSend(v15, "isReachable") & 1) != 0)
  {
    v22 = v15;
    v67 = v18;
    v23 = a8;
    v24 = v16;
    v25 = v15;
    v26 = v21;
    v27 = v17;
    v28 = v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;
    v65 = v28;

    v17 = v27;
    v21 = v26;
    v15 = v25;
    v16 = v24;
    v31 = v23;
    v18 = v67;
    objc_msgSend(v30, "wiFiManagementController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      -[HMDNetworkRouterClientManager routerController](self, "routerController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "wiFiSSID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
        goto LABEL_31;
      if (a7 == 3)
      {
        generateWiFiUniquePreSharedKey();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "dataUsingEncoding:", 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[HMDWiFiManagementController sharedPSKForNetworkWithSSID:](HMDWiFiManagementController, "sharedPSKForNetworkWithSSID:", v68);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v64)
      {
        objc_initWeak(&location, self);
        -[HMDNetworkRouterClientManager networkRouterAccessory](self, "networkRouterAccessory");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "uuid");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 || a7 != 2)
        {
          contexta = (void *)MEMORY[0x227676638]();
          v51 = self;
          HMFGetOSLogHandle();
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = (id *)(id)objc_claimAutoreleasedReturnValue();
            HMAccessoryWiFiCredentialTypeAsString();
            v53 = (id)objc_claimAutoreleasedReturnValue();
            logDescriptionForAccessory(v65);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v87 = v60;
            v88 = 2112;
            v89 = v53;
            v90 = 2112;
            v91 = v54;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Attempting migration to %@ credential for accessory %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(contexta);
          -[HMDNetworkRouterClientManager accessoriesInReconfiguration](v51, "accessoriesInReconfiguration");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v56);

          context = objc_alloc_init(HMDNetworkRouterCredential);
          if (a7 == 3)
          {
            -[HMDNetworkRouterCredential setPsk:](context, "setPsk:", v64);
          }
          else
          {
            objc_msgSend(v17, "macAddress");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNetworkRouterCredential setMacAddress:](context, "setMacAddress:", v57);

          }
          objc_msgSend(v16, "setCredential:", context);
          objc_msgSend(v16, "setClientIdentifier:", 0);
          -[HMDNetworkRouterClientManager routerController](v51, "routerController");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = MEMORY[0x24BDAC760];
          v70[1] = 3221225472;
          v70[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_46;
          v70[3] = &unk_24E78EBA0;
          v46 = v70;
          v59 = v77;
          objc_copyWeak(v77, &location);
          v71 = v61;
          v76 = v67;
          v72 = v65;
          v77[1] = (id)a7;
          v73[0] = v69;
          v73[1] = v68;
          v74 = v64;
          v75 = v21;
          objc_msgSend(v58, "addClientConfiguration:completion:", v16, v70);

          v66 = &v71;
          v47 = (id *)&v76;
          v48 = &v72;
          v49 = (id *)v73;
          v45 = v74;
        }
        else
        {
          context = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", v21);
          -[HMDNetworkRouterCredential setClientIdentifier:](context, "setClientIdentifier:", v44);

          -[HMDNetworkRouterClientManager routerController](self, "routerController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = MEMORY[0x24BDAC760];
          v78[1] = 3221225472;
          v78[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke;
          v78[3] = &unk_24E78EA90;
          v46 = v78;
          v59 = v83;
          objc_copyWeak(v83, &location);
          v79 = v61;
          v82 = v67;
          v80 = v65;
          v81[0] = v21;
          v81[1] = v16;
          v83[1] = (id)a6;
          v83[2] = (id)2;
          v84 = v31;
          objc_msgSend(v45, "getClientStatusWithIdentifier:completion:", context, v78);
          v66 = &v79;
          v47 = (id *)&v82;
          v48 = &v80;
          v49 = (id *)v81;
        }

        objc_destroyWeak(v59);
        objc_destroyWeak(&location);

      }
      else
      {
LABEL_31:
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v67)[2](v67, v50);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v67)[2](v67, v41);

    }
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (id *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v38;
      v88 = 2112;
      v89 = v39;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Unable to perform Wi-Fi reconfiguration for unreachable accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v18)[2](v18, v40);

  }
LABEL_20:

}

- (void)_getNetworkConfigurationForAccessory:(id)a3 targetProtectionMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  HMDNetworkRouterClientManager *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (a4 == 3)
  {
    objc_msgSend(v8, "networkClientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDNetworkRouterClientConfiguration configurationForOpenProtectionWithClientIdentifier:](HMDNetworkRouterClientConfiguration, "configurationForOpenProtectionWithClientIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *, void *, _QWORD))v9 + 2))(v9, 0, v12, &unk_24E96C590, 0);
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __102__HMDNetworkRouterClientManager__getNetworkConfigurationForAccessory_targetProtectionMode_completion___block_invoke;
    v13[3] = &unk_24E78EBC8;
    v17 = a4;
    v14 = v8;
    v15 = self;
    v16 = v9;
    -[HMDNetworkRouterClientManager _fetchFirewallRulesForAccessory:completion:](self, "_fetchFirewallRulesForAccessory:completion:", v14, v13);

  }
}

- (void)_fetchFirewallRulesForAccessory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterClientManager *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "metadataIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Fetching firewall rules for accessory %@ with identifier %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDNetworkRouterClientManager firewallRuleManager](v11, "firewallRuleManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __76__HMDNetworkRouterClientManager__fetchFirewallRulesForAccessory_completion___block_invoke;
    v20[3] = &unk_24E78EBF0;
    v21 = v6;
    v22 = v9;
    v23 = v7;
    objc_msgSend(v16, "fetchRulesForAccessories:completion:", v17, v20);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch firewall rules due to failure to derive identifier for accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_registerForChangesToManagedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v4);

  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleAccessoryFirmwareVersionUpdated_, CFSTR("HMDAccessoryFirmwareVersionUpdatedNotification"), v4);

}

- (void)_deregisterForChangesToManagedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("HMDAccessoryConnectedNotification"), v4);

  -[HMDNetworkRouterClientManager notificationCenter](self, "notificationCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("HMDAccessoryFirmwareVersionUpdatedNotification"), v4);

}

- (void)_registerForNetworkProtectionChangesToGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNetworkRouterClientManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
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
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for network protection change notification to group %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDNetworkRouterClientManager notificationCenter](v7, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_handleNetworkProtectionGroupProtectionChanged_, CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeUpdated"), v4);

}

- (void)_unregisterForNetworkProtectionChangesToGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNetworkRouterClientManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
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
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering for network protection change notification to group %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDNetworkRouterClientManager notificationCenter](v7, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", v7, CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeUpdated"), v4);

}

- (id)_transactionBlockForAccessoriesWithStaleClientIdentifier
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  HMDNetworkRouterClientManager *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterClientManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 2, 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v24 = self;
  -[HMDNetworkRouterClientManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4;
  objc_msgSend(v6, "transaction:options:", CFSTR("Reset Stale Network Client Identifiers"), v4);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = v5;
  objc_msgSend(v5, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "networkClientIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[HMDNetworkRouterClientManager networkRouterAccessory](v24, "networkRouterAccessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "networkRouterUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if ((v18 & 1) == 0)
          {
            objc_msgSend(v12, "transactionWithObjectChangeType:", 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setNetworkRouterUUID:", 0);
            objc_msgSend(v19, "setNetworkClientIdentifier:", 0);
            objc_msgSend(v19, "setNetworkClientProfileFingerprint:", 0);
            objc_msgSend(v23, "add:", v19);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v23;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  return objc_msgSend(a3, "supportsRouterManagement");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; Home = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (HMDNetworkRouterFirewallRuleManager)firewallRuleManager
{
  return (HMDNetworkRouterFirewallRuleManager *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)managedNetworkEnabled
{
  return self->_managedNetworkEnabled;
}

- (void)setManagedNetworkEnabled:(BOOL)a3
{
  self->_managedNetworkEnabled = a3;
}

- (BOOL)staleClientIdentifiersResetNeeded
{
  return self->_staleClientIdentifiersResetNeeded;
}

- (void)setStaleClientIdentifiersResetNeeded:(BOOL)a3
{
  self->_staleClientIdentifiersResetNeeded = a3;
}

- (BOOL)staleClientIdentifiersResetInProgress
{
  return self->_staleClientIdentifiersResetInProgress;
}

- (void)setStaleClientIdentifiersResetInProgress:(BOOL)a3
{
  self->_staleClientIdentifiersResetInProgress = a3;
}

- (BOOL)startPending
{
  return self->_startPending;
}

- (void)setStartPending:(BOOL)a3
{
  self->_startPending = a3;
}

- (NSMutableSet)accessoriesInReconfiguration
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesInReconfiguration, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_networkRouterAccessory);
}

void __76__HMDNetworkRouterClientManager__fetchFirewallRulesForAccessory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v15 = 138544130;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Fetched firewall rules for accessory %@ with identifier %@ failed with error %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  }
}

void __102__HMDNetworkRouterClientManager__getNetworkConfigurationForAccessory_targetProtectionMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 == 1)
  {
    v28 = v3;
    v10 = -[HMDNetworkRouterHomeKitOnlyFirewallConfiguration initWithAccessory:sourceConfiguration:]([HMDNetworkRouterHomeKitOnlyFirewallConfiguration alloc], "initWithAccessory:sourceConfiguration:", *(_QWORD *)(a1 + 32), v3);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v14;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Using firewall configuration %@ for accessory %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = objc_msgSend(*(id *)(a1 + 32), "needsAirplayAccess");
    objc_msgSend(*(id *)(a1 + 32), "networkClientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:](HMDNetworkRouterClientConfiguration, "configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:", v10, 1, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (v5)
  {
    v29 = v3;
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMAccessoryNetworkProtectionModeAsString();
      v23 = (HMDNetworkRouterHomeKitOnlyFirewallConfiguration *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unexpected target network protection mode %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD))(v24 + 16))(v24, v25, 0, 0, 0);

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v4)
    {
      v27 = v4;
      v7 = objc_msgSend(v6, "needsAirplayAccess");
      objc_msgSend(*(id *)(a1 + 32), "networkClientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:](HMDNetworkRouterClientConfiguration, "configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:", v27, 1, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(v6, "networkClientIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDNetworkRouterClientConfiguration configurationForOpenProtectionWithClientIdentifier:](HMDNetworkRouterClientConfiguration, "configurationForOpenProtectionWithClientIdentifier:", v26);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  char v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 64);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2;
  v12[3] = &unk_24E78EA68;
  v13 = v5;
  v19 = v9;
  v14 = v6;
  v15 = WeakRetained;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 80);
  v21 = *(_BYTE *)(a1 + 96);
  v10 = v6;
  v11 = v5;
  ContinueRouterOperationOnWorkQueue(WeakRetained, v8, v19, v12);

}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24[2];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 80);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2_47;
  v13[3] = &unk_24E78EB78;
  v10 = v5;
  v14 = v10;
  v15 = WeakRetained;
  v16 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 80);
  v11 = v6;
  v12 = *(void **)(a1 + 96);
  v17 = v11;
  v24[1] = v12;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  objc_copyWeak(v24, (id *)(a1 + 88));
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 72);
  ContinueRouterOperationOnWorkQueue(WeakRetained, v8, v9, v13);

  objc_destroyWeak(v24);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2_47(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  HMDWiFiReconfigurationLogEvent *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24[2];
  _QWORD aBlock[4];
  id v26;
  id v27;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "accessoriesInReconfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
  }
  else
  {
    objc_msgSend(v2, "routerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_3;
    aBlock[3] = &unk_24E78EAE0;
    v26 = *(id *)(a1 + 56);
    v8 = v6;
    v27 = v8;
    v9 = _Block_copy(aBlock);
    v10 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
    objc_msgSend(*(id *)(a1 + 40), "networkRouterAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWiFiReconfigurationLogEvent setRouterAccessory:](v10, "setRouterAccessory:", v11);

    -[HMDWiFiReconfigurationLogEvent setCredentialType:](v10, "setCredentialType:", *(_QWORD *)(a1 + 120));
    v12 = *(void **)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 80);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_5;
    v17[3] = &unk_24E78EB50;
    v15 = *(id *)(a1 + 48);
    v16 = *(void **)(a1 + 120);
    v18 = v15;
    v24[1] = v16;
    v19 = *(id *)(a1 + 80);
    objc_copyWeak(v24, (id *)(a1 + 112));
    v20 = *(id *)(a1 + 88);
    v23 = *(id *)(a1 + 104);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 96);
    objc_msgSend(v12, "safelyReconfigureWithSSID:PSK:verificationCallback:logEvent:completion:", v13, v14, v9, v10, v17);

    objc_destroyWeak(v24);
  }
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HMDNetworkRouterClientStatusIdentifier *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = objc_alloc_init(HMDNetworkRouterClientStatusIdentifier);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", *(_QWORD *)(a1 + 32));
  -[HMDNetworkRouterClientStatusIdentifier setClientIdentifier:](v4, "setClientIdentifier:", v5);

  v6 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_4;
  v8[3] = &unk_24E78EAB8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "getClientStatusWithIdentifier:completion:", v4, v8);

}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  if (!v3)
  {
    if (*(_QWORD *)(a1 + 88) == 3)
      v4 = *(_QWORD *)(a1 + 40);
    else
      v4 = 0;
    objc_msgSend(*(id *)(a1 + 32), "saveWiFiUniquePreSharedKey:credentialType:", v4);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v6 = *(void **)(a1 + 72);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_6;
  v10[3] = &unk_24E78EB28;
  v7 = *(void **)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v3;
  v8 = *(_QWORD *)(a1 + 88);
  v13 = WeakRetained;
  v18 = v8;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v9 = v3;
  ContinueRouterOperationOnWorkQueue(WeakRetained, v7, v6, v10);

}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (!*(_QWORD *)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      HMAccessoryWiFiCredentialTypeAsString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Successfully completed migration to %@ credential for accessory %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 56), "saveNetworkClientIdentifier:networkRouterUUID:clearProfileFingerprint:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 0);
    v9 = *(id *)(a1 + 72);

    v2 = v9;
  }
  objc_msgSend(*(id *)(a1 + 48), "routerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeClientConfigurationWithClientIdentifier:completion:", v2, &__block_literal_global_51_185363);

  objc_msgSend(*(id *)(a1 + 48), "accessoriesInReconfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

uint64_t __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = 1;
  else
    v4 = a3 == 0;
  v5 = !v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v5);
}

void __136__HMDNetworkRouterClientManager__migrateAccessory_withConfiguration_clientStatus_fromCredentialType_toCredentialType_rotate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 48), "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), v2, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 80));
    }
    else
    {
      v3 = (void *)MEMORY[0x227676638]();
      v4 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(*(void **)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        v12 = v6;
        v13 = 2112;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Router did not return client status for accessory %@ with client identifier %@ (accessory offline or not connected to router?)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v3);
      v9 = *(_QWORD *)(a1 + 80);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
  }
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *context;
  void *v35;
  void *v36;
  int8x16_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[4];
  char v47;
  _QWORD block[4];
  int8x16_t v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v9 && v10)
  {
    v36 = (void *)objc_msgSend(v11, "integerValue");
    objc_msgSend(v10, "lanIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v14, "integerValue");

    v15 = (id)objc_msgSend(v10, "fingerprint");
    if (*(_BYTE *)(a1 + 72)
      && (objc_msgSend(*(id *)(a1 + 32), "networkClientProfileFingerprint"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "isEqual:", v16),
          v16,
          v17))
    {
      context = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(*(void **)(a1 + 32));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMAccessoryNetworkProtectionModeAsString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v33;
        v54 = 2112;
        v55 = v20;
        v56 = 2112;
        v57 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping network configuration update for accessory %@ with mode %@ - fingerprint matches existing profile", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      if (v36 != (void *)objc_msgSend(*(id *)(a1 + 32), "currentNetworkProtectionMode"))
      {
        v22 = *(void **)(a1 + 32);
        +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:](HMDAccessoryAllowedHost, "allowedHostsFromFirewallRuleConfiguration:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "saveCurrentNetworkProtectionMode:assignedLAN:allowedWANHosts:profileFingerprint:", v36, v35, v23, v15);

      }
      if (*(_BYTE *)(a1 + 73) && *(_QWORD *)(a1 + 64) != 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "workQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_41;
        block[3] = &unk_24E79A910;
        v37 = *(int8x16_t *)(a1 + 32);
        v25 = (id)v37.i64[0];
        v49 = vextq_s8(v37, v37, 8uLL);
        v50 = v10;
        v51 = *(id *)(a1 + 48);
        dispatch_async(v24, block);

      }
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v10, "setClientIdentifier:", v26);

      objc_msgSend(*(id *)(a1 + 40), "networkRouterAccessory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "routerController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_3;
      v38[3] = &unk_24E78EA18;
      objc_copyWeak(v46, (id *)buf);
      v30 = v28;
      v39 = v30;
      v40 = *(id *)(a1 + 32);
      v46[1] = v36;
      v46[2] = v35;
      v41 = v12;
      v42 = v15;
      v31 = *(id *)(a1 + 56);
      v47 = *(_BYTE *)(a1 + 73);
      v32 = *(void **)(a1 + 64);
      v43 = v31;
      v46[3] = v32;
      v44 = v10;
      v45 = *(id *)(a1 + 48);
      objc_msgSend(v29, "updateClientConfiguration:completion:", v44, v38);

      objc_destroyWeak(v46);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_41(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = (void *)a1[6];
  v4 = a1[7];
  objc_msgSend(v3, "credential");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", v2, v3, v4, credentialTypeForCredential(v5), 3, 0, &__block_literal_global_42_185373);

}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  char v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_4;
    v9[3] = &unk_24E78E9F0;
    v9[4] = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v17 = *(_OWORD *)(a1 + 96);
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 64);
    v19 = *(_BYTE *)(a1 + 120);
    v8 = *(_QWORD *)(a1 + 112);
    v14 = v7;
    v18 = v8;
    v15 = *(id *)(a1 + 72);
    v16 = *(id *)(a1 + 80);
    dispatch_async(v6, v9);

  }
}

void __155__HMDNetworkRouterClientManager__updateClientConfiguration_forAccessory_protectionMode_clientStatus_skipIfFingerprintMatches_clientReconfigurationAllowed___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 104);
    v7 = *(void **)(a1 + 48);
    +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:](HMDAccessoryAllowedHost, "allowedHostsFromFirewallRuleConfiguration:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveCurrentNetworkProtectionMode:assignedLAN:allowedWANHosts:profileFingerprint:", v5, v6, v8, *(_QWORD *)(a1 + 64));

    v9 = *(void **)(a1 + 48);
    +[HMDAccessoryNetworkAccessViolation noViolation](HMDAccessoryNetworkAccessViolation, "noViolation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveNetworkAccessViolation:", v10);

    objc_msgSend(*(id *)(a1 + 32), "routerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetAccessViolationForClientIdentifier:completion:", *(_QWORD *)(a1 + 72), &__block_literal_global_43_185371);

    if (*(_BYTE *)(a1 + 120))
    {
      if (*(_QWORD *)(a1 + 112) != 3)
      {
        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 48);
        v15 = *(void **)(a1 + 80);
        v14 = *(_QWORD *)(a1 + 88);
        objc_msgSend(v15, "credential");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", v13, v15, v14, credentialTypeForCredential(v16), 3, 0, &__block_literal_global_44_185372);

      }
    }
  }
}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[2];
  char v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v9)
  {
    objc_msgSend(v10, "setClientIdentifier:", 0);
    objc_msgSend(v10, "setCredential:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "networkRouterAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "routerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    v19[3] = &unk_24E78E940;
    objc_copyWeak(v27, (id *)(a1 + 64));
    v16 = v14;
    v20 = v16;
    v21 = *(id *)(a1 + 48);
    v22 = v11;
    v23 = v10;
    v17 = v12;
    v28 = *(_BYTE *)(a1 + 80);
    v18 = *(void **)(a1 + 72);
    v24 = v17;
    v27[1] = v18;
    v25 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 32);
    objc_msgSend(v15, "addClientConfiguration:completion:", v23, v19);

    objc_destroyWeak(v27);
  }

}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v7 = WeakRetained;
  if (!a2 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_3;
    block[3] = &unk_24E78E918;
    block[4] = v7;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    v21 = *(_BYTE *)(a1 + 104);
    v10 = *(_QWORD *)(a1 + 96);
    v17 = v9;
    v20 = v10;
    v18 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 80);
    dispatch_async(v8, block);

  }
}

void __125__HMDNetworkRouterClientManager__createClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "saveNetworkClientIdentifier:networkRouterUUID:clearProfileFingerprint:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
    v5 = *(void **)(a1 + 48);
    v6 = objc_msgSend(*(id *)(a1 + 64), "integerValue");
    objc_msgSend(*(id *)(a1 + 72), "lanIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:](HMDAccessoryAllowedHost, "allowedHostsFromFirewallRuleConfiguration:", *(_QWORD *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveCurrentNetworkProtectionMode:assignedLAN:allowedWANHosts:profileFingerprint:", v6, v9, v10, objc_msgSend(*(id *)(a1 + 72), "fingerprint"));

    v11 = *(void **)(a1 + 48);
    +[HMDAccessoryNetworkAccessViolation noViolation](HMDAccessoryNetworkAccessViolation, "noViolation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveNetworkAccessViolation:", v12);

    if (*(_BYTE *)(a1 + 112))
    {
      if (*(_QWORD *)(a1 + 104) != 3)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 72), "setClientIdentifier:", v13);

        objc_msgSend(*(id *)(a1 + 32), "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), credentialTypeForCredential(*(void **)(a1 + 96)), 3, 0, &__block_literal_global_185378);
      }
    }
  }
}

void __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    block[3] = &unk_24E78E830;
    block[4] = v3;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(_BYTE *)(a1 + 64);
    dispatch_async(v4, block);

  }
}

uint64_t __126__HMDNetworkRouterClientManager__replaceClientConfigurationForAccessory_credential_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createClientConfigurationForAccessory:credential:clientStatus:clientReconfigurationAllowed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

void __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke_2;
    v5[3] = &unk_24E78E880;
    v5[4] = v3;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(_BYTE *)(a1 + 72);
    dispatch_async(v4, v5);

  }
}

void __161__HMDNetworkRouterClientManager__replaceNetworkClientIdentifierForAccessory_networkClientIdentifier_networkRouterUUID_clientStatus_clientReconfigurationAllowed___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "saveNetworkClientIdentifier:networkRouterUUID:clearProfileFingerprint:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateClientConfiguration:forAccessory:protectionMode:clientStatus:skipIfFingerprintMatches:clientReconfigurationAllowed:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), getProtectionModeForAccessory(*(void **)(a1 + 48)), *(_QWORD *)(a1 + 64), 0, *(unsigned __int8 *)(a1 + 72));
  }
}

void __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        objc_autoreleasePoolPop(v9);
        goto LABEL_9;
      }
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v5;
      v15 = "%{public}@Failed to get client status of accessory %@ with %@: %@";
      v16 = v11;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 42;
    }
    else
    {
      if (v6)
      {
        objc_msgSend(WeakRetained, "workQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke_37;
        block[3] = &unk_24E78E830;
        block[4] = v8;
        v22 = *(id *)(a1 + 32);
        v23 = v6;
        v24 = *(id *)(a1 + 48);
        v25 = *(_BYTE *)(a1 + 64);
        dispatch_async(v19, block);

        goto LABEL_9;
      }
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_6;
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v20;
      v15 = "%{public}@Router did not return client status for accessory %@ with %@ (accessory offline or not connected to router?)";
      v16 = v11;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 32;
    }
    _os_log_impl(&dword_2218F0000, v16, v17, v15, buf, v18);

    goto LABEL_6;
  }
LABEL_9:

}

uint64_t __113__HMDNetworkRouterClientManager__reconcileClientConfigurationForReachableAccessory_clientReconfigurationAllowed___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconcileClientConfigurationForAccessory:clientStatus:networkRouterUUID:clientReconfigurationAllowed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

void __60__HMDNetworkRouterClientManager_handleFirewallRulesUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v20;
  void *v21;
  void *v22;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "protectionMode");
  v4 = (void *)MEMORY[0x227676638]();
  v27 = a1;
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  v26 = v2;
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v27 + 40), "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling firewall rules update notification for home %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(v27 + 40), "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_setForKey:", CFSTR("HMDNotificationNetworkRouterFirewallRulesUpdatedAccessoriesKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v2, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v18, "supportsNetworkProtection", v26))
          {
            objc_msgSend(v18, "metadataIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
              objc_msgSend(v19, "productGroup");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "productNumber");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v20, "initWithProductGroup:productNumber:firmwareVersion:", v21, v22, 0);

              if (!objc_msgSend(v12, "count") || objc_msgSend(v12, "containsObject:", v23))
                objc_msgSend(*(id *)(v27 + 32), "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", v18, 0, 0);

            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring firewall rules update since network protection is disabled for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __68__HMDNetworkRouterClientManager_handleHomeNetworkProtectionChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "protectionMode");
        HMNetworkProtectionModeAsString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138544130;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Network protection for home %@ changed to %@. Network router Accessory: %@", (uint8_t *)&v13, 0x2Au);

      }
      objc_autoreleasePoolPop(v6);
      if (objc_msgSend(v5, "isReachable"))
        objc_msgSend(*(id *)(a1 + 32), "_updateClientConfigurationForAllAccessoriesWithClientReconfigurationAllowed:", 1);

    }
  }
}

void __79__HMDNetworkRouterClientManager_handleNetworkProtectionGroupProtectionChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD4CE8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD4CC8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v5)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "protectionMode");
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v12 == 1)
      {
        if (v16)
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "integerValue");
          HMAccessoryNetworkProtectionModeAsString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v17;
          v35 = 2112;
          v36 = v18;
          v37 = 2112;
          v38 = v5;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating accessory network configurations because protection mode changed to %@ for network protection group %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v11, "networkProtectionGroupRegistry");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accessoriesForGroupWithUUID:", v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v30;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v30 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(a1 + 32), "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25++), 0, 1, (_QWORD)v29);
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v23);
        }

      }
      else
      {
        if (v16)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "integerValue");
          HMAccessoryNetworkProtectionModeAsString();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          HMNetworkProtectionModeAsString();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v34 = v26;
          v35 = 2112;
          v36 = v27;
          v37 = 2112;
          v38 = v5;
          v39 = 2112;
          v40 = v28;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring protection mode change to %@ for network protection group %@ because home network protection is %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
  }
}

void __73__HMDNetworkRouterClientManager_handleNetworkProtectionGroupDeactivated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD4CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_unregisterForNetworkProtectionChangesToGroup:", v6);
    v5 = v6;
  }

}

void __71__HMDNetworkRouterClientManager_handleNetworkProtectionGroupActivated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD4CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_registerForNetworkProtectionChangesToGroup:", v6);
    v5 = v6;
  }

}

void __59__HMDNetworkRouterClientManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "accessoriesInReconfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "containsObject:", v6);

      if (v7)
      {
        v8 = (void *)MEMORY[0x227676638]();
        v9 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          logDescriptionForAccessory(v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v11;
          v15 = 2112;
          v16 = v12;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not reconciling client configuration for accessory %@ -- currently being reconfigured", (uint8_t *)&v13, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_reconcileClientConfigurationForReachableAccessory:clientReconfigurationAllowed:", v4, 0);
      }
    }

  }
}

void __71__HMDNetworkRouterClientManager_handleAccessoryFirmwareVersionUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
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
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    if (v4 && objc_msgSend(v4, "supportsNetworkProtection"))
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v8;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling firmware version update for accessory %@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(*(id *)(a1 + 32), "_updateOrCreateClientConfigurationForAccessory:preferReconcile:clientReconfigurationAllowed:", v4, 0, 1);
    }

  }
}

void __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("HMDAccessoryNotificationKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HMFEqualObjects();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v11;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping client manager due to removal of currently active network router accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "_stop");
    }
    else
    {
      objc_msgSend(v5, "networkClientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v17)
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "networkClientIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          logDescriptionForAccessory(v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v32 = v18;
          v33 = 2112;
          v34 = v19;
          v35 = 2112;
          v36 = v20;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing client configuration with identifier %@ from router for removed accessory %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(*(id *)(a1 + 32), "routerController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "networkClientIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = MEMORY[0x24BDAC760];
        v26 = 3221225472;
        v27 = __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke_30;
        v28 = &unk_24E79BCC8;
        v29 = *(_QWORD *)(a1 + 32);
        v30 = v5;
        objc_msgSend(v21, "removeClientConfigurationWithClientIdentifier:completion:", v22, &v25);

      }
      else
      {
        if (v17)
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          logDescriptionForAccessory(v5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v23;
          v33 = 2112;
          v34 = v24;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@No saved client identifier on removed accessory %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
      }
      objc_msgSend(*(id *)(a1 + 32), "_deregisterForChangesToManagedAccessory:", v5, v25, v26, v27, v28, v29);
    }

  }
}

void __56__HMDNetworkRouterClientManager_handleAccessoryRemoved___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "networkClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Remove client configuration with identifier %@ completed with error %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __54__HMDNetworkRouterClientManager_handleAccessoryAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("HMDNotificationAddedAccessoryKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "supportsNetworkProtection"))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2112;
        v17 = v8;
        v9 = "%{public}@Will manage new accessory %@ because it supports network protection";
LABEL_8:
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v3, "wiFiUniquePreSharedKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          logDescriptionForAccessory(v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v12;
          v16 = 2112;
          v17 = v13;
          _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Will not manage new accessory %@", (uint8_t *)&v14, 0x16u);

        }
        objc_autoreleasePoolPop(v4);
        goto LABEL_10;
      }
      if (v11)
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2112;
        v17 = v8;
        v9 = "%{public}@Will manage new accessory %@ because it has a per-accessory credential";
        goto LABEL_8;
      }
    }

    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_startManagingAccessory:initialHomeSetup:", v3, 0);
LABEL_10:

  }
}

void __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      logDescriptionForAccessory(*(void **)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Managed network enable for network router accessory %@ completed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke_29;
    block[3] = &unk_24E799CF0;
    block[4] = v6;
    v13 = *(_BYTE *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

  }
}

void __65__HMDNetworkRouterClientManager__handleRouterAccessoryReachable___block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "setManagedNetworkEnabled:", 1);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = (void *)MEMORY[0x227676638](v2);
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Initial Home-level protection setup is required", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "setActiveNetworkRouterInitialSetupNeeded:", 0);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "home", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (shouldManageAccessory(v13))
          objc_msgSend(*(id *)(a1 + 32), "_startManagingAccessory:initialHomeSetup:", v13, *(unsigned __int8 *)(a1 + 48));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

void __64__HMDNetworkRouterClientManager_handleRouterAccessoryReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 40), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v5 = v3;

    v4 = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleRouterAccessoryReachable:", v5);
      v4 = v5;
    }

  }
}

void __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke_2;
    block[3] = &unk_24E79C240;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __72__HMDNetworkRouterClientManager__resetStaleClientIdentifiersBeforeStart__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t result;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setStaleClientIdentifiersResetInProgress:", 0));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "staleClientIdentifiersResetNeeded");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startPending");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting stale network client identifiers completed for home %@, staleClientIdentifiersResetNeeded = %@, startPending = %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  v10 = objc_msgSend(*(id *)(a1 + 32), "staleClientIdentifiersResetNeeded");
  v11 = *(void **)(a1 + 32);
  if (v10)
    return objc_msgSend(v11, "_resetStaleClientIdentifiersBeforeStart");
  result = objc_msgSend(v11, "startPending");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_start");
  return result;
}

void __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t ProtectionModeForAccessory;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "networkClientIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      ProtectionModeForAccessory = getProtectionModeForAccessory(*(void **)(a1 + 40));
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_10;
      v21[3] = &unk_24E78E7B8;
      v6 = *(id *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v24 = v6;
      v21[4] = v7;
      v22 = v2;
      v8 = *(id *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 56);
      v23 = v8;
      v25 = v9;
      v26 = *(_BYTE *)(a1 + 64);
      objc_msgSend(v4, "_getNetworkConfigurationForAccessory:targetProtectionMode:completion:", v5, ProtectionModeForAccessory, v21);

      v10 = v24;
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Migration not possible, accessory has no existing client profile", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      v20 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v10);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Migration not possible, client manager is not running", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v2);
  }

}

void __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_2;
    block[3] = &unk_24E78E790;
    v13 = v5;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v9 = *(id *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v16 = v9;
    v18 = v10;
    v19 = *(_BYTE *)(a1 + 72);
    v17 = v11;
    dispatch_async(v6, block);

  }
}

uint64_t __85__HMDNetworkRouterClientManager_migrateAccessory_toCredentialType_rotate_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setClientIdentifier:", v2);

  return objc_msgSend(*(id *)(a1 + 48), "_migrateAccessory:withConfiguration:clientStatus:fromCredentialType:toCredentialType:rotate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 56), "wiFiCredentialType"), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64));
}

void __69__HMDNetworkRouterClientManager_replaceActiveNetworkRouterAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMFEqualObjects() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_evaluateManagement");
  }
  else
  {
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "home");

    }
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_stop");
      objc_msgSend(*(id *)(a1 + 32), "setNetworkRouterAccessory:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "setManagedNetworkEnabled:", 0);
      if (objc_msgSend(*(id *)(a1 + 32), "staleClientIdentifiersResetInProgress"))
        objc_msgSend(*(id *)(a1 + 32), "setStaleClientIdentifiersResetNeeded:", 1);
      v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "_evaluateManagement"));
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(*(void **)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        logDescriptionForAccessory(v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Activated network router accessory %@ - previous active network router accessory was %@", (uint8_t *)&v13, 0x20u);

      }
    }
    else
    {
      v4 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to activate a nil network router accessory", (uint8_t *)&v13, 0xCu);

      }
    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __37__HMDNetworkRouterClientManager_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

uint64_t __51__HMDNetworkRouterClientManager_evaluateManagement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateManagement");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t79 != -1)
    dispatch_once(&logCategory__hmf_once_t79, &__block_literal_global_68_185442);
  return (id)logCategory__hmf_once_v80;
}

void __44__HMDNetworkRouterClientManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v80;
  logCategory__hmf_once_v80 = v0;

}

@end
