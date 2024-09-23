@implementation CMIOExtensionProviderHostContext

- (CMIOExtensionProviderHostContext)initWithConnection:(id)a3 delegate:(id)a4
{
  CMIOExtensionProviderHostContext *v6;
  CMIOExtensionProviderHostContext *v7;
  uint64_t pid;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t handler;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  id location;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CMIOExtensionProviderHostContext *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v21.receiver = self;
    v21.super_class = (Class)CMIOExtensionProviderHostContext;
    v6 = -[CMIOExtensionProviderHostContext init](&v21, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_internalLock._os_unfair_lock_opaque = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7->_queue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingWorkloopWithPriority();
      v7->_transactionGroup = (OS_dispatch_group *)dispatch_group_create();
      objc_storeWeak((id *)&v7->_delegate, a4);
      v7->_connection = (OS_xpc_object *)a3;
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)v7->_queue);
      objc_initWeak(&location, v7);
      handler = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke;
      v17 = &unk_250458048;
      objc_copyWeak(&v19, &location);
      v18 = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, &handler);
      xpc_connection_activate((xpc_connection_t)a3);
      -[CMIOExtensionProviderHostContext sendEmptyClientInfo](v7, "sendEmptyClientInfo");
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      v9 = objc_alloc(MEMORY[0x24BDD17C8]);
      v7->_description = (NSString *)objc_msgSend(v9, "initWithFormat:", CFSTR("<CMIOExtensionProviderHostContext: pid %u>"), pid, handler, v15, v16, v17);
      v7->_redactedDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProviderHostContext: pid ->"));
      v10 = CMIOLog();
      v11 = v10;
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        *(_DWORD *)buf = 136315907;
        v23 = v12;
        v24 = 1024;
        v25 = 104;
        v26 = 2080;
        v27 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]";
        v28 = 2113;
        v29 = v7;
        _os_log_impl(&dword_2330C2000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
    return 0;
  }
  return v7;
}

void __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke(uint64_t a1, uint64_t a2)
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
        __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke_cold_1(a1, a2, v7);
    }
    if (a2 == MEMORY[0x24BDACF38])
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (a2 == MEMORY[0x24BDACF30] && WeakRetained && !WeakRetained[48])
    {
      v8 = CMIOLog();
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315907;
          v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          v12 = 1024;
          v13 = 83;
          v14 = 2080;
          v15 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]_block_invoke";
          v16 = 2113;
          v17 = WeakRetained;
          _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@, connection is invalidated", (uint8_t *)&v10, 0x26u);
        }
      }
      xpc_connection_cancel((xpc_connection_t)objc_msgSend(WeakRetained, "connection"));
      WeakRetained[48] = 1;
      objc_msgSend((id)objc_msgSend(WeakRetained, "delegate"), "extensionHasBeenInvalidated:", WeakRetained);
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
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionProviderHostContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v8 = 1024;
        v9 = 111;
        v10 = 2080;
        v11 = "-[CMIOExtensionProviderHostContext dealloc]";
        v12 = 2113;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }

  dispatch_release((dispatch_object_t)self->_queue);
  dispatch_release((dispatch_object_t)self->_transactionGroup);

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionProviderHostContext;
  -[CMIOExtensionProviderHostContext dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  return self->_description;
}

- (id)redactedDescription
{
  return self->_redactedDescription;
}

- (void)handleClientMessageWithConnection:(id)a3 message:(id)a4
{
  uint64_t uint64;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProviderHostContext *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  uint64 = xpc_dictionary_get_uint64(a4, "MessageType");
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316163;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v13 = 1024;
        v14 = 137;
        v15 = 2080;
        v16 = "-[CMIOExtensionProviderHostContext handleClientMessageWithConnection:message:]";
        v17 = 2113;
        v18 = self;
        v19 = 2048;
        v20 = uint64;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ %lld", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  switch(uint64)
  {
    case 1uLL:
      -[CMIOExtensionProviderHostContext availableDevicesChanged:message:](self, "availableDevicesChanged:message:", a3, a4);
      break;
    case 2uLL:
      -[CMIOExtensionProviderHostContext availableStreamsChanged:message:](self, "availableStreamsChanged:message:", a3, a4);
      break;
    case 3uLL:
      -[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:](self, "pluginPropertiesChanged:message:", a3, a4);
      break;
    case 4uLL:
      -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:](self, "devicePropertiesChanged:message:", a3, a4);
      break;
    case 5uLL:
      -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:](self, "streamPropertiesChanged:message:", a3, a4);
      break;
    case 7uLL:
      -[CMIOExtensionProviderHostContext receivedSample:message:](self, "receivedSample:message:", a3, a4);
      break;
    case 8uLL:
      -[CMIOExtensionProviderHostContext pullSample:message:](self, "pullSample:message:", a3, a4);
      break;
    case 9uLL:
      -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:](self, "scheduledOutputChanged:message:", a3, a4);
      break;
    default:
      v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext handleClientMessageWithConnection:message:].cold.1();
      }
      break;
  }
}

