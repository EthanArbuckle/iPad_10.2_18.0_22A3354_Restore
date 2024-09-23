@implementation CBXpcConnection

- (void)_handleConnectionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id WeakRetained;

  v4 = a3;
  v5 = MEMORY[0x1A85D2194]();
  if (v5 == MEMORY[0x1E0C812F8])
  {
    -[CBXpcConnection _handleMsg:](self, "_handleMsg:", v4);

  }
  else if (v5 == MEMORY[0x1E0C81310])
  {
    if (v4 == (id)MEMORY[0x1E0C81258])
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
        -[CBXpcConnection _handleReset](self, "_handleReset");
      else
        -[CBXpcConnection _handleFinalized](self, "_handleFinalized");
LABEL_6:

      return;
    }
    if (v4 == (id)MEMORY[0x1E0C81260])
    {
      -[CBXpcConnection _handleInvalid](self, "_handleInvalid");

    }
    else
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      -[CBXpcConnection _handleConnectionEvent:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v6 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    -[CBXpcConnection _handleConnectionEvent:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
}

- (void)_handleMsg:(id)a3
{
  id v4;
  unsigned __int16 int64;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *eventQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int16 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  xpc_dictionary_get_value(v4, "kCBMsgArgs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    CBXpcCreateNSDictionaryWithXpcDictionary(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!IsAppleInternalBuild())
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
    if (!IsAppleInternalBuild())
      goto LABEL_8;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v9 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", int64);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1A82A2000, v10, OS_LOG_TYPE_DEBUG, "Received XPC message %@: %@", buf, 0x16u);

    if (int64 == 5)
      goto LABEL_9;
LABEL_11:
    eventQueue = self->_eventQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __30__CBXpcConnection__handleMsg___block_invoke;
    v13[3] = &unk_1E5402310;
    v13[4] = self;
    v16 = int64;
    v14 = v8;
    v15 = v4;
    dispatch_async(eventQueue, v13);

    goto LABEL_12;
  }
LABEL_8:
  if (int64 != 5)
    goto LABEL_11;
LABEL_9:
  -[CBXpcConnection _handleFinalized](self, "_handleFinalized");
LABEL_12:

}

- (void)_handleFinalized
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1A82A2000, v0, v1, "XPC connection finalized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionEvent:", a2);
}

- (void)disconnect
{
  id whbReplyHandler;
  id v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[CBXpcConnection _checkOut](self, "_checkOut");
  whbReplyHandler = self->_whbReplyHandler;
  self->_whbReplyHandler = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)_checkOut
{
  -[CBXpcConnection sendMsg:args:](self, "sendMsg:args:", 2, 0);
}

void __33__CBXpcConnection__handleInvalid__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "xpcConnectionIsInvalid");

}

