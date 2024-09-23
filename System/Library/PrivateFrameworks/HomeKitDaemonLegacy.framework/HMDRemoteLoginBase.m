@implementation HMDRemoteLoginBase

- (HMDRemoteLoginBase)initWithUUID:(id)a3 accessory:(id)a4 remoteLoginHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDRemoteLoginBase *v12;
  HMDRemoteLoginBase *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *logString;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDRemoteLoginBase;
  v12 = -[HMDRemoteLoginBase init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    objc_storeWeak((id *)&v13->_remoteLoginHandler, v11);
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[HMDRemoteLoginBase accessory](v13, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginBase uuid](v13, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@"), v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    logString = v13->_logString;
    v13->_logString = (NSString *)v19;

  }
  return v13;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HMDRemoteLoginBase uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDRemoteLoginBase setWorkQueue:](self, "setWorkQueue:", a3);
  -[HMDRemoteLoginBase setMsgDispatcher:](self, "setMsgDispatcher:", v6);

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDRemoteLoginHandler)remoteLoginHandler
{
  return (HMDRemoteLoginHandler *)objc_loadWeakRetained((id *)&self->_remoteLoginHandler);
}

- (NSString)logString
{
  return self->_logString;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logString, 0);
  objc_destroyWeak((id *)&self->_remoteLoginHandler);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_104348 != -1)
    dispatch_once(&logCategory__hmf_once_t0_104348, &__block_literal_global_104349);
  return (id)logCategory__hmf_once_v1_104350;
}

void __33__HMDRemoteLoginBase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_104350;
  logCategory__hmf_once_v1_104350 = v0;

}

@end