- (void)availableDevicesChanged:(id)a3 message:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  CMIOExtensionProviderHostDelegate *v9;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProviderHostContext *v18;
  __int16 v19;
  CFTypeRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  if (cmio_XPCMessageCopyCFArray(a4, "param1", (NSObject **)&cf))
  {
    v5 = CMIOLog();
    if (v5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext availableDevicesChanged:message:].cold.1();
    }
  }
  if (cf)
  {
    if (CMIOModuleLogLevel_once_1 != -1)
      dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
    if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
    {
      v6 = CMIOLog();
      if (v6)
      {
        v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          *(_DWORD *)buf = 136316163;
          v12 = v8;
          v13 = 1024;
          v14 = 177;
          v15 = 2080;
          v16 = "-[CMIOExtensionProviderHostContext availableDevicesChanged:message:]";
          v17 = 2113;
          v18 = self;
          v19 = 2112;
          v20 = cf;
          _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - devices %@", buf, 0x30u);
        }
      }
    }
    v9 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
    -[CMIOExtensionProviderHostDelegate extension:availableDevicesChanged:](v9, "extension:availableDevicesChanged:", self, cf);
    CFRelease(cf);
  }
}

- (void)availableStreamsChanged:(id)a3 message:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  CMIOExtensionProviderHostDelegate *v10;
  NSObject *v11;
  CFTypeRef cf;
  CFTypeRef v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  __int16 v22;
  CFTypeRef v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&v13);
  if (v13)
  {
    cf = 0;
    if (cmio_XPCMessageCopyCFArray(a4, "param2", (NSObject **)&cf))
    {
      v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext availableStreamsChanged:message:].cold.2();
      }
    }
    if (cf)
    {
      if (CMIOModuleLogLevel_once_1 != -1)
        dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
      if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
      {
        v7 = CMIOLog();
        if (v7)
        {
          v8 = v7;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            *(_DWORD *)buf = 136316163;
            v15 = v9;
            v16 = 1024;
            v17 = 195;
            v18 = 2080;
            v19 = "-[CMIOExtensionProviderHostContext availableStreamsChanged:message:]";
            v20 = 2113;
            v21 = self;
            v22 = 2112;
            v23 = cf;
            _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - streams %@", buf, 0x30u);
          }
        }
      }
      v10 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
      -[CMIOExtensionProviderHostDelegate extension:availableStreamsChangedWithDeviceID:streamIDs:](v10, "extension:availableStreamsChangedWithDeviceID:streamIDs:", self, v13, cf);
      CFRelease(cf);
    }
    CFRelease(v13);
  }
  else
  {
    v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext availableStreamsChanged:message:].cold.1();
  }
}

- (void)pluginPropertiesChanged:(id)a3 message:(id)a4
{
  xpc_object_t value;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionProviderHostContext *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  value = xpc_dictionary_get_value(a4, "param1");
  if (value)
  {
    v6 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
    if (v6)
    {
      v7 = v6;
      if (CMIOModuleLogLevel_once_1 != -1)
        dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
      if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
      {
        v8 = CMIOLog();
        if (v8)
        {
          v9 = v8;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v12 = 136316163;
            v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            v14 = 1024;
            v15 = 215;
            v16 = 2080;
            v17 = "-[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:]";
            v18 = 2113;
            v19 = self;
            v20 = 2112;
            v21 = v7;
            _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@", (uint8_t *)&v12, 0x30u);
          }
        }
      }
      -[CMIOExtensionProviderHostDelegate extension:pluginPropertiesChanged:](-[CMIOExtensionProviderHostContext delegate](self, "delegate"), "extension:pluginPropertiesChanged:", self, v7);
    }
    else
    {
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:].cold.2();
    }
  }
  else
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext pluginPropertiesChanged:message:].cold.1();
  }
}

- (void)devicePropertiesChanged:(id)a3 message:(id)a4
{
  xpc_object_t value;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  CMIOExtensionProviderHostDelegate *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  __int16 v25;
  CFTypeRef v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      v7 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
      if (v7)
      {
        v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1)
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
        if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
        {
          v9 = CMIOLog();
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              v18 = v11;
              v19 = 1024;
              v20 = 236;
              v21 = 2080;
              v22 = "-[CMIOExtensionProviderHostContext devicePropertiesChanged:message:]";
              v23 = 2113;
              v24 = self;
              v25 = 2112;
              v26 = cf;
              v27 = 2112;
              v28 = v8;
              _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        v12 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
        -[CMIOExtensionProviderHostDelegate extension:devicePropertiesChangedWithDeviceID:propertyStates:](v12, "extension:devicePropertiesChangedWithDeviceID:propertyStates:", self, cf, v8);
      }
      else
      {
        v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:].cold.3();
      }
    }
    else
    {
      v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:].cold.2();
    }
    CFRelease(cf);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext devicePropertiesChanged:message:].cold.1();
  }
}

