@implementation HMDRemoteLoginAnisetteDataProviderBridge

- (HMDRemoteLoginAnisetteDataProviderBridge)initWithUUID:(id)a3
{
  id v5;
  HMDRemoteLoginAnisetteDataProviderBridge *v6;
  HMDRemoteLoginAnisetteDataProviderBridge *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginAnisetteDataProviderBridge;
  v6 = -[HMDRemoteLoginAnisetteDataProviderBridge init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemoteLoginAnisetteDataProviderBridge uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 remoteMessageSender:(id)a5
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  -[HMDRemoteLoginAnisetteDataProviderBridge setWorkQueue:](self, "setWorkQueue:", a3);
  -[HMDRemoteLoginAnisetteDataProviderBridge setMsgDispatcher:](self, "setMsgDispatcher:", v8);

  -[HMDRemoteLoginAnisetteDataProviderBridge setRemoteMessageSender:](self, "setRemoteMessageSender:", v9);
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  __registerXPCRelayForMessageClass(self, v3);
  v4 = (void *)objc_opt_class();
  __registerXPCRelayForMessageClass(self, v4);
  v5 = (void *)objc_opt_class();
  __registerXPCRelayForMessageClass(self, v5);
  v6 = (void *)objc_opt_class();
  __registerXPCRelayForMessageClass(self, v6);
  v7 = (void *)objc_opt_class();
  __registerXPCRelayForMessageClass(self, v7);
}

- (HMDRemoteLoginAnisetteDataProviderBridge)initWithCoder:(id)a3
{
  id v4;
  HMDRemoteLoginAnisetteDataProviderBridge *v5;
  uint64_t v6;
  NSUUID *uuid;

  v4 = a3;
  v5 = -[HMDRemoteLoginAnisetteDataProviderBridge init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDRemoteLoginAnisetteDataProviderBridge uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kIdentifierKey"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void)setRemoteMessageSender:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMessageSender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_105798 != -1)
    dispatch_once(&logCategory__hmf_once_t0_105798, &__block_literal_global_105799);
  return (id)logCategory__hmf_once_v1_105800;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __55__HMDRemoteLoginAnisetteDataProviderBridge_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_105800;
  logCategory__hmf_once_v1_105800 = v0;

}

@end
