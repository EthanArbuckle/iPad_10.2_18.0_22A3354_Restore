@implementation CMIOExtensionSession

+ (id)sessionWithDelegate:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:", a3);
}

- (CMIOExtensionSession)initWithDelegate:(id)a3
{
  CMIOExtensionSession *v4;
  CMIOExtensionSession *v5;
  xpc_connection_t mach_service;
  _xpc_connection_s *registerExtensionServiceConnection;
  xpc_object_t v8;
  xpc_object_t v9;
  NSObject *v10;
  const char *v11;
  xpc_object_t array;
  void *v14;
  NSObject *v15;
  const char *v16;
  size_t count;
  size_t v18;
  xpc_object_t dictionary;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const uint8_t *uuid;
  const char *value;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  void *v33;
  CMIOExtensionInfo *v34;
  CMIOExtensionInfo *v35;
  const char *v36;
  id v37;
  id v38;
  _QWORD handler[4];
  id v40;
  id location;
  objc_super v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)CMIOExtensionSession;
  v4 = -[CMIOExtensionSession init](&v42, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_extensions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_storeWeak((id *)&v5->_delegate, a3);
    mach_service = xpc_connection_create_mach_service("com.apple.cmio.registerassistantservice.system-extensions", 0, 2uLL);
    v5->_registerExtensionServiceConnection = mach_service;
    if (mach_service)
    {
      objc_initWeak(&location, v5);
      registerExtensionServiceConnection = v5->_registerExtensionServiceConnection;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __41__CMIOExtensionSession_initWithDelegate___block_invoke;
      handler[3] = &unk_250458000;
      objc_copyWeak(&v40, &location);
      xpc_connection_set_event_handler(registerExtensionServiceConnection, handler);
      xpc_connection_resume(v5->_registerExtensionServiceConnection);
      v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v8, "call", "list");
      v9 = xpc_connection_send_message_with_reply_sync(v5->_registerExtensionServiceConnection, v8);
      xpc_release(v8);
      if (!v9 || MEMORY[0x23492FDC4](v9) != MEMORY[0x24BDACFA0])
      {
        v10 = CMIOLog();
        if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          -[CMIOExtensionSession initWithDelegate:].cold.1((uint64_t)v11, (uint64_t)v9, (uint64_t)buf);
        }
LABEL_8:
        if (!v9)
          goto LABEL_10;
        goto LABEL_9;
      }
      array = xpc_dictionary_get_array(v9, "endpoints");
      v14 = array;
      if (!array || MEMORY[0x23492FDC4](array) != MEMORY[0x24BDACF78])
      {
        v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          -[CMIOExtensionSession initWithDelegate:].cold.2((uint64_t)v16, (uint64_t)v14, (uint64_t)buf);
        }
        goto LABEL_9;
      }
      count = xpc_array_get_count(v14);
      if (!count)
      {
LABEL_9:
        xpc_release(v9);
LABEL_10:
        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);
        return v5;
      }
      v18 = 0;
      while (1)
      {
        dictionary = xpc_array_get_dictionary(v14, v18);
        v20 = dictionary;
        if (!dictionary || MEMORY[0x23492FDC4](dictionary) != MEMORY[0x24BDACFA0])
          break;
        uuid = xpc_dictionary_get_uuid(v20, "mach-o-uuid");
        value = (const char *)xpc_dictionary_get_value(v20, "endpoint");
        v38 = 0;
        cmio_XPCMessageCopyCFString(v20, "bundle-id", (NSObject **)&v38);
        v25 = v38;
        v37 = 0;
        cmio_XPCMessageCopyCFDictionary(v20, "bundle-info", (NSObject **)&v37);
        v26 = v37;
        if (!uuid || !value || MEMORY[0x23492FDC4](value) != MEMORY[0x24BDACFB0])
        {
          v27 = CMIOLog();
          v28 = v27;
          if (!v27 || !os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          *(_DWORD *)buf = 136315906;
          v44 = v29;
          v45 = 1024;
          v46 = 1897;
          v47 = 2080;
          v48 = "-[CMIOExtensionSession initWithDelegate:]";
          v49 = 2112;
          v50 = value;
          v30 = v28;
          v31 = "%s:%d:%s unexpected reply %@";
          v32 = 38;
LABEL_33:
          _os_log_error_impl(&dword_2330C2000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
          goto LABEL_23;
        }
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
        v34 = [CMIOExtensionInfo alloc];
        v35 = -[CMIOExtensionInfo initWithEndpoint:bundleID:bundleInfo:](v34, "initWithEndpoint:bundleID:bundleInfo:", value, v38, v37);
        os_unfair_lock_lock(&v5->_lock);
        -[NSMutableDictionary setObject:forKey:](v5->_extensions, "setObject:forKey:", v35, v33);
        os_unfair_lock_unlock(&v5->_lock);

LABEL_23:
        if (count == ++v18)
          goto LABEL_8;
      }
      v21 = CMIOLog();
      v22 = v21;
      if (!v21 || !os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
      *(_DWORD *)buf = 136316162;
      v44 = v36;
      v45 = 1024;
      v46 = 1901;
      v47 = 2080;
      v48 = "-[CMIOExtensionSession initWithDelegate:]";
      v49 = 2082;
      v50 = "com.apple.cmio.registerassistantservice.system-extensions";
      v51 = 2114;
      v52 = v20;
      v30 = v22;
      v31 = "%s:%d:%s unexpected reply from service %{public}s %{public}@";
      v32 = 48;
      goto LABEL_33;
    }
  }
  return v5;
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *string;
  const uint8_t *uuid;
  xpc_object_t value;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  CMIOExtensionInfo *v16;
  CMIOExtensionInfo *v17;
  void *v18;
  id v19;
  _BYTE v20[12];
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (a2 == (void *)MEMORY[0x24BDACF30])
    {
      v13 = CMIOLogLevel(1);
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v20 = 136315906;
          *(_QWORD *)&v20[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
          v21 = 1024;
          v22 = 1811;
          v23 = 2080;
          v24 = "-[CMIOExtensionSession initWithDelegate:]_block_invoke";
          v25 = 2080;
          v26 = "com.apple.cmio.registerassistantservice.system-extensions";
          _os_log_impl(&dword_2330C2000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s interrupted connection to service %s", v20, 0x26u);
        }
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDACF38];
      v6 = CMIOLog();
      if (a2 == v5)
      {
        if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_1();
      }
      else if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_2();
      }
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    string = xpc_dictionary_get_string(a2, "call");
    if (string)
    {
      if (!strncmp("extension", string, 9uLL))
      {
        uuid = xpc_dictionary_get_uuid(a2, "mach-o-uuid");
        value = xpc_dictionary_get_value(a2, "endpoint");
        *(_QWORD *)v20 = 0;
        cmio_XPCMessageCopyCFString(a2, "bundle-id", (NSObject **)v20);
        v10 = *(id *)v20;
        v19 = 0;
        cmio_XPCMessageCopyCFDictionary(a2, "bundle-info", (NSObject **)&v19);
        v11 = v19;
        if (uuid && value && MEMORY[0x23492FDC4](value) == MEMORY[0x24BDACFB0])
        {
          if (WeakRetained && objc_loadWeak((id *)WeakRetained + 2))
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
            v16 = [CMIOExtensionInfo alloc];
            v17 = -[CMIOExtensionInfo initWithEndpoint:bundleID:bundleInfo:](v16, "initWithEndpoint:bundleID:bundleInfo:", value, *(_QWORD *)v20, v19);
            os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
            objc_msgSend(*((id *)WeakRetained + 3), "setObject:forKey:", v17, v15);
            v18 = (void *)objc_msgSend(*((id *)WeakRetained + 3), "copy");
            os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

            objc_msgSend(objc_loadWeak((id *)WeakRetained + 2), "session:availableExtensionsChanged:", WeakRetained, v18);
          }
        }
        else
        {
          v12 = CMIOLog();
          if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_3();
        }
      }
    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v8 = 1024;
        v9 = 1922;
        v10 = 2080;
        v11 = "-[CMIOExtensionSession dealloc]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  xpc_release(self->_registerExtensionServiceConnection);
  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSession;
  -[CMIOExtensionSession dealloc](&v5, sel_dealloc);
}

