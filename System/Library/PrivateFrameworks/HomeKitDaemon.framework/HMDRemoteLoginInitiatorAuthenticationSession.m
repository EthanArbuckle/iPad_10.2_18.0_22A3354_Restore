@implementation HMDRemoteLoginInitiatorAuthenticationSession

- (HMDRemoteLoginInitiatorAuthenticationSession)initWithSessionID:(id)a3 remoteAuthentication:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  HMDRemoteLoginInitiatorAuthenticationSession *v11;
  HMDRemoteLoginInitiatorAuthenticationSession *v12;
  void *v13;
  id completion;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginInitiatorAuthenticationSession;
  v11 = -[HMDRemoteLoginInitiatorSession initWithSessionID:](&v16, sel_initWithSessionID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_remoteAuthentication, a4);
    v13 = _Block_copy(v10);
    completion = v12->_completion;
    v12->_completion = v13;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  HMDRemoteLoginInitiatorAuthenticationSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDRemoteLoginInitiatorAuthenticationSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDRemoteLoginInitiatorAuthenticationSession;
  -[HMDRemoteLoginInitiatorAuthenticationSession dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDRemoteLoginInitiatorSession sessionID](self, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[Login-Initiator-Auth-Session: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDRemoteLoginInitiatorAuthentication)remoteAuthentication
{
  return self->_remoteAuthentication;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteAuthentication, 0);
}

@end
