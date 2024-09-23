@implementation CMIOExtensionProviderContext

- (CMIOExtensionProviderContext)initWithConnection:(id)a3
{
  CMIOExtensionProviderContext *v4;
  uint64_t pid;
  uint64_t v6;
  id v7;
  uint64_t v8;
  CMIOExtensionClient *v9;
  CMIOExtensionClient *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  _QWORD handler[5];
  id v16;
  id location;
  objc_super v18;
  uint8_t buf[40];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)CMIOExtensionProviderContext;
    v4 = -[CMIOExtensionProviderContext init](&v18, sel_init);
    if (v4)
    {
      v4->_connection = (OS_xpc_object *)a3;
      v4->_transaction = (OS_os_transaction *)os_transaction_create();
      v4->_clientSourcedByNonStreamingProxyFrontedExtension = 0;
      objc_initWeak(&location, v4);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __51__CMIOExtensionProviderContext_initWithConnection___block_invoke;
      handler[3] = &unk_250458048;
      objc_copyWeak(&v16, &location);
      handler[4] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_activate((xpc_connection_t)a3);
      xpc_connection_get_audit_token();
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      v6 = objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      if (-[CMIOExtensionProviderServer internalDaemon](+[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer"), "internalDaemon"))
      {
        memset(buf, 0, 32);
        v7 = +[CMIOExtensionProvider newActivityAttributionWithToken:](CMIOExtensionProvider, "newActivityAttributionWithToken:", buf);
        v8 = 0;
      }
      else
      {
        v7 = 0;
        v8 = 3;
      }
      v9 = [CMIOExtensionClient alloc];
      memset(buf, 0, 32);
      v10 = -[CMIOExtensionClient initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:](v9, "initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:", pid, v6, buf, v7, 0, 0);
      v4->_clientInfo = v10;
      -[CMIOExtensionClient setMicrophoneAuthorizationStatus:](v10, "setMicrophoneAuthorizationStatus:", v8);
      -[CMIOExtensionClient setCameraAuthorizationStatus:](v4->_clientInfo, "setCameraAuthorizationStatus:", v8);
      v4->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProviderContext: %@>"), v4->_clientInfo);
      v4->_redactedDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProviderContext: ->"));
      v11 = CMIOLog();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        *(_DWORD *)buf = 136315907;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 125;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[CMIOExtensionProviderContext initWithConnection:]";
        *(_WORD *)&buf[28] = 2113;
        *(_QWORD *)&buf[30] = v4;
        _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return v4;
}

void __51__CMIOExtensionProviderContext_initWithConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;
  uint64_t v5;
  NSObject *v6;
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
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x23492FDC4](a2);
  if (v5 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __51__CMIOExtensionProviderContext_initWithConnection___block_invoke_cold_1(a1, a2, v7);
    }
    if (a2 == MEMORY[0x24BDACF30])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x24BDACF38] && WeakRetained && !WeakRetained[40])
    {
      v8 = CMIOLog();
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315907;
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          v12 = 1024;
          v13 = 72;
          v14 = 2080;
          v15 = "-[CMIOExtensionProviderContext initWithConnection:]_block_invoke";
          v16 = 2113;
          v17 = WeakRetained;
          _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v10, 0x26u);
        }
      }
      objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeProviderContext:", WeakRetained);
      objc_msgSend(WeakRetained, "invalidate");
    }
  }
  else if (v5 == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(WeakRetained, "handleClientMessageWithConnection:message:", *(_QWORD *)(a1 + 32), a2);
  }

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  OS_voucher *voucher;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  CMIOExtensionProviderContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v9 = 1024;
      v10 = 132;
      v11 = 2080;
      v12 = "-[CMIOExtensionProviderContext dealloc]";
      v13 = 2113;
      v14 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeSystemStatusAttributionsForClient:stream:", self->_clientInfo, 0);

  voucher = self->_voucher;
  if (voucher)

  v6.receiver = self;
  v6.super_class = (Class)CMIOExtensionProviderContext;
  -[CMIOExtensionProviderContext dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return self->_description;
}

