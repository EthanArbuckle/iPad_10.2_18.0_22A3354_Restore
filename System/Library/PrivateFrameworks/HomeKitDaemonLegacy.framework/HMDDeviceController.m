@implementation HMDDeviceController

- (void)updateWithDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HMDDeviceController)initWithDevice:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  HMDDeviceController *v9;
  HMDDeviceController *v10;
  uint64_t v11;
  NSUUID *identifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDeviceController;
  v9 = -[HMDDeviceController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_device, a3);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDDeviceController;
  -[HMDDeviceController dealloc](&v4, sel_dealloc);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDeviceController identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDDeviceController device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("Device"), v7, 1, 0);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDDevice)device
{
  os_unfair_lock_s *p_lock;
  HMDDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_device;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)logIdentifier
{
  return -[NSUUID UUIDString](self->_identifier, "UUIDString");
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDeviceControllerDelegate)delegate
{
  return (HMDDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)deviceControllerForCurrentDevice
{
  return objc_alloc_init(__HMDCurrentDeviceController);
}

+ (id)placeholderDeviceControllerWithIdentifier:(id)a3
{
  id v3;
  HMDDevice *v4;
  HMDDevice *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = [HMDDevice alloc];
    v5 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v4, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v3, MEMORY[0x1E0C9AA60], 0, 0, 0, 0);

    +[HMDDeviceController deviceControllerForDevice:](HMDDeviceController, "deviceControllerForDevice:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)deviceControllerForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceController deviceControllerForDevice:accountRegistry:](HMDDeviceController, "deviceControllerForDevice:accountRegistry:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)deviceControllerForDevice:(id)a3 accountRegistry:(id)a4
{
  id v5;
  id v6;
  __HMDDeviceController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[__HMDDeviceController initWithDevice:accountRegistry:]([__HMDDeviceController alloc], "initWithDevice:accountRegistry:", v6, v5);

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_95717 != -1)
    dispatch_once(&logCategory__hmf_once_t4_95717, &__block_literal_global_95718);
  return (id)logCategory__hmf_once_v5_95719;
}

void __34__HMDDeviceController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_95719;
  logCategory__hmf_once_v5_95719 = v0;

}

uint64_t __46____HMDDeviceController___handleAddedAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

@end
