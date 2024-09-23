@implementation AVConferenceXPCClient

- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6
{
  uint64_t v7;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *registeredBlocks;
  XPCClientUser *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = *(_QWORD *)&a6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315906;
          v18 = v11;
          v19 = 2080;
          v20 = "-[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:]";
          v21 = 1024;
          v22 = 533;
          v23 = 2080;
          v24 = a3;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Adding registered block for service %s", (uint8_t *)&v17, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:].cold.1();
      }
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    if (!global_queue)
      global_queue = dispatch_get_global_queue(2, 0);
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    v16 = (XPCClientUser *)-[NSMutableDictionary objectForKeyedSubscript:](self->registeredBlocks, "objectForKeyedSubscript:", v14);
    if (!v16)
    {
      v16 = objc_alloc_init(XPCClientUser);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->registeredBlocks, "setObject:forKeyedSubscript:", v16, v14);

    }
    -[XPCClientUser setBlock:](v16, "setBlock:", a4);
    -[XPCClientUser setQueue:](v16, "setQueue:", global_queue);
    -[XPCClientUser setEventLogLevel:](v16, "setEventLogLevel:", v7);
    objc_sync_exit(registeredBlocks);

  }
}

- (id)newNSErrorFromNSDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
}

- (id)newNSDictionaryFromXPCDictionary:(id)a3
{
  if (!a3)
    return 0;
  xpc_dictionary_get_value(a3, "RESULTS");
  return (id)_CFXPCCreateCFObjectFromXPCObject();
}