- (id)redactedDescription
{
  return self->_redactedDescription;
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  OS_xpc_object *connection;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionProviderContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315907;
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v8 = 1024;
      v9 = 159;
      v10 = 2080;
      v11 = "-[CMIOExtensionProviderContext invalidate]";
      v12 = 2113;
      v13 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", (uint8_t *)&v6, 0x26u);
    }
  }
  connection = self->_connection;
  if (connection)
    xpc_connection_cancel(connection);

  self->_transaction = 0;
  self->_invalidated = 1;
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t uint64;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  pid_t pid;
  NSUUID *v12;
  NSObject *v13;
  xpc_object_t reply;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  pid_t v22;
  __int16 v23;
  NSUUID *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v15 = 136316419;
      v16 = v10;
      v17 = 1024;
      v18 = 174;
      v19 = 2080;
      v20 = "-[CMIOExtensionProviderContext handleClientMessageWithConnection:message:]";
      v21 = 1025;
      v22 = pid;
      v23 = 2113;
      v24 = v12;
      v25 = 2048;
      v26 = uint64;
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_INFO, "%s:%d:%s [%{private}d] CID %{private}@ %lld", (uint8_t *)&v15, 0x36u);
    }
  }
  switch(uint64)
  {
    case 1uLL:
      -[CMIOExtensionProviderContext pluginStates:message:](self, "pluginStates:message:", a3, a4);
      break;
    case 2uLL:
      -[CMIOExtensionProviderContext availablePluginProperties:message:](self, "availablePluginProperties:message:", a3, a4);
      break;
    case 3uLL:
      -[CMIOExtensionProviderContext pluginPropertyStatesForProperties:message:](self, "pluginPropertyStatesForProperties:message:", a3, a4);
      break;
    case 4uLL:
      -[CMIOExtensionProviderContext setPluginPropertyValues:message:](self, "setPluginPropertyValues:message:", a3, a4);
      break;
    case 5uLL:
      -[CMIOExtensionProviderContext setClientInfo:message:](self, "setClientInfo:message:", a3, a4);
      break;
    case 0xAuLL:
      -[CMIOExtensionProviderContext deviceStates:message:](self, "deviceStates:message:", a3, a4);
      break;
    case 0xBuLL:
      -[CMIOExtensionProviderContext availableDeviceProperties:message:](self, "availableDeviceProperties:message:", a3, a4);
      break;
    case 0xCuLL:
      -[CMIOExtensionProviderContext devicePropertyStates:message:](self, "devicePropertyStates:message:", a3, a4);
      break;
    case 0xDuLL:
      -[CMIOExtensionProviderContext setDevicePropertyValues:message:](self, "setDevicePropertyValues:message:", a3, a4);
      break;
    case 0x14uLL:
      -[CMIOExtensionProviderContext availableStreamProperties:message:](self, "availableStreamProperties:message:", a3, a4);
      break;
    case 0x15uLL:
      -[CMIOExtensionProviderContext streamPropertyStates:message:](self, "streamPropertyStates:message:", a3, a4);
      break;
    case 0x16uLL:
      -[CMIOExtensionProviderContext setStreamPropertyValues:message:](self, "setStreamPropertyValues:message:", a3, a4);
      break;
    case 0x17uLL:
      if (!self->_transaction)
        self->_transaction = (OS_os_transaction *)os_transaction_create();
      -[CMIOExtensionProviderContext startStream:message:](self, "startStream:message:", a3, a4);
      break;
    case 0x18uLL:
      -[CMIOExtensionProviderContext stopStream:message:](self, "stopStream:message:", a3, a4);

      self->_transaction = 0;
      break;
    case 0x19uLL:

      self->_transaction = 0;
      reply = xpc_dictionary_create_reply(a4);
      xpc_dictionary_set_int64(reply, "errorReturn", 0);
      xpc_connection_send_message((xpc_connection_t)a3, reply);
      xpc_release(reply);
      break;
    case 0x1AuLL:
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:](self, "captureAsyncStillImage:message:", a3, a4);
      break;
    case 0x1BuLL:
      -[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:](self, "updateNonStreamingProxyFrontedExtensionPIDs:message:", a3, a4);
      break;
    case 0x1CuLL:
      -[CMIOExtensionProviderContext enqueueReactionEffect:message:](self, "enqueueReactionEffect:message:", a3, a4);
      break;
    default:
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext handleClientMessageWithConnection:message:].cold.1();
      break;
  }
}

- (void)availablePluginProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v7;
  id v8;
  NSUUID *v9;
  NSObject *v10;
  _QWORD v11[6];

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v7 = reply;
    xpc_retain(reply);
    v8 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
    v9 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke;
    v11[3] = &unk_250458330;
    v11[4] = v7;
    v11[5] = a3;
    objc_msgSend(v8, "availablePluginPropertiesForClientID:reply:", v9, v11);
    xpc_release(v7);
  }
  else
  {
    v10 = CMIOLog();
    if (v10)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext availablePluginProperties:message:].cold.1();
    }
  }
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = (const void *)objc_msgSend(a2, "allObjects");
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      v10 = *(void **)(a1 + 32);
      v9 = 0;
      goto LABEL_14;
    }
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_2();
    a3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!a3)
    goto LABEL_13;
  v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_1();
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(a3, "code");
  v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginStates:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v7;
  id v8;
  NSUUID *v9;
  NSObject *v10;
  _QWORD v11[6];

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v7 = reply;
    xpc_retain(reply);
    v8 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
    v9 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke;
    v11[3] = &unk_250458358;
    v11[4] = v7;
    v11[5] = a3;
    objc_msgSend(v8, "pluginStatesForClientID:reply:", v9, v11);
    xpc_release(v7);
  }
  else
  {
    v10 = CMIOLog();
    if (v10)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext pluginStates:message:].cold.1();
    }
  }
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v5;
  id v9;
  void *v10;
  NSObject *v11;
  xpc_object_t v12;
  uint64_t v13;
  void *i;
  id v15;
  void *v16;
  NSObject *v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  int64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  if (!a2 || a5)
    goto LABEL_9;
  v9 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a2);
  if (!v9)
  {
    v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_4();
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
LABEL_9:
    if (v5)
      goto LABEL_40;
    goto LABEL_10;
  }
  v10 = v9;
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v9);
  xpc_release(v10);
LABEL_10:
  if (!objc_msgSend(a3, "count"))
    goto LABEL_48;
  v12 = xpc_array_create(0, 0);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = (void *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v13 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(a3);
        v15 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i));
        if (!v15)
        {
          v17 = CMIOLog();
          if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_3();
          v5 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
          goto LABEL_24;
        }
        v16 = v15;
        xpc_array_append_value(v12, v15);
        xpc_release(v16);
      }
      v5 = (void *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_24:
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param2", v12);
  xpc_release(v12);
  if (!v5)
  {
LABEL_48:
    if (!objc_msgSend(a4, "count"))
      goto LABEL_44;
    v18 = xpc_array_create(0, 0);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(a4);
          v23 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
          if (!v23)
          {
            v25 = CMIOLog();
            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_2();
            v5 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
            goto LABEL_39;
          }
          v24 = v23;
          xpc_array_append_value(v18, v23);
          xpc_release(v24);
        }
        v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v20)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_39:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param3", v18);
    xpc_release(v18);
    if (!v5)
    {
LABEL_44:
      v29 = *(void **)(a1 + 32);
      v28 = 0;
      goto LABEL_45;
    }
  }