- (void)streamPropertiesChanged:(id)a3 message:(id)a4
{
  xpc_object_t value;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  CMIOExtensionProviderHostDelegate *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  __int16 v25;
  CFTypeRef v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      v7 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
      if (v7)
      {
        v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1)
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
        if (CMIOModuleLogLevel_cmioLevel_1 >= 2)
        {
          v9 = CMIOLog();
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              v18 = v11;
              v19 = 1024;
              v20 = 260;
              v21 = 2080;
              v22 = "-[CMIOExtensionProviderHostContext streamPropertiesChanged:message:]";
              v23 = 2113;
              v24 = self;
              v25 = 2112;
              v26 = cf;
              v27 = 2112;
              v28 = v8;
              _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        v12 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
        -[CMIOExtensionProviderHostDelegate extension:streamPropertiesChangedWithStreamID:propertyStates:](v12, "extension:streamPropertiesChangedWithStreamID:propertyStates:", self, cf, v8);
      }
      else
      {
        v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:].cold.3();
      }
    }
    else
    {
      v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:].cold.2();
    }
    CFRelease(cf);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext streamPropertiesChanged:message:].cold.1();
  }
}

- (void)receivedSample:(id)a3 message:(id)a4
{
  unsigned int int64;
  xpc_object_t value;
  CMIOExtensionSample *v8;
  CMIOExtensionSample *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  CMIOExtensionProviderHostDelegate *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CMIOExtensionProviderHostContext *v25;
  __int16 v26;
  CFTypeRef v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  CMIOExtensionSample *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    int64 = xpc_dictionary_get_int64(a4, "param2");
    value = xpc_dictionary_get_value(a4, "param3");
    if (value)
    {
      v8 = -[CMIOExtensionSample initWithXPCDictionary:]([CMIOExtensionSample alloc], "initWithXPCDictionary:", value);
      if (v8)
      {
        v9 = v8;
        if (CMIOModuleLogLevel_once_1 != -1)
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
        if (CMIOModuleLogLevel_cmioLevel_1 >= 3)
        {
          v10 = CMIOLog();
          if (v10)
          {
            v11 = v10;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136317443;
              v19 = v12;
              v21 = 286;
              v22 = 2080;
              v20 = 1024;
              v23 = "-[CMIOExtensionProviderHostContext receivedSample:message:]";
              v24 = 2113;
              v25 = self;
              v26 = 2112;
              v27 = cf;
              v28 = 1024;
              v29 = HIBYTE(int64);
              v30 = 1024;
              v31 = BYTE2(int64);
              v32 = 1024;
              v33 = BYTE1(int64);
              v34 = 1024;
              v35 = int64;
              v36 = 2112;
              v37 = v9;
              _os_log_impl(&dword_2330C2000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %c%c%c%c - %@", buf, 0x52u);
            }
          }
        }
        v13 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
        -[CMIOExtensionProviderHostDelegate extension:receivedSampleWithStreamID:sample:](v13, "extension:receivedSampleWithStreamID:sample:", self, cf, v9);

      }
      else
      {
        v16 = CMIOLog();
        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext receivedSample:message:].cold.3();
      }
    }
    else
    {
      v15 = CMIOLog();
      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext receivedSample:message:].cold.2();
    }
    CFRelease(cf);
  }
  else
  {
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext receivedSample:message:].cold.1();
  }
}

- (void)pullSample:(id)a3 message:(id)a4
{
  NSObject *reply;
  NSObject *v8;
  CMIOExtensionProviderHostDelegate *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[6];
  NSObject *v13;

  v13 = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", &v13);
  if (!v13)
  {
    v10 = CMIOLog();
    v8 = v10;
    if (!v10)
      goto LABEL_11;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext pullSample:message:].cold.1();
    goto LABEL_10;
  }
  reply = xpc_dictionary_create_reply(a4);
  if (reply)
  {
    v8 = reply;
    xpc_retain(reply);
    v9 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke;
    v12[3] = &unk_250458200;
    v12[4] = v8;
    v12[5] = a3;
    -[CMIOExtensionProviderHostDelegate extension:pullSampleWithStreamID:reply:](v9, "extension:pullSampleWithStreamID:reply:", self, v13, v12);
    goto LABEL_11;
  }
  v11 = CMIOLog();
  v8 = v11;
  if (v11)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext pullSample:message:].cold.2();
LABEL_10:
    v8 = 0;
  }
LABEL_11:
  if (v13)
    CFRelease(v13);
  if (v8)
    xpc_release(v8);
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  void *v13;

  if (a2)
  {
    v7 = (void *)objc_msgSend(a2, "copyXPCDictionary");
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "param1", v7);
      xpc_release(v8);
    }
    else
    {
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_2();
      a4 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0);
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "param2", a3);
  }
  if (a4)
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_1();
    v11 = *(void **)(a1 + 32);
    v12 = objc_msgSend(a4, "code");
    v13 = v11;
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v12 = 0;
  }
  xpc_dictionary_set_int64(v13, "errorReturn", v12);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

