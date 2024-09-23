@implementation HMMTRResidentStateManager

- (HMMTRResidentStateManager)init
{
  HMMTRResidentStateManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMMTRResidentStateManager;
  result = -[HMMTRResidentStateManager init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (HMMTRResidentStateManagerDataSource)dataSource
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRResidentStateManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
  id v4;
  void *v5;
  HMMTRResidentStateManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_dataSource, v4);
  os_unfair_lock_unlock(&self->_lock);
  v5 = (void *)MEMORY[0x242656984](-[HMMTRResidentStateManager setCurrentDevicePrimaryResident:](self, "setCurrentDevicePrimaryResident:", objc_msgSend(v4, "isCurrentDevicePrimaryResident")));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRResidentStateManager isCurrentDevicePrimaryResident](v6, "isCurrentDevicePrimaryResident");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Data source set with isCurrentDevicePrimaryResident: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleResidentStateUpdated
{
  void *v3;
  HMMTRResidentStateManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Handling updated resident state", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRResidentStateManager dataSource](v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRResidentStateManager setCurrentDevicePrimaryResident:](v4, "setCurrentDevicePrimaryResident:", objc_msgSend(v7, "isCurrentDevicePrimaryResident"));

}

- (void)handleResidentReachabilityChangeForFabric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRResidentStateManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMMTRResidentStateManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident state change for fabricID:%@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5 && !objc_msgSend(v5, "isEqualToNumber:", &unk_250F3F4B0))
  {
    -[HMMTRResidentStateManager delegate](v7, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleResidentReachabilityChangeForFabric:", v4);

  }
  else
  {
    v10 = (void *)MEMORY[0x242656984]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Received %@ as fabricID, ignoring ResidentReachabilityChange", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleUpdateNotificationsEnabled:(BOOL)a3 forFabric:(id)a4 keepAliveOnly:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  HMMTRResidentStateManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRResidentStateManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v5 = a5;
  v6 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "fabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Receive update notification enabled:%@ for fabricID:%@ keepAliveOnly:%@", (uint8_t *)&v21, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  if (v9 && !objc_msgSend(v9, "isEqualToNumber:", &unk_250F3F4B0))
  {
    -[HMMTRResidentStateManager delegate](v11, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleUpdateNotificationsEnabled:forFabric:keepAliveOnly:", v6, v8, v5);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = v11;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Received %@ as fabricID, ignoring updateNotifications", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (BOOL)isCurrentDevicePrimaryResident
{
  HMMTRResidentStateManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentDevicePrimaryResident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMMTRResidentStateManager *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  if (self->_currentDevicePrimaryResident != v3)
  {
    v7 = (void *)MEMORY[0x242656984](v6);
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating isCurrentDevicePrimaryResident from %@ to %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    self->_currentDevicePrimaryResident = v3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMMTRResidentStateManagerDelegate)delegate
{
  return (HMMTRResidentStateManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11 != -1)
    dispatch_once(&logCategory__hmf_once_t11, &__block_literal_global_2280);
  return (id)logCategory__hmf_once_v12;
}

void __40__HMMTRResidentStateManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12;
  logCategory__hmf_once_v12 = v0;

}

@end
