@implementation HMDMemoryUtilizationTracker

- (void)trackMemoryUsageWithReason:(int64_t)a3
{
  pid_t v5;
  void *v6;
  HMDMemoryUtilizationTracker *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  HMDMemoryLogEvent *v12;
  void *v13;
  HMDMemoryUtilizationTracker *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  rusage_info_t buffer[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)buffer = 0u;
  v5 = getpid();
  if (proc_pid_rusage(v5, 6, buffer))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve memory foot-print", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = *((_QWORD *)&v28 + 1);
    v11 = *((_QWORD *)&v41 + 1);
    getpid();
    proc_reset_footprint_interval();
    v12 = -[HMDMemoryLogEvent initWithReason:currentMemoryUsage:intervalMaxMemoryUsage:]([HMDMemoryLogEvent alloc], "initWithReason:currentMemoryUsage:intervalMaxMemoryUsage:", a3, v10, v11);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2048;
      v21 = -[HMDMemoryLogEvent currentMemoryUsage](v12, "currentMemoryUsage");
      v22 = 2048;
      v23 = -[HMDMemoryLogEvent intervalMaxMemoryUsage](v12, "intervalMaxMemoryUsage");
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Current process memory utilization: %lld, Interval peak memory utilization (Since last timer-based sample): %lld", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDMemoryUtilizationTracker logEventSubmitter](v14, "logEventSubmitter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitLogEvent:", v12);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_239326 != -1)
    dispatch_once(&logCategory__hmf_once_t2_239326, &__block_literal_global_239327);
  return (id)logCategory__hmf_once_v3_239328;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
}

- (HMDMemoryUtilizationTracker)init
{
  void *v3;
  HMDMemoryUtilizationTracker *v4;

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDMemoryUtilizationTracker initWithLogEventSubmitter:](self, "initWithLogEventSubmitter:", v3);

  return v4;
}

- (HMDMemoryUtilizationTracker)initWithLogEventSubmitter:(id)a3
{
  id v4;
  void *v5;
  HMDMemoryUtilizationTracker *v6;
  HMDMemoryUtilizationTracker *v7;
  HMDMemoryUtilizationTracker *result;
  HMDMemoryUtilizationTracker *v9;
  SEL v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDMemoryUtilizationTracker;
    v6 = -[HMDMemoryUtilizationTracker init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeWeak((id *)&v6->_logEventSubmitter, v5);

    return v7;
  }
  else
  {
    v9 = (HMDMemoryUtilizationTracker *)_HMFPreconditionFailure();
    -[HMDMemoryUtilizationTracker .cxx_destruct](v9, v10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logEventSubmitter);
}

void __42__HMDMemoryUtilizationTracker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_239328;
  logCategory__hmf_once_v3_239328 = v0;

}

@end
