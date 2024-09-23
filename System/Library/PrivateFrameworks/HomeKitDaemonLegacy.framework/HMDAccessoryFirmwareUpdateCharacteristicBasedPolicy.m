@implementation HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy

- (HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy)initWithAccessory:(id)a3 serviceType:(id)a4 characteristicType:(id)a5 debounceDuration:(unint64_t)a6 policyHandler:(id)a7 workQueue:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v18;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v19;
  void *v20;
  id policyHandler;
  objc_super v23;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy;
  v18 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:](&v23, sel_initWithAccessory_workQueue_, a3, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceType, a4);
    objc_storeStrong((id *)&v19->_characteristicType, a5);
    v19->_debounceDuration = a6;
    v20 = _Block_copy(v17);
    policyHandler = v19->_policyHandler;
    v19->_policyHandler = v20;

  }
  return v19;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy registerForNotifications](self, "registerForNotifications");
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNotificationEnabled:forClientIdentifier:", 1, CFSTR("com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"));

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v6, CFSTR("com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"));

  if (-[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy evaluate](self, "evaluate"))
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy _startDebounceTimer](self, "_startDebounceTimer");
  -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", 0);
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
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v4;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v5;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdatePolicy accessory](v6, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
      goto LABEL_9;
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy serviceType](self, "serviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy serviceType](v6, "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristicType](self, "characteristicType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristicType](v6, "characteristicType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

    }
    else
    {
LABEL_9:
      v15 = 0;
    }

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristic](self, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deregisterNotificationForClientIdentifier:", CFSTR("com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"));

    if (v5)
    {
      -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristic](self, "characteristic");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v7, CFSTR("com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"));

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Accessory has been removed - bail out from dealloc", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy;
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy dealloc](&v12, sel_dealloc);
}

- (HMDCharacteristic)characteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristicType](self, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy serviceType](self, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findCharacteristicType:forServiceType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDCharacteristic *)v6;
}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCharacteristicValuesChanged_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);

}

- (BOOL)evaluate
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy _policyStatusFromCharacteristic:](self, "_policyStatusFromCharacteristic:", v3);

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  return v4;
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_policyStatusFromCharacteristic:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy policyHandler](self, "policyHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy policyHandler](self, "policyHandler");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  _BOOL8 v6;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceTimer](self, "debounceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy evaluate](self, "evaluate");
    -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy _stopDebounceTimer](self, "_stopDebounceTimer");
    if (v6 != -[HMDAccessoryFirmwareUpdatePolicy status](self, "status"))
    {
      -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", v6);
      -[HMDAccessoryFirmwareUpdatePolicy notify:](self, "notify:", v6);
    }
  }
}

- (void)_startDebounceTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, (double)-[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceDuration](self, "debounceDuration"));
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy setDebounceTimer:](self, "setDebounceTimer:", v3);

  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceTimer](self, "debounceTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceTimer](self, "debounceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegateQueue:", v5);

  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceTimer](self, "debounceTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)_stopDebounceTimer
{
  void *v3;

  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceTimer](self, "debounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy setDebounceTimer:](self, "setDebounceTimer:", 0);
}

- (HMFTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_debounceTimer, a3);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)characteristicType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)policyHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)debounceDuration
{
  return self->_debounceDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_policyHandler, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
}

void __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received characteristic values changed notification", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke_10;
  v16[3] = &unk_1E89BF8D0;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "na_firstObjectPassingTest:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_policyStatusFromCharacteristic:", v8);
    v10 = objc_msgSend(*(id *)(a1 + 32), "status");
    v11 = *(void **)(a1 + 32);
    if (v9 == v10)
    {
      objc_msgSend(v11, "debounceTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isRunning");

      if (v15)
        objc_msgSend(*(id *)(a1 + 32), "_stopDebounceTimer");
    }
    else if (v9)
    {
      objc_msgSend(v11, "debounceTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRunning");

      if ((v13 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimer");
    }
    else
    {
      objc_msgSend(v11, "setStatus:", 0);
      objc_msgSend(*(id *)(a1 + 32), "notify:", 0);
    }
  }

}

uint64_t __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "characteristicType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "serviceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_84361 != -1)
    dispatch_once(&logCategory__hmf_once_t0_84361, &__block_literal_global_84362);
  return (id)logCategory__hmf_once_v1_84363;
}

void __66__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_84363;
  logCategory__hmf_once_v1_84363 = v0;

}

@end