LABEL_40:
  v26 = CMIOLog();
  if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_1();
  v27 = *(void **)(a1 + 32);
  v28 = objc_msgSend(v5, "code");
  v29 = v27;
LABEL_45:
  xpc_dictionary_set_int64(v29, "errorReturn", v28);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginPropertyStatesForProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSUUID *v12;
  _QWORD v13[6];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFArray(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
      CFRelease(cf);
    }
    else
    {
      v9 = 0;
    }
    xpc_retain(v8);
    v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
    v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke;
    v13[3] = &unk_250458380;
    v13[4] = v8;
    v13[5] = a3;
    objc_msgSend(v11, "pluginPropertyStatesForClientID:properties:reply:", v12, v9, v13);
    xpc_release(v8);
  }
  else
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext pluginPropertyStatesForProperties:message:].cold.1();
  }
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;

  v3 = a3;
  if (a2 && !a3)
  {
    v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a2);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      v11 = *(void **)(a1 + 32);
      v10 = 0;
      goto LABEL_15;
    }
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_2();
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!v3)
    goto LABEL_14;
  v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_1();
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v3, "code");
  v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setPluginPropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  xpc_object_t value;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSUUID *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[6];
  _QWORD v20[5];

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    value = xpc_dictionary_get_value(a4, "param1");
    if (value)
    {
      v10 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v13 = MEMORY[0x24BDAC760];
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke;
        v20[3] = &unk_250457DB8;
        v20[4] = v12;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
        xpc_retain(v8);
        v14 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
        v15 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_29;
        v19[3] = &unk_2504583A8;
        v19[4] = v8;
        v19[5] = a3;
        objc_msgSend(v14, "setPluginPropertyValuesForClientID:propertyValues:reply:", v15, v12, v19);
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -5);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        v18 = CMIOLog();
        if (v18)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionProviderContext setPluginPropertyValues:message:].cold.3();
        }
      }
    }
    else
    {
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      v17 = CMIOLog();
      if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext setPluginPropertyValues:message:].cold.2();
    }
    xpc_release(v8);
  }
  else
  {
    v16 = CMIOLog();
    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext setPluginPropertyValues:message:].cold.1();
  }
}

uint64_t __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(a3, "value"), a2);
}

void __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_29(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_29_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)availableDeviceProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSUUID *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      xpc_retain(v8);
      v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke;
      v15[3] = &unk_250458330;
      v15[4] = v8;
      v15[5] = a3;
      objc_msgSend(v11, "availableDevicePropertiesForClientID:deviceID:reply:", v12, v10, v15);
    }
    else
    {
      v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext availableDeviceProperties:message:].cold.2();
      }
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext availableDeviceProperties:message:].cold.1();
  }
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = (const void *)objc_msgSend(a2, "allObjects");
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      v10 = *(void **)(a1 + 32);
      v9 = 0;
      goto LABEL_14;
    }
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_2();
    a3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!a3)
    goto LABEL_13;
  v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_1();
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(a3, "code");
  v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)deviceStates:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSUUID *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      xpc_retain(v8);
      v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke;
      v15[3] = &unk_2504583D0;
      v15[4] = v8;
      v15[5] = a3;
      objc_msgSend(v11, "deviceStatesForClientID:deviceID:reply:", v12, v10, v15);
    }
    else
    {
      v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext deviceStates:message:].cold.2();
      }
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext deviceStates:message:].cold.1();
  }
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v4;
  id v7;
  void *v8;
  NSObject *v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  if (!a2 || a4)
    goto LABEL_9;
  v7 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a2);
  if (!v7)
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_2();
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
LABEL_9:
    if (v4)
      goto LABEL_27;
    goto LABEL_10;
  }
  v8 = v7;
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v7);
  xpc_release(v8);
