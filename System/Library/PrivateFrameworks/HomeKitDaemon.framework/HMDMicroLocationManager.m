@implementation HMDMicroLocationManager

- (HMDMicroLocationManager)initWithLocationManager:(id)a3 dateFactory:(id)a4
{
  id v7;
  id v8;
  HMDMicroLocationManager *v9;
  HMDMicroLocationManager *v10;
  uint64_t v11;
  NSMutableArray *lastRecordingScanTimes;
  uint64_t v13;
  NSMutableArray *lastLocalizationScanTimes;
  void *v15;
  id dateFactory;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDMicroLocationManager;
  v9 = -[HMDMicroLocationManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "na_arrayByRepeatingWithCount:generatorBlock:", 3, &__block_literal_global_246821);
    v11 = objc_claimAutoreleasedReturnValue();
    lastRecordingScanTimes = v10->_lastRecordingScanTimes;
    v10->_lastRecordingScanTimes = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "na_arrayByRepeatingWithCount:generatorBlock:", 3, &__block_literal_global_3_246822);
    v13 = objc_claimAutoreleasedReturnValue();
    lastLocalizationScanTimes = v10->_lastLocalizationScanTimes;
    v10->_lastLocalizationScanTimes = (NSMutableArray *)v13;

    v15 = _Block_copy(v8);
    dateFactory = v10->_dateFactory;
    v10->_dateFactory = v15;

  }
  return v10;
}

- (HMDMicroLocationManager)initWithLocationManager:(id)a3
{
  return -[HMDMicroLocationManager initWithLocationManager:dateFactory:](self, "initWithLocationManager:dateFactory:", a3, &__block_literal_global_5_246816);
}

- (void)triggerThrottledMicroLocationRecordingScanWithMetadata:(id)a3 triggerType:(unint64_t)a4
{
  const char *v6;
  id v7;
  void *v8;
  HMDMicroLocationManager *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void (**Property)(void);
  void *v14;
  double v15;
  double v16;
  os_unfair_lock_s *p_lock;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  HMDMicroLocationManager *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  HMDMicroLocationManager *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  SEL v33;
  int v34;
  void *v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a4 >= 3)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid HMDMicroLocationScanTriggerType: %@ for Recording Scan", (uint8_t *)&v34, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_16;
  }
  if (self)
    Property = (void (**)(void))objc_getProperty(self, v6, 40, 1);
  else
    Property = 0;
  Property[2]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray objectAtIndexedSubscript:](self->_lastRecordingScanTimes, "objectAtIndexedSubscript:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19 + 5.0;
  if (v20 <= v16)
  {

  }
  else
  {
    v21 = vabdd_f64(v20, v16);

    if (v21 >= 2.22044605e-16)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = off_24E79A888[a4];
        v34 = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping microlocation recording scan for event type: %@, throttling in effect", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      os_unfair_lock_unlock(p_lock);
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_lastRecordingScanTimes, "setObject:atIndexedSubscript:", v27, a4);

  os_unfair_lock_unlock(&self->_lock);
  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = off_24E79A888[a4];
    v34 = 138543618;
    v35 = v31;
    v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing microlocation recording scan for event: %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(objc_getProperty(v29, v33, 32, 1), "requestMicroLocationRecordingScanWithMetadata:", v7);
LABEL_16:

}

- (void)triggerThrottledMicroLocationLocalizationScanWithMetadata:(id)a3 triggerType:(unint64_t)a4
{
  const char *v6;
  id v7;
  void *v8;
  HMDMicroLocationManager *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void (**Property)(void);
  void *v14;
  double v15;
  double v16;
  os_unfair_lock_s *p_lock;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  HMDMicroLocationManager *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  HMDMicroLocationManager *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  SEL v33;
  int v34;
  void *v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a4 >= 3)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid HMDMicroLocationScanTriggerType: %@ for Localization Scan", (uint8_t *)&v34, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_16;
  }
  if (self)
    Property = (void (**)(void))objc_getProperty(self, v6, 40, 1);
  else
    Property = 0;
  Property[2]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray objectAtIndexedSubscript:](self->_lastLocalizationScanTimes, "objectAtIndexedSubscript:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19 + 5.0;
  if (v20 <= v16)
  {

  }
  else
  {
    v21 = vabdd_f64(v20, v16);

    if (v21 >= 2.22044605e-16)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = off_24E79A888[a4];
        v34 = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping microlocation localization scan for event: %@, throttling in effect", (uint8_t *)&v34, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      os_unfair_lock_unlock(p_lock);
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_lastLocalizationScanTimes, "setObject:atIndexedSubscript:", v27, a4);

  os_unfair_lock_unlock(&self->_lock);
  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = off_24E79A888[a4];
    v34 = 138543618;
    v35 = v31;
    v36 = 2112;
    v37 = v32;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing microlocation localization scan for event: %@", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(objc_getProperty(v29, v33, 32, 1), "requestMicroLocationLocalizationScanWithMetadata:", v7);
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateFactory, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastLocalizationScanTimes, 0);
  objc_storeStrong((id *)&self->_lastRecordingScanTimes, 0);
}

uint64_t __51__HMDMicroLocationManager_initWithLocationManager___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

void *__63__HMDMicroLocationManager_initWithLocationManager_dateFactory___block_invoke_2()
{
  return &unk_24E96D5E0;
}

void *__63__HMDMicroLocationManager_initWithLocationManager_dateFactory___block_invoke()
{
  return &unk_24E96D5E0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_246829 != -1)
    dispatch_once(&logCategory__hmf_once_t8_246829, &__block_literal_global_16_246830);
  return (id)logCategory__hmf_once_v9_246831;
}

void __38__HMDMicroLocationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_246831;
  logCategory__hmf_once_v9_246831 = v0;

}

@end
