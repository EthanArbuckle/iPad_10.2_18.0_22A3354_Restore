@implementation HMDPrimaryResidentMessageRouterMetricsDispatcher

- (HMDPrimaryResidentMessageRouterMetricsDispatcher)initWithLogEventSubmitter:(id)a3
{
  id v5;
  HMDPrimaryResidentMessageRouterMetricsDispatcher *v6;
  HMDPrimaryResidentMessageRouterMetricsDispatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPrimaryResidentMessageRouterMetricsDispatcher;
  v6 = -[HMDPrimaryResidentMessageRouterMetricsDispatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);

  return v7;
}

- (void)submitFailureEventWithMessageName:(id)a3 failureType:(int64_t)a4
{
  id v6;
  void *v7;
  HMDPrimaryResidentMessageRouterMetricsDispatcher *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  HMDPrimaryResidentMessageRouterFailureEvent *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a4 - 1) > 4)
      v11 = CFSTR("UnknownValue");
    else
      v11 = off_1E89A2580[a4 - 1];
    v12 = v11;
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with message name: %@ failure type: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = -[HMDPrimaryResidentMessageRouterFailureEvent initWithMessageName:failureType:]([HMDPrimaryResidentMessageRouterFailureEvent alloc], "initWithMessageName:failureType:", v6, a4);
  -[HMDPrimaryResidentMessageRouterMetricsDispatcher logEventSubmitter](v8, "logEventSubmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitLogEvent:", v13);

}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

@end
