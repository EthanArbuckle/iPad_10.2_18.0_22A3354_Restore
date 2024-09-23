@implementation HMDDoorbellPressTracker

- (HMDDoorbellPressTracker)initWithWorkQueue:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  HMDDoorbellPressTracker *v9;
  HMDDoorbellPressTracker *v10;
  uint64_t v11;
  NSMutableDictionary *dateOfLastDoorbellPressByAccessoryUUID;
  uint64_t v13;
  NSMutableDictionary *registrationsByAccessoryUUID;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDDoorbellPressTracker;
  v9 = -[HMDDoorbellPressTracker init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    objc_storeStrong((id *)&v10->_workQueue, a3);
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    dateOfLastDoorbellPressByAccessoryUUID = v10->_dateOfLastDoorbellPressByAccessoryUUID;
    v10->_dateOfLastDoorbellPressByAccessoryUUID = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    registrationsByAccessoryUUID = v10->_registrationsByAccessoryUUID;
    v10->_registrationsByAccessoryUUID = (NSMutableDictionary *)v13;

  }
  return v10;
}

- (void)startTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDoorbellPressTracker *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDoorbellPressTracker *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "findCharacteristicType:forServiceType:", *MEMORY[0x24BDD58F0], *MEMORY[0x24BDD6BA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDDoorbellPressTracker registrationsByAccessoryUUID](self, "registrationsByAccessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = v15;
        v33 = 2112;
        v34 = v16;
        v35 = 2112;
        v36 = v17;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Already tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellPressTracker registrationsByAccessoryUUID](self, "registrationsByAccessoryUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v11, v25);

      -[HMDDoorbellPressTracker notificationCenter](self, "notificationCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_handleCharacteristicsValueUpdatedNotification_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v6);

      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = v27;
        v33 = 2112;
        v34 = v28;
        v35 = 2112;
        v36 = v29;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Started tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "addObject:", v7);

    os_unfair_lock_unlock(lock);
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
      objc_msgSend(v6, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory: %@/%@ is not a doorbell", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)stopTrackingPressesForDoorbellAccessory:(id)a3 registration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDoorbellPressTracker *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDDoorbellPressTracker *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  HMDDoorbellPressTracker *v26;
  id v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  -[HMDDoorbellPressTracker registrationsByAccessoryUUID](self, "registrationsByAccessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v27;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@No existing registrations found for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);

    }
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v10, "removeObject:", v7));
  v12 = self;
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Stopped tracking presses for doorbell accessory: %@/%@ registration: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  if (!objc_msgSend(v10, "count"))
  {
    -[HMDDoorbellPressTracker notificationCenter](v12, "notificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", v12, CFSTR("HMDNotificationCharacteristicValueUpdated"), v6);

    -[HMDDoorbellPressTracker registrationsByAccessoryUUID](v12, "registrationsByAccessoryUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v19);

    v20 = (void *)MEMORY[0x227676638]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@No more registrations for doorbell accessory: %@/%@", buf, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v20);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)doorbellPressInDateInterval:(id)a3 doorbellAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDoorbellPressTracker *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  -[HMDDoorbellPressTracker dateOfLastDoorbellPressByAccessoryUUID](self, "dateOfLastDoorbellPressByAccessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v14;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Date of last doorbell press: %@ for doorbell accessory: %@/%@", (uint8_t *)&v19, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
    v17 = objc_msgSend(v6, "containsDate:", v10);
  else
    v17 = 0;

  return v17;
}

- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDDoorbellPressTracker *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *context;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDoorbellPressTracker workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "na_filter:", &__block_literal_global_150245);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDoorbellPressTracker dateOfLastDoorbellPressByAccessoryUUID](self, "dateOfLastDoorbellPressByAccessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    os_unfair_lock_unlock(&self->_lock);
    context = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellPressTracker dateOfLastDoorbellPressByAccessoryUUID](v16, "dateOfLastDoorbellPressByAccessoryUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v22;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updated date of last doorbell press to: %@ for doorbell: %@/%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(context);

  }
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDoorbellPressTracker workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__HMDDoorbellPressTracker_handleCharacteristicsValueUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)dateOfLastDoorbellPressByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDateOfLastDoorbellPressByAccessoryUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)registrationsByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegistrationsByAccessoryUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationsByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_dateOfLastDoorbellPressByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

uint64_t __73__HMDDoorbellPressTracker_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCharacteristicsValueUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__HMDDoorbellPressTracker__handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD58F0]))
  {
    objc_msgSend(v2, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD6BA0]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_150262 != -1)
    dispatch_once(&logCategory__hmf_once_t13_150262, &__block_literal_global_7_150263);
  return (id)logCategory__hmf_once_v14_150264;
}

void __38__HMDDoorbellPressTracker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_150264;
  logCategory__hmf_once_v14_150264 = v0;

}

@end