LABEL_10:
  if (!objc_msgSend(a3, "count"))
    goto LABEL_31;
  v25 = a1;
  v10 = xpc_array_create(0, 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = v11;
    v4 = 0;
    v13 = *(_QWORD *)v27;
    v14 = *MEMORY[0x24BDD1100];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(a3);
        v16 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        if (v16)
        {
          v17 = v16;
          xpc_array_append_value(v10, v16);
          xpc_release(v17);
        }
        else
        {
          v18 = CMIOLog();
          if (v18)
          {
            v19 = v18;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
              *(_DWORD *)buf = 136315650;
              v31 = v20;
              v32 = 1024;
              v33 = 533;
              v34 = 2080;
              v35 = "-[CMIOExtensionProviderContext deviceStates:message:]_block_invoke";
              _os_log_error_impl(&dword_2330C2000, v19, OS_LOG_TYPE_ERROR, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", buf, 0x1Cu);
            }
          }
          v4 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v14, -5, 0);
        }
      }
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v12);
  }
  else
  {
    v4 = 0;
  }
  a1 = v25;
  xpc_dictionary_set_value(*(xpc_object_t *)(v25 + 32), "param2", v10);
  xpc_release(v10);
  if (!v4)
  {
LABEL_31:
    v24 = *(void **)(a1 + 32);
    v23 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v21 = CMIOLog();
  if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_1();
  v22 = *(void **)(a1 + 32);
  v23 = objc_msgSend(v4, "code");
  v24 = v22;
LABEL_32:
  xpc_dictionary_set_int64(v24, "errorReturn", v23);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)devicePropertyStates:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSUUID *v15;
  _QWORD v16[6];
  CFTypeRef v17;
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      v17 = 0;
      cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&v17);
      if (v17)
      {
        v11 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
        CFRelease(v17);
      }
      else
      {
        v11 = 0;
      }
      xpc_retain(v8);
      v14 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v15 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke;
      v16[3] = &unk_250458380;
      v16[4] = v8;
      v16[5] = a3;
      objc_msgSend(v14, "devicePropertyStatesForClientID:deviceID:properties:reply:", v15, v10, v11, v16);
    }
    else
    {
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext devicePropertyStates:message:].cold.2();
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext devicePropertyStates:message:].cold.1();
  }
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;

  v3 = a3;
  if (a2 && !a3)
  {
    v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a2);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      v11 = *(void **)(a1 + 32);
      v10 = 0;
      goto LABEL_15;
    }
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_2();
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!v3)
    goto LABEL_14;
  v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_1();
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v3, "code");
  v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setDevicePropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  NSObject *v10;
  xpc_object_t value;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSUUID *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      value = xpc_dictionary_get_value(a4, "param2");
      if (value)
      {
        v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
          v15 = MEMORY[0x24BDAC760];
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke;
          v23[3] = &unk_250457DB8;
          v23[4] = v14;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
          xpc_retain(v8);
          v16 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
          v17 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
          v22[0] = v15;
          v22[1] = 3221225472;
          v22[2] = __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_32;
          v22[3] = &unk_2504583A8;
          v22[4] = v8;
          v22[5] = a3;
          objc_msgSend(v16, "setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:", v17, v10, v14, v22);
        }
        else
        {
          xpc_dictionary_set_int64(v8, "errorReturn", -1);
          xpc_connection_send_message((xpc_connection_t)a3, v8);
          v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionProviderContext setDevicePropertyValues:message:].cold.4();
          }
        }
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        v20 = CMIOLog();
        if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext setDevicePropertyValues:message:].cold.3();
      }
    }
    else
    {
      v19 = CMIOLog();
      v10 = v19;
      if (v19)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext setDevicePropertyValues:message:].cold.2();
        v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    v18 = CMIOLog();
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext setDevicePropertyValues:message:].cold.1();
  }
}

uint64_t __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(a3, "value"), a2);
}

void __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_32(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_32_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)availableStreamProperties:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSUUID *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      xpc_retain(v8);
      v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke;
      v15[3] = &unk_250458330;
      v15[4] = v8;
      v15[5] = a3;
      objc_msgSend(v11, "availableStreamPropertiesForClientID:streamID:reply:", v12, v10, v15);
    }
    else
    {
      v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext availableStreamProperties:message:].cold.2();
      }
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext availableStreamProperties:message:].cold.1();
  }
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = (const void *)objc_msgSend(a2, "allObjects");
  if (!a3 && v5)
  {
    if (!cmio_XPCMessageSetCFArray(*(void **)(a1 + 32), "param1", v5))
    {
LABEL_13:
      v10 = *(void **)(a1 + 32);
      v9 = 0;
      goto LABEL_14;
    }
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_2();
    a3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!a3)
    goto LABEL_13;
  v7 = CMIOLog();
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_1();
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(a3, "code");
  v10 = v8;
LABEL_14:
  xpc_dictionary_set_int64(v10, "errorReturn", v9);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)streamPropertyStates:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSUUID *v15;
  _QWORD v16[6];
  CFTypeRef v17;
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      v17 = 0;
      cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&v17);
      if (v17)
      {
        v11 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
        CFRelease(v17);
      }
      else
      {
        v11 = 0;
      }
      xpc_retain(v8);
      v14 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v15 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke;
      v16[3] = &unk_250458380;
      v16[4] = v8;
      v16[5] = a3;
      objc_msgSend(v14, "streamPropertyStatesForClientID:streamID:properties:reply:", v15, v10, v11, v16);
    }
    else
    {
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext streamPropertyStates:message:].cold.2();
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext streamPropertyStates:message:].cold.1();
  }
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;

  v3 = a3;
  if (a2 && !a3)
  {
    v5 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a2);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v5);
      xpc_release(v6);
LABEL_14:
      v11 = *(void **)(a1 + 32);
      v10 = 0;
      goto LABEL_15;
    }
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_2();
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
  }
  if (!v3)
    goto LABEL_14;
  v8 = CMIOLog();
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_1();
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v3, "code");
  v11 = v9;
LABEL_15:
  xpc_dictionary_set_int64(v11, "errorReturn", v10);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setStreamPropertyValues:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  NSObject *v10;
  xpc_object_t value;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSUUID *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[5];
  CFTypeRef cf;

  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      value = xpc_dictionary_get_value(a4, "param2");
      if (value)
      {
        v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
          v15 = MEMORY[0x24BDAC760];
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke;
          v23[3] = &unk_250457DB8;
          v23[4] = v14;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
          xpc_retain(v8);
          v16 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
          v17 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
          v22[0] = v15;
          v22[1] = 3221225472;
          v22[2] = __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_33;
          v22[3] = &unk_2504583A8;
          v22[4] = v8;
          v22[5] = a3;
          objc_msgSend(v16, "setStreamPropertyValuesForClientID:streamID:propertyValues:reply:", v17, v10, v14, v22);
        }
        else
        {
          xpc_dictionary_set_int64(v8, "errorReturn", -1);
          xpc_connection_send_message((xpc_connection_t)a3, v8);
          v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[CMIOExtensionProviderContext setStreamPropertyValues:message:].cold.4();
          }
        }
      }
      else
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        v20 = CMIOLog();
        if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext setStreamPropertyValues:message:].cold.3();
      }
    }
    else
    {
      v19 = CMIOLog();
      v10 = v19;
      if (v19)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext setStreamPropertyValues:message:].cold.2();
        v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    v18 = CMIOLog();
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext setStreamPropertyValues:message:].cold.1();
  }
}

uint64_t __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(a3, "value"), a2);
}

