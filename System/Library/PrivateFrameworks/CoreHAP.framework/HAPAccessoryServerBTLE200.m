@implementation HAPAccessoryServerBTLE200

uint64_t __40___HAPAccessoryServerBTLE200_disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectWithDisconnectionError:completionHandler:", 0, 0);
}

void __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Security session did close with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "submitPairVerifyMetricWithError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySession:", 0);
    if ((objc_msgSend(*(id *)(a1 + 40), "_shouldIgnoreRetryDiscoveryError:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_updateLastKeyBagIdentityIndexFailingPVWithError:", *(_QWORD *)(a1 + 48));
      v9 = objc_msgSend(*(id *)(a1 + 40), "shouldRetryPVDueToAuthenticationError:", *(_QWORD *)(a1 + 48));
      v10 = *(void **)(a1 + 40);
      if (v9)
      {
        objc_msgSend(v10, "clientQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke_801;
        block[3] = &unk_1E894DD08;
        block[4] = *(_QWORD *)(a1 + 40);
        dispatch_async(v11, block);

      }
      else
      {
        objc_msgSend(v10, "_disconnectWithDisconnectionError:completionHandler:", 0, 0);
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 40), "_cancelAllQueuedOperationsWithError:");
          objc_msgSend(*(id *)(a1 + 40), "_resumeAllOperations");
          objc_msgSend(*(id *)(a1 + 40), "updateResumeSessionID:", 0);
        }
      }
    }
  }
}

uint64_t __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke_801(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_establishSecureSession");
}

void __53___HAPAccessoryServerBTLE200_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "accessoryCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastKeyBagIdentityIndexFailingPV:", 0);

    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "associateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v6);

    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "resumeSessionID");
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Security session is open with resumeSessionID %llu", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "submitPairVerifyMetricWithError:", 0);
    objc_msgSend(*(id *)(a1 + 40), "updateResumeSessionID:", objc_msgSend(*(id *)(a1 + 32), "resumeSessionID"));
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegatesOfConnectionState:withError:", 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "_resumeAllOperations");
  }
}

void __55___HAPAccessoryServerBTLE200_securitySessionIsOpening___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Security session is opening", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __74___HAPAccessoryServerBTLE200_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Request to send security session setup exchange", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "_handleSecuritySessionSetupExchangeData:", *(_QWORD *)(a1 + 48));
  }
}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Auth Complete with status: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = *(id *)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_787;
  v21[3] = &unk_1E894E0F8;
  v21[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  v21[5] = v10;
  __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_787((uint64_t)v21);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_2;
    v19[3] = &unk_1E894E0F8;
    v14 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v14;
    dispatch_async(v13, v19);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:didFinishAuth:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_787(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didFinishAuth:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:confirmUUID:token:)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", v11, v12);

  }
}

void __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:confirmUUID:token:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:authenticateUUID:token:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", v11, v12);

  }
}

void __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:authenticateUUID:token:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_suspendConnectionIdleTimer");
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke_2;
    block[3] = &unk_1E894E120;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", v11, v12);

  }
}

void __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "authenticatedProtocolInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryServer:validateUUID:token:model:", v2, v3, v4, v6);

}

uint64_t __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2;
  v4[3] = &unk_1E894B080;
  v4[4] = v2;
  return objc_msgSend(v2, "_sendProtocolInfoServiceExchangeData:completion:", v1, v4);
}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@SW Auth failed, sending auth exchange with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = v5;
    objc_msgSend(v11, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v11;
    if (v14)
    {
      objc_msgSend(v11, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_780;
    v24[3] = &unk_1E894E0F8;
    v24[4] = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v24[5] = v18;
    __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_780((uint64_t)v24);
    objc_msgSend(*(id *)(a1 + 32), "authSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resetSession");

    if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didFinishAuth_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2_783;
      v22[3] = &unk_1E894E0F8;
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v11;
      dispatch_async(v20, v22);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "authSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleAuthExchangeData:withHeader:", v6, 0);

  }
}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_780(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke_2_783(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didFinishAuth:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __74___HAPAccessoryServerBTLE200__notifyDelegatesOfConnectionState_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didUpdateConnectionState:linkLayerType:withError:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), 3, *(_QWORD *)(a1 + 40));

}

void __61___HAPAccessoryServerBTLE200__notifyDelegatesPairingStopped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v10 = v4;

  v5 = *(id *)(a1 + 32);
  if (objc_msgSend(v10, "isHAPError") && objc_msgSend(v10, "code") == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(*(id *)(a1 + 32), "code"), 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 40), v5);

}

void __61___HAPAccessoryServerBTLE200_tearDownSessionOnAuthCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  HAPPairSetupSession *v3;

  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSession");

  objc_msgSend(*(id *)(a1 + 32), "setAuthenticated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPairing:", 0);
  v3 = -[HAPPairSetupSession initWithRole:pairSetupType:delegate:]([HAPPairSetupSession alloc], "initWithRole:pairSetupType:delegate:", 0, objc_msgSend(*(id *)(a1 + 32), "_getPairSetupType"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setPairSetupSession:", v3);

}

void __45___HAPAccessoryServerBTLE200_provisionToken___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendTokenUpdateRequest:", *(_QWORD *)(a1 + 40));

}

void __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD v4[6];

  if (objc_msgSend(*(id *)(a1 + 32), "authMethod") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "authSession");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "continueAuthAfterValidation:", *(unsigned __int8 *)(a1 + 40));

    return;
  }
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_8;
  if (objc_msgSend(*(id *)(a1 + 32), "authMethod") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_continuePairingAfterMFiCertValidation");
    return;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "continuePairingAfterAuthPrompt");
  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 16, CFSTR("Pairing Failed."), CFSTR("User cancelled pairing"), 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2;
    v4[3] = &unk_1E894E0F8;
    v4[4] = *(_QWORD *)(a1 + 32);
    v4[5] = v3;
    __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2((uint64_t)v4);
    objc_msgSend(*(id *)(a1 + 32), "_pairingCompletedWithError:", v3);

  }
}

void __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __51___HAPAccessoryServerBTLE200_authenticateAccessory__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "authSession");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleAuthExchangeData:withHeader:", 0, 0);

}

void __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "protocolInfoServiceSignatureCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPProtocolMessages constructInfoRequest:outTID:](HAPProtocolMessages, "constructInfoRequest:outTID:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke_2;
    v9[3] = &unk_1E894B058;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "_sendProtocolInfoServiceExchangeData:completion:", v4, v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  +[HAPProtocolMessages parseInfoResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseInfoResponse:expectedTID:withHeader:", v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAuthenticatedProtocolInfo:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "authenticatedProtocolInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "_validateProtocolInfo:", v10);

  if ((_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticatedProtocolInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protocolVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVersion:", v12);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "authenticatedProtocolInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Protocol Info does not match: %@ Accessory out of compliance", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v18 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 7, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_6:
}

void __88___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Pair Setup session request to backoff for %g seconds", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "setBadPairSetupCode:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setPairSetupBackoffTimeInterval:", *(double *)(a1 + 48));
  }
}

void __73___HAPAccessoryServerBTLE200_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Pair Setup session invalid setup code", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "setBadPairSetupCode:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setPairSetupBackoffTimeInterval:", 0.0);
  }
}

void __95___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Request to get the pairing peer setup code", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "_handlePairingSetupCodeRequestWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
}

void __69___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveProductData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "setProductData:", *(_QWORD *)(a1 + 48));
}

void __64___HAPAccessoryServerBTLE200_pairSetupSession_didStopWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_pairingCompletedWithError:", *(_QWORD *)(a1 + 48));
}

void __75___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairSetupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Request to send Pair Setup session setup exchange", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "_handlePairSetupSessionExchangeData:", *(_QWORD *)(a1 + 48));
  }
}

void __61___HAPAccessoryServerBTLE200_controlOutputStreamDidComplete___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0);
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __68___HAPAccessoryServerBTLE200_controlOutputStream_didCloseWithError___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __105___HAPAccessoryServerBTLE200_controlOutputStream_didReceiveRequestToSendControlPacket_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "controlOutputStream");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "_sendControlPacket:forRequest:completionHandler:", *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 56));
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@No matching request for control output stream: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid parameter."), CFSTR("No matching request for control output stream."), 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_14:

  }
}

void __91___HAPAccessoryServerBTLE200_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Received Notification updated confirmation for characteristics %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 56))
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 56);
        v13 = 138543618;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Notification Update failed with error: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "_characteristicForCBCharacteristic:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(*(id *)(a1 + 40), "_handleHAPNotificationStateUpdateForCharacteristic:error:", v12, *(_QWORD *)(a1 + 56));

  }
}

void __78___HAPAccessoryServerBTLE200_peripheral_didWriteValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "characteristicWriteCompletionHandlers", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v7, "cbCharacteristic");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 48));

          if ((v9 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "_handleWriteCompletionForCharacteristic:error:", v7, *(_QWORD *)(a1 + 56));

            return;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v4)
          continue;
        break;
      }
    }

    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v15 = "%{public}@Received characteristic write confirmation from unmapped characteristic: %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_1CCE01000, v16, v17, v15, buf, 0x16u);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2112;
      v27 = v18;
      v15 = "%{public}@Received characteristic write for invalid peripheral: %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEBUG;
      goto LABEL_14;
    }
  }

  objc_autoreleasePoolPop(v10);
}

uint64_t __79___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleUpdateValueForCharacteristic:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

uint64_t __75___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleReadDescriptorValue:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

uint64_t __87___HAPAccessoryServerBTLE200_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleDiscoveredCharacteristic:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

