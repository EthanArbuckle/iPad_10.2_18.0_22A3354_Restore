@implementation HMDHAPAccessoryConnectionCoordinator

- (HMDHAPAccessoryConnectionCoordinator)initWithHome:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryConnectionCoordinator *v8;
  HMDHAPAccessoryConnectionCoordinator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHAPAccessoryConnectionCoordinator;
  v8 = -[HMDHAPAccessoryConnectionCoordinator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)configureWithIsResidentCapable:(BOOL)a3
{
  _BOOL4 v3;
  HMDHAPAccessoryConnectionCoordinator *v4;
  SEL v5;
  const char *v6;
  id Property;
  const char *v8;
  SEL v9;
  id v10;
  const char *v11;
  id v12;
  char *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id WeakRetained;

  v3 = a3;
  v4 = self;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    self = (HMDHAPAccessoryConnectionCoordinator *)objc_getProperty(v4, v5, 24, 1);
  }
  else
  {
    WeakRetained = 0;
  }
  -[HMDHAPAccessoryConnectionCoordinator addObserver:selector:name:object:](self, "addObserver:selector:name:object:", v4, sel_handleResidentStatusChanged_, CFSTR("HMDResidentDeviceEnabledStateChangedNotification"), 0);
  if (v4)
    Property = objc_getProperty(v4, v6, 24, 1);
  else
    Property = 0;
  objc_msgSend(Property, "addObserver:selector:name:object:", v4, sel_handleResidentAddRemove_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);
  if (v4)
  {
    objc_msgSend(objc_getProperty(v4, v8, 24, 1), "addObserver:selector:name:object:", v4, sel_handleResidentAddRemove_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);
    v10 = objc_getProperty(v4, v9, 24, 1);
  }
  else
  {
    objc_msgSend(0, "addObserver:selector:name:object:", 0, sel_handleResidentAddRemove_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);
    v10 = 0;
  }
  objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel_handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification_, CFSTR("HMDHomeIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification"), WeakRetained);
  if (v3)
  {
    if (v4)
      v12 = objc_getProperty(v4, v11, 24, 1);
    else
      v12 = 0;
    v13 = sel_handlePrimaryResidentChanged_;
    v14 = v12;
    objc_msgSend(WeakRetained, "residentDeviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification");
  }
  else
  {
    if (v4)
      v17 = objc_getProperty(v4, v11, 24, 1);
    else
      v17 = 0;
    v13 = sel_handleResidentUpdated_;
    v14 = v17;
    objc_msgSend(WeakRetained, "residentDeviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("HMDResidentDeviceManagerUpdateResidentNotification");
  }
  objc_msgSend(v14, "addObserver:selector:name:object:", v4, v13, v16, v15);

  -[HMDHAPAccessoryConnectionCoordinator evaluateAccessoryConnectionStatus](v4, "evaluateAccessoryConnectionStatus");
}

- (void)handleResidentStatusChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (objc_msgSend(v6, "isCurrentDevice"))
    {
      -[HMDHAPAccessoryConnectionCoordinator handleCurrentResidentChanged:](self, "handleCurrentResidentChanged:", v6);
      goto LABEL_11;
    }
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_home);
      goto LABEL_9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  WeakRetained = 0;
LABEL_9:
  v8 = objc_msgSend(WeakRetained, "isCurrentDeviceAvailableResident");

  if ((v8 & 1) == 0)
    -[HMDHAPAccessoryConnectionCoordinator handleResidentChangedOnNonResident](self, "handleResidentChangedOnNonResident");
LABEL_11:

}

- (void)handleResidentAddRemove:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if (objc_msgSend(v7, "isCurrentDevice"))
    {
      -[HMDHAPAccessoryConnectionCoordinator handleCurrentResidentChanged:](self, "handleCurrentResidentChanged:", v7);
      goto LABEL_11;
    }
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_home);
      goto LABEL_9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  WeakRetained = 0;
LABEL_9:
  v9 = objc_msgSend(WeakRetained, "isCurrentDeviceAvailableResident");

  if ((v9 & 1) == 0)
    -[HMDHAPAccessoryConnectionCoordinator handleResidentChangedOnNonResident](self, "handleResidentChangedOnNonResident");
LABEL_11:

}

- (void)handleResidentUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  HMDHAPAccessoryConnectionCoordinator *v8;
  SEL v9;
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDHAPAccessoryConnectionCoordinator handleResidentChangedOnNonResident](self, "handleResidentChangedOnNonResident");

  }
  else
  {
    v8 = (HMDHAPAccessoryConnectionCoordinator *)_HMFPreconditionFailure();
    -[HMDHAPAccessoryConnectionCoordinator handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification:](v8, v9, v10);
  }
}

