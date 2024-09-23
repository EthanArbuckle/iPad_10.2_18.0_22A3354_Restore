@implementation _EXRunningUIViewServiceExtension

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  int result;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[5];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id buf[2];
  objc_super v30;

  v4 = *(_QWORD *)&a4;
  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.5();

  _EXSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (-[_EXRunningExtension signpost](self, "signpost") && os_signpost_enabled(v8))
  {
    v9 = v8;
    v10 = -[_EXRunningExtension signpost](self, "signpost");
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v11 = v10;
      if (os_signpost_enabled(v9))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v9, OS_SIGNPOST_EVENT, v11, "extensionkit-lifecycle", "PRE: +[_UIViewServiceSessionManager startViewServiceSessionWithDelegate:]", (uint8_t *)buf, 2u);
      }
    }

  }
  objc_msgSend(MEMORY[0x24BEBDD88], "startViewServiceSessionWithDelegate:", self);
  _EXSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[_EXRunningExtension signpost](self, "signpost") && os_signpost_enabled(v12))
  {
    v13 = v12;
    v14 = -[_EXRunningExtension signpost](self, "signpost");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_20AE73000, v13, OS_SIGNPOST_EVENT, v15, "extensionkit-lifecycle", "POST: +[_UIViewServiceSessionManager startViewServiceSessionWithDelegate:]", (uint8_t *)buf, 2u);
      }
    }

  }
  v30.receiver = self;
  v30.super_class = (Class)_EXRunningUIViewServiceExtension;
  result = -[_EXRunningExtension _startWithArguments:count:](&v30, sel__startWithArguments_count_, a3, v4);
  if (!result)
  {
    -[_EXRunningExtension willFinishLaunching](self, "willFinishLaunching");
    _EXDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.4();

    objc_initWeak(buf, self);
    v18 = (void *)MEMORY[0x24BE0FA20];
    v19 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke;
    v27[3] = &unk_24C3E3A38;
    objc_copyWeak(&v28, buf);
    objc_msgSend(v18, "listenerWithConfigurator:", v27);
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "activate");
    _EXDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.3();

    -[_EXRunningUIExtension checkIn](self, "checkIn");
    _EXDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.2();

    v22 = (void *)MEMORY[0x24BE0FA20];
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_41;
    v25[3] = &unk_24C3E3A38;
    objc_copyWeak(&v26, buf);
    objc_msgSend(v22, "listenerWithConfigurator:", v25);
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "activate");
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __61___EXRunningUIViewServiceExtension_startWithArguments_count___block_invoke_2;
    block[3] = &unk_24C3E3738;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    _EXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension startWithArguments:count:].cold.1();

    result = objc_msgSend(MEMORY[0x24BE0FA48], "activateXPCService");
    __break(1u);
  }
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  _EXUISceneSession *v19;
  uint64_t v20;
  _EXUISceneSession *v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "extractNSXPCConnectionWithConfigurator:", &__block_literal_global_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("MainService"));

  if (v13)
  {
    _EXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:].cold.1();

    if (-[_EXRunningExtension shouldAcceptXPCConnection:](self, "shouldAcceptXPCConnection:", v11))
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v9, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("InternalService"));

  _EXDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:].cold.2();

    v19 = [_EXUISceneSession alloc];
    -[_EXRunningExtension extension](self, "extension");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = -[_EXUISceneSession initWithExtension:](v19, "initWithExtension:", v20);

    LOBYTE(v20) = -[_EXSceneSession shouldAcceptXPCConnection:](v21, "shouldAcceptXPCConnection:", v11);
    if ((v20 & 1) != 0)
      goto LABEL_6;
LABEL_5:
    objc_msgSend(v9, "invalidate");
LABEL_6:

    return;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:].cold.3();

  v22 = abort_with_reason();
  __78___EXRunningUIViewServiceExtension_listener_didReceiveConnection_withContext___block_invoke(v22);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *internalListener;
  NSObject *v9;
  NSObject *v10;
  _EXUISceneSession *v11;
  void *v12;
  _EXUISceneSession *v13;
  BOOL v14;
  NSObject *v15;
  _EXRunningUIViewServiceExtension *v17;
  SEL v18;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  if (self->_serviceListener == v6)
  {
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:].cold.1();

    v14 = -[_EXRunningExtension shouldAcceptXPCConnection:](self, "shouldAcceptXPCConnection:", v7);
    goto LABEL_9;
  }
  internalListener = self->_internalListener;
  _EXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (internalListener == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUIViewServiceExtension listener:didReceiveConnection:withContext:].cold.2();

    v11 = [_EXUISceneSession alloc];
    -[_EXRunningExtension extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_EXUISceneSession initWithExtension:](v11, "initWithExtension:", v12);

    v14 = -[_EXSceneSession shouldAcceptXPCConnection:](v13, "shouldAcceptXPCConnection:", v7);
LABEL_9:

    return v14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[_EXRunningUIViewServiceExtension listener:shouldAcceptNewConnection:].cold.3();

  v17 = (_EXRunningUIViewServiceExtension *)abort_with_reason();
  return -[_EXRunningUIViewServiceExtension xpcConnection](v17, v18);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80, 1);
}

- (void)setServiceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSXPCListener)internalListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInternalListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)startWithArguments:count:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Resuming service listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:count:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Configuring service listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:count:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Checking in with launchd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:count:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Configuring internal mach service listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:count:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Bootstrapping _UIViewServiceSessionManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Received connection request on service listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)listener:didReceiveConnection:withContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Received scene session connection request on internal mach service listener", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)listener:didReceiveConnection:withContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1(&dword_20AE73000, v0, v1, "%s - %s:%d: Received connection request on unknown listener %@", (uint8_t *)v2);
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1(&dword_20AE73000, v0, v1, "%s - %s:%d: Received connection request on unknown listener %@", (uint8_t *)v2);
}

@end