xpc_object_t __39__AVConferenceXPCClient_copyConnection__block_invoke(uint64_t a1)
{
  xpc_object_t result;

  result = *(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    result = xpc_retain(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

+ (id)AVConferenceXPCClientSingleton
{
  void *v3;
  _BYTE *v4;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  v4 = (_BYTE *)_xpcClientSingleton;
  if (!_xpcClientSingleton)
  {
    v4 = objc_alloc_init((Class)a1);
    _xpcClientSingleton = (uint64_t)v4;
  }
  v4[40] = 1;
  objc_sync_exit(v3);
  return (id)_xpcClientSingleton;
}

- (AVConferenceXPCClient)init
{
  AVConferenceXPCClient *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *CustomRootQueue;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  AVConferenceXPCClient *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AVConferenceXPCClient;
  v2 = -[AVConferenceXPCClient init](&v14, sel_init);
  if (v2)
  {
    if ((AVConferenceXPCClient *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v16 = v4;
      v17 = 2080;
      v18 = "-[AVConferenceXPCClient init]";
      v19 = 1024;
      v20 = 85;
      v6 = "AVConferenceXPCClient [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[AVConferenceXPCClient performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316162;
      v16 = v9;
      v17 = 2080;
      v18 = "-[AVConferenceXPCClient init]";
      v19 = 1024;
      v20 = 85;
      v21 = 2112;
      v22 = v3;
      v23 = 2048;
      v24 = v2;
      v6 = "AVConferenceXPCClient [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->replyQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCClient.ReplyQueue", 0, CustomRootQueue);
    v12 = VCDispatchQueue_GetCustomRootQueue(37);
    v2->connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCClient.ConnectionQueue", MEMORY[0x1E0C80D50], v12);
    v2->registeredBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  uint64_t v15;
  id v16;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v8 = -[AVConferenceXPCClient newXPCDictionaryFromNSDictionary:error:](self, "newXPCDictionaryFromNSDictionary:error:", a4, 0);
  xpc_dictionary_set_string(v8, "API", a3);
  if (a5)
    xpc_dictionary_set_value(v8, "XPCARGUMENTS", a5);
  if (-[AVConferenceXPCClient connectionPersists](self, "connectionPersists"))
    xpc_dictionary_set_BOOL(v8, "USERPERSISTENT", 1);
  xpc_dictionary_set_BOOL(v8, "EXPECTSREPLY", 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v11 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315906;
        v22 = v9;
        v23 = 2080;
        v24 = "-[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:]";
        v25 = 1024;
        v26 = 485;
        v27 = 2080;
        v28 = a3;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending sync message to server for service: %s", (uint8_t *)&v21, 0x26u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:].cold.2();
    }
  }
  v13 = -[AVConferenceXPCClient copyConnection](self, "copyConnection");
  v14 = xpc_connection_send_message_with_reply_sync(v13, v8);
  v15 = MEMORY[0x1DF089754]();
  if (v15 == MEMORY[0x1E0C81310])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:].cold.1(v17, v14, v18);
    }
    v16 = -[AVConferenceXPCClient newServerDiedDictionary](self, "newServerDiedDictionary");
    -[AVConferenceXPCClient closeConnectionToServer](self, "closeConnectionToServer");
  }
  else
  {
    if (v15 == MEMORY[0x1E0C812F8])
    {
      v16 = -[AVConferenceXPCClient newNSDictionaryFromXPCDictionary:](self, "newNSDictionaryFromXPCDictionary:", v14);
      v19 = -[AVConferenceXPCClient newNSErrorFromNSDictionary:](self, "newNSErrorFromNSDictionary:", objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ERROR")));
      goto LABEL_22;
    }
    v16 = 0;
  }
  v19 = 0;
LABEL_22:
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v20, "addEntriesFromDictionary:", v16);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", xpc_dictionary_get_value(v14, "XPCARGUMENTS"), CFSTR("USERXPCARGUMENTS"));
  if (v19)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("ERROR"));

  xpc_release(v14);
  xpc_release(v8);
  xpc_release(v13);
  return v20;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7 replyLogLevel:(int)a8
{
  NSObject *global_queue;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _xpc_connection_s *v21;
  _QWORD v22[8];
  int v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  if (a3)
  {
    global_queue = a7;
    v15 = a4;
    v16 = -[AVConferenceXPCClient newXPCDictionaryFromNSDictionary:error:](self, "newXPCDictionaryFromNSDictionary:error:", a4, &v24);
    v17 = v16;
    if (v24)
    {
      if (v16)
        xpc_release(v16);
      if (a6)
        (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, v24);
    }
    else
    {
      if (a5)
        xpc_dictionary_set_value(v16, "XPCARGUMENTS", a5);
      if (-[AVConferenceXPCClient connectionPersists](self, "connectionPersists"))
        xpc_dictionary_set_BOOL(v17, "USERPERSISTENT", 1);

      xpc_dictionary_set_string(v17, "API", a3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        v20 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v26 = v18;
            v27 = 2080;
            v28 = "-[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:]";
            v29 = 1024;
            v30 = 403;
            v31 = 2080;
            v32 = a3;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending message to server for service: %s", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:].cold.1();
        }
      }
      v21 = -[AVConferenceXPCClient copyConnection](self, "copyConnection");
      if (a6)
      {
        if (!global_queue)
          global_queue = dispatch_get_global_queue(2, 0);
        dispatch_retain(global_queue);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke;
        v22[3] = &unk_1E9E56E78;
        v23 = a8;
        v22[4] = self;
        v22[5] = global_queue;
        v22[6] = a6;
        v22[7] = a3;
        xpc_dictionary_set_BOOL(v17, "EXPECTSREPLY", 1);
        xpc_retain(v17);
        xpc_connection_send_message_with_reply(v21, v17, (dispatch_queue_t)self->replyQueue, v22);
      }
      else
      {
        xpc_dictionary_set_BOOL(v17, "EXPECTSREPLY", 0);
        xpc_retain(v17);
        xpc_connection_send_message(v21, v17);
      }
      xpc_release(v17);
      xpc_release(v17);
      xpc_release(v21);
    }
  }
  else if (a6)
  {
    (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32031, 1, CFSTR("service is nil"), a6, a7, *(_QWORD *)&a8));
  }
}

- (id)newXPCDictionaryFromNSDictionary:(id)a3 error:(id *)a4
{
  id result;
  void *v6;

  if (!a3)
    return xpc_dictionary_create(0, 0, 0);
  result = (id)_CFXPCCreateXPCObjectFromCFObject();
  if (a4)
  {
    if (!result)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32031, 2, CFSTR("Failed to create XPC dictionary"));
      result = 0;
      *a4 = v6;
    }
  }
  return result;
}

