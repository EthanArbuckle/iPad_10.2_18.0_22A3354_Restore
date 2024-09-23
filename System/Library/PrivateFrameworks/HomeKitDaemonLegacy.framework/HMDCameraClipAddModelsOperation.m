@implementation HMDCameraClipAddModelsOperation

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMDCameraClipAddModelsOperation;
  -[HMDCameraClipOperation main](&v17, sel_main);
  -[HMDCameraClipOperation localZone](self, "localZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMirrorOutputObserver:", self);

  v4 = objc_alloc(MEMORY[0x1E0D32CD8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("add models for %@"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLabel:", v5);

  objc_msgSend(v6, "setQualityOfService:", -1);
  objc_msgSend(v6, "setDisallowsCellularAccessForMirrorOutput:", 1);
  -[HMDCameraClipOperation localZone](self, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipAddModelsOperation modelsToAdd](self, "modelsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addModels:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke;
  v16[3] = &unk_1E89BE5C0;
  v16[4] = self;
  objc_msgSend(v9, "flatMap:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke_5;
  v15[3] = &unk_1E89BF650;
  v15[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __39__HMDCameraClipAddModelsOperation_main__block_invoke_7;
  v14[3] = &unk_1E89C2350;
  v14[4] = self;
  v13 = (id)objc_msgSend(v12, "addFailureBlock:", v14);

}

- (NSSet)modelsToAdd
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)localZone:(id)a3 willPerformMirrorOutputForModel:(id)a4
{
  -[HMDCameraClipAddModelsOperation updateMirrorOutputModel:](self, "updateMirrorOutputModel:", a4);
}

id __39__HMDCameraClipAddModelsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mirrorOutputResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "mirrorOutputResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult future provided", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __39__HMDCameraClipAddModelsOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully added models", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

void __39__HMDCameraClipAddModelsOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to add models: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_168782 != -1)
    dispatch_once(&logCategory__hmf_once_t3_168782, &__block_literal_global_168783);
  return (id)logCategory__hmf_once_v4_168784;
}

void __46__HMDCameraClipAddModelsOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_168784;
  logCategory__hmf_once_v4_168784 = v0;

}

@end
