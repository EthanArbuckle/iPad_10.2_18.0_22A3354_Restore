@implementation CMIOExtensionProxyContext

- (CMIOExtensionProxyContext)initWithConnection:(id)a3 serverConnection:(id)a4 queue:(id)a5 delegate:(id)a6
{
  CMIOExtensionProxyContext *v10;
  CMIOExtensionProxyContext *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  NSObject *global_queue;
  uint64_t v15;
  uint64_t pid;
  uint64_t v17;
  id v18;
  CMIOExtensionClient *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  _QWORD v24[5];
  id v25;
  _QWORD handler[5];
  id v27;
  id location;
  objc_super v29;
  uint8_t buf[40];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v29.receiver = self;
    v29.super_class = (Class)CMIOExtensionProxyContext;
    v10 = -[CMIOExtensionProxyContext init](&v29, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_lock._os_unfair_lock_opaque = 0;
      v10->_transaction = (OS_os_transaction *)os_transaction_create();
      objc_storeWeak((id *)&v11->_delegate, a6);
      v11->_connection = (OS_xpc_object *)a3;
      v11->_serverConnection = (OS_xpc_object *)a4;
      v11->_deviceIDsByStreamID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v11->_hasCameraAttribution = 0;
      if (a5)
      {
        v12 = (dispatch_queue_t)a5;
      }
      else
      {
        v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        global_queue = dispatch_get_global_queue(21, 0);
        v12 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProxyContext", v13, global_queue);
      }
      v11->_queue = (OS_dispatch_queue *)v12;
      objc_initWeak(&location, v11);
      v15 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke;
      handler[3] = &unk_250458048;
      objc_copyWeak(&v27, &location);
      handler[4] = a4;
      xpc_connection_set_event_handler((xpc_connection_t)a4, handler);
      xpc_connection_set_target_queue((xpc_connection_t)a4, (dispatch_queue_t)v11->_queue);
      xpc_connection_activate((xpc_connection_t)a4);
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_21;
      v24[3] = &unk_250458048;
      objc_copyWeak(&v25, &location);
      v24[4] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, v24);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)v11->_queue);
      xpc_connection_activate((xpc_connection_t)a3);
      xpc_connection_get_audit_token();
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      v17 = objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      memset(buf, 0, 32);
      v18 = +[CMIOExtensionProvider newActivityAttributionWithToken:](CMIOExtensionProvider, "newActivityAttributionWithToken:", buf);
      v19 = [CMIOExtensionClient alloc];
      memset(buf, 0, 32);
      v11->_clientInfo = -[CMIOExtensionClient initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:](v19, "initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:", pid, v17, buf, v18, 1, 0);
      v11->_activeStreams = 0;
      v11->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProxyContext: pid %u, ID %@, delegate %@>"), pid, v17, a6);
      v11->_redactedDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProxyContext: pid -, ID ->"));
      -[CMIOExtensionProxyContext sendClientInfo](v11, "sendClientInfo");
      v20 = CMIOLog();
      v21 = v20;
      if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        *(_DWORD *)buf = 136315907;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 265;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]";
        *(_WORD *)&buf[28] = 2113;
        *(_QWORD *)&buf[30] = v11;
        _os_log_impl(&dword_2330C2000, v21, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return v11;
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x23492FDC4](a2);
  if (v5 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_cold_1();
    if (a2 == MEMORY[0x24BDACF30])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x24BDACF38] && WeakRetained && !*((_BYTE *)WeakRetained + 49))
    {
      v7 = CMIOLog();
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315907;
          v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          v11 = 1024;
          v12 = 210;
          v13 = 2080;
          v14 = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]_block_invoke";
          v15 = 2113;
          v16 = WeakRetained;
          _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, serverConnection is invalidated", (uint8_t *)&v9, 0x26u);
        }
      }
      objc_msgSend(WeakRetained, "invalidate");
      objc_msgSend(objc_loadWeak(WeakRetained + 7), "proxyContextHasBeenInvalidated:", WeakRetained);
    }
  }
  else if (v5 == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(WeakRetained, "handleServerMessageWithConnection:message:", *(_QWORD *)(a1 + 32), a2);
  }

}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_21(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x23492FDC4](a2);
  if (v5 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_21_cold_1();
    if (a2 == MEMORY[0x24BDACF30])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else if (a2 == MEMORY[0x24BDACF38] && WeakRetained && !*((_BYTE *)WeakRetained + 49))
    {
      v7 = CMIOLog();
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315907;
          v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          v11 = 1024;
          v12 = 237;
          v13 = 2080;
          v14 = "-[CMIOExtensionProxyContext initWithConnection:serverConnection:queue:delegate:]_block_invoke";
          v15 = 2113;
          v16 = WeakRetained;
          _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v9, 0x26u);
        }
      }
      objc_msgSend(WeakRetained, "invalidate");
      objc_msgSend(objc_loadWeak(WeakRetained + 7), "proxyContextHasBeenInvalidated:", WeakRetained);
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
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionProxyContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      v18 = 1024;
      v19 = 272;
      v20 = 2080;
      v21 = "-[CMIOExtensionProxyContext dealloc]";
      v22 = 2113;
      v23 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeAllObjects");
  if (self->_activeStreams >= 1)
  {
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proxyStreamsHaveStopped:", self->_activeStreams);
    self->_activeStreams = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)CMIOExtensionProxyContext;
  -[CMIOExtensionProxyContext dealloc](&v10, sel_dealloc);
}