uint64_t __30__CBXpcConnection__handleMsg___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcConnectionDidReceiveMsg:args:", *(unsigned __int16 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (CBXpcConnectionDelegate)delegate
{
  return (CBXpcConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CBXpcConnection)initWithDelegate:(id)a3 queue:(id)a4 options:(id)a5 sessionType:(int)a6
{
  id v10;
  id v11;
  id v12;
  CBXpcConnection *v13;
  CBXpcConnection *v14;
  NSObject *v15;
  CBXpcConnection *v16;
  id v17;
  const char *v18;
  const char *v19;
  const char *label;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *eventQueue;
  NSMutableDictionary *v24;
  NSMutableDictionary *options;
  dispatch_qos_class_t qos_class;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  OS_dispatch_queue *v31;
  OS_dispatch_queue *xpcQueue;
  dispatch_queue_t v33;
  OS_dispatch_queue *v34;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  void *v37;
  void *v38;
  _xpc_connection_s *v39;
  _QWORD block[4];
  CBXpcConnection *v42;
  _QWORD handler[4];
  CBXpcConnection *v44;
  int relative_priority_ptr;
  objc_super v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v46.receiver = self;
  v46.super_class = (Class)CBXpcConnection;
  v13 = -[CBXpcConnection init](&v46, sel_init);
  if (v13)
  {
    v14 = v13;
    if (v11)
    {
      v15 = v11;
    }
    else
    {
      v15 = MEMORY[0x1E0C80D38];
      v17 = MEMORY[0x1E0C80D38];
    }
    objc_storeWeak((id *)&v14->_delegate, v10);
    if (MGGetBoolAnswer())
    {
      v18 = "com.apple.server.bluetooth.le.att.xpc";
      if (a6 == 3)
        v18 = "com.apple.server.bluetooth.classic.xpc";
      if (a6 == 2)
        v19 = "com.apple.server.bluetooth.le.pipe.xpc";
      else
        v19 = v18;
      label = dispatch_queue_get_label(v15);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = dispatch_queue_create_with_target_V2(label, v21, v15);
      eventQueue = v14->_eventQueue;
      v14->_eventQueue = (OS_dispatch_queue *)v22;

      if (v12)
        v24 = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
      else
        v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      options = v14->_options;
      v14->_options = v24;

      v14->_sessionType = a6;
      relative_priority_ptr = 0;
      qos_class = dispatch_queue_get_qos_class(v15, &relative_priority_ptr);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v27 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v27, qos_class, relative_priority_ptr);
      v28 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)dispatch_workloop_copy_current();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
        xpcQueue = v14->_xpcQueue;
        v14->_xpcQueue = v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.CoreBluetooth.%@"), objc_opt_class());
        xpcQueue = (OS_dispatch_queue *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v33 = dispatch_queue_create((const char *)-[OS_dispatch_queue UTF8String](xpcQueue, "UTF8String"), v28);
        v34 = v14->_xpcQueue;
        v14->_xpcQueue = (OS_dispatch_queue *)v33;

      }
      mach_service = xpc_connection_create_mach_service(v19, (dispatch_queue_t)v14->_xpcQueue, 0);
      xpcConnection = v14->_xpcConnection;
      v14->_xpcConnection = mach_service;

      v14->_uiAppIsBackgrounded = 0;
      if (NSClassFromString(CFSTR("UIApplication")))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObserver:selector:name:object:", v14, sel__applicationDidEnterBackgroundNotification, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObserver:selector:name:object:", v14, sel__applicationWillEnterForegroundNotification, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

      }
      v39 = v14->_xpcConnection;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke;
      handler[3] = &unk_1E53FFB40;
      v16 = v14;
      v44 = v16;
      xpc_connection_set_event_handler(v39, handler);
      xpc_connection_resume(v14->_xpcConnection);
      v16->_xpcConnectionConnected = 0;

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2;
      block[3] = &unk_1E53FF780;
      v42 = v14;
      dispatch_async(v15, block);

      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_checkIn
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *options;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", getprogname());
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  options = self->_options;
  v11[0] = CFSTR("kCBMsgArgOptions");
  v11[1] = CFSTR("kCBMsgArgName");
  v12[0] = options;
  v12[1] = v7;
  v11[2] = CFSTR("kCBMsgArgType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sessionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("kCBMsgArgVersion");
  v12[2] = v9;
  v12[3] = &unk_1E54238F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendMsg:args:](self, "sendMsg:args:", 1, v10);

}

- (void)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v4, v6);
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEBUG, "Sending XPC message %@: %@", (uint8_t *)&v11, 0x16u);

    xpc_connection_send_message(self->_xpcConnection, v7);
    if (!self->_uiAppIsBackgrounded)
      goto LABEL_6;
    goto LABEL_5;
  }
  xpc_connection_send_message(self->_xpcConnection, v7);
  if (self->_uiAppIsBackgrounded)
LABEL_5:
    -[CBXpcConnection _sendBarrier](self, "_sendBarrier");
LABEL_6:

}