void __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_33(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_33_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)startStream:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  OS_voucher **p_voucher;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  OS_voucher *v16;
  id v17;
  NSUUID *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[6];
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  OS_voucher *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      p_voucher = &self->_voucher;
      if (self->_voucher)
      {
        v12 = CMIOLog();
        if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext startStream:message:].cold.3();

        *p_voucher = 0;
      }
      *p_voucher = (OS_voucher *)voucher_copy();
      v13 = CMIOLog();
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          v16 = *p_voucher;
          *(_DWORD *)buf = 136315906;
          v24 = v15;
          v25 = 1024;
          v26 = 859;
          v27 = 2080;
          v28 = "-[CMIOExtensionProviderContext startStream:message:]";
          v29 = 2050;
          v30 = v16;
          _os_log_impl(&dword_2330C2000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s startStream retain priority voucher %{public}p", buf, 0x26u);
        }
      }
      xpc_retain(v8);
      v17 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v18 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __52__CMIOExtensionProviderContext_startStream_message___block_invoke;
      v21[3] = &unk_2504583A8;
      v21[4] = v8;
      v21[5] = a3;
      objc_msgSend(v17, "startStreamForClientID:streamID:reply:", v18, v10, v21);
    }
    else
    {
      v20 = CMIOLog();
      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext startStream:message:].cold.2();
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v19 = CMIOLog();
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext startStream:message:].cold.1();
  }
}

void __52__CMIOExtensionProviderContext_startStream_message___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__CMIOExtensionProviderContext_startStream_message___block_invoke_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)stopStream:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSUUID *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  OS_voucher *voucher;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[6];
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  OS_voucher *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = (void *)objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      xpc_retain(v8);
      v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __51__CMIOExtensionProviderContext_stopStream_message___block_invoke;
      v19[3] = &unk_2504583A8;
      v19[4] = v8;
      v19[5] = a3;
      objc_msgSend(v11, "stopStreamForClientID:streamID:reply:", v12, v10, v19);
      if (self->_voucher)
      {
        v13 = CMIOLog();
        if (v13)
        {
          v14 = v13;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            voucher = self->_voucher;
            *(_DWORD *)buf = 136315906;
            v22 = v15;
            v23 = 1024;
            v24 = 910;
            v25 = 2080;
            v26 = "-[CMIOExtensionProviderContext stopStream:message:]";
            v27 = 2050;
            v28 = voucher;
            _os_log_impl(&dword_2330C2000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stopStream release priority voucher %{public}p", buf, 0x26u);
          }
        }

        self->_voucher = 0;
      }
    }
    else
    {
      v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext stopStream:message:].cold.2();
      v10 = 0;
    }

    xpc_release(v8);
  }
  else
  {
    v17 = CMIOLog();
    if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext stopStream:message:].cold.1();
  }
}

void __51__CMIOExtensionProviderContext_stopStream_message___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__CMIOExtensionProviderContext_stopStream_message___block_invoke_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)setClientInfo:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  xpc_object_t value;
  xpc_object_t v10;
  CMIOExtensionClient *v11;
  CMIOExtensionClient *clientInfo;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  pid_t pid;
  CMIOExtensionClient *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  pid_t v27;
  __int16 v28;
  CMIOExtensionProviderContext *v29;
  __int16 v30;
  CMIOExtensionClient *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    value = xpc_dictionary_get_value(a4, "param1");
    if (value)
    {
      v10 = value;
      if (-[CMIOExtensionClient isFromProxyExtensionManager](self->_clientInfo, "isFromProxyExtensionManager"))
      {
        v11 = -[CMIOExtensionClient initWithXPCDictionary:]([CMIOExtensionClient alloc], "initWithXPCDictionary:", v10);
        if (v11)
        {
          clientInfo = self->_clientInfo;
          self->_clientInfo = v11;

          goto LABEL_6;
        }
        v19 = CMIOLog();
        if (v19)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionProviderContext setClientInfo:message:].cold.2();
        }
      }
      else
      {
        v14 = CMIOLog();
        if (v14)
        {
          v15 = v14;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            pid = xpc_connection_get_pid((xpc_connection_t)a3);
            v18 = self->_clientInfo;
            v20 = 136316419;
            v21 = v16;
            v22 = 1024;
            v23 = 946;
            v24 = 2080;
            v25 = "-[CMIOExtensionProviderContext setClientInfo:message:]";
            v26 = 1025;
            v27 = pid;
            v28 = 2112;
            v29 = self;
            v30 = 2112;
            v31 = v18;
            _os_log_error_impl(&dword_2330C2000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s [%{private}d] invalid connection for this message to %@ / %@", (uint8_t *)&v20, 0x36u);
          }
        }
      }
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "removeProviderContext:", self);
      -[CMIOExtensionProviderContext invalidate](self, "invalidate");
      goto LABEL_17;
    }
LABEL_6:
    xpc_dictionary_set_int64(v8, "errorReturn", 0);
    xpc_connection_send_message((xpc_connection_t)a3, v8);
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "finishProviderContextRegistration:", self);
LABEL_17:
    xpc_release(v8);
    return;
  }
  v13 = CMIOLog();
  if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext setClientInfo:message:].cold.1();
}

