@implementation HAENotificationCenterServer

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1)
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_6);
  return (id)sharedInstance_instance_4;
}

void __45__HAENotificationCenterServer_sharedInstance__block_invoke()
{
  HAENotificationCenterServer *v0;
  void *v1;

  v0 = objc_alloc_init(HAENotificationCenterServer);
  v1 = (void *)sharedInstance_instance_4;
  sharedInstance_instance_4 = (uint64_t)v0;

}

- (HAENotificationCenterServer)init
{
  HAENotificationCenterServer *v2;
  uint64_t v3;
  NSXPCListener *xpcListener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAENotificationCenterServer;
  v2 = -[HAENotificationCenterServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.coreaudio.adam.hae.notification"));
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_xpcListener, "resume");
  }
  return v2;
}

- (void)addHAENotificationEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "Received HAE notificaton event: %@", (uint8_t *)&v9, 0xCu);
  }

  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHAENFeatureEnabled");

  if ((v6 & 1) != 0)
  {
    +[HAENotificationCenterManager sharedInstance](HAENotificationCenterManager, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id)-[NSObject addHAENotificationEvent:](v7, "addHAENotificationEvent:", v3);
  }
  else
  {
    HAENotificationsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "HAE Notification disabled...", (uint8_t *)&v9, 2u);
    }
  }

}

- (BOOL)verifyInvariants
{
  return self->_xpcListener != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D7A1D8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  HAENotificationsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    v11 = 138412802;
    v12 = v8;
    v13 = 1024;
    v14 = objc_msgSend(v5, "processIdentifier");
    v15 = 2080;
    v16 = "Success";
    _os_log_impl(&dword_2144B3000, v7, OS_LOG_TYPE_DEFAULT, "New XPC Connection to %@ from pid: %d [%s]", (uint8_t *)&v11, 0x1Cu);

  }
  objc_msgSend(v5, "resume");

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