- (id)_allocXpcMsg:(unsigned __int16)a3 args:(id)a4
{
  unsigned int v4;
  id v5;
  size_t v6;
  xpc_object_t v7;
  xpc_object_t v9;
  id v10;
  char *keys[2];
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  *(_OWORD *)keys = xmmword_1E54022F8;
  v10 = 0;
  v9 = xpc_int64_create(v4);
  if (v5)
  {
    CBXpcCreateXPCDictionaryWithNSDictionary(v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  v7 = xpc_dictionary_create((const char *const *)keys, &v9, v6);

  return v7;
}

- (void)_handleInvalid
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "XPC connection invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_whbRemoteToLocalUuidMap, 0);
  objc_storeStrong(&self->_whbReplyHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

void __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "xpcConnectionIsInvalid");

}

- (id)getEventQueue
{
  return self->_eventQueue;
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  OS_dispatch_queue *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  OS_dispatch_queue *xpcQueue;
  void *v12;
  xpc_object_t v13;
  void *v14;
  OS_dispatch_queue *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  OS_dispatch_queue *v23;
  __int16 v24;
  OS_dispatch_queue *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = (OS_dispatch_queue *)a4;
  v7 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v4, v6);
  if ((_DWORD)v4 != 63)
  {
    if (CBLogInitOnce == -1)
    {
      v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
    }
    v9 = v12;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEBUG, "Sending synchronous XPC message %@: %@", (uint8_t *)&v20, 0x16u);
    goto LABEL_5;
  }
  if (CBLogInitOnce == -1)
  {
    v8 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_4;
  }
  dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    v9 = v8;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", 63);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    xpcQueue = self->_xpcQueue;
    v20 = 138412803;
    v21 = v10;
    v22 = 2112;
    v23 = xpcQueue;
    v24 = 2113;
    v25 = v6;
    _os_log_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEFAULT, "Sending synchronous XPC message %@ : on %@ with args: %{private}@", (uint8_t *)&v20, 0x20u);
LABEL_5:

  }
LABEL_8:
  v13 = xpc_connection_send_message_with_reply_sync(self->_xpcConnection, v7);
  v14 = v13;
  if (v13)
  {
    CBXpcCreateNSDictionaryWithXpcDictionary(v13);
    v15 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce == -1)
      goto LABEL_10;
LABEL_13:
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v16 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
LABEL_14:
    v18 = v16;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v19;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_1A82A2000, v18, OS_LOG_TYPE_DEBUG, "Received synchronous XPC reply %@: %@", (uint8_t *)&v20, 0x16u);

    goto LABEL_11;
  }
  v15 = 0;
  if (CBLogInitOnce != -1)
    goto LABEL_13;
LABEL_10:
  v16 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    goto LABEL_14;
LABEL_11:

  return v15;
}

- (void)sendMsgWithReply:(unsigned __int16)a3 args:(id)a4 replyBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  OS_xpc_object *xpcConnection;
  NSObject *eventQueue;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v6, v8);
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v11 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v15 = v11;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v16;
    v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_1A82A2000, v15, OS_LOG_TYPE_DEBUG, "Sending XPC message w/ reply %@: %@", buf, 0x16u);

  }
  xpcConnection = self->_xpcConnection;
  eventQueue = self->_eventQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke;
  handler[3] = &unk_1E5400778;
  v18 = v9;
  v14 = v9;
  xpc_connection_send_message_with_reply(xpcConnection, v10, eventQueue, handler);

}

void __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  CBXpcCreateNSDictionaryWithXpcDictionary(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v5, v6);
}