uint64_t __84___HAPAccessoryServerBTLE200_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleDiscoveredCharacteristicsForService:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

uint64_t __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke(id *a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "state");
  if (result == 2)
  {
    result = objc_msgSend(a1[5], "count");
    if (result)
    {
      v3 = (void *)MEMORY[0x1D17B7244]();
      v4 = a1[6];
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = a1[5];
        *(_DWORD *)buf = 138543618;
        v11 = v6;
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%{public}@Disconnecting on services changed: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v3);
      if (objc_msgSend(a1[6], "isPairing"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_759;
        v9[3] = &unk_1E894E0F8;
        v9[4] = a1[6];
        v9[5] = v8;
        __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_759((uint64_t)v9);
        objc_msgSend(a1[6], "setPairingDisconnectionError:", v8);

      }
      return objc_msgSend(a1[6], "_disconnectWithDisconnectionError:completionHandler:", 0, 0);
    }
  }
  return result;
}

void __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke_759(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

uint64_t __61___HAPAccessoryServerBTLE200_peripheral_didDiscoverServices___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 40), "_handleDiscoveredServices:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __83___HAPAccessoryServerBTLE200__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:willSendPlaintextPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __96___HAPAccessoryServerBTLE200__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:willSendEncryptedAndAuthenticatedPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __87___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:didReceivePlaintextPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __100___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:didReceiveEncryptedAndAuthenticatedPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double Current;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  double v48;
  char v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = v12;
  v15 = v14;
  if (!v14)
  {
    if (v11)
    {
      objc_msgSend(WeakRetained, "setStateNumber:", v11);
      objc_msgSend(WeakRetained, "browser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateCachedStateForIdentifier:stateNumber:", v22, v11);

    }
    if (v10)
    {
      if (*(_BYTE *)(a1 + 56) == 2)
      {
        objc_msgSend(WeakRetained, "accessoryCache");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "peripheralInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "keyUpdatedTime");
        v26 = v25;

        Current = 1.0;
        if (v26 <= 0.0)
          Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(WeakRetained, "browser");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "updateBroadcastKeyForIdentifier:key:keyUpdatedStateNumber:keyUpdatedTime:", v29, v10, v11, Current);

        v16 = (void *)MEMORY[0x1D17B7244]();
        v30 = WeakRetained;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v51 = v31;
          v52 = 2112;
          v53 = v10;
          v54 = 2112;
          v55 = v11;
          v56 = 2048;
          v57 = Current;
          _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Saving the read broadcast key: %@, S#: %@ time: %f", buf, 0x2Au);

        }
        v15 = 0;
        goto LABEL_13;
      }
      if (objc_msgSend(WeakRetained, "_validateGeneratedBroadcastKey:", v10))
      {
        v38 = CFAbsoluteTimeGetCurrent();
        objc_msgSend(WeakRetained, "browser");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "updateBroadcastKeyForIdentifier:key:keyUpdatedStateNumber:keyUpdatedTime:", v40, v10, v11, v38);

        v16 = (void *)MEMORY[0x1D17B7244]();
        v41 = WeakRetained;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v51 = v42;
          v52 = 2112;
          v53 = v10;
          v54 = 2112;
          v55 = v11;
          v56 = 2048;
          v57 = v38;
          _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Saving the read broadcast key: %@, S#: %@ time: %f", buf, 0x2Au);

        }
        v15 = 0;
        v32 = 1;
        goto LABEL_14;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v32 = 0;
      goto LABEL_15;
    }
  }
  v16 = (void *)MEMORY[0x1D17B7244]();
  v17 = WeakRetained;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v19;
    v52 = 2112;
    v53 = v20;
    v54 = 2112;
    v55 = v15;
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate broadcast key with type: %@. Error: %@", buf, 0x20u);

  }
LABEL_13:
  v32 = 0;
LABEL_14:

  objc_autoreleasePoolPop(v16);
LABEL_15:
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke_665;
  v43[3] = &unk_1E894CB00;
  v33 = *(NSObject **)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v44 = v10;
  v45 = v11;
  v48 = a4;
  v49 = v32;
  v46 = v15;
  v47 = v34;
  v35 = v15;
  v36 = v11;
  v37 = v10;
  dispatch_async(v33, v43);

}

uint64_t __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke_665(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
}

void __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CFAbsoluteTime Current;
  int v16;
  double v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  double v34;
  _QWORD block[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getProtocolInfoService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "serviceProperties") & 4) != 0)
  {
    v5 = *(_BYTE *)(a1 + 56) == 2;
    objc_msgSend(*(id *)(a1 + 32), "accessoryCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peripheralInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "broadcastKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "accessoryCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peripheralInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyUpdatedStateNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "accessoryCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peripheralInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyUpdatedTime");
    v14 = v13;

    Current = CFAbsoluteTimeGetCurrent();
    v16 = 0;
    v17 = Current - v14;
    if (!*(_BYTE *)(a1 + 56) && v14 > 0.0 && v17 <= 604800.0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "connectReason") == 3)
      {
        v16 = 0;
      }
      else
      {
        v5 = v4 == 0;
        v18 = (void *)MEMORY[0x1D17B7244]();
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v38 = v21;
          v39 = 2112;
          v40 = v22;
          v41 = 2112;
          v42 = v10;
          v43 = 2048;
          v44 = v17;
          _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Rate limiting BC key generation. BC Key Info: %@ / %@ / %.2fs", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v18);
        v16 = 1;
      }
    }
    if (*(_BYTE *)(a1 + 56) == 1 && v14 > 0.0 && v17 <= 86400.0)
    {
      v5 = v4 == 0;
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v38 = v26;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v10;
        v43 = 2048;
        v44 = v17;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rate limiting BC key refresh. BC Key Info: %@ / %@ / %.2fs", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v23);
      v16 = 1;
    }
    if (!v16 || v5)
    {
      if (v5)
        v29 = 2;
      else
        v29 = *(unsigned __int8 *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "_generateBroadcastKey:queue:withCompletionHandler:", v29, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_658;
      v30[3] = &unk_1E894B008;
      v28 = *(NSObject **)(a1 + 40);
      v33 = *(id *)(a1 + 48);
      v31 = v4;
      v32 = v10;
      v34 = v14;
      dispatch_async(v28, v30);

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E894D498;
    v3 = *(NSObject **)(a1 + 40);
    v36 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
    v4 = v36;
  }

}

uint64_t __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

void __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke_658(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 28, CFSTR("Not generating BC Keys"), CFSTR("Key generated in recent past"), CFSTR("Report the faulty accessory"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(a1 + 56));

}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int8x16_t v36;
  id v37[3];
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  int8x16_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1D17B7244]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v43 = v6;
    v44 = 2112;
    v45 = v2;
    v46 = 2048;
    v47 = v7;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@The connection disconnected with error = %@ duration = %.3f seconds", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if (objc_msgSend(*(id *)(a1 + 40), "connectionState") == 1 && !v2)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Received a disconnection while a connection was in progress", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Connection failed."), CFSTR("Connection was cancelled."), 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "setConnectionState:", 0);
  v12 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_649;
  v40[3] = &unk_1E894E0F8;
  v36 = *(int8x16_t *)(a1 + 32);
  v13 = (id)v36.i64[0];
  *(int8x16_t *)v37 = vextq_s8(v36, v36, 8uLL);
  v41 = *(int8x16_t *)v37;
  __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_649((uint64_t)v40);
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegatesOfConnectionState:withError:", 0, v2);
  objc_msgSend(*(id *)(a1 + 40), "connectionCompletionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1D17B7400]();
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v2);

  objc_msgSend(*(id *)(a1 + 40), "setConnectionCompletionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 40), "discoveryContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 40);
  if (v17)
  {
    if ((objc_msgSend(v18, "_cancelDiscoveryWithError:", v2) & 1) == 0)
      goto LABEL_19;
  }
  else if ((objc_msgSend(v18, "isPaired") & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "isPairing") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsReceivedDuringConnectionStateChange", v37[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
LABEL_19:
      objc_msgSend(*(id *)(a1 + 40), "_resetWithError:", v2);
      v29 = 1;
      goto LABEL_24;
    }
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "operationsReceivedDuringConnectionStateChange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v24;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Rediscovering the accessory with %@ pending operations mid connection state change", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v28 = *(void **)(a1 + 40);
    v38[0] = v12;
    v38[1] = 3221225472;
    v38[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_653;
    v38[3] = &unk_1E894DDF8;
    objc_copyWeak(&v39, (id *)buf);
    objc_msgSend(v28, "_discoverWithType:completionHandler:", 0, v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17B7244]();
    v31 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v33;
      _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_DEBUG, "%{public}@The accessory is unpaired and no pairing operation is in progress, not removing server on disconnection", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(*(id *)(a1 + 40), "_resetWithError:", v2);
  }
  v29 = 0;
LABEL_24:
  v34 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 48));
  v35 = (void *)v34;
  if (v34)
    (*(void (**)(uint64_t, uint64_t))(v34 + 16))(v34, v29);

}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_649(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke_653(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_invokeOperationsReceivedDuringConnectionStateChangeWithError:", v3);

}

void __50___HAPAccessoryServerBTLE200_isReadyForOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "connectionState"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (objc_msgSend(*(id *)(a1 + 32), "connectionState") == 3)
    {
      v2 = (void *)MEMORY[0x1D17B7244]();
      v3 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v5;
        _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is in disconnecting state. Pending an operation block", (uint8_t *)&v7, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      objc_msgSend(*(id *)(a1 + 32), "operationsReceivedDuringConnectionStateChange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", &__block_literal_global_644);

    }
    else if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_kickConnectionIdleTimer");
    }
  }
}

