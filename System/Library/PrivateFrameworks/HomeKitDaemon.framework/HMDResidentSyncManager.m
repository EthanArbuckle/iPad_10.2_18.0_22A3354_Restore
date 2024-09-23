@implementation HMDResidentSyncManager

- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  HMDResidentSyncClientDefaultDataSource *v16;
  HMDResidentSyncServerDefaultDataSource *v17;
  HMDResidentSyncManager *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isResidentCapable");
  v16 = objc_alloc_init(HMDResidentSyncClientDefaultDataSource);
  v17 = objc_alloc_init(HMDResidentSyncServerDefaultDataSource);
  v18 = -[HMDResidentSyncManager initWithHome:notificationCenter:persistence:logEventSubmitter:isResidentCapable:clientDataSource:serverDataSource:](self, "initWithHome:notificationCenter:persistence:logEventSubmitter:isResidentCapable:clientDataSource:serverDataSource:", v13, v12, v11, v10, v15, v16, v17);

  return v18;
}

- (HMDResidentSyncManager)initWithHome:(id)a3 notificationCenter:(id)a4 persistence:(id)a5 logEventSubmitter:(id)a6 isResidentCapable:(BOOL)a7 clientDataSource:(id)a8 serverDataSource:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDResidentSyncManager *v21;
  HMDResidentSyncManager *v22;
  _BOOL4 v23;
  id v24;
  id v25;
  HMDResidentSyncClient *v26;
  void *v27;
  void *v28;
  HMDResidentSyncClient *v29;
  uint64_t v30;
  HMDResidentSyncClient *client;
  HMDResidentSyncServer *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HMDResidentSyncServer *server;
  uint64_t v38;
  id v39;
  id v40;
  objc_super v41;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v41.receiver = self;
  v41.super_class = (Class)HMDResidentSyncManager;
  v21 = -[HMDResidentSyncManager init](&v41, sel_init);
  v22 = v21;
  if (v21)
  {
    v40 = v19;
    v23 = v10;
    objc_storeWeak((id *)&v21->_home, v15);
    v39 = v20;
    v24 = v16;
    if (HMDResidentSyncCodingModel__hmf_once_t0 != -1)
      dispatch_once(&HMDResidentSyncCodingModel__hmf_once_t0, &__block_literal_global_153790);
    v25 = (id)HMDResidentSyncCodingModel__hmf_once_v1;
    v26 = [HMDResidentSyncClient alloc];
    objc_msgSend(v15, "msgDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "residentDeviceManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = v23;
    v29 = v26;
    v16 = v24;
    v30 = -[HMDResidentSyncClient initWithHome:codingModel:dispatcher:residentDeviceManager:notificationCenter:persistence:isResidentCapable:dataSource:logEventSubmitter:](v29, "initWithHome:codingModel:dispatcher:residentDeviceManager:notificationCenter:persistence:isResidentCapable:dataSource:logEventSubmitter:", v15, v25, v27, v28, v24, v17, v38, v40, v18);
    client = v22->_client;
    v22->_client = (HMDResidentSyncClient *)v30;

    if (v23)
    {
      v32 = [HMDResidentSyncServer alloc];
      objc_msgSend(v15, "msgDispatcher");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "residentDeviceManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDResidentSyncServer initWithHome:codingModel:dispatcher:residentDeviceManager:notificationCenter:persistence:dataSource:logEventSubmitter:](v32, "initWithHome:codingModel:dispatcher:residentDeviceManager:notificationCenter:persistence:dataSource:logEventSubmitter:", v15, v25, v33, v34, v16, v17, v39, v18);
      server = v22->_server;
      v22->_server = (HMDResidentSyncServer *)v35;

    }
    v20 = v39;
    v19 = v40;
  }

  return v22;
}

- (id)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSyncManager client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[HMDResidentSyncManager server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDResidentSyncManager server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)stop
{
  void *v3;
  id v4;

  -[HMDResidentSyncManager client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[HMDResidentSyncManager server](self, "server");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)performResidentRequest:(id)a3 options:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HMDResidentSyncManager client](self, "client");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performResidentRequest:options:", v6, a4);

}

- (void)performSync
{
  id v2;

  -[HMDResidentSyncManager client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSync");

}

- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDResidentSyncManager server](self, "server");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interceptRemoteResidentRequest:proceed:", v7, v6);

}

- (id)logIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDResidentSyncClient)client
{
  return (HMDResidentSyncClient *)objc_getProperty(self, a2, 16, 1);
}

- (HMDResidentSyncServer)server
{
  return (HMDResidentSyncServer *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_156208 != -1)
    dispatch_once(&logCategory__hmf_once_t0_156208, &__block_literal_global_156209);
  return (id)logCategory__hmf_once_v1_156210;
}

void __37__HMDResidentSyncManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_156210;
  logCategory__hmf_once_v1_156210 = v0;

}

@end
