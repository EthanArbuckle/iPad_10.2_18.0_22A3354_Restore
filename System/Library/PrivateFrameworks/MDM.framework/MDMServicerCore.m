@implementation MDMServicerCore

- (MDMServicerCore)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  MDMServicerCore *v8;
  MDMServicerCore *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MDMServicerCore;
  v8 = -[MDMServicerCore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_xpcConnection, v6);
    v9->_channelType = objc_msgSend(v7, "channelType");
    objc_storeStrong((id *)&v9->_server, a4);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MDMServicerCore;
  -[MDMServicerCore dealloc](&v4, sel_dealloc);
}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAssertionDescriptionsWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);

    v4 = (void (**)(id, _QWORD, uint64_t))v7;
  }

}

- (void)scheduleTokenUpdateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduleTokenUpdateWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduleTokenUpdateIfNecessaryWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)simulatePushWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "simulatePushWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v4))
  {

  }
  else
  {
    -[MDMServicerCore xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v6, CFSTR("com.apple.managedconfiguration.mdmd.push"));

    if (!v7)
    {
      -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v8);

      goto LABEL_6;
    }
  }

  -[MDMServicerCore server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulatePushIfNetworkTetheredWithCompletion:", v9);
LABEL_6:

}

- (void)notifyNewConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notifyNewConfigurationWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)retryNotNowWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retryNotNowWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)reauthenticationCompleteWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reauthenticationCompleteWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)pushTokenWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushTokenWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);

    v4 = (void (**)(id, _QWORD, uint64_t))v7;
  }

}

- (void)touchWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "touchWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void (**v11)(id, void *);

  v4 = *(_QWORD *)&a3;
  v11 = (void (**)(id, void *))a4;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v7, v6))
  {

  }
  else
  {
    -[MDMServicerCore xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v8, CFSTR("com.apple.managedconfiguration.profiled-access"));

    if (!v9)
    {
      -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v10);

      goto LABEL_6;
    }
  }

  -[MDMServicerCore server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrateMDMWithContext:completion:", v4, v11);
LABEL_6:

}

- (void)uprootMDMWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uprootMDMWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v4 = (void (**)(id, uint64_t))v7;
  }

}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v10, v9);

  if (v11)
  {

    -[MDMServicerCore server](self, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processDeviceRequest:encodeResponse:completion:", v13, v6, v8);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, v12, 0, 0);

    v8 = (id)v12;
  }

}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MDMServicerCore server](self, "server");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestInstallOfAppsInRestoreWithCompletion:", v4);

}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[MDMServicerCore server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockAppInstallsWithCompletion:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke;
  v7[3] = &unk_24EB68230;
  v7[4] = self;
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v7);

}

void __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "MDMServicer, XPC connection invalidated: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", 0);

  objc_msgSend(*(id *)(a1 + 32), "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unblockAppInstallsWithCompletion:", &__block_literal_global_8);

}

void __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke_102(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDMServicer, XPC connection invalidated, app installs unblocked, error = %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", 0);

  -[MDMServicerCore server](self, "server");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unblockAppInstallsWithCompletion:", v4);

}

- (void)depPushTokenWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "depPushTokenWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);

    v4 = (void (**)(id, _QWORD, uint64_t))v7;
  }

}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncDEPPushTokenWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);

    v4 = (void (**)(id, _QWORD, uint64_t))v7;
  }

}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v10, v9);

  if (v11)
  {

    -[MDMServicerCore server](self, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processUserRequest:encodeResponse:completion:", v13, v6, v8);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, v12, 0, 0);

    v8 = (id)v12;
  }

}

- (void)isAwaitingUserConfiguredWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[MDMServicerCore _MDMAccessEntitlementForChannelType:](self, "_MDMAccessEntitlementForChannelType:", -[MDMServicerCore channelType](self, "channelType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMServicerCore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MDMServicerCore _remoteProcess:hasEntitlement:](self, "_remoteProcess:hasEntitlement:", v5, v8);

  if (v6)
  {

    -[MDMServicerCore server](self, "server");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isAwaitingUserConfiguredWithCompletion:", v4);
  }
  else
  {
    -[MDMServicerCore _lacksEntitlementError:](self, "_lacksEntitlementError:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);

    v4 = (void (**)(id, _QWORD, uint64_t))v7;
  }

}

- (id)_MDMAccessEntitlementForChannelType:(unint64_t)a3
{
  if (a3)
    return CFSTR("com.apple.managedconfiguration.mdmuserd-access");
  else
    return CFSTR("com.apple.managedconfiguration.mdmd-access");
}

- (BOOL)_remoteProcess:(id)a3 hasEntitlement:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "valueForEntitlement:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
      v5 = 1;
  }

  return v5;
}

- (id)_lacksEntitlementError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A708];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 39000, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (MDMServerCore)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
