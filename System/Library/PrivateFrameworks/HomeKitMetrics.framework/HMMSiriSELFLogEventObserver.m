@implementation HMMSiriSELFLogEventObserver

- (HMMSiriSELFLogEventObserver)initWithSiriAnalyticsStream:(id)a3 logEventDispatcher:(id)a4
{
  id v7;
  id v8;
  HMMSiriSELFLogEventObserver *v9;
  HMMSiriSELFLogEventObserver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMSiriSELFLogEventObserver;
  v9 = -[HMMSiriSELFLogEventObserver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_siriAnalyticsStream, a3);
    objc_msgSend(v8, "addObserver:forProtocol:", v10, &unk_1EFA33FE0);
  }

  return v10;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4;
  void *v5;
  HMMSiriSELFLogEventObserver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B78FC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = objc_opt_class();
    _os_log_impl(&dword_1CD029000, v7, OS_LOG_TYPE_DEBUG, "%{public}@[SiriAnalytics] Received event from dispatcher: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "enabledForSiriSELFLogging"))
  {
    -[HMMSiriSELFLogEventObserver siriAnalyticsStream](v6, "siriAnalyticsStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInstrumentationMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitMessage:", v10);

  }
}

- (HMMSiriSELFAnalyticsStream)siriAnalyticsStream
{
  return self->_siriAnalyticsStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriAnalyticsStream, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_1839 != -1)
    dispatch_once(&logCategory__hmf_once_t1_1839, &__block_literal_global_1840);
  return (id)logCategory__hmf_once_v2_1841;
}

void __42__HMMSiriSELFLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_1841;
  logCategory__hmf_once_v2_1841 = v0;

}

@end
