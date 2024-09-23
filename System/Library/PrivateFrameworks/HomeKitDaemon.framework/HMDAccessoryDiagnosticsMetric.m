@implementation HMDAccessoryDiagnosticsMetric

- (HMDAccessoryDiagnosticsMetric)initWithAccessory:(id)a3
{
  id v4;
  HMDAccessoryDiagnosticsMetric *v5;
  HMDAccessoryDiagnosticsMetric *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryDiagnosticsMetric;
  v5 = -[HMDAccessoryDiagnosticsMetric init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_accessory, v4);

  return v6;
}

- (id)collectMetric
{
  void *v2;
  void *v3;

  -[HMDAccessoryDiagnosticsMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryDiagnosticCounters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)submitMetric:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryDiagnosticMetricEvent *v6;
  void *v7;
  HMDAccessoryDiagnosticsMetric *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryDiagnosticsMetric accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = -[HMDAccessoryDiagnosticMetricEvent initWithAccessory:diagnostics:]([HMDAccessoryDiagnosticMetricEvent alloc], "initWithAccessory:diagnostics:", v5, v4);
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDiagnosticMetricEvent coreAnalyticsEventDictionary](v6, "coreAnalyticsEventDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting AccessoryDiagnosticMetric for accessory: %{public}@/%{public}@ - %{public}@", (uint8_t *)&v16, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v5, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logEventSubmitter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitLogEvent:", v6);

  }
}

- (void)reset
{
  void *v2;
  void *v3;
  id v4;

  -[HMDAccessoryDiagnosticsMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "resetAccessoryDiagnosticCounters");
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryDiagnosticsMetric accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)metricCollectionStartTime
{
  return self->_metricCollectionStartTime;
}

- (void)setMetricCollectionStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)metric
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_metricCollectionStartTime, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_92079 != -1)
    dispatch_once(&logCategory__hmf_once_t8_92079, &__block_literal_global_225_92080);
  return (id)logCategory__hmf_once_v9_92081;
}

void __44__HMDAccessoryDiagnosticsMetric_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_92081;
  logCategory__hmf_once_v9_92081 = v0;

}

@end
