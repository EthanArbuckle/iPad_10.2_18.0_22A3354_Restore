@implementation __HMDCurrentDeviceController

- (__HMDCurrentDeviceController)init
{
  void *v3;
  void *v4;
  __HMDCurrentDeviceController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)__HMDCurrentDeviceController;
  v5 = -[HMDDeviceController initWithDevice:identifier:](&v9, sel_initWithDevice_identifier_, v4, 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel___handleDeviceUpdated_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v7);

  }
  return v5;
}

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  __HMDCurrentDeviceController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating the current device is not supported", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, 0, CFSTR("Updating the current device is not supported"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
}

- (void)__handleDeviceUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __HMDCurrentDeviceController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification device updated: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  __HMDDeviceControllerUpdateDevice(v10, v8);

}

@end
