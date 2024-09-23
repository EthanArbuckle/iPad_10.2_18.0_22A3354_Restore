@implementation HMDAccessoryFirmwareUpdatePolicy

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdatePolicy accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAccessoryFirmwareUpdatePolicy)initWithAccessory:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryFirmwareUpdatePolicy *v8;
  HMDAccessoryFirmwareUpdatePolicy *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryFirmwareUpdatePolicy;
  v8 = -[HMDAccessoryFirmwareUpdatePolicy init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (void)configure
{
  -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", 1);
}

- (void)evaluateAndNotify
{
  _BOOL8 v3;

  v3 = -[HMDAccessoryFirmwareUpdatePolicy evaluate](self, "evaluate");
  if (v3 != -[HMDAccessoryFirmwareUpdatePolicy status](self, "status"))
  {
    -[HMDAccessoryFirmwareUpdatePolicy setStatus:](self, "setStatus:", v3);
    -[HMDAccessoryFirmwareUpdatePolicy notify:](self, "notify:", v3);
  }
}

- (BOOL)evaluate
{
  void *v3;
  HMDAccessoryFirmwareUpdatePolicy *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to YES", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  return 1;
}

- (void)notify:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDAccessoryFirmwareUpdatePolicy *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending notification with policy status %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("HMDAccessoryFirmwareUpdatePolicyStatusChangedKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification"), v6, v12);

}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_100453 != -1)
    dispatch_once(&logCategory__hmf_once_t0_100453, &__block_literal_global_100454);
  return (id)logCategory__hmf_once_v1_100455;
}

void __47__HMDAccessoryFirmwareUpdatePolicy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_100455;
  logCategory__hmf_once_v1_100455 = v0;

}

@end
