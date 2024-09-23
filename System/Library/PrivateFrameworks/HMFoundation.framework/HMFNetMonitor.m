@implementation HMFNetMonitor

- (HMFNetMonitor)init
{
  return -[HMFNetMonitor initWithNetAddress:](self, "initWithNetAddress:", 0);
}

- (HMFNetMonitor)initWithNetAddress:(id)a3
{
  id v4;
  uint64_t v5;
  __HMFNetAddressMonitor *v6;
  HMFNetMonitor *p_super;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = -[__HMFNetAddressMonitor initWithNetAddress:]([__HMFNetAddressMonitor alloc], "initWithNetAddress:", v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFNetMonitor;
    v6 = -[HMFNetMonitor init](&v9, sel_init);
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
}

- (HMFNetMonitor)initWithNetService:(id)a3
{
  id v4;
  uint64_t v5;
  __HMFNetServiceMonitor *v6;
  HMFNetMonitor *p_super;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = -[__HMFNetServiceMonitor initWithNetService:]([__HMFNetServiceMonitor alloc], "initWithNetService:", v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFNetMonitor;
    v6 = -[HMFNetMonitor init](&v9, sel_init);
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
}

- (BOOL)isReachable
{
  HMFNetMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMFNetMonitor *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMFNetMonitor *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMFNetMonitor *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Reachability changed to: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMFNetMonitor delegate](v7, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = (void *)MEMORY[0x1A1AC355C]();
        v13 = v7;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v15;
          _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate address is reachable", (uint8_t *)&v20, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v11, "networkMonitorIsReachable:", v13);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = (void *)MEMORY[0x1A1AC355C]();
      v17 = v7;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_19B546000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate address is unreachable", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v11, "networkMonitorIsUnreachable:", v17);
    }

  }
}

- (unint64_t)reachabilityPath
{
  return 1;
}

+ (id)logCategory
{
  if (_MergedGlobals_3 != -1)
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_6);
  return (id)qword_1ED012E58;
}

void __28__HMFNetMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.Monitor"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E58;
  qword_1ED012E58 = v0;

}

- (HMFNetMonitorDelegate)delegate
{
  return (HMFNetMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFNetAddress)netAddress
{
  return self->_netAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
