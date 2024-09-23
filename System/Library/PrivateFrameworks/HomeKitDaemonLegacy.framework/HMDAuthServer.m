@implementation HMDAuthServer

- (HMDAuthServer)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDAuthServer *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  MFAATokenManager *tokenManager;
  HMDAuthServer *v12;
  HMDAuthServer *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@A valid delegate is required.";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EFB2D578) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@Delegate must confirm to the HMDAuthServerDelegate protocol";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDAuthServer;
  v6 = -[HMDAuthServer init](&v19, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("HMDAuthServer", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v6->_delegate, v5);
    objc_msgSend(MEMORY[0x1E0D44980], "sharedManager");
    v10 = objc_claimAutoreleasedReturnValue();
    tokenManager = v6->_tokenManager;
    v6->_tokenManager = (MFAATokenManager *)v10;

  }
  v12 = v6;
  v13 = v12;
LABEL_12:

  return v13;
}

- (void)_reportFailureWithContext:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAuthServer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAuthServer *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failing activation", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAuthServer delegate](v9, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "didFinishActivation:context:", v7, v6);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement didFinishActivation:context:", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)retryOrReportFailure:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDAuthServer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAuthServer *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D44968]))
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v6, "code");

  if (v9 != -5)
  {
LABEL_10:
    v18 = 55;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuthServer _reportFailureWithContext:error:](self, "_reportFailureWithContext:error:", v7, v19);

    goto LABEL_12;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Network unavailable", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if (!-[HMDAuthServer resumeRetryIfPending](v11, "resumeRetryIfPending"))
  {
    v18 = 78;
    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v11;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v17;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Waiting to retry", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
LABEL_12:

}

- (void)_handleResponseMetadata:(id)a3 ppid:(id)a4 locale:(id)a5 context:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDAuthServer *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD block[4];
  id v41;
  HMDAuthServer *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = a6;
  v38 = a7;
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v52 = v18;
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v13;
    v57 = 2112;
    v58 = v14;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received metadata: %@ for PPID: %@, locale: %@", buf, 0x2Au);

  }
  v36 = v13;
  v39 = v14;

  objc_autoreleasePoolPop(v15);
  if (v12)
  {
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("accessory_name"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("brand"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("model"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_numberForKey:", CFSTR("category"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("certification_status"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("blacklisted_status"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
  }
  -[HMDAuthServer workQueue](v16, "workQueue", v33);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMDAuthServer__handleResponseMetadata_ppid_locale_context_error___block_invoke;
  block[3] = &unk_1E89ADEE8;
  v41 = v38;
  v42 = v16;
  v43 = v19;
  v44 = v20;
  v45 = v21;
  v46 = v22;
  v47 = v23;
  v48 = v24;
  v49 = v36;
  v50 = v34;
  v35 = v34;
  v26 = v36;
  v27 = v24;
  v37 = v23;
  v28 = v22;
  v29 = v21;
  v30 = v20;
  v31 = v19;
  v32 = v38;
  dispatch_async(v25, block);

}

- (void)saveRetryOperation:(unint64_t)a3 token:(id)a4 authFeatures:(unint64_t)a5 uuid:(id)a6 context:(id)a7 locale:(id)a8 model:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  -[HMDAuthServer retryTimer](self, "retryTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (-[HMDAuthServer retryCount](self, "retryCount") < 1)
      -[HMDAuthServer resetRetryOperation](self, "resetRetryOperation");
    else
      -[HMDAuthServer setRetryCount:](self, "setRetryCount:", -[HMDAuthServer retryCount](self, "retryCount") - 1);
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0D286C8]);
    v21 = (void *)objc_msgSend(v20, "initWithTimeInterval:options:", 1, *(double *)&authServerRetryTimeIntervalInSeconds);
    -[HMDAuthServer setRetryTimer:](self, "setRetryTimer:", v21);

    -[HMDAuthServer retryTimer](self, "retryTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);

    -[HMDAuthServer setLocale:](self, "setLocale:", v17);
    -[HMDAuthServer setModel:](self, "setModel:", v18);
    -[HMDAuthServer setToken:](self, "setToken:", v23);
    -[HMDAuthServer setAuthFeatures:](self, "setAuthFeatures:", a5);
    -[HMDAuthServer setUuid:](self, "setUuid:", v15);
    -[HMDAuthServer setContext:](self, "setContext:", v16);
    -[HMDAuthServer setRetryCount:](self, "setRetryCount:", authServerRetryCount);
    -[HMDAuthServer setCurrentOperation:](self, "setCurrentOperation:", a3);
  }

}

- (void)resetRetryOperation
{
  void *v3;

  -[HMDAuthServer setRetryCount:](self, "setRetryCount:", 0);
  -[HMDAuthServer retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDAuthServer setRetryTimer:](self, "setRetryTimer:", 0);
  -[HMDAuthServer setCurrentOperation:](self, "setCurrentOperation:", 0);
  -[HMDAuthServer setLocale:](self, "setLocale:", 0);
  -[HMDAuthServer setModel:](self, "setModel:", 0);
  -[HMDAuthServer setToken:](self, "setToken:", 0);
  -[HMDAuthServer setUuid:](self, "setUuid:", 0);
  -[HMDAuthServer setContext:](self, "setContext:", 0);
}

