@implementation HAPAuthSession

- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HAPAuthSession *v12;
  HAPAuthSession *v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *workQueue;
  HAPAuthSession *v18;
  void *v19;
  HAPAuthSession *v20;
  NSObject *v21;
  void *v22;
  HAPAuthSession *v23;
  void *v24;
  HAPAuthSession *v25;
  NSObject *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EFA2F098) & 1) != 0)
    {
      v29.receiver = self;
      v29.super_class = (Class)HAPAuthSession;
      v12 = -[HAPAuthSession init](&v29, sel_init);
      v13 = v12;
      if (v12)
      {
        v14 = (const char *)HAPDispatchQueueName(v12, 0);
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = dispatch_queue_create(v14, v15);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v16;

        v13->_role = a3;
        objc_storeStrong((id *)&v13->_instanceId, a4);
        objc_storeWeak((id *)&v13->_delegate, v11);
        v13->_currentState = 0;
        -[HAPAuthSession _resetSession](v13, "_resetSession");
      }
      v18 = v13;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17B7244]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v27;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Delegate must confirm to the HAPAuthSessionDelegate protocol", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      v18 = v25;
    }
    v20 = v18;
    v23 = v18;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = 0;
  }

  return v23;
}

- (void)_resetSession
{
  int64_t v3;
  HAPAuthSession *v4;
  uint64_t v5;
  void *v6;
  HAPAuthSession *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HAPAuthSession setToken2:](self, "setToken2:", 0);
  -[HAPAuthSession setToken1:](self, "setToken1:", 0);
  v3 = -[HAPAuthSession role](self, "role");
  if (v3 == 1)
  {
    v4 = self;
    v5 = 2;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = self;
    v5 = 1;
LABEL_5:
    -[HAPAuthSession setCurrentState:](v4, "setCurrentState:", v5);
    return;
  }
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2048;
    v13 = -[HAPAuthSession role](v7, "role");
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid auth session role: %tu", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
}

- (void)_reportAuthFailure
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  HAPAuthSession *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HAPAuthSession _resetSession](self, "_resetSession");
  -[HAPAuthSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HAPAuthSession delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 17, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authSession:authComplete:", self, v5);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authComplete:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)resetSession
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAuthSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HAPAuthSession_resetSession__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[HAPAuthSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HAPAuthSession_handleAuthExchangeData_withHeader___block_invoke;
  block[3] = &unk_1E894C050;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HAPAuthSession *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(-[HAPAuthSession currentState](self, "currentState"))
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 9uLL:
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v10;
        v13 = 2048;
        v14 = -[HAPAuthSession currentState](v8, "currentState");
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unhandled state: %tu", (uint8_t *)&v11, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      break;
    case 1uLL:
      -[HAPAuthSession _sendTokenRequest](self, "_sendTokenRequest");
      break;
    case 4uLL:
      -[HAPAuthSession _handleTokenResponse:withHeader:](self, "_handleTokenResponse:withHeader:", v6, v4);
      break;
    case 8uLL:
      -[HAPAuthSession _handleTokenUpdateResponse:withHeader:](self, "_handleTokenUpdateResponse:withHeader:", v6, v4);
      break;
    default:
      break;
  }

}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAPAuthSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HAPAuthSession_continueAuthAfterValidation___block_invoke;
  v6[3] = &unk_1E894D770;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)_sendTokenRequest
{
  void *v3;
  void *v4;
  void *v5;
  HAPAuthSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HAPAuthSession *v13;
  NSObject *v14;
  void *v15;
  HAPAuthSession *v16;
  void *v17;
  HAPAuthSession *v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  -[HAPAuthSession instanceId](self, "instanceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPProtocolMessages constructTokenRequest:outTID:](HAPProtocolMessages, "constructTokenRequest:outTID:", v3, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed constructing token request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = v13;
    goto LABEL_12;
  }
  -[HAPAuthSession setCurrentState:](self, "setCurrentState:", 4);
  v5 = (void *)MEMORY[0x1D17B7244](-[HAPAuthSession setCurrentTID:](self, "setCurrentTID:", v21));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAuthSession delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement sendAuthExchangeData:", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v16 = v18;
LABEL_12:
    -[HAPAuthSession _reportAuthFailure](v16, "_reportAuthFailure");
    goto LABEL_13;
  }
  -[HAPAuthSession delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authSession:sendAuthExchangeData:", v6, v4);

LABEL_13:
}

- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HAPAuthSession *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HAPAuthSession *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("No");
    *(_DWORD *)buf = 138543874;
    v28 = v10;
    v29 = 2112;
    if (v4)
      v11 = CFSTR("Yes");
    v30 = v6;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Response: %@ withHeader: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v25 = 0;
  v26 = 0;
  v12 = +[HAPProtocolMessages parseTokenResponse:expectedTID:withHeader:outToken:outUUID:](HAPProtocolMessages, "parseTokenResponse:expectedTID:withHeader:outToken:outUUID:", v6, -[HAPAuthSession currentTID](v8, "currentTID"), v4, &v26, &v25);
  v13 = v26;
  v14 = v25;
  if (!v12)
  {
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      v24 = "%{public}@Failed to parse token response";
LABEL_12:
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);

    }
