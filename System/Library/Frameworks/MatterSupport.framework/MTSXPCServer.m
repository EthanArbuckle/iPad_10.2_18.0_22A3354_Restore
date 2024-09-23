@implementation MTSXPCServer

- (MTSXPCServer)init
{
  MTSXPCListener *v3;
  void *v4;
  MTSXPCListener *v5;
  MTSXPCServer *v6;

  v3 = [MTSXPCListener alloc];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.matter.support.xpc"));
  v5 = -[MTSXPCListener initWithXPCListener:](v3, "initWithXPCListener:", v4);

  v6 = -[MTSXPCServer initWithListener:clientProxyFactory:](self, "initWithListener:clientProxyFactory:", v5, &__block_literal_global_2078);
  return v6;
}

- (MTSXPCServer)initWithListener:(id)a3 clientProxyFactory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MTSXPCServer *v10;
  MTSXPCServer *v11;
  void *v12;
  id clientProxyFactory;
  uint64_t v14;
  NSMutableSet *clientProxies;
  MTSXPCServer *result;
  MTSXPCServer *v17;
  SEL v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v17 = (MTSXPCServer *)_HMFPreconditionFailure();
    -[MTSXPCServer start](v17, v18);
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSXPCServer;
  v10 = -[MTSXPCServer init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_listener, a3);
    v12 = _Block_copy(v9);
    clientProxyFactory = v11->_clientProxyFactory;
    v11->_clientProxyFactory = v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    clientProxies = v11->_clientProxies;
    v11->_clientProxies = (NSMutableSet *)v14;

  }
  return v11;
}