- (id)description
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
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OS_xpc_object *connection;
  OS_xpc_object *serverConnection;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProxyContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315907;
      v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      v19 = 1024;
      v20 = 310;
      v21 = 2080;
      v22 = "-[CMIOExtensionProxyContext invalidate]";
      v23 = 2113;
      v24 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_INFO, "%s:%d:%s %{private}@", buf, 0x26u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_invalidated = 1;
    os_unfair_lock_unlock(&self->_lock);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap", 0), "allValues");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeAllObjects");
    self->_hasCameraAttribution = 0;
    if (self->_activeStreams >= 1)
    {
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proxyStreamsHaveStopped:", self->_activeStreams);
      self->_activeStreams = 0;
    }
    connection = self->_connection;
    if (connection)
      xpc_connection_cancel(connection);
    serverConnection = self->_serverConnection;
    if (serverConnection)
      xpc_connection_cancel(serverConnection);

    self->_transaction = 0;
  }
}

- (void)sendClientInfo
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int int64;
  NSObject *v7;
  NSObject *v8;

  if (a2)
  {
    v3 = MEMORY[0x23492FDC4](a2);
    if (v3 == MEMORY[0x24BDACFB8])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_1();
    }
    else if (v3 == MEMORY[0x24BDACFA0])
    {
      int64 = xpc_dictionary_get_int64(a2, "errorReturn");
      if (int64)
      {
        v7 = CMIOLog();
        if (v7)
        {
          v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_2(int64, v8);
        }
      }
    }
    else
    {
      v4 = CMIOLog();
      if (v4)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_3();
      }
    }
  }
}