- (void)captureAsyncStillImage:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSUUID *v16;
  _QWORD v17[6];
  CFTypeRef v18;
  CFTypeRef cf;
  NSObject *v20;

  v20 = 0;
  reply = xpc_dictionary_create_reply(a4);
  if (!reply)
  {
    v12 = CMIOLog();
    v9 = v12;
    if (!v12)
      goto LABEL_15;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:].cold.1();
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (!cf)
  {
    xpc_dictionary_set_int64(reply, "errorReturn", -1);
    xpc_connection_send_message((xpc_connection_t)a3, reply);
    v13 = CMIOLog();
    v9 = v13;
    if (!v13)
      goto LABEL_15;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:].cold.2();
    goto LABEL_14;
  }
  v8 = objc_alloc(MEMORY[0x24BDD1880]);
  v9 = objc_msgSend(v8, "initWithUUIDString:", cf);
  CFRelease(cf);
  v18 = 0;
  cmio_XPCMessageCopyCFNumber(a4, "param2", (NSObject **)&v18);
  if (v18)
  {
    v10 = objc_msgSend((id)v18, "longLongValue");
    CFRelease(v18);
    if (cmio_XPCMessageCopyCFDictionary(a4, "param3", &v20))
    {
      xpc_dictionary_set_int64(reply, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, reply);
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderContext captureAsyncStillImage:message:].cold.4();
    }
    else
    {
      xpc_retain(reply);
      v15 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      v16 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke;
      v17[3] = &unk_2504583F8;
      v17[4] = reply;
      v17[5] = a3;
      objc_msgSend(v15, "captureAsyncStillImageForClientID:streamID:uniqueID:options:reply:", v16, v9, v10, v20, v17);
    }
  }
  else
  {
    xpc_dictionary_set_int64(reply, "errorReturn", -1);
    xpc_connection_send_message((xpc_connection_t)a3, reply);
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext captureAsyncStillImage:message:].cold.3();
  }
LABEL_15:

  if (v20)
    CFRelease(v20);
  if (reply)
    xpc_release(reply);
}

void __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int SerializedAtomDataBlockBufferForSampleBuffer;

  if (a3)
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke_cold_1();
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(a3, "code");
    v8 = v6;
  }
  else
  {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", 0);
    SerializedAtomDataBlockBufferForSampleBuffer = FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer();
    v8 = *(void **)(a1 + 32);
    v7 = SerializedAtomDataBlockBufferForSampleBuffer;
  }
  xpc_dictionary_set_int64(v8, "errorReturn", v7);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3 message:(id)a4
{
  CMIOExtensionClient **p_clientInfo;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  pid_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  pid_t v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_clientInfo = &self->_clientInfo;
  if (-[CMIOExtensionClient isFromProxyExtensionManager](self->_clientInfo, "isFromProxyExtensionManager", a3))
  {
    v13 = 0;
    cmio_XPCMessageCopyCFArray(a4, "param1", &v13);
    v6 = v13;
    v7 = CMIOLog();
    v8 = v7;
    if (v6)
    {
      if (v7)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
          v10 = -[CMIOExtensionClient pid](*p_clientInfo, "pid");
          *(_DWORD *)buf = 136316163;
          v15 = v9;
          v16 = 1024;
          v17 = 1040;
          v18 = 2080;
          v19 = "-[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:]";
          v20 = 1025;
          v21 = v10;
          v22 = 2113;
          v23 = v13;
          _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] updating with %{private}@", buf, 0x2Cu);
        }
      }
      v11 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
      objc_msgSend(v11, "updateNonStreamingProxyFrontedExtensionPIDs:", v13);
    }
    else if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:].cold.1();
    }
  }
  else
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext updateNonStreamingProxyFrontedExtensionPIDs:message:].cold.2();
  }
}

- (void)enqueueReactionEffect:(id)a3 message:(id)a4
{
  xpc_object_t reply;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSUUID *v15;
  _QWORD v16[6];
  CFTypeRef cf;
  NSObject *v18;

  v18 = 0;
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    cf = 0;
    cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
    if (cf)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = objc_msgSend(v9, "initWithUUIDString:", cf);
      CFRelease(cf);
      if (cmio_XPCMessageCopyCFString(a4, "param2", &v18))
      {
        xpc_dictionary_set_int64(v8, "errorReturn", -1);
        xpc_connection_send_message((xpc_connection_t)a3, v8);
        v11 = CMIOLog();
        if (v11)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionProviderContext enqueueReactionEffect:message:].cold.3();
        }
      }
      else
      {
        xpc_retain(v8);
        v14 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
        v15 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke;
        v16[3] = &unk_2504583A8;
        v16[4] = v8;
        v16[5] = a3;
        objc_msgSend(v14, "enqueueReactionEffectForClientID:streamID:reactionType:reply:", v15, v10, v18, v16);
      }
    }
    else
    {
      xpc_dictionary_set_int64(v8, "errorReturn", -1);
      xpc_connection_send_message((xpc_connection_t)a3, v8);
      v13 = CMIOLog();
      v10 = v13;
      if (v13)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderContext enqueueReactionEffect:message:].cold.2();
        v10 = 0;
      }
    }

    xpc_release(v8);
  }
  else
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext enqueueReactionEffect:message:].cold.1();
  }
}

void __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  int64_t v6;
  void *v7;

  if (a2)
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke_cold_1();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(a2, "code");
    v7 = v5;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v6 = 0;
  }
  xpc_dictionary_set_int64(v7, "errorReturn", v6);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)pluginPropertiesChanged:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSUUID *v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSUUID *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v8 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v13 = 136315907;
      v14 = v7;
      v15 = 1024;
      v16 = 1101;
      v17 = 2080;
      v18 = "-[CMIOExtensionProviderContext pluginPropertiesChanged:]";
      v19 = 2113;
      v20 = v8;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@", (uint8_t *)&v13, 0x26u);
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 3uLL);
  if (!a3)
    goto LABEL_7;
  v10 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a3);
  if (v10)
  {
    v11 = v10;
    xpc_dictionary_set_value(v9, "param1", v10);
    xpc_release(v11);
LABEL_7:
    xpc_connection_send_message(self->_connection, v9);
    goto LABEL_8;
  }
  v12 = CMIOLog();
  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext pluginPropertiesChanged:].cold.1();
