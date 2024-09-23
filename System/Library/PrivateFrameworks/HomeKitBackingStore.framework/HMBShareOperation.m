@implementation HMBShareOperation

- (HMBShareOperation)initWithCloudZone:(id)a3 block:(id)a4
{
  id v7;
  HMBShareOperation *v8;
  HMBShareOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBShareOperation;
  v8 = -[HMBFutureOperation initWithBlock:](&v11, sel_initWithBlock_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cloudZone, a3);

  return v9;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];

  -[HMBShareOperation cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBFutureOperation block](self, "block");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __25__HMBShareOperation_main__block_invoke;
  v14[3] = &unk_1E8932758;
  v14[4] = self;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v14);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __25__HMBShareOperation_main__block_invoke_2;
  v12[3] = &unk_1E8932D60;
  v12[4] = self;
  v13 = v5;
  v10 = v5;
  v11 = (id)objc_msgSend(v7, "addFailureBlock:", v12);

}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudZone, 0);
}

void __25__HMBShareOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "finish");
  objc_msgSend(*(id *)(a1 + 32), "future");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v4);

}

void __25__HMBShareOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "hmbIsRetryShareOperationError");
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling retry share operation error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "cloudZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("Share Operation Retry"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performCloudPullWithOptions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __25__HMBShareOperation_main__block_invoke_4;
    v19[3] = &unk_1E8932780;
    v14 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v14;
    objc_msgSend(v12, "addSuccessBlock:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __25__HMBShareOperation_main__block_invoke_7;
    v18[3] = &unk_1E89327A8;
    v18[4] = *(_QWORD *)(a1 + 32);
    v16 = (id)objc_msgSend(v15, "addFailureBlock:", v18);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v3;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_ERROR, "%{public}@Share operation failed: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);
  }

}

void __25__HMBShareOperation_main__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "share");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recordChangeTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordChangeTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v19 = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Not retrying share operation because no new CKShare changes were found after performing cloud pull (initialShare: %@, currentShare: %@)", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelWithError:", v17);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Retrying share operation after finishing cloud pull", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "main");
  }

}

void __25__HMBShareOperation_main__block_invoke_7(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1D17B6230]();
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
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Canceling share operation due to failed cloud pull: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5 != -1)
    dispatch_once(&logCategory__hmf_once_t5, &__block_literal_global_3711);
  return (id)logCategory__hmf_once_v6;
}

void __32__HMBShareOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6;
  logCategory__hmf_once_v6 = v0;

}

@end
