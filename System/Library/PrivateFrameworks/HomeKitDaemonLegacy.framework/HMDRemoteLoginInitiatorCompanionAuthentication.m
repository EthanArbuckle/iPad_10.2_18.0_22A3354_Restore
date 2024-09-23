@implementation HMDRemoteLoginInitiatorCompanionAuthentication

- (HMDRemoteLoginInitiatorCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 account:(id)a8
{
  id v15;
  HMDRemoteLoginInitiatorCompanionAuthentication *v16;
  HMDRemoteLoginInitiatorCompanionAuthentication *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginInitiatorCompanionAuthentication;
  v16 = -[HMDRemoteLoginInitiatorAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:](&v19, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_delegate_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_account, a8);

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDRemoteLoginInitiatorCompanionAuthentication *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDRemoteLoginInitiatorCompanionAuthentication *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDRemoteLoginInitiatorCompanionAuthentication;
  -[HMDRemoteLoginInitiatorCompanionAuthentication dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRemoteLoginAuthentication sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginInitiatorCompanionAuthentication account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Init-Companion-Auth: Session: %@, Account: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)loginType
{
  return 1;
}

- (void)authenticate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDRemoteLoginAuthentication workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HMDRemoteLoginInitiatorCompanionAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_authenticate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDRemoteLoginInitiatorCompanionAuthentication *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDRemoteLoginCompanionAuthenticationRequest *v17;
  void *v18;
  HMDRemoteLoginCompanionAuthenticationRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteLoginInitiatorCompanionAuthentication account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v4, "credentialForAccount:error:", v5, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;

  if (v6)
  {
    -[HMDRemoteLoginInitiatorCompanionAuthentication account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCredential:", v6);

    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginInitiatorCompanionAuthentication account](v10, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteLoginInitiatorCompanionAuthentication account](v10, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v12;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Loaded credentials for account %@, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLinkType:", 3);
    v17 = [HMDRemoteLoginCompanionAuthenticationRequest alloc];
    -[HMDRemoteLoginAuthentication sessionID](v10, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMRemoteLoginMessage initWithSessionID:](v17, "initWithSessionID:", v18);

    -[HMDRemoteLoginInitiatorCompanionAuthentication account](v10, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginCompanionAuthenticationRequest setAccount:](v19, "setAccount:", v20);

    -[HMDRemoteLoginCompanionAuthenticationRequest setCompanionDevice:](v19, "setCompanionDevice:", v16);
    -[HMDRemoteLoginAuthenticationRequest setTargetedAccountType:](v19, "setTargetedAccountType:", 0);
    v27 = CFSTR("kHMDRemoteLoginCompanionAuthenticationRequest");
    encodeRootObject();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, v10);
    -[HMDRemoteLoginAuthentication remoteMessageSender](v10, "remoteMessageSender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__HMDRemoteLoginInitiatorCompanionAuthentication__authenticate__block_invoke;
    v24[3] = &unk_1E89BF5C0;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v23, "sendRemoteMessageWithName:payload:responseHandler:", CFSTR("kHMDRemoteLoginCompanionAuthenticationRequest"), v22, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

void __63__HMDRemoteLoginInitiatorCompanionAuthentication__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAuthenticationResponse:error:", v5, v6);

}

uint64_t __62__HMDRemoteLoginInitiatorCompanionAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_76485 != -1)
    dispatch_once(&logCategory__hmf_once_t1_76485, &__block_literal_global_76486);
  return (id)logCategory__hmf_once_v2_76487;
}

void __61__HMDRemoteLoginInitiatorCompanionAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_76487;
  logCategory__hmf_once_v2_76487 = v0;

}

@end