- (id)copyConnection
{
  NSObject *connectionQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  connectionQueue = self->connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AVConferenceXPCClient_copyConnection__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(connectionQueue, block);
  v4 = (id)v8[5];
  if (!v4)
  {
    v4 = -[AVConferenceXPCClient createConnectionToServer](self, "createConnectionToServer");
    v8[5] = (uint64_t)v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)connectionPersists
{
  return self->connectionPersists;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6 queue:(id)a7
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:](self, "sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:", a3, a4, a5, a6, a7, 7);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5 queue:(id)a6
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:](self, "sendMessageAsync:arguments:xpcArguments:reply:queue:", a3, a4, 0, a5, a6);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:reply:queue:](self, "sendMessageAsync:arguments:reply:queue:", a3, a4, a5, 0);
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4
{
  return -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self, "sendMessageSync:arguments:xpcArguments:", a3, a4, 0);
}

- (id)createConnectionToServer
{
  NSObject *connectionQueue;
  void *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  connectionQueue = self->connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_barrier_sync(connectionQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)registerBlockForService:(char *)a3 block:(id)a4 queue:(id)a5
{
  -[AVConferenceXPCClient registerBlockForService:block:queue:eventLogLevel:](self, "registerBlockForService:block:queue:eventLogLevel:", a3, a4, a5, 7);
}

- (void)registerBlockForService:(char *)a3 block:(id)a4
{
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self, "registerBlockForService:block:queue:", a3, a4, 0);
}

xpc_object_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _xpc_connection_s *v12;
  xpc_object_t result;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    if (AVConferenceServer_ProcessIsAVConferenceServer())
      v3 = "com.apple.avconference.xpc";
    else
      v3 = "com.apple.videoconference.camera";
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v6;
        v17 = 2080;
        v18 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        v19 = 1024;
        v20 = 254;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: creating new connection to server", buf, 0x1Cu);
      }
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = xpc_connection_create_mach_service(v3, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 136316162;
        v16 = v8;
        v17 = 2080;
        v18 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        v19 = 1024;
        v20 = 257;
        v21 = 2080;
        v22 = v3;
        v23 = 2048;
        v24 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d name=%s, connection=%p", buf, 0x30u);
      }
    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_xpc_connection_s **)(v11 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56;
    handler[3] = &unk_1E9E561E0;
    handler[4] = v11;
    xpc_connection_set_event_handler(v12, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  result = xpc_retain(v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int ErrorLogLevelForModule;
  int v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1DF089754](a2);
  if (v4 == MEMORY[0x1E0C81310])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_5(v7, a2, v8);
    }
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "newServerDiedDictionary");
    objc_msgSend(*(id *)(a1 + 32), "closeConnectionToServer");
    v5 = 0;
  }
  else if (v4 == MEMORY[0x1E0C812F8])
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "newNSDictionaryFromXPCDictionary:", a2);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "newNSErrorFromNSDictionary:", objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ERROR")));
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = *(_DWORD *)(a1 + 64);
  if (v10 <= ErrorLogLevelForModule && v10 >= 1)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *(_DWORD *)(a1 + 64);
    if (v15 > 2)
    {
      if (v15 <= 4)
      {
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        goto LABEL_18;
      }
      if (v15 > 7)
      {
        if (v15 != 8)
          goto LABEL_14;
        v16 = *MEMORY[0x1E0CF2758];
        v17 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_4();
          goto LABEL_14;
        }
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
      }
      else
      {
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
      }
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315906;
      v21 = v14;
      v22 = 2080;
      v23 = "-[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:]_block_invoke";
      v24 = 1024;
      v25 = 429;
      v26 = 2080;
      v27 = v18;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", buf, 0x26u);
      goto LABEL_14;
    }
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
LABEL_18:
        __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_2();
    }
  }
