@implementation AKAuthorizationAppSignInDiscovery

- (AKAuthorizationAppSignInDiscovery)init
{
  AKAuthorizationAppSignInDiscovery *v2;
  AKAuthorizationDaemonConnection *v3;
  AKAuthorizationDaemonConnection *daemonConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppSignInDiscovery;
  v2 = -[AKAuthorizationAppSignInDiscovery init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AKAuthorizationDaemonConnection);
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = v3;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  AKAuthorizationDaemonConnection *daemonConnection;
  objc_super v5;

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AKCustodianDaemonConnection dealloc].cold.1((uint64_t)self, v3);

  daemonConnection = self->_daemonConnection;
  if (daemonConnection)
  {
    self->_daemonConnection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationAppSignInDiscovery;
  -[AKAuthorizationAppSignInDiscovery dealloc](&v5, sel_dealloc);
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  daemonConnection = self->_daemonConnection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__AKAuthorizationAppSignInDiscovery_startDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_1E2E5E220;
  v9 = v4;
  v6 = v4;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDiscoveryWithCompletion:", v6);

}

uint64_t __66__AKAuthorizationAppSignInDiscovery_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