- (void)start
{
  void *v3;
  id v4;

  -[MTSXPCServer listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[MTSXPCServer listener](self, "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  MTSXPCServer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  MTSXPCServer *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MTSXPCServer clientProxyFactory](self, "clientProxyFactory");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x23493F978](objc_msgSend(v9, "setDelegate:", self));
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@Accepting new client proxy: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDD1990], "mts_clientInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v14);

  objc_msgSend(MEMORY[0x24BDD1990], "mts_serverInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v15);

  objc_msgSend(v7, "setExportedObject:", v9);
  objc_initWeak((id *)buf, v9);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __51__MTSXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v22 = &unk_250599ED0;
  objc_copyWeak(&v24, (id *)buf);
  v23 = v11;
  objc_msgSend(v7, "setInvalidationHandler:", &v19);
  p_lock = &v11->_lock;
  os_unfair_lock_lock_with_options();
  -[MTSXPCServer clientProxies](v11, "clientProxies", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v9);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)clientProxy:(id)a3 fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  MTSXPCServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if ((objc_msgSend(v8, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer devicePairingServer](self, "devicePairingServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      _HMFPreconditionFailure();
    v12 = v11;
    objc_msgSend(v11, "fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2344FE000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing fetch device pairings request because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17);

  }
}

- (void)clientProxy:(id)a3 removeDevicePairingWithUUID:(id)a4 forSystemCommissionerPairingUUID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  MTSXPCServer *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if ((objc_msgSend(v10, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer devicePairingServer](self, "devicePairingServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      _HMFPreconditionFailure();
    v15 = v14;
    objc_msgSend(v14, "removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", v11, v12, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x23493F978]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2344FE000, v18, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove device pairing request because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v20);

  }
}

- (void)clientProxy:(id)a3 removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  MTSXPCServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ((objc_msgSend(v8, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer devicePairingServer](self, "devicePairingServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      _HMFPreconditionFailure();
    v12 = v11;
    objc_msgSend(v11, "removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2344FE000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove all device pairings because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);

  }
}

- (void)clientProxy:(id)a3 openCommissioningWindowForSystemCommissionerPairingUUID:(id)a4 duration:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MTSXPCServer *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(v10, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer devicePairingServer](self, "devicePairingServer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      _HMFPreconditionFailure();
    v14 = v13;
    objc_msgSend(v13, "openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", v11, v12, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x23493F978]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2344FE000, v17, OS_LOG_TYPE_ERROR, "%{public}@Disallowing opening commissioning window because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v19);

  }
}

- (void)clientProxy:(id)a3 readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  MTSXPCServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if ((objc_msgSend(v8, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer devicePairingServer](self, "devicePairingServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      _HMFPreconditionFailure();
    v12 = v11;
    objc_msgSend(v11, "readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2344FE000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing reading commissioning window status because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17);

  }
}

- (void)clientProxy:(id)a3 performDeviceSetupUsingRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  MTSXPCServer *v12;
  SEL v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[MTSXPCServer deviceSetupServer](self, "deviceSetupServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "clientProxy:performDeviceSetupUsingRequest:completionHandler:", v16, v8, v9);

  }
  else
  {
    v12 = (MTSXPCServer *)_HMFPreconditionFailure();
    -[MTSXPCServer clientProxy:fetchSystemCommissionerPairingsWithCompletionHandler:](v12, v13, v14, v15);
  }
}

- (void)clientProxy:(id)a3 fetchSystemCommissionerPairingsWithCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  MTSXPCServer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if ((objc_msgSend(v6, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer systemCommissionerPairingServer](self, "systemCommissionerPairingServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      _HMFPreconditionFailure();
    v9 = v8;
    objc_msgSend(v8, "fetchSystemCommissionerPairingsWithCompletionHandler:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x23493F978]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_ERROR, "%{public}@Disallowing fetch system commissioner pairings request because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);

  }
}

- (void)clientProxy:(id)a3 removeSystemCommissionerPairingWithUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  MTSXPCServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ((objc_msgSend(v8, "hasDevicePairingEntitlement") & 1) != 0)
  {
    -[MTSXPCServer systemCommissionerPairingServer](self, "systemCommissionerPairingServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      _HMFPreconditionFailure();
    v12 = v11;
    objc_msgSend(v11, "removeSystemCommissionerPairingWithUUID:completionHandler:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Process is missing entitlement: %@"), CFSTR("com.apple.matter.support.xpc.device-pairing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2344FE000, v15, OS_LOG_TYPE_ERROR, "%{public}@Disallowing remove system commissioner pairing request because %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);

  }
}

- (void)clientProxy:(id)a3 checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  MTSXPCServer *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if ((objc_msgSend(v6, "hasPrivateHomeKitEntitlement") & 1) != 0)
  {
    -[MTSXPCServer authorizationServer](self, "authorizationServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      _HMFPreconditionFailure();
    v9 = v8;
    objc_msgSend(v8, "checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:", v7);

  }
  else
  {
    v10 = (void *)MEMORY[0x23493F978]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = CFSTR("com.apple.private.homekit");
      _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_ERROR, "%{public}@Returning NO to check restricted characteristics access allowed because process is missing entitlement: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v7[2](v7, 0);
  }

}

- (void)showRestrictedCharacteristicsAccessWarningAlertWithClientProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTSXPCServer *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hasPrivateHomeKitEntitlement") & 1) != 0)
  {
    -[MTSXPCServer authorizationServer](self, "authorizationServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      _HMFPreconditionFailure();
    v6 = v5;
    objc_msgSend(v5, "showRestrictedCharacteristicsAccessWarningAlert");

  }
  else
  {
    v7 = (void *)MEMORY[0x23493F978]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = CFSTR("com.apple.private.homekit");
      _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not showing restricted characteristics access warning because process is missing entitlement: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (MTSDevicePairingServerInterface)devicePairingServer
{
  return (MTSDevicePairingServerInterface *)objc_loadWeakRetained((id *)&self->_devicePairingServer);
}

- (void)setDevicePairingServer:(id)a3
{
  objc_storeWeak((id *)&self->_devicePairingServer, a3);
}

- (MTSXPCDeviceSetupClientProxyDelegate)deviceSetupServer
{
  return (MTSXPCDeviceSetupClientProxyDelegate *)objc_loadWeakRetained((id *)&self->_deviceSetupServer);
}

- (void)setDeviceSetupServer:(id)a3
{
  objc_storeWeak((id *)&self->_deviceSetupServer, a3);
}

- (MTSSystemCommissionerPairingServerInterface)systemCommissionerPairingServer
{
  return (MTSSystemCommissionerPairingServerInterface *)objc_loadWeakRetained((id *)&self->_systemCommissionerPairingServer);
}

- (void)setSystemCommissionerPairingServer:(id)a3
{
  objc_storeWeak((id *)&self->_systemCommissionerPairingServer, a3);
}

- (MTSAuthorizationServerInterface)authorizationServer
{
  return (MTSAuthorizationServerInterface *)objc_loadWeakRetained((id *)&self->_authorizationServer);
}

- (void)setAuthorizationServer:(id)a3
{
  objc_storeWeak((id *)&self->_authorizationServer, a3);
}

- (MTSXPCListener)listener
{
  return (MTSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (id)clientProxyFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (NSMutableSet)clientProxies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxies, 0);
  objc_storeStrong(&self->_clientProxyFactory, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_authorizationServer);
  objc_destroyWeak((id *)&self->_systemCommissionerPairingServer);
  objc_destroyWeak((id *)&self->_deviceSetupServer);
  objc_destroyWeak((id *)&self->_devicePairingServer);
}

void __51__MTSXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x23493F978]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = WeakRetained;
      _os_log_impl(&dword_2344FE000, v5, OS_LOG_TYPE_INFO, "%{public}@Client proxy invalidated: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 32), "clientProxies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", WeakRetained);

    os_unfair_lock_unlock(v7);
  }

}

MTSXPCClientProxy *__20__MTSXPCServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MTSXPCClientProxy *v3;

  v2 = a2;
  v3 = -[MTSXPCClientProxy initWithConnection:]([MTSXPCClientProxy alloc], "initWithConnection:", v2);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_2082 != -1)
    dispatch_once(&logCategory__hmf_once_t13_2082, &__block_literal_global_21);
  return (id)logCategory__hmf_once_v14_2083;
}

void __27__MTSXPCServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_2083;
  logCategory__hmf_once_v14_2083 = v0;

}

@end