LABEL_14:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_69;
  block[3] = &unk_1E9E53330;
  v12 = *(NSObject **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  block[5] = v5;
  block[6] = v13;
  block[4] = v6;
  dispatch_async(v12, block);

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  OS_xpc_object *connection;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  AVConferenceXPCClient *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((AVConferenceXPCClient *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVConferenceXPCClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[AVConferenceXPCClient dealloc]";
    v17 = 1024;
    v18 = 97;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = self;
    v6 = "AVConferenceXPCClient [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[AVConferenceXPCClient dealloc]";
      v17 = 1024;
      v18 = 97;
      v6 = "AVConferenceXPCClient [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  dispatch_release((dispatch_object_t)self->replyQueue);
  dispatch_release((dispatch_object_t)self->connectionQueue);

  connection = self->connection;
  if (connection)
  {
    xpc_release(connection);
    self->connection = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AVConferenceXPCClient;
  -[AVConferenceXPCClient dealloc](&v12, sel_dealloc);
}

- (id)newNSDictionaryFromNSError:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(a3, "code"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), CFSTR("ERROR_DOMAIN"), v4, CFSTR("ERROR_CODE"), objc_msgSend(a3, "userInfo"), CFSTR("ERROR_USERINFO"), 0);

  return v5;
}

- (id)newNSDictionaryFromNSDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = 0;
  while (1)
  {
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k_%d"), v5));
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v_%d"), v5));
    if (!v6 || v7 == 0)
      break;
    v5 = (v5 + 1);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);
  }
  return v4;
}

- (id)newServerDiedDictionary
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("SERVERDIED"), 0);
}

- (id)newTimeoutDictionary
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("TIMEOUT"), 0);
}

- (void)closeConnectionToServer
{
  NSObject *connectionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__AVConferenceXPCClient_closeConnectionToServer__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_barrier_async(connectionQueue, v3);
}

void __48__AVConferenceXPCClient_closeConnectionToServer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315650;
        v5 = v2;
        v6 = 2080;
        v7 = "-[AVConferenceXPCClient closeConnectionToServer]_block_invoke";
        v8 = 1024;
        v9 = 239;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: disposing off connection to server", (uint8_t *)&v4, 0x1Cu);
      }
    }
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t value;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int ErrorLogLevelForModule;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *string;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id obj;
  id obja;
  _QWORD v35[7];
  _QWORD block[6];
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1DF089754](a2);
  if (v3 == MEMORY[0x1E0C81310])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
        *(_DWORD *)buf = 136315906;
        v43 = v15;
        v44 = 2080;
        v45 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
        v46 = 1024;
        v47 = 272;
        v48 = 2080;
        v49 = (uint64_t)string;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Cannot talk to server because server died or parent deallocated, %s", buf, 0x26u);
      }
    }
    v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "newServerDiedDictionary");
    obja = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    objc_sync_enter(obja);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v39;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          v25 = objc_msgSend(v24, "block");
          v26 = objc_msgSend(v24, "queue");
          block[0] = v22;
          block[1] = 3221225472;
          block[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_57;
          block[3] = &unk_1E9E533D0;
          block[4] = v18;
          block[5] = v25;
          dispatch_async(v26, block);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v20);
    }
    objc_sync_exit(obja);

    objc_msgSend(*(id *)(a1 + 32), "closeConnectionToServer");
  }
  else
  {
    if (v3 != MEMORY[0x1E0C812F8])
      return;
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(a2, "API"));
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    objc_sync_enter(obj);
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v4);
    if (v5)
    {
      value = xpc_dictionary_get_value(a2, "XPCARGUMENTS");
      v7 = value;
      if (value)
      {
        xpc_retain(value);
        xpc_dictionary_set_value(a2, "XPCARGUMENTS", 0);
      }
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newNSDictionaryFromXPCDictionary:", a2);
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "newNSErrorFromNSDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR")));
      if (v7)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("USERXPCARGUMENTS"));
        xpc_release(v7);
      }
      v11 = objc_msgSend(v5, "block");
      v12 = objc_msgSend(v5, "queue");
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((int)objc_msgSend(v5, "eventLogLevel") > ErrorLogLevelForModule || (int)objc_msgSend(v5, "eventLogLevel") < 1)
        goto LABEL_43;
      objc_msgSend(v5, "eventLogLevel");
      v14 = VRTraceErrorLogLevelToCSTR();
      if ((int)objc_msgSend(v5, "eventLogLevel") <= 2)
      {
        if ((VRTraceIsOSFaultDisabled() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_3();
          goto LABEL_43;
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
LABEL_13:
          __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_2();
LABEL_43:
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_64;
        v35[3] = &unk_1E9E53330;
        v35[5] = v10;
        v35[6] = v11;
        v35[4] = v9;
        dispatch_async(v12, v35);

        objc_sync_exit(obj);
        return;
      }
      if ((int)objc_msgSend(v5, "eventLogLevel") <= 4)
      {
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        goto LABEL_13;
      }
      if ((int)objc_msgSend(v5, "eventLogLevel") > 7)
      {
        if ((int)objc_msgSend(v5, "eventLogLevel") > 8)
          goto LABEL_43;
        v30 = *MEMORY[0x1E0CF2758];
        v31 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_5();
          goto LABEL_43;
        }
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
      }
      else
      {
        v30 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_43;
      }
      *(_DWORD *)buf = 136315906;
      v43 = v14;
      v44 = 2080;
      v45 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke";
      v46 = 1024;
      v47 = 313;
      v48 = 2112;
      v49 = v4;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@", buf, 0x26u);
      goto LABEL_43;
    }
    objc_sync_exit(obj);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      v29 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v43 = v27;
          v44 = 2080;
          v45 = "-[AVConferenceXPCClient createConnectionToServer]_block_invoke_2";
          v46 = 1024;
          v47 = 328;
          v48 = 2112;
          v49 = v4;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: no registered block found for service %@", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_1();
      }
    }
  }
}

