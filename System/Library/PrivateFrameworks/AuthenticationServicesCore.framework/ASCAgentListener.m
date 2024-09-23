@implementation ASCAgentListener

- (ASCAgentListener)initWithPublicKeyCredentialManager:(id)a3
{
  id v5;
  ASCAgentListener *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSXPCListener *listener;
  _TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector *v11;
  _TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector *signInEventCollector;
  ASCAgentListener *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCAgentListener;
  v6 = -[ASCAgentListener init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1998]);
    ASCAgentServiceName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithMachServiceName:", v8);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v9;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_publicKeyCredentialManager, a3);
    v11 = objc_alloc_init(_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector);
    signInEventCollector = v6->_signInEventCollector;
    v6->_signInEventCollector = v11;

    -[NSXPCListener resume](v6->_listener, "resume");
    v13 = v6;
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASCAgent *v9;
  void *v10;
  ASCAgent *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[ASCAgentInterface xpcInterface](ASCAgentInterface, "xpcInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  v9 = [ASCAgent alloc];
  +[ASCAuthorizationTrafficController sharedInstance](ASCAuthorizationTrafficController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ASCAgent initWithTrafficController:connection:publicKeyCredentialManager:signInEventCollector:](v9, "initWithTrafficController:connection:publicKeyCredentialManager:signInEventCollector:", v10, v7, self->_publicKeyCredentialManager, self->_signInEventCollector);

  objc_msgSend(v7, "setExportedObject:", v11);
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  WBSApplicationIdentifierFromAuditToken();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_impl(&dword_20E648000, v13, OS_LOG_TYPE_DEFAULT, "Received connection from %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v11);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __55__ASCAgentListener_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_24C97F4B0;
  v14 = v12;
  v20 = v14;
  objc_copyWeak(&v21, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", &v16);
  objc_msgSend(v7, "resume", v16, v17, v18, v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
  return 1;
}

void __55__ASCAgentListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20E648000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ disconnected.", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelCurrentRequest");

}

- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)signInEventCollector
{
  return self->_signInEventCollector;
}

- (void)setSignInEventCollector:(id)a3
{
  objc_storeStrong((id *)&self->_signInEventCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInEventCollector, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