void __71___HAPAccessoryServerBTLE200_handleConnectionWithPeripheral_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled == 1
    && !*(_QWORD *)(a1 + 32)
    && objc_msgSend(*(id *)(a1 + 40), "connectionState") == 2)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v11 = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v7 = "%{public}@Received a connection completion while already connected. Ignoring %@";
LABEL_13:
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 32) || objc_msgSend(*(id *)(a1 + 48), "state") == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "peripheral");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", 0);

      objc_msgSend(*(id *)(a1 + 40), "updatePeripheral:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "peripheral");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 40), "_handleConnectionWithError:", *(_QWORD *)(a1 + 32));
      return;
    }
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v10;
      v7 = "%{public}@Received a connection with invalid connection state. Ignoring %@";
      goto LABEL_13;
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __55___HAPAccessoryServerBTLE200_updateConnectionIdleTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConnectionIdleTime:", *(unsigned __int8 *)(a1 + 40));
}

void __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "connectionState");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E894AAB0;
  objc_copyWeak(v24, a1 + 6);
  v24[1] = (id)v2;
  v4 = v3;
  v22 = v4;
  v23 = a1[5];
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](v21);
  if (v2)
  {
    if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v6 = (void *)MEMORY[0x1D17B7244]();
      v7 = a1[4];
      HMFGetOSLogHandle();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Trying to connect but a connection is already in progress (%@)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    ((void (**)(_QWORD, void *))v5)[2](v5, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244](objc_msgSend(a1[4], "setConnectionCompletionHandler:", v5));
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v20 = v12;
      HMFGetLogIdentifier();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "blePeripheral");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(a1[4], "connectReason"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v15;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Connecting to the peripheral: %@. Connection Reason: %@", buf, 0x20u);

      v12 = v20;
    }

    objc_autoreleasePoolPop(v12);
    objc_msgSend(a1[4], "browser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "connectToBTLEAccessoryServer:", a1[4]);

    objc_msgSend(a1[4], "_restartConnectionIdleTimer:", 15.0);
    objc_msgSend(a1[4], "setConnectionState:", 1);
  }

  objc_destroyWeak(v24);
}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[7];

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56) != 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = v5;

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E894B6C0;
    v10[6] = v6;
    v10[4] = WeakRetained;
    v10[5] = v9;
    __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3((uint64_t)v10);
  }
  v7 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);

}

void __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v4;
  }

}

void __70___HAPAccessoryServerBTLE200__handleSecuritySessionSetupExchangeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to send security session exchange data with error: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v6;
LABEL_10:
    v14 = v13;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = WeakRetained;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@The security session exchange response value, %@, is invalid", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Security session setup exchange failed."), CFSTR("Invalid Pair Verify exchange response."), 0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:
  objc_msgSend(WeakRetained, "securitySession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "receivedSetupExchangeData:error:", v8, v14);

  objc_msgSend(*(id *)(a1 + 32), "setValue:", 0);
}

void __72___HAPAccessoryServerBTLE200_evaluateConnectionStateForOperation_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  void (**v16)(void);
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "connectionState") == 3
    || (objc_msgSend(*(id *)(a1 + 32), "operationsReceivedDuringConnectionStateChange"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "operationsReceivedDuringConnectionStateChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "addObject:", v5);

    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "operationsReceivedDuringConnectionStateChange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding block for operation: %@ due to connection state: %@. Count: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v15 = (void (**)(void))MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
    if (v15)
    {
      v16 = v15;
      v15[2]();
      v15 = v16;
    }

  }
}

void __78___HAPAccessoryServerBTLE200__sendProtocolInfoServiceExchangeData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Protocol Exchange error: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (objc_msgSend(v5, "statusCode"))
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = WeakRetained;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v15;
        v21 = 1024;
        LODWORD(v22) = objc_msgSend(v5, "statusCode");
        _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Protocol Exchange failed with status: %d", (uint8_t *)&v19, 0x12u);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "body");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v17);
    }

  }
}

void __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  HAPBTLETransactionIdentifier *v18;
  void *v19;
  HAPBTLETransactionIdentifier *v20;
  HAPBTLEControlOutputStream *v21;
  void *v22;
  HAPBTLEControlOutputStream *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "characteristic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "serialize");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v10;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Serialized Request '%@/%@' -> %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v16 = objc_msgSend(a1[4], "_maximumControlWriteLengthForRequest:", a1[5]);
  if (v16)
  {
    v17 = v16;
    v18 = [HAPBTLETransactionIdentifier alloc];
    objc_msgSend(a1[5], "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v18, "initWithUnsignedCharValue:", objc_msgSend(v19, "unsignedCharValue"));

    v21 = [HAPBTLEControlOutputStream alloc];
    objc_msgSend(a1[5], "serialize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HAPBTLEControlOutputStream initWithControlType:transactionIdentifier:controlPayload:mtuLength:timeoutInterval:](v21, "initWithControlType:transactionIdentifier:controlPayload:mtuLength:timeoutInterval:", 0, v20, v22, v17, 4.0);

    -[HAPBTLEControlOutputStream setDelegate:](v23, "setDelegate:", a1[4]);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_604;
    v32 = &unk_1E894D798;
    v33 = a1[4];
    v34 = a1[6];
    -[HAPBTLEControlOutputStream setCompletionHandler:](v23, "setCompletionHandler:", &v29);
    objc_msgSend(a1[4], "_suspendConnectionIdleTimer", v29, v30, v31, v32, v33);
    objc_msgSend(a1[5], "setControlOutputStream:", v23);
    objc_msgSend(a1[4], "pendingRequests");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", a1[5]);

    -[HAPBTLEControlOutputStream open](v23, "open");
LABEL_11:

    return;
  }
  v25 = (void *)MEMORY[0x1D17B7244]();
  v26 = a1[4];
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v28;
    _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the control write length", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Control write failed."), CFSTR("Failed to determine the control write length"), 0, 0);
    v20 = (HAPBTLETransactionIdentifier *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_11;
  }
}

void __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_604(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E894D5E0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_2;
    v6[3] = &unk_1E894AEA0;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_reallySendRequest:completionHandler:", v5, v6);

    objc_destroyWeak(&v9);
  }

}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_3(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_4;
  v8[3] = &unk_1E894AF18;
  v8[4] = WeakRetained;
  v9 = a1[4];
  v6 = a1[5];
  v10 = v4;
  v11 = v6;
  v7 = v4;
  objc_copyWeak(&v12, v2);
  objc_copyWeak(&v13, a1 + 7);
  dispatch_async(v5, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_pendingResponseForRequest:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "pendingRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(v2 + 8));

  objc_msgSend(*(id *)v2, "pendingResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v3, v7);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_outstandingRequests"))
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Resuming connection idle timer as there are no outstanding requests", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "_resumeConnectionIdleTimer");
  }
  objc_msgSend(*(id *)(a1 + 48), "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_msgSend(*(id *)(a1 + 32), "_shouldIgnoreRetryDiscoveryError:", v12) & 1) == 0)
  {
    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_597;
    v14[3] = &unk_1E894AEF0;
    objc_copyWeak(&v15, (id *)(a1 + 64));
    objc_copyWeak(&v16, (id *)(a1 + 72));
    objc_msgSend(v13, "_disconnectWithDisconnectionError:completionHandler:", 0, v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
  }

}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_597(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from the accessory, resetting the server", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_resetWithError:", v10);

  }
}

void __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v7)
  {
    objc_msgSend(a1[4], "cancelWithError:", v7);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0D286C8]);
    objc_msgSend(a1[5], "timeoutInterval");
    v5 = (void *)objc_msgSend(v4, "initWithTimeInterval:options:", 1);
    objc_msgSend(v5, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegateQueue:", v6);

    objc_msgSend(a1[5], "setResponseTimer:", v5);
    objc_msgSend(WeakRetained, "_requestResponseForRequest:", a1[5]);

  }
}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!v3)
  {
    objc_msgSend(WeakRetained, "identifyCharacteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_2;
      v20[3] = &unk_1E894AE78;
      v12 = &v21;
      v13 = *(id *)(a1 + 32);
      v20[4] = v5;
      v21 = v13;
      v14 = (void *)MEMORY[0x1D17B7400](v20);
      objc_msgSend(v5, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", MEMORY[0x1E0C9AAB0], v11, 0, 0, 0, v14);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = v5;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Identify failed, missing the Identify characteristic", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      if (!*(_QWORD *)(a1 + 32))
      {
        v11 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v16, "clientQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_593;
      v22[3] = &unk_1E894D498;
      v12 = &v23;
      v23 = *(id *)(a1 + 32);
      dispatch_async(v19, v22);

    }
LABEL_13:

    goto LABEL_14;
  }
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = v5;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2112;
    v30 = v3;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cancelling operation, identity discovery failed with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v7, "clientQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_588;
    block[3] = &unk_1E894D5E0;
    v25 = v3;
    v26 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    v11 = v25;
    goto LABEL_13;
  }
LABEL_14:

}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_588(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Identify failed."), CFSTR("Discovery of the Identify characteristic failed."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_593(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Identify failed."), CFSTR("Missing Identify characteristic."), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_3;
    v6[3] = &unk_1E894D5E0;
    v8 = *(id *)(a1 + 40);
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72___HAPAccessoryServerBTLE200__sendPairingRequestData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (*v13)(void);
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    objc_msgSend(v5, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = WeakRetained;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, the response value is invalid", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      if (*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing operation failed."), CFSTR("Pairing response is invalid."), 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      }
      goto LABEL_10;
    }
    v14 = *(_QWORD *)(a1 + 32);
    if (!v14)
    {
LABEL_10:

      goto LABEL_11;
    }
    v13 = *(void (**)(void))(v14 + 16);