- (void)scheduledOutputChanged:(id)a3 message:(id)a4
{
  xpc_object_t value;
  CMIOExtensionScheduledOutput *v7;
  CMIOExtensionScheduledOutput *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  CMIOExtensionProviderHostDelegate *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  __int16 v25;
  CFTypeRef v26;
  __int16 v27;
  CMIOExtensionScheduledOutput *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cmio_XPCMessageCopyCFString(a4, "param1", (NSObject **)&cf);
  if (cf)
  {
    value = xpc_dictionary_get_value(a4, "param2");
    if (value)
    {
      v7 = -[CMIOExtensionScheduledOutput initWithXPCDictionary:]([CMIOExtensionScheduledOutput alloc], "initWithXPCDictionary:", value);
      if (v7)
      {
        v8 = v7;
        if (CMIOModuleLogLevel_once_1 != -1)
          dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
        if (CMIOModuleLogLevel_cmioLevel_1 >= 3)
        {
          v9 = CMIOLog();
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
              *(_DWORD *)buf = 136316419;
              v18 = v11;
              v19 = 1024;
              v20 = 356;
              v21 = 2080;
              v22 = "-[CMIOExtensionProviderHostContext scheduledOutputChanged:message:]";
              v23 = 2113;
              v24 = self;
              v25 = 2112;
              v26 = cf;
              v27 = 2112;
              v28 = v8;
              _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ - %@ - %@", buf, 0x3Au);
            }
          }
        }
        v12 = -[CMIOExtensionProviderHostContext delegate](self, "delegate");
        -[CMIOExtensionProviderHostDelegate extension:streamScheduledOutputChangedWithStreamID:scheduledOutput:](v12, "extension:streamScheduledOutputChangedWithStreamID:scheduledOutput:", self, cf, v8);

      }
      else
      {
        v15 = CMIOLog();
        if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:].cold.3();
      }
    }
    else
    {
      v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:].cold.2();
    }
    CFRelease(cf);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext scheduledOutputChanged:message:].cold.1();
  }
}

- (void)availablePluginProperties:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProviderHostContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v13 = 1024;
        v14 = 371;
        v15 = 2080;
        v16 = "-[CMIOExtensionProviderHostContext availablePluginProperties:]";
        v17 = 2113;
        v18 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "MessageType", 2uLL);
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  connection = self->_connection;
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke;
  v10[3] = &unk_250458228;
  v10[4] = self;
  v10[5] = a3;
  xpc_connection_send_message_with_reply(connection, v7, queue, v10);
  xpc_release(v7);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  NSObject *v8;
  const char *v9;
  CFTypeRef cf;
  _BYTE v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
        CFRelease(cf);
        cf = 0;
      }
      else
      {
        v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_4();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)pluginStates:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int int64;
  xpc_object_t value;
  id v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  xpc_object_t v21;
  uint64_t v22;
  id v23;
  xpc_object_t v24;
  id v25;
  xpc_object_t v26;
  _QWORD v27[5];
  _QWORD applier[11];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  CMIOExtensionProviderHostContext *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v30 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v31 = 1024;
        v32 = 423;
        v33 = 2080;
        v34 = "-[CMIOExtensionProviderHostContext pluginStates:]";
        v35 = 2113;
        v36 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v7, "MessageType", 1uLL);
  v8 = xpc_connection_send_message_with_reply_sync(self->_connection, v7);
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x23492FDC4](v8);
    if (v10 == MEMORY[0x24BDACFB8])
    {
      v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.2();
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, 0, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0));
      goto LABEL_37;
    }
    if (v10 != MEMORY[0x24BDACFA0])
    {
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.5();
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, 0, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0));
      goto LABEL_37;
    }
    int64 = xpc_dictionary_get_int64(v9, "errorReturn");
    if (int64)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, 0, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0));
LABEL_37:
      xpc_release(v9);
      v26 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v26, "MessageType", 0x19uLL);
      xpc_connection_send_message_with_reply(self->_connection, v26, (dispatch_queue_t)self->_queue, &__block_literal_global_4);
      xpc_release(v26);
      goto LABEL_38;
    }
    value = xpc_dictionary_get_value(v9, "param1");
    if (value)
    {
      v15 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value);
      if (v15)
      {
        v16 = 0;
LABEL_30:
        v21 = xpc_dictionary_get_value(v9, "param2");
        v22 = MEMORY[0x24BDAC760];
        if (v21)
        {
          v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          applier[0] = v22;
          applier[1] = 3221225472;
          applier[2] = __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke;
          applier[3] = &unk_250457E08;
          applier[4] = v23;
          xpc_array_apply(v21, applier);
        }
        else
        {
          v23 = 0;
        }
        v24 = xpc_dictionary_get_value(v9, "param3");
        if (v24)
        {
          v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v27[0] = v22;
          v27[1] = 3221225472;
          v27[2] = __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_24;
          v27[3] = &unk_250457E08;
          v27[4] = v25;
          xpc_array_apply(v24, v27);
        }
        else
        {
          v25 = 0;
        }
        (*((void (**)(id, id, id, id, uint64_t))a3 + 2))(a3, v15, v23, v25, v16);
        goto LABEL_37;
      }
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.4((uint64_t)v20, (uint64_t)buf);
      }
    }
    else
    {
      v17 = CMIOLog();
      if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:].cold.3((uint64_t)v18, (uint64_t)buf);
      }
    }
    v16 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    v15 = 0;
    goto LABEL_30;
  }
LABEL_38:
  xpc_release(v7);
}

uint64_t __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;

  v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", 0x250459558);
    if (objc_msgSend(v4, "value"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_cold_1();
  }
  return 1;
}

