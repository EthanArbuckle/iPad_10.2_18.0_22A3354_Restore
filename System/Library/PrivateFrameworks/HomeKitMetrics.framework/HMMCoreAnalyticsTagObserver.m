@implementation HMMCoreAnalyticsTagObserver

- (HMMCoreAnalyticsTagObserver)initWithTagDispatcher:(id)a3 logEventSubmitter:(id)a4 logEventFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMMCoreAnalyticsTagObserver *v13;
  HMMCoreAnalyticsTagObserver *v14;
  HMMCoreAnalyticsTagObserver *result;
  HMMCoreAnalyticsTagObserver *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMMCoreAnalyticsTagObserver *)_HMFPreconditionFailure();
    -[HMMCoreAnalyticsTagObserver configure](v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMMCoreAnalyticsTagObserver;
  v13 = -[HMMCoreAnalyticsTagObserver init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tagDispatcher, a3);
    objc_storeStrong((id *)&v14->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v14->_logEventFactory, a5);
  }

  return v14;
}

- (void)configure
{
  void *v3;
  void *v4;
  id v5;

  -[HMMCoreAnalyticsTagObserver tagDispatcher](self, "tagDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMCoreAnalyticsTagObserver logEventFactory](self, "logEventFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerTagObserver:forTags:", self, v4);

}

- (void)unconfigure
{
  void *v3;
  void *v4;
  id v5;

  -[HMMCoreAnalyticsTagObserver tagDispatcher](self, "tagDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMCoreAnalyticsTagObserver logEventFactory](self, "logEventFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterTagObserver:forTags:", self, v4);

}

- (void)observeTaggedEvent:(id)a3 addProcessorBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMCoreAnalyticsTagObserver *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMCoreAnalyticsTagObserver logEventFactory](self, "logEventFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventForTaggedEvent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMMCoreAnalyticsTagObserver logEventSubmitter](self, "logEventSubmitter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submitLogEvent:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B78FC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = 0;
      _os_log_impl(&dword_1CD029000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get logged event from tagged event: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (HMMTagDispatching)tagDispatcher
{
  return (HMMTagDispatching *)objc_getProperty(self, a2, 8, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (HMMCoreAnalyticsLogEventFactory)logEventFactory
{
  return (HMMCoreAnalyticsLogEventFactory *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventFactory, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_tagDispatcher, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1)
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_179);
  return (id)logCategory__hmf_once_v2;
}

void __42__HMMCoreAnalyticsTagObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

}

@end
