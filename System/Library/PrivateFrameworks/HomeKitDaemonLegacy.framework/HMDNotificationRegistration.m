@implementation HMDNotificationRegistration

- (HMDNotificationRegistration)initWithRegisterer:(id)a3
{
  id v4;
  HMDNotificationRegistration *v5;
  uint64_t v6;
  NSMutableSet *registeredNotifications;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNotificationRegistration;
  v5 = -[HMDNotificationRegistration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    registeredNotifications = v5->_registeredNotifications;
    v5->_registeredNotifications = (NSMutableSet *)v6;

    objc_storeWeak((id *)&v5->_registerer, v4);
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[HMDNotificationRegistration registerer](self, "registerer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (void)addObserver:(SEL)a3 name:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  HMDNotificationRegistration *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDNotificationRegistration *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HMDNotificationRegistration registeredNotifications](self, "registeredNotifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v8;
      v16 = "%{public}@Not Registering for notification %@";
LABEL_6:
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistration registerer](self, "registerer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v18, a3, v8, v9);

    -[HMDNotificationRegistration registeredNotifications](self, "registeredNotifications");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v8);

    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v8;
      v16 = "%{public}@Registering for notification %@";
      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v12);
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (HMFLogging)registerer
{
  return (HMFLogging *)objc_loadWeakRetained((id *)&self->_registerer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_registerer);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_168944 != -1)
    dispatch_once(&logCategory__hmf_once_t0_168944, &__block_literal_global_168945);
  return (id)logCategory__hmf_once_v1_168946;
}

void __42__HMDNotificationRegistration_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_168946;
  logCategory__hmf_once_v1_168946 = v0;

}

@end
