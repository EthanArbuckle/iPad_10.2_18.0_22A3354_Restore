@implementation HMMTRAccessControl

- (HMMTRAccessControl)init
{
  HMMTRAccessControl *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMMTRAccessControl;
  result = -[HMMTRAccessControl init](&v3, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_currentUserPrivilege = 0;
  }
  return result;
}

- (void)setCurrentUserPrivilege:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t currentUserPrivilege;
  void *v7;
  HMMTRAccessControl *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentUserPrivilege = self->_currentUserPrivilege;
  self->_currentUserPrivilege = a3;
  os_unfair_lock_unlock(p_lock);
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (currentUserPrivilege - 1 > 2)
      v12 = CFSTR("None");
    else
      v12 = off_250F21338[currentUserPrivilege - 1];
    if (a3 - 1 > 2)
      v13 = CFSTR("None");
    else
      v13 = off_250F21338[a3 - 1];
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Set current user privilege from %@ to %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
}

- (unint64_t)currentUserPrivilege
{
  os_unfair_lock_s *p_lock;
  unint64_t currentUserPrivilege;
  uint64_t v5;
  void *v6;
  void *v7;
  HMMTRAccessControl *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  currentUserPrivilege = self->_currentUserPrivilege;
  os_unfair_lock_unlock(p_lock);
  if (!currentUserPrivilege)
  {
    -[HMMTRAccessControl privilegeGetter](self, "privilegeGetter");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      currentUserPrivilege = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);
      os_unfair_lock_lock(p_lock);
      self->_currentUserPrivilege = currentUserPrivilege;
      os_unfair_lock_unlock(p_lock);
      if (currentUserPrivilege)
      {
        v7 = (void *)MEMORY[0x242656984]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (currentUserPrivilege > 3)
            v12 = CFSTR("None");
          else
            v12 = off_250F21338[currentUserPrivilege - 1];
          v14 = 138543618;
          v15 = v10;
          v16 = 2112;
          v17 = v12;
          _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Set current user privilege to %@ by getter", (uint8_t *)&v14, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
      }
    }
    else
    {
      currentUserPrivilege = 0;
    }

  }
  return currentUserPrivilege;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRAccessControl fabric](self, "fabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessControl fabric](self, "fabric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fabricID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessControl fabric](self, "fabric");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fabricID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Fabric ID"), v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  v11 = -[HMMTRAccessControl currentUserPrivilege](self, "currentUserPrivilege") - 1;
  if (v11 > 2)
    v12 = CFSTR("None");
  else
    v12 = off_250F21338[v11];
  v13 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Current User Privilege"), v12);
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (id)privilegeGetter
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivilegeGetter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (HMMTRFabric)fabric
{
  return (HMMTRFabric *)objc_loadWeakRetained((id *)&self->_fabric);
}

- (void)setFabric:(id)a3
{
  objc_storeWeak((id *)&self->_fabric, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fabric);
  objc_storeStrong(&self->_privilegeGetter, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_5244 != -1)
    dispatch_once(&logCategory__hmf_once_t2_5244, &__block_literal_global_5245);
  return (id)logCategory__hmf_once_v3_5246;
}

void __33__HMMTRAccessControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_5246;
  logCategory__hmf_once_v3_5246 = v0;

}

@end
