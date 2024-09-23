@implementation HMDSecureRemoteMessageTransportDefaultDataSource

- (HMDSecureRemoteMessageTransportDefaultDataSource)init
{
  HMDSecureRemoteMessageTransportDefaultDataSource *v2;
  void *v3;
  uint64_t v4;
  NSArray *transports;
  uint64_t v6;
  HMDAccountRegistry *accountRegistry;
  HMDRemoteDeviceMonitor *v8;
  HMDAccountRegistry *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDRemoteDeviceMonitor *deviceMonitor;
  HMDModernTransportDeviceReachabilityObserver *v15;
  HMDModernTransportDeviceReachabilityObserver *reachabilityObserver;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HMDSecureRemoteMessageTransportDefaultDataSource;
  v2 = -[HMDSecureRemoteMessageTransportDefaultDataSource init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessageTransport remoteMessageTransportsForProductInfo:](HMDRemoteMessageTransport, "remoteMessageTransportsForProductInfo:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    transports = v2->_transports;
    v2->_transports = (NSArray *)v4;

    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v6 = objc_claimAutoreleasedReturnValue();
    accountRegistry = v2->_accountRegistry;
    v2->_accountRegistry = (HMDAccountRegistry *)v6;

    v8 = [HMDRemoteDeviceMonitor alloc];
    v9 = v2->_accountRegistry;
    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDRemoteDeviceMonitor initWithAccountRegistry:activityObserver:accountManager:](v8, "initWithAccountRegistry:activityObserver:accountManager:", v9, v11, v12);
    deviceMonitor = v2->_deviceMonitor;
    v2->_deviceMonitor = (HMDRemoteDeviceMonitor *)v13;

    v15 = objc_alloc_init(HMDModernTransportDeviceReachabilityObserver);
    reachabilityObserver = v2->_reachabilityObserver;
    v2->_reachabilityObserver = v15;

  }
  return v2;
}

- (id)secureSessionWithDevice:(id)a3
{
  id v4;
  HMDSecureRemoteSession *v5;
  void *v6;
  void *v7;
  HMDSecureRemoteSession *v8;

  v4 = a3;
  v5 = [HMDSecureRemoteSession alloc];
  -[HMDSecureRemoteMessageTransportDefaultDataSource deviceMonitor](self, "deviceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteMessageTransportDefaultDataSource accountRegistry](self, "accountRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDSecureRemoteSession initWithDevice:deviceMonitor:accountRegistry:](v5, "initWithDevice:deviceMonitor:accountRegistry:", v4, v6, v7);

  return v8;
}

- (NSArray)transports
{
  return self->_transports;
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return self->_deviceMonitor;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver
{
  return self->_reachabilityObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

@end