- (BOOL)resumeRetryIfPending
{
  void *v3;
  void *v4;

  -[HMDAuthServer retryTimer](self, "retryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDAuthServer retryTimer](self, "retryTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resume");

  }
  return v3 != 0;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMDAuthServer *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAuthServer *v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  int v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDAuthServer currentOperation](v6, "currentOperation");
    if (v9 > 3)
      v10 = CFSTR("HMDAuthServerOperationPPIDInfo");
    else
      v10 = off_1E89ADF78[v9];
    v28 = 138543618;
    v29 = v8;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Retry timer expired for operation: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAuthServer retryTimer](v6, "retryTimer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v12 = -[HMDAuthServer currentOperation](v6, "currentOperation");
    if (v12 != 3)
    {
      if (v12 != 2)
      {
        if (v12 != 1)
        {
          v22 = (void *)MEMORY[0x1D17BA0A0]();
          v23 = v6;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[HMDAuthServer currentOperation](v23, "currentOperation");
            if (v26 > 3)
              v27 = CFSTR("HMDAuthServerOperationPPIDInfo");
            else
              v27 = off_1E89ADF78[v26];
            v28 = 138543618;
            v29 = v25;
            v30 = 2112;
            v31 = v27;
            _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid retry operation: %@", (uint8_t *)&v28, 0x16u);

          }
          objc_autoreleasePoolPop(v22);
          -[HMDAuthServer resetRetryOperation](v23, "resetRetryOperation");
          -[HMDAuthServer context](v23, "context");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAuthServer _reportFailureWithContext:error:](v23, "_reportFailureWithContext:error:", v13, v14);
          goto LABEL_20;
        }
        -[HMDAuthServer locale](v6, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAuthServer model](v6, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAuthServer token](v6, "token");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HMDAuthServer authFeatures](v6, "authFeatures");
        -[HMDAuthServer uuid](v6, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAuthServer context](v6, "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAuthServer sendPPIDInfoRequest:model:token:authFeatures:uuid:context:](v6, "sendPPIDInfoRequest:model:token:authFeatures:uuid:context:", v13, v14, v15, v16, v17, v18);

LABEL_13:
LABEL_20:

        goto LABEL_21;
      }
      -[HMDAuthServer token](v6, "token");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAuthServer uuid](v6, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAuthServer context](v6, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAuthServer sendActivationRequest:uuid:context:](v6, "sendActivationRequest:uuid:context:", v19, v20, v21);

    }
    -[HMDAuthServer token](v6, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuthServer uuid](v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuthServer context](v6, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAuthServer sendActivationConfirmation:uuid:context:](v6, "sendActivationConfirmation:uuid:context:", v13, v14, v15);
    goto LABEL_13;
  }
LABEL_21:

}

- (void)getPPIDInfo:(id)a3 model:(id)a4 cert:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAuthServer workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke;
  block[3] = &unk_1E89C1710;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)sendPPIDInfoRequest:(id)a3 model:(id)a4 token:(id)a5 authFeatures:(unint64_t)a6 uuid:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  -[HMDAuthServer workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke;
  block[3] = &unk_1E89BDFA0;
  block[4] = self;
  v26 = v16;
  v30 = v15;
  v31 = a6;
  v27 = v17;
  v28 = v18;
  v29 = v14;
  v20 = v15;
  v21 = v14;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  dispatch_async(v19, block);

}

- (void)sendActivationRequest:(id)a3 uuid:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAuthServer workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke;
  v15[3] = &unk_1E89C07B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)sendActivationConfirmation:(id)a3 uuid:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAuthServer workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke;
  v15[3] = &unk_1E89C07B8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (HMDAuthServerDelegate)delegate
{
  return (HMDAuthServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (MFAATokenManager)tokenManager
{
  return (MFAATokenManager *)objc_getProperty(self, a2, 24, 1);
}

- (HMFTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)authFeatures
{
  return self->_authFeatures;
}

- (void)setAuthFeatures:(unint64_t)a3
{
  self->_authFeatures = a3;
}

- (unint64_t)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(unint64_t)a3
{
  self->_currentOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_tokenManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "saveRetryOperation:token:authFeatures:uuid:context:locale:model:", 3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "tokenManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_2;
  v5[3] = &unk_1E89BF250;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "confirmActivationForAuthToken:withUUID:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_3;
    block[3] = &unk_1E89C20C8;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __57__HMDAuthServer_sendActivationConfirmation_uuid_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@Activation confirmation with server failed with error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "retryOrReportFailure:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "resetRetryOperation");
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "didFinishActivation:context:", 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement didFinishActivation:context:", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v13 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_reportFailureWithContext:error:", v12, v14);

    }
  }
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "saveRetryOperation:token:authFeatures:uuid:context:locale:model:", 2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "tokenManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_2;
  v5[3] = &unk_1E89ADF38;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "requestActivationForAuthToken:withUUID:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_3;
    v10[3] = &unk_1E89C07B8;
    v11 = v6;
    v12 = v8;
    v13 = v5;
    v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);

  }
}

