@implementation HMDCHIPControllerPrivateDataSource

- (HMDCHIPControllerPrivateDataSource)initWithHome:(id)a3 nodeID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCHIPControllerPrivateDataSource *v9;
  HMDCHIPControllerPrivateDataSource *v10;
  HMDCHIPControllerPrivateDataSource *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)HMDCHIPControllerPrivateDataSource;
    v9 = -[HMDCHIPControllerPrivateDataSource init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_home, v6);
      objc_storeWeak((id *)&v10->_controllerNodeID, v8);
    }

    return v10;
  }
  else
  {
    v12 = (HMDCHIPControllerPrivateDataSource *)_HMFPreconditionFailure();
    return (HMDCHIPControllerPrivateDataSource *)-[HMDCHIPControllerPrivateDataSource valueForKey:](v12, v13, v14);
  }
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerPrivateStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForSDKKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(void *, _QWORD);

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "controllerPrivateStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forSDKKey:", v10, v9);

  v13 = (void (**)(void *, _QWORD))_Block_copy(v8);
  if (v13)
    v13[2](v13, 0);

  return 1;
}

- (BOOL)removeValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void *, _QWORD);

  v6 = a4;
  v7 = a3;
  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controllerPrivateStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeValueForSDKKey:", v7);

  v10 = (void (**)(void *, _QWORD))_Block_copy(v6);
  if (v10)
    v10[2](v10, 0);

  return 1;
}

- (id)allKeyValuePairs
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerPrivateStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSDKKeyValuePairs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)setKeyValuePairs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void *, _QWORD);

  v6 = a4;
  v7 = a3;
  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controllerPrivateStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSDKKeyValuePairs:", v7);

  v10 = (void (**)(void *, _QWORD))_Block_copy(v6);
  if (v10)
    v10[2](v10, 0);

  return 1;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDCHIPControllerPrivateDataSource home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabric");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fabricID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerPrivateDataSource controllerNodeID](self, "controllerNodeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSNumber)controllerNodeID
{
  return (NSNumber *)objc_loadWeakRetained((id *)&self->_controllerNodeID);
}

- (void)setControllerNodeID:(id)a3
{
  objc_storeWeak((id *)&self->_controllerNodeID, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controllerNodeID);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_159593 != -1)
    dispatch_once(&logCategory__hmf_once_t3_159593, &__block_literal_global_159594);
  return (id)logCategory__hmf_once_v4_159595;
}

void __49__HMDCHIPControllerPrivateDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_159595;
  logCategory__hmf_once_v4_159595 = v0;

}

@end
