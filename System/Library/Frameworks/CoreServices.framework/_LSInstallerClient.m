@implementation _LSInstallerClient

+ (id)makeServerInstallerConnection
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  objc_opt_self();
  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    +[_LSInstallerClient makeServerInstallerConnection].cold.3();

  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _LSGetAuditTokenForSelf();
  v3 = _LSCheckMachPortAccessForAuditToken(v2, v1);

  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      +[_LSInstallerClient makeServerInstallerConnection].cold.2();

    v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithMachServiceName:options:", v7, 4096);

    installationInterface();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      +[_LSInstallerClient makeServerInstallerConnection].cold.1();

    v10 = objc_alloc(MEMORY[0x1E0CB3B38]);
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v10, "initWithMachServiceName:options:", v11, 4096);

    +[_LSDModifyService XPCInterface](_LSDModifyService, "XPCInterface");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "setInterruptionHandler:", &__block_literal_global_51);
  objc_msgSend(v8, "setInvalidationHandler:", &__block_literal_global_3);
  return v8;
}

+ (id)syncServerInstallerProxyForShim
{
  void *v0;
  void *v1;

  objc_opt_self();
  +[_LSInstallerClient makeServerInstallerConnection]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resume");

  return v1;
}

+ (void)makeServerInstallerConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Checking if this process can access the com.apple.lsd.installation service name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end
