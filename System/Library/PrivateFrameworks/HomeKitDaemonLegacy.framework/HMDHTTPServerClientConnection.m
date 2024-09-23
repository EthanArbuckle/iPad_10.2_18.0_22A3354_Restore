@implementation HMDHTTPServerClientConnection

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id location;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E89B2540;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, v2);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 56);
    v16 = v6;
    v17 = v7;
    v8 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "addCompletionHandler:forTransactionIdentifier:", v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_41;
    v11[3] = &unk_1E89B2568;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, v2);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "sendResponse:completionHandler:", v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);

}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544386;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received response to transaction '%@', %@, with error %@", (uint8_t *)&v16, 0x34u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;

  if (v6)
    objc_msgSend(v8, "cancelWithError:", v6);
  else
    objc_msgSend(v8, "finish");

}

void __79___HMDHTTPServerClientConnection__reallySendMessage_timeout_completionHandler___block_invoke_41(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v5 = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to send message to device, %@, with error: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "cancelWithError:", v3);
  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] Sent message to device, %@, with transaction identifier: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);

}

void __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  double v5;
  double v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isCancelled");
    v3 = v7;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v7, "setCompletionBlock:", 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (*(double *)(a1 + 72) - (v5 - *(double *)(a1 + 64)) <= 1.0)
        v6 = 1.0;
      else
        v6 = *(double *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 32), "_reallySendMessage:timeout:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
      objc_msgSend(v7, "finish");
      v3 = v7;
    }
  }

}

void __72___HMDHTTPServerClientConnection_sendMessage_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D27FC8]) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");

    if (v6 != 13)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] The request timed out, starting a lost connection timer", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "lostConnectionTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");
  }
  else
  {

  }
LABEL_8:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 23, CFSTR("Operation Cancelled"), CFSTR("Unable to send message"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
