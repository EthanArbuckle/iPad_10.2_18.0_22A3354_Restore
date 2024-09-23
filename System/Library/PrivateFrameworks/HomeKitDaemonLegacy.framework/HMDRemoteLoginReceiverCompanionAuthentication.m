@implementation HMDRemoteLoginReceiverCompanionAuthentication

- (HMDRemoteLoginReceiverCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8
{
  id v15;
  HMDRemoteLoginReceiverCompanionAuthentication *v16;
  HMDRemoteLoginReceiverCompanionAuthentication *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginReceiverCompanionAuthentication;
  v16 = -[HMDRemoteLoginReceiverAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:](&v19, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_delegate_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_request, a8);

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDRemoteLoginReceiverCompanionAuthentication *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDRemoteLoginReceiverCompanionAuthentication *v11;
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
  v7.super_class = (Class)HMDRemoteLoginReceiverCompanionAuthentication;
  -[HMDRemoteLoginReceiverCompanionAuthentication dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRemoteLoginAuthentication sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginReceiverCompanionAuthentication request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Recv-Companion-Auth: Session: %@, Account: %@]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)authenticate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDRemoteLoginAuthentication workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HMDRemoteLoginReceiverCompanionAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_authenticate
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[HMDRemoteLoginReceiverCompanionAuthentication request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__HMDRemoteLoginReceiverCompanionAuthentication__authenticate__block_invoke;
  v6[3] = &unk_1E89AC148;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HMDRemoteLoginReceiverAuthentication _saveRemoteVerifiedAccount:completion:](self, "_saveRemoteVerifiedAccount:completion:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_authenticateAccount:(id)a3 alreadyExists:(BOOL)a4 withCompanionDevice:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDRemoteLoginReceiverCompanionAuthentication *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDRemoteLoginAnisetteDataProvider *v19;
  void *v20;
  void *v21;
  HMDRemoteLoginAnisetteDataProvider *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginReceiverCompanionAuthentication request](v11, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMDRemoteLoginAccountTypeAsString(objc_msgSend(v14, "targetedAccountType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v13;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Authenticating the account %@, service type %@, with companion device: %@", (uint8_t *)&v24, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v16 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v8, "username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUsername:", v17);

  objc_msgSend(v16, "setIsUsernameEditable:", 0);
  objc_msgSend(v16, "setShouldAllowAppleIDCreation:", 0);
  -[HMDRemoteLoginReceiverCompanionAuthentication request](v11, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setServiceType:", +[HMDRemoteLoginUtilities serviceTypeForAccountService:](HMDRemoteLoginUtilities, "serviceTypeForAccountService:", objc_msgSend(v18, "targetedAccountType")));

  objc_msgSend(v16, "setAuthenticationType:", 1);
  objc_msgSend(v16, "setShouldUpdatePersistentServiceTokens:", 1);
  if (!a4)
  {
    objc_msgSend(v16, "setCompanionDevice:", v9);
    v19 = [HMDRemoteLoginAnisetteDataProvider alloc];
    -[HMDRemoteLoginAuthentication sessionID](v11, "sessionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginAuthentication remoteMessageSender](v11, "remoteMessageSender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDRemoteLoginAnisetteDataProvider initWithSessionID:remoteMessageSender:](v19, "initWithSessionID:remoteMessageSender:", v20, v21);
    objc_msgSend(v16, "setAnisetteDataProvider:", v22);

  }
  objc_msgSend(v16, "_setProxyingForApp:", 1);
  -[HMDRemoteLoginReceiverCompanionAuthentication request](v11, "request");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginReceiverAuthentication _authenticateAccount:targetedAccountType:](v11, "_authenticateAccount:targetedAccountType:", v16, objc_msgSend(v23, "targetedAccountType"));

}

- (HMDRemoteLoginCompanionAuthenticationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

void __62__HMDRemoteLoginReceiverCompanionAuthentication__authenticate__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "companionDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_authenticateAccount:alreadyExists:withCompanionDevice:", *(_QWORD *)(a1 + 32), a3, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Save-remote-verified-account failed with error %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v13, "_completedAuthenticationRequest:loggedInAccount:", v7, 0);
  }

}

uint64_t __61__HMDRemoteLoginReceiverCompanionAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_51131 != -1)
    dispatch_once(&logCategory__hmf_once_t1_51131, &__block_literal_global_51132);
  return (id)logCategory__hmf_once_v2_51133;
}

void __60__HMDRemoteLoginReceiverCompanionAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_51133;
  logCategory__hmf_once_v2_51133 = v0;

}

@end