- (void)forwardWhbMsg:(unsigned __int16)a3 args:(id)a4 cnx:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  xpc_object_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  xpc_object_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = convertToWhbMsgId(v6);
  if (v10)
  {
    xpc_dictionary_set_int64(v9, "kCBMsgId", v10);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("kCBMsgArgDeviceUUID"));
      objc_msgSend(v8, "peerDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("kCBMsgArgDeviceUUID"));

      CBXpcCreateXPCDictionaryWithNSDictionary(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v9, "kCBMsgArgs", v14);

    }
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v15 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1A82A2000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding WHB XPC message %@: %@", (uint8_t *)&v16, 0x16u);
    }
    objc_msgSend(v8, "xpcForwardMessage:", v9);
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBXpcConnection forwardWhbMsg:args:cnx:].cold.1();
  }

}

- (void)didReceiveForwardedMessage:(id)a3
{
  id v4;
  __int16 int64;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  v6 = convertToCBMsgId(int64);
  if ((_DWORD)v6)
  {
    v7 = v6;
    xpc_dictionary_get_value(v4, "kCBMsgArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v10, "valueForKey:", CFSTR("kCBMsgArgDeviceUUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "valueForKey:", CFSTR("kCBMsgArgDeviceUUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v11, "removeObjectForKey:", CFSTR("kCBMsgArgDeviceUUID"));
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14);
          objc_msgSend(v11, "setValue:forKey:", v15, CFSTR("kCBMsgArgDeviceUUID"));

        }
        v16 = v11;

      }
      else
      {
        v16 = v10;
      }

    }
    else
    {
      v16 = 0;
    }
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v17 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v19;
      v22 = 2112;
      v23 = v16;
      _os_log_debug_impl(&dword_1A82A2000, v18, OS_LOG_TYPE_DEBUG, "WHB forwarded (Initiator->Receiver bluetoothd) msg %@, args %@", (uint8_t *)&v20, 0x16u);

    }
    -[CBXpcConnection sendMsg:args:](self, "sendMsg:args:", v7, v16);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBXpcConnection didReceiveForwardedMessage:].cold.1();
  }

}

- (void)didReceiveForwardedDelegateCallbackMessage:(id)a3
{
  id v4;
  xpc_object_t v5;
  __int16 int64;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  v7 = convertToCBMsgId(int64);
  if ((_DWORD)v7)
  {
    v8 = v7;
    xpc_dictionary_set_int64(v5, "kCBMsgId", v7);
    xpc_dictionary_get_value(v4, "kCBMsgArgs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForKey:", CFSTR("kCBMsgArgDeviceUUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBXpcConnection getWhbLocalIdForRemoteId:](self, "getWhbLocalIdForRemoteId:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v13, "removeObjectForKey:", CFSTR("kCBMsgArgDeviceUUID"));
      objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("kCBMsgArgDeviceUUID"));
      CBXpcCreateXPCDictionaryWithNSDictionary(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v5, "kCBMsgArgs", v14);
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v15 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        v16 = v15;
        -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v17;
        v21 = 2112;
        v22 = v13;
        _os_log_debug_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEBUG, "WHB reply (Receiver->Initiator) msg %@ %@", buf, 0x16u);

      }
    }
    -[CBXpcConnection _handleMsg:](self, "_handleMsg:", v5);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBXpcConnection didReceiveForwardedDelegateCallbackMessage:].cold.1();
  }

}

