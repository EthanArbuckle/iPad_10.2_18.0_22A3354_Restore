@implementation HMFCFHTTPServerConnection

void __66___HMFCFHTTPServerConnection__sendStatusCode_forRequest_bodyData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to send internal response, %@, with error: %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __43___HMFCFHTTPServerConnection_sendResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC355C]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(v2, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markWithReason:", CFSTR("Sending"));

    objc_msgSend(*(id *)(a1 + 40), "pendingRespones");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "responseRef");
    _CFHTTPServerResponseEnqueue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@The response is invalid: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v14);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
  }

}

void __41___HMFCFHTTPServerConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.HTTP.Server.Connection.Internal"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012F08;
  qword_1ED012F08 = v0;

}

@end