LABEL_13:

    objc_autoreleasePoolPop(v20);
    -[HAPAuthSession _reportAuthFailure](v21, "_reportAuthFailure");
    goto LABEL_14;
  }
  -[HAPAuthSession setCurrentState:](v8, "setCurrentState:", 5);
  -[HAPAuthSession setToken1:](v8, "setToken1:", v13);
  -[HAPAuthSession setProvisionUUID:](v8, "setProvisionUUID:", v14);
  -[HAPAuthSession delegate](v8, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      v24 = "%{public}@Delegate does not implement validateUUID:token:";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[HAPAuthSession delegate](v8, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAuthSession provisionUUID](v8, "provisionUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAuthSession token1](v8, "token1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "authSession:validateUUID:token:", v8, v18, v19);

LABEL_14:
}

- (void)sendTokenUpdateRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAuthSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HAPAuthSession_sendTokenUpdateRequest___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_sendTokenUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HAPAuthSession *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  unsigned __int8 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  -[HAPAuthSession instanceId](self, "instanceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPProtocolMessages constructTokenUpdateRequest:token:outTID:](HAPProtocolMessages, "constructTokenUpdateRequest:token:outTID:", v5, v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      v16 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v9);
    -[HAPAuthSession _reportAuthFailure](v10, "_reportAuthFailure");
    goto LABEL_12;
  }
  -[HAPAuthSession setToken1:](self, "setToken1:", v4);
  -[HAPAuthSession setCurrentTID:](self, "setCurrentTID:", v17);
  -[HAPAuthSession setCurrentState:](self, "setCurrentState:", 8);
  -[HAPAuthSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      v16 = "%{public}@[HAPAuthSession] Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v13;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Update Request: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HAPAuthSession delegate](v10, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authSession:sendAuthExchangeData:", v10, v6);

LABEL_12:
}

- (BOOL)getToken:(id *)a3 uuid:(id *)a4
{
  NSObject *v7;
  char v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[HAPAuthSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__HAPAuthSession_getToken_uuid___block_invoke;
  v10[3] = &unk_1E8948F40;
  v10[4] = self;
  v10[5] = &v21;
  v10[6] = &v15;
  v10[7] = &v11;
  dispatch_sync(v7, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v8;
}

- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPAuthSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HAPAuthSession *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (+[HAPProtocolMessages parseTokenUpdateResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseTokenUpdateResponse:expectedTID:withHeader:", v6, -[HAPAuthSession currentTID](self, "currentTID"), v4))
  {
    -[HAPAuthSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HAPAuthSession delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAuthSession provisionUUID](self, "provisionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAuthSession token1](self, "token1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "authSession:confirmUUID:token:", self, v10, v11);

    }
    else
    {
      v16 = (void *)MEMORY[0x1D17B7244]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement confirmUUID:token:", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      -[HAPAuthSession _resetSession](v17, "_resetSession");
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v15;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing token update response", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HAPAuthSession _reportAuthFailure](v13, "_reportAuthFailure");
  }

}

- (id)logIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HAPAuthSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HAPAuthSessionDelegate)delegate
{
  return (HAPAuthSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unsigned)currentTID
{
  return self->_currentTID;
}

- (void)setCurrentTID:(unsigned __int8)a3
{
  self->_currentTID = a3;
}

- (NSNumber)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(id)a3
{
  objc_storeStrong((id *)&self->_instanceId, a3);
}

- (NSData)token1
{
  return self->_token1;
}

- (void)setToken1:(id)a3
{
  objc_storeStrong((id *)&self->_token1, a3);
}

- (NSData)token2
{
  return self->_token2;
}

- (void)setToken2:(id)a3
{
  objc_storeStrong((id *)&self->_token2, a3);
}

- (NSUUID)provisionUUID
{
  return self->_provisionUUID;
}

- (void)setProvisionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_provisionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionUUID, 0);
  objc_storeStrong((id *)&self->_token2, 0);
  objc_storeStrong((id *)&self->_token1, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __32__HAPAuthSession_getToken_uuid___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 72));
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
}

uint64_t __41__HAPAuthSession_sendTokenUpdateRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendTokenUpdateRequest:", *(_QWORD *)(a1 + 40));
}

void __46__HAPAuthSession_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v6, "provisionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "token1");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "authSession:authenticateUUID:token:", v6, v7, v8);

    }
    else
    {
      v9 = (void *)MEMORY[0x1D17B7244]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authenticateUUID:token1:token2:", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "_reportAuthFailure");
    }
  }
  else
  {
    objc_msgSend(v3, "_reportAuthFailure");
  }
}

uint64_t __52__HAPAuthSession_handleAuthExchangeData_withHeader___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthExchangeData:withHeader:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __30__HAPAuthSession_resetSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSession");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1)
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_26);
  return (id)logCategory__hmf_once_v18;
}

void __29__HAPAuthSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18;
  logCategory__hmf_once_v18 = v0;

}

@end