LABEL_9:
    v13();
    goto LABEL_10;
  }
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to write pairing request data with error: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing operation failed."), CFSTR("Pairing write failed."), 0, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_11:

}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _BYTE location[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  +[HAPPairingUtilities createListPairingsRequest:](HAPPairingUtilities, "createListPairingsRequest:", &v22);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v22;
  if (v2)
  {
    v4 = a1 + 4;
    objc_initWeak((id *)location, a1[4]);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
    v15 = &unk_1E894AE50;
    objc_copyWeak(&v18, (id *)location);
    v16 = a1[5];
    v17 = a1[6];
    v5 = (void *)MEMORY[0x1D17B7400](&v12);
    objc_msgSend(*v4, "_sendPairingRequestData:completionHandler:", v2, v5, v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v9;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create list pairings request payload with error: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = a1[5];
    if (v10)
    {
      v11 = a1[6];
      if (v11)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_573;
        block[3] = &unk_1E894D5E0;
        v21 = v11;
        v20 = v3;
        dispatch_async(v10, block);

      }
    }
  }

}

uint64_t __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_573(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    v25 = 0;
    +[HAPPairingUtilities parseListPairingsResponse:error:](HAPPairingUtilities, "parseListPairingsResponse:error:", v5, &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (!v8)
    {
      v10 = (void *)MEMORY[0x1D17B7244]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v13;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to list pairings, peer responded with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
    v14 = *(NSObject **)(a1 + 32);
    if (v14)
    {
      v15 = *(void **)(a1 + 40);
      if (v15)
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_579;
        v21[3] = &unk_1E894D9E8;
        v24 = v15;
        v22 = v8;
        v23 = v9;
        dispatch_async(v14, v21);

      }
    }

    goto LABEL_10;
  }
  v16 = (void *)MEMORY[0x1D17B7244]();
  v17 = WeakRetained;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v19;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairings with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = *(NSObject **)(a1 + 32);
  if (v20 && *(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_574;
    block[3] = &unk_1E894D5E0;
    v27 = v6;
    v28 = *(id *)(a1 + 40);
    dispatch_async(v20, block);

    v9 = v27;
LABEL_10:

  }
}

void __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_574(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("List pairings failed."), CFSTR("List pairings write failed."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke_579(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_571(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to remove current controller completed with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = v3;
  objc_msgSend(v6, "browser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deRegisterAccessoryWithIdentifier:", v11);

  objc_msgSend(v6, "keyStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v14 = objc_msgSend(v12, "removeAccessoryKeyForName:error:", v13, &v41);
  v15 = v41;

  if ((v14 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v19;
      v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to remove the current controller keychain entry with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  objc_msgSend(v6, "keyStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v15;
  v22 = objc_msgSend(v20, "deletePeripheralIdentifierForAccessoryIdentifier:error:", v21, &v40);
  v23 = v40;

  if ((v22 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1D17B7244]();
    v25 = v6;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v23;
      _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Failed to remove the peripheral keychain entry for %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v24);
  }
  v29 = *(NSObject **)(a1 + 32);
  v30 = MEMORY[0x1E0C809B0];
  if (v29)
  {
    v31 = *(void **)(a1 + 40);
    if (v31)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_572;
      block[3] = &unk_1E894D498;
      v39 = v31;
      dispatch_async(v29, block);

      v29 = *(NSObject **)(a1 + 32);
    }
  }
  v34[0] = v30;
  v34[1] = 3221225472;
  v34[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_2;
  v34[3] = &unk_1E894D810;
  v35 = v29;
  v32 = *(id *)(a1 + 48);
  v36 = v9;
  v37 = v32;
  v33 = v9;
  objc_msgSend(v6, "_disconnectWithDisconnectionError:completionHandler:", 0, v34);

}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_572(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v1 = *(NSObject **)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_3;
      v4[3] = &unk_1E894D5E0;
      v6 = v3;
      v5 = *(id *)(a1 + 40);
      dispatch_async(v1, v4);

    }
  }
}

uint64_t __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessoryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheralInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetBroadcastKeyConfig");

  v4 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createRemovePairingRequestForPairingIdentity:error:", v4, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  if (v5)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2;
    v17 = &unk_1E894CAD8;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v7 = (void *)MEMORY[0x1D17B7400](&v14);
    objc_msgSend(*(id *)(a1 + 32), "_sendPairingRequestData:completionHandler:", v5, v7, v14, v15, v16, v17, v18);

    v8 = v19;
LABEL_3:

    goto LABEL_4;
  }
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing request payload with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = *(NSObject **)(a1 + 48);
  if (v13 && *(_QWORD *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_559;
    block[3] = &unk_1E894D5E0;
    v22 = v6;
    v23 = *(id *)(a1 + 56);
    dispatch_async(v13, block);

    v8 = v22;
    goto LABEL_3;
  }
LABEL_4:

}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_559(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Remove pairing failed."), CFSTR("Failed to create remove pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v27 = 0;
    v7 = +[HAPPairingUtilities parseRemovePairingResponse:error:](HAPPairingUtilities, "parseRemovePairingResponse:error:", v5, &v27);
    v8 = v27;
    if (v7)
    {
      v9 = *(NSObject **)(a1 + 40);
      if (!v9)
        goto LABEL_17;
      v10 = *(void **)(a1 + 48);
      if (!v10)
        goto LABEL_17;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2_570;
      v22[3] = &unk_1E894D498;
      v11 = &v23;
      v23 = v10;
      dispatch_async(v9, v22);
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17B7244]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing, peer responded with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v21 = *(NSObject **)(a1 + 40);
      if (!v21 || !*(_QWORD *)(a1 + 48))
        goto LABEL_17;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_567;
      v24[3] = &unk_1E894D5E0;
      v11 = &v25;
      v25 = v8;
      v26 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);

    }
LABEL_17:

    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v15;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove pairing with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = *(NSObject **)(a1 + 40);
  if (v16 && *(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_564;
    block[3] = &unk_1E894D5E0;
    v29 = v6;
    v30 = *(id *)(a1 + 48);
    dispatch_async(v16, block);

    v8 = v29;
    goto LABEL_17;
  }
LABEL_18:

}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_564(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Remove pairing failed."), CFSTR("Remove pairing write failed."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_567(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Remove pairing failed."), CFSTR("The peer failed to remove the pairing."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke_2_570(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v23 = 0;
  +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:error:](HAPPairingUtilities, "createAddPairingRequestForPairingIdentity:error:", v2, &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v3)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2;
    v16 = &unk_1E894CAD8;
    v5 = *(void **)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = v5;
    v19 = *(id *)(a1 + 56);
    v6 = (void *)MEMORY[0x1D17B7400](&v13);
    objc_msgSend(*(id *)(a1 + 40), "_sendPairingRequestData:completionHandler:", v3, v6, v13, v14, v15, v16, v17);

    v7 = v18;
LABEL_3:

    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing request payload with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = *(NSObject **)(a1 + 48);
  if (v12 && *(_QWORD *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_546;
    block[3] = &unk_1E894D5E0;
    v21 = v4;
    v22 = *(id *)(a1 + 56);
    dispatch_async(v12, block);

    v7 = v21;
    goto LABEL_3;
  }
LABEL_4:

}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_546(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Add pairing failed."), CFSTR("Failed to create add pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v27 = 0;
    v7 = +[HAPPairingUtilities parseAddPairingResponse:error:](HAPPairingUtilities, "parseAddPairingResponse:error:", v5, &v27);
    v8 = v27;
    if (v7)
    {
      v9 = *(NSObject **)(a1 + 40);
      if (!v9)
        goto LABEL_17;
      v10 = *(void **)(a1 + 48);
      if (!v10)
        goto LABEL_17;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2_557;
      v22[3] = &unk_1E894D498;
      v11 = &v23;
      v23 = v10;
      dispatch_async(v9, v22);
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17B7244]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2112;
        v34 = v8;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to add pairing, peer responded with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v21 = *(NSObject **)(a1 + 40);
      if (!v21 || !*(_QWORD *)(a1 + 48))
        goto LABEL_17;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_554;
      v24[3] = &unk_1E894D5E0;
      v11 = &v25;
      v25 = v8;
      v26 = *(id *)(a1 + 48);
      dispatch_async(v21, v24);

    }
LABEL_17:

    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v15;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to add pairing with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  v16 = *(NSObject **)(a1 + 40);
  if (v16 && *(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_551;
    block[3] = &unk_1E894D5E0;
    v29 = v6;
    v30 = *(id *)(a1 + 48);
    dispatch_async(v16, block);

    v8 = v29;
    goto LABEL_17;
  }
LABEL_18:

}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_551(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Add pairing failed."), CFSTR("Add pairing write failed."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_554(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Add pairing failed."), CFSTR("The peer failed to add the pairing."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke_2_557(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[7];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  v15 = v3;
  objc_msgSend(v15, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (v9)
  {
    objc_msgSend(v15, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2;
  v16[3] = &unk_1E894B6C0;
  v16[4] = *(_QWORD *)(a1 + 40);
  v16[6] = v6;
  v12 = v10;
  v16[5] = v12;
  __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2((uint64_t)v16);
  v13 = *(void **)(a1 + 40);
  if (v15)
  {
    objc_msgSend(v13, "authSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "authSession:authComplete:", v14, v15);

  }
  else
  {
    objc_msgSend(v13, "authenticateAccessory");
  }

}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "authenticatedProtocolInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryServer:validateCert:model:", v3, v2, v5);

}

void __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v4;
  }

}

void __84___HAPAccessoryServerBTLE200_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD, void *);

  objc_msgSend(*(id *)(a1 + 32), "setupCodeCompletionHandler");
  v4 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid setup code."), CFSTR("The setup code is nil"), 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = *(_QWORD *)(a1 + 40);
    }
    v4[2](v4, v2, v3);
    objc_msgSend(*(id *)(a1 + 32), "setSetupCodeCompletionHandler:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "_resumeConnectionIdleTimer");

}

void __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "pairSetupBackoffTimeInterval");
  objc_msgSend(v4, "accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:", v2, (uint64_t)v3);

}

void __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:promptUserForPasswordWithType:", *(_QWORD *)(a1 + 32), 1);

}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[7];

  v6 = a2;
  HAPPairingStateFromData(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = v6;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2;
  v7[3] = &unk_1E894E120;
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = v3;
  v7[6] = v5;
  __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2((uint64_t)v7);

}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_528(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Pair Setup exchange data with error: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = v6;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x1D17B7244]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v16;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@The Pair Setup exchange response value, %@, is invalid", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing Failed."), CFSTR("Invalid Pair Setup exchange response."), 0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "pairSetupSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "receivedSetupExchangeData:error:", v7, v12);

  objc_msgSend(*(id *)(a1 + 40), "setValue:", 0);
}

