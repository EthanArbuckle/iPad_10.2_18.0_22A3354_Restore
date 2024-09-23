@implementation AUHelperInstance

- (AUHelperInstance)init
{
  AUHelperInstance *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUHelperInstance;
  v2 = -[AUHelperInstance init](&v6, sel_init);
  if (v2)
  {
    +[AUHelperInstance xpcConnectionToHelper](AUHelperInstance, "xpcConnectionToHelper");
    v3 = objc_claimAutoreleasedReturnValue();
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

  }
  return v2;
}

+ (AUHelperInstance)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__AUHelperInstance_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (AUHelperInstance *)(id)sharedInstance_DefaultInstance;
}

void __34__AUHelperInstance_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_allocWithZone(*(Class *)(a1 + 32)), "init");
  v2 = (void *)sharedInstance_DefaultInstance;
  sharedInstance_DefaultInstance = v1;

}

- (AUHelperServiceProtocol)remoteObject
{
  void *xpcConnection;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    objc_msgSend(xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
    xpcConnection = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (AUHelperServiceProtocol *)xpcConnection;
}

void __32__AUHelperInstance_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __32__AUHelperInstance_remoteObject__block_invoke_cold_1(a2);
}

+ (id)xpcConnectionToHelper
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessoryupdater.launchauhelper"), 4096);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25521C3F8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_userPreferenceSetObject_forSuite_withKey_, 0, 0);

    objc_msgSend(v2, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_userPreferenceObjectForSuite_withKey_withReply_, 0, 1);

    objc_msgSend(v2, "resume");
    v14 = v2;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[AUHelperInstance xpcConnectionToHelper].cold.1();
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __32__AUHelperInstance_remoteObject__block_invoke_cold_1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[AUHelperInstance remoteObject]_block_invoke";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
}

+ (void)xpcConnectionToHelper
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "+[AUHelperInstance xpcConnectionToHelper]";
  _os_log_error_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Failed to get xpc connection", (uint8_t *)&v0, 0xCu);
}

@end