- (void)handleIsResidentFirstAccessoryCommunicationEnabledDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  HMDHAPAccessoryConnectionCoordinator *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Home changed resident first accessory communication enablement", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHAPAccessoryConnectionCoordinator evaluateAccessoryConnectionStatus](v6, "evaluateAccessoryConnectionStatus");

}

- (void)handleCurrentResidentChanged:(id)a3
{
  id v4;
  void *v5;
  HMDHAPAccessoryConnectionCoordinator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isEnabled");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      WeakRetained = objc_loadWeakRetained((id *)&v6->_home);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Current device resident enable = %@, isPrimary = %@, evaluate connection status with accessories", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHAPAccessoryConnectionCoordinator evaluateAccessoryConnectionStatus](v6, "evaluateAccessoryConnectionStatus");

}

- (void)handleResidentChangedOnNonResident
{
  void *v3;
  HMDHAPAccessoryConnectionCoordinator *v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      WeakRetained = objc_loadWeakRetained((id *)&v4->_home);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v9 = objc_loadWeakRetained((id *)&v4->_home);
    else
      v9 = 0;
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@A resident device was updated for home %@(%@), evaluating current non-resident device connection status with accessories", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHAPAccessoryConnectionCoordinator evaluateAccessoryConnectionStatus](v4, "evaluateAccessoryConnectionStatus");
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4;
  void *v5;
  HMDHAPAccessoryConnectionCoordinator *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed, evaluating connection status with accessories", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHAPAccessoryConnectionCoordinator evaluateAccessoryConnectionStatus](v6, "evaluateAccessoryConnectionStatus");

}

- (void)evaluateAccessoryConnectionStatus
{
  id WeakRetained;
  void *v4;
  HMDHAPAccessoryConnectionCoordinator *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  else
    WeakRetained = 0;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "isCurrentDeviceAvailableResident");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hasAnyResident");
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Evaluating connection status for all accessories using - isCurrentDevicePrimaryResident = %{public}@, isCurrentDeviceAvailableResident = %{public}@, hasAnyResident = %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(WeakRetained, "hapAccessories", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "checkHAPSessionRestore");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  if ((objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident") & 1) != 0)
    -[HMDHAPAccessoryConnectionCoordinator _disableDisconnectOnIdleWithAccessoriesAndConnect:](v5, "_disableDisconnectOnIdleWithAccessoriesAndConnect:", objc_msgSend(WeakRetained, "isCurrentDevicePrimaryResident"));
  else
    -[HMDHAPAccessoryConnectionCoordinator _enableDisconnectOnIdleWithAccessories](v5, "_enableDisconnectOnIdleWithAccessories");

}

- (void)_disableDisconnectOnIdleWithAccessoriesAndConnect:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  HMDHAPAccessoryConnectionCoordinator *v14;
  NSObject *v15;
  void *v16;
  id v17;
  os_unfair_lock_t lock;
  HMDHAPAccessoryConnectionCoordinator *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  else
    WeakRetained = 0;
  v19 = self;
  v20 = WeakRetained;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(WeakRetained, "hapAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldDisconnectOnIdle"))
          objc_msgSend(v10, "setShouldDisconnectOnIdle:", 0);
        if (v3)
        {
          objc_msgSend(v10, "bridge");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (v12)
          {
            v13 = (void *)MEMORY[0x227676638]();
            v14 = v19;
            HMFGetOSLogHandle();
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v16;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Triggering evaluation of HAP servers", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v13);
            *(_QWORD *)buf = 0;
            v17 = (id)objc_msgSend(v10, "preferredHAPAccessoryForOperation:linkType:", 10, buf);
            objc_msgSend(v20, "retrieveHAPAccessoryForHMDAccessory:linkType:forceRetrieve:queue:completion:", v10, *(_QWORD *)buf, 0, 0, 0);
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_enableDisconnectOnIdleWithAccessories
{
  id *p_isa;
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  p_isa = (id *)&self->super.isa;
  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (p_isa)
    p_isa = (id *)objc_loadWeakRetained(p_isa + 2);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(p_isa, "hapAccessories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((shouldDisconnectOnIdleForAccessory(v8) & 1) != 0 && (objc_msgSend(v8, "shouldDisconnectOnIdle") & 1) == 0)
          objc_msgSend(v8, "setShouldDisconnectOnIdle:", 1);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)logIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_40217 != -1)
    dispatch_once(&logCategory__hmf_once_t11_40217, &__block_literal_global_40218);
  return (id)logCategory__hmf_once_v12_40219;
}

void __51__HMDHAPAccessoryConnectionCoordinator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_40219;
  logCategory__hmf_once_v12_40219 = v0;

}

@end
