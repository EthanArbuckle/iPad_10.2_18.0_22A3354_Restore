@implementation HMDAccessoryFirmwareUpdateTask

- (HMDAccessoryFirmwareUpdateTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5
{
  id v8;
  id v9;
  HMDAccessoryFirmwareUpdateTask *v10;
  HMDAccessoryFirmwareUpdateTask *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryFirmwareUpdateTask;
  v10 = -[HMDAccessoryFirmwareUpdateTask init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_session, v8);
    objc_storeWeak((id *)&v11->_profile, v9);
    v11->_initialDelay = a5;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessoryFirmwareUpdateTask initialDelay](self, "initialDelay");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateTask shouldRun](self, "shouldRun");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Initial Delay = %@, Should Run = %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)privateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessoryFirmwareUpdateTask initialDelay](self, "initialDelay");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateTask shouldRun](self, "shouldRun");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Initial Delay = %@, Should Run = %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (OS_xpc_object)criteria
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)shouldRun
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)isUserInitiated
{
  return 0;
}

- (BOOL)shouldRunOnCurrentDevice
{
  void *v2;
  char v3;

  -[HMDAccessoryFirmwareUpdateTask accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachable");

  return v3;
}

- (HMDHAPAccessory)accessory
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateTask session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHAPAccessory *)v3;
}

- (void)run
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (int64_t)accessoryActiveTransport
{
  id v2;
  int64_t v3;

  -[HMDAccessoryFirmwareUpdateTask accessory](self, "accessory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isReachable"))
  {
    if ((objc_msgSend(v2, "isThreadTheCurrentlyActiveTransport") & 1) != 0)
    {
      v3 = 4;
    }
    else if ((objc_msgSend(v2, "hasBTLELink") & 1) != 0)
    {
      v3 = 3;
    }
    else if (objc_msgSend(v2, "hasIPLink"))
    {
      v3 = 2;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (HMDAccessoryFirmwareUpdateSession)session
{
  return (HMDAccessoryFirmwareUpdateSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (HMDAccessoryFirmwareUpdateProfile)profile
{
  return (HMDAccessoryFirmwareUpdateProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_session);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_152926 != -1)
    dispatch_once(&logCategory__hmf_once_t0_152926, &__block_literal_global_152927);
  return (id)logCategory__hmf_once_v1_152928;
}

void __45__HMDAccessoryFirmwareUpdateTask_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_152928;
  logCategory__hmf_once_v1_152928 = v0;

}

@end
