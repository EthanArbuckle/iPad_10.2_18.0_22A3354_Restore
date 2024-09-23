@implementation __HMHomeDataSyncOperation

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __HMHomeDataSyncOperation *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __HMHomeDataSyncOperation *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  -[__HMHomeDataSyncOperation manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "generationCounter");
    v6 = objc_msgSend(v4, "metadataVersion");
    objc_msgSend(v4, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

    v10 = (void *)MEMORY[0x1E0D285F8];
    v11 = -[__HMHomeDataSyncOperation qualityOfService](self, "qualityOfService");
    v38[0] = CFSTR("kConfigGenerationCounterKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v12;
    v38[1] = CFSTR("kHAPMetadataVersionKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v13;
    v38[2] = CFSTR("options");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMHM.fhc"), v11, v28, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __33____HMHomeDataSyncOperation_main__block_invoke;
    v29[3] = &unk_1E3AB4590;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    v17 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v16, "setResponseHandler:", v29));
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending sync request using message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendMessage:", v16);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Manager was deallocated before sync operation started", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v25, "cancelWithError:", v7);
  }

}

- (HMHomeManager)manager
{
  return (HMHomeManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_45161 != -1)
    dispatch_once(&logCategory__hmf_once_t7_45161, &__block_literal_global_45162);
  return (id)logCategory__hmf_once_v8_45163;
}

- (void)setRefresh:(BOOL)a3
{
  self->_refresh = a3;
}

- (__HMHomeDataSyncOperation)initWithHomeManager:(id)a3
{
  id v4;
  __HMHomeDataSyncOperation *v5;
  __HMHomeDataSyncOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *logIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)__HMHomeDataSyncOperation;
  v5 = -[HMFOperation initWithTimeout:](&v13, sel_initWithTimeout_, 0.0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__HMHomeDataSyncOperation name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v10;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (BOOL)isRefresh
{
  return self->_refresh;
}

@end