uint64_t __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_24(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;

  v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", 0x250459638);
    if (objc_msgSend(v4, "value"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_24_cold_1();
  }
  return 1;
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;

  v3 = MEMORY[0x23492FDC4](a2);
  if (v3 == MEMORY[0x24BDACFB8])
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_25_cold_1();
  }
  else if (v3 == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_int64(a2, "errorReturn");
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_25_cold_2();
    }
  }
}

- (void)pluginPropertyStatesForProperties:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 535;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 3uLL);
  if (a3)
  {
    if (cmio_XPCMessageSetCFArray(v9, "param1", (CFTypeRef)objc_msgSend(a3, "allObjects")))
    {
      v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:].cold.1();
      }
    }
  }
  dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
  connection = self->_connection;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke;
  v13[3] = &unk_250458228;
  v13[4] = self;
  v13[5] = a4;
  xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  xpc_release(v9);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  xpc_object_t value;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  _BYTE v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 != MEMORY[0x24BDACFA0])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_5();
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value))
      {
        goto LABEL_23;
      }
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
LABEL_23:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_2();
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setPluginPropertyValues:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  OS_xpc_object *connection;
  NSObject *queue;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v19 = 1024;
        v20 = 596;
        v21 = 2080;
        v22 = "-[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]";
        v23 = 2113;
        v24 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if (objc_msgSend(a3, "count"))
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "MessageType", 4uLL);
    v10 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyValues:", a3);
    if (v10)
    {
      v11 = v10;
      xpc_dictionary_set_value(v9, "param1", v10);
      xpc_release(v11);
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke;
      v16[3] = &unk_250458228;
      v16[4] = self;
      v16[5] = a4;
      xpc_connection_send_message_with_reply(connection, v9, queue, v16);
    }
    else
    {
      v15 = CMIOLog();
      if (v15)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:].cold.2();
      }
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
    }
    xpc_release(v9);
  }
  else
  {
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:].cold.1();
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -1, 0));
  }
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)availableDevicePropertiesWithDeviceID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 655;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0xBuLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:].cold.1();
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke;
    v13[3] = &unk_250458228;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  NSObject *v8;
  const char *v9;
  CFTypeRef cf;
  _BYTE v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
        CFRelease(cf);
        cf = 0;
      }
      else
      {
        v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_4();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)deviceStatesWithDeviceID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 718;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0xAuLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:].cold.1();
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))a4 + 2))(a4, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke;
    v13[3] = &unk_250458228;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  xpc_object_t value;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  xpc_object_t v13;
  id v14;
  _QWORD applier[11];
  _BYTE v16[40];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 != MEMORY[0x24BDACFA0])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_5();
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value))
      {
        goto LABEL_23;
      }
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v16);
      }
    }
    else
    {
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v16);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
LABEL_23:
    v13 = xpc_dictionary_get_value(a2, "param2");
    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_26;
      applier[3] = &unk_250457E08;
      applier[4] = v14;
      xpc_array_apply(v13, applier);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_26;
  }
  v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_2();
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_26(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = +[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", 0x250459638);
    if (objc_msgSend(v4, "value"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, objc_msgSend(v4, "value"));

  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_26_cold_1();
  }
  return 1;
}

- (void)devicePropertyStatesWithDeviceID:(id)a3 properties:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v19 = 1024;
        v20 = 804;
        v21 = 2080;
        v22 = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]";
        v23 = 2113;
        v24 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0xCuLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:].cold.2();
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    if (a4)
    {
      if (cmio_XPCMessageSetCFArray(v11, "param2", (CFTypeRef)objc_msgSend(a4, "allObjects")))
      {
        v13 = CMIOLog();
        if (v13)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:].cold.1();
        }
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke;
    v16[3] = &unk_250458228;
    v16[4] = self;
    v16[5] = a5;
    xpc_connection_send_message_with_reply(connection, v11, queue, v16);
  }
  xpc_release(v11);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  xpc_object_t value;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  _BYTE v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 != MEMORY[0x24BDACFA0])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_5();
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value))
      {
        goto LABEL_23;
      }
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
LABEL_23:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_2();
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setDevicePropertyValuesWithDeviceID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  OS_xpc_object *connection;
  NSObject *queue;
  NSObject *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMIOExtensionProviderHostContext *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v22 = 1024;
        v23 = 876;
        v24 = 2080;
        v25 = "-[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]";
        v26 = 2113;
        v27 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if (objc_msgSend(a4, "count"))
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "MessageType", 0xDuLL);
    if (cmio_XPCMessageSetCFString(v11, "param1", a3))
    {
      v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:].cold.3();
      }
    }
    else
    {
      v14 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyValues:", a4);
      if (v14)
      {
        v15 = v14;
        xpc_dictionary_set_value(v11, "param2", v14);
        xpc_release(v15);
        dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
        connection = self->_connection;
        queue = self->_queue;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke;
        v19[3] = &unk_250458228;
        v19[4] = self;
        v19[5] = a5;
        xpc_connection_send_message_with_reply(connection, v11, queue, v19);
        goto LABEL_19;
      }
      v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:].cold.2();
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
LABEL_19:
    xpc_release(v11);
    return;
  }
  v13 = CMIOLog();
  if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:].cold.1();
  (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -1, 0));
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)availableStreamPropertiesWithStreamID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 946;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x14uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:].cold.1();
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke;
    v13[3] = &unk_250458228;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  NSObject *v8;
  const char *v9;
  CFTypeRef cf;
  _BYTE v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      cf = 0;
      cmio_XPCMessageCopyCFArray(a2, "param1", (NSObject **)&cf);
      if (cf)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
        CFRelease(cf);
        cf = 0;
      }
      else
      {
        v8 = CMIOLog();
        if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
          __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v11);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_4();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)streamPropertyStatesWithStreamID:(id)a3 properties:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v19 = 1024;
        v20 = 1009;
        v21 = 2080;
        v22 = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]";
        v23 = 2113;
        v24 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0x15uLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:].cold.2();
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    if (a4)
    {
      if (cmio_XPCMessageSetCFArray(v11, "param2", (CFTypeRef)objc_msgSend(a4, "allObjects")))
      {
        v13 = CMIOLog();
        if (v13)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:].cold.1();
        }
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke;
    v16[3] = &unk_250458228;
    v16[4] = self;
    v16[5] = a5;
    xpc_connection_send_message_with_reply(connection, v11, queue, v16);
  }
  xpc_release(v11);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  xpc_object_t value;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  _BYTE v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 != MEMORY[0x24BDACFA0])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_5();
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_24;
    }
    value = xpc_dictionary_get_value(a2, "param1");
    if (value)
    {
      if (+[CMIOExtensionPropertyState copyPropertyStatesFromXPCDictionary:](CMIOExtensionPropertyState, "copyPropertyStatesFromXPCDictionary:", value))
      {
        goto LABEL_23;
      }
      v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_4((uint64_t)v12, (uint64_t)v13);
      }
    }
    else
    {
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_3((uint64_t)v10, (uint64_t)v13);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
LABEL_23:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
    __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_2();
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setStreamPropertyValuesWithStreamID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  CFIndex v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *ValueAtIndex;
  xpc_object_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  OS_xpc_object *connection;
  NSObject *queue;
  NSObject *v28;
  id v29;
  id v30;
  CMIOExtensionProviderHostContext *v31;
  id v32;
  _QWORD handler[6];
  CFArrayRef theArray;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v37 = 1024;
        v38 = 1081;
        v39 = 2080;
        v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
        v41 = 2113;
        v42 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"))
    || objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration")))
  {
    v11 = CMIOLog();
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        *(_DWORD *)buf = 136315906;
        v36 = v13;
        v37 = 1024;
        v38 = 1085;
        v39 = 2080;
        v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
        v41 = 2112;
        v42 = a4;
        _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SetProperty - %@", buf, 0x26u);
      }
    }
    theArray = 0;
    v14 = FigCopyBacktrace();
    if (v14 >= 1 && theArray != 0)
    {
      v29 = a3;
      v30 = a4;
      v31 = self;
      v32 = a5;
      v16 = 0;
      do
      {
        v17 = CMIOLog();
        if (v17)
        {
          v18 = v17;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v16);
            *(_DWORD *)buf = 136315907;
            v36 = v19;
            v37 = 1024;
            v38 = 1090;
            v39 = 2080;
            v40 = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]";
            v41 = 2113;
            v42 = ValueAtIndex;
            _os_log_impl(&dword_2330C2000, v18, OS_LOG_TYPE_DEFAULT, "%s:%d:%s backtrace %{private}@", buf, 0x26u);
          }
        }
        ++v16;
      }
      while (v14 != v16);
      self = v31;
    }
  }
  if (objc_msgSend(a4, "count", v29, v30, v31, v32))
  {
    v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v21, "MessageType", 0x16uLL);
    if (cmio_XPCMessageSetCFString(v21, "param1", a3))
    {
      v22 = CMIOLog();
      if (v22)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:].cold.3();
      }
    }
    else
    {
      v24 = +[CMIOExtensionPropertyState copyXPCDictionaryFromPropertyValues:](CMIOExtensionPropertyState, "copyXPCDictionaryFromPropertyValues:", a4);
      if (v24)
      {
        v25 = v24;
        xpc_dictionary_set_value(v21, "param2", v24);
        xpc_release(v25);
        dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
        connection = self->_connection;
        queue = self->_queue;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke;
        handler[3] = &unk_250458228;
        handler[4] = self;
        handler[5] = a5;
        xpc_connection_send_message_with_reply(connection, v21, queue, handler);
        goto LABEL_34;
      }
      v28 = CMIOLog();
      if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:].cold.2();
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
LABEL_34:
    xpc_release(v21);
    return;
  }
  v23 = CMIOLog();
  if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:].cold.1();
  (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -1, 0));
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)startStreamWithStreamID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 1167;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x17uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:].cold.1();
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke;
    v13[3] = &unk_250458228;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)stopStreamWithStreamID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  xpc_object_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CMIOExtensionProviderHostContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v16 = 1024;
        v17 = 1217;
        v18 = 2080;
        v19 = "-[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:]";
        v20 = 2113;
        v21 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "MessageType", 0x18uLL);
  if (cmio_XPCMessageSetCFString(v9, "param1", a3))
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:].cold.1();
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
    connection = self->_connection;
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke;
    v13[3] = &unk_250458228;
    v13[4] = self;
    v13[5] = a4;
    xpc_connection_send_message_with_reply(connection, v9, queue, v13);
  }
  xpc_release(v9);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)refreshExtensionConnection
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  pid_t pid;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  pid_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      pid = xpc_connection_get_pid(self->_connection);
      v7 = 136316163;
      v8 = v5;
      v9 = 1024;
      v10 = 1267;
      v11 = 2080;
      v12 = "-[CMIOExtensionProviderHostContext refreshExtensionConnection]";
      v13 = 2082;
      v14 = "-[CMIOExtensionProviderHostContext refreshExtensionConnection]";
      v15 = 1025;
      v16 = pid;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}s for connection(%{private}d)", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[CMIOExtensionProviderHostContext sendEmptyClientInfo](self, "sendEmptyClientInfo");
}

