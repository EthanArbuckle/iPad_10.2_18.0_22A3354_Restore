@implementation CRXFServiceConnection

- (CRXFServiceConnection)initWithServiceName:(id)a3 protocol:(id)a4
{
  id v7;
  NSString *v8;
  NSString *serviceName;
  NSXPCConnection *xpcConnection;
  OS_os_log *v11;
  OS_os_log *log;

  v7 = a4;
  if (self)
  {
    v8 = (NSString *)objc_msgSend(a3, "copy");
    serviceName = self->_serviceName;
    self->_serviceName = v8;

    objc_storeStrong((id *)&self->_protocol, a4);
    self->_activateCount = 0;
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    v11 = (OS_os_log *)os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = self->_log;
    self->_log = v11;

  }
  return self;
}

- (id)activate
{
  CRXFServiceConnection *v2;
  int activateCount;
  _BOOL4 v4;
  uint64_t v5;
  NSXPCConnection *xpcConnection;
  void *v7;
  NSXPCConnection *v8;

  v2 = self;
  objc_sync_enter(v2);
  activateCount = v2->_activateCount;
  v2->_activateCount = activateCount + 1;
  v4 = os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG);
  if (activateCount)
  {
    if (v4)
      -[CRXFServiceConnection activate].cold.2();
  }
  else
  {
    if (v4)
      -[CRXFServiceConnection activate].cold.1();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", v2->_serviceName);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v2->_protocol);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection activate](v2->_xpcConnection, "activate");
  }
  v8 = v2->_xpcConnection;
  objc_sync_exit(v2);

  return v8;
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_239FC4000, v0, v1, "%s @%d: Invalidating connection to %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)forceInvalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_239FC4000, v0, v1, "%s @%d: Invalidating connection to %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (BOOL)isActivated
{
  CRXFServiceConnection *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activateCount > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_239FC4000, v0, v1, "%s @%d: Reusing connection to %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
