@implementation HMHomeDataSyncOperation

void __40____HMHomeDataSyncOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_45163;
  logCategory__hmf_once_v8_45163 = v0;

}

void __33____HMHomeDataSyncOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v9)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v6)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v14;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Processing sync response", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        v15 = objc_msgSend(v11, "isRefresh");
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __33____HMHomeDataSyncOperation_main__block_invoke_6;
        v23[3] = &unk_1E3AB5E68;
        objc_copyWeak(&v24, v7);
        objc_msgSend(v9, "__processSyncResponse:refreshRequested:completionHandler:", v6, v15, v23);
        objc_destroyWeak(&v24);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v21;
          v27 = 2112;
          v28 = v5;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Sync operation failed: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        if (objc_msgSend(v5, "isHMError") && objc_msgSend(v5, "code") == 77)
        {
          objc_msgSend(v5, "userInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_updateStatusWithPayload:", v22);

        }
        objc_msgSend(v11, "cancelWithError:", v5);
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = WeakRetained;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Manager was deallocated before fetch response was handled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancelWithError:", v20);

    }
  }

}

void __33____HMHomeDataSyncOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to process sync response: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "cancelWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully processed sync response", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "finish");
  }

}

@end