- (void)sendEmptyClientInfo
{
  NSObject *v3;
  NSObject *v4;
  xpc_object_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionProviderHostContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315907;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v8 = 1024;
        v9 = 1273;
        v10 = 2080;
        v11 = "-[CMIOExtensionProviderHostContext sendEmptyClientInfo]";
        v12 = 2113;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "MessageType", 5uLL);
  xpc_connection_send_message_with_reply(self->_connection, v5, (dispatch_queue_t)self->_queue, &__block_literal_global_27);
  xpc_release(v5);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  if (a2)
  {
    v3 = MEMORY[0x23492FDC4](a2);
    if (v3 == MEMORY[0x24BDACFB8])
    {
      v5 = CMIOLog();
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_1();
    }
    else if (v3 == MEMORY[0x24BDACFA0])
    {
      if (xpc_dictionary_get_int64(a2, "errorReturn"))
      {
        v6 = CMIOLog();
        if (v6)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_2();
        }
      }
    }
    else
    {
      v4 = CMIOLog();
      if (v4)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_3();
      }
    }
  }
}

- (void)captureAsyncStillImageWithStreamID:(id)a3 uniqueID:(int64_t)a4 options:(id)a5 reply:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  xpc_object_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v19[6];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMIOExtensionProviderHostContext *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v11 = CMIOLog();
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v22 = 1024;
        v23 = 1300;
        v24 = 2080;
        v25 = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]";
        v26 = 2113;
        v27 = self;
        _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "MessageType", 0x1AuLL);
  if (cmio_XPCMessageSetCFString(v13, "param1", a3))
  {
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:].cold.3();
  }
  else if (cmio_XPCMessageSetCFNumber(v13, "param2", (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4)))
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:].cold.2();
  }
  else
  {
    if (!a5 || !cmio_XPCMessageSetCFDictionary(v13, "param3", a5))
    {
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke;
      v19[3] = &unk_250458228;
      v19[4] = self;
      v19[5] = a6;
      xpc_connection_send_message_with_reply(connection, v13, queue, v19);
      goto LABEL_16;
    }
    v16 = CMIOLog();
    if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:].cold.1();
  }
  (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
LABEL_16:
  xpc_release(v13);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;
  NSObject *v8;
  const char *v9;
  _BYTE v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      FigXPCMessageCreateBlockBufferData();
      v8 = CMIOLog();
      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_3((uint64_t)v9, (uint64_t)v10);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_4();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)enqueueReactionEffect:(id)a3 reactionType:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  OS_xpc_object *connection;
  NSObject *queue;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProviderHostContext *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v9 = CMIOLog();
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v19 = 1024;
        v20 = 1390;
        v21 = 2080;
        v22 = "-[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]";
        v23 = 2113;
        v24 = self;
        _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "MessageType", 0x1CuLL);
  if (cmio_XPCMessageSetCFString(v11, "param1", a3))
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:].cold.2();
  }
  else
  {
    if (!cmio_XPCMessageSetCFString(v11, "param2", a4))
    {
      dispatch_group_enter((dispatch_group_t)self->_transactionGroup);
      connection = self->_connection;
      queue = self->_queue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke;
      v16[3] = &unk_250458228;
      v16[4] = self;
      v16[5] = a5;
      xpc_connection_send_message_with_reply(connection, v11, queue, v16);
      goto LABEL_16;
    }
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:].cold.1();
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -5, 0));
LABEL_16:
  xpc_release(v11);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int int64;

  v4 = MEMORY[0x23492FDC4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_2();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "errorReturn");
    if (int64)
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], int64, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
      __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_3();
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)completeTransaction
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
  CMIOExtensionProviderHostContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315907;
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v10 = 1024;
        v11 = 1451;
        v12 = 2080;
        v13 = "-[CMIOExtensionProviderHostContext completeTransaction]";
        v14 = 2113;
        v15 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ will", (uint8_t *)&v8, 0x26u);
      }
    }
  }
  dispatch_group_wait((dispatch_group_t)self->_transactionGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (CMIOModuleLogLevel_once_1 != -1)
    dispatch_once(&CMIOModuleLogLevel_once_1, &__block_literal_global_145);
  if (CMIOModuleLogLevel_cmioLevel_1 >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        v8 = 136315907;
        v9 = v7;
        v10 = 1024;
        v11 = 1455;
        v12 = 2080;
        v13 = "-[CMIOExtensionProviderHostContext completeTransaction]";
        v14 = 2113;
        v15 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@ did", (uint8_t *)&v8, 0x26u);
      }
    }
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (CMIOExtensionProviderHostDelegate)delegate
{
  return (CMIOExtensionProviderHostDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__CMIOExtensionProviderHostContext_initWithConnection_delegate___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const char *v6;
  __int16 v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  v9 = 136316162;
  v10 = v6;
  v11 = 1024;
  OUTLINED_FUNCTION_8();
  v12 = "-[CMIOExtensionProviderHostContext initWithConnection:delegate:]_block_invoke";
  v13 = v7;
  v14 = v8;
  v15 = 2114;
  v16 = a2;
  _os_log_error_impl(&dword_2330C2000, a3, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] received %{public}@", (uint8_t *)&v9, 0x2Cu);
}

- (void)handleClientMessageWithConnection:message:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Unknown message type %lld", v2);
  OUTLINED_FUNCTION_2();
}

