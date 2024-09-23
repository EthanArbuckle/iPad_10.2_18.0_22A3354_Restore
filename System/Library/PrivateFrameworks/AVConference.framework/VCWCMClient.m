@implementation VCWCMClient

- (VCWCMClient)init
{
  VCWCMClient *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCWCMClient;
  v2 = -[VCWCMClient init](&v5, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCWCMClient.connectionQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCWCMClient stopWCMClient](self, "stopWCMClient");
  dispatch_release((dispatch_object_t)self->connectionQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCWCMClient;
  -[VCWCMClient dealloc](&v3, sel_dealloc);
}

- (void)startWCMClient
{
  NSObject *connectionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__VCWCMClient_startWCMClient__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(connectionQueue, v3);
}

void __29__VCWCMClient_startWCMClient__block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  uint64_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  xpc_object_t v18[2];
  char *v19[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_xpc_connection_s **)(v3 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__VCWCMClient_startWCMClient__block_invoke_2;
    handler[3] = &unk_1E9E561E0;
    handler[4] = v3;
    xpc_connection_set_event_handler(v4, handler);
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
    keys[0] = "kWCMRegisterProcess_ProcessId";
    v5 = xpc_uint64_create(2uLL);
    values = v5;
    v6 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    *(_OWORD *)v19 = xmmword_1E9E58D90;
    v7 = xpc_uint64_create(1uLL);
    v18[0] = v7;
    v18[1] = v6;
    v8 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v8);
    xpc_release(v5);
    xpc_release(v7);
    xpc_release(v6);
    xpc_release(v8);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCWCMClient startWCMClient]_block_invoke";
        v16 = 1024;
        v17 = 153;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WCM: WCMClient started.", buf, 0x1Cu);
      }
    }
  }
}

void __29__VCWCMClient_startWCMClient__block_invoke_2(uint64_t a1, void *a2)
{
  HandleWCMEvent(a2, *(void **)(a1 + 32));
}

- (void)stopWCMClient
{
  NSObject *connectionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  connectionQueue = self->connectionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__VCWCMClient_stopWCMClient__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(connectionQueue, v3);
}

void __28__VCWCMClient_stopWCMClient__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCWCMClient stopWCMClient]_block_invoke";
        v9 = 1024;
        v10 = 165;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WCM: WCMClient stopped.", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->connectionQueue;
}

- (WCMClientDelegate)wcmClientDelegate
{
  return self->wcmClientDelegate;
}

- (void)setWcmClientDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