void __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 48), "domain");

    objc_msgSend(*(id *)(a1 + 48), "code");
    v2 = v3;
  }

}

void __51___HAPAccessoryServerBTLE200_stopPairingWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 32), "isPairing"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Pairing cancelled."), 0, 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairSetupSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3, "pairSetupSession");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopWithError:", v11);

    }
    else
    {
      objc_msgSend(v3, "_pairingCompletedWithError:", v11);
    }

  }
  else if (!objc_msgSend(*(id *)(a1 + 32), "pendingRemovePairing"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isPaired") & 1) != 0)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "keyStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readControllerPairingKeyForAccessory:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "setPendingRemovePairing:", 1);
      objc_msgSend(*(id *)(a1 + 32), "discoveryContext");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8
        || (v9 = (void *)v8, v10 = objc_msgSend(*(id *)(a1 + 32), "isSecuritySessionOpen"), v9, v10))
      {
        objc_msgSend(*(id *)(a1 + 32), "_removePairingOfAccessoryServerCancelledMidPairing");
      }
    }
  }
}

uint64_t __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_2;
  v3[3] = &unk_1E894DD58;
  v3[4] = v1;
  return objc_msgSend(v1, "connectWithCompletionHandler:", v3);
}

void __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  HAPPairSetupSession *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to connect to the accessory with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Failed to connect to accessory."), 0, 0, v3);
    v9 = (HAPPairSetupSession *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_pairingCompletedWithError:", v9);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 32), "authMethod");
      if (v11 > 6)
        v12 = CFSTR("HAPAuthMethodUnknown");
      else
        v12 = off_1E8948F80[v11];
      v13 = v12;
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting the Pair Setup session with authMethods: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setBadPairSetupCode:", 0);
    v9 = -[HAPPairSetupSession initWithRole:pairSetupType:delegate:]([HAPPairSetupSession alloc], "initWithRole:pairSetupType:delegate:", 0, objc_msgSend(*(id *)(a1 + 32), "_getPairSetupType"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pauseScans");

    objc_msgSend(*(id *)(a1 + 32), "setPairSetupSession:", v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_517;
    v15[3] = &unk_1E894DD08;
    v15[4] = *(_QWORD *)(a1 + 32);
    __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_517((uint64_t)v15);
    -[HAPPairSetupSession start](v9, "start");
  }

}

void __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke_517(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_getPairSetupType");
    v2 = v3;
  }

}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[7];

  v9 = a3;
  objc_msgSend(v9, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v9;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E894B6C0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[6] = a2;
  v7 = v6;
  v10[5] = v7;
  __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2((uint64_t)v10);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);

}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_509(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void (*v12)(void);
  id v13;
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to read the Pairing Features characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Pairing Failed."), CFSTR("Failed to read the Pairing Features characteristic"), 0, v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v13 = 0;
    *(_QWORD *)buf = 0;
    objc_msgSend(*(id *)(a1 + 32), "_parsePairingFeaturesCharacteristic:authMethod:error:", *(_QWORD *)(a1 + 40), buf, &v13);
    v11 = v13;
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v12();

}

void __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v3;
  }

}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  char v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to discover the accessory with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Pairing Failed."), CFSTR("Failed to discovery the accessory."), 0, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_pairingCompletedWithError:", v9);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Determining if MFi Pair Setup is supported, consentRequired: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_493;
    v13[3] = &unk_1E894ADB0;
    v13[4] = v12;
    v14 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v12, "_getPairingFeaturesWithCompletionHandler:", v13);
  }

}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_493(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  HAPAccessoryInfo *v20;
  void *v21;
  void *v22;
  HAPAccessoryInfo *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HAPAccessoryInfo *v30;
  void *v31;
  void *v32;
  HAPAccessoryInfo *v33;
  NSObject *v34;
  HAPAccessoryInfo *v35;
  HAPAccessoryInfo *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD block[5];
  HAPAccessoryInfo *v44;
  _QWORD v45[5];
  HAPAccessoryInfo *v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v9;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, failed to get the pairing features with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("Failed to get the pairing features.");
    v12 = 2;
    v13 = v5;
    goto LABEL_5;
  }
  if (a2 != 5 && a2)
  {
    v29 = *(void **)(a1 + 32);
    if (a2 != 1 || !*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v29, "continuePairingAfterAuthPrompt");
      goto LABEL_6;
    }
    if (objc_msgSend(v29, "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
    {
      v30 = [HAPAccessoryInfo alloc];
      objc_msgSend(*(id *)(a1 + 32), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "category");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v30, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v31, 0, 0, v32, 0, 0, 0);

      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_502;
      block[3] = &unk_1E894E0F8;
      block[4] = *(_QWORD *)(a1 + 32);
      v44 = v33;
      v35 = v33;
      dispatch_async(v34, block);

      v36 = v44;
LABEL_27:

      goto LABEL_6;
    }
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v28;
      goto LABEL_16;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = off_1E8948F80[a2];
      *(_DWORD *)buf = 138543618;
      v49 = v18;
      v50 = 2112;
      v51 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Incompatible auth %@, prompting user", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_requestUserPermission_accessoryInfo_error_))
    {
      v20 = [HAPAccessoryInfo alloc];
      objc_msgSend(*(id *)(a1 + 32), "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "category");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HAPAccessoryInfo initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:](v20, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v21, 0, 0, v22, 0, 0, 0);

      if (a2)
      {
        v24 = 4;
      }
      else
      {
        v37 = (void *)MEMORY[0x1D17B7244]();
        v38 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v40;
          _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_INFO, "%{public}@The accessory does not support pair setup auth, prompting for user permission to pair the accessory", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v37);
        v24 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v41 = objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_499;
      v45[3] = &unk_1E894B6C0;
      v42 = *(_QWORD *)(a1 + 32);
      v46 = v23;
      v47 = v24;
      v45[4] = v42;
      v35 = v23;
      dispatch_async(v41, v45);

      v36 = v46;
      goto LABEL_27;
    }
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v28;
LABEL_16:
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the pairing requires additional authentication and the delegate does not support additional authentication requests", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v25);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = CFSTR("The delegate is missing.");
  v12 = 9;
  v13 = 0;
LABEL_5:
  objc_msgSend(v10, "hapErrorWithCode:description:reason:suggestion:underlyingError:", v12, CFSTR("Pairing Failed."), v11, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_pairingCompletedWithError:", v14);

LABEL_6:
}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_499(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);

}

void __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke_502(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40), 0);

}

void __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPairingActivity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPairingRequest:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "isPaired"))
  {
    v2 = CFSTR("Pairing not supported on paired accessory.");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 18, CFSTR("Pairing not supported on paired accessory."), 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isPairing"))
  {
    v2 = CFSTR("An existing pairing session is already in progress.");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("An existing pairing session is already in progress."), 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v2;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesPairingStopped:", v3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting Pair Setup", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_485;
    v15 = &unk_1E894E0F8;
    v16 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    v17 = v11;
    __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_485((uint64_t)&v12);
    objc_msgSend(*(id *)(a1 + 32), "setPairingDisconnectionError:", 0, v12, v13, v14, v15, v16);
    objc_msgSend(*(id *)(a1 + 32), "setPairing:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_checkForAuthPrompt:", objc_msgSend(*(id *)(a1 + 48), "requiresUserConsent"));

  }
}

void __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke_485(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 40), "requiresUserConsent");
    v3 = (id)HMFBooleanToString();
    v2 = v4;
  }

}

