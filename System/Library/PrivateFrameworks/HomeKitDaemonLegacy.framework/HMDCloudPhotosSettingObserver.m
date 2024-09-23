@implementation HMDCloudPhotosSettingObserver

- (HMDCloudPhotosSettingObserver)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCloudPhotosSettingObserver *v7;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCloudPhotosSettingObserver initWithAccount:notificationCenter:isSupported:](self, "initWithAccount:notificationCenter:isSupported:", v5, v6, !isHomePod());

  return v7;
}

- (HMDCloudPhotosSettingObserver)initWithAccount:(id)a3 notificationCenter:(id)a4 isSupported:(BOOL)a5
{
  id v9;
  id v10;
  HMDCloudPhotosSettingObserver *v11;
  HMDCloudPhotosSettingObserver *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCloudPhotosSettingObserver;
  v11 = -[HMDCloudPhotosSettingObserver init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    v12->_supported = a5;
  }

  return v12;
}

- (void)configure
{
  void *v3;

  if (-[HMDCloudPhotosSettingObserver isSupported](self, "isSupported"))
  {
    -[HMDCloudPhotosSettingObserver notificationCenter](self, "notificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccountStoreDidChangeNotification_, *MEMORY[0x1E0C8F1C0], 0);

    -[HMDCloudPhotosSettingObserver setCloudPhotosEnabled:](self, "setCloudPhotosEnabled:", -[HMDCloudPhotosSettingObserver isCloudPhotosEnabledOnAccount](self, "isCloudPhotosEnabledOnAccount"));
  }
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCloudPhotosSettingObserver *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDCloudPhotosSettingObserver *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
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
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received account change notification", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDCloudPhotosSettingObserver isCloudPhotosEnabledOnAccount](v6, "isCloudPhotosEnabledOnAccount");
  if ((_DWORD)v9 != -[HMDCloudPhotosSettingObserver isCloudPhotosEnabled](v6, "isCloudPhotosEnabled"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudPhotosSettingObserver isCloudPhotosEnabled](v11, "isCloudPhotosEnabled");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating cloudPhotosEnabled from %@ to %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCloudPhotosSettingObserver setCloudPhotosEnabled:](v11, "setCloudPhotosEnabled:", v9);
    -[HMDCloudPhotosSettingObserver notificationCenter](v11, "notificationCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("HMDCloudPhotoSettingChangedNotification"), v11);

  }
}

- (BOOL)isCloudPhotosEnabledOnAccount
{
  void *v2;
  char v3;

  -[HMDCloudPhotosSettingObserver account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE60]);

  return v3;
}

- (BOOL)isCloudPhotosEnabled
{
  return self->_cloudPhotosEnabled;
}

- (void)setCloudPhotosEnabled:(BOOL)a3
{
  self->_cloudPhotosEnabled = a3;
}

- (HMDACAccount)account
{
  return (HMDACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (HMDCloudPhotosSettingObserver)sharedInstance
{
  if (sharedInstance_onceToken_97777 != -1)
    dispatch_once(&sharedInstance_onceToken_97777, &__block_literal_global_97778);
  return (HMDCloudPhotosSettingObserver *)(id)sharedInstance_cloudPhotoSettingObserver;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_97772 != -1)
    dispatch_once(&logCategory__hmf_once_t2_97772, &__block_literal_global_6_97773);
  return (id)logCategory__hmf_once_v3_97774;
}

void __44__HMDCloudPhotosSettingObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_97774;
  logCategory__hmf_once_v3_97774 = v0;

}

uint64_t __47__HMDCloudPhotosSettingObserver_sharedInstance__block_invoke()
{
  HMDCloudPhotosSettingObserver *v0;
  void *v1;

  v0 = objc_alloc_init(HMDCloudPhotosSettingObserver);
  v1 = (void *)sharedInstance_cloudPhotoSettingObserver;
  sharedInstance_cloudPhotoSettingObserver = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance_cloudPhotoSettingObserver, "configure");
}

@end