- (void)receivedSample:(id)a3 message:(id)a4
{
  int int64;
  int64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  int64_t v13;
  xpc_object_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  CMIOExtensionClient *clientInfo;
  _QWORD v21[6];
  _QWORD applier[5];
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    int64 = xpc_dictionary_get_int64(a4, "param2");
    if (!xpc_dictionary_get_value(a4, "param3"))
    {
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProxyContext receivedSample:message:].cold.2();
      goto LABEL_39;
    }
    switch(int64)
    {
      case 1836415096:
        v12 = -[CMIOExtensionClient microphoneAuthorizationStatus](self->_clientInfo, "microphoneAuthorizationStatus") == 3
           && -[CMIOExtensionClient cameraAuthorizationStatus](self->_clientInfo, "cameraAuthorizationStatus") == 3;
        v8 = -[CMIOExtensionClient microphoneAuthorizationStatus](self->_clientInfo, "microphoneAuthorizationStatus") == 0;
        v9 = -[CMIOExtensionClient cameraAuthorizationStatus](self->_clientInfo, "cameraAuthorizationStatus") == 0;
        if (!v12)
        {
LABEL_25:
          v15 = CMIOLog();
          if (v15)
          {
            v16 = v15;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
              *(_DWORD *)buf = 136315650;
              v25 = v17;
              v26 = 1024;
              v27 = 423;
              v28 = 2080;
              v29 = "-[CMIOExtensionProxyContext receivedSample:message:]";
              _os_log_impl(&dword_2330C2000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Not authorized", buf, 0x1Cu);
            }
          }
          v18 = (void *)MEMORY[0x23492F950]();
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", cf);
          if (int64 != 1836415096)
          {
            if (int64 == 1986618469)
            {
LABEL_35:
              if (!-[CMIOExtensionClient hasPendingCameraAuthorizationRequest](self->_clientInfo, "hasPendingCameraAuthorizationRequest")&& v9)
              {
                clientInfo = self->_clientInfo;
                v21[0] = MEMORY[0x24BDAC760];
                v21[1] = 3221225472;
                v21[2] = __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_40;
                v21[3] = &unk_2504580F0;
                v21[4] = self;
                v21[5] = v19;
                -[CMIOExtensionClient requestAccessForMediaType:reply:](clientInfo, "requestAccessForMediaType:reply:", 1986618469, v21);
              }
              goto LABEL_38;
            }
            if (int64 != 1936684398)
            {
LABEL_38:
              objc_autoreleasePoolPop(v18);
              goto LABEL_39;
            }
          }
          if (!-[CMIOExtensionClient hasPendingMicrophoneAuthorizationRequest](self->_clientInfo, "hasPendingMicrophoneAuthorizationRequest")&& v8)
          {
            -[CMIOExtensionClient requestAccessForMediaType:reply:](self->_clientInfo, "requestAccessForMediaType:reply:", 1936684398, &__block_literal_global_39);
          }
          if (int64 != 1836415096)
            goto LABEL_38;
          goto LABEL_35;
        }
        break;
      case 1986618469:
        v13 = -[CMIOExtensionClient cameraAuthorizationStatus](self->_clientInfo, "cameraAuthorizationStatus");
        v9 = -[CMIOExtensionClient cameraAuthorizationStatus](self->_clientInfo, "cameraAuthorizationStatus") == 0;
        if (v13 != 3)
          goto LABEL_19;
        break;
      case 1936684398:
        v7 = -[CMIOExtensionClient microphoneAuthorizationStatus](self->_clientInfo, "microphoneAuthorizationStatus");
        v8 = -[CMIOExtensionClient microphoneAuthorizationStatus](self->_clientInfo, "microphoneAuthorizationStatus") == 0;
        if (v7 != 3)
        {
          v9 = 0;
          goto LABEL_25;
        }
LABEL_24:
        v14 = xpc_dictionary_create(0, 0, 0);
        applier[0] = MEMORY[0x24BDAC760];
        applier[1] = 3221225472;
        applier[2] = __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke;
        applier[3] = &unk_250457DE0;
        applier[4] = v14;
        xpc_dictionary_apply(a4, applier);
        xpc_connection_send_message(self->_connection, v14);
        xpc_release(v14);
LABEL_39:
        CFRelease(cf);
        return;
      default:
        v9 = 0;
LABEL_19:
        v8 = 0;
        goto LABEL_25;
    }
    if (!self->_hasCameraAttribution)
      -[CMIOExtensionProxyContext _addCameraAttribution:](self, "_addCameraAttribution:", cf);
    goto LABEL_24;
  }
  v10 = CMIOLog();
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProxyContext receivedSample:message:].cold.1();
}

uint64_t __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_37(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      if (a2 == 3)
        v5 = 89;
      else
        v5 = 78;
      v8 = 1024;
      v9 = 429;
      v10 = 2080;
      v11 = "-[CMIOExtensionProxyContext receivedSample:message:]_block_invoke";
      v12 = 1024;
      v13 = v5;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Authorized microphone %c", (uint8_t *)&v6, 0x22u);
    }
  }
}

