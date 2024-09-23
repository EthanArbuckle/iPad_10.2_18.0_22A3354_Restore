@implementation HMMTRSystemCommissionerPerControllerStorage

- (HMMTRSystemCommissionerPerControllerStorage)initWithQueue:(id)a3
{
  id v5;
  HMMTRSystemCommissionerPerControllerStorage *v6;
  HMMTRSystemCommissionerPerControllerStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRSystemCommissionerPerControllerStorage;
  v6 = -[HMMTRSystemCommissionerPerControllerStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v7;
  void *v8;

  v7 = a4;
  -[HMMTRSystemCommissionerPerControllerStorage privateDataSource](self, "privateDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v7);

  return 1;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMMTRSystemCommissionerPerControllerStorage *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v13)
  {
    -[HMMTRSystemCommissionerPerControllerStorage privateDataSource](self, "privateDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v12);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive requested value for key %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

  return v13 != 0;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMMTRSystemCommissionerPerControllerStorage *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMMTRSystemCommissionerPerControllerStorage privateDataSource](self, "privateDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1620];
    MTRDeviceControllerStorageClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v11, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (!v14)
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v19;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive value for key %@ with error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
  return 0;
}

- (id)logIdentifier
{
  return 0;
}

- (id)attributeDescriptions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)privateDataSource
{
  return self->_privateDataSource;
}

- (void)setPrivateDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_4306 != -1)
    dispatch_once(&logCategory__hmf_once_t2_4306, &__block_literal_global_4307);
  return (id)logCategory__hmf_once_v3_4308;
}

void __58__HMMTRSystemCommissionerPerControllerStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_4308;
  logCategory__hmf_once_v3_4308 = v0;

}

@end