void __52__HMDAuthServer_sendActivationRequest_uuid_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "resetRetryOperation");
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "length"))
      {
        objc_msgSend(v7, "handleActivationResponse:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_14:

        return;
      }
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v19 = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v15;
        v12 = "%{public}@Invalid tokens in activation response: %@";
        v13 = v10;
        v14 = 22;
        goto LABEL_12;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v11;
        v12 = "%{public}@Delegate does not implement handleActivationResponse:context:";
        v13 = v10;
        v14 = 12;
LABEL_12:
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v19, v14);

      }
    }

    objc_autoreleasePoolPop(v8);
    v16 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_reportFailureWithContext:error:", v17, v18);

    goto LABEL_14;
  }
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v19 = 138543618;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@Activation with server failed with error: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "retryOrReportFailure:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

void __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke(uint64_t a1)
{
  id *v2;
  id inited;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  const __CFString *v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "saveRetryOperation:token:authFeatures:uuid:context:locale:model:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  inited = objc_initWeak(&location, *v2);
  v4 = (void *)MEMORY[0x1D17BA0A0](inited);
  v5 = *v2;
  HMFGetOSLogHandle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v38 = v4;
    HMFGetLogIdentifier();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v9, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMDSWAuthFeaturesToString(*(_QWORD *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v46 = v7;
    v47 = 2112;
    v48 = v9;
    v49 = 2112;
    v50 = v8;
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v11;
    v55 = 2112;
    v56 = v12;
    v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Requesting metadata for locale: %@, Model: %@, Language Code: %@, Country Code: %@ Identifier: %@, swAuthFeatures: %@", buf, 0x48u);

    v4 = v38;
  }

  objc_autoreleasePoolPop(v4);
  v14 = *(_QWORD *)(a1 + 72);
  if (v14)
  {
    v43 = CFSTR("model");
    v44 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = *(_QWORD *)(a1 + 80);
  if ((v16 & 1) == 0)
  {
    v17 = 0;
    if ((v16 & 2) == 0)
      goto LABEL_15;
    goto LABEL_12;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = v21;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Checking token for HomeKit", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v17 = 1;
  if ((*(_QWORD *)(a1 + 80) & 2) != 0)
  {
LABEL_12:
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Checking token for AirPlayAudio", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v17 |= 2uLL;
  }
LABEL_15:
  if ((objc_msgSend(MEMORY[0x1E0D44980], "isTokenValidForFeatures:token:", v17, *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "tokenManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 64);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke_71;
    v39[3] = &unk_1E89ADF10;
    objc_copyWeak(&v41, &location);
    v40 = *(id *)(a1 + 56);
    objc_msgSend(v26, "requestMetadataForAuthToken:withUUID:requestedLocale:requestInfo:completionHandler:", v27, v28, v29, v15, v39);

    objc_destroyWeak(&v41);
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      HMDSWAuthFeaturesToString(*(_QWORD *)(a1 + 80));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v33;
      v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Token validation failed for auth features: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v35 = *(void **)(a1 + 32);
    v36 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_handleResponseMetadata:ppid:locale:context:error:", 0, 0, 0, v36, v37);

  }
  objc_destroyWeak(&location);
}

void __75__HMDAuthServer_sendPPIDInfoRequest_model_token_authFeatures_uuid_context___block_invoke_71(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleResponseMetadata:ppid:locale:context:error:", v10, v14, v9, *(_QWORD *)(a1 + 32), v11);

}

void __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke(uint64_t a1)
{
  id *v2;
  id inited;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  const __CFString *v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  inited = objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)MEMORY[0x1D17BA0A0](inited);
  v5 = *v2;
  HMFGetOSLogHandle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Requesting Cert metadata for locale: %@, Model: %@, Language Code: %@, Country Code: %@ Identifier: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v4);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v22 = CFSTR("model");
    v23 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D44970], "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke_69;
  v18[3] = &unk_1E89ADF10;
  objc_copyWeak(&v20, &location);
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v15, "requestMetadataForCertificate:requestedLocale:requestInfo:completionHandler:", v16, v17, v14, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __48__HMDAuthServer_getPPIDInfo_model_cert_context___block_invoke_69(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleResponseMetadata:ppid:locale:context:error:", v10, v14, v9, *(_QWORD *)(a1 + 32), v11);

}

void __67__HMDAuthServer__handleResponseMetadata_ppid_locale_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to get PPID Info from server with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "retryOrReportFailure:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 104));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "resetRetryOperation");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D163B0]), "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "handlePPIDInfoResponse:context:error:", v7, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement handlePPIDInfoResponse:context:", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 104);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], -1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_reportFailureWithContext:error:", v14, v15);

    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_68475 != -1)
    dispatch_once(&logCategory__hmf_once_t21_68475, &__block_literal_global_68476);
  return (id)logCategory__hmf_once_v22_68477;
}

void __28__HMDAuthServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22_68477;
  logCategory__hmf_once_v22_68477 = v0;

}

@end
