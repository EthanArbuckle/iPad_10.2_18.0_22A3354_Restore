@implementation __HMDHomeAdministratorReceiver

- (__HMDHomeAdministratorReceiver)initWithReceiver:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  __HMDHomeAdministratorReceiver *v8;
  __HMDHomeAdministratorReceiver *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)__HMDHomeAdministratorReceiver;
  v8 = -[__HMDHomeAdministratorReceiver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_receiver, v6);
    objc_storeWeak((id *)&v9->_handler, v7);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  id v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  v4 = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(WeakRetained, "deregisterReceiver:", v4);

  objc_msgSend(WeakRetained, "dispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)__HMDHomeAdministratorReceiver;
  -[__HMDHomeAdministratorReceiver dealloc](&v6, sel_dealloc);
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "hmf_objectsPassingTest:", &__block_literal_global_109);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[__HMDHomeAdministratorReceiver handler](self, "handler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dispatcher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", v6, self, v9, sel___handleXPCMessage_);

    }
  }
}

- (void)__handleXPCMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __HMDHomeAdministratorReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching message: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[__HMDHomeAdministratorReceiver handler](v7, "handler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchMessage:", v4);

  }
}

- (NSUUID)messageTargetUUID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(WeakRetained, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMFMessageReceiver)receiver
{
  return (HMFMessageReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (HMDHomeAdministratorHandler)handler
{
  return (HMDHomeAdministratorHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_destroyWeak((id *)&self->_receiver);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_225320 != -1)
    dispatch_once(&logCategory__hmf_once_t7_225320, &__block_literal_global_113_225321);
  return (id)logCategory__hmf_once_v8_225322;
}

@end