void __97___HAPAccessoryServerBTLE200__enableBroadcastEvent_interval_forCharacteristic_completionHandler___block_invoke(void **a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure characteristic with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    _callCharacteristicOperationCompletion(a1[4], a1[5], 3, v6, CFSTR("Configure Characteristic request failed."));
  }
  else if (objc_msgSend(v5, "statusCode"))
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 1024;
      LODWORD(v33) = objc_msgSend(v5, "statusCode");
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed with status: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = a1[4];
    v16 = a1[5];
    v18 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v5, "statusCode");
    objc_msgSend(v18, "hapErrorWithCode:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _callCharacteristicOperationCompletion(v17, v16, 3, v28, CFSTR("Response with failure status code"));

  }
  else
  {
    v29 = 0;
    v19 = objc_msgSend((id)objc_opt_class(), "parseCharacteristicConfigurationResponse:error:", v5, &v29);
    v20 = v29;
    if ((v19 & 1) != 0)
    {
      _callCharacteristicOperationCompletion(a1[4], a1[5], 3, 0, 0);
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = WeakRetained;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        v32 = 2112;
        v33 = v20;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic configuration response with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v26 = a1[4];
      v25 = a1[5];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _callCharacteristicOperationCompletion(v26, v25, 3, v27, CFSTR("Configure characteristic response invalid."));

    }
  }

}

void __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_473(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = (void *)MEMORY[0x1D17B7244]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Completed multiple broadcast enable requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_474;
      v9[3] = &unk_1E894D5E0;
      v11 = v8;
      v10 = *(id *)(a1 + 40);
      dispatch_async(v7, v9);

    }
  }

}

uint64_t __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_474(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E894D658;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_configureCharacteristics:queue:withCompletionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = a1;
  v21 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "error", v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = (void *)MEMORY[0x1D17B7244]();
          v15 = WeakRetained;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "characteristic");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v27 = v17;
            v28 = 2112;
            v29 = v18;
            _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Configured characteristic %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  v19 = *(_QWORD *)(v20 + 32);
  if (v19)
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v7, v21);

}

void __86___HAPAccessoryServerBTLE200__configureBroadcastKeyGeneration_service_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  uint64_t v29;
  CFAbsoluteTime Current;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v10;
    v44 = 2112;
    v45 = v11;
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Did configure for broadcast key generation type: %@ with error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v6)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure for broadcast key"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("Protocol config request failed.");
      v16 = v13;
      v17 = v14;
      v18 = v6;
LABEL_11:
      objc_msgSend(v16, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, v17, v15, 0, v18);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
LABEL_20:

    }
  }
  else
  {
    if (!objc_msgSend(v5, "statusCode"))
    {
      v40 = 0;
      v41 = 0;
      v39 = 0;
      v26 = objc_msgSend((id)objc_opt_class(), "parseProtocolConfigurationResponse:key:stateNumber:error:", v5, &v41, &v40, &v39);
      v27 = v41;
      v28 = v40;
      v25 = v39;
      if ((v26 & 1) != 0)
      {
        v29 = *(_QWORD *)(a1 + 48);
        if (v29)
        {
          Current = CFAbsoluteTimeGetCurrent();
          (*(void (**)(uint64_t, id, id, uint64_t, _QWORD, CFAbsoluteTime))(v29 + 16))(v29, v27, v28, 1, 0, Current);
        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1D17B7244]();
        v32 = WeakRetained;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v34;
          v44 = 2112;
          v45 = v25;
          _os_log_impl(&dword_1CCE01000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse protocol configuration response with error: %@", buf, 0x16u);

          v31 = v38;
        }

        objc_autoreleasePoolPop(v31);
        if (*(_QWORD *)(a1 + 48))
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure service %@."), *(_QWORD *)(a1 + 40));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, v36, CFSTR("Protocol config response was invalid."), 0, v25);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
        }
      }

      goto LABEL_20;
    }
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v5, "statusCode");
      *(_DWORD *)buf = 138543618;
      v43 = v22;
      v44 = 1024;
      LODWORD(v45) = v23;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Protocol Config failed with status: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v19);
    if (*(_QWORD *)(a1 + 48))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protocol Config failed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("Response with failure status code");
      v16 = v24;
      v17 = v14;
      v18 = 0;
      goto LABEL_11;
    }
  }

}

void __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v10, "characteristic");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count")
    && objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke_2;
    v14[3] = &unk_1E894E0F8;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v4;
    dispatch_async(v13, v14);

  }
}

void __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "stateNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v3, v2, v4, 0);

}

uint64_t __85___HAPAccessoryServerBTLE200__performEnableEvent_toCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2);
  return result;
}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_447(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events on characteristic with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(v5, "setEventNotificationsEnabled:", *(unsigned __int8 *)(a1 + 56));
  }
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = *(NSObject **)(a1 + 40);
    if (v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_448;
      block[3] = &unk_1E894D9E8;
      v16 = v11;
      v14 = v5;
      v15 = v6;
      dispatch_async(v12, block);

    }
  }

}

uint64_t __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_448(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_431(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(v5, "setEventNotificationsEnabled:", *(_BYTE *)(a1 + 56) == 0);
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "instanceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v17 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@/%@ with error: %@", buf, 0x34u);

      v9 = v17;
    }

    objc_autoreleasePoolPop(v9);
  }
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_432(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
  v6[3] = &unk_1E894AD10;
  v5 = *(_QWORD *)(a1 + 72);
  v6[4] = v3;
  v11 = v5;
  v7 = v2;
  v12 = *(_BYTE *)(a1 + 80);
  v10 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_readCharacteristicValues:queue:completionHandler:", v7, v4, v6);

}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_437(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_442(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD block[4];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v47 = a1;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = (uint64_t)v10;
      v60 = 2112;
      v61 = (uint64_t)v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristic values with error: %@", buf, 0x16u);

      a1 = v47;
    }

    objc_autoreleasePoolPop(v7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  }
  else
  {
    v44 = 0;
    v45 = v5;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v19 = v5;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v55;
      v46 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v24, "error", v44, v45);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)MEMORY[0x1D17B7244]();
            v27 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "characteristic");
              v48 = v26;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "shortDescription");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "error");
              v32 = v19;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v59 = (uint64_t)v29;
              v60 = 2112;
              v61 = (uint64_t)v31;
              v62 = 2112;
              v63 = v33;
              _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to read value for characteristic, %@, with error: %@", buf, 0x20u);

              v26 = v48;
              v19 = v32;

              a1 = v47;
              v22 = v46;
            }

            objc_autoreleasePoolPop(v26);
            objc_msgSend(v24, "error");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v36 = *(void **)(v35 + 40);
            *(_QWORD *)(v35 + 40) = v34;

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v21);
    }

    v37 = (void *)MEMORY[0x1D17B7244]();
    v38 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 138543618;
      v59 = (uint64_t)v40;
      v60 = 2048;
      v61 = v41;
      _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_INFO, "%{public}@Read values for %lu Characteristics supporting Events", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    v6 = v44;
    v5 = v45;
    if (objc_msgSend(*(id *)(a1 + 40), "count")
      && objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v42 = objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_435;
      v52[3] = &unk_1E894E0F8;
      v43 = *(void **)(a1 + 40);
      v52[4] = *(_QWORD *)(a1 + 32);
      v53 = v43;
      dispatch_async(v42, v52);

    }
  }
  v11 = (void *)MEMORY[0x1D17B7244]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("enable");
    if (!*(_BYTE *)(a1 + 80))
      v16 = CFSTR("disable");
    *(_DWORD *)buf = 138543618;
    v59 = v14;
    v60 = 2112;
    v61 = (uint64_t)v16;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Completed multiple %@ event requests", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v17 = *(void **)(a1 + 64);
  if (v17)
  {
    v18 = *(NSObject **)(a1 + 48);
    if (v18)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_436;
      block[3] = &unk_1E894D5E0;
      v51 = v17;
      v50 = *(id *)(a1 + 56);
      dispatch_async(v18, block);

    }
  }

}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_435(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "stateNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v3, v4, v5, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setStateChanged:", 0);
}

uint64_t __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_436(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __90___HAPAccessoryServerBTLE200_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableEvents:forCharacteristics:withCompletionHandler:queue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __105___HAPAccessoryServerBTLE200__performTimedWriteExecuteForCharacteristic_value_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v11;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute write to characteristic with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v12, "instanceID");

    objc_msgSend(v6, "domain");
    objc_msgSend(v6, "code");

    _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, v6, CFSTR("Execute timed write request failed."));
    goto LABEL_24;
  }
  if (!objc_msgSend(v5, "statusCode"))
  {
    v21 = *(id *)(a1 + 48);
    v22 = v21;
    if ((*(_BYTE *)(a1 + 72) & 2) != 0)
    {
      v39 = 0;
      v40 = v21;
      v24 = objc_msgSend((id)objc_opt_class(), "parseWriteResponse:value:error:", v5, &v40, &v39);
      v23 = v40;

      v25 = v39;
      v26 = v25;
      if ((v24 & 1) == 0)
      {
        v30 = (void *)MEMORY[0x1D17B7244]();
        v31 = WeakRetained;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v33;
          v43 = 2114;
          v44 = v26;
          _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic execute response with error: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        v34 = *(void **)(a1 + 40);
        v35 = *(id *)(a1 + 32);
        objc_msgSend(v34, "instanceID");

        objc_msgSend(v26, "domain");
        objc_msgSend(v26, "code");

        _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, v26, CFSTR("Execute timed write response invalid."));
        goto LABEL_23;
      }

    }
    else
    {
      v23 = v21;
    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:", v23);
    objc_msgSend(*(id *)(a1 + 40), "instanceID");

    objc_msgSend(v5, "statusCode");
    objc_msgSend(*(id *)(a1 + 40), "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v27, "isEqualToString:", CFSTR("0000001E-0000-1000-8000-0026BB765291")))
    {
      objc_msgSend(*(id *)(a1 + 40), "type");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v28, "isEqualToString:", CFSTR("00000032-0000-1000-8000-0026BB765291")))
      {
        objc_msgSend(*(id *)(a1 + 40), "type");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v29, "isEqualToString:", CFSTR("0000007C-0000-1000-8000-0026BB765291")))
        {
          objc_msgSend(*(id *)(a1 + 40), "type");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("00000067-0000-1000-8000-0026BB765291"));

          if ((v38 & 1) == 0)
            objc_msgSend(WeakRetained, "markNotifyingCharacteristicUpdatedforCharacteristic:", *(_QWORD *)(a1 + 40));
          goto LABEL_19;
        }

      }
    }

