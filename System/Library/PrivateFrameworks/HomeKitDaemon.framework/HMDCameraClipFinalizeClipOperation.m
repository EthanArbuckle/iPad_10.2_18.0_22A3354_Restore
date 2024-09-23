@implementation HMDCameraClipFinalizeClipOperation

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDCameraClipFinalizeClipOperation;
  -[HMDCameraClipOperation main](&v11, sel_main);
  -[HMDCameraClipOperation fetchClipModel](self, "fetchClipModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke;
  v10[3] = &unk_24E780A90;
  v10[4] = self;
  objc_msgSend(v3, "flatMap:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_3;
  v9[3] = &unk_24E798968;
  v9[4] = self;
  objc_msgSend(v5, "addSuccessBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_5;
  v8[3] = &unk_24E79BD80;
  v8[4] = self;
  v7 = (id)objc_msgSend(v6, "addFailureBlock:", v8);

}

id __42__HMDCameraClipFinalizeClipOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setIsComplete:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v3, "duration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "uploadOperationEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTotalClipDuration:", v6);

  objc_msgSend(v3, "duration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 <= 0.0)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "duration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v26 = 138543618;
      v27 = v17;
      v28 = 2048;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Finalized clip has duration %fs, deleting", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ED10]), "initWithLabel:", CFSTR("delete empty clip"));
    objc_msgSend(v20, "setQualityOfService:", -1);
    objc_msgSend(*(id *)(a1 + 32), "localZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "hmbModelID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeModelIDs:options:", v24, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Marking clip complete", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 32), "updateClipModel:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully finalized clip", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

void __42__HMDCameraClipFinalizeClipOperation_main__block_invoke_5(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update clip model: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);

}

+ (unint64_t)cameraClipOperationType
{
  return 5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_79239 != -1)
    dispatch_once(&logCategory__hmf_once_t4_79239, &__block_literal_global_79240);
  return (id)logCategory__hmf_once_v5_79241;
}

void __49__HMDCameraClipFinalizeClipOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_79241;
  logCategory__hmf_once_v5_79241 = v0;

}

@end
