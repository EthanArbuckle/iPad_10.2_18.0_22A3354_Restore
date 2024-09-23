@implementation CDPDXPCListener

- (unint64_t)_clientTypeForBundleID:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.purplebuddy")))
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[CDPDXPCListener _clientTypeForBundleID:].cold.1(v4, v6, v7, v8, v9, v10, v11, v12);
      v5 = 2;
    }
  }
  else
  {
    v13 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences"));
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v14)
        -[CDPDXPCListener _clientTypeForBundleID:].cold.2(v4, v15, v16, v17, v18, v19, v20, v21);
      v5 = 1;
    }
    else
    {
      if (v14)
        -[CDPDXPCListener _clientTypeForBundleID:].cold.3();
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  CDPDClientHandler *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDXPCListener listener:shouldAcceptNewConnection:].cold.3();

  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.recovery"))|| -[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.authkit.client"))|| -[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.authkit.client.private"))|| -[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.authkit.client.internal"))
    || -[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.authkit.client.owner")))
  {
    v9 = 9;
  }
  else
  {
    v9 = 1;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.statemachine")))
  {
    v9 |= 2uLL;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.utility")))
  {
    v9 |= 4uLL;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.followup")))
  {
    v9 |= 0x10uLL;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.recoverykey")))
  {
    v9 |= 0x20uLL;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.walrus")))
  {
    v9 |= 0x40uLL;
  }
  if (-[CDPDXPCListener _connection:hasEntitlement:](self, "_connection:hasEntitlement:", v7, CFSTR("com.apple.cdp.walrus.pcskeys")))
  {
    v10 = v9 | 0x80;
  }
  else
  {
    v10 = v9;
  }
  v11 = -[CDPDXPCListener _clientTypeForConnection:](self, "_clientTypeForConnection:", v7);
  v12 = -[CDPDXPCListener _shouldAcceptNewConnectionWithEntitlements:](self, "_shouldAcceptNewConnectionWithEntitlements:", v10);
  if (v12)
  {
    v13 = -[CDPDClientHandler initWithConnection:entitlements:clientType:]([CDPDClientHandler alloc], "initWithConnection:entitlements:clientType:", v7, v10, v11);
    CDPDaemonExportedInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v14);

    objc_msgSend(v7, "setExportedObject:", v13);
    objc_initWeak(&location, v7);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke;
    v20 = &unk_24C81BF78;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v7, "setInvalidationHandler:", &v17);
    objc_msgSend(v7, "resume", v17, v18, v19, v20);
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPDXPCListener listener:shouldAcceptNewConnection:].cold.1();

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    _CDPLogSystem();
    v13 = (CDPDClientHandler *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG))
      -[CDPDXPCListener listener:shouldAcceptNewConnection:].cold.2();
  }

  return v12;
}

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.cdp.recoverykey")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.cdp.utility")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.cdp.walrus")))
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_shouldAcceptNewConnectionWithEntitlements:(unint64_t)a3
{
  return a3 != 1;
}

- (unint64_t)_clientTypeForConnection:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BYTE buffer[4096];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = proc_pidpath(objc_msgSend(a3, "processIdentifier"), buffer, 0x1000u);
  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v4, 4);
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CDPDXPCListener _clientTypeForBundleID:](self, "_clientTypeForBundleID:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __33__CDPDXPCListener_sharedInstance__block_invoke()
{
  CDPDXPCListener *v0;
  void *v1;

  v0 = objc_alloc_init(CDPDXPCListener);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (CDPDXPCListener)init
{
  CDPDXPCListener *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDXPCListener;
  v2 = -[CDPDXPCListener init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.cdp.daemon"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

  }
  return v2;
}

- (void)start
{
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

void __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke_cold_1(a1, v2);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CDPDConnectionInvalidatedNotification"), WeakRetained);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_20DB2C000, v1, OS_LOG_TYPE_DEBUG, "\"Accepting new connection %@ with entitlements mask %i\", v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Denying new connection %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Received new connection %@, checking entitlements...\", v2);
  OUTLINED_FUNCTION_4();
}

void __54__CDPDXPCListener_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v4, "\"CDP client connection invalidated: %@\", v5);

}

- (void)_clientTypeForBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Client is Buddy\", a5, a6, a7, a8, 0);
}

- (void)_clientTypeForBundleID:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Client is Preferences\", a5, a6, a7, a8, 0);
}

- (void)_clientTypeForBundleID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Unknown client type with bundleID '%@'\", v2);
  OUTLINED_FUNCTION_4();
}

@end
