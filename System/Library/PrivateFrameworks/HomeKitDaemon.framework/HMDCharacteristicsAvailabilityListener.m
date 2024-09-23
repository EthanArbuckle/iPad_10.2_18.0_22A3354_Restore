@implementation HMDCharacteristicsAvailabilityListener

- (HMDCharacteristicsAvailabilityListener)initWithAccessory:(id)a3 workQueue:(id)a4 interestedCharacteristicTypesByServiceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCharacteristicsAvailabilityListener *v11;
  HMDCharacteristicsAvailabilityListener *v12;
  HMDNotificationRegistration *v13;
  HMDNotificationRegistration *notificationRegistration;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *logIdentifier;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDCharacteristicsAvailabilityListener;
  v11 = -[HMDCharacteristicsAvailabilityListener init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeWeak((id *)&v12->_accessory, v8);
    v13 = -[HMDNotificationRegistration initWithRegisterer:]([HMDNotificationRegistration alloc], "initWithRegisterer:", v12);
    notificationRegistration = v12->_notificationRegistration;
    v12->_notificationRegistration = v13;

    objc_storeStrong((id *)&v12->_interestedCharacteristicTypesByServiceType, a5);
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@/%@"), v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    logIdentifier = v12->_logIdentifier;
    v12->_logIdentifier = (NSString *)v21;

  }
  return v12;
}

- (void)start
{
  NSObject *v3;

  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCharacteristicsAvailabilityListener _registerForNotifications](self, "_registerForNotifications");
  -[HMDCharacteristicsAvailabilityListener _notifyDelegate](self, "_notifyDelegate");
}

- (void)_registerForNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCharacteristicsAvailabilityListener accessory](self, "accessory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicsAvailabilityListener notificationRegistration](self, "notificationRegistration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:name:object:", sel_handleServicesUpdated_, CFSTR("kHMDNotificationServicesUpdated"), v6);

  -[HMDCharacteristicsAvailabilityListener notificationRegistration](self, "notificationRegistration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:name:object:", sel_handleCharacteristicsUpdated_, CFSTR("kHMDNotificationCharacteristicsUpdated"), v6);

}

- (id)_accessoryCharacteristicsToObserve
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id obj;
  HMDCharacteristicsAvailabilityListener *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self;
  -[HMDCharacteristicsAvailabilityListener accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        -[HMDCharacteristicsAvailabilityListener interestedCharacteristicTypesByServiceType](v24, "interestedCharacteristicTypesByServiceType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serviceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hmf_setForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v11, "findCharacteristicWithType:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v4, "addObject:", v20);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v17);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  v21 = (void *)objc_msgSend(v4, "copy");
  return v21;
}

- (void)_notifyDelegate
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMDCharacteristicsAvailabilityListener *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCharacteristicsAvailabilityListener _accessoryCharacteristicsToObserve](self, "_accessoryCharacteristicsToObserve");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicsAvailabilityListener availableCharacteristics](self, "availableCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638](-[HMDCharacteristicsAvailabilityListener setAvailableCharacteristics:](self, "setAvailableCharacteristics:", v4));
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of characteristics update: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCharacteristicsAvailabilityListener delegate](v8, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCharacteristicsAvailabilityListener availableCharacteristics](v8, "availableCharacteristics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "listener:didUpdateAvailableCharacteristics:", v8, v12);

  }
}

- (void)handleCharacteristicsUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDCharacteristicsAvailabilityListener_handleCharacteristicsUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleServicesUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCharacteristicsAvailabilityListener workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDCharacteristicsAvailabilityListener_handleServicesUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSDictionary)interestedCharacteristicTypesByServiceType
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCharacteristicsAvailabilityListenerDelegate)delegate
{
  return (HMDCharacteristicsAvailabilityListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDNotificationRegistration)notificationRegistration
{
  return (HMDNotificationRegistration *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interestedCharacteristicTypesByServiceType, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
}

uint64_t __64__HMDCharacteristicsAvailabilityListener_handleServicesUpdated___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Services updated", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegate");
}

uint64_t __71__HMDCharacteristicsAvailabilityListener_handleCharacteristicsUpdated___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Characteristics updated", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_255046 != -1)
    dispatch_once(&logCategory__hmf_once_t3_255046, &__block_literal_global_255047);
  return (id)logCategory__hmf_once_v4_255048;
}

void __53__HMDCharacteristicsAvailabilityListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_255048;
  logCategory__hmf_once_v4_255048 = v0;

}

@end