LABEL_19:
    _callCharacteristicOperationCompletion(*(void **)(a1 + 40), *(void **)(a1 + 56), 2, 0, 0);
LABEL_23:

    goto LABEL_24;
  }
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = WeakRetained;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v17;
    v43 = 1024;
    LODWORD(v44) = objc_msgSend(v5, "statusCode");
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Received response to prepare with status code: 0x%02x", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(*(id *)(a1 + 40), "instanceID");

  objc_msgSend(v5, "statusCode");
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(a1 + 56);
  v20 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "statusCode");
  objc_msgSend(v20, "hapErrorWithCode:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _callCharacteristicOperationCompletion(v18, v19, 2, v36, CFSTR("Execute response returned non-zero status code."));

LABEL_24:
}

void __138___HAPAccessoryServerBTLE200__performTimedWritePrepareWithValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v10;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare timed write to characteristic with error: %{public}@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void **)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v11, "instanceID");

    objc_msgSend(v6, "domain");
    objc_msgSend(v6, "code");

    v13 = *(void **)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v15 = CFSTR("Prepare timed write request failed.");
    v16 = v6;
    goto LABEL_5;
  }
  if (!objc_msgSend(v5, "statusCode"))
  {
    v13 = *(void **)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v16 = 0;
    v15 = 0;
LABEL_5:
    _callCharacteristicOperationCompletion(v13, v14, 2, v16, v15);
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x1D17B7244]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v20;
    v27 = 1024;
    LODWORD(v28) = objc_msgSend(v5, "statusCode");
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received response to prepare write with status code: 0x%02x", (uint8_t *)&v25, 0x12u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(*(id *)(a1 + 48), "instanceID");

  objc_msgSend(v5, "statusCode");
  v22 = *(void **)(a1 + 48);
  v21 = *(void **)(a1 + 56);
  v23 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "statusCode");
  objc_msgSend(v23, "hapErrorWithCode:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _callCharacteristicOperationCompletion(v22, v21, 2, v24, CFSTR("Prepare timed write response returned non-zero status code."));

LABEL_11:
}

void __127___HAPAccessoryServerBTLE200__performTimedWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performTimedWriteExecuteForCharacteristic:value:options:completionHandler:", v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  objc_msgSend(*(id *)(a1 + 32), "requestOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSuspended");

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "_resumeAllOperations");

}

void __122___HAPAccessoryServerBTLE200__performWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!v6)
  {
    v15 = *(id *)(a1 + 48);
    v16 = v15;
    if ((*(_BYTE *)(a1 + 72) & 2) != 0)
    {
      v31 = 0;
      v32 = v15;
      v18 = objc_msgSend((id)objc_opt_class(), "parseWriteResponse:value:error:", v5, &v32, &v31);
      v17 = v32;

      v19 = v31;
      v20 = v19;
      if ((v18 & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1D17B7244]();
        v26 = WeakRetained;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v28;
          v35 = 2114;
          v36 = v20;
          _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic write response with error: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v29 = *(void **)(a1 + 32);
        v30 = *(id *)(a1 + 40);
        objc_msgSend(v29, "instanceID");

        objc_msgSend(v20, "domain");
        objc_msgSend(v20, "code");

        _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, v20, CFSTR("Write response failed."));
        goto LABEL_15;
      }

    }
    else
    {
      v17 = v15;
    }
    objc_msgSend(*(id *)(a1 + 32), "setValue:", v17);
    objc_msgSend(*(id *)(a1 + 32), "instanceID");

    objc_msgSend(v5, "statusCode");
    +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "characteristicTypesChangingTargetState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "containsObject:", v23);

    if ((v24 & 1) == 0)
      objc_msgSend(WeakRetained, "markNotifyingCharacteristicUpdatedforCharacteristic:", *(_QWORD *)(a1 + 32));
    _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, 0, 0);
LABEL_15:

    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v11;
    v35 = 2112;
    v36 = v12;
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to write to characteristic: %@ with error: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v13, "instanceID");

  objc_msgSend(v6, "domain");
  objc_msgSend(v6, "code");

  _callCharacteristicOperationCompletion(*(void **)(a1 + 32), *(void **)(a1 + 56), 2, v6, CFSTR("Write request failed."));
LABEL_16:

}

void __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  __int128 v8;
  int v9;
  uint64_t i;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  id obj;
  int v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD block[4];
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v1 = a1;
  v76 = *MEMORY[0x1E0C80C00];
  if (*(double *)(a1 + 72) > 0.0)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v1 + 72);
      *(_DWORD *)buf = 138543618;
      v66 = v5;
      v67 = 2048;
      v68 = v6;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 40), "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = *(id *)(v1 + 40);
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  v9 = 0;
  if (v47)
  {
    v43 = *(_QWORD *)v62;
    *(_QWORD *)&v8 = 138544386;
    v39 = v8;
    v44 = v7;
    v45 = v1;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v62 != v43)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v12 = objc_msgSend(v11, "writeType") == 1;
        if (objc_msgSend(v11, "includeResponseValue"))
          v13 = 3;
        else
          v13 = 1;
        v14 = objc_msgSend(v11, "timedWrite", v39);
        v15 = v13 | 4;
        if (!v14)
          v15 = v13;
        v48 = v15;
        objc_msgSend(v11, "characteristic");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "instanceID");

        v17 = (void *)MEMORY[0x1D17B7244]();
        v18 = *(id *)(v1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "characteristic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "shortDescription");
          v41 = v9;
          v23 = v12;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contextData");
          v42 = v17;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v39;
          v66 = v20;
          v67 = 2114;
          v68 = v21;
          v69 = 2114;
          v70 = v24;
          v71 = 2050;
          v72 = v48;
          v73 = 2114;
          v74 = v25;
          _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Writing value '%{public}@' for characteristic %{public}@ with writeOptions: %{public}tu contextData: %{public}@", buf, 0x34u);

          v12 = v23;
          v9 = v41;

          v17 = v42;
        }
        v9 |= v12;

        objc_autoreleasePoolPop(v17);
        v1 = v45;
        v26 = *(void **)(v45 + 32);
        objc_msgSend(v11, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "characteristic");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "authorizationData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contextData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_356;
        v57[3] = &unk_1E894D6A8;
        v31 = v46;
        v32 = *(_QWORD *)(v45 + 32);
        v58 = v31;
        v59 = v32;
        v7 = v44;
        v60 = v44;
        objc_msgSend(v26, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v27, v28, v29, v30, v48, v57);

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v47);
  }

  objc_msgSend(*(id *)(v1 + 32), "clientQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_357;
  block[3] = &unk_1E894AC20;
  v34 = *(id *)(v1 + 48);
  v35 = *(_QWORD *)(v1 + 32);
  v36 = *(void **)(v1 + 40);
  v50 = v34;
  v51 = v35;
  v52 = v36;
  v56 = v9 & 1;
  v53 = *(id *)(v1 + 56);
  v37 = *(id *)(v1 + 64);
  v54 = v46;
  v55 = v37;
  v38 = v46;
  dispatch_group_notify(v7, v33, block);

}

void __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_356(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  if (v6)
  {
    v9 = (void *)MEMORY[0x1D17B7244](v8);
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Write response: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_357(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "begin"));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Completed %{public}@ write requests. ShouldDisconnect: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling completion handler"));
  v8 = *(NSObject **)(a1 + 56);
  if (v8)
  {
    v9 = *(void **)(a1 + 72);
    if (v9)
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_358;
      v14 = &unk_1E894D5E0;
      v16 = v9;
      v15 = *(id *)(a1 + 64);
      dispatch_async(v8, &v11);

    }
  }
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Disconnecting"));
    objc_msgSend(*(id *)(a1 + 40), "_suspendConnectionIdleTimer");
    objc_msgSend(*(id *)(a1 + 40), "_handleConnectionIdleTimeout");
  }
  objc_msgSend(*(id *)(a1 + 32), "end", v11, v12, v13, v14);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_358(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __84___HAPAccessoryServerBTLE200__readValueForCharacteristic_options_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D17B7244](objc_msgSend(a1[4], "setValue:", 0));
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to read from characteristic with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = a1[4];
    v13 = a1[5];
    objc_msgSend(v12, "instanceID");

    objc_msgSend(v6, "domain");
    objc_msgSend(v6, "code");

    _callCharacteristicOperationCompletion(a1[4], a1[6], 1, v6, CFSTR("Read request failed."));
  }
  else
  {
    v27 = 0;
    v28 = 0;
    v26 = 0;
    v14 = objc_msgSend((id)objc_opt_class(), "parseReadResponse:value:notificationContext:error:", v5, &v28, &v27, &v26);
    v15 = v28;
    v16 = v27;
    v17 = v26;
    v18 = a1[4];
    if ((v14 & 1) != 0)
    {
      objc_msgSend(v18, "setValue:", v15);
      objc_msgSend(a1[4], "setNotificationContext:", v16);
      objc_msgSend(a1[4], "instanceID");

      objc_msgSend(v5, "statusCode");
      objc_msgSend(WeakRetained, "_updatePropertiesFromCharacteristic:", a1[4]);
      _callCharacteristicOperationCompletion(a1[4], a1[6], 1, 0, 0);
    }
    else
    {
      v25 = v15;
      objc_msgSend(v18, "setValue:", 0);
      v19 = (void *)MEMORY[0x1D17B7244](objc_msgSend(a1[4], "setNotificationContext:", 0));
      v20 = WeakRetained;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v22;
        v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic read response with error: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v23 = a1[4];
      v24 = a1[5];
      objc_msgSend(v23, "instanceID");

      objc_msgSend(v17, "domain");
      objc_msgSend(v17, "code");

      _callCharacteristicOperationCompletion(a1[4], a1[6], 1, v17, CFSTR("Read response invalid."));
      v15 = v25;
    }

  }
}

