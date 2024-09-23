@implementation HMDMessageHandlerMetricsDispatcher

- (HMDMessageHandlerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDMessageHandlerMetricsDispatcher *v10;
  HMDMessageHandlerMetricsDispatcher *v11;
  HMDMessageHandlerMetricsDispatcher *result;
  HMDMessageHandlerMetricsDispatcher *v13;
  SEL v14;
  unint64_t v15;
  id v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDMessageHandlerMetricsDispatcher *)_HMFPreconditionFailure();
    -[HMDMessageHandlerMetricsDispatcher submitFailureEventOfType:message:](v13, v14, v15, v16);
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDMessageHandlerMetricsDispatcher;
  v10 = -[HMDMessageHandlerMetricsDispatcher init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_logEventSubmitter, a4);
  }

  return v11;
}

- (void)submitFailureEventOfType:(unint64_t)a3 message:(id)a4
{
  id v6;
  void *v7;
  HMDMessageHandlerMetricsDispatcher *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  HMDMessageHandlerFailureMetricEvent *v13;
  void *v14;
  HMDMessageHandlerFailureMetricEvent *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a3 > 2)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E89B3EC8[a3];
    v17 = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event: %@ for message: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = [HMDMessageHandlerFailureMetricEvent alloc];
  objc_msgSend(v6, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDMessageHandlerFailureMetricEvent initWithFailureType:messageName:](v13, "initWithFailureType:messageName:", a3, v14);

  -[HMDMessageHandlerMetricsDispatcher logEventSubmitter](v8, "logEventSubmitter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitLogEvent:", v15);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMessageHandlerMetricsDispatcher identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMessageHandlerMetricsDispatcher identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_113218 != -1)
    dispatch_once(&logCategory__hmf_once_t1_113218, &__block_literal_global_113219);
  return (id)logCategory__hmf_once_v2_113220;
}

void __49__HMDMessageHandlerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_113220;
  logCategory__hmf_once_v2_113220 = v0;

}

@end
