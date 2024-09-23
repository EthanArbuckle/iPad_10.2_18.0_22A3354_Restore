@implementation HMDRemoteLoginAuthentication

- (HMDRemoteLoginAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDRemoteLoginAuthentication *v15;
  HMDRemoteLoginAuthentication *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDRemoteLoginAuthentication;
  v15 = -[HMDRemoteLoginAuthentication init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_remoteDevice, a4);
    objc_storeStrong((id *)&v16->_workQueue, a5);
    objc_storeStrong((id *)&v16->_remoteMessageSender, a6);
  }

  return v16;
}

- (void)authenticate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_79167 != -1)
    dispatch_once(&logCategory__hmf_once_t0_79167, &__block_literal_global_79168);
  return (id)logCategory__hmf_once_v1_79169;
}

void __43__HMDRemoteLoginAuthentication_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_79169;
  logCategory__hmf_once_v1_79169 = v0;

}

@end
