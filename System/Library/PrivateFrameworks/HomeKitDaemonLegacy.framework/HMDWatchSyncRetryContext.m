@implementation HMDWatchSyncRetryContext

- (HMDWatchSyncRetryContext)initWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5 initialRetryInterval:(double)a6 maximumRetryAttempts:(int64_t)a7
{
  id v13;
  id v14;
  HMDWatchSyncRetryContext *v15;
  HMDWatchSyncRetryContext *v16;
  uint64_t v17;
  HMDWatchSync *watchSync;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDWatchSyncRetryContext;
  v15 = -[HMDWatchSyncRetryContext init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_watchIdentifier, a3);
    v17 = objc_msgSend(v14, "copy");
    watchSync = v16->_watchSync;
    v16->_watchSync = (HMDWatchSync *)v17;

    v16->_retryAttempt = a5;
    v16->_initialRetryInterval = a6;
    v16->_maximumRetryAttempts = a7;
  }

  return v16;
}

- (double)retryInterval
{
  double v3;
  double v4;

  v3 = exp2((double)-[HMDWatchSyncRetryContext retryAttempt](self, "retryAttempt"));
  -[HMDWatchSyncRetryContext initialRetryInterval](self, "initialRetryInterval");
  return v4 * v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWatchSyncRetryContext watchIdentifier](self, "watchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Watch Identifier"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDWatchSyncRetryContext watchSync](self, "watchSync", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Watch Sync"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDWatchSyncRetryContext retryInterval](self, "retryInterval");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Retry Interval"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMDWatchSync)watchSync
{
  return (HMDWatchSync *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)watchIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)retryAttempt
{
  return self->_retryAttempt;
}

- (double)initialRetryInterval
{
  return self->_initialRetryInterval;
}

- (int64_t)maximumRetryAttempts
{
  return self->_maximumRetryAttempts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIdentifier, 0);
  objc_storeStrong((id *)&self->_watchSync, 0);
}

+ (id)createWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  HMDWatchSyncRetryContext *v17;
  double v18;
  HMDWatchSyncRetryContext *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceForKey:", CFSTR("HMDWatchSyncMaximumRetryAttempts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "integerValue") <= 0)
  {
    v20 = MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v22;
      v33 = 2112;
      v34 = CFSTR("HMDWatchSyncMaximumRetryAttempts");
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Value for maximum watch sync retry attempts key: %@ is less than equal to 0: %@", (uint8_t *)&v31, 0x20u);

    }
    v23 = (void *)v20;
    goto LABEL_11;
  }
  if (objc_msgSend(v11, "integerValue") <= a5)
  {
    v24 = MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v26;
      v33 = 2048;
      v34 = (const __CFString *)a5;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Exhausted all watch sync retry attempts. Current attempt: %lu, maximum attempts: %@", (uint8_t *)&v31, 0x20u);

    }
    v23 = (void *)v24;
LABEL_11:
    objc_autoreleasePoolPop(v23);
    v19 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceForKey:", CFSTR("HMDWatchSyncInitialRetryInterval"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "doubleValue");
  if (v16 <= 0.0)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0](v15);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v29;
      v33 = 2112;
      v34 = CFSTR("HMDWatchSyncInitialRetryInterval");
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Value for watch sync initial retry interval: %@ is less than equal to 0: %@", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v19 = 0;
  }
  else
  {
    v17 = [HMDWatchSyncRetryContext alloc];
    objc_msgSend(v14, "doubleValue");
    v19 = -[HMDWatchSyncRetryContext initWithWatchIdentifier:watchSync:retryAttempt:initialRetryInterval:maximumRetryAttempts:](v17, "initWithWatchIdentifier:watchSync:retryAttempt:initialRetryInterval:maximumRetryAttempts:", v7, v8, a5, objc_msgSend(v11, "integerValue"), v18);
  }

LABEL_16:
  return v19;
}

@end
