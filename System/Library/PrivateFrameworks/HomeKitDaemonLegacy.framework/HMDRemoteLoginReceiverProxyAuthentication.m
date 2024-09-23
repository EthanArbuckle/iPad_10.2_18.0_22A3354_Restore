@implementation HMDRemoteLoginReceiverProxyAuthentication

- (HMDRemoteLoginReceiverProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8
{
  id v15;
  HMDRemoteLoginReceiverProxyAuthentication *v16;
  HMDRemoteLoginReceiverProxyAuthentication *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginReceiverProxyAuthentication;
  v16 = -[HMDRemoteLoginReceiverAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:](&v19, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_delegate_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_request, a8);

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDRemoteLoginReceiverProxyAuthentication *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDRemoteLoginReceiverProxyAuthentication *v11;
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
  v7.super_class = (Class)HMDRemoteLoginReceiverProxyAuthentication;
  -[HMDRemoteLoginReceiverProxyAuthentication dealloc](&v7, sel_dealloc);
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
  -[HMDRemoteLoginReceiverProxyAuthentication request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Recv-Proxy-Auth: Session: %@, Request: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)authenticate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDRemoteLoginAuthentication workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDRemoteLoginReceiverProxyAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_authenticate
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDRemoteLoginReceiverProxyAuthentication request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HMDRemoteLoginUtilities serviceTypeForAccountService:](HMDRemoteLoginUtilities, "serviceTypeForAccountService:", objc_msgSend(v3, "targetedAccountType"));

  v10 = objc_alloc_init(MEMORY[0x1E0D00128]);
  -[HMDRemoteLoginReceiverProxyAuthentication request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsername:", v6);

  -[HMDRemoteLoginReceiverProxyAuthentication request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rawPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setPassword:", v8);

  objc_msgSend(v10, "setIsUsernameEditable:", 0);
  objc_msgSend(v10, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v10, "setServiceType:", v4);
  objc_msgSend(v10, "setAuthenticationType:", 1);
  objc_msgSend(v10, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v10, "_setProxyingForApp:", 1);
  -[HMDRemoteLoginReceiverProxyAuthentication request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginReceiverAuthentication _authenticateAccount:targetedAccountType:](self, "_authenticateAccount:targetedAccountType:", v10, objc_msgSend(v9, "targetedAccountType"));

}

- (HMDRemoteLoginProxyAuthenticationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

uint64_t __57__HMDRemoteLoginReceiverProxyAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_60310 != -1)
    dispatch_once(&logCategory__hmf_once_t1_60310, &__block_literal_global_60311);
  return (id)logCategory__hmf_once_v2_60312;
}

void __56__HMDRemoteLoginReceiverProxyAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_60312;
  logCategory__hmf_once_v2_60312 = v0;

}

@end