- (void)setWhbReplyHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id whbReplyHandler;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__CBXpcConnection_setWhbReplyHandler___block_invoke;
  v8[3] = &unk_1E54022D8;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A85D1CE4](v8);
  whbReplyHandler = self->_whbReplyHandler;
  self->_whbReplyHandler = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t v4;
  unsigned __int16 int64;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id WeakRetained;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = xpc_dictionary_create(0, 0, 0);
  int64 = xpc_dictionary_get_int64(v3, "kCBMsgId");
  v6 = convertToWhbMsgId(int64);
  if ((_DWORD)v6)
  {
    v7 = v6;
    xpc_dictionary_set_int64(v4, "kCBMsgId", v6);
    xpc_dictionary_get_value(v3, "kCBMsgArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v10, "valueForKey:", CFSTR("kCBMsgArgDeviceUUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "valueForKey:", CFSTR("kCBMsgArgDeviceUUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v11, "removeObjectForKey:", CFSTR("kCBMsgArgDeviceUUID"));
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setValue:forKey:", v15, CFSTR("kCBMsgArgDeviceUUID"));

        }
        v16 = v11;

      }
      else
      {
        v16 = v10;
      }

      CBXpcCreateXPCDictionaryWithNSDictionary(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v4, "kCBMsgArgs", v17);
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v18 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        v19 = v18;
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_nameForMessage:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v21;
        v24 = 2112;
        v25 = v10;
        _os_log_debug_impl(&dword_1A82A2000, v19, OS_LOG_TYPE_DEBUG, "WhbReplyHandler w/ msgId %@ args %@", (uint8_t *)&v22, 0x16u);

      }
    }
    else
    {
      v16 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1();
  }

}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *whbRemoteToLocalUuidMap;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_whbRemoteToLocalUuidMap)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    whbRemoteToLocalUuidMap = self->_whbRemoteToLocalUuidMap;
    self->_whbRemoteToLocalUuidMap = v8;

  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v10 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1A82A2000, v10, OS_LOG_TYPE_DEFAULT, "Started tracking Whb localId %@ with remoteId %@", (uint8_t *)&v11, 0x16u);
  }
  -[NSMutableDictionary setValue:forKey:](self->_whbRemoteToLocalUuidMap, "setValue:forKey:", v6, v7);

}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->_whbRemoteToLocalUuidMap, "valueForKey:", a3);
}

- (void)removeWhbRemoteId:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A82A2000, v5, OS_LOG_TYPE_DEFAULT, "Removing tracking of remoteId %@", (uint8_t *)&v6, 0xCu);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_whbRemoteToLocalUuidMap, "removeObjectForKey:", v4);

}

- (void)connect
{
  if (!self->_xpcConnectionConnected)
  {
    self->_xpcConnectionConnected = 1;
    -[CBXpcConnection _checkIn](self, "_checkIn");
    -[NSMutableDictionary removeObjectForKey:](self->_options, "removeObjectForKey:", CFSTR("kCBInitOptionShowPowerAlert"));
  }
}

- (void)setTargetQueue:(id)a3
{
  NSObject *xpcQueue;
  OS_xpc_object *xpcConnection;
  id v5;

  xpcQueue = a3;
  if (!a3)
    xpcQueue = self->_xpcQueue;
  xpcConnection = self->_xpcConnection;
  v5 = a3;
  xpc_connection_set_target_queue(xpcConnection, xpcQueue);

}

- (void)_sendBarrier
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1A82A2000, v0, v1, "Sending XPC barrier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

intptr_t __31__CBXpcConnection__sendBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_nameForMessage:(unsigned __int16)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_handleReset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "XPC connection interrupted, resetting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __31__CBXpcConnection__handleReset__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_checkIn");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcConnectionDidReset");

}

- (void)_applicationDidEnterBackgroundNotification
{
  self->_uiAppIsBackgrounded = 1;
  -[CBXpcConnection _sendBarrier](self, "_sendBarrier");
}

- (void)_applicationWillEnterForegroundNotification
{
  self->_uiAppIsBackgrounded = 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)forwardWhbMsg:args:cnx:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A82A2000, v0, v1, "Invalid WHMsgId %d. Ignoring forwarding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)didReceiveForwardedMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A82A2000, v0, v1, "Invalid CBMsgId %d. Ignoring receive forwarding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)didReceiveForwardedDelegateCallbackMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A82A2000, v0, v1, "Invalid CBMsgId %d. Ignoring XPC msg", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8(&dword_1A82A2000, v0, v1, "Invalid WHBMsgId %d. Ignoring reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A82A2000, a2, a3, "Unexpected XPC error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A82A2000, a2, a3, "Unexpected XPC event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
