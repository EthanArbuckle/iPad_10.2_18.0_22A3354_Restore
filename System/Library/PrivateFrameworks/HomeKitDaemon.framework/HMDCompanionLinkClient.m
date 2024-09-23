@implementation HMDCompanionLinkClient

- (void)dealloc
{
  objc_super v3;

  -[HMDCompanionLinkClient stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)HMDCompanionLinkClient;
  -[HMDCompanionLinkClient dealloc](&v3, sel_dealloc);
}

- (RPCompanionLinkClient)client
{
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *v5;

  client = self->_client;
  if (!client)
  {
    v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    v5 = self->_client;
    self->_client = v4;

    client = self->_client;
  }
  return client;
}

- (OS_dispatch_queue)dispatchQueue
{
  void *v2;
  void *v3;

  -[HMDCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCompanionLinkClient client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

}

- (id)deviceFoundHandler
{
  void *v2;
  void *v3;

  -[HMDCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceFoundHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCompanionLinkClient client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceFoundHandler:", v4);

}

- (id)deviceChangedHandler
{
  void *v2;
  void *v3;

  -[HMDCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCompanionLinkClient client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceChangedHandler:", v4);

}

- (id)deviceLostHandler
{
  void *v2;
  void *v3;

  -[HMDCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceLostHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceLostHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCompanionLinkClient client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceLostHandler:", v4);

}

- (void)start
{
  id v2;

  -[HMDCompanionLinkClient client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateWithCompletion:", &__block_literal_global_211745);

}

- (void)stop
{
  void *v3;

  -[HMDCompanionLinkClient client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HMDCompanionLinkClient setClient:](self, "setClient:", 0);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

void __31__HMDCompanionLinkClient_start__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v6;
      v13 = 2112;
      v14 = v2;
      v7 = "%{public}@Failed to activate RPCompanionLinkClient with error %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v8, v9, v7, (uint8_t *)&v11, v10);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    v7 = "%{public}@Successfully activated RPCompanionLinkClient.";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v3);
}

@end