void __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Read response for characteristic %{public}@/%{public}@ with error: %{public}@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_322(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Completed multiple read requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
  {
    v7 = *(void **)(a1 + 56);
    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_323;
      v8[3] = &unk_1E894D5E0;
      v10 = v7;
      v9 = *(id *)(a1 + 48);
      dispatch_async(v6, v8);

    }
  }
}

uint64_t __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_323(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = *v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v8))
        {
          v17 = (void *)MEMORY[0x1D17B7244]();
          v18 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v20;
            v34 = 2114;
            v35 = v8;
            _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not sending requests due to duplicate characteristic: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          objc_msgSend(*(id *)(a1 + 48), "markWithReason:", CFSTR("Calling completion handler"));
          if (*(_QWORD *)(a1 + 64))
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate characteristic read of %@."), v8);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 11, v22, CFSTR("Client requested to read characteristic twice."), 0, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          }
          objc_msgSend(*(id *)(a1 + 48), "end");
          objc_msgSend(*(id *)(a1 + 48), "invalidate");

          goto LABEL_19;
        }
        objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (*(double *)(a1 + 72) > 0.0)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v33 = v12;
      v34 = 2048;
      v35 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v14 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_314;
  v24[3] = &unk_1E894ABD0;
  v16 = *(_QWORD *)(a1 + 56);
  v25 = *(id *)(a1 + 48);
  objc_copyWeak(&v27, (id *)buf);
  v26 = *(id *)(a1 + 64);
  objc_msgSend(v14, "_readCharacteristicValues:queue:completionHandler:", v15, v16, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
LABEL_19:

}

void __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_314(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "hmf_objectsPassingTest:", &__block_literal_global_316);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Read response: '%{public}@'", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling completion handler"));
  v13 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

BOOL __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a1[4], "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(a1[5], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "UUIDString");

    objc_msgSend(a1[6], "domain");
    objc_msgSend(a1[6], "code");
    v2 = v5;
  }

}

void __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a1[4], "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(a1[5], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "UUIDString");

    objc_msgSend(a1[6], "domain");
    objc_msgSend(a1[6], "code");
    v2 = v5;
  }

}

void __52___HAPAccessoryServerBTLE200__readServiceSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && *(_QWORD *)(a1 + 32))
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v10;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get signature from service with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "_handleReadServiceSignature:error:", *(_QWORD *)(a1 + 32), v6);
  }
  else
  {
    v11 = (void *)objc_opt_class();
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v28 = 0;
    objc_msgSend(v11, "parseServiceSignatureResponse:serviceInstanceID:serviceType:error:", v5, v12, v13, &v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v28;
    if (v14 || !*(_QWORD *)(a1 + 32))
    {
      v16 = (void *)MEMORY[0x1D17B7244]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(*(id *)(a1 + 40), "discoveryContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serviceSignatures");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v14, *(_QWORD *)(a1 + 32));

      v23 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17B7244]();
      v25 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v27;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse service signature response with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      v23 = v15;
    }
    objc_msgSend(*(id *)(a1 + 40), "_handleReadServiceSignature:error:", *(_QWORD *)(a1 + 32), v23);

  }
}

void __59___HAPAccessoryServerBTLE200__readCharacteristicSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get signature from characteristic with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "_handleReadCharacteristicSignature:error:", *(_QWORD *)(a1 + 40), v6);
  }
  else
  {
    v22 = 0;
    objc_msgSend((id)objc_opt_class(), "parseSignatureResponse:error:", v5, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "discoveryContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "characteristicSignatures");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));

      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17B7244]();
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse characteristic signature response with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = v12;
    }
    objc_msgSend(v15, "_handleReadCharacteristicSignature:error:", v16, v17);

  }
}

uint64_t __55___HAPAccessoryServerBTLE200__handleCompletedDiscovery__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "discoveryRetries"));
    v2 = v4;
  }

}

uint64_t __56___HAPAccessoryServerBTLE200__cancelDiscoveryWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[8];

  v16 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  objc_msgSend(v16, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    v8 = v16;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2;
  v17[3] = &unk_1E894AA88;
  v11 = *(_QWORD *)(a1 + 56);
  v17[4] = WeakRetained;
  v17[6] = v11;
  v17[7] = v6;
  v12 = v8;
  v17[5] = v12;
  __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2((uint64_t)v17);
  objc_msgSend(WeakRetained, "discoveryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDiscovering:", 0);

  v14 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 40));
  v15 = (void *)v14;
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v16);

  objc_msgSend(WeakRetained, "incrementHAPBTLEMetricsDiscoveryCount");
}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to the accessory during discovery type: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "clientQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_193;
      v21[3] = &unk_1E894D5E0;
      v22 = v3;
      v23 = v10;
      dispatch_async(v11, v21);

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = WeakRetained;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12 == 3)
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Ack-ed accessory notification", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v14, "_cancelDiscoveryWithError:", 0);
      objc_msgSend(v14, "_disconnectWithDisconnectionError:completionHandler:", 0, 0);
    }
    else
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 48);
        objc_msgSend(v14, "peripheral");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v18;
        v26 = 2050;
        v27 = v19;
        v28 = 2114;
        v29 = v20;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database discovery type: %{public}tu via %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v14, "_discoverServices");
    }
  }

}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_193(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 8, CFSTR("Discovery failed."), CFSTR("Failed to connect."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = v5;
  }

}

uint64_t __86___HAPAccessoryServerBTLE200__readPendingDiscoveredCharacteristicTypesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, _QWORD, _QWORD);
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2;
  v26[3] = &unk_1E894AA38;
  objc_copyWeak(&v27, &location);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17B7400](v26);
  if ((objc_msgSend(*v2, "isPaired") & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryCharacteristicsPendingRead");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "discoveryContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDiscovering");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "discoveryContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "discoveryType"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v30 = v11;
        v31 = 2112;
        v32 = v14;
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Discovering in progress for type: %@. Pending characteristic types to read: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      v21 = objc_msgSend(*(id *)(a1 + 32), "connectReason");
      v22 = *(void **)(a1 + 32);
      if (v21 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "setHasBeenDiscovered:", 1);
        objc_msgSend(*(id *)(a1 + 32), "_discoverWithType:completionHandler:", 3, 0);
      }
      else
      {
        v23[0] = v3;
        v23[1] = 3221225472;
        v23[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_181;
        v23[3] = &unk_1E894AA60;
        objc_copyWeak(&v25, &location);
        v24 = v4;
        objc_msgSend(v22, "_discoverWithType:completionHandler:", 2, v23);

        objc_destroyWeak(&v25);
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v19;
      v31 = 2112;
      v32 = CFSTR("Discovery on an unpaired accessory is not allowed");
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Discovery on an unpaired accessory is not allowed"), 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v20);

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "pendingRemovePairing") == 1)
  {
    objc_msgSend(WeakRetained, "_removePairingOfAccessoryServerCancelledMidPairing");
  }
  else
  {
    objc_msgSend(WeakRetained, "setHasBeenDiscovered:", v5 == 0);
    if (objc_msgSend(WeakRetained, "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
    {
      objc_msgSend(WeakRetained, "delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3;
      block[3] = &unk_1E894C050;
      v10 = a2;
      block[4] = WeakRetained;
      v9 = v5;
      dispatch_async(v7, block);

    }
  }

}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Discovery failed"), 0, 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2_184;
    v6[3] = &unk_1E894AA60;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    v7 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_discoverWithType:completionHandler:", 0, v6);

    objc_destroyWeak(&v8);
  }

}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_2_184(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Discovery failed"), 0, 0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained, "isIncompatibleUpdate"), v5);

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3_185;
    v7[3] = &unk_1E894DC48;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v6 = *(id *)(a1 + 32);
    v8 = 0;
    v9 = v6;
    objc_msgSend(WeakRetained, "_readPendingDiscoveredCharacteristicTypesWithCompletion:", v7);

    objc_destroyWeak(&v10);
  }

}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3_185(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "primaryAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForAccessoryInformationService");

  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(WeakRetained, "isIncompatibleUpdate"), *(_QWORD *)(a1 + 32));
}

void __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryServer:didDiscoverAccessories:transaction:error:", *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v6, "accessoryServer:didDiscoverAccessories:transaction:error:", v3, v5, 0, *(_QWORD *)(a1 + 40));

}

void __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory server that its pairing was cancelled post pair-setup with error %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setPendingRemovePairing:", 2);
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPerformingGeneralScan");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "browser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopDiscoveringAccessoryServers");

  }
}

uint64_t __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke_175(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __209___HAPAccessoryServerBTLE200_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "browser");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessoryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "saveCacheToDisk:", v2);

}

void __41___HAPAccessoryServerBTLE200_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v333;
  logCategory__hmf_once_v333 = v0;

}

@end
