@implementation HMDRemoteLoginInitiatorProxyAuthentication

- (HMDRemoteLoginInitiatorProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 authResults:(id)a8
{
  id v15;
  HMDRemoteLoginInitiatorProxyAuthentication *v16;
  HMDRemoteLoginInitiatorProxyAuthentication *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginInitiatorProxyAuthentication;
  v16 = -[HMDRemoteLoginInitiatorAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:delegate:](&v19, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_delegate_, a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_authResults, a8);

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDRemoteLoginInitiatorProxyAuthentication *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDRemoteLoginInitiatorProxyAuthentication *v11;
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
  v7.super_class = (Class)HMDRemoteLoginInitiatorProxyAuthentication;
  -[HMDRemoteLoginInitiatorProxyAuthentication dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRemoteLoginAuthentication sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Init-Proxy-Auth: Session: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)loginType
{
  return 2;
}

- (void)authenticate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDRemoteLoginAuthentication workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDRemoteLoginInitiatorProxyAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_authenticate
{
  HMDRemoteLoginProxyAuthenticationRequest *v3;
  void *v4;
  HMDRemoteLoginProxyAuthenticationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDRemoteLoginInitiatorProxyAuthentication *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDRemoteLoginInitiatorProxyAuthentication *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = [HMDRemoteLoginProxyAuthenticationRequest alloc];
  -[HMDRemoteLoginAuthentication sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMRemoteLoginMessage initWithSessionID:](v3, "initWithSessionID:", v4);

  -[HMDRemoteLoginInitiatorProxyAuthentication authResults](self, "authResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E0CFFFC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest setUsername:](v5, "setUsername:", v7);

  -[HMDRemoteLoginInitiatorProxyAuthentication authResults](self, "authResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest setRawPassword:](v5, "setRawPassword:", v9);

  -[HMDRemoteLoginInitiatorProxyAuthentication authResults](self, "authResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x1E0CFFFA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest setPasswordToken:](v5, "setPasswordToken:", v11);

  -[HMDRemoteLoginInitiatorProxyAuthentication authResults](self, "authResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_stringForKey:", *MEMORY[0x1E0CFFF40]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest setAltDSID:](v5, "setAltDSID:", v13);

  v14 = (void *)MEMORY[0x1D17BA0A0](-[HMDRemoteLoginAuthenticationRequest setTargetedAccountType:](v5, "setTargetedAccountType:", 0));
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginProxyAuthenticationRequest username](v5, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginProxyAuthenticationRequest passwordToken](v5, "passwordToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginProxyAuthenticationRequest altDSID](v5, "altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v33 = v17;
    v34 = 2112;
    v35 = v18;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Received username %@, pet %@, alt-dsid %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = v15;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginProxyAuthenticationRequest rawPassword](v5, "rawPassword");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "length");
    HMFBooleanToString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v24;
    v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Received password: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  objc_initWeak((id *)buf, v22);
  -[HMDRemoteLoginAuthentication remoteMessageSender](v22, "remoteMessageSender");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest messageName](v5, "messageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginProxyAuthenticationRequest messagePayload](v5, "messagePayload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__HMDRemoteLoginInitiatorProxyAuthentication__authenticate__block_invoke;
  v30[3] = &unk_1E89BF5C0;
  objc_copyWeak(&v31, (id *)buf);
  objc_msgSend(v27, "sendRemoteMessageWithName:payload:responseHandler:", v28, v29, v30);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

- (NSDictionary)authResults
{
  return self->_authResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authResults, 0);
}

void __59__HMDRemoteLoginInitiatorProxyAuthentication__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __58__HMDRemoteLoginInitiatorProxyAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticate");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1)
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_394);
  return (id)logCategory__hmf_once_v2;
}

void __57__HMDRemoteLoginInitiatorProxyAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

}

@end