void __52__CMIOExtensionProxyContext_receivedSample_message___block_invoke_40(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  _BYTE *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = CMIOLog();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      if (a2 == 3)
        v6 = 89;
      else
        v6 = 78;
      v10 = 1024;
      v11 = 437;
      v12 = 2080;
      v13 = "-[CMIOExtensionProxyContext receivedSample:message:]_block_invoke";
      v14 = 1024;
      v15 = v6;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Authorized camera %c", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a2 == 3)
  {
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[48])
      objc_msgSend(v7, "_addCameraAttribution:", *(_QWORD *)(a1 + 40));
  }
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t uint64;
  NSObject *v8;
  NSObject *v9;
  xpc_object_t reply;
  NSObject *queue;
  OS_xpc_object *serverConnection;
  _QWORD *v13;
  NSObject *v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t STCameraCaptureAttributionMapKey;
  xpc_object_t v21;
  xpc_object_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD handler[6];
  _BYTE buf[12];
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  CMIOExtensionProxyContext *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_0 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_183);
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316163;
        *(_QWORD *)&buf[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v33 = 1024;
        v34 = 457;
        v35 = 2080;
        v36 = "-[CMIOExtensionProxyContext handleClientMessageWithConnection:message:]";
        v37 = 2113;
        v38 = self;
        v39 = 2048;
        v40 = uint64;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", buf, 0x30u);
      }
    }
  }
  switch(uint64)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      reply = xpc_dictionary_create_reply(a4);
      if (reply)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke;
        handler[3] = &unk_250458118;
        handler[4] = reply;
        handler[5] = a3;
        v13 = handler;
        goto LABEL_10;
      }
      v14 = CMIOLog();
      if (v14)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.2();
      }
      break;
    case 5uLL:
      v15 = xpc_dictionary_create_reply(a4);
      if (v15)
      {
        v16 = v15;
        xpc_dictionary_set_int64(v15, "errorReturn", 0);
        xpc_connection_send_message((xpc_connection_t)a3, v16);
        xpc_release(v16);
      }
      else
      {
        v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.7();
      }
      break;
    case 0x17uLL:
      v17 = xpc_dictionary_create_reply(a4);
      if (v17)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43;
        v30[3] = &unk_250458140;
        v30[4] = v17;
        v30[5] = self;
        v30[6] = a3;
        v13 = v30;
        goto LABEL_10;
      }
      v24 = CMIOLog();
      if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.3();
      break;
    case 0x18uLL:
      *(_QWORD *)buf = 0;
      cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)buf);
      if (*(_QWORD *)buf)
      {
        v19 = (const __CFString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIDsByStreamID, "objectForKeyedSubscript:");
        if (v19)
        {
          STCameraCaptureAttributionMapKey = cmio_getSTCameraCaptureAttributionMapKey(v19, *(const __CFString **)buf);
          objc_msgSend(+[CMIOExtensionProxyAttribution sharedAttribution](CMIOExtensionProxyAttribution, "sharedAttribution"), "removeCameraAttribution:", objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "objectForKeyedSubscript:", STCameraCaptureAttributionMapKey));
          objc_msgSend((id)-[CMIOExtensionClient stCameraCaptureAttributionsMap](self->_clientInfo, "stCameraCaptureAttributionsMap"), "removeObjectForKey:", STCameraCaptureAttributionMapKey);
          -[NSMutableDictionary removeObjectForKey:](self->_deviceIDsByStreamID, "removeObjectForKey:", *(_QWORD *)buf);
          self->_hasCameraAttribution = 0;
        }
        CFRelease(*(CFTypeRef *)buf);
        v21 = xpc_dictionary_create_reply(a4);
        if (v21)
        {
          serverConnection = self->_serverConnection;
          queue = self->_queue;
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45;
          v29[3] = &unk_250458140;
          v29[4] = v21;
          v29[5] = self;
          v29[6] = a3;
          v13 = v29;
          goto LABEL_10;
        }
        v27 = CMIOLog();
        if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.5();
      }
      else
      {
        v25 = CMIOLog();
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.4();
      }
      break;
    case 0x19uLL:

      self->_transaction = 0;
      v22 = xpc_dictionary_create_reply(a4);
      if (v22)
      {
        serverConnection = self->_serverConnection;
        queue = self->_queue;
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47;
        v28[3] = &unk_250458118;
        v28[4] = v22;
        v28[5] = a3;
        v13 = v28;
LABEL_10:
        xpc_connection_send_message_with_reply(serverConnection, a4, queue, v13);
      }
      else
      {
        v26 = CMIOLog();
        if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.6();
      }
      break;
    default:
      v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProxyContext handleClientMessageWithConnection:message:].cold.1();
      break;
  }
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD applier[5];

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_1();
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_41;
      applier[3] = &unk_250457DE0;
      applier[4] = *(_QWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_2();
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_41(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD applier[5];

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43_cold_1();
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 52);
      objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 40) + 56)), "proxyStreamHasStarted");
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_44;
      applier[3] = &unk_250457DE0;
      applier[4] = *(_QWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43_cold_2();
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_44(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD applier[5];

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45_cold_1();
    goto LABEL_9;
  }
  if (v4 != MEMORY[0x24BDACFA0])
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45_cold_2();
LABEL_9:
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
    goto LABEL_13;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (*(int *)(v7 + 52) >= 1)
  {
    objc_msgSend(objc_loadWeak((id *)(v7 + 56)), "proxyStreamsHaveStopped:", 1);
    --*(_DWORD *)(*(_QWORD *)(a1 + 40) + 52);
  }
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_46;
  applier[3] = &unk_250457DE0;
  applier[4] = *(_QWORD *)(a1 + 32);
  xpc_dictionary_apply(a2, applier);
LABEL_13:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_46(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD applier[5];

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47_cold_1();
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48;
      applier[3] = &unk_250457DE0;
      applier[4] = *(_QWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47_cold_2();
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_48(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (void)handleServerMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t uint64;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  xpc_object_t dictionary;
  id v12;
  void *v13;
  void *v14;
  xpc_object_t v15;
  NSObject *v16;
  xpc_object_t reply;
  OS_xpc_object *connection;
  NSObject *queue;
  NSObject *v20;
  _QWORD handler[6];
  _QWORD applier[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  CMIOExtensionProxyContext *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_0 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_183);
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316163;
        v24 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        v25 = 1024;
        v26 = 620;
        v27 = 2080;
        v28 = "-[CMIOExtensionProxyContext handleServerMessageWithConnection:message:]";
        v29 = 2113;
        v30 = self;
        v31 = 2048;
        v32 = uint64;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", buf, 0x30u);
      }
    }
  }
  v10 = MEMORY[0x24BDACFA0];
  switch(uint64)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      if (MEMORY[0x23492FDC4](a4) == v10)
      {
        dictionary = xpc_dictionary_get_dictionary(a4, "param2");
        if (dictionary)
        {
          v12 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", dictionary);
          if (objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x2504595B8)
            && objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x2504595D8)
            && objc_msgSend((id)objc_msgSend(v12, "allKeys"), "containsObject:", 0x250459558)
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", 0x2504595B8), "value"), "intValue"))
          {
            v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", 0x2504595D8);
            v14 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", 0x250459578);
            if (!v14)
              v14 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", 0x250459558);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIDsByStreamID, "setObject:forKeyedSubscript:", objc_msgSend(v14, "value"), objc_msgSend(v13, "value"));
          }

        }
      }
      goto LABEL_18;
    case 5uLL:
    case 9uLL:
LABEL_18:
      if (MEMORY[0x23492FDC4](a4) == v10)
      {
        v15 = xpc_dictionary_create(0, 0, 0);
        applier[0] = MEMORY[0x24BDAC760];
        applier[1] = 3221225472;
        applier[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke;
        applier[3] = &unk_250457DE0;
        applier[4] = v15;
        xpc_dictionary_apply(a4, applier);
        xpc_connection_send_message(self->_connection, v15);
        xpc_release(v15);
      }
      break;
    case 7uLL:
      -[CMIOExtensionProxyContext receivedSample:message:](self, "receivedSample:message:", a3, a4);
      break;
    case 8uLL:
      reply = xpc_dictionary_create_reply(a4);
      if (reply)
      {
        connection = self->_connection;
        queue = self->_queue;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50;
        handler[3] = &unk_250458118;
        handler[4] = reply;
        handler[5] = a3;
        xpc_connection_send_message_with_reply(connection, a4, queue, handler);
      }
      else
      {
        v20 = CMIOLog();
        if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProxyContext handleServerMessageWithConnection:message:].cold.2();
      }
      break;
    default:
      v16 = CMIOLog();
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProxyContext handleServerMessageWithConnection:message:].cold.1();
      break;
  }
}

uint64_t __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD applier[5];

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50_cold_1();
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_51;
      applier[3] = &unk_250457DE0;
      applier[4] = *(_QWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
      goto LABEL_11;
    }
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50_cold_2();
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "errorReturn", -7);
LABEL_11:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_51(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (BOOL)hasCameraAttribution
{
  return self->_hasCameraAttribution;
}

- (CMIOExtensionProxyContextDelegate)delegate
{
  return (CMIOExtensionProxyContextDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (OS_xpc_object)serverConnection
{
  return self->_serverConnection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CMIOExtensionClient)clientInfo
{
  return self->_clientInfo;
}

- (int)activeStreams
{
  return self->_activeStreams;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d:%s [%d] received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __80__CMIOExtensionProxyContext_initWithConnection_serverConnection_queue_delegate___block_invoke_21_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d:%s [%d] received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_2(int a1, NSObject *a2)
{
  __int16 v4;
  uint8_t v5[20];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  v6 = "-[CMIOExtensionProxyContext sendClientInfo]_block_invoke";
  v7 = v4;
  v8 = a1;
  _os_log_error_impl(&dword_2330C2000, a2, OS_LOG_TYPE_ERROR, "%s:%d:%s error %d", v5, 0x22u);
  OUTLINED_FUNCTION_2();
}

void __43__CMIOExtensionProxyContext_sendClientInfo__block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedSample:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedSample:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
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
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleClientMessageWithConnection:message:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_43_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_45_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleClientMessageWithConnection_message___block_invoke_47_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleServerMessageWithConnection:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Unknown message type %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleServerMessageWithConnection:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreplyServer == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__CMIOExtensionProxyContext_handleServerMessageWithConnection_message___block_invoke_50_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