LABEL_8:
  xpc_release(v9);
}

- (void)availableDevicesChanged:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSUUID *v8;
  xpc_object_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSUUID *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v8 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v11 = 136315907;
      v12 = v7;
      v13 = 1024;
      v14 = 1124;
      v15 = 2080;
      v16 = "-[CMIOExtensionProviderContext availableDevicesChanged:]";
      v17 = 2113;
      v18 = v8;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@", (uint8_t *)&v11, 0x26u);
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 1uLL);
  if (a3 && cmio_XPCMessageSetCFArray(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext availableDevicesChanged:].cold.1();
  }
  else
  {
    xpc_connection_send_message(self->_connection, v9);
  }
  xpc_release(v9);
}

- (void)devicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSUUID *v10;
  xpc_object_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v10 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16 = 136316163;
      v17 = v9;
      v18 = 1024;
      v19 = 1140;
      v20 = 2080;
      v21 = "-[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:]";
      v22 = 2113;
      v23 = v10;
      v24 = 2113;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ DID %{private}@", (uint8_t *)&v16, 0x30u);
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 4uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:].cold.2();
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  v13 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a4);
  if (v13)
  {
    v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext devicePropertiesChangedWithDeviceID:propertyStates:].cold.1();
LABEL_12:
  xpc_release(v11);
}

- (void)availableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSUUID *v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  NSUUID *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v10 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v14 = 136316163;
      v15 = v9;
      v16 = 1024;
      v17 = 1166;
      v18 = 2080;
      v19 = "-[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:]";
      v20 = 2113;
      v21 = v10;
      v22 = 2113;
      v23 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ DID %{private}@", (uint8_t *)&v14, 0x30u);
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 2uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:].cold.2();
  }
  else if (a4 && cmio_XPCMessageSetCFArray(v11, "param2", a4))
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext availableStreamsChangedWithDeviceID:streamIDs:].cold.1();
  }
  else
  {
    xpc_connection_send_message(self->_connection, v11);
  }
  xpc_release(v11);
}

- (void)streamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSUUID *v10;
  xpc_object_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v10 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16 = 136316163;
      v17 = v9;
      v18 = 1024;
      v19 = 1185;
      v20 = 2080;
      v21 = "-[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:]";
      v22 = 2113;
      v23 = v10;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 5uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:].cold.2();
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  v13 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyStates:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyStates:", a4);
  if (v13)
  {
    v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext streamPropertiesChangedWithStreamID:propertyStates:].cold.1();
LABEL_12:
  xpc_release(v11);
}

- (void)receivedSampleWithStreamID:(id)a3 sample:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSUUID *v10;
  xpc_object_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(3);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v10 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16 = 136316163;
      v17 = v9;
      v18 = 1024;
      v19 = 1211;
      v20 = 2080;
      v21 = "-[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:]";
      v22 = 2113;
      v23 = v10;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 7uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:].cold.2();
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  xpc_dictionary_set_int64(v11, "param2", objc_msgSend(a4, "mediaType"));
  v13 = (void *)objc_msgSend(a4, "copyXPCDictionary");
  if (v13)
  {
    v14 = v13;
    xpc_dictionary_set_value(v11, "param3", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext receivedSampleWithStreamID:sample:].cold.1();
LABEL_12:
  xpc_release(v11);
}

- (void)pullSampleBufferForStreamID:(id)a3 replyq:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSUUID *v12;
  xpc_object_t v13;
  NSObject *v14;
  OS_xpc_object *connection;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSUUID *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(3);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v12 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      *(_DWORD *)buf = 136316163;
      v18 = v11;
      v19 = 1024;
      v20 = 1240;
      v21 = 2080;
      v22 = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]";
      v23 = 2113;
      v24 = v12;
      v25 = 2112;
      v26 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", buf, 0x30u);
    }
  }
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "MessageType", 8uLL);
  if (cmio_XPCMessageSetCFString(v13, "param1", a3))
  {
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:].cold.1();
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    connection = self->_connection;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke;
    handler[3] = &unk_250458420;
    handler[4] = a5;
    xpc_connection_send_message_with_reply(connection, v13, (dispatch_queue_t)a4, handler);
  }
  xpc_release(v13);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  int int64;
  CMIOExtensionSample *value;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint8_t buf[40];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_2((uint64_t)v8, (uint64_t)a2, (uint64_t)buf);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      value = (CMIOExtensionSample *)xpc_dictionary_get_value(a2, "param1");
      if (value)
      {
        value = -[CMIOExtensionSample initWithXPCDictionary:]([CMIOExtensionSample alloc], "initWithXPCDictionary:", value);
        if (!value)
        {
          v11 = CMIOLog();
          v12 = v11;
          if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
            __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_3((uint64_t)v13, buf, v12);
          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
        }
        xpc_dictionary_get_BOOL(a2, "param2");
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    v5 = CMIOLog();
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_4((uint64_t)v6, (uint64_t)a2, (uint64_t)buf);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)streamScheduledOutputChangedWithStreamID:(id)a3 scheduledOutput:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSUUID *v10;
  xpc_object_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(2);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
      v10 = -[CMIOExtensionClient clientID](self->_clientInfo, "clientID");
      v16 = 136316163;
      v17 = v9;
      v18 = 1024;
      v19 = 1304;
      v20 = 2080;
      v21 = "-[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:]";
      v22 = 2113;
      v23 = v10;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s CID %{private}@ SID %@", (uint8_t *)&v16, 0x30u);
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 9uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:].cold.2();
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_11:
    xpc_connection_send_message(self->_connection, v11);
    goto LABEL_12;
  }
  v13 = (void *)objc_msgSend(a4, "copyXPCDictionary");
  if (v13)
  {
    v14 = v13;
    xpc_dictionary_set_value(v11, "param2", v13);
    xpc_release(v14);
    goto LABEL_11;
  }
  v15 = CMIOLog();
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderContext streamScheduledOutputChangedWithStreamID:scheduledOutput:].cold.1();
LABEL_12:
  xpc_release(v11);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (CMIOExtensionClient)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isClientSourcedByNonStreamingProxyFrontedExtension
{
  return self->_clientSourcedByNonStreamingProxyFrontedExtension;
}