uint64_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_64(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sendMessageAsync:(char *)a3
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self, "sendMessageAsync:arguments:", a3, 0);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:reply:queue:](self, "sendMessageAsync:arguments:reply:queue:", a3, a4, 0, 0);
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 reply:(id)a6
{
  -[AVConferenceXPCClient sendMessageAsync:arguments:xpcArguments:reply:queue:](self, "sendMessageAsync:arguments:xpcArguments:reply:queue:", a3, a4, a5, a6, 0);
}

uint64_t __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_69(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)sendMessageSync:(char *)a3
{
  return -[AVConferenceXPCClient sendMessageSync:arguments:](self, "sendMessageSync:arguments:", a3, 0);
}

- (void)deregisterFromService:(char *)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *registeredBlocks;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v7 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315906;
          v11 = v5;
          v12 = 2080;
          v13 = "-[AVConferenceXPCClient deregisterFromService:]";
          v14 = 1024;
          v15 = 563;
          v16 = 2080;
          v17 = a3;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCClient [%s] %s:%d XPC Client: Removing registered block for service %s", (uint8_t *)&v10, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCClient deregisterFromService:].cold.1();
      }
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    -[NSMutableDictionary removeObjectForKey:](self->registeredBlocks, "removeObjectForKey:", v8);
    objc_sync_exit(registeredBlocks);

  }
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (NSMutableDictionary)registeredBlocks
{
  return self->registeredBlocks;
}

- (void)setConnectionPersists:(BOOL)a3
{
  self->connectionPersists = a3;
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: no registered block found for service %@");
  OUTLINED_FUNCTION_3();
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
  OUTLINED_FUNCTION_3();
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_10_14(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
  OUTLINED_FUNCTION_3();
}

void __49__AVConferenceXPCClient_createConnectionToServer__block_invoke_56_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: processing registered reply for service %@");
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  LODWORD(v5) = 403;
  OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending message to server for service: %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_13_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_13_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_10_14(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_13_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: executing reply block for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __91__AVConferenceXPCClient_sendMessageAsync_arguments_xpcArguments_reply_queue_replyLogLevel___block_invoke_cold_5(int a1, xpc_object_t xdict, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  v8 = 419;
  v9 = v4;
  v10 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, "AVConferenceXPCClient [%s] %s:%d XPC Client: received error from server while processing reply, %s", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendMessageSync:(int)a1 arguments:(xpc_object_t)xdict xpcArguments:(NSObject *)a3 .cold.1(int a1, xpc_object_t xdict, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  v8 = 495;
  v9 = v4;
  v10 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, "AVConferenceXPCClient [%s] %s:%d XPC Client: received error from server while processing reply, %s", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendMessageSync:arguments:xpcArguments:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  LODWORD(v5) = 485;
  OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Sending sync message to server for service: %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerBlockForService:block:queue:eventLogLevel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  LODWORD(v5) = 533;
  OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Adding registered block for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterFromService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  LODWORD(v5) = 563;
  OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCClient [%s] %s:%d XPC Client: Removing registered block for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
