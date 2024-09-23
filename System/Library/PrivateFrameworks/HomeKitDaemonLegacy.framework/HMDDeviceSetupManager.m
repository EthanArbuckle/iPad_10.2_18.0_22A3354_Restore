@implementation HMDDeviceSetupManager

- (HMDDeviceSetupManager)initWithNotificationCenter:(id)a3 followUpManager:(id)a4 darwinNotificationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDDeviceSetupManager *v12;
  HMDDeviceSetupManager *v13;
  int *p_proxSetupNotificationToken;
  HMDDeviceSetupManager *v15;
  HMDDeviceSetupManager *v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  HMDDeviceSetupManager *v22;
  NSObject *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HMDDeviceSetupManager;
  v12 = -[HMDDeviceSetupManager init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    p_proxSetupNotificationToken = &v12->_proxSetupNotificationToken;
    v12->_proxSetupNotificationToken = -1;
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong((id *)&v13->_followUpManager, a4);
    objc_storeStrong((id *)&v13->_darwinNotificationProvider, a5);
    v15 = v13;
    v16 = v15;
    if (*p_proxSetupNotificationToken == -1)
    {
      objc_initWeak(&location, v15);
      -[HMDDeviceSetupManager darwinNotificationProvider](v16, "darwinNotificationProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(CFSTR("com.apple.sharing.wha-prox-setup"), "UTF8String");
      v19 = MEMORY[0x1E0C80D38];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = ____HMDDeviceSetupManagerRegisterForProxSetupNotifications_block_invoke;
      v27[3] = &unk_1E89B9FB8;
      objc_copyWeak(&v28, &location);
      v20 = objc_msgSend(v17, "notifyRegisterDispatch:outToken:queue:handler:", v18, &v13->_proxSetupNotificationToken, MEMORY[0x1E0C80D38], v27);

      if (v20)
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v16;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v24;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for ProxSetup notifications", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);

      }
      else
      {
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);

        v16->_running = __HMDDeviceSetupManagerIsProxSetupRunning(v16);
      }
    }
    else
    {

    }
  }

  return v13;
}

- (void)dealloc
{
  HMDDeviceSetupManager *v2;
  unsigned int *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int *v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = (unsigned int *)v2;
  if (v2)
  {
    -[HMDDeviceSetupManager darwinNotificationProvider](v2, "darwinNotificationProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "notifyIsValidToken:", v3[3]);

    if (v5)
    {
      objc_msgSend(v3, "darwinNotificationProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "notifyCancel:", v3[3]);

      if (v7)
      {
        v8 = (void *)MEMORY[0x1D17BA0A0]();
        v9 = v3;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v14 = v11;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unregister for ProxSetup notifications", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
      }
      else
      {
        v3[3] = -1;
      }
    }
  }

  v12.receiver = v3;
  v12.super_class = (Class)HMDDeviceSetupManager;
  -[HMDDeviceSetupManager dealloc](&v12, sel_dealloc);
}

- (BOOL)isRunning
{
  HMDDeviceSetupManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_running;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMDCoreFollowUpManager)followUpManager
{
  return (HMDCoreFollowUpManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_followUpManager, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_150030 != -1)
    dispatch_once(&sharedManager_onceToken_150030, &__block_literal_global_150031);
  return (id)sharedManager_sharedManager_150032;
}

void __38__HMDDeviceSetupManager_sharedManager__block_invoke()
{
  HMDDeviceSetupManager *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  HMDCoreFollowUpManager *v5;

  v5 = objc_alloc_init(HMDCoreFollowUpManager);
  v0 = [HMDDeviceSetupManager alloc];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0CBA498]);
  v3 = -[HMDDeviceSetupManager initWithNotificationCenter:followUpManager:darwinNotificationProvider:](v0, "initWithNotificationCenter:followUpManager:darwinNotificationProvider:", v1, v5, v2);
  v4 = (void *)sharedManager_sharedManager_150032;
  sharedManager_sharedManager_150032 = v3;

}

@end