- (void)availableDevicesChanged:message:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamsChanged:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)availableStreamsChanged:message:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)pluginPropertiesChanged:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pluginPropertiesChanged:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertiesChanged:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString faileddeviceID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertiesChanged:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertiesChanged:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertiesChanged:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertiesChanged:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertiesChanged:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v2, v3, v4, v5, v6);
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
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

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedSample:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s CMIOExtensionSample creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pullSample:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pullSample:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_create_reply failedreply == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[20];
  const char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v3 = "-[CMIOExtensionProviderHostContext pullSample:message:]_block_invoke";
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s pullSample failed %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __55__CMIOExtensionProviderHostContext_pullSample_message___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduledOutputChanged:message:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s cmio_XPCMessageCopyCFString failedstreamID == NULL == true ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduledOutputChanged:message:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s xpc_dictionary_get_value failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduledOutputChanged:message:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s CMIOExtensionScheduledOutput creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availablePluginProperties:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 402);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availablePluginProperties:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)pluginStates:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

- (void)pluginStates:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

- (void)pluginStates:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 451);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

- (void)pluginStates:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 455);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginStates:]";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

- (void)pluginStates:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_24_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[20];
  const char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v3 = "-[CMIOExtensionProviderHostContext pluginStates:]_block_invoke";
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error received %@", v2);
  OUTLINED_FUNCTION_2();
}

