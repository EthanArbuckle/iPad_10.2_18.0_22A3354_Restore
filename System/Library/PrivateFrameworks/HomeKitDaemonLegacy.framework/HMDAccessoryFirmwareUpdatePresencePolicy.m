@implementation HMDAccessoryFirmwareUpdatePresencePolicy

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[HMDAccessoryFirmwareUpdatePresencePolicy home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5 ^ -[HMDAccessoryFirmwareUpdatePresencePolicy presenceNeeded](self, "presenceNeeded");
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryFirmwareUpdatePresencePolicy *v4;
  HMDAccessoryFirmwareUpdatePresencePolicy *v5;
  HMDAccessoryFirmwareUpdatePresencePolicy *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v18;
  void *v19;

  v4 = (HMDAccessoryFirmwareUpdatePresencePolicy *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessoryFirmwareUpdatePresencePolicy home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdatePresencePolicy home](v6, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v10))
      {
        -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdatePolicy accessory](v6, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v19 = v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v12, "isEqual:", v14);

        if (v18)
        {
          v15 = -[HMDAccessoryFirmwareUpdatePresencePolicy presenceNeeded](self, "presenceNeeded");
          v16 = v15 ^ -[HMDAccessoryFirmwareUpdatePresencePolicy presenceNeeded](v6, "presenceNeeded") ^ 1;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    LOBYTE(v16) = 0;
    goto LABEL_12;
  }
  LOBYTE(v16) = 1;
LABEL_13:

  return v16;
}

- (HMDAccessoryFirmwareUpdatePresencePolicy)initWithAccessory:(id)a3 presenceNeeded:(BOOL)a4 workQueue:(id)a5
{
  id v8;
  HMDAccessoryFirmwareUpdatePresencePolicy *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryFirmwareUpdatePresencePolicy;
  v9 = -[HMDAccessoryFirmwareUpdatePolicy initWithAccessory:workQueue:](&v12, sel_initWithAccessory_workQueue_, v8, a5);
  if (v9)
  {
    objc_msgSend(v8, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_home, v10);

    v9->_presenceNeeded = a4;
  }

  return v9;
}

- (void)configure
{
  -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", -[HMDAccessoryFirmwareUpdatePresencePolicy evaluate](self, "evaluate"));
  -[HMDAccessoryFirmwareUpdatePresencePolicy registerForNotifications](self, "registerForNotifications");
}

- (void)registerForNotifications
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDAccessoryFirmwareUpdatePresencePolicy home](self, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isCurrentDeviceAvailableResident");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v7, "presenceMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handlePresenceChange_, CFSTR("HMDHomePresenceEvaluatedNotification"), v6);

  }
  else
  {
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handlePresenceChange_, CFSTR("HMDHomeDidArriveHomeNotificationKey"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handlePresenceChange_, CFSTR("HMDHomeDidLeaveHomeNotificationKey"), v7);
  }

}

- (void)handlePresenceChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdatePolicy workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDAccessoryFirmwareUpdatePresencePolicy_handlePresenceChange___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMDAccessoryFirmwareUpdatePresencePolicy *v8;
  NSObject *v9;
  void *v10;
  HMDAccessoryFirmwareUpdatePresencePolicy *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDAccessoryFirmwareUpdatePresencePolicy *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  HMDAccessoryFirmwareUpdatePresencePolicy *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  HMDAccessoryFirmwareUpdatePresencePolicy *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAccessoryFirmwareUpdatePresencePolicy *v32;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdatePresencePolicy home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDAccessoryFirmwareUpdatePresencePolicy presenceNeeded](self, "presenceNeeded"))
  {
    if ((objc_msgSend(v3, "isCurrentDeviceAvailableResident") & 1) != 0)
    {
      objc_msgSend(v3, "presenceMonitor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentHomePresence");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = objc_msgSend(v5, "isAnyUserAtHome");
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        goto LABEL_37;
      }
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v27;
        v28 = "%{public}@Resident, user presence info not available; policy status:NO";
LABEL_35:
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v28, (uint8_t *)&v34, 0xCu);

        goto LABEL_36;
      }
      goto LABEL_36;
    }
    objc_msgSend(v3, "presenceFeeder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "presenceRegionStatus");

    if (v15)
    {
      if (v15 != 2)
      {
        if (v15 == 1)
        {
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = self;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543362;
            v35 = v19;
            v20 = "%{public}@Non-resident - at home, policy status(AnyUserAtHome):YES";
LABEL_18:
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v34, 0xCu);

            goto LABEL_19;
          }
          goto LABEL_19;
        }
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "presenceFeeder");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "presenceRegionStatus"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v24;
          v36 = 2112;
          v37 = v31;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Non-resident - shouldn't be here; region status:%@, policy status(AnyUserAtHome):NO",
            (uint8_t *)&v34,
            0x16u);

          goto LABEL_29;
        }
LABEL_30:

        objc_autoreleasePoolPop(v21);
        v6 = 0;
        goto LABEL_38;
      }
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v24;
      v25 = "%{public}@Non-resident - not at home, policy status(AnyUserAtHome):NO";
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v24;
      v25 = "%{public}@Non-resident - location unknown, policy status(AnyUserAtHome):NO";
    }
LABEL_28:
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v34, 0xCu);
LABEL_29:

    goto LABEL_30;
  }
  if ((objc_msgSend(v3, "isResidentSupported") & 1) != 0)
  {
    if ((objc_msgSend(v3, "isCurrentDeviceAvailableResident") & 1) != 0)
    {
      objc_msgSend(v3, "presenceMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentHomePresence");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = objc_msgSend(v5, "isNoUserAtHome");
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
LABEL_10:
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v12;
          v36 = 2112;
          v37 = v13;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident, policy status evaluated to %@", (uint8_t *)&v34, 0x16u);

        }
LABEL_37:

        objc_autoreleasePoolPop(v7);
        goto LABEL_38;
      }
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v27;
        v28 = "%{public}@Resident, user presence info not available, policy status:NO";
        goto LABEL_35;
      }
LABEL_36:
      v6 = 0;
      goto LABEL_37;
    }
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_30;
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v24;
    v25 = "%{public}@Non-resident, policy status(NoUserAtHome):NO";
    goto LABEL_28;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v19;
    v20 = "%{public}@Resident not supported, policy status(NoUserAtHome):YES";
    goto LABEL_18;
  }
LABEL_19:

  objc_autoreleasePoolPop(v16);
  v6 = 1;
LABEL_38:

  return v6;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (BOOL)presenceNeeded
{
  return self->_presenceNeeded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __65__HMDAccessoryFirmwareUpdatePresencePolicy_handlePresenceChange___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Presence has changed, updating policy status", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "evaluateAndNotify");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_104999 != -1)
    dispatch_once(&logCategory__hmf_once_t0_104999, &__block_literal_global_105000);
  return (id)logCategory__hmf_once_v1_105001;
}

void __55__HMDAccessoryFirmwareUpdatePresencePolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_105001;
  logCategory__hmf_once_v1_105001 = v0;

}

@end