- (NSDictionary)extensions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_extensions, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (CMIOExtensionSessionDelegate)delegate
{
  return (CMIOExtensionSessionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  NSObject *v8;

  v3 = OUTLINED_FUNCTION_5(a1, 4.8154e-34, a2, a3);
  *(_DWORD *)(v4 + 14) = 1910;
  *(_WORD *)(v4 + 18) = 2080;
  *(_QWORD *)(v4 + 20) = "-[CMIOExtensionSession initWithDelegate:]";
  *(_WORD *)(v4 + 28) = 2082;
  OUTLINED_FUNCTION_8_0(v3, v5, v4);
  OUTLINED_FUNCTION_7_1(&dword_2330C2000, v8, v6, "%s:%d:%s unexpected reply from service %{public}s %{public}@", v7);
}

- (void)initWithDelegate:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  NSObject *v8;

  v3 = OUTLINED_FUNCTION_5(a1, 4.8154e-34, a2, a3);
  *(_DWORD *)(v4 + 14) = 1906;
  *(_WORD *)(v4 + 18) = 2080;
  *(_QWORD *)(v4 + 20) = "-[CMIOExtensionSession initWithDelegate:]";
  *(_WORD *)(v4 + 28) = 2082;
  OUTLINED_FUNCTION_8_0(v3, v5, v4);
  OUTLINED_FUNCTION_7_1(&dword_2330C2000, v8, v6, "%s:%d:%s unexpected reply from service %{public}s %{public}@", v7);
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s connection invalid error for service %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_2()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_16();
  v13 = *MEMORY[0x24BDAC8D0];
  v2 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x24BDACF40]);
  v5 = 136316162;
  v6 = v2;
  v7 = 1024;
  OUTLINED_FUNCTION_3_0();
  v8 = "-[CMIOExtensionSession initWithDelegate:]_block_invoke";
  v9 = 2082;
  v10 = "com.apple.cmio.registerassistantservice.system-extensions";
  v11 = 2082;
  v12 = v3;
  OUTLINED_FUNCTION_7_1(&dword_2330C2000, v0, v4, "%s:%d:%s unexpected error for service %{public}s: %{public}s", (uint8_t *)&v5);
}

void __41__CMIOExtensionSession_initWithDelegate___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s unexpected message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