void __49__CMIOExtensionProviderHostContext_pluginStates___block_invoke_25_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error received %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)pluginPropertyStatesForProperties:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2);
  OUTLINED_FUNCTION_2();
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 567);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 571);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)setPluginPropertyValues:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setPluginPropertyValues:reply:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)availableDevicePropertiesWithDeviceID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 697);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availableDevicePropertiesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)deviceStatesWithDeviceID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 755);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 759);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

void __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_26_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed at index %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertyStatesWithDeviceID:properties:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)devicePropertyStatesWithDeviceID:properties:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 847);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 851);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext devicePropertyStatesWithDeviceID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setDevicePropertyValuesWithDeviceID:propertyValues:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setDevicePropertyValuesWithDeviceID:propertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)availableStreamPropertiesWithStreamID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 988);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext availableStreamPropertiesWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s cmio_XPCMessageCopyCFArray failed", v5);
}

void __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)streamPropertyStatesWithStreamID:properties:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)streamPropertyStatesWithStreamID:properties:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1052);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s xpc_dictionary_get_value for param1 failed", v5);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1056);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext streamPropertyStatesWithStreamID:properties:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s copyPropertyStatesFromXPCDictionary failed", v5);
}

void __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Setting an empty dictionary is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s copyXPCDictionaryFromPropertyValues failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setStreamPropertyValuesWithStreamID:propertyValues:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext setStreamPropertyValuesWithStreamID:propertyValues:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)startStreamWithStreamID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext startStreamWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)stopStreamWithStreamID:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext stopStreamWithStreamID:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[20];
  const char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v3 = "-[CMIOExtensionProviderHostContext sendEmptyClientInfo]_block_invoke";
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s received %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_2330C2000, v0, v1, "%s:%d:%s error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__CMIOExtensionProviderHostContext_sendEmptyClientInfo__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[20];
  const char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v3 = "-[CMIOExtensionProviderHostContext sendEmptyClientInfo]_block_invoke";
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s unknown type %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFDictionary failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)captureAsyncStillImageWithStreamID:uniqueID:options:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_12_1(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_13_0(v2, 1365);
  *(_QWORD *)(v3 + 20) = "-[CMIOExtensionProviderHostContext captureAsyncStillImageWithStreamID:uniqueID:options:reply:]_block_invoke";
  OUTLINED_FUNCTION_8_1(&dword_2330C2000, v4, (uint64_t)v4, "%s:%d:%s Create still sample buffer from serialized block buffer failed", v5);
}

void __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

- (void)enqueueReactionEffect:reactionType:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

- (void)enqueueReactionEffect:reactionType:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFString failed", v2);
  OUTLINED_FUNCTION_2();
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProviderHostContext enqueueReactionEffect:reactionType:reply:]_block_invoke";
  OUTLINED_FUNCTION_10_1(v7, v8, v6);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s received %{public}@", v10);
}

void __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_7_3(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s unknown type %{public}@", v10);
}

@end
