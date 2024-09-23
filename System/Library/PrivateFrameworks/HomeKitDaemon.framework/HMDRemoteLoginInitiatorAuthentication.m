@implementation HMDRemoteLoginInitiatorAuthentication

- (HMDRemoteLoginInitiatorAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7
{
  id v12;
  HMDRemoteLoginInitiatorAuthentication *v13;
  HMDRemoteLoginInitiatorAuthentication *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginInitiatorAuthentication;
  v13 = -[HMDRemoteLoginAuthentication initWithSessionID:remoteDevice:workQueue:remoteMessageSender:](&v16, sel_initWithSessionID_remoteDevice_workQueue_remoteMessageSender_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_delegate, v12);

  return v14;
}

- (void)authenticate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (int)loginType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)_handleAuthenticationResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
  }
  else
  {
    +[HMDRemoteLoginAuthenticationResponse objWithDict:](HMDRemoteLoginAuthenticationResponse, "objWithDict:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9
      && (objc_msgSend(v9, "loggedInAccount"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      objc_msgSend(v8, "error");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v11;
  }
  -[HMDRemoteLoginInitiatorAuthentication delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_2557D0188))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "loggedInAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didCompleteAuthentication:error:loggedInAccount:", self, v7, v15);

  }
}

- (HMDRemoteLoginInitiatorAuthenticationDelegate)delegate
{
  return (HMDRemoteLoginInitiatorAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_236077 != -1)
    dispatch_once(&logCategory__hmf_once_t0_236077, &__block_literal_global_236078);
  return (id)logCategory__hmf_once_v1_236079;
}

void __52__HMDRemoteLoginInitiatorAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_236079;
  logCategory__hmf_once_v1_236079 = v0;

}

@end
