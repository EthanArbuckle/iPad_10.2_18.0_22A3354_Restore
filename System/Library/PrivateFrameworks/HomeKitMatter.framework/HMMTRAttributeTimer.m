@implementation HMMTRAttributeTimer

- (HMMTRAttributeTimer)initWithServer:(id)a3 report:(id)a4 timeout:(double)a5 queue:(id)a6 server:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRAttributeTimer *v17;
  HMMTRAttributeTimer *v18;
  uint64_t v19;
  NSMutableDictionary *report;
  uint64_t v21;
  HMFTimer *attributeTimer;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRAttributeTimer;
  v17 = -[HMMTRAttributeTimer init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_server, v16);
    objc_storeStrong((id *)&v18->_path, a3);
    v19 = objc_msgSend(v14, "mutableCopy");
    report = v18->_report;
    v18->_report = (NSMutableDictionary *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 2, a5);
    attributeTimer = v18->_attributeTimer;
    v18->_attributeTimer = (HMFTimer *)v21;

    -[HMFTimer setDelegateQueue:](v18->_attributeTimer, "setDelegateQueue:", v15);
    -[HMFTimer setDelegate:](v18->_attributeTimer, "setDelegate:", v18);
  }

  return v18;
}

- (void)updateReport:(id)a3
{
  id v4;
  void *v5;
  HMMTRAttributeTimer *v6;
  NSObject *v7;
  void *v8;
  MTRAttributePath *path;
  uint64_t v10;
  NSMutableDictionary *report;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  MTRAttributePath *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    path = v6->_path;
    v13 = 138543874;
    v14 = v8;
    v15 = 2112;
    v16 = path;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Update report for path %@ with report %@ and reset timer", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = objc_msgSend(v4, "mutableCopy");
  report = v6->_report;
  v6->_report = (NSMutableDictionary *)v10;

  -[HMMTRAttributeTimer attributeTimer](v6, "attributeTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

}

- (void)start
{
  void *v3;
  HMMTRAttributeTimer *v4;
  NSObject *v5;
  void *v6;
  MTRAttributePath *path;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  MTRAttributePath *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFTimer timeInterval](v4->_attributeTimer, "timeInterval");
    path = v4->_path;
    v10 = 138543874;
    v11 = v6;
    v12 = 2048;
    v13 = v8;
    v14 = 2112;
    v15 = path;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting attribute timer with delay of %f for path %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAttributeTimer attributeTimer](v4, "attributeTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)stop
{
  void *v3;
  HMMTRAttributeTimer *v4;
  NSObject *v5;
  void *v6;
  MTRAttributePath *path;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  MTRAttributePath *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    path = v4->_path;
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = path;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Stopping attribute timer for path %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRAttributeTimer attributeTimer](v4, "attributeTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTRAttributeTimer *v6;
  NSObject *v7;
  void *v8;
  MTRAttributePath *path;
  NSMutableDictionary *report;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  MTRAttributePath *v15;
  __int16 v16;
  NSMutableDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    path = v6->_path;
    report = v6->_report;
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = path;
    v16 = 2112;
    v17 = report;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Attribute timer triggered for path %@ with report %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRAttributeTimer server](v6, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processAttributeReport:", v6->_report);

}

- (HMFTimer)attributeTimer
{
  return self->_attributeTimer;
}

- (void)setAttributeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_attributeTimer, a3);
}

- (MTRAttributePath)path
{
  return self->_path;
}

- (HMMTRAccessoryServer)server
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (NSMutableDictionary)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_storeStrong((id *)&self->_report, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_attributeTimer, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1)
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_3022);
  return (id)logCategory__hmf_once_v5;
}

void __34__HMMTRAttributeTimer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5;
  logCategory__hmf_once_v5 = v0;

}

@end
