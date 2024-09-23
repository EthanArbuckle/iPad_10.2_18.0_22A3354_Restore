@implementation CMIOExtensionProviderServer

+ (CMIOExtensionProviderServer)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_3);
  return (CMIOExtensionProviderServer *)sharedServer_gServer;
}

CMIOExtensionProviderServer *__43__CMIOExtensionProviderServer_sharedServer__block_invoke()
{
  CMIOExtensionProviderServer *result;

  result = objc_alloc_init(CMIOExtensionProviderServer);
  sharedServer_gServer = (uint64_t)result;
  return result;
}

- (CMIOExtensionProviderServer)init
{
  CMIOExtensionProviderServer *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *global_queue;
  NSObject *v7;
  _xpc_connection_s *v8;
  _xpc_connection_s *listener;
  NSObject *v10;
  _QWORD handler[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMIOExtensionProviderServer;
  v2 = -[CMIOExtensionProviderServer init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "objectForInfoDictionaryKey:", CFSTR("CMIOExtension"));
    if (v3 && (v4 = (void *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v4, "count"))
    {
      v2->_serviceName = (NSString *)(id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CMIOExtensionMachServiceName"));
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(21, 0);
      v7 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProviderServer", v5, global_queue);
      v2->_queue = (OS_dispatch_queue *)v7;
      v8 = xpc_connection_create(0, v7);
      v2->_listener = v8;
      v2->_endpoint = xpc_endpoint_create(v8);
      listener = v2->_listener;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __35__CMIOExtensionProviderServer_init__block_invoke;
      handler[3] = &unk_2504581D8;
      handler[4] = v2;
      xpc_connection_set_event_handler(listener, handler);
      v2->_internalDaemon = 1;
    }
    else
    {
      v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderServer init].cold.1();

      return 0;
    }
  }
  return v2;
}

uint64_t __35__CMIOExtensionProviderServer_init__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = MEMORY[0x23492FDC4](a2);
    if (result == MEMORY[0x24BDACF88])
      return objc_msgSend(*(id *)(v3 + 32), "addConnection:", a2);
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      v14 = 1024;
      v15 = 116;
      v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc starting", buf, 0x1Cu);
    }
  }

  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      *(_DWORD *)buf = 136315650;
      v13 = v7;
      v14 = 1024;
      v15 = 123;
      v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s calling [super dealloc]", buf, 0x1Cu);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CMIOExtensionProviderServer;
  -[CMIOExtensionProviderServer dealloc](&v11, sel_dealloc);
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      *(_DWORD *)buf = 136315650;
      v13 = v10;
      v14 = 1024;
      v15 = 126;
      v16 = 2080;
      v17 = "-[CMIOExtensionProviderServer dealloc]";
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc done", buf, 0x1Cu);
    }
  }
}

- (void)start
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Failed to get the current process Mach-O UUID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__CMIOExtensionProviderServer_start__block_invoke(uint64_t a1, xpc_object_t original)
{
  xpc_object_t reply;

  reply = xpc_dictionary_create_reply(original);
  xpc_dictionary_set_uuid(reply, "mach-o-uuid", start_unique_info);
  xpc_dictionary_set_value(reply, "endpoint", *(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  cmio_XPCMessageSetCFString(reply, "bundle-id", *(CFTypeRef *)(a1 + 40));
  cmio_XPCMessageSetCFDictionary(reply, "bundle-info", *(CFTypeRef *)(a1 + 48));
  xpc_dictionary_send_reply();
  xpc_release(reply);
}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CMIOExtensionProviderServer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      v10 = 1024;
      v11 = 157;
      v12 = 2080;
      v13 = "-[CMIOExtensionProviderServer stop]";
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@: cancelling listener", (uint8_t *)&v8, 0x26u);
    }
  }
  xpc_connection_cancel(self->_listener);
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
      v8 = 136315906;
      v9 = v7;
      v10 = 1024;
      v11 = 159;
      v12 = 2080;
      v13 = "-[CMIOExtensionProviderServer stop]";
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@: finished stopping things", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)addConnection:(id)a3
{
  CMIOExtensionProviderContext *v3;
  CMIOExtensionProviderContext *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[CMIOExtensionProviderContext initWithConnection:]([CMIOExtensionProviderContext alloc], "initWithConnection:", a3);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x23492F950]();
    v6 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
        v12 = 1024;
        v13 = 171;
        v14 = 2080;
        v15 = "-[CMIOExtensionProviderServer addConnection:]";
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CMIOExtensionProvider.sharedProvider = %@", (uint8_t *)&v10, 0x26u);
      }
    }
    objc_msgSend(v6, "beginProviderContextRegistration:", v4);
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderServer addConnection:].cold.1();
  }
}

- (BOOL)internalDaemon
{
  return self->_internalDaemon;
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s ServiceName is missing from Info.plist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addConnection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderServer.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Failed to instantiate CMIOExtensionProviderContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
