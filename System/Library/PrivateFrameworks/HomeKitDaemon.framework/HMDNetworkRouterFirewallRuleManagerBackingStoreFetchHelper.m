@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper

- (HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper)initWithActivity:(id)a3 options:(id)a4 container:(id)a5 useAnonymousRequests:(BOOL)a6 promise:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v22;
  id v24;
  objc_super v25;

  v8 = a6;
  v24 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x24BDB9188];
  v16 = a5;
  v17 = objc_alloc_init(v15);
  objc_msgSend(v17, "setContainer:", v16);

  objc_msgSend(v17, "setPreferAnonymousRequests:", v8);
  if (objc_msgSend(v13, "qualityOfService") != -1)
    objc_msgSend(v17, "setQualityOfService:", objc_msgSend(v13, "qualityOfService"));
  v18 = objc_alloc_init(MEMORY[0x24BDB9190]);
  objc_msgSend(v13, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setName:", v19);

  objc_msgSend(v18, "setDefaultConfiguration:", v17);
  v25.receiver = self;
  v25.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper;
  v20 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_activity, a3);
    objc_storeStrong((id *)&v21->_options, a4);
    objc_storeStrong((id *)&v21->_operationGroup, v18);
    v21->_retryIntervalSeconds = *(double *)MEMORY[0x24BE4EC40];
    objc_storeStrong((id *)&v21->_promise, a7);
    v21->_finished = 0;
    v22 = v21;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v4;
  NSObject *v5;
  void *v6;
  HMDAssertionLogEvent *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_finished)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Forgot to call finishWithError", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Forgot to call finishWithError"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitLogEvent:", v7);

  }
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper dealloc](&v9, sel_dealloc);
}

- (BOOL)shouldRetry
{
  unint64_t v3;
  void *v4;
  void *v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  int64_t v15;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend((id)objc_opt_class(), "maxRetryCount");
  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper retryCount](self, "retryCount") <= v3)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper operationStartTime](self, "operationStartTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return self->_retryIntervalSeconds != *MEMORY[0x24BE4EC40];
    v11 = objc_msgSend((id)objc_opt_class(), "maxOperationDurationSeconds");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper operationStartTime](self, "operationStartTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    v15 = llround(v14);

    if (v15 < v11)
      return self->_retryIntervalSeconds != *MEMORY[0x24BE4EC40];
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](self, "activity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markWithFormat:", CFSTR("Cannot retry because we've exceeded the maximum operation duration (%ld)"), v11);

    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2048;
      v21 = v11;
      v9 = "%{public}@Cannot retry because we've exceeded the maximum operation duration (%ld)";
      goto LABEL_9;
    }
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markWithFormat:", CFSTR("Cannot retry because we've exceeded the maximum number of retries (%lu)"), v3);

    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2048;
      v21 = v3;
      v9 = "%{public}@Cannot retry because we've exceeded the maximum number of retries (%lu)";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)setShouldRetry:(BOOL)a3
{
  if (a3)
  {
    if (self->_retryIntervalSeconds == *MEMORY[0x24BE4EC40])
      self->_retryIntervalSeconds = 0.0;
  }
  else
  {
    self->_retryIntervalSeconds = *(double *)MEMORY[0x24BE4EC40];
  }
}

- (void)setRetryIntervalSeconds:(double)a3
{
  if (a3 < 0.0)
    a3 = *MEMORY[0x24BE4EC40];
  self->_retryIntervalSeconds = a3;
}

- (void)finishWithResult:(id)a3
{
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (void)finishWithError:(id)a3
{
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *v19;
  NSObject *v20;
  void *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_finished)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Finished more than once!", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Finished more than once!"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v22);

  }
  self->_finished = 1;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](self, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "markWithFormat:", CFSTR("Fetch failed with error: %@"), v7);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[NAPromise finishWithError:](v11->_promise, "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(v8, "markWithFormat:", CFSTR("Fetch succeeded"));

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[NAPromise finishWithResult:](v15->_promise, "finishWithResult:", v6);
  }

}

- (HMFActivity)activity
{
  return self->_activity;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (double)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSDate)operationStartTime
{
  return self->_operationStartTime;
}

- (void)setOperationStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_operationStartTime, a3);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationStartTime, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1)
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_792);
  return (id)logCategory__hmf_once_v1;
}

+ (unint64_t)__integerForPreferenceKey:(id)a3 defaultValue:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BE3F248];
  v6 = a3;
  objc_msgSend(v5, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "numberValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  return a4;
}

+ (unint64_t)maxRetryCount
{
  return objc_msgSend(a1, "__integerForPreferenceKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelperMaxRetryCount"), 5);
}

+ (unint64_t)maxOperationDurationSeconds
{
  return objc_msgSend(a1, "__integerForPreferenceKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelperMaxOperationDurationSeconds"), 300);
}

void __73__HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1;
  logCategory__hmf_once_v1 = v0;

}

@end