- (void)setClientSourcedByNonStreamingProxyFrontedExtension:(BOOL)a3
{
  self->_clientSourcedByNonStreamingProxyFrontedExtension = a3;
}

void __51__CMIOExtensionProviderContext_initWithConnection___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const char *v6;
  __int16 v7;
  int v8;
  int v9;
  const char *v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  v9 = 136316162;
  v10 = v6;
  OUTLINED_FUNCTION_5_1();
  v11 = 64;
  v12 = 2080;
  v13 = "-[CMIOExtensionProviderContext initWithConnection:]_block_invoke";
  v14 = v7;
  v15 = v8;
  v16 = 2114;
  v17 = a2;
  _os_log_error_impl(&dword_2330C2000, a3, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] received %{public}@", (uint8_t *)&v9, 0x2Cu);
}

- (void)handleClientMessageWithConnection:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availablePluginProperties:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s availablePluginProperties failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availablePluginProperties_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pluginStates:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s pluginStatesForClientID failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_pluginStates_message___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pluginPropertyStatesForProperties:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s pluginPropertyStatesForProperties failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__CMIOExtensionProviderContext_pluginPropertyStatesForProperties_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setPluginPropertyValues:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setPluginPropertyValues:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s setPluginPropertyValues missing parametertrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setPluginPropertyValues:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedpropertyStatesDictionary == nil == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CMIOExtensionProviderContext_setPluginPropertyValues_message___block_invoke_29_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s setPluginPropertyValues failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableDeviceProperties:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableDeviceProperties:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s availableDeviceProperties failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availableDeviceProperties_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deviceStates:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deviceStates:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s deviceStates failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CMIOExtensionProviderContext_deviceStates_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertyStates:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertyStates:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s devicePropertyStates failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__CMIOExtensionProviderContext_devicePropertyStates_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValues:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValues:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValues:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s setDevicePropertyValuesWithDeviceID missing parametertrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValues:message:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CMIOExtensionProviderContext_setDevicePropertyValues_message___block_invoke_32_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s setDevicePropertyValuesWithDeviceID failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamProperties:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamProperties:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s availableStreamProperties failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderContext_availableStreamProperties_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertyStates:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertyStates:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s streamPropertyStates failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__CMIOExtensionProviderContext_streamPropertyStates_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValues:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValues:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValues:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s setStreamPropertyValues missing parametertrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValues:message:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CMIOExtensionProviderContext_setStreamPropertyValues_message___block_invoke_33_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s setStreamPropertyValues failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startStream:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startStream:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startStream:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s startStream, pending unreleased voucher %{public}p", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __52__CMIOExtensionProviderContext_startStream_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s startStream failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stopStream:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stopStream:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__CMIOExtensionProviderContext_stopStream_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s stopStream failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setClientInfo:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setClientInfo:message:.cold.2()
{
  _xpc_connection_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  xpc_connection_get_pid(v0);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v1, v2, "%s:%d:%s [%{private}d] CMIOExtensionClient creation failed", v3, v4, v5, v6, 3u);
  OUTLINED_FUNCTION_17();
}

- (void)captureAsyncStillImage:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImage:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImage:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFNumber failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImage:message:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFDictionary failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__CMIOExtensionProviderContext_captureAsyncStillImage_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s captureAsyncStillImage failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s [%{private}d] empty array of pids", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_17();
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s [%{private}d] invalid connection for this message", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_17();
}

- (void)enqueueReactionEffect:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enqueueReactionEffect:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enqueueReactionEffect:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedtrue == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__CMIOExtensionProviderContext_enqueueReactionEffect_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s enqueueReactionEffect failed %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pluginPropertiesChanged:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam1 == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableDevicesChanged:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertiesChangedWithDeviceID:propertyStates:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertiesChangedWithDeviceID:propertyStates:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamsChangedWithDeviceID:streamIDs:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamsChangedWithDeviceID:streamIDs:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertiesChangedWithStreamID:propertyStates:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyStates failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertiesChangedWithStreamID:propertyStates:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedSampleWithStreamID:sample:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failedparam3 == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedSampleWithStreamID:sample:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pullSampleBufferForStreamID:replyq:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  v3 = OUTLINED_FUNCTION_5(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]_block_invoke";
  *(_WORD *)(v6 + 28) = 2112;
  *(_QWORD *)(v6 + 30) = v7;
  OUTLINED_FUNCTION_4(&dword_2330C2000, v9, v6, "%s:%d:%s exception %@", v8);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  v3 = OUTLINED_FUNCTION_5(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_3(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 1280;
  *((_WORD *)buf + 9) = 2080;
  *(_QWORD *)(buf + 20) = "-[CMIOExtensionProviderContext pullSampleBufferForStreamID:replyq:reply:]_block_invoke";
  _os_log_error_impl(&dword_2330C2000, log, OS_LOG_TYPE_ERROR, "%s:%d:%s CMIOExtensionSample alloc failed", buf, 0x1Cu);
}

void __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  v3 = OUTLINED_FUNCTION_5(a1, 4.8153e-34, a2, a3);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)streamScheduledOutputChangedWithStreamID:scheduledOutput:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failedparam2 == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamScheduledOutputChangedWithStreamID:scheduledOutput:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
